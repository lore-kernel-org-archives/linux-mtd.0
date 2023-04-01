Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CBEC77B6D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUn5R73J90ShKTV82DrzCsJApFjiDIAOLpqmmKIjqYI=; b=JHO/PgsecmoFjQ
	xn+h7OpDTGjXiqM40QhKzMKLQGM7Hajf5BNsqXzP7FoxDKxunt5pZMoNCBChsigQBrsmKaKnC2HrJ
	O83V9FNFaH3HSCtCTmE7EFWkCigPvJvlq85zzynVpgEnVWJlwx/dMguExsanw+fsfHIxLwwUlFPeO
	QTcB3t78nJOGbYkIHV00VFPBZnhQf0HB100b83/8/Hzh7bEPGxcLrQuCc4aRDY0+i3s5nPWV9jPSQ
	xQ0xiPoOB9bVUD2gKOT0oMo7lNaTR0tl/j8Z3uIEPQZ7QMSZn4jphEnZxB0SnVccyVE60XpF9CS5V
	wxXFI849rMeegNe2lrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxp-00AsNl-1W;
	Sat, 01 Apr 2023 16:20:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9G-0Y
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-0008Fc-Fx; Sat, 01 Apr 2023 18:19:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-008GQk-JS; Sat, 01 Apr 2023 18:19:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxF-009kg5-K9; Sat, 01 Apr 2023 18:19:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 16/49] mtd: rawnand: fsmc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:05 +0200
Message-Id: <20230401161938.2503204-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vObKBhmsgafU84zWNgN/mJ2oBdY9JTjl+5IEs4QUJ/w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkC7JpAwVir9GvL+9NLFwLEhooOFUkWe9zu0 X7myerF1e2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZAgAKCRCPgPtYfRL+ TrlbB/910Vh/RtFd3Oa7uEghclq0vV7m/FH1inyisEX6s1RZcKm3iFYULF79LbdcDCtmcxMJO7r vy/EV6BYBYJauDrpRz36jncdEWLEFsCdvba5vj2ce9UWsoJaZBTvNPYP+cb3KBpe0GhzqDxHzKV +hSLOVD4OzkhnUOABlkX6Aez5o7LgZiFZUHwZjeAYAEWM/fWZKQ7TFEbJq0cPgboJtyZtZswcqf HWOQP6tmp3YjQZ5eA4yE/36WsHf+ilJGHZMenmcsdgMI32EI9Z4Wv7zKk3J12Yxf4qYPbx227V5 LS9h0yfWe6UJw3XkrqWb7k31eK7tV2OJGFSn3ebu6hyYhh+j
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_234103_26A98394 
X-CRM114-Status: GOOD (  16.75  )
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
dmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9mc21jX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbWNfbmFuZC5j
CmluZGV4IDZiMmJkYTgxNWI4OC4uZDU3ODY3MDg5MDc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9mc21jX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc21jX25h
bmQuYwpAQCAtMTE2NSw3ICsxMTY1LDcgQEAgc3RhdGljIGludCBfX2luaXQgZnNtY19uYW5kX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAvKgogICogQ2xlYW4gdXAgcm91dGlu
ZQogICovCi1zdGF0aWMgaW50IGZzbWNfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKK3N0YXRpYyB2b2lkIGZzbWNfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZnNtY19uYW5kX2RhdGEgKmhvc3QgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAtMTE4NCw4ICsxMTg0LDYgQEAgc3RhdGljIGludCBmc21j
X25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCX0KIAkJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGhvc3QtPmNsayk7CiAJfQotCi0JcmV0dXJuIDA7CiB9CiAKICNpZmRl
ZiBDT05GSUdfUE1fU0xFRVAKQEAgLTEyMjQsNyArMTIyMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGZzbWNfbmFuZF9pZF90YWJsZVtdID0gewogTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgZnNtY19uYW5kX2lkX3RhYmxlKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgZnNtY19uYW5kX2RyaXZlciA9IHsKLQkucmVtb3ZlID0gZnNtY19uYW5kX3JlbW92ZSwK
KwkucmVtb3ZlX25ldyA9IGZzbWNfbmFuZF9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUg
PSAiZnNtYy1uYW5kIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gZnNtY19uYW5kX2lkX3RhYmxlLAot
LSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
