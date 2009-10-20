Received: from exprod6og116.obsmtp.com ([64.18.1.37])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0NCN-00019f-Gd
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 22:29:04 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
Date: Tue, 20 Oct 2009 18:28:59 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E248E7@mi8nycmail19.Mi8.com>
In-Reply-To: <1256074658.4230.6.camel@macbook.infradead.org>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
	<20091021.002941.41633716.anemo@mba.ocn.ne.jp>
	<BD79186B4FD85F4B8E60E381CAEE190901E24827@mi8nycmail19.Mi8.com>
	<1256074658.4230.6.camel@macbook.infradead.org>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gVHVlc2RheSwgT2N0b2JlciAyMCwgMjAwOSAyOjM4IFBNLCBEYXZpZCBXb29kaG91c2Ugd3Jv
dGU6DQo+IE9uIFR1ZSwgMjAwOS0xMC0yMCBhdCAxMjoyMyAtMDQwMCwgSCBIYXJ0bGV5IFN3ZWV0
ZW4gd3JvdGU6DQo+PiBEdXJpbmcgdGhlIHByb2JlIGZvciBwaHlzbWFwIHBsYXRmb3JtIGZsYXNo
IGRldmljZXMgdGhlcmUgYXJlIGENCj4+IG51bWJlciBlcnJvciBleGl0IGNvbmRpdGlvbnMgdGhh
dCBhbGwgZG8gYSBnb3RvIGVycl9vdXQgd2hpY2gNCj4+IHRoZW4gY2FsbHMgcGh5c21hcF9mbGFz
aF9yZW1vdmUoKS4gIEluIHRoYXQgZnVuY3Rpb24gb25lIG9mIHRoZQ0KPj4gY2xlYW51cCBzdGVw
cyBpczoNCj4+IA0KPj4gI2lmZGVmIENPTkZJR19NVERfQ09OQ0FUDQo+PiAJaWYgKGluZm8tPmNt
dGQgIT0gaW5mby0+bXRkWzBdKQ0KPj4gCQltdGRfY29uY2F0X2Rlc3Ryb3koaW5mby0+Y210ZCk7
DQo+PiAjZW5kaWYNCj4+IA0KPj4gVGhpcyB0ZXN0IHdpbGwgc3VjY2VlZCBzaW5jZSBpbmZvLT5j
bXRkID09IE5VTEwgYW5kIGluZm8tPm10ZFswXSBpcw0KPj4gdmFsaWQsIHdoaWNoIHRoZW4gY2F1
c2VzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gbXRkX2NvbmNhdF9kZXN0cm95KCkN
Cj4+IGlzIGNhbGxlZC4gIEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgbXRkX2NvbmNhdF9kZXN0cm95
KCkgc3RlcCBpbnRvIHRoZQ0KPj4gaWYgKGluZm8tPmNtdGQpIGNvbmRpdGlvbi4NCj4+IA0KPj4g
QWxzbywgbW92ZSB0aGUga2ZyZWUoaW5mby0+cGFydHMpIGNsZWFudXAgdG8gcmVtb3ZlIGFuICNp
ZmRlZi4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogSCBIYXJ0bGV5IFN3ZWV0ZW4gPGhzd2VldGVu
QHZpc2lvbmVuZ3JhdmVycy5jb20+DQo+PiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZy
YWRlYWQub3JnPg0KPj4gQ2M6IEF0c3VzaGkgTmVtb3RvIDxhbmVtb0BtYmEub2NuLm5lLmpwPg0K
Pj4gDQo+PiAtLS0NCj4+IA0KPj4gVjIgLSBBcyBwb2ludGVkIG91dCBieSBBdHN1c2hpIE5lbW90
bywgdGhlIG1hcF9kZXN0cm95IGxvb3Agc2hvdWxkIG5vdA0KPj4gICAgICBiZSBza2lwcGVkIGV2
ZW4gd2hlbiBpbmZvLT5jbXRkID09IE5VTEwuDQo+DQo+IFRoYW5rcy4NCj4NCj4gSW4gYW4gYXR0
ZW1wdCB0byBpbXByb3ZlIG15IHJlc3BvbnNpdmVuZXNzIGFzIG1haW50YWluZXIsIEknZCBhbHJl
YWR5DQo+IGNvbW1pdHRlZCB0aGUgZmlyc3QgdmVyc2lvbi4gSG93IGRvZXMgdGhpcyBsb29rOg0K
DQpWZXJ5IHJlc3BvbnNpdmUgaW5kZWVkLiAgOy0pDQoNClNvcnJ5IGFib3V0IGludHJvZHVjaW5n
IHRoZSBidWcuICBZb3VyIGFtZW5kZWQgcGF0Y2ggbG9va3MgbGlrZSBpdCBzZXJ2ZXMNCnRoZSBz
YW1lIHB1cnBvc2UgYXMgbXkgdXBkYXRlZCBvbmUuICBUaGFua3MgZm9yIGZpeGluZyB0aGF0Lg0K
DQpSZWdhcmRzLA0KSGFydGxleQ0KDQo=
