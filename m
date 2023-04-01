Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181B9C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZT5/f7XLLXFLCHJ+UctHuCXHEnNjS6p7wKjOrKTiZM=; b=b6CSAOtT+MJvKI
	0TX4lnI+PEMs4Hfj6r+NwcRoc+kU6rL93zKtQXZmGHgwaUG61KTatJnLOdrj9q+RHqLlSM/EdbGLh
	pO4tynYaXUiw7P6YE1Sc/b+/5pWycFN2TCSevo4TqWftrmObDKCkcX5sBIRBZdD4goUMjqiSU3gwl
	e0IK3npvGjCZIuyvBOhirLZRGet+KPkJ1HU8F8lEePamgbNN6I5BWnJhnp3G9qN35vMxXMzigcKCg
	zsJ5fF1ZJ03GpngZBCggpRx3Z6LBEkj+Pc39p/fM0Ys3qx4YFTF6oQpfvDIi5p/ujy2mR0/9xOEKE
	xzi3pQT8v2TH5vZ2qR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieFA-00Ax6i-11;
	Sat, 01 Apr 2023 16:38:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEO-00AwRk-2N
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UJ4T/KfUDsDdf9tmeKn6HHIioht9qInU7rNyOQsws2g=; b=sg993TZ8pthqwgHsrJ6mCECnDJ
	GGeIizNd/sIUpqOqL0Jb6pARVeXI5NE1oxczG3tKxupxJ9ypkxQRG4x+oYQit/Ru1+BGvLtUcbyyO
	z4FL/fm09cQD+cv6tNlcsgLppA+xMyrUL9TtaeX2baliacGRwdzBjuHZvGBYRTbHdI2R9HDR99REw
	FopoS7rNEKSLQTuPGuSpPoTjZIxrGOU2EMxmUgWOjw6j3g88EEEbUpe9w5+PM2099pHYlPIcZB7wa
	GZ3dPvL4KoC0SCZ3IVWtrS1E2VckH/Rgw5RS0b36c0xCIYj71tmQLilho072U3Go0DHaQehPEdkKM
	k/xiaGgA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxT-00CYOA-CJ
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-0008Pm-Rt; Sat, 01 Apr 2023 18:19:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GS1-08; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-009kh9-0O; Sat, 01 Apr 2023 18:19:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 32/49] mtd: rawnand: omap_elm: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:21 +0200
Message-Id: <20230401161938.2503204-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QK21oKBC4EcORQtoFTg+A4zhmU174bIn9nqdM2+firM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFk87fuvxNbvZZ6hgm3NBoqwUoQBwWMIrfOww Jtt1oKEKYeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZPAAKCRCPgPtYfRL+ TrRmCACqCl7WCRf8RCrnXPFIvsXOjpMc33TRUNPsmCr3GPWVkMkBlz/j4l6CLs/MYmHhUF102ud N769ujNtRvVHBMPTX876DfRuWMCqmH+Acfor3Ye6OfHZwg/xAXYlsnv5C9EiHlGyukI1YXK9pE4 iJ0aLW5XAHhjrUjisfjGnxEkfZyBSn+NfZ8eTKpWVmBK+Em2IswXCHe2+PET6d8m0Csduw6DKL2 1zsipR4tCQW/sAdkYYI6gtjZ+IL+pRmYg0BgWsCRPuV40UoANhHMz1jPoyuwU/2qWBS41C+tQ2M aw9mTzaeis4PUxEu/E7Aq1HWWzNOzqYPFBBsPiAbAEI/PHsx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172003_620162_75BEFA4D 
X-CRM114-Status: GOOD (  12.33  )
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
dmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvb21hcF9lbG0uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXBfZWxtLmMKaW5k
ZXggNDc5NmE0OGUxMDEyLi42ZTFlYWM2NjQ0YTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L29tYXBfZWxtLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYwpA
QCAtNDIyLDExICs0MjIsMTAgQEAgc3RhdGljIGludCBlbG1fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGVsbV9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIGVsbV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlwbV9ydW50aW1lX3B1dF9zeW5jKCZwZGV2
LT5kZXYpOwogCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKLQlyZXR1cm4gMDsKIH0K
IAogI2lmZGVmIENPTkZJR19QTV9TTEVFUApAQCAtNTYxLDcgKzU2MCw3IEBAIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGVsbV9kcml2ZXIgPSB7CiAJCS5wbQk9ICZlbG1fcG1fb3BzLAog
CX0sCiAJLnByb2JlCT0gZWxtX3Byb2JlLAotCS5yZW1vdmUJPSBlbG1fcmVtb3ZlLAorCS5yZW1v
dmVfbmV3ID0gZWxtX3JlbW92ZSwKIH07CiAKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZWxtX2Ry
aXZlcik7Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
