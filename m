Received: from mail-ve1eur01on0082.outbound.protection.outlook.com
 ([104.47.1.82] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMPHe-0004l7-Ff
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 02:18:05 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>
Subject: RE: [PATCHv2 0/2] mtd: m25p80: restore the addressing mode when stop
 using the flash
Date: Wed, 6 Dec 2017 02:17:36 +0000
Message-ID: <AM5PR0402MB2771F2A6E98B974709C394B184320@AM5PR0402MB2771.eurprd04.prod.outlook.com>
References: <20171205053322.35823-1-Zhiqiang.Hou@nxp.com>
 <0b8fae88-cff4-41ac-2613-09bb671ec070@wedev4u.fr>
In-Reply-To: <0b8fae88-cff4-41ac-2613-09bb671ec070@wedev4u.fr>
Content-Language: en-US
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

SGkgQ3lyaWxsZSwNCg0KVGhhbmtzIGEgbG90IGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEN5cmlsbGUgUGl0Y2hlbiBbbWFpbHRvOmN5
cmlsbGUucGl0Y2hlbkB3ZWRldjR1LmZyXQ0KPiBTZW50OiAyMDE35bm0MTLmnIg25pelIDQ6NDEN
Cj4gVG86IFoucS4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT47IGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBjb21wdXRlcnNm
b3JwZWFjZUBnbWFpbC5jb207DQo+IGR3bXcyQGluZnJhZGVhZC5vcmc7IGJvcmlzLmJyZXppbGxv
bkBmcmVlLWVsZWN0cm9ucy5jb207DQo+IG1hcmVrLnZhc3V0QGdtYWlsLmNvbTsgcmljaGFyZEBu
b2QuYXQNCj4gU3ViamVjdDogUmU6IFtQQVRDSHYyIDAvMl0gbXRkOiBtMjVwODA6IHJlc3RvcmUg
dGhlIGFkZHJlc3NpbmcgbW9kZSB3aGVuDQo+IHN0b3AgdXNpbmcgdGhlIGZsYXNoDQo+IA0KPiBI
aSBIb3UsDQo+IA0KPiBMZSAwNS8xMi8yMDE3IMOgIDA2OjMzLCBaaGlxaWFuZyBIb3UgYSDDqWNy
aXQgOg0KPiA+IEZyb206IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+ID4N
Cj4gPiBUbyBiZSBjb21wYXRpYmxlIHdpdGggbGVnYWN5IGRldmljZSwgcmVzZXQgdGhlIGFkZHJl
c3NpbmcgbW9kZSB0byB0aGUNCj4gPiBkZWZhdWx0IG1vZGUuIFN1Y2ggYXMgRnJlZXNjYWxlIGVT
UEkgYm9vdCwgaXQgY29waWVzIHRoZSBpbWFnZXMgZnJvbQ0KPiA+IFNQSSBmbGFzaCB3aXRob3V0
IGZpcmluZyBhIHJlc2V0IHNpZ25hbCBwcmV2aW91c2x5LCBzbyB0aGUgcmVib290DQo+ID4gY29t
bWFuZCB3aWxsIGZhaWwgd2l0aG91dCByZXNldGluZyB0aGUgYWRkcmVzc2luZyBtb2RlIG9mIFNQ
SSBmbGFzaC4NCj4gPg0KPiANCj4gWW91IHNob3VsZCBwdXQgdGhpcyBpbiBvbmUgb2YgdGhlIGNv
bW1pdCBtZXNzYWdlcyBzbyBpdCBleHBsYWlucyB3aGljaCBpc3N1ZSBpcw0KPiBmaXhlZCBieSB5
b3VyIHBhdGNoZXMuDQoNCkFncmVlIHdpdGggeW91LCBhbmQgd2lsbCBkbyBpdCBpbiBuZXh0IHZl
cnNpb24uDQoNCj4gDQo+IE90aGVyd2lzZSwgeW91ciBzZXJpZXMgbG9va3MgZ29vZCB0byBtZSA6
KQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiANCj4gQ3lyaWxsZQ0KPiANCj4gPiBIb3UgWmhpcWlh
bmcgKDIpOg0KPiA+ICAgbXRkOiBzcGktbm9yOiBhZGQgYW4gQVBJIHRvIHJlc3RvcmUgdGhlIHN0
YXR1cyBvZiBTUEkgZmxhc2ggY2hpcA0KPiA+ICAgbXRkOiBtMjVwODA6IHJlc3RvcmUgdGhlIHN0
YXR1cyBvZiBTUEkgZmxhc2ggd2hlbiBzdG9wIHVzaW5nIGl0DQo+ID4NCj4gPiAgRG9jdW1lbnRh
dGlvbi9tdGQvc3BpLW5vci50eHQgfCAgMyArKysgIGRyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgw
LmMNCj4gPiB8ICA5ICsrKysrKysrKyAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAx
MCArKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCAgIHwgIDYgKysr
KysrDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiA+DQoNClRoYW5r
cywNClpoaXFpYW5nDQo=
