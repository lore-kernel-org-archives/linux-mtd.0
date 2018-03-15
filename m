Received: from mail-by2nam01on0085.outbound.protection.outlook.com
 ([104.47.34.85] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewX6n-0007ag-Fk
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 17:56:11 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
Date: Thu, 15 Mar 2018 17:55:57 +0000
Message-ID: <1521136555.4790.159.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <1520784361.4790.86.camel@infinera.com>
 <20180315165454.5bf24ec0@bbrezillon>
In-Reply-To: <20180315165454.5bf24ec0@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFEBD4703051884E873B1DFFC18607FD@namprd10.prod.outlook.com>
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

T24gVGh1LCAyMDE4LTAzLTE1IGF0IDE2OjU0ICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0K
PiANCj4gDQo+IE9uIFN1biwgMTEgTWFyIDIwMTggMTY6MDY6MDMgKzAwMDANCj4gSm9ha2ltIFRq
ZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiANCj4gPiBP
biBUaHUsIDIwMTgtMDMtMDEgYXQgMTQ6MzkgKzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6
DQo+ID4gPiBUaGlzIGZpeGVzIGEgYnVnIHdoaWNoIGFsbG93cyByZWFkL3dyaXRlIHRvIGEgZXJh
c2UgYmxvY2sgY3VycmVudGx5DQo+ID4gPiBlcmFzaW5nLg0KPiA+ID4gQWxzbyB3b3JrcyBhcm91
bmQgYSBjaGlwIGJ1ZyBpbiBNaWNyb24gMjhGMDBBUDMwIGNoaXBzLg0KPiA+ID4gDQo+ID4gPiBK
b2FraW0gVGplcm5sdW5kICgzKToNCj4gPiA+ICAgY2ZpX2NtZHNldF8wMDAxOiBEbyBub3QgYWxs
b3cgcmVhZC93cml0ZSB0byBzdXNwZW5kIGVyYXNlIGJsb2NrLg0KPiA+ID4gICBjZmlfY21kc2V0
XzAwMDE6IFdvcmthcm91bmQgTWljcm9uIEVyYXNlIHN1c3BlbmQgYnVnLg0KPiA+ID4gICBjZmlf
Y21kc2V0XzAwMDI6IERvIG5vdCBhbGxvdyByZWFkL3dyaXRlIHRvIHN1c3BlbmQgZXJhc2UgYmxv
Y2suDQo+ID4gPiANCj4gPiA+ICBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYyB8
IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gIGRyaXZlcnMvbXRk
L2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgIDkgKysrKysrLS0tDQo+ID4gPiAgaW5jbHVkZS9s
aW51eC9tdGQvZmxhc2hjaGlwLmggICAgICAgfCAgMSArDQo+ID4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gDQo+ID4gUGlu
Zz8NCj4gDQo+IFlvdSBkaWRuJ3QgQ2MgdGhlIE1URCBtYWludGFpbmVycywgc28gdGhhdCdzIG5v
dCBzdXJwcmlzaW5nIHlvdSBkb24ndA0KPiBnZXQgYSByZXBseSBmcm9tIHVzIDpQLg0KDQpJIGZp
bmQgaXQgbW9yZSBzdXJwcmlzaW5nIHRoYXQgdGhlIE1URCBtYWludGFpbmVycyBkb2Vzbid0IHJl
YWQgdGhlIE1URCBsaXN0ID8gSSBmaWd1cmVkDQp0aGlzIHdhcyBhIHJlcXVpcmVtZW50Lg0KDQo+
IA0KPiA+IFRoaXMgaXMgYSBmYWlybHkgc2VyaW91cyBidWcgYXMgaXQgY29uZnVzZXMgdGhlIGZs
YXNoIHN0YXRlIG1hY2hpbmUsDQo+ID4gbWFraW5nIGZ1cnRoZXIgZmxhc2ggYWNjZXNzIGZhaWwu
DQo+IA0KPiBJJ2xsIHRyeSB0byBoYXZlIGEgbG9vay4NCg0KVGhhbmtz
