Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPUL7-0007qK-Om
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2018 15:22:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <marek.vasut@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for IS25LP032/064
Date: Wed, 21 Nov 2018 15:22:39 +0000
Message-ID: <f175d5a9-57a6-5a80-7eb6-a7c1507d09d9@microchip.com>
References: <20181121132449.12149-1-u.kleine-koenig@pengutronix.de>
 <20181121133400.12437-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20181121133400.12437-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <24378DC11B967F4F88A0625A9984EAB8@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzIxLzIwMTggMDM6MzQgUE0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBU
aGUgZGF0YXNoZWV0IGlzIHB1YmxpY2FsbHkgYXZhaWxhYmxlIGF0DQo+IGh0dHA6Ly93d3cuaXNz
aS5jb20vV1cvcGRmL0lTMjVMUDAzMi0wNjQtMTI4LnBkZi4gVGhlIHBhcmFtZXRlcnMgZml0IHRv
DQo+IHdoYXQgaXMgYWxyZWFkeSBhdmFpbGFibGUgZm9yIElTMjVMUDEyOC8yNTYuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlPg0KDQpSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNy
b2NoaXAuY29tPg0KDQo+IC0tLQ0KPiBjaGFuZ2VzIHNpbmNlIChpbXBsaWNpdCkgdjE6DQo+IA0K
PiAgLSBkb24ndCBkdXBsaWNhdGUgaXMyNWxwMTI4DQo+ICAtIGZpeCBlbWFpbCBhZGRyZXNzIG9m
IFBlbmd1dHJvbml4IGtlcm5lbCB0ZWFtDQo+IA0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jDQo+IGluZGV4IGYwMjgyNzdmYjFjZS4uMjRhZTliMmJhMDBmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBAQCAtMTA2Miw2ICsxMDYyLDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lkc1tdID0gew0KPiAgCQkJU0VDVF80
SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+ICAJeyAiaXMy
NWxwMDgwZCIsIElORk8oMHg5ZDYwMTQsIDAsIDY0ICogMTAyNCwgIDE2LA0KPiAgCQkJU0VDVF80
SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+ICsJeyAiaXMy
NWxwMDMyIiwgIElORk8oMHg5ZDYwMTYsIDAsIDY0ICogMTAyNCwgIDY0LA0KPiArCQkJU0VDVF80
SyB8IFNQSV9OT1JfRFVBTF9SRUFEKSB9LA0KPiArCXsgImlzMjVscDA2NCIsICBJTkZPKDB4OWQ2
MDE3LCAwLCA2NCAqIDEwMjQsIDEyOCwNCj4gKwkJCVNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVB
RCkgfSwNCj4gIAl7ICJpczI1bHAxMjgiLCAgSU5GTygweDlkNjAxOCwgMCwgNjQgKiAxMDI0LCAy
NTYsDQo+ICAJCQlTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQpIH0sDQo+ICAJeyAiaXMyNWxw
MjU2IiwgIElORk8oMHg5ZDYwMTksIDAsIDY0ICogMTAyNCwgNTEyLA0KPiANCg==
