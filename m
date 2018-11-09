Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLAlp-0006VD-D8
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 17:40:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <cyrille.pitchen@wedev4u.fr>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: mark desirable switch case fall through
Date: Fri, 9 Nov 2018 17:40:21 +0000
Message-ID: <20181109174017.19269-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF4E685A3DA8054D8686BC8CA57D5182@namprd11.prod.outlook.com>
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

Z2NjIDcgd2l0aCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIHJhaXNlczoNCg0KZHJpdmVycy9tdGQv
c3BpLW5vci9zcGktbm9yLmM6IEluIGZ1bmN0aW9uIOKAmHNldF80Ynl0ZeKAmToNCmRyaXZlcnMv
bXRkL3NwaS1ub3Ivc3BpLW5vci5jOjI4OToxMzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5
IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dDQogICBuZWVkX3dyZW4gPSB0
cnVlOw0KICAgfn5+fn5+fn5+fl5+fn5+fg0KZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmM6
MjkwOjI6IG5vdGU6IGhlcmUNCiAgY2FzZSBTTk9SX01GUl9NQUNST05JWDoNCiAgXn5+fg0KDQpR
dWlldCB0aGUgd2FybmluZyBieSBtYXJraW5nIHRoZSBleHBlY3RlZCBzd2l0Y2ggZmFsbCB0aHJv
dWdoLg0KDQpTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3Jv
Y2hpcC5jb20+DQotLS0NCiBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDEgKw0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KaW5kZXgg
OTQwN2NhNWY5NDQzLi44MDY1ZDVkNzZiZTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL3NwaS1ub3IuYw0KKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCkBAIC0y
ODcsNiArMjg3LDcgQEAgc3RhdGljIGlubGluZSBpbnQgc2V0XzRieXRlKHN0cnVjdCBzcGlfbm9y
ICpub3IsIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvICppbmZvLA0KIAljYXNlIFNOT1JfTUZSX01J
Q1JPTjoNCiAJCS8qIFNvbWUgTWljcm9uIG5lZWQgV1JFTiBjb21tYW5kOyBhbGwgd2lsbCBhY2Nl
cHQgaXQgKi8NCiAJCW5lZWRfd3JlbiA9IHRydWU7DQorCQkvKiBmYWxsIHRocm91Z2ggKi8NCiAJ
Y2FzZSBTTk9SX01GUl9NQUNST05JWDoNCiAJY2FzZSBTTk9SX01GUl9XSU5CT05EOg0KIAkJaWYg
KG5lZWRfd3JlbikNCi0tIA0KMi45LjQNCg0K
