Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F853C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBawTKemVZevQxgtAlOdEOynkn7W8kjl90nRR3gh+DI=; b=nEAfq5pGcNufOZ
	dRk5SnKW0Or27VhBePHsKrxzHPOOgbT4iy04Q3T0ZuAjMJB2vzMu4Of8zYC1XX4gdn9Rh6pg+BxKV
	jqWmmwQBWu1dU7q2G23Z8WyHmCsg2PjnnEin3y3+tlJsilkUid4o8S8baoAhoJqZVgWSWPImM31ms
	Ce5A6/sHp5l9OAyS7URbSfx39ZrCmXMiml+MtgTDX1na1v8NkHHQOTPc2Oc1yOf7dFTd77KFfbkem
	i41nby7dTFWxAOWPlZCmmDkArNA0eHOZLkYNn9B9Rzg66vxxb6pFw1sSfvcsniiLGRChHOFA/ycPc
	b9cRR3UdpYazbQm6at7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyy-00AtDt-2J;
	Sat, 01 Apr 2023 16:21:36 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxf-00AsIx-0c
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U1ZVdiFEE2IcIgO9RpwX5XO4FLEKO9wpt6OXzQrcZGY=; b=kq91fkVbz7UKJmoTjTzCGsALYQ
	nfNKLhYTW9WC/I2EE4CHXMOpl1O+Oqc7lCP8U1Hvre4UML8hVOpQ37UqyOVpgxOsdXRsI9bRLbnLV
	wSDyKSFAEmQ8SEYubd22kE16ccOQCBDsSEohZzNZhDmjeBX/ZkuocKrimeCup3w0dW3BSND0ERIKI
	SK84npq6IMCrvO42+zOcDw3hx6poS51Mf1Bynxh9HBf221H45O8UZEP4CezIPpi4iQtsAZRflfxG7
	lpcCqhhXS0WkDAZfxfjlHsO/+/AdN4N7JD4bmgTQoukEUM6BrZjb0ffQgSZneyjimn0uUR3hXT8aE
	MmdvU6Zw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-008DKp-0n
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-0008MN-KG; Sat, 01 Apr 2023 18:19:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRP-7g; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-009kgY-8x; Sat, 01 Apr 2023 18:19:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 24/49] mtd: rawnand: marvell: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:13 +0200
Message-Id: <20230401161938.2503204-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UH8mman7FpH1I+NbmK+dcyenV48z9RiSFvkc+mUbSUs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkk62BUOEslPj+Q3mC8dAUUueXFuyusv4PIo VObbrHvAMaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZJAAKCRCPgPtYfRL+ TpfDB/4wm1dWN/uAYfQuytapit1JR7K/uedI7C9hZ1yc2bRuJ5tv0dhfyy2rGj38FvuyZwiIgKe N7/H48uRcrfx0N4FnsiwoJiZR9iloQ8W4N08lDpwAcEhjrETmx9p1IYdPm39c/xiDtK71fbCQVl 7NTFHb+L/w2XgE8Y7EPVswLs0X7IZMz2/D2QaGN1QWbEOla5YOUEmCiy2bG304e+TF2XOoSM/lO HykZ8Bh8gMqqkGCFwevf2GrIoAwkBHkXpQO/DOWTsdymPFrWpeDjv2suisTiCR+Cly1w40M8qMi /3ql5TkD25AgvysYnt9D+JEXPhSO6TaUZaSOpkB/5kVFeyxm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_534087_7952B966 
X-CRM114-Status: GOOD (  15.26  )
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
dmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZl
bGxfbmFuZC5jCmluZGV4IDMwMzQ5MTZkMmUyNS4uYWZiNDI0NTc5ZjBiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9tYXJ2ZWxsX25hbmQuYwpAQCAtMzAwNCw3ICszMDA0LDcgQEAgc3RhdGljIGludCBtYXJ2
ZWxsX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7
CiB9CiAKLXN0YXRpYyBpbnQgbWFydmVsbF9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCitzdGF0aWMgdm9pZCBtYXJ2ZWxsX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbWFydmVsbF9uZmMgKm5mYyA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOwogCkBAIC0zMDE3LDggKzMwMTcsNiBAQCBzdGF0aWMgaW50IG1hcnZl
bGxfbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKG5mYy0+cmVnX2Nsayk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG5mYy0+
Y29yZV9jbGspOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQg
bWFydmVsbF9uZmNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC0zMTU0LDcgKzMxNTIs
NyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtYXJ2ZWxsX25mY19kcml2ZXIgPSB7
CiAJfSwKIAkuaWRfdGFibGUgPSBtYXJ2ZWxsX25mY19wbGF0Zm9ybV9pZHMsCiAJLnByb2JlID0g
bWFydmVsbF9uZmNfcHJvYmUsCi0JLnJlbW92ZQk9IG1hcnZlbGxfbmZjX3JlbW92ZSwKKwkucmVt
b3ZlX25ldyA9IG1hcnZlbGxfbmZjX3JlbW92ZSwKIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KG1hcnZlbGxfbmZjX2RyaXZlcik7CiAKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
