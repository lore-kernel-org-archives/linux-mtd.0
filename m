Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF3FCCF2D5
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1VZz4y3Bci+nhNm44GvqGAFX6Ih0Pv/JpfoaHMw3lk=; b=in4twaFY4lZvSC
	mLXDdIu9mK41yoedHJyFzmYL7/MQV3nXCXgrL+4DgWE4Qoqq8njxX0r3paHeV1jL8PA7vZQk3FJxo
	lZTi15Wz/Zs1PkXuUBqIkKklsi5hOI2xc9a3G3eGQweW88Zbnfn6Zonz62na+ThIScxwLA1deJxnA
	iP5ciie8gFzZawy1G2ynZK6I7/NJee7HB6qOgNHbX9vuHyHYPD56l7BeG3/77byNZQidSqza0m9Rf
	+m+WgR9OpvJLJb+FtgfrFElbXelB9OE3gHXBDPj0FK/ffFzQqNkp+K41PVMnBNDYVXG1uHaf5cps9
	4wJ/q3EzAmYDIILF0uGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHg-00000001jVZ-1lrQ;
	Mon, 19 Jan 2026 10:14:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHM-00000001jTV-3tCr
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:14:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A30AC214C4;
	Mon, 19 Jan 2026 10:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E46360731;
	Mon, 19 Jan 2026 10:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D74E710B68B1A;
	Mon, 19 Jan 2026 11:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817672; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3UnNuPM8PDG65A1Frgdc8p6dUPTQ3lp3mLNODMiICsM=;
	b=Xdlxh3Bq1h6GBvIX4n3Yvs4iHC8lkrqMSQYK2u5RMaS9I01E2so4RVNOdDkpgC0hMHPQNO
	WNFTEfPDseO6NMZy9q6azN9mgPz4et6catVfbwlv/OIDSlRoaovIAI1GK7Erl7xd8fZApV
	36Niu9wgWYTqYiF2LXUdY/L2ZqnXgA8pvdFV6i8K9ATpAajmQuSEX7h9TyuiinGXAITPqZ
	5Z8WIX7OuSfYyiIzPTEFXiARIaI8CxX69/mVuweoWCZxSb5vb0cnn3/RxuJMXannXEHv3l
	Ta/W5yvh2szqE5cfn94DH7LGjI26av2zc2hmagfFPBHLUY0SlpffMeHkqzmsOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Manivannan Sadhasivam <mani@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] mtd: rawnand: brcm: Simplify with scoped for each
 OF child loop
Message-Id: <176881766762.2432692.2670018963471103183.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:14:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021437_106635_7E17381F 
X-CRM114-Status: UNSURE (   6.61  )
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

T24gRnJpLCAwMiBKYW4gMjAyNiAxMzo0OToyOCArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBVc2Ugc2NvcGVkIGZvci1lYWNoIGxvb3Agd2hlbiBpdGVyYXRpbmcgb3ZlciBkZXZp
Y2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEKPiBiaXQgc2ltcGxlci4KPiAKPiAKCkFwcGxpZWQgdG8g
bmFuZC9uZXh0LCB0aGFua3MhCgpbMS83XSBtdGQ6IHJhd25hbmQ6IGJyY206IFNpbXBsaWZ5IHdp
dGggc2NvcGVkIGZvciBlYWNoIE9GIGNoaWxkIGxvb3AKICAgICAgY29tbWl0OiBmMzcwMWJhMTgw
NjlkMjEwOGQxMzQyNzFhNWFkNmQwYTY5ZDljYTM2ClsyLzddIG10ZDogcmF3bmFuZDogZGVuYWxp
OiBTaW1wbGlmeSB3aXRoIHNjb3BlZCBmb3IgZWFjaCBPRiBjaGlsZCBsb29wCiAgICAgIGNvbW1p
dDogNzU4OTE2ZTIyMDFmNGEzMThiOGQyOWYyOGM0ODc0NzRiNDMyY2RlMApbMy83XSBtdGQ6IHJh
d25hbmQ6IGluZ2VuaWM6IFNpbXBsaWZ5IHdpdGggc2NvcGVkIGZvciBlYWNoIE9GIGNoaWxkIGxv
b3AKICAgICAgY29tbWl0OiBjNTIyYzE5OGFhN2FmMTdkNDg3MTc5ZTI3MWZiZDU3MzUxYmNiNzk1
Cls0LzddIG10ZDogcmF3bmFuZDogcWNvbTogU2ltcGxpZnkgd2l0aCBzY29wZWQgZm9yIGVhY2gg
T0YgY2hpbGQgbG9vcAogICAgICBjb21taXQ6IDQyOTgzODM3ZWYyYmJhOGEzZmI5ODQwNTVlYWM4
MTRiY2NhYjhhMWUKWzUvN10gbXRkOiByYXduYW5kOiB2ZjYxMDogRml4IFd2b2lkLXBvaW50ZXIt
dG8tZW51bS1jYXN0IHdhcm5pbmcKICAgICAgY29tbWl0OiAzYjk2MDU5ODdlNjAyYWRjNWQwZjRi
MGQwOGViYjMyYWMxMzI3OWUzCls2LzddIG10ZDogcmF3bmFuZDogdmY2MTA6IFNpbXBsaWZ5IHdp
dGggc2NvcGVkIGZvciBlYWNoIE9GIGNoaWxkIGxvb3AKICAgICAgY29tbWl0OiA4ZjUxYjZiZTI2
OTc0NmQ5YTZhYmZmNGE1YWJjOGI3YWE2ODBjNjU5Cls3LzddIG10ZDogc3BpLW5vcjogaGlzaS1z
ZmM6IFNpbXBsaWZ5IHdpdGggc2NvcGVkIGZvciBlYWNoIE9GIGNoaWxkIGxvb3AKICAgICAgY29t
bWl0OiBhYThjYjcyYzIwMThjNzJiOWMyZmU1YThlNTVkNTMwZGIzYmM3NTdlCgpQYXRjaGUocykg
c2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2Yg
dGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoK
S2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
