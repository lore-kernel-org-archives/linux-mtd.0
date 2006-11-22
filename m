Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmxBR-0004Mo-60
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 13:51:02 -0500
Received: by ug-out-1314.google.com with SMTP id m2so235625uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Nov 2006 10:50:53 -0800 (PST)
Message-ID: <d33135570611221050n52c0adb3lf1bedeac309cea10@mail.gmail.com>
Date: Wed, 22 Nov 2006 10:50:53 -0800
From: "Dragan Marinkovic" <marinkovic.dragan@gmail.com>
To: dedekind@infradead.org
Subject: Re: jffs2_truncate_fragtree does not handle NULL return from
	jffs2_lookup_node_frag
In-Reply-To: <1164214517.19298.27.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: base64
Content-Disposition: inline
References: <d33135570611212335p76f32b82k13c3a8a0671d4e24@mail.gmail.com>
	<1164212824.19298.21.camel@sauron>
	<d33135570611220849o7775a594o151d02583df9c1e5@mail.gmail.com>
	<1164214517.19298.27.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gMTEvMjIvMDYsIEFydGVtIEJpdHl1dHNraXkgPGRlZGVraW5kQGluZnJhZGVhZC5vcmc+IHdy
b3RlOgo+IE9uIFdlZCwgMjAwNi0xMS0yMiBhdCAwODo0OSAtMDgwMCwgRHJhZ2FuIE1hcmlua292
aWMgd3JvdGU6Cj4gPiBUaGFua3MgQXJ0ZW0sIEknbGwgdGFrZSBhIGxvb2suCj4gPgo+ID4gIkpG
RlMyIHBhcnRpdGlvbiBpcyBiZWluZyB1cGRhdGVkIiBtZWFucyB0aGF0IHRoZSBmaWxlIGhhcyBi
ZWVuCj4gPiB3cml0dGVuIHRvIGF0IHRoZSBtb21lbnQgb2YgdGhlIHBvd2VyIGxvc3MuIFdoYXQn
cyBpbnRlcmVzdGluZyBpcyB0aGF0Cj4gPiBpZiBJJ20gd3JpdGluZyAxTUIgZmlsZSB0byB0aGUg
SkZGUzIgcGFydGl0aW9uICh3aGljaCBnaXZlcyBtZSBlbm91Z2gKPiA+IHRpbWUgdG8gcmVsaWFi
bHkgcHVsbCB0aGUgcGx1ZyBkdXJpbmcgd3JpdGUgb3BlcmF0aW9uKSB0aGUgcG93ZXIgbG9zcwo+
ID4gaXMgYWx3YXlzIGhhbmRsZWQgcHJvcGVybHk6IHRoZSBvbGQgdmVyc2lvbiBvZiB0aGUgZmls
ZSBpcyBhbHdheXMKPiA+IHRoZXJlIHdoZW4gdGhlIHBvd2VyIGlzIGJhY2sgb24uCj4gPgo+ID4g
VG8gYmUgbW9yZSBwcmVjaXNlLCBJIGhhdmUgdHJvdWJsZSB3aXRoIHRoZSBmaWxlIHNpemUgb2Yg
YWJvdXQgMTFLCj4gPiAodGhpcyByZWFsbHkgaXNuJ3QgYW55IG1hZ2ljIG51bWJlciwgYmFzaWNh
bGx5IHNtYWxsZXIgZmlsZXMpLiBJIGhhdmUKPiA+IC90bXAgZGlyLiBvbiB0bXBmcyAuIEknbSBt
b3ZpbmcgdGhlIGZpbGUgdGhlcmUsIGRvaW5nIHNvbWUKPiA+IG1hbmlwdWxhdGlvbiBvbiBpdCAo
c2VkLCBjYXQsIGV0Yy4pIGFuZCBjb3B5IHRoZSBmaWxlIGJhY2sgdG8gaXRzCj4gPiBvcmlnaW5h
bCBsb2NhdGlvbiAoSkZGUzIgZnMpLiBJZiBJIGV4cGVyaWVuY2UgdGhlIHBvd2VyIGxvc3MgYXQg
dGhlCj4gPiBtb21lbnQgb2YgdGhlIGZpbGUgY29weSBvcGVyYXRpb24sIHRoZSBmaWxlIGp1c3Qg
dmFuaXNoZXMuIFRoZSBzYW1lIGlzCj4gPiB0cnVlIGlmIHRoZSBmaWxlIGlzIG1hbmlwdWxhdGVk
IGRpcmVjdGx5IG9uIHRoZSBKRkZTMiBwYXJ0aXRpb24uIEkndmUKPiA+IHRyaWVkICdtdicsICdj
YXQnIGFuZCAnY3AnIC0tIGFsbCB3aXRoIHRoZSBzYW1lIHJlc3VsdC4KPiA+Cj4gPiBUaGUgZXJh
c2UgYmxvY2sgc2l6ZSBvbiB0aGUgSkZGUzIgcGFydGl0aW9uIGlzIHNldCB0byAxMjhLICgxMzEw
NzIKPiA+IGJ5dGVzKSAuIEkgY2FuIHBvc3QgVVNCIHN0aWNrIGFuZCBrZXJuZWwgY29uZmlnIHNw
ZWNpZmljIGRldGFpbHMgaWYKPiA+IG5lZWRlZC4KPgo+IFVTQiBzdGljaz8gSG93IGRvIHlvdSB1
c2UgSkZGUzIgb24gVVNCIHN0aWNrPyBEbyB5b3UgdXNlIGJsb2NrMm10ZD8KPgo+IC0tCj4gQmVz
dCByZWdhcmRzLAo+IEFydGVtIEJpdHl1dHNraXkgKOLJ1MDDy8nKIOHS1KPNKQo+Cj4KClRoYXQg
aXMgY29ycmVjdCAtLSBJJ20gdXNpbmcgYmxvY2sybXRkIC4KCkNoZWVycywKRHJhZ2FuCg==
