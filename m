Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8722C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvNv+POHLgRvsUrezenwrfLPKrJRBn8kT+nKONsOcjY=; b=L87H2xI0R5SJLM
	n9n2PtnWD2ANgAZGmh1RktedJyqY1VsWgJQTndS8eD+npY/XNXVvVUtR0k3DOY4xBmpBrMGGDK9Ym
	j6rB5hlX8OjdijAxkL+38gxLaA1o4tIAiKFTAtaJmwvCIiBkmlxHXRinxPDEf00Fzd2C4PxOx6yQp
	0t/8kl2YJEsN1kN/Q5wn5Tca6mOs7mXx9U3IOqGYwmQ1XlMPOXD49VfCHX5GM+eyJShXStBGdvX/z
	AiD7r+CtYuP/ZFvfeOvpGWsc9yLEysIxNfX2IVbwYNXnEZGGzUJCFxWsk2Mu4yocTyJ7AVSbgk3N/
	irwYHSKupOGvhFC8ckQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEQ-00AwYi-1N;
	Sat, 01 Apr 2023 16:37:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEJ-00AwRk-0A
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=QUQzEwoqHYVhyNuFKBuptQkbUbzzYJu+BSQVVZBazMU=; b=By99Hu0cTSgIC4lSXn/pnS0cf5
	2Uod1G2mgVX88X4s7b/islH6pCz1hp6r19D696XS/Gv1QPpnFOu5hVEisFLqwcdDtnVLVtenjWQzi
	nZQ++2g2cizHMDvIONGuDAs4JZOC42j08PZ6G7u5/vjoHUnkk0FT5HPRRfiK8MExzRk9VWJnpzeRz
	8rFUdDBkZjpM5ZvFPHWKL6gU5EMOjffK/nxeyfhoH5ImDc4IxkJnI64lLYWGKVrxiKCjjxheLR6Lm
	reRAX9/s8hv3pz+6IN17+uZaNR1Ery44CQoBSJacDCPjdBsueEFGzefjh2tdxQJ0yRM6Ff94aouzN
	OSfYGnMw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxU-00CYOV-Tp
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxO-0000Gv-Mm; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-008GT2-Lk; Sat, 01 Apr 2023 18:19:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-009khq-7d; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 43/49] mtd: rawnand: sharpsl: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:32 +0200
Message-Id: <20230401161938.2503204-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lIBMbcBcuZgc7q2CmWYYOuZJ9PgnD9/upiDaofVxe0g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlOTLFRAnW2450EI+o6Ym9zeQr/Hb9RllnlJ 7uf5pkqZ8aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZTgAKCRCPgPtYfRL+ Tia/B/0YtKw50nTPyfVHFVtiT5MAd7XjRDogwgw54fLdPdMlaedqLAjqJBIwcojfqWSPdwfKBwr ElgC0AlFOp4zNQX6Uzvjp3U74nFpXW+qQ5h3XIdkuRb3uKAAdW6FgQ1AeVS6cfK3wowp0wq1nBb 2mci5RcWlyLj9j1wlqH/DtXh6tehnn5dD01H4nZ0evNJXo7CZuREIewYIjNDAMxljEVQJYKDjiU 4N+7U+CEzEOV39NW7l2faWqI1bUw28Eo8eKxMGZztNCw9zwD3ajLhVif1xTJET3YjWHPHg5l/Zr rsROmOJFR8PwpNyXsPXLbD5NOSqgOr5vUtf33ijyQcomIETH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172004_994688_D1EC06F9 
X-CRM114-Status: GOOD (  13.36  )
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
dmVycy9tdGQvbmFuZC9yYXcvc2hhcnBzbC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc2hhcnBzbC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hhcnBzbC5jCmluZGV4
IDUyY2U1MTYyNTM4YS4uMjQwMmRjNTQ2NWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zaGFycHNsLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hhcnBzbC5jCkBAIC0y
MTAsNyArMjEwLDcgQEAgc3RhdGljIGludCBzaGFycHNsX25hbmRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIC8qCiAgKiBDbGVhbiB1cCByb3V0aW5lCiAgKi8KLXN0YXRpYyBp
bnQgc2hhcnBzbF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3Rh
dGljIHZvaWQgc2hhcnBzbF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBzaGFycHNsX25hbmQgKnNoYXJwc2wgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJnNoYXJwc2wtPmNoaXA7CkBAIC0y
MjcsOCArMjI3LDYgQEAgc3RhdGljIGludCBzaGFycHNsX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkvKiBGcmVlIHRoZSBkcml2ZXIncyBzdHJ1Y3R1cmUgKi8K
IAlrZnJlZShzaGFycHNsKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBzaGFycHNsX25hbmRfZHJpdmVyID0gewpAQCAtMjM2LDcgKzIzNCw3IEBAIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNoYXJwc2xfbmFuZF9kcml2ZXIgPSB7CiAJCS5u
YW1lCT0gInNoYXJwc2wtbmFuZCIsCiAJfSwKIAkucHJvYmUJCT0gc2hhcnBzbF9uYW5kX3Byb2Jl
LAotCS5yZW1vdmUJCT0gc2hhcnBzbF9uYW5kX3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IHNoYXJw
c2xfbmFuZF9yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNoYXJwc2xfbmFu
ZF9kcml2ZXIpOwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
