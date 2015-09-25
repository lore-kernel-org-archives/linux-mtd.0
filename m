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
Subject: [PATCH 07/12] mtd: nand: make nand_erase_nand() static
Date: Fri, 25 Sep 2015 06:43:06 +0000
Message-ID: <87F60714EC601C4C83DFF1D2E3D390A0326CC8C8@NTXXIAMBX02.xacn.micron.com>
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

bmFuZF9iYnQuYyBkb2Vzbid0IG5lZWQgdG8gY2FsbCBuYW5kX2VyYXNlX25hbmQoKSBhbnkgbW9y
ZS4NCg0KU2lnbmVkLW9mZi1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFp
bC5jb20+DQotLS0NCiBkcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jIHwgNSArKysrLQ0KIGlu
Y2x1ZGUvbGludXgvbXRkL25hbmQuaCAgICAgfCAyIC0tDQogMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYw0KaW5kZXggODA0
MzhhYi4uMDVhNTZhNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMN
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMNCkBAIC05Nyw2ICs5Nyw5IEBAIHN0
YXRpYyBpbnQgbmFuZF9nZXRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgbmV3X3N0
YXRlKTsNCiBzdGF0aWMgaW50IG5hbmRfZG9fd3JpdGVfb29iKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBsb2ZmX3QgdG8sDQogCQkJICAgICBzdHJ1Y3QgbXRkX29vYl9vcHMgKm9wcyk7DQogDQorc3Rh
dGljIGludCBuYW5kX2VyYXNlX25hbmQoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFz
ZV9pbmZvICppbnN0ciwNCisJCQkgICBpbnQgYWxsb3diYnQpOw0KKw0KIC8qDQogICogRm9yIGRl
dmljZXMgd2hpY2ggZGlzcGxheSBldmVyeSBmYXJ0IGluIHRoZSBzeXN0ZW0gb24gYSBzZXBhcmF0
ZSBMRUQuIElzDQogICogY29tcGlsZWQgYXdheSB3aGVuIExFRCBzdXBwb3J0IGlzIGRpc2FibGVk
Lg0KQEAgLTI4NjMsNyArMjg2Niw3IEBAIHN0YXRpYyBpbnQgbmFuZF9lcmFzZShzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgc3RydWN0IGVyYXNlX2luZm8gKmluc3RyKQ0KICAqDQogICogRXJhc2Ugb25l
IG9yZSBtb3JlIGJsb2Nrcy4NCiAgKi8NCi1pbnQgbmFuZF9lcmFzZV9uYW5kKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5zdHIsDQorc3RhdGljIGludCBuYW5kX2Vy
YXNlX25hbmQoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbnN0ciwN
CiAJCSAgICBpbnQgYWxsb3diYnQpDQogew0KIAlpbnQgcGFnZSwgc3RhdHVzLCBwYWdlc19wZXJf
YmxvY2ssIHJldCwgY2hpcG5yOw0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL25hbmQu
aCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQuaA0KaW5kZXggOTViM2YxNC4uNzk3YzI0YiAxMDA2
NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvbXRkL25hbmQuaA0KKysrIGIvaW5jbHVkZS9saW51eC9t
dGQvbmFuZC5oDQpAQCAtODQ5LDggKzg0OSw2IEBAIGV4dGVybiBzdHJ1Y3QgbmFuZF9tYW51ZmFj
dHVyZXJzIG5hbmRfbWFudWZfaWRzW107DQogZXh0ZXJuIGludCBuYW5kX21hcmtiYWRfYmJ0KHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2Zmcyk7DQogZXh0ZXJuIGludCBuYW5kX2lzcmVz
ZXJ2ZWRfYmJ0KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2Zmcyk7DQogZXh0ZXJuIGlu
dCBuYW5kX2lzYmFkX2JidChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mZnMsIGludCBh
bGxvd2JidCk7DQotZXh0ZXJuIGludCBuYW5kX2VyYXNlX25hbmQoc3RydWN0IG10ZF9pbmZvICpt
dGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbnN0ciwNCi0JCQkgICBpbnQgYWxsb3diYnQpOw0KIGV4
dGVybiBpbnQgbmFuZF9kb19yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwg
c2l6ZV90IGxlbiwNCiAJCQlzaXplX3QgKnJldGxlbiwgdWludDhfdCAqYnVmKTsNCiANCi0tIA0K
MS45LjENCg==
