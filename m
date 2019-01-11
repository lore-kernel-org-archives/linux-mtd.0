Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghsGO-0000mT-AV
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 08:34:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <hauke@hauke-m.de>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <pepe2k@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for EON EN25Q128
Date: Fri, 11 Jan 2019 08:33:54 +0000
Message-ID: <20f0910e-5385-923f-e4c0-4412eca2c1b5@microchip.com>
References: <20181209170342.9554-1-hauke@hauke-m.de>
 <20181209170342.9554-2-hauke@hauke-m.de>
In-Reply-To: <20181209170342.9554-2-hauke@hauke-m.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <911027F3EDB0AE4D905C95D15E929C03@namprd11.prod.outlook.com>
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

SGksIEhhdWtlLA0KDQpPbiAxMi8wOS8yMDE4IDA3OjAzIFBNLCBIYXVrZSBNZWhydGVucyB3cm90
ZToNCj4gRnJvbTogUGlvdHIgRHltYWN6IDxwZXBlMmtAZ21haWwuY29tPg0KPiANCj4gVGhlIGRh
dGFzaGVldCBjYW4gYmUgZm91bmQgaGVyZToNCj4gaHR0cHM6Ly90b255aG8uZ2l0aHViLmlvL3N0
YXRpYy9TUElOb3JGbGFzaC9kb2NzL0VOMjVRMTI4LnBkZg0KDQpJIHdvdWxkbid0IGFkZCBsaW5r
cyB0byBwZXJzb25hbCBzaXRlcy4NCg0KSXQgd291bGQgYmUgbmljZSB0byBzcGVjaWZ5IGhvdyB5
b3UgdGVzdGVkIHRoaXMgbWVtb3J5Lg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBEeW1h
Y3ogPHBlcGUya0BnbWFpbC5jb20+DQoNCllvdSBzaG91bGQgYWRkIHlvdXIgU29CIGFzIHlvdSBh
cmUgc2VuZGluZyBhIHBhdGNoIHRoYXQgaXMgbm90IGZyb20geW91Lg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5v
ci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gaW5kZXggMGU5YmJkZTMwYmUw
Li5hMjFiMWEyNjEzMGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5v
ci5jDQo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+IEBAIC0xMjg2LDYg
KzEyODYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9
IHsNCj4gIAl7ICJlbjI1cTMyYiIsICAgSU5GTygweDFjMzAxNiwgMCwgNjQgKiAxMDI0LCAgIDY0
LCAwKSB9LA0KPiAgCXsgImVuMjVwNjQiLCAgICBJTkZPKDB4MWMyMDE3LCAwLCA2NCAqIDEwMjQs
ICAxMjgsIDApIH0sDQo+ICAJeyAiZW4yNXE2NCIsICAgIElORk8oMHgxYzMwMTcsIDAsIDY0ICog
MTAyNCwgIDEyOCwgU0VDVF80SykgfSwNCj4gKwl7ICJlbjI1cTEyOCIsICAgSU5GTygweDFjMzAx
OCwgMCwgNjQgKiAxMDI0LCAgMjU2LCBTRUNUXzRLKSB9LA0KDQpUaGUgZmxhc2ggc3VwcG9ydHMg
U1BJTk9SX09QX1JFQURfMV8xXzIsIFNQSU5PUl9PUF9SRUFEXzFfMl8yIGFuZA0KU1BJTk9SX09Q
X1JFQURfMV80XzQsIGJ1dCBkb2Vzbid0IHN1cHBvcnQgU1BJTk9SX09QX1JFQURfMV8xXzQuIEkg
d291bGQgYWR2aXNlDQp0byBzZXQgU1BJX05PUl9EVUFMX1JFQUQgc28gdGhhdCB5b3UnbGwgYmVu
ZWZpdCBvZiB0aGUgU1BJTk9SX09QX1JFQURfMV8xXzIuDQpMb29rcyBsaWtlIHRoZSBmbGFzaCBk
b2Vzbid0IGhhdmUgc3VwcG9ydCBmb3IgQkZQVCwgdW5mb3J0dW5hdGVseSBhcyBvZiBub3cgeW91
DQpjYW4ndCBiZW5lZml0IG9mIHJlYWQtMS00LTQuIFBsZWFzZSBzZXQgU1BJX05PUl9EVUFMX1JF
QUQgYW5kIHRlc3QgaWYNClNQSU5PUl9PUF9SRUFEXzFfMV8yIHdvcmtzIGNvcnJlY3RseSBhbmQg
aWYgc28sIHN1Ym1pdCBhIG5ldyBwYXRjaC4NCg0KQ2hlZXJzLA0KdGENCg0K
