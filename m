Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H8tWw-0004g2-KP
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 02:23:55 -0500
Received: from ep_ms12_bk (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JC9006CHDUZOE@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 16:23:23 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JC900JJODUYJR@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 16:23:23 +0900 (KST)
Content-return: prohibited
Date: Mon, 22 Jan 2007 07:23:22 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] [MTD] OneNAND: Free the bad block table when the device is
	released
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Message-id: <27947815.92691169450602843.JavaMail.weblogic@ep_ml23>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQWRyaWFuLA0KDQpTZWUgYmVsb3cgY29tbWVudHMuDQoNClRoYW5rIHlvdSwNCkt5dW5nbWlu
IFBhcmsNCg0KDQpPbmVOQU5EIGRvZXMgMiBtZW1vcnkgYWxsb2NhdGlvbnMgZm9yIGJhZCBibG9j
ayBpbmZvcm1hdGlvbi4NCk9ubHkgb25lIG9mIHRoZW0gd2FzIGJlaW5nIGZyZWVkLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxleHQtYWRyaWFuLmh1bnRlckBub2tpYS5jb20+DQot
LS0NCiBkcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIHwgICAgNiArKysrKy0NCiBk
cml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgIHwgICAgNCArKy0tDQogMiBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvb25lbmFuZC9v
bmVuYW5kX2Jhc2UuYw0KaW5kZXggMGFkZTIzNy4uMzhhYTAxOSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYXNlLmMNCisrKyBiL2RyaXZlcnMvbXRkL29uZW5hbmQv
b25lbmFuZF9iYXNlLmMNCkBAIC0yMTMzLDggKzIxMzMsMTIgQEAgI2VuZGlmDQogCWRlbF9tdGRf
ZGV2aWNlIChtdGQpOw0KIA0KIAkvKiBGcmVlIGJhZCBibG9jayB0YWJsZSBtZW1vcnksIGlmIGFs
bG9jYXRlZCAqLw0KLQlpZiAodGhpcy0+YmJtKQ0KKwlpZiAodGhpcy0+YmJtKSB7DQorCQlzdHJ1
Y3QgYmJtX2luZm8gKmJibSA9IHRoaXMtPmJibTsNCisJCWlmIChiYm0tPmJidCkNCisJCQlrZnJl
ZShiYm0tPmJidCk7DQogCQlrZnJlZSh0aGlzLT5iYm0pOw0KKwl9DQoNCj0+IFdlIGp1c3QgdXNl
IGtmcmVlIGRpcmVjdGx5IHNpbmNlIHRoZSBrZnJlZSBhbHNvIGNoZWNrIHRoZSBhZGRyZXNzLg0K
DQogICAgICAgICAgIGtmcmVlKHRoaXMtPmJibS0+YmJ0KTsNCiAgICAgICAgICAga2ZyZWUodGhp
cy0+YmJtKTsNCg0KDQogCS8qIEJ1ZmZlciBhbGxvY2F0ZWQgYnkgb25lbmFuZF9zY2FuICovDQog
CWlmICh0aGlzLT5vcHRpb25zICYgT05FTkFORF9QQUdFQlVGX0FMTE9DKQ0KIAkJa2ZyZWUodGhp
cy0+cGFnZV9idWYpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFuZF9i
YnQuYyBiL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYnQuYw0KaW5kZXggOThmOGZkMS4u
OTBkYjhmNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYnQuYw0K
KysrIGIvZHJpdmVycy9tdGQvb25lbmFuZC9vbmVuYW5kX2JidC5jDQpAQCAtMTY4LDggKzE2OCw4
IEBAIHN0YXRpYyBpbnQgb25lbmFuZF9pc2JhZF9iYnQoc3RydWN0IG10ZF8NCiAgKiBtYXJrZWQg
Z29vZCAvIGJhZCBibG9ja3MgYW5kIHdyaXRlcyB0aGUgYmFkIGJsb2NrIHRhYmxlKHMpIHRvDQog
ICogdGhlIHNlbGVjdGVkIHBsYWNlLg0KICAqDQotICogVGhlIGJhZCBibG9jayB0YWJsZSBtZW1v
cnkgaXMgYWxsb2NhdGVkIGhlcmUuIEl0IG11c3QgYmUgZnJlZWQNCi0gKiBieSBjYWxsaW5nIHRo
ZSBvbmVuYW5kX2ZyZWVfYmJ0IGZ1bmN0aW9uLg0KKyAqIFRoZSBiYWQgYmxvY2sgdGFibGUgbWVt
b3J5IGlzIGFsbG9jYXRlZCBoZXJlLiBJdCBpcyBmcmVlZA0KKyAqIGJ5IHRoZSBvbmVuYW5kX3Jl
bGVhc2UgZnVuY3Rpb24uDQogICoNCiAgKi8NCiBpbnQgb25lbmFuZF9zY2FuX2JidChzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfYmJ0X2Rlc2NyICpiZCkNCi0tIA0KMS40LjMNCg0K
DQoNCg==
