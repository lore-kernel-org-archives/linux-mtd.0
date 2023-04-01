Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC05C761AF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oJbiIkRfSuTNUMaBj5n/wFGI3/gr2cPVB0XMnSWkhI=; b=Xz5TySztgBWFHW
	KDeV8vAN+4oxV3DVs4ePYKuqZTNAq4FkYqhk8Q22I7lzQTjHgTfEbZxeLPR3f9PH9UlcV1jC8/5YS
	pX/YxZAxGA4ni5kfuCN2yrumJgtILUD/aZD/RFSw1xpxE2jGAGfT8CtjRjalr2dt32gCQazm6Mf2q
	3a3Hiq5gVeJTHG0cCR5xfE0xoOwAqSDHuzABEcG2grm/hab6EqXeSCr7hJmHS9QSPjLIqf5GCFi2e
	D0VlQYL4d5eGc1CAQmS3SyQRRss4gXvJHxeUJKJWLY6kjnbgSfo5EFJC23W73xLGbXfEVCjAUc+yc
	DOSn32VL6BiDIbSoGnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEi-00AwnO-1N;
	Sat, 01 Apr 2023 16:37:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEM-00AwRk-1m
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1XNmrMy+Da78LTZx0o0AjKxWoVKumJIsPm1ctORoeok=; b=dUGEA9Znbf6gfn2pUBBy97ESEI
	+/ms2TDJI1pgMmYB4zzptGLAv5ptBaTw6mvWBA0bg5J0aGWoBPIRVEYr15nkVr5BbSN/WX8G8cUS7
	WhM9PUv/xn039XMJzjQXQfx2g9o/b33YIju32fSxUJ5d90De967RaX+srqirHijrJhzvP4oN5E+1L
	bzYwbwM3pRJYVSfQulrzhaf8XSj6PTlfrW8K1oitpedC2QYUJ7FX7ExzJdXpnuc4+wWu8m1ESa1Vz
	Z5wVOovqKHb+6DP9Lm02H2wCyb7m+w7d/V/hB7DWrwRQDs3jqdkeK/YAgtDQN4KKfu1+EL9VhU2oO
	smuk7aQg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYOD-K1
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-0008Cb-4K; Sat, 01 Apr 2023 18:19:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-008GQb-5K; Sat, 01 Apr 2023 18:19:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-009kft-Vw; Sat, 01 Apr 2023 18:19:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 13/49] mtd: rawnand: fsl_elbc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:02 +0200
Message-Id: <20230401161938.2503204-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yfVH0jbDdqw7wRLZMJmiFxpHx5shhXL+m8ng86xuQIs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNiH9K0XOOsa+azBi2uHjeTxf3mVZtlTu2zJTb5vPrX 31oX/P0TkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmMieZg2Fd+OTHWq9znx9n Dg4JaVgkK+Nx629So8uBbWvCZ5yNDTN6Fl3iwHF6erXuVKFJ3zK3sEQlLF3Mt7+6slDDQeKPvSe bPrO+bPDjSJsqJpGOhttr1i7aV7M59W6rUcJvD7Mt3u4nbDp/qyQwlrBJ/uftnW1ndGi+dVbA3E Msx6tfH2Due648U7nFy9G0xTeQlXGNwe3UT241tkdUeT4ZObyO4jQ/ZcVx0fEZTxqDc+sH5nyNi s9HlMq5V57TltIs2DfL2ezd6uAoGbeECS/tC7KVnb0uzObZe+H+x1vPDnyc91NOdc88TbbsOsuj v61P3+ELy3Y4o6z+71N5Rtgq0ZsT3IQ2FHJf4ZROPG4IAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_823268_07E93654 
X-CRM114-Status: GOOD (  13.13  )
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
dmVycy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNs
X2VsYmNfbmFuZC5jCmluZGV4IGUyNTExOWU1OGI2OS4uMWUzYTgwZjA2ZjMzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jCkBAIC05NjMsNyArOTYzLDcgQEAgc3RhdGljIGludCBm
c2xfZWxiY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJu
IHJldDsKIH0KIAotc3RhdGljIGludCBmc2xfZWxiY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgZnNsX2VsYmNfbmFuZF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZnNsX2VsYmNfZmNtX2N0cmwgKmVs
YmNfZmNtX2N0cmwgPSBmc2xfbGJjX2N0cmxfZGV2LT5uYW5kOwogCXN0cnVjdCBmc2xfZWxiY19t
dGQgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRldik7CkBAIC05ODQsOCArOTg0LDYg
QEAgc3RhdGljIGludCBmc2xfZWxiY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCX0KIAltdXRleF91bmxvY2soJmZzbF9lbGJjX25hbmRfbXV0ZXgpOwogCi0JcmV0
dXJuIDA7Ci0KIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZnNsX2VsYmNf
bmFuZF9tYXRjaFtdID0gewpAQCAtMTAwMCw3ICs5OTgsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBmc2xfZWxiY19uYW5kX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0g
ZnNsX2VsYmNfbmFuZF9tYXRjaCwKIAl9LAogCS5wcm9iZSA9IGZzbF9lbGJjX25hbmRfcHJvYmUs
Ci0JLnJlbW92ZSA9IGZzbF9lbGJjX25hbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gZnNsX2Vs
YmNfbmFuZF9yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGZzbF9lbGJjX25h
bmRfZHJpdmVyKTsKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
