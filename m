Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GwWtv-0000Aw-MQ
	for linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 23:48:32 -0500
Received: from ep_ms12_bk (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JAI00FMS80MDO@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 19 Dec 2006 13:48:22 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JAI007RK80M92@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 19 Dec 2006 13:48:22 +0900 (KST)
Content-return: prohibited
Date: Tue, 19 Dec 2006 04:48:22 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] JFFS2: fix wrong usage of ref->flash_offset
To: linux-mtd@lists.infradead.org
Message-id: <24827964.60341166503702620.JavaMail.weblogic@ep_ml29>
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

W01URF0gSkZGUzI6IGZpeCB3b3JuZyB1c2FnZSBvZiByZWYtZj5mbGFzaF9vZmZzZXQNCg0KV2Ug
dXNlIHRoZSByZWZfb2Zmc2V0IG1hY3JvIGluc3RlYWQgb2YgcmVmLT5mbGFzaF9vZmZzZXQuDQpJ
dCBtYWtlcyB0aGUgcHJvYmxlbSBpbiBkZWJ1ZyBtb2RlDQoNClNpZ25lZC1vZmYtYnk6IEt5dW5n
bWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+DQoNCi0tDQoNCmRpZmYgLS1naXQg
YS9mcy9qZmZzMi9kZWJ1Zy5jIGIvZnMvamZmczIvZGVidWcuYw0KaW5kZXggNzJiNGZjMS4uNDE4
OWU0YSAxMDA2NDQNCi0tLSBhL2ZzL2pmZnMyL2RlYnVnLmMNCisrKyBiL2ZzL2pmZnMyL2RlYnVn
LmMNCkBAIC0xNzgsOCArMTc4LDggQEAgX19qZmZzMl9kYmdfYWNjdF9wYXJhbm9pYV9jaGVja19u
b2xvY2soc3RydWN0IGpmZnMyX3NiX2luZm8gKmMsDQogCXdoaWxlIChyZWYyKSB7DQogCQl1aW50
MzJfdCB0b3RsZW4gPSByZWZfdG90bGVuKGMsIGplYiwgcmVmMik7DQogDQotCQlpZiAocmVmMi0+
Zmxhc2hfb2Zmc2V0IDwgamViLT5vZmZzZXQgfHwNCi0JCQkJcmVmMi0+Zmxhc2hfb2Zmc2V0ID4g
amViLT5vZmZzZXQgKyBjLT5zZWN0b3Jfc2l6ZSkgew0KKwkJaWYgKHJlZl9vZmZzZXQocmVmMikg
PCBqZWItPm9mZnNldCB8fA0KKwkJCQlyZWZfb2Zmc2V0KHJlZjIpID4gamViLT5vZmZzZXQgKyBj
LT5zZWN0b3Jfc2l6ZSkgew0KIAkJCUpGRlMyX0VSUk9SKCJub2RlX3JlZiAlIzA4eCBzaG91bGRu
J3QgYmUgaW4gYmxvY2sgYXQgJSMwOHguXG4iLA0KIAkJCQlyZWZfb2Zmc2V0KHJlZjIpLCBqZWIt
Pm9mZnNldCk7
