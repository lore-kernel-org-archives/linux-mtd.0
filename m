Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghsag-00083f-IM
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 08:55:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <hauke@hauke-m.de>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>
CC: <avalentin@marcant.net>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for mx25u3235f
Date: Fri, 11 Jan 2019 08:54:53 +0000
Message-ID: <271e02fa-8ace-b59c-1f74-14231cd883e8@microchip.com>
References: <20181209170342.9554-1-hauke@hauke-m.de>
 <20181209170342.9554-3-hauke@hauke-m.de>
In-Reply-To: <20181209170342.9554-3-hauke@hauke-m.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C93C2A20706484599B36D1606CB24E8@namprd11.prod.outlook.com>
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
ZToNCj4gRnJvbTogQW5kcsOpIFZhbGVudGluIDxhdmFsZW50aW5AbWFyY2FudC5uZXQ+DQo+IA0K
PiBUaGlzIGZsYXNoIGNoaXAgd2FzIGZvdW5kIG9uIHRoZSBaeVhFTCBOQkc2ODE3DQo+IA0KPiBU
aGUgZGF0YXNoZWV0IGNhbiBiZSBmb3VuZCBoZXJlOg0KPiBodHRwOi8vd3d3Lm1hY3Jvbml4LmNv
bS9MaXN0cy9EYXRhc2hlZXQvQXR0YWNobWVudHMvNzQzOC9NWDI1VTMyMzVGLCUyMDEuOFYsJTIw
MzJNYiwlMjB2MS42LnBkZg0KDQpEaWQgeW91IHRlc3QgdGhlIGZsYXNoIHRvIHNlZSBpZiBpdCB3
b3JrcyBjb3JyZWN0bHk/IFlvdSBzaG91bGQgc3BlY2lmeSB0aGlzIGluDQp0aGUgY29tbWl0IG1l
c3NhZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgVmFsZW50aW4gPGF2YWxlbnRpbkBt
YXJjYW50Lm5ldD4NCg0KWW91IHNob3VsZCBhZGQgeW91ciBTaWduZWQtb2ZmLWJ5IHRhZyBhcyB5
b3UgYXJlIHNlbmRpbmcgYSBwYXRjaCB0aGF0IGlzIG5vdA0KZnJvbSB5b3UuDQoNCj4gLS0tDQo+
ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBpbmRleCBhMjFiMWEy
NjEzMGQuLjk5MjU3NjAzMzliYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gQEAgLTEz
NzUsNiArMTM3NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lk
c1tdID0gew0KPiAgCXsgIm14MjVsMzIwNWQiLCAgSU5GTygweGMyMjAxNiwgMCwgNjQgKiAxMDI0
LCAgNjQsIFNFQ1RfNEspIH0sDQo+ICAJeyAibXgyNWwzMjU1ZSIsICBJTkZPKDB4YzI5ZTE2LCAw
LCA2NCAqIDEwMjQsICA2NCwgU0VDVF80SykgfSwNCj4gIAl7ICJteDI1bDY0MDVkIiwgIElORk8o
MHhjMjIwMTcsIDAsIDY0ICogMTAyNCwgMTI4LCBTRUNUXzRLKSB9LA0KPiArCXsgIm14MjV1MzIz
NWYiLAkgSU5GTygweGMyMjUzNiwgMCwgNjQgKiAxMDI0LCAgNjQsIFNFQ1RfNEspIH0sDQo+ICAJ
eyAibXgyNXUyMDMzZSIsICBJTkZPKDB4YzIyNTMyLCAwLCA2NCAqIDEwMjQsICAgNCwgU0VDVF80
SykgfSwNCg0KSXQncyBuaWNlciB0byBvcmRlciB0aGlzIGFscGhhYmV0aWNhbGx5LCB0aGUgZW50
cnkgc2hvdWxkIGJlIGFkZGVkIGhlcmUuDQoNClRoZSBmbGFzaCBzdXBwb3J0cyBGYXN0IFJlYWQg
MS0xLTIgKDNCaCkgYW5kIEZhc3QgUmVhZCAxLTEtNCAoNkJoKSBoZW5jZSBib3RoDQpTUElfTk9S
X0RVQUxfUkVBRCBhbmQgU1BJX05PUl9RVUFEX1JFQUQgZmxhZ3Mgc2hvdWxkIGJlIHNldCB0b28u
IENhbiB5b3UgcGxlYXNlDQp0ZXN0IHdpdGggdGhlc2UgZmxhZ3MgYW5kIGlmIGFsbCBvaywgc3Vi
bWl0IGEgbmV3IHBhdGNoPw0KDQpDaGVlcnMsDQp0YQ0KDQo+ICAJeyAibXgyNXU0MDM1IiwgICBJ
TkZPKDB4YzIyNTMzLCAwLCA2NCAqIDEwMjQsICAgOCwgU0VDVF80SykgfSwNCj4gIAl7ICJteDI1
dTgwMzUiLCAgIElORk8oMHhjMjI1MzQsIDAsIDY0ICogMTAyNCwgIDE2LCBTRUNUXzRLKSB9LA0K
PiANCg==
