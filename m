Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA15C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCSQG2xPwkaBQ/afl4Nf1O9oMxbX7xEXmmc4HF8Nu6s=; b=dBl6Q3NrKzoEi2
	8FwazCFsklwyJzwFo1ho+UNHKXnfKg5JH/sAQ9QXevvovNGefn5b3Q/ldowrHcF+jwM58mPByj72q
	7tNoio6/2khcPRRIY2+6xEJY85glE3MruSGbzj/brx8VAjpgI7zWdEaS5MQv54/1Y0azHsSz2F1KZ
	Y6Ma40SCKFAdMptwESluCDo9M082aprMS5B8dqM/Uo189ZTyXgTcX8slNqUTYvWIaiTdEaCqYUPtB
	VfIQ35thKpqxhvtv3xGqIgfu+dvZUc6axQCtWbdraZLJmjljS55iBuUl0eTlbYPD2+O/vRU+WNyUK
	U8k1Y/KmYd7MLp+ckeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyv-00AtBj-0x;
	Sat, 01 Apr 2023 16:21:33 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxf-00AsIv-0P
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jrJiyKZF9kqAhMV8Ti7tWzbfe4xxL2DeSQ69bt3YA6w=; b=qvH8WZWzA+c4tVjREtX/LStBOf
	yrlbep6gEXHblJDYLQpPukv5k51OP05mWVXLd6pcwsfFqEttd9OJKir7uUK5a+1MPHsLXQXBd1fni
	+s6q2e5wBCOV+zZYYqXaD9AMeZnEfA2RRV6mupebRSCpd5jYwuuUGu3iAC5p93Vedsk7qLVKb8tsN
	91gWganx3sgLV/R1CBGe/P4WPIwK+KUkUT9xSUQ6x01S/WLtXIlYyVQ4CO/PYL+0/50TfiktWb2fj
	AJcJ2EKDh674reMaOSeGIz5uf5ItxXVK0QtRaqywdiqVmq4Kz6Y/eYMngWO8UiBba8I+LS7BXqi2W
	Nc2CD82g==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-008DKt-0w
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-0008S4-Bh; Sat, 01 Apr 2023 18:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GSK-Gc; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-009khJ-Jz; Sat, 01 Apr 2023 18:19:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 35/49] mtd: rawnand: pasemi: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:24 +0200
Message-Id: <20230401161938.2503204-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rgBV6881M98FXTWkqugpWL04vASk/F42pNRXrgmXIWk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlFJ9oxzlBlf6V4uTLw8WDLIk+Qvk0gKyb+M wjxdszSaFSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZRQAKCRCPgPtYfRL+ TiQUB/9f+dwzu29y0r/j5ted0svXmvaEHiC+MlWSlj/nK9NVZqxxwKw99FM4IQ3s34LlU3pJg/k UA4+IGON9Ir13kD/fIdTlUbP94dEsgB5HIVmrXL0heMSQtCzD52+JLzPF2SsxTRbjbJex4nJ30/ J7YHSknMp+/YxxiSQ7EGUizkyqUik7ukQddRG/M2vRHYABPOjCYrHplIqIjC7UG6IxVCdELMwVX /idcZYLWVa1q/mPDfJ/oI145YckPNLC0bDg6hLwSDttYmqkGiOGlD3K/UOG09jasKyO7yN3iIcE jHEElVa56NFF/K99yYQr690k4B4ntGoYzQKxE4pPPdkcOefh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_607636_46F9C121 
X-CRM114-Status: GOOD (  15.82  )
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
dmVycy9tdGQvbmFuZC9yYXcvcGFzZW1pX25hbmQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Bhc2VtaV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wYXNlbWlf
bmFuZC5jCmluZGV4IGY3ZWY2Y2EwNmNhOS4uMTliMmM5ZDI1ODYzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9wYXNlbWlfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Bhc2VtaV9uYW5kLmMKQEAgLTE5Nyw3ICsxOTcsNyBAQCBzdGF0aWMgaW50IHBhc2VtaV9uYW5k
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQogCXJldHVybiBlcnI7CiB9CiAK
LXN0YXRpYyBpbnQgcGFzZW1pX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9m
ZGV2KQorc3RhdGljIHZvaWQgcGFzZW1pX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKm9mZGV2KQogewogCXN0cnVjdCBwYXNlbWlfZGRhdGEgKmRkYXRhID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEob2ZkZXYpOwogCXN0cnVjdCBtdGRfaW5mbyAqcGFzZW1pX25hbmRfbXRkOwpAQCAt
MjE4LDggKzIxOCw2IEBAIHN0YXRpYyBpbnQgcGFzZW1pX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKm9mZGV2KQogCiAJLyogRnJlZSB0aGUgTVREIGRldmljZSBzdHJ1Y3R1cmUg
Ki8KIAlrZnJlZShkZGF0YSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcGFzZW1pX25hbmRfbWF0Y2hbXSA9CkBAIC0yMzksNyArMjM3LDcgQEAg
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcGFzZW1pX25hbmRfZHJpdmVyID0KIAkJLm9m
X21hdGNoX3RhYmxlID0gcGFzZW1pX25hbmRfbWF0Y2gsCiAJfSwKIAkucHJvYmUJCT0gcGFzZW1p
X25hbmRfcHJvYmUsCi0JLnJlbW92ZQkJPSBwYXNlbWlfbmFuZF9yZW1vdmUsCisJLnJlbW92ZV9u
ZXcJPSBwYXNlbWlfbmFuZF9yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHBh
c2VtaV9uYW5kX2RyaXZlcik7Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
