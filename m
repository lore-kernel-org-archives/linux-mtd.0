Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205CAC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=joXrB7wswvM4YTnhFKzfx6I1y2FOD9Ds0m26Kuauj+0=; b=cq5Rt8bOdF6gm7
	9N1zEIzuNQHwFiK5rXQKkvziHVXKcv7HbKJuZRRNw9TcZLldUDXo5cCLItOtLYhzPmwDRud/eMp8x
	plQGwfcsgUUA29Orsp53EiDMSkNZlR+tmHJ9xNmKF8hbnOo8t9kSW6fVDOtJqpcOyfmcA4QD1OQJj
	WQOSup8OQTKSYiDydxlZc1fm+rSZ/3gDUwtgSNTSIYw0T4qvAK41V5Xd7cGHsyw+urRontmVugCzI
	8qBa5o1W2UZYUn1R6lTUCesYUvPc6BlGNWDL8DlLue0eC//gnZbtNiNtARYC255Gys28esbSrIekk
	76gW7ZgFg+PkyKd1mDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2Sk-00FG0X-UK; Thu, 27 Jan 2022 10:57:10 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2SY-00FFxO-1i; Thu, 27 Jan 2022 10:56:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC33BC0015;
 Thu, 27 Jan 2022 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643281014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OM9n9EPyy+oE/3RIIaQWbjloRnD62PtIiDYWCfnxUx4=;
 b=XZQSYW874hNWqHuZ23wpVS33bhoxQQn99jKHjojoq6g+3XVJyQ332ZIIgsAGBzu/7bONnX
 G/A6KzeDzeNuwYMCStoouJSWvjFtClv4lMZiR1wT37ZiUygiWWLIJ8ZVK5E/taIZ7aQCo5
 vviD5b0tdCyYJc5f6xVLwoVwmagsczEuzCwO6C3Us/jvEGYbqRgQkp9TfNyZGX1Hd/YEmT
 cwMqr4yCzG/0Q78flBLY3HIFWWND3nsraYb2uVDIpnwAQM4e4aQEj+SDMALM8vTCs5W+w9
 NwureuIIFsg+vuT9vlp+ECii/b9OwbG3DyjYC5i0dtTHbyBPGeQlG4nkclaT0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] mtd/memory: omap: Fix build dependencies
Date: Thu, 27 Jan 2022 11:56:52 +0100
Message-Id: <20220127105652.1063624-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_025658_279133_D2606009 
X-CRM114-Status: GOOD (  12.86  )
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

VGhlIE9tYXAyIHJhdyBOQU5EIGNvbnRyb2xsZXIgKE1URF9OQU5EX09NQVAyKSBzZWxlY3RzIHRo
ZSBPbWFwIG1lbW9yeQpjb250cm9sbGVyIChPTUFQX0dQTUMpIGZvciB0aGUgQVJDSF9LMyBwbGF0
Zm9ybXMgYW5kIGZvciBjb21waWxlCnRlc3RpbmcuCgpUaGUgT21hcCBtZW1vcnkgY29udHJvbGxl
ciAoT01BUF9HUE1DKSBkZXBlbmRzIG9uIE9GX0FERFJFU1MgYmVjYXVzZSB0aGUKZHJpdmVyIHVz
ZXMgb2ZfYWRkcmVzc190b19yZXNvdXJjZSgpLgoKVGhpcyBtYXkgcHJvZHVjZSB0aGUgZm9sbG93
aW5nIHdhcm5pbmc6CldBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQg
Zm9yIE9NQVBfR1BNQwpEZXBlbmRzIG9uIFtuXToKICAtIE1FTU9SWSBbPXldICYmIE9GX0FERFJF
U1MgWz1uXQpTZWxlY3RlZCBieSBbbV06CiAgLSBNVERfTkFORF9PTUFQMiBbPW1dICYmIE1URCBb
PW1dICYmIE1URF9SQVdfTkFORCBbPW1dICYmCiAgICAoQVJDSF9PTUFQMlBMVVMgfHwgQVJDSF9L
RVlTVE9ORSB8fCBBUkNIX0szIHx8IENPTVBJTEVfVEVTVCBbPXldKSAmJgogICAgSEFTX0lPTUVN
IFs9eV0KCkFzIHRoZSBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKCkgaGVscGVyIGhhcyBhIGR1bW15
IGltcGxlbWVudGF0aW9uCnJldHVybmluZyBhbiBlcnJvciB3aGVuIE9GX0FERFJFU1MgaXMgbm90
IHNlbGVjdGVkLCB3ZSBkbyBub3QgbmVlZCB0bwpzZWxlY3QgT0ZfQUREUkVTUyBmcm9tIHRoZSBP
TUFQX0dQTUMgS2NvbmZpZyBtZW51IGZvciBjb21waWxlIHRlc3RpbmcKcHVycG9zZXMuIE5vciB3
ZSBhY3R1YWxseSBkbyBmb3IgSzMgcGxhdGZvcm1zLCBidXQgaW4gb3JkZXIgdG8gbm90IGJyZWFr
CnRoZXNlIHBsYXRmb3JtcyB3ZSBjYW4ganVzdCBzZWxlY3QgT0ZfQUREUkVTUyBmcm9tIEFSQ0hf
SzMgZGlyZWN0bHkuCgpGaXhlczogZGJjYjEyNGFjZWJkICgibXRkOiByYXduYW5kOiBvbWFwMjog
U2VsZWN0IEdQTUMgZGV2aWNlIGRyaXZlciBmb3IgQVJDSF9LMyIpClJlcG9ydGVkLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTdWdnZXN0ZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClNp
Z25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0t
LQogYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyB8IDEgKwogZHJpdmVycy9tZW1vcnkvS2Nv
bmZpZyAgICAgICB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgYi9hcmNo
L2FybTY0L0tjb25maWcucGxhdGZvcm1zCmluZGV4IDdkNWQ1ODgwMDE3MC4uMWEwZDRiNTc1Yjk1
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zCisrKyBiL2FyY2gvYXJt
NjQvS2NvbmZpZy5wbGF0Zm9ybXMKQEAgLTEyMyw2ICsxMjMsNyBAQCBjb25maWcgQVJDSF9LMwog
CXNlbGVjdCBUSV9TQ0lfSU5UUl9JUlFDSElQCiAJc2VsZWN0IFRJX1NDSV9JTlRBX0lSUUNISVAK
IAlzZWxlY3QgVElfSzNfU09DSU5GTworCXNlbGVjdCBPRl9BRERSRVNTCiAJaGVscAogCSAgVGhp
cyBlbmFibGVzIHN1cHBvcnQgZm9yIFRleGFzIEluc3RydW1lbnRzJyBLMyBtdWx0aWNvcmUgU29D
CiAJICBhcmNoaXRlY3R1cmUuCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS9LY29uZmlnIGIv
ZHJpdmVycy9tZW1vcnkvS2NvbmZpZwppbmRleCAzMGJmZjZjYjFiOGQuLjI0MWYwOTI1Y2JmMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tZW1vcnkvS2NvbmZpZworKysgYi9kcml2ZXJzL21lbW9yeS9L
Y29uZmlnCkBAIC0xMDQsNyArMTA0LDYgQEAgY29uZmlnIFRJX0VNSUYKIAogY29uZmlnIE9NQVBf
R1BNQwogCWJvb2wgIlRleGFzIEluc3RydW1lbnRzIE9NQVAgU29DIEdQTUMgZHJpdmVyIiBpZiBD
T01QSUxFX1RFU1QKLQlkZXBlbmRzIG9uIE9GX0FERFJFU1MKIAlzZWxlY3QgR1BJT0xJQgogCWhl
bHAKIAkgIFRoaXMgZHJpdmVyIGlzIGZvciB0aGUgR2VuZXJhbCBQdXJwb3NlIE1lbW9yeSBDb250
cm9sbGVyIChHUE1DKQotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
