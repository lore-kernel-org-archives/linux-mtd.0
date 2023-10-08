Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9572FE95A93
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1S/lV7ki/jLhx+eFRhu7DqkDm+wHajd/mPX9226CxOY=; b=DPl8H+cy+wwWwT
	2mCs8eZ22SlGGlIAjUUiDiceUe7P5ZvZIPUyHn9Z3eIm5VBy3rLiNZwvBEzT1cdKagUCKhYCzFrx/
	dYrsZlbawFbVlEH+pNSRrGz1XBJ651pGGqmOrzf+4DEbpZ86A5rsw4OmQII3GT3CMkI58MLTWgArH
	ptUbzi6nft2rp0Y8Vs4HbyVPoJsEaUEjrczxx35UQCSD54aTDYrkjOfyt31yRIA1lf07Rsd//o1KJ
	tSOWWeork2GW4h7ZSfp52KRfqJfeus39ct1b3IFN1k0amtI2J1JDiXQiHtBVvmTwcabYQwRr1BsoB
	msXYXL1Hw7isGAx5NMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyg-009DzF-2l;
	Sun, 08 Oct 2023 20:02:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyW-009Dsw-2C
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyR-0001jY-RU; Sun, 08 Oct 2023 22:01:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-000F0G-Sv; Sun, 08 Oct 2023 22:01:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-00Bf1E-Jj; Sun, 08 Oct 2023 22:01:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 19/20] mtd: spi-nor: hisi-sfc: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:42 +0200
Message-Id: <20231008200143.196369-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Lo52HVmr5VLMhAl1V/VKNHnPC6lvCn1fTq76slX2lfw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqd4XJRvfdGm6kta8wgivPKUF7GxHWV2DQk5 u7dUp20ojyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKnQAKCRCPgPtYfRL+ Tm6qB/oDnwZZvNq3hNJKLm2F3em+p1P0NVSa3HTGhHMbhqgnJu5cuxdLr50SwAFSZwziYFL3hlN alKQla/w2xTWi1Aw9amC9/CeOl+NPPlLnu5hahmvk+83FBc5hY+4x6wsV7GXvOtmTmjz1/mGmG7 5FNV3T5Onp4vI1t0bx/9l3D1uWuSL4fOWr38k+2nAcGRv+DDEjFevq8mQr7Zu9e1HRFlpzZgMZd v28+SYlKvrNjr00apUw5xiXuw2WqlAEsPnbjU0gjPtWtjpKX+XVkwAR1KZpNRiamH0Keb8Nkd1F RayZsc/RQJWEcgLFEXQXLEnY6UMSFL6zhdIZtTPAIzGUc8et
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130204_713210_08BFE9A8 
X-CRM114-Status: GOOD (  15.80  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hpc2ktc2ZjLmMgfCA1ICsrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYwppbmRleCA1MDcwZDcyODM1ZWMuLjg5YTdmMGJi
YzRiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNm
Yy5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYwpAQCAt
NDY4LDEzICs0NjgsMTIgQEAgc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGhpc2lf
c3BpX25vcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lk
IGhpc2lfc3BpX25vcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlz
dHJ1Y3QgaGlmbWNfaG9zdCAqaG9zdCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJ
aGlzaV9zcGlfbm9yX3VucmVnaXN0ZXJfYWxsKGhvc3QpOwogCW11dGV4X2Rlc3Ryb3koJmhvc3Qt
PmxvY2spOwotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBoaXNpX3NwaV9ub3JfZHRfaWRzW10gPSB7CkBAIC00ODksNyArNDg4LDcgQEAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgaGlzaV9zcGlfbm9yX2RyaXZlciA9IHsKIAkJLm9mX21hdGNo
X3RhYmxlID0gaGlzaV9zcGlfbm9yX2R0X2lkcywKIAl9LAogCS5wcm9iZQk9IGhpc2lfc3BpX25v
cl9wcm9iZSwKLQkucmVtb3ZlCT0gaGlzaV9zcGlfbm9yX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9
IGhpc2lfc3BpX25vcl9yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihoaXNpX3Nw
aV9ub3JfZHJpdmVyKTsKIAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
