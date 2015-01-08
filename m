Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y91Uq-0001V3-Mz
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 01:02:45 +0000
Received: from mail.micron.com (ntxboicas04.micron.com [137.201.20.214])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id t0812M4h006164
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Wed, 7 Jan 2015 18:02:22 -0700
From: =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] mtd: spi-nand: add devicetree binding
Date: Thu, 8 Jan 2015 01:02:20 +0000
Message-ID: <87F60714EC601C4C83DFF1D2E3D390A04AB458@NTXXIAMBX02.xacn.micron.com>
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

VGhpcyBjb21taXQgYWRkcyB0aGUgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50IHRoYXQgc3Bl
Y2lmaWVzIHRoZQ0Kc3BpIG5hbmQgZGV2aWNlcyBzdXBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBQYW4gPHBldGVycGFuZG9uZ0BtaWNyb24uY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC50eHQgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC50eHQN
Cg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3Bp
LW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFu
ZC50eHQNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi45ZGQzZWZkDQotLS0g
L2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Nw
aS1uYW5kLnR4dA0KQEAgLTAsMCArMSwyMiBAQA0KKyogTkFORCBkcml2ZXIgZm9yIE1UMjlGLCBH
RDVGIGFuZCBzaW1pbGFyIFNQSSBOQU5EIGZsYXNoIGNoaXBzDQorDQorUmVxdWlyZWQgcHJvcGVy
dGllczoNCistICNhZGRyZXNzLWNlbGxzLCAjc2l6ZS1jZWxscyA6IE11c3QgYmUgcHJlc2VudCBp
ZiB0aGUgZGV2aWNlIGhhcyBzdWItbm9kZXMNCisgIHJlcHJlc2VudGluZyBwYXJ0aXRpb25zLg0K
Ky0gY29tcGF0aWJsZSA6IFNob3VsZCBiZSB0aGUgbWFudWZhY3R1cmVyIGFuZCB0aGUgbmFtZSBv
ZiB0aGUgY2hpcC4gQmVhciBpbiBtaW5kDQorICAgICAgICAgICAgICAgdGhlIERUIGJpbmRpbmcg
aXMgbm90IExpbnV4LW9ubHksIGJ1dCBpbiBjYXNlIG9mIExpbnV4LCBzZWUgdGhlDQorICAgICAg
ICAgICAgICAgInNwaV9uYW5kX2lkX3RhYmxlIiBhcnJheSBpbiBkcml2ZXJzL210ZC9zcGktbmFu
ZC9zcGktbmFuZC1kZXZpY2UuYw0KKyAgICAgICAgICAgICAgIGZvciB0aGUgbGlzdCBvZiBzdXBw
b3J0ZWQgY2hpcHMuDQorLSByZWcgOiBDaGlwLVNlbGVjdCBudW1iZXINCistIHNwaS1tYXgtZnJl
cXVlbmN5IDogTWF4aW11bSBmcmVxdWVuY3kgb2YgdGhlIFNQSSBidXMgdGhlIGNoaXAgY2FuIG9w
ZXJhdGUgYXQNCisNCitFeGFtcGxlOg0KKw0KKwlmbGFzaDogZmxhc2hAMCB7DQorCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCisJCSNzaXplLWNlbGxzID0gPDE+Ow0KKwkJY29tcGF0aWJsZSA9ICJt
aWNyb24sbXQyOWYiOw0KKwkJcmVnID0gPDA+Ow0KKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAw
MDAwMDA+Ow0KKwl9Ow0KKw0KLS0gDQoxLjkuMQ0K
