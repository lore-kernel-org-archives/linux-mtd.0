Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B22C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1YHCphlzPCvfV4n1PxQrpNCYomur+GT2NJeq0IX/G8=; b=wDj6Lbob06BQEQ
	oiwyS8J8Tm/VsISwv2/hXQVCQ0B3PW+gXal6Ipi1RtZX10FoSO3qtyTgoWHGuvbMX+38YWvTkB/7c
	MLvllGqLLt08fLSE14ab1WiJilcWj6x27KR8TVGw/1hGUyKS1h3cz4z2tRKapTIUWbCthdFaCP03M
	BMeXStneB/H5jmpZcMzSc+cIU++5ea9B8gYh2AEbMUjxdCfVvqHY/+kIIQfm1b2IS6BWcht/bRQqL
	ozEO8yjo2Blcan9X4M4qLZEB2mwylSir0tlOsNZ2VtpISe3PrThkmJUGOV2Oj1LTCLFZdv00Y1Gwa
	uNAa668JKDUHknX/aZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEZZ-008jDq-Ki; Fri, 03 Jun 2022 21:11:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWw-008h4J-Ji
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-0003rK-S9; Fri, 03 Jun 2022 23:08:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWd-006HqM-Ey; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWa-00E1HW-Q6; Fri, 03 Jun 2022 23:08:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/14] mtd: rawnand: atmel: Warn about failure to unregister mtd device
Date: Fri,  3 Jun 2022 23:07:52 +0200
Message-Id: <20220603210758.148493-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323; i=uwe@kleine-koenig.org; h=from:subject; bh=w7t3z1XUI/STdrsUUjD1Zed5MVKtRFjcH07jBAY9g6c=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfeF/dYwuJXY8Jg4msHfPQvAz1kd7FIE1gdvMiJ 2sLe5dyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp33gAKCRDB/BR4rcrsCR+/B/ 41uPhowocJ6NtP1+EEFqzGIx0uufPzBz2XJqWYskZyDB+XNb1/vTAhlpA+xQOWY/0aKjR2fdlrbe8c aXFy15gE9tOqKlV26tCPqyLsKJ1xmI4SP5ARYbTnjCTJUpiVAdGxsEKcjuy7uqlMjJK1hBWZ86oV2n hn1Fg7M85zV0h/xy0DsaU9EboSMEm2EpfvxykSHxcmkKmCAOj9f85I2c8rjWrjrCBvff44sliN6yoL nEwcANB0oRm9IMvSkDG7IVQt6nENLWP6TEkSfaUP5bWEAQi7A2/jfJuL5Ld8ts7hQTWZD9Bm1bepuS eQLlw5HiKP5/DLd3RyK0cxIVgvzAuX
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140826_689555_B124BC19 
X-CRM114-Status: GOOD (  15.43  )
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

VGhlIExpbnV4IGRldmljZSBjb3JlIGRvZXNuJ3QgaW50ZW5kIHJlbW92ZSBjYWxsYmFja3MgdG8g
ZmFpbC4gSWYgYW4KZXJyb3IgY29kZSBpcyByZXR1cm5lZCB0aGUgZGV2aWNlIGlzIHJlbW92ZWQg
YW55aG93LiBTbyB3YWlsIGxvdWRseSBpZgp0aGUgYXRtZWwgc3BlY2lmaWMgcmVtb3ZlIGNhbGxi
YWNrIGZhaWxzIGFuZCByZXR1cm4gMCBhbnlob3cgdG8gc3VwcHJlc3MKdGhlIGdlbmVyaWMgKGFu
ZCBsaXR0bGUgaGVscGZ1bCkgZXJyb3IgbWVzc2FnZSBieSB0aGUgZGV2aWNlIGNvcmUuCgpBbHNv
IGNoZWNrIHRoZSByZW1vdmUgY2FsbGJhY2sgdG8gYWN0dWFsbHkgZXhpc3QgYmVmb3JlIGNhbGxp
bmcgaXQuIFRoYXQKbWlnaHQgaGFwcGVuIGlmIG5jLT5jYXBzLT5vcHMgcG9pbnRzIHRvIGF0bWVs
X25hbmRfY29udHJvbGxlcl9vcHMuCgpUaGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2tzIHJldHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyB8IDUgKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCmluZGV4IDZlZjE0NDQyYzcxYS4uYmM2
ZWU2OTRmNGUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNv
bnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xs
ZXIuYwpAQCAtMjYyOSw3ICsyNjI5LDEwIEBAIHN0YXRpYyBpbnQgYXRtZWxfbmFuZF9jb250cm9s
bGVyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBhdG1l
bF9uYW5kX2NvbnRyb2xsZXIgKm5jID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKLQly
ZXR1cm4gbmMtPmNhcHMtPm9wcy0+cmVtb3ZlKG5jKTsKKwlpZiAobmMtPmNhcHMtPm9wcy0+cmVt
b3ZlKQorCQlXQVJOX09OKG5jLT5jYXBzLT5vcHMtPnJlbW92ZShuYykpOworCisJcmV0dXJuIDA7
CiB9CiAKIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgYXRtZWxfbmFuZF9jb250cm9sbGVyX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
