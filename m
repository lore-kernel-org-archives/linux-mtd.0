Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB47C761AF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tC6NBMWXawnyZNsFQjKrjMWG90uxnaOcP0xZiG81xQ=; b=p1+s640HeWpiTy
	ISTIGl8fdR+QeH4H0MLnytWv/3qqTcr1o9vlP7ZYbBRQ+mD3F2fNO082DBkbG3m9xPLOVgNGVIvYC
	yXpCQJqWYGxIjb7dkmtUQPeOIwyChYndMfr+Mq7EGeUxGorittZ25yg2CAWMVgtROXR3S2VdBp++X
	/l/PLkoWsSHQLCzk9PdbENMSappQCvcwPDHoPpjipRjvIbgp3DYTy4YWOrRoKyBUSwq3O9Fxm0Byh
	ylxJzUmlDrBgA6BK1yhxZNAMCUqU++RpO3w8xbXn2sgg0+qtIiMWbB+f2e+r21cwJ6iHUFFdewRp8
	oeNpblCMfG8i7elKiHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pif4n-00B2QL-2J;
	Sat, 01 Apr 2023 17:31:41 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxd-00AsHa-1u
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NCE/ldrxSa+FF6qnukQ2DHKY3ZdJE+sGfGdk1eIOhBo=; b=aTWAn/tSoAPtdVtUFAGdCUxWxp
	GYWluIRVAUmft8XRI73DfK4t+lAnwzL/M1SmMqs243Sp3+qfKZhGYgUUdgTt2+8oxEj2VwZmcpk1i
	7p0QAPA+gUHEzerejJPaATgJ3ugIcFWCHE6xY2mLQM0Y+V0nnhnPMKCNhi3gZx8y5oqPBXDF1hb9d
	zVCkPzDvqdd6X6qe2BLqpXp+Gzn9Hs197DRbP0zzJhqWhwgZEmRvAx26ZUhD7UD5XyYDiZ6zKqykV
	0NxUd6hto6gCUKCTIdpzeu0VQm1AaTwfjcd0YvFJD+jdHZ+WGG9HjvJ1oW6e2OU665xaBLt1glmzV
	mpAQrOGg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKy-31
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-0008Pq-0d; Sat, 01 Apr 2023 18:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GS3-0p; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-009kh5-Pv; Sat, 01 Apr 2023 18:19:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 31/49] mtd: rawnand: omap2: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:20 +0200
Message-Id: <20230401161938.2503204-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TjwsYyVXkVzqjG2vivAFKm41kuR5ZKJlPg0Vh5ce9Xw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFk2eS8BmfIUsjae7lovOqs/KE4sctEFcpuhD jsnTdErsNiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZNgAKCRCPgPtYfRL+ TgxDB/9P5lfFOlz9gSWDpu1e0hHgB8Sxwz0uFI0rklSMd69NOkDXXfVc9Q9B+V3ynogYMmt3o8g C5yuiLfLZF7+criDceHGQUIUP5561t79iEpurCoQdMvA29T8McJ96JSKo3KvsECMQrAzr9sSnNs +5WvTiJW4ViDwkHyuttKfd5CKYmug+gt+sBppv4iQuBG0ixrCqDYzNpyo4y1Jj2B5N/jA/INaWS C8a/eYcTrJPlv/a9A178tcfLqPawZmzXFYQ2OXjC4dKoIeIevlL/DAftkF13dxPq7VVu1m9RQzo kR817M0i94y/slVFighOFUuj7lh5292uS+qp398+mJg9h8NH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172007_217616_C99D953C 
X-CRM114-Status: GOOD (  17.10  )
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
dmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvb21hcDIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMKaW5kZXggNGE5ZjJi
NmM3NzJkLi5kYjIyYjNhZjE2ZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L29t
YXAyLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYwpAQCAtMjI3Myw3ICsyMjcz
LDcgQEAgc3RhdGljIGludCBvbWFwX25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgaW50IG9tYXBfbmFuZF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG9tYXBfbmFuZF9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKm5hbmRfY2hp
cCA9IG10ZF90b19uYW5kKG10ZCk7CkBAIC0yMjg1LDcgKzIyODUsNiBAQCBzdGF0aWMgaW50IG9t
YXBfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZG1hX3JlbGVh
c2VfY2hhbm5lbChpbmZvLT5kbWEpOwogCVdBUk5fT04obXRkX2RldmljZV91bnJlZ2lzdGVyKG10
ZCkpOwogCW5hbmRfY2xlYW51cChuYW5kX2NoaXApOwotCXJldHVybiAwOwogfQogCiAvKiBvbWFw
X25hbmRfaWRzIGRlZmluZWQgaW4gbGludXgvcGxhdGZvcm1fZGF0YS9tdGQtbmFuZC1vbWFwMi5o
ICovCkBAIC0yMjkzLDcgKzIyOTIsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBvbWFwX25h
bmRfaWRzKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgb21hcF9uYW5kX2RyaXZl
ciA9IHsKIAkucHJvYmUJCT0gb21hcF9uYW5kX3Byb2JlLAotCS5yZW1vdmUJCT0gb21hcF9uYW5k
X3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IG9tYXBfbmFuZF9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7
CiAJCS5uYW1lCT0gRFJJVkVSX05BTUUsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG9tYXBfbmFuZF9p
ZHMsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
