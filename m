Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE1E95A82
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0c1hDJTixlkKD4sLRonZWJxbwpYkAcbgbaO4C/WnCE=; b=GKVGwY4BcDcctB
	5RRrc3vcoSKVsKw/T2qGtuioFSObkptxgs/8DBsPBVQuAIjtRqa5RRZscFD9CfhzROWflp52WH5YB
	WwKCDoPlBRJuEhmImsMcHfmSQPbKC6fp2DcFiSRIJhvtKFlinBXf3yVUmWYL/5I+CUCx7kmwBd7YO
	vftHaMsuLVOv4w3D65v6nnAZ3A6OG4EXF1/ffmJhOznne+UpJ0sAQEsrns7uYWOGQDqlae+mMx63L
	aYFUpaQuMWu2o46I6r7ltD5dMBY2UvooAuerW4r5jU4ktMyluWVPUUL6dywVr1zv8vh0jhiGOEfkf
	d3c5k9xF9hc+NWBtyGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZye-009Dxd-0l;
	Sun, 08 Oct 2023 20:02:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009Dqx-1l
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-0001WV-Cq; Sun, 08 Oct 2023 22:01:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-000Eze-W6; Sun, 08 Oct 2023 22:01:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-00Bf0V-Mp; Sun, 08 Oct 2023 22:01:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 09/20] mtd: hyperbus: hbmc-am654: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:32 +0200
Message-Id: <20231008200143.196369-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pV31gLoqZ68E2oVLdJb8rCj+euAV5krzg3MxI/Yxojk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlRlrs65v9YekChviTIp1DgnJDFLRjLt/0Z/I9Vri+oEl vqdCZ3VyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEpO9zMCyclhx+3Y/pdt6y mwI9hivtWJI+uYasYwjtiHy9sbg6+cSUtz8cnMvtN7z//9cnS13t8/mMENnYe64fc3YtuHH5pFp c3mpGTc+ZrM4TgxusMmbG7r2//vyls3sKbJ8KSwmEW/GcTBHxDWd/9Ta+1LJuQ3lOb+jdW+zOxS /s/3bnzdHfFpJbu+2a+5pJcQ+SbraXLv+g5mAQdczP92Ttg4rdnpnffc9t/n7lBEvQJTmvAOVpK b7nV3gcMNdg3CK526p1HWPb8x8911xO1G59zH/OV2Xle1PbaZ6vXxa7Nu1VN9poZ+4o1LZVI9ow RkBdsF01tGfay1saCwL7lyjdZNM/58w16/PuEEFtrZeGAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_600823_6F4BE566 
X-CRM114-Status: GOOD (  16.17  )
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
ZXJzL210ZC9oeXBlcmJ1cy9oYm1jLWFtNjU0LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9oeXBlcmJ1cy9oYm1jLWFtNjU0LmMgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9oYm1jLWFtNjU0
LmMKaW5kZXggYTYxNjFjZTM0MGQ0Li5kYmUzZWIzNjFjY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL2h5cGVyYnVzL2hibWMtYW02NTQuYworKysgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9oYm1j
LWFtNjU0LmMKQEAgLTIyOSw3ICsyMjksNyBAQCBzdGF0aWMgaW50IGFtNjU0X2hibWNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMg
aW50IGFtNjU0X2hibWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0
aWMgdm9pZCBhbTY1NF9oYm1jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBhbTY1NF9oYm1jX3ByaXYgKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShw
ZGV2KTsKIAlzdHJ1Y3QgYW02NTRfaGJtY19kZXZpY2VfcHJpdiAqZGV2X3ByaXYgPSBwcml2LT5o
YmRldi5wcml2OwpAQCAtMjQxLDggKzI0MSw2IEBAIHN0YXRpYyBpbnQgYW02NTRfaGJtY19yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlmIChkZXZfcHJpdi0+cnhfY2hh
bikKIAkJZG1hX3JlbGVhc2VfY2hhbm5lbChkZXZfcHJpdi0+cnhfY2hhbik7Ci0KLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYW02NTRfaGJtY19kdF9p
ZHNbXSA9IHsKQEAgLTI1Niw3ICsyNTQsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhbTY1
NF9oYm1jX2R0X2lkcyk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFtNjU0X2hi
bWNfcGxhdGZvcm1fZHJpdmVyID0gewogCS5wcm9iZSA9IGFtNjU0X2hibWNfcHJvYmUsCi0JLnJl
bW92ZSA9IGFtNjU0X2hibWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gYW02NTRfaGJtY19yZW1v
dmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAiaGJtYy1hbTY1NCIsCiAJCS5vZl9tYXRjaF90
YWJsZSA9IGFtNjU0X2hibWNfZHRfaWRzLAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
