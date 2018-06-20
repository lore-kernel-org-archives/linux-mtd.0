Received: from mail-co1nam04on0624.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::624]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVb0w-0002uT-2E
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 11:11:31 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] mtd: cfi_cmdset_0002: Avoid walking all chips when
 unlocking.
Date: Wed, 20 Jun 2018 11:10:49 +0000
Message-ID: <c5c50ddf2e99950dd790a264a5f40eb6e1647a83.camel@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
 <20180606101330.11071-4-joakim.tjernlund@infinera.com>
 <20180620112503.26572cf1@bbrezillon>
In-Reply-To: <20180620112503.26572cf1@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1306575A3DC854C86E873F1D2D6D7C7@namprd10.prod.outlook.com>
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

T24gV2VkLCAyMDE4LTA2LTIwIGF0IDExOjI1ICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
DQo+IA0KPiANCj4gT24gV2VkLCAgNiBKdW4gMjAxOCAxMjoxMzozMCArMDIwMA0KPiBKb2FraW0g
VGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGluZmluZXJhLmNvbT4gd3JvdGU6DQo+IA0KPiA+
IGNmaV9wcGJfdW5sb2NrKCkgd2Fsa3MgYWxsIGZsYXNoIGNoaXBzIHdoZW4gdW5sb2NraW5nIHNl
Y3RvcnMsDQo+ID4gYXZvaWQgd2Fsa2luZyBjaGlwcyB1bmFmZmVjdGVkIGJ5IHRoZSB1bmxvY2sg
b3BlcmF0aW9uLg0KPiA+IA0KPiA+IEZpeGVzOiAxNjQ4ZWFhYTE1NzUgKCJtdGQ6IGNmaV9jbWRz
ZXRfMDAwMjogU3VwcG9ydCBQZXJzaXN0ZW50IFByb3RlY3Rpb24gQml0cyAoUFBCKSBsb2NraW5n
IikNCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiANCj4gVGhhdCdzIGNsZWFybHkg
bm90IGEgZml4LCBqdXN0IGFuIG9wdGltaXphdGlvbi4gWW91IHNob3VsZCBkcm9wIHRoZQ0KPiBG
aXhlcyBhbmQgQ2Mtc3RhYmxlIHRhZ3MuDQoNCkl0IHN1cmUgSVMhIFRoZSBjb2RlIG5ldmVyIGlu
dGVuZGVkIHRvIGRvIHRoaXMgYW5kIGl0IGlzIGp1c3QgYmFkIGx1Y2sgdGhhdCBub3RoaW5nIGJh
ZA0KaGFwcGVuZWQgYW5kIEkgc3VyZSBkb24ndCB3YW50IHRvIHdhbGsgYWxsIDQgY2hpcHMgd2Ug
aGF2ZSwgc3RlYWxpbmcgQ1BVIGFuZCBrZWVwaW5nIHRoZQ0KZmxhc2ggYnVzeSBqdXN0IGJlY2F1
c2UgSSBhbSB1c2luZyBzdGFibGUuDQoNCkdpdmVuIEkgaGF2ZSBtb3ZlZCBvbiBub3cgYW5kIHdl
IGRpc2FncmVlLCBJIHdpbGwgbm90IHJld29yZCBhbmQgcmVzdWJtaXQgYW55DQp0aW1lIHNvb24u
IEZlZWwgZnJlZSB0byBkbyBuZWVkZWQgZWRpdHMgdGhvdWdoLg0KDQogSm9ja2UNCg0KPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGluZmlu
ZXJhLmNvbT4NCj4gPiAtLS0NCj4gPiAgdjIgLSBTcGlsdCBpbnRvIHNldmVyYWwgcGF0Y2hlcw0K
PiA+IA0KPiA+ICBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyB8IDIgKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBz
L2NmaV9jbWRzZXRfMDAwMi5jDQo+ID4gaW5kZXggYjYyNzNjZTgzZGU3Li42MmNkNGVlMjgwYjMg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMNCj4g
PiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYw0KPiA+IEBAIC0yNjg2
LDYgKzI2ODYsOCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGNmaV9wcGJfdW5sb2NrKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBpKys7DQo+ID4gDQo+ID4gICAgICAgICAgICAgICBpZiAoYWRyID4+IGNmaS0+Y2hpcHNoaWZ0
KSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChvZmZzZXQgPj0gKG9mcyArIGxlbikp
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIGFkciA9IDA7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNoaXBudW0r
KzsNCj4gPiANCj4gDQo+IA0K
