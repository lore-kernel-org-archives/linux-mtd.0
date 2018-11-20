Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP7wo-0001Rh-Ap
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 15:28:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <robimarko@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add Winbond w25q128jv support
Date: Tue, 20 Nov 2018 15:27:59 +0000
Message-ID: <0da87b07-0c32-31e9-eb0f-0c7a03b7f6db@microchip.com>
References: <20180625111748.5108-1-robimarko@gmail.com>
In-Reply-To: <20180625111748.5108-1-robimarko@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AA8549B5B26C14598C0C0BEC6D37DBB@namprd11.prod.outlook.com>
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

DQoNCk9uIDA2LzI1LzIwMTggMDI6MTcgUE0sIFJvYmVydCBNYXJrbyB3cm90ZToNCj4gRGF0YXNo
ZWV0Og0KPiBodHRwOi8vd3d3LndpbmJvbmQuY29tL3Jlc291cmNlLWZpbGVzL3cyNXExMjhqdiUy
MHJldmYlMjAwMzI3MjAxOCUyMHBsdXMucGRmDQo+IA0KPiBUZXN0aW5nIGRvbmUgb24gTWlrcm90
aWsgUm91dGVyYm9hcmQgIHdBUCBSIGJvYXJkLg0KPiBJdCBkb2VzIG5vdCBzdXBwb3J0IER1YWwg
b3IgUXVhZCBtb2Rlcy4NCg0KQnV0IHlvdSBoYXZlIGR1YWwgYW5kIHF1YWQgcmVhZCBzdXBwb3J0
Lg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgTWFya28gPHJvYmltYXJrb0BnbWFpbC5j
b20+DQoNCkFwYXJ0IG9mIHRoZSBvYnNlcnZhdGlvbiBhYm92ZToNCg0KUmV2aWV3ZWQtYnk6IFR1
ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCg0KPiAtLS0NCj4gDQo+
IENoYW5nZXMgaW4gdjI6DQo+IAktIENvcnJlY3QgdGhlIHRpdGxlDQo+IC0tLQ0KPiAgZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBpbmRleCBkOWMzNjhjNDQx
OTQuLjM1MDFkZGRjMzE2NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gQEAgLTEyMzks
NiArMTIzOSwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNb
XSA9IHsNCj4gIAkJCVNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9S
RUFEIHwNCj4gIAkJCVNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQikNCj4gIAl9LA0K
PiArCXsNCj4gKwkJIncyNXExMjhqdiIsIElORk8oMHhlZjcwMTgsIDAsIDY0ICogMTAyNCwgMjU2
LA0KPiArCQkJU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQg
fA0KPiArCQkJU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCKQ0KPiArCX0sDQo+ICAJ
eyAidzI1cTgwIiwgSU5GTygweGVmNTAxNCwgMCwgNjQgKiAxMDI0LCAgMTYsIFNFQ1RfNEspIH0s
DQo+ICAJeyAidzI1cTgwYmwiLCBJTkZPKDB4ZWY0MDE0LCAwLCA2NCAqIDEwMjQsICAxNiwgU0VD
VF80SykgfSwNCj4gIAl7ICJ3MjVxMTI4IiwgSU5GTygweGVmNDAxOCwgMCwgNjQgKiAxMDI0LCAy
NTYsIFNFQ1RfNEspIH0sDQo+IA0K
