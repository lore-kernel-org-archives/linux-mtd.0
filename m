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
Subject: [PATCH 10/12] mtd: nand_bbt: remove NAND_BBT_DYNAMICSTRUCT macro
Date: Fri, 25 Sep 2015 06:46:22 +0000
Message-ID: <87F60714EC601C4C83DFF1D2E3D390A0326CC8FF@NTXXIAMBX02.xacn.micron.com>
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

bmFuZF9iYnQgZG9lc24ndCBuZWVkIG5hbmQgYmFkYmxvY2tfcGF0dGVybiBhbnkgbW9yZS4gU28g
cmVtb3ZlDQpOQU5EX0JCVF9EWU5BTUlDU1RSVUNUIGZyb20gbmFuZF9iYnQuaA0KDQpTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4NCi0tLQ0K
IGluY2x1ZGUvbGludXgvbXRkL25hbmRfYmJ0LmggfCA3IC0tLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgNyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL25hbmRf
YmJ0LmggYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5kX2JidC5oDQppbmRleCA0OGEwNjIwLi5lODU1
OTZmIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvbmFuZF9iYnQuaA0KKysrIGIvaW5j
bHVkZS9saW51eC9tdGQvbmFuZF9iYnQuaA0KQEAgLTEwNywxMyArMTA3LDYgQEAgc3RydWN0IG5h
bmRfYmJ0X2Rlc2NyIHsNCiAgKi8NCiAjZGVmaW5lIE5BTkRfQkJUX05PX09PQl9CQk0JMHgwMDA4
MDAwMA0KIA0KLS8qDQotICogRmxhZyBzZXQgYnkgbmFuZF9jcmVhdGVfZGVmYXVsdF9iYnRfZGVz
Y3IoKSwgbWFya2luZyB0aGF0IHRoZSBuYW5kX2JidF9kZXNjcg0KLSAqIHdhcyBhbGxvY2F0ZWQg
ZHluYW1pY2FseSBhbmQgbXVzdCBiZSBmcmVlZCBpbiBuYW5kX3JlbGVhc2UoKS4gSGFzIG5vIG1l
YW5pbmcNCi0gKiBpbiBuYW5kX2NoaXAuYmJ0X29wdGlvbnMuDQotICovDQotI2RlZmluZSBOQU5E
X0JCVF9EWU5BTUlDU1RSVUNUCTB4ODAwMDAwMDANCi0NCiAvKiBUaGUgbWF4aW11bSBudW1iZXIg
b2YgYmxvY2tzIHRvIHNjYW4gZm9yIGEgYmJ0ICovDQogI2RlZmluZSBOQU5EX0JCVF9TQ0FOX01B
WEJMT0NLUwk0DQogDQotLSANCjEuOS4xDQo=
