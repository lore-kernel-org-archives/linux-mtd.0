From: Alison Wang <alison.wang@nxp.com>
To: Marek Vasut <marek.vasut@gmail.com>, Alison Wang <b18965@freescale.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [PATCH v2 2/2] mtd: nand: Update dependency of IFC for LS1021A
Date: Wed, 4 Jan 2017 01:46:11 +0000
Message-ID: <DB6PR0401MB2584606EC932BF1FAED788E1F4610@DB6PR0401MB2584.eurprd04.prod.outlook.com>
References: <1483411266-45875-1-git-send-email-b18965@freescale.com>
 <1483411266-45875-2-git-send-email-b18965@freescale.com>
 <4e04eb5e-fb53-f71e-ee49-0872a6c11e97@gmail.com>
In-Reply-To: <4e04eb5e-fb53-f71e-ee49-0872a6c11e97@gmail.com>
Content-Language: zh-CN
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

PiBPbiAwMS8wMy8yMDE3IDAzOjQxIEFNLCBBbGlzb24gV2FuZyB3cm90ZToNCj4gPiBBcyBOQU5E
IHN1cHBvcnQgZm9yIEZyZWVzY2FsZS9OWFAgSUZDIGNvbnRyb2xsZXIgaXMgYXZhaWxhYmxlIG9u
DQo+ID4gTFMxMDIxQSwgdGhlIGRlcGVuZGVuY3kgZm9yIExTMTAyMUEgaXMgYWRkZWQuDQo+IA0K
PiBEb2VzIExTIHN0YW5kIGZvciBMYXllclNjYXBlID8gWWVzIGl0IGRvZXMuIFNvIHdoeSBkb2Vz
IEFSQ0hfTEFZRVJTQ0FQRQ0KPiBub3QgY292ZXIgTFMxMDIxID8NCltBbGlzb24gV2FuZ10gTFMx
MDIxQSBpcyBhbiBlYXJsaWVyIHByb2R1Y3QgYW5kIGlzIG5vdCBjb21wYXRpYmxlIHdpdGggbGF0
ZXIgTGF5ZXJzY2FwZSBhcmNoaXRlY3R1cmUuIFNvIEFSQ0hfTEFZRVJTQ0FQRSBjYW4ndCBjb3Zl
ciBMUzEwMjFBLg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXNvbiBXYW5nIDxhbGlzb24u
d2FuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBOb25lDQo+
ID4NCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9LY29uZmlnIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL0tjb25maWcgYi9kcml2ZXJzL210ZC9uYW5kL0tjb25maWcNCj4g
aW5kZXgNCj4gPiAzNTNhOWRkLi44NWUzODYwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvS2NvbmZpZw0KPiA+IEBA
IC00NDEsNyArNDQxLDcgQEAgY29uZmlnIE1URF9OQU5EX0ZTTF9FTEJDDQo+ID4NCj4gPiAgY29u
ZmlnIE1URF9OQU5EX0ZTTF9JRkMNCj4gPiAgCXRyaXN0YXRlICJOQU5EIHN1cHBvcnQgZm9yIEZy
ZWVzY2FsZSBJRkMgY29udHJvbGxlciINCj4gPiAtCWRlcGVuZHMgb24gRlNMX1NPQyB8fCBBUkNI
X0xBWUVSU0NBUEUNCj4gPiArCWRlcGVuZHMgb24gRlNMX1NPQyB8fCBBUkNIX0xBWUVSU0NBUEUg
fHwgU09DX0xTMTAyMUENCj4gPiAgCXNlbGVjdCBGU0xfSUZDDQo+ID4gIAlzZWxlY3QgTUVNT1JZ
DQo+ID4gIAloZWxwDQo+ID4NCg0KQmVzdCBSZWdhcmRzLA0KQWxpc29uIFdhbmcNCg==
