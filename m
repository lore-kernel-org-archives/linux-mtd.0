Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75947C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23hPTFHIiKvYXsKyJpBPTiCytcNn8V+hYmybv0LNfd4=; b=HwHBKYG5ey53eK
	6c+OtQT+7uDMOODJOrZ5yZ/gyqKIdfBXbPG+bWNikoo3W2zuzvHXfEVot8k8u0xf2qOUKAtTBzh8R
	3I8yo0P2Lev+oSuffz9chPxaDWCOSIjh7cLFzolPBRBMxz01oyFuJQMg2hm6n+vMD7TFSER5gQP7s
	+fghWSnTe5GnLa+FM0/5m86z/PGjS7Q9/VKogqerNCnLvufi9/g7RlixsihpKL3kKp/y0dXdgl6++
	93x4ZuEXeIgcrN8lT7csRxzZwnnVlzWQYOP+P2fKwNc3EY6fN+6gOexRG9fo3q+nc2SmNUIA67uxz
	Qn160hWhTwmC9+EcwDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidyI-00Asd6-04;
	Sat, 01 Apr 2023 16:20:54 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxc-00AsH9-2g
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pwNlpReiP4UFJrHRU78ls469VQ+wJyJRTNIvcBVxz2s=; b=TsgSd7A+d1clkLuhD+5qBe+jQ3
	NAe58woNl/mBNHu2J3IgRFADqf32cOTkoguqvgvY41PexVFnViYUZeSPKzkFxMIGnOJA6PRASMRm0
	8PSKEsuGQFKmZZH/iYdV6JBs1NRGr0Zb7BfZoKyTBUUbptRwJsN3ClJgKQXVFwLMzPxz8kxwpFR8w
	zVPULggFM+swDoiKaxIcmmvBLg6v4xgYNe9/uXgXl0mb3+Ql3CSgjvEjKJkrCzmfGqzcPNZ8K1ewd
	Ys9E3sr6HQEfSa/YeIhRKpZLBTdYPIZgb7RFgTCGucNZCuhROqpOkLE1J4Gu17zoaLVKfMhpn2PmJ
	71/EN6tw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DL0-24
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-0008Qw-A4; Sat, 01 Apr 2023 18:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-008GSC-BI; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-009khG-Dq; Sat, 01 Apr 2023 18:19:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	kernel@pengutronix.de
Subject: [PATCH 34/49] mtd: rawnand: oxnas: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:23 +0200
Message-Id: <20230401161938.2503204-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ppMyZMtxr0Rfp3eW34pywE1GTBWM+Uo0QrudEukFwqg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlEE9Bn1CzxMRpIgPFMxewAVFVlbB8/wSZk6 CO7rGdovj+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZRAAKCRCPgPtYfRL+ TjY0CACpcD3sTcg3BqqwgsCA0VfAKHEH+BQf5s6T/Iyi4FE++rZIblv7tyKbpufw3b1UPiaXL5F nxp5tY+gFy92GBIMbYWy9yIHvUvtntg9WLpMZGObSxfqbqWAzNEf5QmA8YZsnfhdE2JhAE7HT1P +M3rP1rDmB9cHEOS6uLmYd455sa+HXBzxiYPJhS0zfsnjS2fqkQanFZ+UXSlsvFDF0FFmlKIsy6 AJgh696Aa4GUNlCVMMQodNBwANOK92a2CZMwmuBQ+uVOnqXG2MytUcxNxnVFlujgbsXRdnpdRoa upTfoOFFJWFZnpXY94J/CMGjSOIAr50i5pC6DEX2My+SSWxU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_963866_76401821 
X-CRM114-Status: GOOD (  16.35  )
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
dmVycy9tdGQvbmFuZC9yYXcvb3huYXNfbmFuZC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvb3huYXNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3huYXNfbmFu
ZC5jCmluZGV4IGNkMTEyZDQ1ZTBiNS4uZTNjOTgwN2RmMWNkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9veG5hc19uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3hu
YXNfbmFuZC5jCkBAIC0xNzEsNyArMTcxLDcgQEAgc3RhdGljIGludCBveG5hc19uYW5kX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIGVycjsKIH0KIAotc3RhdGlj
IGludCBveG5hc19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3Rh
dGljIHZvaWQgb3huYXNfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IHsKIAlzdHJ1Y3Qgb3huYXNfbmFuZF9jdHJsICpveG5hcyA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXA7CkBAIC0xODQsOCArMTg0LDYgQEAgc3Rh
dGljIGludCBveG5hc19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CX0KIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShveG5hcy0+Y2xrKTsKLQotCXJldHVybiAwOwog
fQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBveG5hc19uYW5kX21hdGNoW10g
PSB7CkBAIC0xOTYsNyArMTk0LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgb3huYXNfbmFu
ZF9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG94bmFzX25hbmRfZHJp
dmVyID0gewogCS5wcm9iZQk9IG94bmFzX25hbmRfcHJvYmUsCi0JLnJlbW92ZQk9IG94bmFzX25h
bmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gb3huYXNfbmFuZF9yZW1vdmUsCiAJLmRyaXZlcgk9
IHsKIAkJLm5hbWUJCT0gIm94bmFzX25hbmQiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBveG5hc19u
YW5kX21hdGNoLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
