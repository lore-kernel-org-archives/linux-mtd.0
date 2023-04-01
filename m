Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF5FC6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGWNCarJ7On1NAaPPvMk6/nDaBC8GN4tQ40OyoHWxIw=; b=eNvdVzYnRl4Bgx
	2JObs77AjAwQnF+tkOEXWcYivv5+K0Wb5BwBJyyd2mmgdfW+OF8BZxvVFedMf47mSiYlreqHtQE6r
	kTjQnodRsQvBn3Kg4jyHiVq/J9FbZTLb6zSBFPQ0ibJhV3vsXYt21oG17MFmrMo+9tQiKHufhmD5w
	TCCdhAVf7UGtaeR416A+LgsV/21q/rsuS5cwNbyMjh1jvjaWn7U2n6dl+Pa7cFraF1EDdJ/3jPVvt
	ADEVhevEF6cZBMiRdGG0FvahIYXY+8Nhk2CsQkAyHjwzKO+M6ZPRy5THvkERaqgZh1aoAlmHOCwm3
	GIbRYCYUlmQ2dDNwVXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieFI-00AxFG-0K;
	Sat, 01 Apr 2023 16:38:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEQ-00AwRk-0v
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=NkQmT0MtYuhSZ/lqLaAtv0/txXMGMP/IWLxZlzja2y0=; b=izzfxGshkAMs8fKtzZ1ayXh9ah
	kPek5HSf0oS/FIvF8Mh+tXvRPmweRV+l7plTK5LT5a3VVTxqkO3O3O6E7gjnmKhZLwhswTSJTJlD4
	GQlCiDlJz4ZwZhsRf+g3qd01fKL8jxYSSo5H0cbqsbgDyh6AMjVcA2606U9mCoDC77vPIBtrkjMn4
	43ru9EE+C3I8hgwDOoEqCzf8SgRmBgLLWVAaV87teuJ088nbGHPwnP5QoYv+8WMp66gaGPp4+ULwj
	f+nhEQgbN5379wwfXo6+Xzmli2LVSlEX0BkI864IMXE/ndS+Dgf7GtSuTYcNe0wzHp9HRI8JUaTTv
	tnBlS8Tg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxS-00CYO1-RS
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-0008J6-HP; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-008GRB-KD; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxG-009kgK-DH; Sat, 01 Apr 2023 18:19:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Harvey Hunt <harveyhuntnexus@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 20/49] mtd: rawnand: ingenic: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:09 +0200
Message-Id: <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wcjtx8KlaSUvzq2Bnb9sgvoi7LKE1iNvYAl9n41L3Oo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkQfxkqOIajMiniSiCExT7JGOcXyLx06eRkg c7WSGy37MyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZEAAKCRCPgPtYfRL+ TtWkB/9rXtvGRYkvAsfdnUSBj39s9dz0fLhSkpeHxEHVVVSMFVxjwKAKBryDM/hltnbIAtdjwVu CuFuXT2Mx+XmdEDcI0/8ZZyZzs0QbDe4000pWiLQqBxnXdV9t4guJY5DTFGr2zuluPMtz8tJDJa 2cEH6NMoRTGYMThT5387I2P56tjDOKok7q9rD0D7P4aLbsdSDJj25k6aXyPYyBvStSTcDn0Zv2x 7TXNvSCqd4ZgrdlNTo4m0SoyXUhRRc7PBsty565ZHqXdq9KjHT9N4SSQJ60msdM8w3ssKct8dEO TWNUF6oAqGHb93Yk1gZ2yWxwIIwQg9Ed81aMXA34LKJ0+R2R
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172002_968039_B72D1276 
X-CRM114-Status: GOOD (  12.93  )
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
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMgfCA2ICsrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jCmluZGV4IGZmMjZj
MTBmMjk1ZC4uYjlmMTM1Mjk3YWEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9p
bmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdl
bmljL2luZ2VuaWNfbmFuZF9kcnYuYwpAQCAtNTIyLDcgKzUyMiw3IEBAIHN0YXRpYyBpbnQgaW5n
ZW5pY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyBpbnQgaW5nZW5pY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQorc3RhdGljIHZvaWQgaW5nZW5pY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBpbmdlbmljX25mYyAqbmZjID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7CiAKQEAgLTUzMCw4ICs1MzAsNiBAQCBzdGF0aWMgaW50IGluZ2Vu
aWNfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJaW5nZW5pY19l
Y2NfcmVsZWFzZShuZmMtPmVjYyk7CiAKIAlpbmdlbmljX25hbmRfY2xlYW51cF9jaGlwcyhuZmMp
OwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qganpfc29jX2luZm8gano0
NzQwX3NvY19pbmZvID0gewpAQCAtNTY0LDcgKzU2Miw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIGluZ2VuaWNfbmFuZF9kdF9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGluZ2VuaWNfbmFuZF9kcml2ZXIgPSB7CiAJLnByb2JlCQk9IGluZ2VuaWNfbmFuZF9wcm9i
ZSwKLQkucmVtb3ZlCQk9IGluZ2VuaWNfbmFuZF9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBpbmdl
bmljX25hbmRfcmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1lCT0gRFJWX05BTUUsCiAJCS5v
Zl9tYXRjaF90YWJsZSA9IGluZ2VuaWNfbmFuZF9kdF9tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
