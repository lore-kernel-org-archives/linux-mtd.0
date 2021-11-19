Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADEAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8813D61B5F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8813D61B5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hdLQ6KFmTHZbbQHsZDcsbgZi3FPgqnipyb7bXR097g=; b=iuRvzqBqTvjAph
	esGWmhR0xYwvH+SBbF31NsBD47WXoj9uKObX+F65mh1Lo3hg67NOHmDHnVTDgGYrj0nS2MKnQS/mE
	VeVGKPjqk0TAPTM1Fyxm5CQr/ULngamfKd5kFxhz5d9my5oRTtD1oCvZn9Oi/NUYmn3zh4fWXjhyW
	HbN4UzbvWkNGutGqbcB8vGNr2R5WnIAiszQxZL5cNQlQd6sVKsKtUDzylVXSM9meGbhBS9dEYTWpe
	rgAUvGEhwtVFaixn3ErxQixMPiBk72E3nwXlmBy+EAo2I5z6zlzyWGaemll4Zkp8JWLjmXPV417i+
	U4Pp4+XgbFeh8y9PcjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8jA-00BI9U-LM; Fri, 19 Nov 2021 18:35:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8j7-00BI8D-Mh
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 218D9FF80D;
 Fri, 19 Nov 2021 18:35:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-spi@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: mchp48l640: Warn about failure to unregister mtd
 device
Date: Fri, 19 Nov 2021 19:35:05 +0100
Message-Id: <20211119183505.1329724-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211108093153.63792-3-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'81e0f02ea2d28847d4fd2d36fcd2859f40b9488b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103509_907203_561082CF 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCAyMDIxLTExLTA4IGF0IDA5OjMxOjUxIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIHNob3VsZG4ndCBm
YWlsLiBXYWlsIGxvdWRseSBpZiBpdCBkb2VzIGFueWhvdy4KPiAKPiBUaGlzIG1hdGNoZXMgaG93
IG90aGVyIGRyaXZlcnMgKGUuZy4gbmFuZC9yYXcvbmFuZHNpbS5jKSB1c2UKPiBtdGRfZGV2aWNl
X3VucmVnaXN0ZXIoKS4KPiAKPiBCeSByZXR1cm5pbmcgMCBpbiB0aGUgc3BpIHJlbW92ZSBjYWxs
YmFjayBhIGdlbmVyaWMgZXJyb3IgbWVzc2FnZSBieSB0aGUKPiBzcGkgZnJhbWV3b3JrIChhbmQg
bm90aGluZyBlbHNlKSBpcyBzdXBwcmVzc2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpBcHBsaWVkIHRvIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
