Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2CEE95A82
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYlhWfWLSAu7WB/vmL6kzBl6KUBdvPUbuQyb0EFcpaE=; b=FX3Hwzrq8R36ly
	HcQ8hXN6cTJ7zej2I2OjonAsLPCHtItcmnKFf75hJ5dUrIwi88xqo5wNRlffZ85tS9scsKothJVSP
	vgYINeLW13sTeBukJP0goNMQtuFLcuE/YPkBAKE1loinEHXEwPvfkKSI712BwaYZ5DEl0kfkbuZoh
	w65G74RVu5T3tugOlWPOTFgchDrcBKC6nOqmE/5eFJgxw2yUOiS6JwNgEhpsGpHnszQLt2/yusPMm
	OS1yiUSczqbptsu3RXGbgliAQLaa0zjdU3F30MbHZuIECnYqNyJ9NF83W2C5y6r4vySNw2SwVklqB
	XveAMaLb2IYiMO6Gjaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyi-009E08-0q;
	Sun, 08 Oct 2023 20:02:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyW-009Dsm-1x
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-0001e7-Ao; Sun, 08 Oct 2023 22:01:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-000Ezv-Ey; Sun, 08 Oct 2023 22:01:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-00Bf0u-5i; Sun, 08 Oct 2023 22:01:57 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 14/20] mtd: maps: plat-ram: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:37 +0200
Message-Id: <20231008200143.196369-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HqgY375rY6njHZqGPztbx5eLpqh95n5fI2juJ0Tb2ig=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqTVea3VaqV8HToVjjyezfOW3x45BfyZMvim TVoaGPp84iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKkwAKCRCPgPtYfRL+ TgdEB/sG7i1NGIH6FbDdP6HQdrs0OYwSTdKq4y7goM8+cm9sZo7vg/0X4T8Nn7GjMUhoHVFXSre SE25JuB+oYuQdt5RHgnDEaG5y+R2bf/7aRzhYlyGNrhBvi9PCW8p/54R9itk9mF8eq1SthqATYI gzhPW9Hdsrf//oW+GncF9wlVkxVD8qKhGnCLedndEv3VKIsKDNLgGvECqEavWGRKzoEevdgRTPh qMyCVda1g2AH9TN8ncVqi56u0A0yET9fldirbQOa9ExqkpHRgyaC/fJTS7996KkWeimcnS2W+sL En0NZyjvz+fcKI1D0ymwGkKY0jr6f+eQt5EdCu2r66xkycT9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130204_638770_A4EC3B0B 
X-CRM114-Status: GOOD (  17.46  )
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
ZXJzL210ZC9tYXBzL3BsYXQtcmFtLmMgfCA4ICsrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL21h
cHMvcGxhdC1yYW0uYyBiL2RyaXZlcnMvbXRkL21hcHMvcGxhdC1yYW0uYwppbmRleCA0YzkyMWRj
ZTczOTYuLjhiNzM2ZjAyOWY4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbWFwcy9wbGF0LXJh
bS5jCisrKyBiL2RyaXZlcnMvbXRkL21hcHMvcGxhdC1yYW0uYwpAQCAtNjUsMTQgKzY1LDE0IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBwbGF0cmFtX3NldHJ3KHN0cnVjdCBwbGF0cmFtX2luZm8gKmlu
Zm8sIGludCB0bykKICAqIGNhbGxlZCB0byByZW1vdmUgdGhlIGRldmljZSBmcm9tIHRoZSBkcml2
ZXIncyBjb250cm9sCiAqLwogCi1zdGF0aWMgaW50IHBsYXRyYW1fcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBwbGF0cmFtX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBwbGF0cmFtX2luZm8gKmluZm8gPSB0b19w
bGF0cmFtX2luZm8ocGRldik7CiAKIAlkZXZfZGJnKCZwZGV2LT5kZXYsICJyZW1vdmluZyBkZXZp
Y2VcbiIpOwogCiAJaWYgKGluZm8gPT0gTlVMTCkKLQkJcmV0dXJuIDA7CisJCXJldHVybjsKIAog
CWlmIChpbmZvLT5tdGQpIHsKIAkJbXRkX2RldmljZV91bnJlZ2lzdGVyKGluZm8tPm10ZCk7CkBA
IC04NCw4ICs4NCw2IEBAIHN0YXRpYyBpbnQgcGxhdHJhbV9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlwbGF0cmFtX3NldHJ3KGluZm8sIFBMQVRSQU1fUk8pOwogCiAJa2Zy
ZWUoaW5mbyk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogLyogcGxhdHJhbV9wcm9iZQpAQCAtMjA3LDcg
KzIwNSw3IEBAIE1PRFVMRV9BTElBUygicGxhdGZvcm06bXRkLXJhbSIpOwogCiBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBwbGF0cmFtX2RyaXZlciA9IHsKIAkucHJvYmUJCT0gcGxhdHJh
bV9wcm9iZSwKLQkucmVtb3ZlCQk9IHBsYXRyYW1fcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gcGxh
dHJhbV9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0gIm10ZC1yYW0iLAogCX0sCi0t
IAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
