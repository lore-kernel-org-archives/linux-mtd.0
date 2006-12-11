Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gta3v-0002bu-2Q
	for linux-mtd@lists.infradead.org; Sun, 10 Dec 2006 20:34:38 -0500
Received: from ep_ms12_bk (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JA300B775PIB5@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 11 Dec 2006 10:34:30 +0900 (KST)
Received: from ep_spt03 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JA300B5U5PIWV@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 11 Dec 2006 10:34:30 +0900 (KST)
Content-return: prohibited
Date: Mon, 11 Dec 2006 01:34:23 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [MTD] OneNAND: fix oob handling in recent oob patch
To: linux-mtd@lists.infradead.org
Message-id: <6618222.25151165800869993.JavaMail.weblogic@ep_ml29>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: base64
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

W01URF0gT25lTkFORDogZml4IG9vYiBoYW5kbGluZyBpbiByZWNlbnQgb29iIHBhdGNoDQoNClRo
ZXJlIGFyZSBtaXNzaW5nIHBsYWNlIGluIHJlY2VudCBNVEQgb29iIHBhdGNoDQoNCmh0dHA6Ly9n
aXQuaW5mcmFkZWFkLm9yZy8/cD1tdGQtMi42LmdpdDthPWNvbW1pdGRpZmY7aD03MDE0NTY4YmFk
NTVjMjBiN2VlNGY0MzlkNzhjOWU4NzU5MTJkNTFmDQoNClNpZ25lZC1vZmYtYnk6IEt5dW5nbWlu
IFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvb25lbmFuZC9vbmVuYW5k
X2Jhc2UuYw0KaW5kZXggYzQ4YWE3OS4uNjNjYTYxYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbXRk
L29uZW5hbmQvb25lbmFuZF9iYXNlLmMNCisrKyBiL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFu
ZF9iYXNlLmMNCkBAIC04NzEsOCArODcxLDggQEAgc3RhdGljIGludCBvbmVuYW5kX3JlYWRfb29i
KHN0cnVjdCBtdGRfaQ0KIHsNCiAJQlVHX09OKG9wcy0+bW9kZSAhPSBNVERfT09CX1BMQUNFKTsN
CiANCi0JcmV0dXJuIG9uZW5hbmRfZG9fcmVhZF9vb2IobXRkLCBmcm9tICsgb3BzLT5vb2JvZmZz
LCBvcHMtPmxlbiwNCi0JCQkJICAgJm9wcy0+cmV0bGVuLCBvcHMtPm9vYmJ1Zik7DQorCXJldHVy
biBvbmVuYW5kX2RvX3JlYWRfb29iKG10ZCwgZnJvbSArIG9wcy0+b29ib2Zmcywgb3BzLT5vb2Js
ZW4sDQorCQkJCSAgICZvcHMtPm9vYnJldGxlbiwgb3BzLT5vb2JidWYpOw0KIH0NCiANCiAjaWZk
ZWYgQ09ORklHX01URF9PTkVOQU5EX1ZFUklGWV9XUklURQ0KQEAgLTExMTQsOCArMTExNCw4IEBA
IHN0YXRpYyBpbnQgb25lbmFuZF93cml0ZV9vb2Ioc3RydWN0IG10ZF8NCiB7DQogCUJVR19PTihv
cHMtPm1vZGUgIT0gTVREX09PQl9QTEFDRSk7DQogDQotCXJldHVybiBvbmVuYW5kX2RvX3dyaXRl
X29vYihtdGQsIHRvICsgb3BzLT5vb2JvZmZzLCBvcHMtPmxlbiwNCi0JCQkJICAgICZvcHMtPnJl
dGxlbiwgb3BzLT5vb2JidWYpOw0KKwlyZXR1cm4gb25lbmFuZF9kb193cml0ZV9vb2IobXRkLCB0
byArIG9wcy0+b29ib2Zmcywgb3BzLT5vb2JsZW4sDQorCQkJCSAgICAmb3BzLT5vb2JyZXRsZW4s
IG9wcy0+b29iYnVmKTsNCiB9DQogDQogLyoqDQo=
