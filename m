Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GxZaS-0001CS-5k
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 20:52:44 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JAN00FVBJUP4C@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 22 Dec 2006 10:52:01 +0900 (KST)
Received: from ep_spt03 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JAN0082ZJUP1A@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 22 Dec 2006 10:52:01 +0900 (KST)
Content-return: prohibited
Date: Fri, 22 Dec 2006 01:52:01 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: Update OOB free table
To: Artem Bityutskiy <dedekind@infradead.org>
Message-id: <31196440.367141166752320332.JavaMail.weblogic@ep_ml29>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: base64
Cc: Vitaly Wool <vwool@ru.mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Timo Teras <timo.teras@solidboot.com>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGksDQoNCj4gPiBPbiBNb24sIDIwMDYtMTItMTggYXQgMDQ6MjQgKzAwMDAsIEt5dW5nbWluIFBh
cmsgd3JvdGU6DQo+ID4gPiBIb3cgYWJvdXQgdGhlIHRoaXMgcGF0Y2g/DQo+ID4gPiBJdCBza2lw
cyB0aGUgZWNjIHBvc2l0aW9uIHdoaWNoIGlzIGRlZmluZWQgaW4gZWNjIGxheW91dCBpbiBtdGQg
ZHJpdmVycy4NCj4gPiANCj4gPiBIZXJlIGlzIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIHByb2Js
ZW0uDQo+ID4gDQo+ID4gTm93YWRheXMgTVREIHN1cHBvcnRzIG5pY2VyIGludGVyZmFjZSB0byB3
b3JrIHdpdGggT09CLiBUaGlzIGlzIHRoZQ0KPiA+IE1URF9PT0JfQVVUTyBjb21tYW5kLiBDdXJy
ZW50bHkgSkZGUzIgdXNlcyBvbGQgTVREX09PQl9QTEFDRSBjb21tYW5kLg0KPiA+IA0KPiA+IFRo
ZSBpZGVhIGJlaGluZCB0aGUgTVREX09PQl9BVVRPIGNvbW1hbmQgaXMgdGhhdCB1c2VyIHByb3Zp
ZGVzIGJ1ZmZlcg0KPiA+IHdpdGggaGlzIGRhdGEsIGFuZCBNVEQgdGFrZXMgY2FyZSBhYm91dCBo
b3cgdG8gcHV0IGl0IHRvIHRoZSBPT0IgYXJlYSwNCj4gPiBNVEQga25vd3Mgd2hpY2ggT09CIGJ5
dGVzIG1heSBiZSB1c2VkLiBTaW1pbGFyIGZvciByZWFkaW5nIE9PQiAtIE1URA0KPiA+IGF1dG9t
YXRpY2FsbHkgcmVhZHMgZGF0YSBieXRlcywgc2tpcHMgRUNDLCBhbmQgcmV0dXJucyB0aGUgZGF0
YS4NCj4gPiANCj4gPiBTbyB3aGF0IHdlIHNob3VsZCBkbyBpcyB0byB0ZWFjaCBKRkZTMiB1c2lu
ZyBNVERfT09CX0FVVE8gaW5zdGVhZCBvZg0KPiA+IE1URF9PT0JfUExBQ0UuDQo+DQo+IEkgbWF5
IHRyeSB0byBkbyB0aGlzLCBidXQgb25seSBpbiAyMDA3LiBWaXRhbHkgc2FpZCBoZSBtYXkgYWxz
byB0cnkgdG8NCj4gZG8gdGhpcyBsYXRlci4NCj4gDQo+IEFsc28sIGR3bXcyIGlzIGNvbmNlcm5l
ZCBhYm91dCBjb21wYXRpYmlsaXR5LCBzbyB3ZSBzaG91bGQgZXhwbG9yZSB0aGlzDQo+IHRvby4N
Cg0KT2theSwgSSB1bmRlcnN0YW5kIHRoZSBNVERfT09CX0FVVE8gY29uY2VwdC4gYnV0IG5vdyBK
RkZTMiBvbmx5IHVzZSB0aGUgTVREX09PQl9QTEFDRS4gDQpzbyBKRkZTMiBza2lwIHRoZSBlY2Mg
cG9zaXRpb24gZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuDQoNCj4NCj4gS3l1bmdtaW4sIG1h
eSB5b3UgbWFrZSBzdXJlIE9uZU5BTkQgaXMgT0sgV1JUIE1URF9PT0JfQVVUTz8NCj4NCg0KTm93
IE9uZU5BTkQgZG9uJ3Qgc3VwcG9ydCBNVERfT09CX0FVVE8sIGJ1dCBpZiB0aGUgamZmczIgc3Vw
cG9ydHMgdGhlIHRoaXMgb25lLiBJIHdpbGwgc3VwcG9ydCBpdC4NCkkgdGhpbmsgaXQncyBtb3Jl
IHJlYXNvbmFibGUgdG8gaGFuZGxlIG9vYiBpbiBkcml2ZXIgbGV2ZWwgaW5zdGVhZCBvZiBmaWxl
c3lzdGVtLg0KDQo+IEFsc28gS3l1bmdtaW4sIGluIHlvdSBkcml2ZXIgSSBzZWUgdG91Y2hfc29m
dGxvY2t1cF93YXRjaGRvZygpIGNhbGxzLiBJDQo+IGJlbGlldmUgdGhleSBzaG91bGQgbm90IGJl
IHRoZXJlLiBZb3UgbXVzdCBiZSBoaWQgYSBwcm9ibGVtIHdpdGggdGhpcw0KPiBpbnN0ZWFkIG9m
IGZpeGluZyBpdC4gUGxlYXNlLCBsb29rIGF0IHRoYXQgc3R1ZmYuDQoNCkFjdHVhbGx5LCBJJ20g
bm90IHN1cmUgd2hlcmUncyB0aGUgcmlnaHQgcGxhY2UuIEJ1dCBpZiB3ZSBkb24ndCB0b3VjaCB0
aGUgd2F0Y2hkb25nLg0KaXQgd2lsbCBzb2Z0IGxvY2t1cCB3aGVuIG1vdW50aW5nIHRoZSBKRkZT
MiB3aXRoIGJpZyBwYXJ0aXRpb24uIChJIGp1c3QgYm9ycm93ZWQgaXQgZnJvbSBuYW5kLikNCg0K
PiANCj4gS3l1bmdtaW4sIGRvIHlvdSBoYXZlIHlvdXIgb3duIE9uZU5BTkQgZ2l0IHRyZWU/IElm
IHllcywgd2hhdCdzIHRoZSBVUkw/DQo+IEhvdyBhYm91dCBwdXR0aW5nIGl0IG9uIGluZnJhZGVh
ZC5vcmcsIGp1c3QgbGlrZSB3ZSBoYXZlIG91ciBVQkkgZ2l0DQo+IHRoZXJlPw0KDQpObywgSSB1
c2VkIGl0IGluIGluZnJhZGVhZC5vcmcuIGJ1dCBJIGp1c3QgdXNlZCBmb3IgY29tbWl0Lg0KDQpo
dHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvP3A9dXNlcnMva21wYXJrL29uZW5hbmQtbXRkLTIuNi5n
aXQ7YT1zdW1tYXJ5DQoNClRvZGF5LCBJIHdpbGwgY29tbWl0IHRoZSBvbmVuYW5kIHBhdGNoZXMg
Zm9yIHRlc3QuDQoNClRoYW5rIHlvdSwNCkt5dW5nbWluIFBhcmsNCg0KDQoNCg==
