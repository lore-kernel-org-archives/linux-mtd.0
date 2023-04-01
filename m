Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBE0C761AF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLNIUPxNiCwlR8dCm99xYEMkQwAhYK5MKuPNqBQFYAI=; b=lsuqVwylKBneNi
	O+Ishi0vNRxZ9VZXlLpyYut8lhbBlQxEHuNpq2DEkNi3ud7nsI4lR0krP5TooYWQy3fzcjzm5DUJb
	APhQYWWf+uedHtzLIGV+kyGlnlEEPl/yCHQyoHK0z8aGzO+hf3yJUjAkkMS4mICTJvEBt05Btl/4o
	8kqq0YDmHiZc6riqQ/p1J97mOYBgMDI85VISm9frNiYwPVyxHmqUy56KZXoL7uETg/ub2494EKRqR
	eR7y/KSJo6yUKc8Y6Rlm+a5/QPBqMZfUBMvBSSCBbHrhn8JP1cCqEyE430WHGFI9GyejiL1CeJpWP
	WQFkLNWZDBQQNVMOV4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxe-00AsHY-2w;
	Sat, 01 Apr 2023 16:20:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-00As9C-2h
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-0008DG-44; Sat, 01 Apr 2023 18:19:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-008GQf-7w; Sat, 01 Apr 2023 18:19:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-009kg2-D0; Sat, 01 Apr 2023 18:19:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 15/49] mtd: rawnand: fsl_upm: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:04 +0200
Message-Id: <20230401161938.2503204-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yZE5CDDd1iHrEXra21mbM2Q2IlKf1WeY/qLOyXhxXPY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkBuKSQuzHYVuWYWkbgZubytAFdDzQS0/uIF nMwAId9g0iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZAQAKCRCPgPtYfRL+ To5yB/9Kch4YmPlaxNgI4BDaMBTgZ4BWKnx6lYQZzINRHiWUBX6R+ENE9q3gT9HHWVz+GdX7Nae KOlT80PN6lIVn5JWNiW/CpQ/BZFrIR6LN8g57JiWmqj4JoY5AU/jMA3xuf0InHEsgjLm3boWBj8 6zc8JG7l1jff/3iCBHxwXU8Ngg3ovbhkWpHe71YU7Qs9PNU5BdFnVMGSrG+rTYOeNAaEJyiE0Wx +kUToRlZ+tREZ7U1+dN81bwTPE1FL4m6yimAl0R6dm8xhAUuUGhrvMlGJZ375a9M5jQOFxc41jR 9Bz7kPgsVdU/Rzx0/rR27buBJpHOZ40+j3touX76lyt51yVa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092006_901977_9D2C4EB2 
X-CRM114-Status: GOOD (  15.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvZnNsX3VwbS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZnNsX3VwbS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX3VwbS5jCmluZGV4
IGIzY2M0MjcxMDBhMi4uMDg2NDI2MTM5MTczIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9mc2xfdXBtLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX3VwbS5jCkBAIC0y
MzUsNyArMjM1LDcgQEAgc3RhdGljIGludCBmdW5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqb2ZkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgZnVuX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpvZmRldikKK3N0YXRpYyB2b2lkIGZ1bl9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqb2ZkZXYpCiB7CiAJc3RydWN0IGZzbF91cG1fbmFuZCAqZnVuID0gZGV2
X2dldF9kcnZkYXRhKCZvZmRldi0+ZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJmZ1
bi0+Y2hpcDsKQEAgLTI0NSw4ICsyNDUsNiBAQCBzdGF0aWMgaW50IGZ1bl9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpCiAJcmV0ID0gbXRkX2RldmljZV91bnJlZ2lzdGVyKG10
ZCk7CiAJV0FSTl9PTihyZXQpOwogCW5hbmRfY2xlYW51cChjaGlwKTsKLQotCXJldHVybiAwOwog
fQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9mdW5fbWF0Y2hbXSA9IHsK
QEAgLTI2MSw3ICsyNTksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBvZl9mdW5f
ZHJpdmVyID0gewogCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9mdW5fbWF0Y2gsCiAJfSwKIAkucHJv
YmUJCT0gZnVuX3Byb2JlLAotCS5yZW1vdmUJCT0gZnVuX3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9
IGZ1bl9yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG9mX2Z1bl9kcml2ZXIp
OwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
