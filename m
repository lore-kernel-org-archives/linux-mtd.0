Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0fwc-0006Yr-5V
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 23:20:23 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ200K3C0T82WA0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 08:19:56 +0900 (KST)
Date: Tue, 07 Jan 2014 23:19:56 +0000 (GMT)
From: Eunbong Song <eunb.song@samsung.com>
Subject: [PATCH] mtd: nand: make more readable panic_nand_wait_ready() and
 nand_wait_ready()
To: computersforpeace@gmail.com, dwmw2@infradead.org
MIME-version: 1.0
Content-transfer-encoding: base64
Content-type: text/plain; charset=euc-kr
MIME-version: 1.0
Message-id: <19226555.341201389136795005.JavaMail.weblogic@epml09>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: eunb.song@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQpwYW5pY19uYW5kX3dhaXRfcmVhZHkoKSBhbmQgbmFuZF93YWl0X3JlYWR5KCkgY2FsbHMgZGV2
X3JlYWR5KCkgd2l0aG91dCBjaGVja2luZyBpZiBpdCBleGlzdHMuDQpUaGlzIHBhdGNoIGFkZCBj
aGVjayByb3V0aW5lIGRldl9yZWFkeSgpIGJlZm9yZSBydW4gZGV2X3JlYWR5KCkNCmFuZCB0aGlz
IG1ha2VzIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUNCg0KU2lnbmVkLW9mZi1ieTogRXVuYm9uZyBT
b25nIDxldW5iLnNvbmdAc2Ftc3VuZy5jb20+DQotLS0NCiBkcml2ZXJzL210ZC9uYW5kL25hbmRf
YmFzZS5jIHwgICAxMiArKysrKysrKy0tLS0NCiAxIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvbmFu
ZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jDQppbmRleCBiZDM5ZjdiLi4x
MTBkYjc4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYw0KKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYw0KQEAgLTQ3Myw4ICs0NzMsMTAgQEAgc3RhdGlj
IHZvaWQgcGFuaWNfbmFuZF93YWl0X3JlYWR5KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1bnNpZ25l
ZCBsb25nIHRpbWVvKQ0KIA0KIAkvKiBXYWl0IGZvciB0aGUgZGV2aWNlIHRvIGdldCByZWFkeSAq
Lw0KIAlmb3IgKGkgPSAwOyBpIDwgdGltZW87IGkrKykgew0KLQkJaWYgKGNoaXAtPmRldl9yZWFk
eShtdGQpKQ0KLQkJCWJyZWFrOw0KKwkJaWYoY2hpcC0+ZGV2X3JlYWR5KXsNCisJCQlpZiAoY2hp
cC0+ZGV2X3JlYWR5KG10ZCkpDQorCQkJCWJyZWFrOw0KKwkJfQ0KIAkJdG91Y2hfc29mdGxvY2t1
cF93YXRjaGRvZygpOw0KIAkJbWRlbGF5KDEpOw0KIAl9DQpAQCAtNDkzLDggKzQ5NSwxMCBAQCB2
b2lkIG5hbmRfd2FpdF9yZWFkeShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkNCiAJbGVkX3RyaWdnZXJf
ZXZlbnQobmFuZF9sZWRfdHJpZ2dlciwgTEVEX0ZVTEwpOw0KIAkvKiBXYWl0IHVudGlsIGNvbW1h
bmQgaXMgcHJvY2Vzc2VkIG9yIHRpbWVvdXQgb2NjdXJzICovDQogCWRvIHsNCi0JCWlmIChjaGlw
LT5kZXZfcmVhZHkobXRkKSkNCi0JCQlicmVhazsNCisJCWlmKGNoaXAtPmRldl9yZWFkeSl7DQor
CQkJaWYgKGNoaXAtPmRldl9yZWFkeShtdGQpKQ0KKwkJCQlicmVhazsNCisJCX0NCiAJCXRvdWNo
X3NvZnRsb2NrdXBfd2F0Y2hkb2coKTsNCiAJfSB3aGlsZSAodGltZV9iZWZvcmUoamlmZmllcywg
dGltZW8pKTsNCiAJbGVkX3RyaWdnZXJfZXZlbnQobmFuZF9sZWRfdHJpZ2dlciwgTEVEX09GRik7
DQotLSANCjEuNy4wLjQNCg==
