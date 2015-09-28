From: =?gb2312?B?QmVhbiBIdW8gu/Sx87HzIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com"
 <guz.fnst@cn.fujitsu.com>, "gsi@denx.de" <gsi@denx.de>, "richard@nod.at"
 <richard@nod.at>, Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?gb2312?B?RnJhbmsgTGl1IMH1yLogKGZyYW5rbGl1KQ==?= <frankliu@micron.com>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?gb2312?B?UGV0ZXIgUGFuIMXLsNi66iAocGV0ZXJwYW4p?= <peterpan@micron.com>,
 =?gb2312?B?S2FybCBaaGFuZyDVxcurwuAgKGthcmx6aGFuZyk=?= <karlzhang@micron.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/9] fs:ubifs: add hook for UBI bakvol in ubifs layer
Date: Mon, 28 Sep 2015 07:02:52 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4CEE8@NTXXIAMBX02.xacn.micron.com>
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

QWRkIGhvb2sgZm9yIFVCSSBiYWt2b2wgaW4gdWJpZnMgbGF5ZXIuDQoNCm9wZW4vY2xvc2UgYmFr
dm9sIG9wZXJhdGlvbiBpbiB1YmlmcyBtb3VudC4NCg0KU2lnbmVkLW9mZi1ieTogQmVhbiBIdW8g
PGJlYW5odW9AbWljcm9uLmNvbT4NCi0tLQ0KIGZzL3ViaWZzL3N1cGVyLmMgfCA2ICsrKysrKw0K
IGZzL3ViaWZzL3ViaWZzLmggfCAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvc3VwZXIuYyBiL2ZzL3ViaWZzL3N1cGVyLmMNCmlu
ZGV4IDk1NDdhMjc4Li5mM2JmNTQ4IDEwMDY0NA0KLS0tIGEvZnMvdWJpZnMvc3VwZXIuYw0KKysr
IGIvZnMvdWJpZnMvc3VwZXIuYw0KQEAgLTE0NjMsNiArMTQ2Myw4IEBAIHN0YXRpYyBpbnQgbW91
bnRfdWJpZnMoc3RydWN0IHViaWZzX2luZm8gKmMpDQogCWRiZ19nZW4oIm1heC4gc2VxLiBudW1i
ZXI6ICAgICVsbHUiLCBjLT5tYXhfc3FudW0pOw0KIAlkYmdfZ2VuKCJjb21taXQgbnVtYmVyOiAg
ICAgICAlbGx1IiwgYy0+Y210X25vKTsNCiANCisJaW5pdF9iYWt2b2woYy0+dWJpLCAxKTsNCisN
CiAJcmV0dXJuIDA7DQogDQogb3V0X2luZm9zOg0KQEAgLTE3NzQsNiArMTc3NiwxMCBAQCBzdGF0
aWMgdm9pZCB1Ymlmc19wdXRfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYikNCiAJICogdGhl
IG11dGV4IGlzIGxvY2tlZC4NCiAJICovDQogCW11dGV4X2xvY2soJmMtPnVtb3VudF9tdXRleCk7
DQorDQorCS8qIERpc2FibGUgdWJpIE1MQyBwb3dlciBsb3NzIGJhY2t1cCBmdW5jdGlvbiAqLw0K
Kwlpbml0X2Jha3ZvbChjLT51YmksIDApOw0KKw0KIAlpZiAoIWMtPnJvX21vdW50KSB7DQogCQkv
Kg0KIAkJICogRmlyc3Qgb2YgYWxsIGtpbGwgdGhlIGJhY2tncm91bmQgdGhyZWFkIHRvIG1ha2Ug
c3VyZSBpdCBkb2VzDQpkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvdWJpZnMuaCBiL2ZzL3ViaWZzL3Vi
aWZzLmgNCmluZGV4IGRlNzU5MDIuLjRhZjJkNWEgMTAwNjQ0DQotLS0gYS9mcy91Ymlmcy91Ymlm
cy5oDQorKysgYi9mcy91Ymlmcy91Ymlmcy5oDQpAQCAtMTQ3OSw2ICsxNDc5LDcgQEAgZXh0ZXJu
IGNvbnN0IHN0cnVjdCBpbm9kZV9vcGVyYXRpb25zIHViaWZzX2Rpcl9pbm9kZV9vcGVyYXRpb25z
Ow0KIGV4dGVybiBjb25zdCBzdHJ1Y3QgaW5vZGVfb3BlcmF0aW9ucyB1Ymlmc19zeW1saW5rX2lu
b2RlX29wZXJhdGlvbnM7DQogZXh0ZXJuIHN0cnVjdCBiYWNraW5nX2Rldl9pbmZvIHViaWZzX2Jh
Y2tpbmdfZGV2X2luZm87DQogZXh0ZXJuIHN0cnVjdCB1Ymlmc19jb21wcmVzc29yICp1Ymlmc19j
b21wcmVzc29yc1tVQklGU19DT01QUl9UWVBFU19DTlRdOw0KK2V4dGVybiB2b2lkIGluaXRfYmFr
dm9sKHN0cnVjdCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2MsIHVpbnQ4X3QgY2hvaWNlKTsNCiANCiAv
KiBpby5jICovDQogdm9pZCB1Ymlmc19yb19tb2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQg
ZXJyKTsNCi0tIA0KMS45LjENCg==
