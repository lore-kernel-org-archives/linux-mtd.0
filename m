Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUGWe-0006mj-PG
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 19:38:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 4/6] mtd: spi-nor: Make the enable argument passed to
 set_byte() a bool
Date: Tue, 4 Dec 2018 19:38:19 +0000
Message-ID: <230e3ef0-0218-1569-ec11-2f2fb9edaead@microchip.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
 <20181129141026.24892-5-boris.brezillon@bootlin.com>
In-Reply-To: <20181129141026.24892-5-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8AAFD3897BFF74286070C5A1886BFE9@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzI5LzIwMTggMDQ6MTAgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gTm8g
bmVlZCB0byB1c2UgYW4gaW50ZWdlciB3aGVuIHRoZSB2YWx1ZSBpcyBlaXRoZXIgdHJ1ZSBvciBm
YWxzZS4NCj4gTWFrZSBpdCBhIGJvb2xlYW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFR1
ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCg0KPiAtLS0NCj4gQ2hh
bmdlcyBpbiB2MjoNCj4gLSBOb25lDQo+IC0tLQ0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMgfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+IGluZGV4IDZkYTUwNjg0ZjMw
My4uZWQxZDdhZDJkY2JiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYw0KPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBAQCAtMjc0LDcg
KzI3NCw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3Jfc2V0XzRieXRlX29wY29kZXMoc3RydWN0IHNw
aV9ub3IgKm5vciwNCj4gIH0NCj4gIA0KPiAgLyogRW5hYmxlL2Rpc2FibGUgNC1ieXRlIGFkZHJl
c3NpbmcgbW9kZS4gKi8NCj4gLXN0YXRpYyBpbnQgc2V0XzRieXRlKHN0cnVjdCBzcGlfbm9yICpu
b3IsIGludCBlbmFibGUpDQo+ICtzdGF0aWMgaW50IHNldF80Ynl0ZShzdHJ1Y3Qgc3BpX25vciAq
bm9yLCBib29sIGVuYWJsZSkNCj4gIHsNCj4gIAlpbnQgc3RhdHVzOw0KPiAgCWJvb2wgbmVlZF93
cmVuID0gZmFsc2U7DQo+IEBAIC0zNTczLDcgKzM1NzMsNyBAQCBzdGF0aWMgaW50IHNwaV9ub3Jf
aW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPiAgCQkgKi8NCj4gIAkJV0FSTl9PTkNFKG5vci0+
ZmxhZ3MgJiBTTk9SX0ZfQlJPS0VOX1JFU0VULA0KPiAgCQkJICAiZW5hYmxpbmcgcmVzZXQgaGFj
azsgbWF5IG5vdCByZWNvdmVyIGZyb20gdW5leHBlY3RlZCByZWJvb3RzXG4iKTsNCj4gLQkJc2V0
XzRieXRlKG5vciwgMSk7DQo+ICsJCXNldF80Ynl0ZShub3IsIHRydWUpOw0KPiAgCX0NCj4gIA0K
PiAgCXJldHVybiAwOw0KPiBAQCAtMzU5OSw3ICszNTk5LDcgQEAgdm9pZCBzcGlfbm9yX3Jlc3Rv
cmUoc3RydWN0IHNwaV9ub3IgKm5vcikNCj4gIAkgICAgKEpFREVDX01GUihub3ItPmluZm8pICE9
IFNOT1JfTUZSX1NQQU5TSU9OKSAmJg0KPiAgCSAgICAhKG5vci0+aW5mby0+ZmxhZ3MgJiBTUElf
Tk9SXzRCX09QQ09ERVMpICYmDQo+ICAJICAgIChub3ItPmZsYWdzICYgU05PUl9GX0JST0tFTl9S
RVNFVCkpDQo+IC0JCXNldF80Ynl0ZShub3IsIDApOw0KPiArCQlzZXRfNGJ5dGUobm9yLCBmYWxz
ZSk7DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChzcGlfbm9yX3Jlc3RvcmUpOw0KPiAgDQo+
IA0K
