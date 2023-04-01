Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCABC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ba6aYqmYVLn/o7R2O/X/CizOdYZV2u6WxPwdQgrqzA=; b=JZDxQUKT21Xqny
	DL/4yd2np7SkUytmpvHlIkB9XMgg6fdBOts6adnk8SLhP4TgsX1hkm1oO8gZ9pMTPeN9I/y+wJSQY
	yHeKQAqZPJ1e9c2AUrwrty3PpNQ5tSP8Ed8Cx3GOnFf3M1Ihx0WtjcS30ERVtCPT18BTtbeS8/AP2
	ubLH1awg1zl+72+4QxM2ErqatNKB1OlyTFfZfk8qO0eSF8HvT1j+ykV9rvkW7UXGcRMaWI0MSEg/0
	z/2SP+neQyn3EIy+bUUimkd08STdKXdIqSWHNbprwr9fQzAJLZhPK01Iui3U5fRVOkShJilm5Ouqg
	p4Fq2a0Dp+73OxG5PSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEl-00AwqW-1y;
	Sat, 01 Apr 2023 16:38:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEM-00AwRk-3C
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=mSvEJXJvcAoEFHW9n+sWIgt4u3AoLiJqat4yqpdGqYs=; b=q6Fn+Ed0eAM4Gyqq1W5i+z73DG
	o7G3LczrUJ6cOtPf1XU5Yb/sIfLAU6yeEDKm8Zz5AUBIa3ay4Z0eEpMNRJOG9aRvL2uUcHWTG+Pwu
	A8+R5meL09yiab9ZKo7CW1F31/M+9fnChfpBMMfwQ0n3WptD7HX7qcz4j8+Z8zim5m1igKXZGNQu3
	KppSpBm9/VtmwdF57x91wv7h5+uysmP1DT2pAqT7jPxIky4KjIHrTSlZsIU6YG8elmViyYKbAsQAF
	ii8T7/8CuPgMYwsgLC1XNnb6wIIXYb/M6pkNCfAZ3rlM4yX8UxwuSSct2nTNT0ANcj+BKmCwztPML
	Cz2OPijQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYOH-La
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxN-00009j-2u; Sat, 01 Apr 2023 18:19:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-008GSm-JT; Sat, 01 Apr 2023 18:19:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-009khY-Dj; Sat, 01 Apr 2023 18:19:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 39/49] mtd: rawnand: renesas: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:28 +0200
Message-Id: <20230401161938.2503204-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gCkd0kQYH0yqAD5z8JJPYsdxxLL+nMTSfiU1Ye2kvJc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlKGrs3kW0HWbv+BREGmgko7MmQtzQoVAwq7 zzJ9BT3s1yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZSgAKCRCPgPtYfRL+ TkRICACMByzQD3H+9q4YrpmHGekHt0ruPg7GY+C+TJtCYkyukcmEXeTnZBkeODX7YvXVzBxmWp0 CaMbHGN7ZLksa/nCsz7cbI+67PmuRbXx3Zbeilu0mag7qk2QW0TXkGISSLIRGKWK3kpfiQuMIsg KkuIZj2DhvloKHcpKcO2nQ/e0GfU0BCF0KicViStmPeRwnoqOvbjwJpsMJDmms0D88OohjKMVy+ HHtrC1ApF5TYf3iAftr8YhDfqZtqrP1YYQFTTYNzzliLq8+zxca6aXtqmwSu0LSIjnfYSomKI3+ nV+VNY2T+DqAzMP1KCSyFHyCpGQvD30+dM1BB1WIJbukPdOZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_823379_B5DFBDD0 
X-CRM114-Status: GOOD (  12.80  )
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
dmVycy9tdGQvbmFuZC9yYXcvcmVuZXNhcy1uYW5kLWNvbnRyb2xsZXIuYyB8IDYgKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JlbmVzYXMtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9yZW5lc2FzLW5hbmQtY29udHJvbGxlci5jCmluZGV4IDE2MjBlMjVh
MTE0Ny4uNTg5MDIxZWE5ZWIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yZW5l
c2FzLW5hbmQtY29udHJvbGxlci5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JlbmVzYXMt
bmFuZC1jb250cm9sbGVyLmMKQEAgLTEzODYsMTUgKzEzODYsMTMgQEAgc3RhdGljIGludCBybmFu
ZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQog
Ci1zdGF0aWMgaW50IHJuYW5kY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
K3N0YXRpYyB2b2lkIHJuYW5kY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IHsKIAlzdHJ1Y3Qgcm5hbmRjICpybmFuZGMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsK
IAogCXJuYW5kY19jaGlwc19jbGVhbnVwKHJuYW5kYyk7CiAKIAlwbV9ydW50aW1lX3B1dCgmcGRl
di0+ZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBybmFuZGNfaWRfdGFibGVbXSA9IHsKQEAgLTE0MTAsNyArMTQwOCw3IEBAIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJuYW5kY19kcml2ZXIgPSB7CiAJCS5vZl9tYXRjaF90YWJs
ZSA9IHJuYW5kY19pZF90YWJsZSwKIAl9LAogCS5wcm9iZSA9IHJuYW5kY19wcm9iZSwKLQkucmVt
b3ZlID0gcm5hbmRjX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHJuYW5kY19yZW1vdmUsCiB9Owog
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcihybmFuZGNfZHJpdmVyKTsKIAotLSAKMi4zOS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
