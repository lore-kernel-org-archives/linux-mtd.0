Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL4Ly-0002t2-BQ
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 10:49:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <alexandre.belloni@bootlin.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
Date: Fri, 9 Nov 2018 10:49:13 +0000
Message-ID: <bf8fe028-a9ad-56da-df3b-c4e232b5f5cb@microchip.com>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <20181031144504.19405-2-boris.brezillon@bootlin.com>
In-Reply-To: <20181031144504.19405-2-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <78BED24283F6F343B2538F358DD744EB@namprd11.prod.outlook.com>
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

DQoNCk9uIDEwLzMxLzIwMTggMDQ6NDUgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gV2hl
biB0aGUgTk9SIHN1cHBvcnRzIDQgYnl0ZXMgb3Bjb2RlcyB3ZSBzaG91bGQgdXNlIHRob3NlIGlu
c3RlYWQgb2YNCj4gc3dpdGNoaW5nIHRoZSBmbGFzaCBpbiA0LWJ5dGVzIG1vZGUuIFRoaXMgd2F5
LCB3ZSBkb24ndCBoYXZlIHRvIHJlc3RvcmUNCj4gdGhlIGFkZHJlc3NpbmcgbW9kZSB3aGVuIHJl
c2V0dGluZyB0aGUgYm9hcmQuDQo+IA0KPiBSZXBvcnRlZC1ieTogQWxleGFuZHJlIEJlbGxvbmkg
PGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT4NCj4gVGVzdGVkLWJ5OiBBbGV4
YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+IFJldmlld2Vk
LWJ5OiBDeXJpbGxlIFBpdGNoZW4gPGN5cmlsbGUucGl0Y2hlbkB3ZWRldjR1LmZyPg0KDQpSZXZp
ZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KDQo+
IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIEFkZCBBbGV4YW5kcmUgUi1iK1QtYg0KPiAtIEFk
ZCBDeXJpbGxlIFItYg0KPiANCj4gQ2hhbmdlcyBpbiB2Mg0KPiAtIE5vbmUNCj4gLS0tDQo+ICBk
cml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBpbmRleCA3OTg5MTViNWMy
YjAuLmIyMGJjNGIzNmYwZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gQEAgLTI2NDMs
NiArMjY0Myw3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV9iZnB0KHN0cnVjdCBzcGlfbm9y
ICpub3IsDQo+ICAJCWJyZWFrOw0KPiAgDQo+ICAJY2FzZSBCRlBUX0RXT1JEMV9BRERSRVNTX0JZ
VEVTXzRfT05MWToNCj4gKwljYXNlIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfM19PUl80Og0K
PiAgCQlub3ItPmZsYWdzIHw9IFNOT1JfRl80Ql9PUENPREVTOw0KPiAgCQlub3ItPmFkZHJfd2lk
dGggPSA0Ow0KPiAgCQlicmVhazsNCj4gDQo=
