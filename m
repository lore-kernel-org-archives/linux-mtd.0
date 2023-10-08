Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B33E95A9A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vpf8sAYKzUxLEF+w9o7LSM1zny80U9hx5+OiAQuzS5w=; b=AvAsKEBdbOlvfG
	T8NjkeHHe39S+aXlXJoN3+QgyY+vHTETBW59GcjX3x/HauPAW7ixhXQclcS7JVBegKcj3AUEJk3Nx
	iT84JGBzWIgsbvXGEIyeLIwH8kdIaVDBzoHZBmqstIRPDm2pGv6pRlKoYD3nFpdga7TNTS+vK/KXa
	CF8ULO5ThBmaucvwIE0rO1p/YPAnFirYxqQ9xJ6e8r/qgIBDT2z2IoK88t33+kuBikAu0BF6XCgJh
	F8soCbD1JQVP4CL/DtDQeLj0BKYBDS3kSKwT+ygupU31c85xc6n/JYTPViLHEk3C7I48Z3Odmp/Uf
	3qq3P8XC1+l0RH8d4Gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyj-009E1G-1c;
	Sun, 08 Oct 2023 20:02:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyZ-009Duw-1R
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyR-0001gH-6q; Sun, 08 Oct 2023 22:01:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-000F08-Ag; Sun, 08 Oct 2023 22:01:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyQ-00Bf16-1P; Sun, 08 Oct 2023 22:01:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 17/20] mtd: maps: sun_uflash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:40 +0200
Message-Id: <20231008200143.196369-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DPyP3SnLNcsZNdWXZbt3h9LX0tEZknP8RuOgrkv9eTU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqZRMIqBx3ioAidJW7LG0ktTpOC5OqUqMX1R ksEuMXdeECJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKmQAKCRCPgPtYfRL+ TituCACVXleKC5Tvyy4V53wmVmwAZMIuoNjzJfNmqhMIiz1SjiITzOA+C/7YmJ+UX6Ect622/tX n0LF+chEQuHH30Z0JpdbVqbGd1cyNEPlG9uQafCzi1XcBEJZ/t8O0tK6eZR7mV8Q491MpAElzAC vR8+H+60LsXhPXPrII8X6tfDYhmvfDGDtEt1P8vZVHlnnebq76Mi+WilVPuus4eDeQgVT6ce65w e0S2eXIxe+a+KOvPDMs/UADqkhqcLO4MyVZ3Oc3Gq5T3lY8BZOvATrKNsyi+Lf8UI3cuhyYqsG6 MezALNzhJFJ4NzASMnnC44sQ0J7M9f2AseVuEdvI8VSII6d4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130207_514278_8127DACB 
X-CRM114-Status: GOOD (  15.87  )
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
ZXJzL210ZC9tYXBzL3N1bl91Zmxhc2guYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL21h
cHMvc3VuX3VmbGFzaC5jIGIvZHJpdmVycy9tdGQvbWFwcy9zdW5fdWZsYXNoLmMKaW5kZXggMmJm
ZGYxYjdlMThhLi5mNThjZmIxNWQ2ZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL21hcHMvc3Vu
X3VmbGFzaC5jCisrKyBiL2RyaXZlcnMvbXRkL21hcHMvc3VuX3VmbGFzaC5jCkBAIC0xMTgsNyAr
MTE4LDcgQEAgc3RhdGljIGludCB1Zmxhc2hfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
b3ApCiAJcmV0dXJuIHVmbGFzaF9kZXZpbml0KG9wLCBkcCk7CiB9CiAKLXN0YXRpYyBpbnQgdWZs
YXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkKK3N0YXRpYyB2b2lkIHVmbGFz
aF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCiB7CiAJc3RydWN0IHVmbGFzaF9k
ZXYgKnVwID0gZGV2X2dldF9kcnZkYXRhKCZvcC0+ZGV2KTsKIApAQCAtMTMyLDggKzEzMiw2IEBA
IHN0YXRpYyBpbnQgdWZsYXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkKIAl9
CiAKIAlrZnJlZSh1cCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgdWZsYXNoX21hdGNoW10gPSB7CkBAIC0xNTEsNyArMTQ5LDcgQEAgc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdWZsYXNoX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3Rh
YmxlID0gdWZsYXNoX21hdGNoLAogCX0sCiAJLnByb2JlCQk9IHVmbGFzaF9wcm9iZSwKLQkucmVt
b3ZlCQk9IHVmbGFzaF9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSB1Zmxhc2hfcmVtb3ZlLAogfTsK
IAogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcih1Zmxhc2hfZHJpdmVyKTsKLS0gCjIuNDAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
