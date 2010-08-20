Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OmKJo-0001kv-SQ
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 05:39:09 +0000
Received: from mail57-tx2 (localhost.localdomain [127.0.0.1])	by
	mail57-tx2-R.bigfish.com (Postfix) with ESMTP id A3FA716683FD	for
	<linux-mtd@lists.infradead.org>; Fri, 20 Aug 2010 05:39:06 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.247])	by
	mail57-tx2.bigfish.com (Postfix) with ESMTP id 104E1758051	for
	<linux-mtd@lists.infradead.org>; Fri, 20 Aug 2010 05:39:06 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o7K5cm7f002523	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2010 22:38:53 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o7K5oZkY014998	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Aug 2010 00:50:36 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Class: urn:content-classes:message
Subject: RE: Bad assumption about ID field definition for Samsung NAND?
Date: Fri, 20 Aug 2010 13:38:37 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A07CB62@zch01exm23.fsl.freescale.net>
In-Reply-To: <AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
References: <20100818180538.GA12238@code-monkey.de><4C6C6BFC.9020408@broadcom.com><20100819171558.GA8536@code-monkey.de><AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com><4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
From: Liu Hui-R64343 <r64343@freescale.com>
To: "Kevin Cernekee" <cernekee@gmail.com>, "Brian Norris" <norris@broadcom.com>
Cc: Tilman Sauerbeck <tilman@code-monkey.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGludXgtbXRkLWJvdW5j
ZXNAbGlzdHMuaW5mcmFkZWFkLm9yZyBbbWFpbHRvOmxpbnV4LW10ZC0NCj4gYm91bmNlc0BsaXN0
cy5pbmZyYWRlYWQub3JnXSBPbiBCZWhhbGYgT2YgS2V2aW4gQ2VybmVrZWUNCj4gU2VudDogRnJp
ZGF5LCBBdWd1c3QgMjAsIDIwMTAgMTE6MzAgQU0NCj4gVG86IEJyaWFuIE5vcnJpcw0KPiBDYzog
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IFRpbG1hbiBTYXVlcmJlY2sNCj4gU3ViamVj
dDogUmU6IEJhZCBhc3N1bXB0aW9uIGFib3V0IElEIGZpZWxkIGRlZmluaXRpb24gZm9yIFNhbXN1
bmcgTkFORD8NCj4gDQo+IE9uIFRodSwgQXVnIDE5LCAyMDEwIGF0IDM6MjggUE0sIEJyaWFuIE5v
cnJpcyA8bm9ycmlzQGJyb2FkY29tLmNvbT4gd3JvdGU6DQo+ID4gT24gMDgvMTkvMjAxMCAxMjo0
NiBQTSwgS2V2aW4gQ2VybmVrZWUgd3JvdGU6DQo+ID4+IFRoZSBjb2RlIGlzIHJpZ2h0OyB0aGUg
Y29tbWVudCBpcyB3cm9uZy4NCj4gPg0KPiA+IEluIHRoYXQgY2FzZSwgc2hvdWxkIHdlIGZpeCB0
aGUgY29tbWVudCBhbmQgYWRkIHRoZSBjaGVjayB0aGF0IFRpbG1hbg0KPiA+IG1lbnRpb25lZCBw
cmV2aW91c2x5PyAoYmVsb3cpDQo+IA0KPiBUbyBjbGFyaWZ5IC0gdGhlIGNvbW1lbnQgaW4gdGhl
IGNvZGUgaXMgY29ycmVjdCwgYnV0IHRoZSBjaGVja2luIGNvbW1lbnQNCj4gd2FzIGluYWNjdXJh
dGUuDQo+IA0KPiA+PiBAQCAtMjg1Miw2ICsyODUyLDcgQEAgc3RhdGljIHN0cnVjdCBuYW5kX2Zs
YXNoX2Rldg0KPiA+PiAqbmFuZF9nZXRfZmxhc2hfdHlwZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwN
Cj4gPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLw0KPiA+PiDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpZiAoaWRfZGF0YVswXSA9PSBpZF9kYXRhWzZdICYmIGlkX2RhdGFbMV0gPT0NCj4g
Pj4gaWRfZGF0YVs3XSAmJg0KPiA+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZF9kYXRhWzBdID09IE5BTkRfTUZSX1NBTVNVTkcgJiYNCj4gPj4gKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoY2hpcC0+Y2VsbGlu
Zm8gJg0KPiA+PiArIE5BTkRfQ0lfQ0VMTFRZUEVfTVNLKSAmJg0KPiA+PiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZF9kYXRhWzVdICE9IDB4MDApIHsN
Cj4gPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogQ2FsYyBwYWdlc2l6
ZSAqLw0KPiA+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtdGQtPndyaXRl
c2l6ZSA9IDIwNDggPDwgKGV4dGlkICYgMHgwMyk7DQo+IA0KPiBUaGlzIGxvb2tzIE9LIChhdCBs
ZWFzdCBmb3IgSzlHQUcwOFUwRCkuDQoNClRoZSB0ZW1wIGZpeCBpcyBub3QgdGhlIGdvb2Qgc29s
dXRpb24uIFdlIGNhbiBtYWtlIGEgZml4IGZvciBTYW1zdW5nIGhlcmUsIHdoYXQgYWJvdXQgb3Ro
ZXIgdmVuZG9ycz8NCklmIHdlIHB1dCBzdWNoIGtpbmQgb2YgZml4IGludG8gbmFuZF9iYXNlLmMg
ZmlsZSwgd2hpY2ggd2lsbCBtYWtlIHRoZSBjb2RlIHVnbHkuIA0KDQo+IA0KPiBJIHdvbmRlciBp
ZiBTYW1zdW5nIGNvdWxkIHByb3ZpZGUgc29tZSBmaXJtIGd1aWRlbGluZXMgZm9yIHdoZW4gdG8g
dXNlDQo+IHRoZSBvbGQgc3R5bGUgdnMuIHRoZSBuZXcgc3R5bGUuDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0DQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLw0K
