Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC52C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXdHVnC/eKD2ycsc8TBaqGeerK/KBJDtnOmQVR1jSZY=; b=ukw/G8xAYE6Gzf
	GA+V71peSSuALpuoMpRpZgqv3GpJgYvAPPH1Zrpdj5sf2XIvGAQfG2Tv01ofWXGLdfDJXJkahvZvO
	hNpmjtdhxBvg7zgd8w1tZbBB3QXWM48n2Fo5Ng8fZgu7C+074zQ0i/oRTSD2YHJlCJ7Y0zQ3YToM0
	Fd0f0XduA7qChHYD2SYdrRMA3Ub7QGKSdy99JoSVwRdH8vsHSF2jNhJRdxFKv9L58XY8riJud09uB
	NtQ36S6ucLE7v2hbQROl+79bhQvdAd5WUSfFv9FZ7aUK+2CPCcuHL/+ipabOvL35VUzRBr3h3gXrL
	x2Ab0tgaYYEt1tjpbVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyR-00Asm3-2Z;
	Sat, 01 Apr 2023 16:21:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00As9A-15
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxE-00089H-Un; Sat, 01 Apr 2023 18:19:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxD-008GPj-Fe; Sat, 01 Apr 2023 18:19:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxC-009kfG-RV; Sat, 01 Apr 2023 18:19:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 03/49] mtd: onenand: omap2: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:18:52 +0200
Message-Id: <20230401161938.2503204-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ugJWs93QuxD0VnBIsnIIC7NVxTy83kogOzdVHcZ6XOM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFjzVaKvY/owp2CteX8O2HMzn5Vc+Yy5UpW1m wZLocahK4uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY8wAKCRCPgPtYfRL+ TkFuB/0Xag3ijKLZ0gP+OgceJrM/yxM+zT3ulQcWR9GRApIPnNAx0KUajGUzyL6MxpcjAMtVfCp C1eevDQk5eDNvhuuUmeHccfIR+aCHV9nCgOCVcY49BDRQ7tR2OlI10xOus/eLYAuX7SZNflRmgS o+y4QJYgdzNlThLPyaHHtg7ZeDlc/asmG+vU/eIWhdpGt5TeZPr/O9XGX2+cwUXuO2//82JVlTb ZxRXGYG7cAF9eeTVrw9vq4JGkTqfLVpBXHJDZmaQdFfQnE48VXR35HPOEyXUvx4E/208gCUaErz w4QF4NL+OpIyFCbyr6FWsubcNnabknOZZyJOVC3hsMMkcrkN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_428676_656DB0FC 
X-CRM114-Status: GOOD (  16.28  )
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
dmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfb21hcDIuYyB8IDYgKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX29tYXAyLmMgYi9kcml2ZXJzL210ZC9uYW5k
L29uZW5hbmQvb25lbmFuZF9vbWFwMi5jCmluZGV4IDEyODI1ZWI5NzkzOC4uZmY3YWY5ODYwNGRm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9vbWFwMi5jCisr
KyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX29tYXAyLmMKQEAgLTU4MSw3ICs1
ODEsNyBAQCBzdGF0aWMgaW50IG9tYXAyX29uZW5hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAlyZXR1cm4gcjsKIH0KIAotc3RhdGljIGludCBvbWFwMl9vbmVuYW5kX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgb21hcDJfb25l
bmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgb21h
cDJfb25lbmFuZCAqYyA9IGRldl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsKIApAQCAtNTg5LDgg
KzU4OSw2IEBAIHN0YXRpYyBpbnQgb21hcDJfb25lbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlpZiAoYy0+ZG1hX2NoYW4pCiAJCWRtYV9yZWxlYXNlX2NoYW5uZWwo
Yy0+ZG1hX2NoYW4pOwogCW9tYXAyX29uZW5hbmRfc2h1dGRvd24ocGRldik7Ci0KLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb21hcDJfb25lbmFuZF9p
ZF90YWJsZVtdID0gewpAQCAtNjAxLDcgKzU5OSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IG9tYXAyX29uZW5hbmRfaWRfdGFibGUpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBvbWFwMl9vbmVuYW5kX2RyaXZlciA9IHsKIAkucHJvYmUJCT0gb21hcDJfb25lbmFuZF9wcm9i
ZSwKLQkucmVtb3ZlCQk9IG9tYXAyX29uZW5hbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gb21h
cDJfb25lbmFuZF9yZW1vdmUsCiAJLnNodXRkb3duCT0gb21hcDJfb25lbmFuZF9zaHV0ZG93biwK
IAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSBEUklWRVJfTkFNRSwKLS0gCjIuMzkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
