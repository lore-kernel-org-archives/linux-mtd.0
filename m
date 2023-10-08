Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13805E95A96
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjO13NHUZk+7k+LMlMkDZEEqaSjxtFP9LR4ayI3OtMk=; b=W9iEU+twwBV0jE
	W7L/Rbu0tg9mFUQhuOfsQOlqIRNvra4kzhjWpyZjOW5swS+qPKbjvfjDgo9lTachireg2Q6Jft3X7
	kCANBWQb1L/aRKycCSzk18tcdrkmE52RkkTC0yXTW7xGKBSlKaSvNHZXxGj1ymUGyIwAKmDl1Htj6
	TKfonOLQMM5GsC9lQjqrSql4bappY3Zbdj4ZpEUVxLCVQpo62hC/wrneK7aw1ej8M7yGIkVJ8L0gW
	2zMeO+wJqvCbJ5qz5rmrg3ebOQlPCRusV62Lcb3aMHlipYRd2M44ayyCcgB2RY9xxbh4/dg/TQGRv
	0Zhe8MoFLzs970um5DOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyd-009DxX-2B;
	Sun, 08 Oct 2023 20:02:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009Dqg-1o
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-0001SZ-Po; Sun, 08 Oct 2023 22:01:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-000EzL-9M; Sun, 08 Oct 2023 22:01:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-00Bf0B-0N; Sun, 08 Oct 2023 22:01:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 04/20] mtd: docg3: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:27 +0200
Message-Id: <20231008200143.196369-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7VKHSbrgIeIZ8/rbG5ulAqJ+HY0yrpc1MHJBjhJf/Oc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwp/mT4ONG8T92sUaiHOeJLjbl9td2DT8siY/ JuzF1ghTlyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKfwAKCRCPgPtYfRL+ TiQjB/97FYINha0y30wOx+hoWd/0xEdiSn7jwG5EQ4Q+yT5Vf5oZIq2fCmAQpYjnxwn9W7hK8Vb owPlkJaZTlhSdS7vPRFavEXoVqJlxNZWou1ZO0DajplZJf/R8KpRTge4YrRYpsFSoRDUzGI5Vl+ l5QJE4G9+WD9t3GiHpk3zAhTD/7VyEzLjzLMi0yhdJACSMAZVVzjJaegLZ2K5qOO41TlCT0gZ8d m7VdNO8Bw8Z939HNPcyejIp3zGPKEMgiOErH0vpnF/N5MpB7F5/ufXQ0MXqexKZulrcIqoidTGj UcwipLBTTjBAnTFYoAbjzAviM1ccJ/eI2RRQyZOjndigbhoD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_616604_A87FB518 
X-CRM114-Status: GOOD (  15.90  )
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
ZXJzL210ZC9kZXZpY2VzL2RvY2czLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvZG9jZzMuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuYwppbmRleCAyMmU3M2RkNjEx
OGIuLmEyYjY0M2FmNzAxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5j
CisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuYwpAQCAtMjA0Niw3ICsyMDQ2LDcgQEAg
c3RhdGljIGludCBfX2luaXQgZG9jZzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKICAqCiAgKiBSZXR1cm5zIDAKICAqLwotc3RhdGljIGludCBkb2NnM19yZWxlYXNlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBkb2NnM19yZWxlYXNlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRvY2czX2Nhc2NhZGUgKmNhc2Nh
ZGUgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgZG9jZzMgKmRvY2czID0g
Y2FzY2FkZS0+Zmxvb3JzWzBdLT5wcml2OwpAQCAtMjA1OCw3ICsyMDU4LDYgQEAgc3RhdGljIGlu
dCBkb2NnM19yZWxlYXNlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQlkb2NfcmVs
ZWFzZV9kZXZpY2UoY2FzY2FkZS0+Zmxvb3JzW2Zsb29yXSk7CiAKIAliY2hfZnJlZShkb2NnMy0+
Y2FzY2FkZS0+YmNoKTsKLQlyZXR1cm4gMDsKIH0KIAogI2lmZGVmIENPTkZJR19PRgpAQCAtMjA3
Niw3ICsyMDc1LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZzNfZHJpdmVyID0g
ewogCX0sCiAJLnN1c3BlbmQJPSBkb2NnM19zdXNwZW5kLAogCS5yZXN1bWUJCT0gZG9jZzNfcmVz
dW1lLAotCS5yZW1vdmUJCT0gZG9jZzNfcmVsZWFzZSwKKwkucmVtb3ZlX25ldwk9IGRvY2czX3Jl
bGVhc2UsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyX3Byb2JlKGczX2RyaXZlciwgZG9j
ZzNfcHJvYmUpOwotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
