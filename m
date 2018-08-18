Received: from mail-sn1nam02on0043.outbound.protection.outlook.com
 ([104.47.36.43] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqtAb-0004yH-Os
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2018 04:49:03 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "absahu@codeaurora.org" <absahu@codeaurora.org>,
 "peterpandong@micron.com" <peterpandong@micron.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek
 <michals@xilinx.com>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>
Subject: RE: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Sat, 18 Aug 2018 04:48:35 +0000
Message-ID: <MWHPR02MB2623E97FE72F5ABC3D0A3AABAF3C0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180817163733.34d3199c@xps13>
In-Reply-To: <20180817163733.34d3199c@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgTWlxdWVsLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTWlxdWVsIFJheW5hbCBbbWFpbHRvOm1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb21dDQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE3LCAyMDE4IDg6MDggUE0NCj4g
VG86IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+DQo+IENjOiBi
b3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb207IHJpY2hhcmRAbm9kLmF0OyBkd213MkBpbmZyYWRl
YWQub3JnOw0KPiBjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb207IG1hcmVrLnZhc3V0QGdtYWls
LmNvbTsga3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbTsNCj4gYWJzYWh1QGNvZGVhdXJvcmEub3Jn
OyBwZXRlcnBhbmRvbmdAbWljcm9uLmNvbTsgZnJpZWRlci5zY2hyZW1wZkBleGNlZXQuZGU7IGxp
bnV4LQ0KPiBtdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+Ow0KPiBuYWdhc3VyZXNoa3Vt
YXJyZWxsaUBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtMSU5VWCBQQVRDSCB2MTAgMi8yXSBt
dGQ6IHJhd25hbmQ6IGFyYXNhbjogQWRkIHN1cHBvcnQgZm9yIEFyYXNhbg0KPiBOQU5EIEZsYXNo
IENvbnRyb2xsZXINCj4gDQo+IEhpIE5hZ2EsDQo+IA0KPiBBIHVzZXIgb2YgWGlsaW54IEJTUCBy
ZXBvcnRlZCBhIHByb2JsZW0gd2l0aCBsb2NrZGVwIHRoYXQgSSBjYW4gc2VlIGlzIG5vdCB5ZXQg
Zml4ZWQgaW4gdGhpcw0KPiBjb2RlOg0KSSBkaWRuJ3Qga25vdyB0aGlzLiB0aGFua3MgZm9yIHJl
cG9ydGluZyB0aGUgaXNzdWUuIGxldCBtZSBjaGVjay4NCj4gDQo+IE5hZ2EgU3VyZXNoa3VtYXIg
UmVsbGkgPG5hZ2Euc3VyZXNoa3VtYXIucmVsbGlAeGlsaW54LmNvbT4gd3JvdGUgb24gRnJpLCAx
NyBBdWcgMjAxOA0KPiAxODo0OToyNCArMDUzMDoNCj4gDQo+ID4gK3N0YXRpYyBpbnQgYW5mY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgYW5mY19u
YW5kX2NvbnRyb2xsZXIgKm5mYzsNCj4gPiArCXN0cnVjdCBhbmZjX25hbmRfY2hpcCAqYW5hbmRf
Y2hpcDsNCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZSwg
KmNoaWxkOw0KPiA+ICsJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gKwlpbnQgZXJyOw0KPiA+
ICsNCj4gPiArCW5mYyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKm5mYyksIEdG
UF9LRVJORUwpOw0KPiA+ICsJaWYgKCFuZmMpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4g
Kw0KPiA+ICsJaW5pdF93YWl0cXVldWVfaGVhZCgmbmZjLT5jb250cm9sbGVyLndxKTsNCj4gDQo+
IFRoZSBjb250cm9sbGVyIHN0cnVjdHVyZSBoYXMgYSBsb2NrIHdoaWNoIGlzIG5vdCBpbml0aWFs
aXplZCBoZXJlLiBZb3Ugc2hvdWxkIG5vdCBpbml0aWFsaXplIHRoZQ0KPiB3YWl0cXVldWUgbWFu
dWFsbHkgbmVpdGhlciBhbmQgaW5zdGVhZCB1c2UgbmFuZF9jb250cm9sbGVyX2luaXQoJm5mYy0+
Y29udHJvbGxlcikuDQpPay4gSnVzdCBub3cgSSBzYXcgbWFydmVsbCBuYW5kIGRyaXZlci4gSSB3
aWxsIHVwZGF0ZSBhY2NvcmRpbmdseS4NCj4gDQo+ID4gKwlJTklUX0xJU1RfSEVBRCgmbmZjLT5j
aGlwcyk7DQo+ID4gKwlpbml0X2NvbXBsZXRpb24oJm5mYy0+ZXZlbnQpOw0KPiA+ICsJbmZjLT5k
ZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbmZjKTsN
Cj4gPiArCW5mYy0+Y3NudW0gPSAtMTsNCj4gPiArCW5mYy0+Y29udHJvbGxlci5vcHMgPSAmYW5m
Y19uYW5kX2NvbnRyb2xsZXJfb3BzOw0KPiANCj4gTW9yZSB0byBjb21lLg0KDQpUaGFua3MsDQpO
YWdhIFN1cmVzaGt1bWFyIFJlbGxpLg0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQo=
