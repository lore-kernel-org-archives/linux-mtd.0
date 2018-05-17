Received: from mail-sn1nam01on0080.outbound.protection.outlook.com
 ([104.47.32.80] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJIi1-0006oS-VN
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 13:12:52 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: Re: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase
 functions
Date: Thu, 17 May 2018 13:12:26 +0000
Message-ID: <f74834424cb3f1f86e8803884b53be5f62d15c94.camel@infinera.com>
References: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
In-Reply-To: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69565451078A44B8B0CD15C8700A3F1@namprd10.prod.outlook.com>
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

SSB0aGluayB0aGUgcGF0Y2hlcyBsb29rIGdvb2QgYnV0IEkgdGhpbmsgdGhleSBzaG91bGQgZ28N
CnRvIHN0YWJsZSBhcyB3ZWxsLg0KDQogSm9ja2UNCg0KT24gV2VkLCAyMDE4LTA1LTE2IGF0IDAy
OjExICswOTAwLCBzbXRwdXNlciB3cm90ZToNCj4gDQo+IEZyb206IFRva3Vub3JpIElrZWdhbWkg
PGlrZWdhbWlAYWxsaWVkLXRlbGVzaXMuY28uanA+DQo+IA0KPiBUaGUgY2hhbmdlcyBhcmUgdG8g
bWFrZSBzdXJlIHRvIGNoZWNrIHRoZSBvcGVyYXRpb24gc3RhdHVzLg0KPiBBY3R1YWxseSB0aGUg
Zmxhc2ggd3JpdGUgYW5kIGVyYXNlIGVycm9yIGJlaGF2aW9yIGlzIGNhdXNlZCBvbiBvdXIgcHJv
ZHVjdHMuDQo+IFRoZSBmbGFzaCBpcyBNYWNyb25peCBmbGFzaCBkZXZpY2UgTVgyOUdMNTEyRkhU
MkktMTFHIHVzZWQgYnkgb3VyIHByb2R1Y3RzLg0KPiBUaGUgcGF0Y2ggc2VyaWVzIHdhcyBzZXBh
cmF0ZWQgZm9yIGNoYW5nZXMgb2YgZmxhc2ggd3JpdGUgYW5kIGVyYXNlLg0KPiBTaW5jZSB0aG9z
ZSB3ZXJlIG5vdCBkZXBlbmRlZCBlYWNoIG90aGVyIGF0IHRoZSB0aW1lLg0KPiBCdXQgYnkgYWRk
aXRpb25hbCBjaGFuZ2VzIHRoZSBjaGFuZ2VzIGFyZSByZWxhdGVkIG1vcmUgYXMgc2FtZSB3YXkg
Y3VycmVudGx5Lg0KPiBTbyBjb21iaW5lIHBhdGNoIHNlcmllcyBmb3IgdGhlIGZsYXNoIHdyaXRl
IGFuZCBlcmFzZSBjaGFuZ2VzIGFzIHY2Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVG9rdW5vcmkg
SWtlZ2FtaSA8aWtlZ2FtaUBhbGxpZWQtdGVsZXNpcy5jby5qcD4NCj4gQ2M6IEpvYWtpbSBUamVy
bmx1bmQgPEpvYWtpbS5UamVybmx1bmRAaW5maW5lcmEuY29tPg0KPiBDYzogQ2hyaXMgUGFja2hh
bSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiBDYzogQnJpYW4gTm9ycmlz
IDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+DQo+IENjOiBEYXZpZCBXb29kaG91c2UgPGR3
bXcyQGluZnJhZGVhZC5vcmc+DQo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBmcmVlLWVsZWN0cm9ucy5jb20+DQo+IENjOiBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXRAZ21h
aWwuY29tPg0KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4gQ2M6
IEN5cmlsbGUgUGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVuQHdlZGV2NHUuZnI+DQo+IENjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiANCj4gVG9rdW5vcmkgSWtlZ2FtaSAoNSk6DQo+
ICAgbXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSB3cml0ZSBidWZmZXIgdG8gY2hlY2sgY29y
cmVjdCB2YWx1ZQ0KPiAgIG10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2UgZGVmaW5pdGlvbiBu
YW1pbmcgdG8gcmV0cnkgd3JpdGUNCj4gICAgIG9wZXJhdGlvbg0KPiAgIG10ZDogY2ZpX2NtZHNl
dF8wMDAyOiBDaGFuZ2UgZXJhc2UgZnVuY3Rpb25zIHRvIHJldHJ5IGZvciBlcnJvcg0KPiAgIG10
ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2UgZXJhc2UgZnVuY3Rpb25zIHRvIGNoZWNrIGNoaXAg
Z29vZCBvbmx5DQo+ICAgbXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSBlcmFzZSBvbmUgYmxv
Y2sgdG8gZW5hYmxlIFhJUCBvbmNlDQo+IA0KPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNl
dF8wMDAyLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IC0t
DQo+IDIuMTYuMQ0KPiANCg==
