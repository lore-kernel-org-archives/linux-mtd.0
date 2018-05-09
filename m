Received: from mail1.bemta12.messagelabs.com ([216.82.251.9])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGPCm-0004jv-Dz
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 13:32:56 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: Change write buffer to check correct
 value
Date: Wed, 9 May 2018 13:32:11 +0000
Message-ID: <TY1PR01MB09542BAFA49897752D5A5B30DC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180508044142.4159-1-ikegami@allied-telesis.co.jp>
 <20180508044534.4226-1-smtpuser@allied-telesis.co.jp>
 <TY1PR01MB0954BFF431218DC5E2E8F3A2DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB0954BFF431218DC5E2E8F3A2DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
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

RnJvbTogVG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaUBhbGxpZWQtdGVsZXNpcy5jby5qcD4NCg0K
Rm9yIHRoZSB3b3JkIHdyaXRlIGl0IGlzIGNoZWNrZWQgaWYgdGhlIGNoaXAgaGFzIHRoZSBjb3Jy
ZWN0IHZhbHVlLg0KQnV0IGl0IGlzIG5vdCBjaGVja2VkIGZvciB0aGUgd3JpdGUgYnVmZmVyIGFz
IG9ubHkgY2hlY2tlZCBpZiByZWFkeS4NClRvIG1ha2Ugc3VyZSBmb3IgdGhlIHdyaXRlIGJ1ZmZl
ciBjaGFuZ2UgdG8gY2hlY2sgdGhlIHZhbHVlLg0KDQpJdCBpcyBlbm91Z2ggYXMgdGhpcyBwYXRj
aCBpcyBvbmx5IGNoZWNraW5nIHRoZSBsYXN0IHdyaXR0ZW4gd29yZC4NClNpbmNlIGl0IGlzIGRl
c2NyaWJlZCBieSBkYXRhIHNoZWV0cyB0byBjaGVjayB0aGUgb3BlcmF0aW9uIHN0YXR1cy4NCg0K
U2lnbmVkLW9mZi1ieTogVG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaUBhbGxpZWQtdGVsZXNpcy5j
by5qcD4NCkNjOiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28u
bno+DQpDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+DQpDYzog
RGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPg0KQ2M6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4NCkNjOiBNYXJlayBWYXN1dCA8
bWFyZWsudmFzdXRAZ21haWwuY29tPg0KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBu
b2QuYXQ+DQpDYzogQ3lyaWxsZSBQaXRjaGVuIDxjeXJpbGxlLnBpdGNoZW5Ad2VkZXY0dS5mcj4N
CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KLS0tDQogZHJpdmVycy9tdGQvY2hp
cHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlf
Y21kc2V0XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jDQppbmRl
eCA1NmFhNmI3NTIxM2QuLjVlOWYyY2EwYTZjMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jDQorKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYw0KQEAgLTE4NzksNyArMTg3OSw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0gZG9fd3Jp
dGVfYnVmZmVyKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLA0KICAg
ICAgICAgICAgICAgIGlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSAmJiAhY2hpcF9yZWFk
eShtYXAsIGFkcikpDQogICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCg0KLSAgICAgICAg
ICAgICAgIGlmIChjaGlwX3JlYWR5KG1hcCwgYWRyKSkgew0KKyAgICAgICAgICAgICAgIGlmIChj
aGlwX3JlYWR5KG1hcCwgYWRyKSAmJiBjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgew0KICAg
ICAgICAgICAgICAgICAgICAgICAgeGlwX2VuYWJsZShtYXAsIGNoaXAsIGFkcik7DQogICAgICAg
ICAgICAgICAgICAgICAgICBnb3RvIG9wX2RvbmU7DQogICAgICAgICAgICAgICAgfQ0KLS0NCjIu
MTYuMQ0KDQo=
