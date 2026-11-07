from pathlib import Path
p=Path('/mnt/data/rr_v47/red-riot-racing/assets/app.js')
s=p.read_text()
start=s.index('function updateCards(updates)')
end=s.index('\nfunction home(',start)
new='''function formattedUpdateDate(raw){
  const value=String(raw||'').trim();
  const match=value.match(/^(\\d{4})-(\\d{2})(?:-(\\d{2}))?/);
  if(match){
    const year=match[1],month=Number(match[2]);
    if(month>=1&&month<=12){
      const monthLabel=new Intl.DateTimeFormat('en-US',{month:'short',timeZone:'UTC'}).format(new Date(Date.UTC(Number(year),month-1,1))).toUpperCase();
      return {month:monthLabel,firstTwo:year.slice(0,2),lastTwo:year.slice(2),iso:value.slice(0,10),label:`${monthLabel} ${year}`};
    }
  }
  const parsed=new Date(value);
  if(!Number.isNaN(parsed.getTime())){
    const year=String(parsed.getUTCFullYear());
    const monthLabel=new Intl.DateTimeFormat('en-US',{month:'short',timeZone:'UTC'}).format(parsed).toUpperCase();
    return {month:monthLabel,firstTwo:year.slice(0,-2),lastTwo:year.slice(-2),iso:parsed.toISOString().slice(0,10),label:`${monthLabel} ${year}`};
  }
  return {month:'UPDATE',firstTwo:'',lastTwo:'',iso:'',label:value||'Update'};
}
function updateCards(updates){
  const list=(Array.isArray(updates)?updates:[]).slice().sort((a,b)=>String(b.date||'').localeCompare(String(a.date||'')));
  if(!list.length)return `<div class="update-item update-item-empty"><div class="update-copy"><h3>THE NEXT CHAPTER STARTS <span class="punctuation-unit">HERE<span class="red">.</span></span></h3><p>Confirmed team milestones, original build photos and official updates will appear as the program develops.</p></div></div>`;
  return list.map(u=>{
    const d=formattedUpdateDate(u.date);
    const title=String(u.title||'TEAM UPDATE').trim();
    const cleanTitle=title.replace(/[.\\s]+$/,'');
    const image=srcURL(u.image);
    return `<article class="update-item"><div class="update-date"><time ${d.iso?`datetime="${escapeHTML(d.iso)}"`:''} aria-label="${escapeHTML(d.label)}"><span class="update-month">${escapeHTML(d.month)}</span><span class="update-year">${escapeHTML(d.firstTwo)}<span class="update-year-accent">${escapeHTML(d.lastTwo)}</span></span></time></div><div class="update-copy"><h3>${escapeHTML(cleanTitle)}<span class="update-title-period" aria-hidden="true">.</span></h3><p>${escapeHTML(u.summary||'')}</p>${image?`<img class="update-photo" src="${escapeHTML(image)}" alt="${escapeHTML(title)}" loading="lazy">`:''}</div></article>`;
  }).join('');
}
'''
s=s[:start]+new+s[end:]
p.write_text(s)
css=Path('/mnt/data/rr_v47/red-riot-racing/assets/editorial.css')
css.write_text(css.read_text()+'''\n\n/* V4.7 — Approved editorial announcement layout. Scoped to Updates journal only. */
.updates-grid{display:flex!important;flex-direction:column;gap:0!important;margin-top:clamp(20px,3vw,44px)}
.updates-grid .update-item{display:grid!important;grid-template-columns:clamp(150px,22%,245px) minmax(0,1fr);align-items:stretch;gap:0;min-height:0!important;padding:clamp(28px,4.5vw,58px) 0!important;border:0!important;border-top:1px solid #454950!important;border-radius:0!important;background:transparent!important;color:#f0f1f2!important}
.updates-grid .update-item:last-child{border-bottom:1px solid #454950!important}
.updates-grid .update-date{padding:4px clamp(18px,3vw,42px) 4px 0;min-width:0;display:flex;align-items:center;justify-content:flex-start}
.updates-grid .update-date time{display:flex;flex-direction:column;align-items:flex-start;gap:clamp(3px,.5vw,8px);color:#f0f1f2;letter-spacing:normal;font:inherit}
.updates-grid .update-month{font:500 clamp(15px,1.55vw,23px)/1.1 'Chakra Petch',sans-serif;letter-spacing:.10em;color:#d4d9de;text-transform:uppercase}
.updates-grid .update-year{font:500 clamp(62px,7vw,105px)/.88 'Oxanium','Chakra Petch',sans-serif;letter-spacing:-.09em;color:#f0f1f2;white-space:nowrap;font-variant-numeric:tabular-nums}
.updates-grid .update-year-accent{color:#e32636}
.updates-grid .update-copy{min-width:0;border-left:2px solid #f0f1f2;padding:8px 0 8px clamp(24px,4.2vw,65px);display:flex;flex-direction:column;justify-content:center}
.updates-grid .update-copy h3{font:400 clamp(35px,5.4vw,77px)/1.05 'Barlow Condensed','Oxanium',sans-serif;letter-spacing:-.025em;text-transform:none;color:#f0f1f2;overflow-wrap:break-word;margin:0 0 clamp(12px,1.6vw,20px)}
.updates-grid .update-title-period{color:#e32636;margin-left:.07em;white-space:nowrap}
.updates-grid .update-copy p{font:400 clamp(14px,1.5vw,19px)/1.65 'Chakra Petch',sans-serif;color:#b4bac3!important;max-width:750px;margin:0}
.updates-grid .update-photo{display:block;width:min(100%,720px);height:auto;max-height:500px;object-fit:contain;object-position:left center;margin-top:clamp(20px,2.5vw,32px)}
.updates-grid .update-item-empty{grid-template-columns:1fr}
.updates-grid .update-item-empty .update-copy{border-left:0;padding-left:0}
@media(max-width:720px){
 .updates-grid .update-item{grid-template-columns:1fr;padding:30px 0!important}
 .updates-grid .update-date{padding:0 0 18px;align-items:flex-start}
 .updates-grid .update-date time{flex-direction:row;align-items:baseline;gap:13px}
 .updates-grid .update-month{font-size:17px}
 .updates-grid .update-year{font-size:clamp(49px,12.5vw,78px)}
 .updates-grid .update-copy{padding:20px 0 4px 23px;border-left:2px solid #f0f1f2}
 .updates-grid .update-copy h3{font-size:clamp(37px,9vw,65px)}
}
''')
