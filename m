From: =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "fransklaver@gmail.com"
 <fransklaver@gmail.com>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "baruch@tkos.co.il"
 <baruch@tkos.co.il>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, "kdasu.kdev@gmail.com"
 <kdasu.kdev@gmail.com>, "rogerq@ti.com" <rogerq@ti.com>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, bpqw <bpqw@micron.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?gb2312?B?RnJhbmsgTGl1IMH1yLogKGZyYW5rbGl1KQ==?= <frankliu@micron.com>,
 =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>, Kamil Debski <Kamil.Debski@imgtec.com>, "Ionela
 Voinescu" <Ionela.Voinescu@imgtec.com>,
 =?gb2312?B?QmVhbiBIdW8gu/Sx87HzIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Subject: [PATCH 11/12] mtd: nand: remove nand_chip.bbt
Date: Fri, 25 Sep 2015 06:47:09 +0000
Message-ID: <87F60714EC601C4C83DFF1D2E3D390A0326CC90F@NTXXIAMBX02.xacn.micron.com>
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

V2l0aCBuZXcgbmFuZF9iYnQuYywgbmFuZF9jaGlwIGRvZXNuJ3QgbmVlZCBiYnQgZWxlbWVudCBh
bnkgbW9yZQ0KDQpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNl
QGdtYWlsLmNvbT4NCi0tLQ0KIGluY2x1ZGUvbGludXgvbXRkL25hbmQuaCB8IDIgLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bXRkL25hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQuaA0KaW5kZXggZmIzZjE0OC4uYmM0
OWYwNCAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvbXRkL25hbmQuaA0KKysrIGIvaW5jbHVk
ZS9saW51eC9tdGQvbmFuZC5oDQpAQCAtNjMyLDcgKzYzMiw2IEBAIHN0cnVjdCBuYW5kX2J1ZmZl
cnMgew0KICAqIEByZWFkX3JldHJpZXM6CVtJTlRFUk5dIHRoZSBudW1iZXIgb2YgcmVhZCByZXRy
eSBtb2RlcyBzdXBwb3J0ZWQNCiAgKiBAb25maV9zZXRfZmVhdHVyZXM6CVtSRVBMQUNFQUJMRV0g
c2V0IHRoZSBmZWF0dXJlcyBmb3IgT05GSSBuYW5kDQogICogQG9uZmlfZ2V0X2ZlYXR1cmVzOglb
UkVQTEFDRUFCTEVdIGdldCB0aGUgZmVhdHVyZXMgZm9yIE9ORkkgbmFuZA0KLSAqIEBiYnQ6CQlb
SU5URVJOXSBiYWQgYmxvY2sgdGFibGUgcG9pbnRlcg0KICAqIEBuYW5kX2JidDoJCVtJTlRFUk5d
IHBvaW50ZXIgdG8gYmFkIGJsb2NrIHRhYmxlIHN0cnVjdHVyZSwgd2hpY2gNCiAgKgkJCWluY2x1
ZGVzIGFsbCBpbmZvcm1hdGlvbiBuZWVkZWQgYnkgQmFkIEJsb2NrIE1hbmFnZW1lbnQNCiAgKiBA
YmJ0X3RkOgkJW1JFUExBQ0VBQkxFXSBiYWQgYmxvY2sgdGFibGUgZGVzY3JpcHRvciBmb3IgZmxh
c2gNCkBAIC03MjMsNyArNzIyLDYgQEAgc3RydWN0IG5hbmRfY2hpcCB7DQogCXN0cnVjdCBuYW5k
X2J1ZmZlcnMgKmJ1ZmZlcnM7DQogCXN0cnVjdCBuYW5kX2h3X2NvbnRyb2wgaHdjb250cm9sOw0K
IA0KLQl1aW50OF90ICpiYnQ7DQogCXN0cnVjdCBuYW5kX2JidCAqbmFuZF9iYnQ7DQogCXN0cnVj
dCBuYW5kX2JidF9kZXNjciAqYmJ0X3RkOw0KIAlzdHJ1Y3QgbmFuZF9iYnRfZGVzY3IgKmJidF9t
ZDsNCi0tIA0KMS45LjENCg==
