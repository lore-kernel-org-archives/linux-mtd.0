Received: from mail-eopbgr00086.outbound.protection.outlook.com ([40.107.0.86]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elzdB-0005Ux-4Q
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 16:10:03 +0000
From: Han Xu <han.xu@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Remove unneeded driver.bus assignment
Date: Wed, 14 Feb 2018 16:09:45 +0000
Message-ID: <d5224efa-bea9-66f7-689d-534607a4cb3b@nxp.com>
References: <20180214124625.30765-1-boris.brezillon@bootlin.com>
In-Reply-To: <20180214124625.30765-1-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2D73C568DEA164BBD5754914EEF011F@eurprd04.prod.outlook.com>
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

DQoNCk9uIDAyLzE0LzIwMTggMDY6NDYgQU0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gcGxh
dGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCkgdGFrZXMgY2FyZSBvZiBhc3NpZ25pbmcgZHJpdmVyLT5i
dXMNCj4gdG8gJnBsYXRmb3JtX2J1c190eXBlLCBubyBuZWVkIHRvIGV4cGxpY2l0bHkgYXNzaWdu
IGl0IGluIHRoZSBkcml2ZXIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8
Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL210ZC9zcGkt
bm9yL2ZzbC1xdWFkc3BpLmMgfCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9mc2wtcXVhZHNwaS5jIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9mc2wtcXVhZHNwaS5jDQo+IGluZGV4IDI5MDFjN2JkOWUzMC4u
ZGM5OTE0ZmNlMjk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2ZzbC1xdWFk
c3BpLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9mc2wtcXVhZHNwaS5jDQo+IEBAIC0x
MTc0LDcgKzExNzQsNiBAQCBzdGF0aWMgaW50IGZzbF9xc3BpX3Jlc3VtZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGZzbF9x
c3BpX2RyaXZlciA9IHsNCj4gICAJLmRyaXZlciA9IHsNCj4gICAJCS5uYW1lCT0gImZzbC1xdWFk
c3BpIiwNCj4gLQkJLmJ1cwk9ICZwbGF0Zm9ybV9idXNfdHlwZSwNCj4gICAJCS5vZl9tYXRjaF90
YWJsZSA9IGZzbF9xc3BpX2R0X2lkcywNCj4gICAJfSwNCj4gICAJLnByb2JlICAgICAgICAgID0g
ZnNsX3FzcGlfcHJvYmUsDQpBY2tlZC1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4=
