Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCR7-0002YU-DA
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:29:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <liu.xiang6@zte.com.cn>, <linux-mtd@lists.infradead.org>
CC: <marek.vasut@gmail.com>, <richard@nod.at>, <linux-kernel@vger.kernel.org>,
 <boris.brezillon@bootlin.com>, <liuxiang_1999@126.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add 4B_OPCODES flag to is25lp256
Date: Fri, 7 Dec 2018 09:28:27 +0000
Message-ID: <30b2e604-af78-1e72-6325-9f188b960a5d@microchip.com>
References: <1542200118-3024-1-git-send-email-liu.xiang6@zte.com.cn>
In-Reply-To: <1542200118-3024-1-git-send-email-liu.xiang6@zte.com.cn>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <964AE1560568C347A3B60F3B5D1E4FE5@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzE0LzIwMTggMDI6NTUgUE0sIExpdSBYaWFuZyB3cm90ZToNCj4gVGhlIGlzMjVs
cDI1NiBzdXBwb3J0cyA0LWJ5dGUgb3Bjb2RlcyBhbmQgcXVhZCBvdXRwdXQuDQo+IA0KPiBTdWdn
ZXN0ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWGlhbmcgPGxpdS54aWFuZzZAenRlLmNvbS5jbj4NCg0KUmV2
aWV3ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCg0K
PiAtLS0NCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIHwgMiArLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3Nw
aS1ub3IuYw0KPiBpbmRleCAzZTU0ZTMxLi4zZWJhMTNhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYw0KPiBAQCAtMTM1Nyw3ICsxMzU3LDcgQEAgc3RhdGljIGludCBzcGlfbm9yX2lzX2xvY2tl
ZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcywgdWludDY0X3QgbGVuKQ0KPiAgCXsg
ImlzMjVscDEyOCIsICBJTkZPKDB4OWQ2MDE4LCAwLCA2NCAqIDEwMjQsIDI1NiwNCj4gIAkJCVNF
Q1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCkgfSwNCj4gIAl7ICJpczI1bHAyNTYiLCAgSU5GTygw
eDlkNjAxOSwgMCwgNjQgKiAxMDI0LCA1MTIsDQo+IC0JCQlTRUNUXzRLIHwgU1BJX05PUl9EVUFM
X1JFQUQpIH0sDQo+ICsJCQlTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FV
QURfUkVBRCB8IFNQSV9OT1JfNEJfT1BDT0RFUykgfSwNCj4gIAl7ICJpczI1d3AwMzIiLCAgSU5G
TygweDlkNzAxNiwgMCwgNjQgKiAxMDI0LCAgNjQsDQo+ICAJCQlTRUNUXzRLIHwgU1BJX05PUl9E
VUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwNCj4gIAl7ICJpczI1d3AwNjQiLCAgSU5G
TygweDlkNzAxNywgMCwgNjQgKiAxMDI0LCAxMjgsDQo+IA0K
