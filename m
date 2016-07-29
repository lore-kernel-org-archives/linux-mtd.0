Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSvlA-0003UA-PH
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 00:34:41 +0000
From: <Wenyou.Yang@microchip.com>
To: <jteki@openedev.com>, <linux-mtd@lists.infradead.org>
CC: <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <wenyou.yang@atmel.com>
Subject: RE: [PATCH] mtd: spi-nor: Add at25df321 spi-nor flash support
Date: Fri, 29 Jul 2016 00:34:16 +0000
Message-ID: <F9F4555C4E01D7469D37975B62D0EFBB38C872@CHN-SV-EXMX07.mchp-main.com>
References: <1469522274-10478-1-git-send-email-jteki@openedev.com>
In-Reply-To: <1469522274-10478-1-git-send-email-jteki@openedev.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFnYW4gVGVraSBbbWFp
bHRvOmp0ZWtpQG9wZW5lZGV2LmNvbV0NCj4gU2VudDogMjAxNsTqN9TCMjbI1SAxNjozOA0KPiBU
bzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IERhdmlkIFdvb2Rob3VzZSA8
ZHdtdzJAaW5mcmFkZWFkLm9yZz47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IEph
Z2FuIFRla2kgPGp0ZWtpQG9wZW5lZGV2LmNvbT47IEJyaWFuIE5vcnJpcw0KPiA8Y29tcHV0ZXJz
Zm9ycGVhY2VAZ21haWwuY29tPjsgV2VueW91IFlhbmcgPHdlbnlvdS55YW5nQGF0bWVsLmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIXSBtdGQ6IHNwaS1ub3I6IEFkZCBhdDI1ZGYzMjEgc3BpLW5vciBm
bGFzaCBzdXBwb3J0DQo+IA0KPiBBZGQgQXRtZWwgYXQyNWRmMzIxIHNwaS1ub3IgZmxhc2ggdG8g
dGhlIGxpc3Qgb2Ygc3BpX25vcl9pZHMuDQo+IA0KPiBDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRl
cnNmb3JwZWFjZUBnbWFpbC5jb20+DQo+IENjOiBXZW55b3UgWWFuZyA8d2VueW91LnlhbmdAYXRt
ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqdGVraUBvcGVuZWRldi5jb20+
DQoNCkFja2VkLWJ5IFdlbnlvdSBZYW5nIDx3ZW55b3UueWFuZ0BhdG1lbC5jb20+DQoNCj4gLS0t
DQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBpbmRleA0KPiBkMGZj
MTY1Li5lYzQ3NDUxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3Iu
Yw0KPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBAQCAtNzk5LDYgKzc5
OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lkc1tdID0gew0K
PiAgCXsgImF0MjVmczA0MCIsICBJTkZPKDB4MWY2NjA0LCAwLCA2NCAqIDEwMjQsICAgOCwgU0VD
VF80SykgfSwNCj4gDQo+ICAJeyAiYXQyNWRmMDQxYSIsIElORk8oMHgxZjQ0MDEsIDAsIDY0ICog
MTAyNCwgICA4LCBTRUNUXzRLKSB9LA0KPiArCXsgImF0MjVkZjMyMSIsICBJTkZPKDB4MWY0NzAw
LCAwLCA2NCAqIDEwMjQsICA2NCwgU0VDVF80SykgfSwNCj4gIAl7ICJhdDI1ZGYzMjFhIiwgSU5G
TygweDFmNDcwMSwgMCwgNjQgKiAxMDI0LCAgNjQsIFNFQ1RfNEspIH0sDQo+ICAJeyAiYXQyNWRm
NjQxIiwgIElORk8oMHgxZjQ4MDAsIDAsIDY0ICogMTAyNCwgMTI4LCBTRUNUXzRLKSB9LA0KPiAN
Cj4gLS0NCj4gMi43LjQNCg0KDQpCZXN0IFJlZ2FyZHMsDQpXZW55b3UgWWFuZw0KDQo=
