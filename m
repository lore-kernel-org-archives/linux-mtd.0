Received: from mail-sn1nam01on0043.outbound.protection.outlook.com
 ([104.47.32.43] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePRkA-0005B9-2B
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 11:32:05 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Philippe Ombredanne <pombredanne@nexb.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>, "Punnaiah
 Choudary Kalluri" <punnaia@xilinx.com>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>
Subject: RE: [PATCH v8 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
Date: Thu, 14 Dec 2017 11:31:33 +0000
Message-ID: <BY2PR02MB14116E2BD437F1CBEB38BA32AF0A0@BY2PR02MB1411.namprd02.prod.outlook.com>
References: <20171214074906.2147-1-nagasure@xilinx.com>
 <20171214074906.2147-3-nagasure@xilinx.com>
 <CAOFm3uFJ9MPpN=2YOsY=kr0j-s=2PvzkKTC51gqJTeaBrSMrrw@mail.gmail.com>
In-Reply-To: <CAOFm3uFJ9MPpN=2YOsY=kr0j-s=2PvzkKTC51gqJTeaBrSMrrw@mail.gmail.com>
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

SGkgUGhpbGlwcGUsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCkkgd2lsbCB1cGRhdGUgaXQg
aW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MsDQpOYWdhIFN1cmVzaGt1bWFyIFJlbGxpLg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHBlIE9tYnJlZGFubmUg
W21haWx0bzpwb21icmVkYW5uZUBuZXhiLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVy
IDE0LCAyMDE3IDI6NDIgUE0NCj4gVG86IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJl
QHhpbGlueC5jb20+DQo+IENjOiBib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tOyBy
aWNoYXJkQG5vZC5hdDsNCj4gY29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tOyBtYXJlay52YXN1
dEBnbWFpbC5jb207DQo+IGN5cmlsbGUucGl0Y2hlbkB3ZWRldjR1LmZyOyBkd213MkBpbmZyYWRl
YWQub3JnOyBsaW51eC0NCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IExLTUwgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBNaWNoYWwgU2ltZWsNCj4gPG1pY2hhbHNAeGlsaW54LmNv
bT47IFB1bm5haWFoIENob3VkYXJ5IEthbGx1cmkgPHB1bm5haWFAeGlsaW54LmNvbT47DQo+IG5h
Z2FzdXJlc2gxMkBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAyLzJdIG10ZDog
bmFuZDogQWRkIHN1cHBvcnQgZm9yIEFyYXNhbiBOQU5EIEZsYXNoDQo+IENvbnRyb2xsZXINCj4g
DQo+IERlYXIgTmFnYSwNCj4gDQo+IE9uIFRodSwgRGVjIDE0LCAyMDE3IGF0IDg6NDkgQU0sIE5h
Z2EgU3VyZXNoa3VtYXIgUmVsbGkNCj4gPG5hZ2Euc3VyZXNoa3VtYXIucmVsbGlAeGlsaW54LmNv
bT4gd3JvdGU6DQo+ID4gQWRkZWQgdGhlIGJhc2ljIGRyaXZlciBmb3IgQXJhc2FuIE5BTkQgRmxh
c2ggQ29udHJvbGxlciB1c2VkIGluIFp5bnENCj4gPiBVbHRyYVNjYWxlKyBNUFNvQy4gSXQgc3Vw
cG9ydHMgb25seSBIdyBFQ0MgYW5kIHVwdG8gMjRiaXQgY29ycmVjdGlvbi4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUHVubmFpYWggQ2hvdWRhcnkgS2FsbHVyaSA8cHVubmFpYUB4
aWxpbnguY29tPg0KPiANCj4gPHNuaXA+DQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL2FyYXNhbl9uYW5kLmMNCj4gPiBAQCAtMCwwICsxLDEwMjAgQEAN
Cj4gPiArLyoNCj4gPiArICogQXJhc2FuIE5BTkQgRmxhc2ggQ29udHJvbGxlciBEcml2ZXINCj4g
PiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE0IC0gMjAxNyBYaWxpbngsIEluYy4NCj4g
PiArICoNCj4gPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vcg0KPiA+ICttb2RpZnkgaXQgdW5kZXINCj4gPiArICogdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMgcHVibGlz
aGVkDQo+ID4gK2J5IHRoZQ0KPiA+ICsgKiBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhl
ciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yIChhdA0KPiA+ICt5b3VyDQo+ID4gKyAqIG9w
dGlvbikgYW55IGxhdGVyIHZlcnNpb24uDQo+ID4gKyAqLw0KPiANCj4gQ291bGQgeW91IHVzZSB0
aGUgbmV3IFNQRFggdGFncyBpbnN0ZWFkIG9mIHRoaXMgZmluZSBhbmQgbG9uZyBib2lsZXJwbGF0
ZT8gU2VlDQo+IFRob21hcyBkb2MgZm9yIGRldGFpbHMgWzFdDQo+IA0KPiBbMV0gaHR0cHM6Ly9s
a21sLm9yZy9sa21sLzIwMTcvMTIvNC85MzQNCj4gDQo+IFRoYW5rcyENCj4gDQo+IC0tDQo+IENv
cmRpYWxseQ0KPiBQaGlsaXBwZSBPbWJyZWRhbm5lDQo=
