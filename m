Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRzk9-0007sL-On
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 13:19:07 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "peron.clem@gmail.com" <peron.clem@gmail.com>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: spinand: Fix ECC status and OOB layout for Toshiba
 TC58CVG2S0H
Date: Wed, 28 Nov 2018 13:18:48 +0000
Message-ID: <1543411097-24229-1-git-send-email-frieder.schrempf@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3B53CE3B986244AB670E464E4AEC6C7@snt-world.com>
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

V2hlbiByZWFkaW5nIHRoZSBzdGF0dXMgb2YgdGhlIG9uLWNoaXAgRUNDLCB0aGUgVG9zaGliYSBj
aGlwIHJldHVybnMNCnR3byBkaWZmZXJlbnQgc3RhdGVzIGZvciByZXBvcnRpbmcgY29ycmVjdGVk
IGJpdGZsaXBzLiBXZSBzaG91bGQgY2hlY2sNCmZvciBib3RoIG9mIHRoZW0uDQoNCkFsc28gcmV0
dXJuIHRoZSBmcmVlIE9PQiBieXRlcyBhcyBvbmUgY29udGlndW91cyBhcmVhLCBpbnN0ZWFkIG9m
DQptdWx0aXBsZSBzZWN0aW9ucy4NCg0KU3VnZ2VzdGVkLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBl
cm9uLmNsZW1AZ21haWwuY29tPg0KU2lnbmVkLW9mZi1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJp
ZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPg0KLS0tDQogZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9z
aGliYS5jIHwgMTAgKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS90b3No
aWJhLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS90b3NoaWJhLmMNCmluZGV4IDI5NGJjZjYuLjk3
MzE3NTIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS90b3NoaWJhLmMNCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYw0KQEAgLTExLDYgKzExLDcgQEANCiAjaW5j
bHVkZSA8bGludXgvbXRkL3NwaW5hbmQuaD4NCiANCiAjZGVmaW5lIFNQSU5BTkRfTUZSX1RPU0hJ
QkEJCTB4OTgNCisjZGVmaW5lIFRPU0hfU1RBVFVTX0VDQ19IQVNfQklURkxJUFNfVAkoMyA8PCA0
KQ0KIA0KIHN0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRTKHJlYWRfY2FjaGVfdmFyaWFudHMsDQog
CQlTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1g0X09QKDAsIDEsIE5VTEwsIDApLA0KQEAg
LTMzLDE5ICszNCwxNyBAQCBzdGF0aWMgaW50IHRjNThjdmcyczBoX29vYmxheW91dF9lY2Moc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLA0KIAlyZWdpb24tPm9mZnNldCA9IDEyOCAr
IDE2ICogc2VjdGlvbjsNCiAJcmVnaW9uLT5sZW5ndGggPSAxNjsNCiANCi0NCiAJcmV0dXJuIDA7
DQogfQ0KIA0KIHN0YXRpYyBpbnQgdGM1OGN2ZzJzMGhfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10
ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLA0KIAkJCQkgICAgICBzdHJ1Y3QgbXRkX29vYl9yZWdp
b24gKnJlZ2lvbikNCiB7DQotCWlmIChzZWN0aW9uID4gNykNCisJaWYgKHNlY3Rpb24gPiAwKQ0K
IAkJcmV0dXJuIC1FUkFOR0U7DQogDQotCXJlZ2lvbi0+b2Zmc2V0ID0gMiArIDE2ICogc2VjdGlv
bjsNCi0JcmVnaW9uLT5sZW5ndGggPSAxNDsNCi0NCisJcmVnaW9uLT5vZmZzZXQgPSAyOw0KKwly
ZWdpb24tPmxlbmd0aCA9IDEyNjsNCiANCiAJcmV0dXJuIDA7DQogfQ0KQEAgLTcwLDYgKzY5LDcg
QEAgc3RhdGljIGludCB0YzU4Y3ZnMnMwaF9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2UgKnNwaW5hbmQsDQogCQlyZXR1cm4gLUVCQURNU0c7DQogDQogCWNhc2UgU1RBVFVTX0VD
Q19IQVNfQklURkxJUFM6DQorCWNhc2UgVE9TSF9TVEFUVVNfRUNDX0hBU19CSVRGTElQU19UOg0K
IAkJLyoNCiAJCSAqIExldCdzIHRyeSB0byByZXRyaWV2ZSB0aGUgcmVhbCBtYXhpbXVtIG51bWJl
ciBvZiBiaXRmbGlwcw0KIAkJICogaW4gb3JkZXIgdG8gYXZvaWQgZm9yY2luZyB0aGUgd2Vhci1s
ZXZlbGluZyBsYXllciB0byBtb3ZlDQotLSANCjIuNy40DQo=
