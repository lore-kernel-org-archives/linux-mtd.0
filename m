Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFDC7EE23
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Jun 2023 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h/LsWI+BAOMwpf/z3k3TZcyEUGmhI92i/aYoaF8pULE=; b=fJZWCRG24LgU2I
	Pd3JmHviUSto5hKIrlkBUAxSwkok8vJf0PskGy42DemFR/ABO+FKWNjW1f3gfBSusTut4e7+wndCU
	+hDR4WbyOdpeoJSJFIuGon4mlTSrsewJUHNsTM9XbkevmKtOzZISM7mSWa4Gje4h30/ggwtnftpU1
	sIn0VsxEkNsNO5riHncl7z7jzHI1L17Hb+MbFqkC0A6j/50V3fw1tN/8kk/Qw4BWBjAA3X1XIwFOa
	dO1ZC3U7roba8dgejKB+RASAPC6Wq/ZFlj74KFwHfcnuC3wbs69EKhHPqYQCuR98jNow58HsLnjzx
	SyON78j1Iu6HmNijDapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Rud-001jTy-2u;
	Sun, 11 Jun 2023 20:43:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8RuZ-001jRl-2w
	for linux-mtd@lists.infradead.org;
	Sun, 11 Jun 2023 20:43:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8RuR-0001Y7-8f; Sun, 11 Jun 2023 22:43:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8RuP-006jQB-HQ; Sun, 11 Jun 2023 22:43:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8RuO-00DIJQ-Qe; Sun, 11 Jun 2023 22:43:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] mtd: maps: pismo: Switch back to use i2c_driver's .probe()
Date: Sun, 11 Jun 2023 22:43:27 +0200
Message-Id: <20230611204327.828122-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eV1upzG3BHqeyAZP1Dmv/RvxHBmR41WU7xQXGTwVZg8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkhjHuSp+Eo/brVJdj73xqwS593HF3S50CyW7kA BcW3ojN4e2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIYx7gAKCRCPgPtYfRL+ Ttn0B/0cdI/znDbdVUMTtWnYEkcYN7PxHgVd/9QhR5GHa/xvQqTqEhlfIJpNsR8q4NGmOGS4XEQ cWXlGhrz/xOXmF+hB4qTP2z4W8NZhOUQlIUD95yLK4S/Vaq/BsMJ4xlhi/BkJrOghAfmT8YIFb/ gmbVAs47pulO5YkoN+M8skSHT9X7nZc+ebY8EgsSBncabIBcsIPCzlopiTFD2X/XDE+UWjVmdSi m9rQVLk/aoexl4L4+eI7I82HK+Kq+pe5lEVnaYQHx+IGEIasHbDYWD3zt2880nrD4FHuDFdfLAe CnXcOx5avOH0NBqecQAVlvzTABcNr2YxjYv9C8ayWzGVNUUK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_134343_945407_2ABF91BE 
X-CRM114-Status: GOOD (  12.29  )
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

QWZ0ZXIgY29tbWl0IGI4YTFhNGNkNWE5OCAoImkyYzogUHJvdmlkZSBhIHRlbXBvcmFyeSAucHJv
YmVfbmV3KCkKY2FsbC1iYWNrIHR5cGUiKSwgYWxsIGRyaXZlcnMgYmVpbmcgY29udmVydGVkIHRv
IC5wcm9iZV9uZXcoKSBhbmQgdGhlbgpjb21taXQgMDNjODM1ZjQ5OGI1ICgiaTJjOiBTd2l0Y2gg
LnByb2JlKCkgdG8gbm90IHRha2UgYW4gaWQgcGFyYW1ldGVyIikKY29udmVydCBiYWNrIHRvICh0
aGUgbmV3KSAucHJvYmUoKSB0byBiZSBhYmxlIHRvIGV2ZW50dWFsbHkgZHJvcAoucHJvYmVfbmV3
KCkgZnJvbSBzdHJ1Y3QgaTJjX2RyaXZlci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tdGQvbWFw
cy9waXNtby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbWFwcy9waXNtby5jIGIvZHJpdmVycy9t
dGQvbWFwcy9waXNtby5jCmluZGV4IDNlMGZmZjNmMTI5ZS4uZWNmNjg5MjJkYTczIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9tYXBzL3Bpc21vLmMKKysrIGIvZHJpdmVycy9tdGQvbWFwcy9waXNt
by5jCkBAIC0yNTksNyArMjU5LDcgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIHBpc21vX2Ry
aXZlciA9IHsKIAkuZHJpdmVyCT0gewogCQkubmFtZQk9ICJwaXNtbyIsCiAJfSwKLQkucHJvYmVf
bmV3CT0gcGlzbW9fcHJvYmUsCisJLnByb2JlCQk9IHBpc21vX3Byb2JlLAogCS5yZW1vdmUJCT0g
cGlzbW9fcmVtb3ZlLAogCS5pZF90YWJsZQk9IHBpc21vX2lkLAogfTsKCmJhc2UtY29tbWl0OiA1
M2FiNjk3NWMxMmQxYWQ4NmM1OTlhODkyN2U4YzY5OGIxNDRkNjY5Ci0tIAoyLjM5LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
