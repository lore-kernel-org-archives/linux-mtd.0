Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P6FCi-0000gO-OG
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2010 04:14:10 +0000
Received: from mail60-am1 (localhost.localdomain [127.0.0.1])	by
	mail60-am1-R.bigfish.com (Postfix) with ESMTP id 835231038427	for
	<linux-mtd@lists.infradead.org>; Thu, 14 Oct 2010 04:14:04 +0000 (UTC)
Received: from am1ehsmhs006.bigfish.com (unknown [10.3.201.252])	by
	mail60-am1.bigfish.com (Postfix) with ESMTP id 089D8E7005C	for
	<linux-mtd@lists.infradead.org>; Thu, 14 Oct 2010 04:14:04 +0000 (UTC)
Received: from az33smr02.freescale.net (az33smr02.freescale.net
	[10.64.34.200])	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP
	id o9E4Dx8O015841	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Oct 2010 21:13:59 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP
	id o9E4Dveg011026	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Oct 2010 23:13:58 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH 2/3 v4] P4080/mtd: Only make elbc nand driver detect nand
	flash partitions
Date: Thu, 14 Oct 2010 12:14:12 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A2B02EF@zch01exm23.fsl.freescale.net>
In-Reply-To: <20100920131907.GA2184@oksana.dev.rtsoft.ru>
References: <1284706869-12555-1-git-send-email-tie-fei.zang@freescale.com>
	<1284706869-12555-2-git-send-email-tie-fei.zang@freescale.com>
	<20100920131907.GA2184@oksana.dev.rtsoft.ru>
From: Zang Roy-R61911 <r61911@freescale.com>
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gVm9yb250c292
IFttYWlsdG86Y2JvdWF0bWFpbHJ1QGdtYWlsLmNvbV0NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1i
ZXIgMjAsIDIwMTAgMjE6MTkgUE0NCj4gVG86IFphbmcgUm95LVI2MTkxMQ0KPiBDYzogbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGR3bXcyQGluZnJhZGVhZC5vcmc7IGRlZGVraW5kMUBn
bWFpbC5jb207DQo+IGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc7IExhbiBDaHVuaGUtQjI1ODA2
OyBXb29kIFNjb3R0LUIwNzQyMTsgR2FsYSBLdW1hci0NCj4gQjExNzgwOyBsaW51eHBwYy1kZXZA
b3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMyB2NF0gUDQwODAvbXRkOiBPbmx5
IG1ha2UgZWxiYyBuYW5kIGRyaXZlciBkZXRlY3QgbmFuZA0KPiBmbGFzaCBwYXJ0aXRpb25zDQo+
IA0KPiBPbiBGcmksIFNlcCAxNywgMjAxMCBhdCAwMzowMTowOFBNICswODAwLCBSb3kgWmFuZyB3
cm90ZToNCj4gWy4uLl0NCj4gPiArc3RhdGljIHN0cnVjdCBtdXRleCBmc2xfZWxiY19uYW5kX211
dGV4Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBfX2RldmluaXQgZnNsX2VsYmNfbmFuZF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBmc2xf
bGJjX3JlZ3MgX19pb21lbSAqbGJjID0gY3RybC0+cmVnczsNCj4gPiArCXN0cnVjdCBmc2xfbGJj
X3JlZ3MgX19pb21lbSAqbGJjOw0KPiA+ICAJc3RydWN0IGZzbF9lbGJjX210ZCAqcHJpdjsNCj4g
PiAgCXN0cnVjdCByZXNvdXJjZSByZXM7DQo+ID4gKwlzdHJ1Y3QgZnNsX2VsYmNfZmNtX2N0cmwg
KmVsYmNfZmNtX2N0cmwgPSBOVUxMOw0KPiANCj4gTm8gbmVlZCBmb3IgPSBOVUxMLg0KPiANCj4g
Wy4uLl0NCj4gPiAtCWN0cmwtPmNoaXBzW2JhbmtdID0gcHJpdjsNCj4gPiArCW11dGV4X2luaXQo
JmZzbF9lbGJjX25hbmRfbXV0ZXgpOw0KPiANCj4gVGhpcyBtYXkgY2F1c2UgYWxsIHNvcnRzIG9m
IG1pc2JlaGF2aW91cnMsIGUuZy4NCj4gDQo+IEE6IG11dGV4X2luaXQoZm9vKQ0KPiBBOiBtdXRl
eF9sb2NrKGZvbykNCj4gQjogbXV0ZXhfaW5pdChmb28pICAgPC0gZGVzdHJveWVkICJBIi1jb250
ZXh0IG11dGV4Lg0KPiBBOiBtdXRleF91bmxvY2soZm9vKSA8LSBvb3BzDQo+IA0KPiBJbnN0ZWFk
IG9mIGR5bmFtaWNhbGx5IGluaXRpYWxpemluZyB0aGUgbXV0ZXgsIGp1c3QgZGVmaW5lIGl0DQo+
IHdpdGggREVGSU5FX01VVEVYKCkgYWJvdmUuDQo+IA0KPiAoQnR3LCAjaW5jbHVkZSA8bGludXgv
bXV0ZXguaD4gaXMgbmVlZGVkLikNCj4gDQo+ID4gKw0KPiA+ICsJbXV0ZXhfbG9jaygmZnNsX2Vs
YmNfbmFuZF9tdXRleCk7DQo+IFsuLi5dDQo+ID4gLXN0YXRpYyBpbnQgX19kZXZpbml0IGZzbF9l
bGJjX2N0cmxfaW5pdChzdHJ1Y3QgZnNsX2VsYmNfY3RybCAqY3RybCkNCj4gPiArc3RhdGljIGlu
dCBmc2xfZWxiY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+IFsu
Li5dDQo+ID4gKwlzdHJ1Y3QgZnNsX2VsYmNfZmNtX2N0cmwgKmVsYmNfZmNtX2N0cmwgPSBmc2xf
bGJjX2N0cmxfZGV2LT5uYW5kOw0KPiBbLi4uXQ0KPiA+ICsJCWlmIChlbGJjX2ZjbV9jdHJsLT5j
aGlwc1tpXSkNCj4gPiArCQkJZnNsX2VsYmNfY2hpcF9yZW1vdmUoZWxiY19mY21fY3RybC0+Y2hp
cHNbaV0pOw0KPiBbLi4uXQ0KPiA+ICsJZnNsX2xiY19jdHJsX2Rldi0+bmFuZCA9IE5VTEw7DQo+
ID4gKwlrZnJlZShlbGJjX2ZjbV9jdHJsKTsNCj4gDQo+IFdpbGwgY2F1c2UgTlVMTCBkZXJlZmVy
ZW5jZSBhbmQvb3IgdXNlLWFmdGVyLWZyZWUgZm9yIG90aGVyDQo+IGVsYmMgbmFuZCBpbnN0YW5j
ZXMuIFRvIGF2b2lkIHRoYXQsIHJlZmVyZW5jZSBjb3VudGluZyBmb3INCj4gZWxiY19mY21fY3Ry
bCBpcyByZXF1aXJlZC4NCk1ha2Ugc2Vuc2UuDQp3aWxsIHVwZGF0ZS4NClJveQ0K
