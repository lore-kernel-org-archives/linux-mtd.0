Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E45DE95A95
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz5lYXBjZpOK+uJDjAUlPaxgS3nZMp9JvgckJc93/FM=; b=AylywMJodjCaNl
	dBZKfZbV3vIFJiGhsyXXf9yPlArUAAE/dSNYvNjxmM3hvWXBnIRLprqSgnhzoyUJRtaW9wbYX2uXO
	4CaGDLQzqRq4VricVWzR+6SgXpnNwsaFsLy7yo/gLVP5hQL/qAmhapaN/JVAdYQMxzh2rz0snWKAw
	CFFY2vOW9q0uMrgyd2HkPEFLGcbVoclXgqJzN+N2X8n3AJwf/IJx0aHl3GKSSpX4iLut7T2uEfj2U
	NRcWHG4WqgOaFDuaXT5TynOZNzHYNITVC9wMly/kC57B/6Ym1yxGdqrMTTRYR6ePpahxSRm9pkfU0
	borV2Zz2H3xjtwjjcmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyc-009Dwv-0s;
	Sun, 08 Oct 2023 20:02:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009DrN-1t
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyS-0001eu-8h; Sun, 08 Oct 2023 22:02:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-000F01-NM; Sun, 08 Oct 2023 22:01:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-00Bf0y-EG; Sun, 08 Oct 2023 22:01:57 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 15/20] mtd: maps: pxa2xx-flash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:38 +0200
Message-Id: <20231008200143.196369-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eRilE9x01rJ/vVmv3NJKguLvFFI+I6Q8n+Tm/X4Ui7c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqVJETia3TYDyK5d12bMhAanmbcw1lC5v7Nf NY4eUhXsrCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKlQAKCRCPgPtYfRL+ TjowB/47vZnes3tlLrfLLjQg9jxgLsMxMdoI/1A59eCny/vo7sWAT6sIuivdBN5+Zqt/+Ps/O37 b9+vMA0rfFRAovADEsZsfia+YsYxWRE2EZ6rORYKP8JpNHByxHURBGkRZ2X/2d2buTOBYfwwoUs Cbs3g1+LSEgVbAf8IIo5mi21AWrNqZDHKhBw7D46M+8tHqjGmmx7+aT4ccEDURYwKgxOia83YzQ CuOkMJKCx6q4FZlMiU9dlvg4Dj4Tw5J8cpLNrRRN4Vqf525GJrUsDMbANrbQuuby6lT5JuJ6BrJ lQQM2KYNqi6Z8h15VMnT518bfSvPmsb5yEAJBLHCVs7oEydp
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_652249_9FB7EE4F 
X-CRM114-Status: GOOD (  15.93  )
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
ZXJzL210ZC9tYXBzL3B4YTJ4eC1mbGFzaC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
YXBzL3B4YTJ4eC1mbGFzaC5jIGIvZHJpdmVycy9tdGQvbWFwcy9weGEyeHgtZmxhc2guYwppbmRl
eCA2MmE1YmY0MWE2ZDcuLmYyYTJkNDcwNmYxZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbWFw
cy9weGEyeHgtZmxhc2guYworKysgYi9kcml2ZXJzL210ZC9tYXBzL3B4YTJ4eC1mbGFzaC5jCkBA
IC05OCw3ICs5OCw3IEBAIHN0YXRpYyBpbnQgcHhhMnh4X2ZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgcHhhMnh4X2Zs
YXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCitzdGF0aWMgdm9pZCBweGEy
eHhfZmxhc2hfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qg
cHhhMnh4X2ZsYXNoX2luZm8gKmluZm8gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOwogCkBA
IC0xMDksNyArMTA5LDYgQEAgc3RhdGljIGludCBweGEyeHhfZmxhc2hfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKmRldikKIAlpZiAoaW5mby0+bWFwLmNhY2hlZCkKIAkJaW91bm1hcChp
bmZvLT5tYXAuY2FjaGVkKTsKIAlrZnJlZShpbmZvKTsKLQlyZXR1cm4gMDsKIH0KIAogI2lmZGVm
IENPTkZJR19QTQpAQCAtMTI5LDcgKzEyOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIHB4YTJ4eF9mbGFzaF9kcml2ZXIgPSB7CiAJCS5uYW1lCQk9ICJweGEyeHgtZmxhc2giLAog
CX0sCiAJLnByb2JlCQk9IHB4YTJ4eF9mbGFzaF9wcm9iZSwKLQkucmVtb3ZlCQk9IHB4YTJ4eF9m
bGFzaF9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBweGEyeHhfZmxhc2hfcmVtb3ZlLAogCS5zaHV0
ZG93bgk9IHB4YTJ4eF9mbGFzaF9zaHV0ZG93biwKIH07CiAKLS0gCjIuNDAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
