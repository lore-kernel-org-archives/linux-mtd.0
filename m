Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4682CC61DD6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwhjxcuME7mix8rPAeLU6yt99wPWTXAcvdbEZCYdlSk=; b=DfmGbU9IFPH37B
	DDB1rjCn6HTh7+xmRyd/0es5cXzT7PNrbvi21dYJwMKR5ex1UKx8YKCZ9yncufjxigqyPmrUacit/
	lC4skkueoWacfONAZV5ODW9kqcLg8pfN0FRCajhsnCzatlF64zrMER7+G5qWJGqCshPav+VQ4cZCF
	Qen36WTDPbMjqwH3+/yfJy8KtvH4fPD/bj75ByyHjv7AvPOMJ1r2a+kfcS2SXIKG2EufzIqezPWcS
	+U+cfrQ6t4CVFK1FsnVvTfJsRVPz7vukhhNx8zl4LBG6AKp8Psc7OI678VnSP5V/bmrMrEfPmRpUE
	IUyTENSHHJ+UAUlhh+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KEg-0000000BLDi-12Ka;
	Tue, 01 Sep 2026 08:52:54 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KEd-0000000BLD2-0oLu
	for linux-mtd@lists.infradead.org;
	Tue, 01 Sep 2026 08:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788252768; x=1788511968;
	bh=Ely+8qEWUZ8LAcQDW+oMioD/wdydds9TQPREi9VZaz8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Fnc1sKtMo7rwkEJsxA09F2ooKpAALHmiVy9avBVWXf0WeScwthNmBdieFQla+Hrb5
	 jDr7TIOs+kmn1iwca0yp4Et6FBgvrKvvN100t4Ha2zOYp8VHKDO9xuKGL7H3fEB0HZ
	 tQbXUV2jtMwOTyUT5w2CgZbyjl7JwHqwPlVP81vO153lG7XB796g56XjNY4CcHDjFn
	 bqQeLp5Cy8sEyQ/55EdLcCxJgLWEhQT4Fw9ysIHGo+Ek38cjiu68iH/wGkKDnM0+iW
	 A0+lkJJM/oglgDndwbA3MmmrNBwtk0lXsalymPtUcoo7pXwwDGpm/9v5H9rd08QIY+
	 ugpNXNLBwcRDg==
Date: Tue, 01 Sep 2026 08:52:43 +0000
To: Michael Walle <mwalle@kernel.org>
From: Tobias Jakobsen <tjakobsen84@protonmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: allow the platform to supply write protection state
Message-ID: <NApbcrAD9xywxhssnr1w9hLntPOFyzs9BcW69a4ItinN0dKRCKsiEQ03xpTR0vo5aty4BDD7JjzUE8NH1OImzxL-OOf9GiHDe27_aWWzDBA=@protonmail.com>
In-Reply-To: <DL3UHUKN6Q0Y.1HN2PJA78WK3M@kernel.org>
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com> <20260831-spi-nor-platform-lock-v2-1-6cc75b909241@protonmail.com> <DL34U80UW849.3OYQBBTN7GRJ8@kernel.org> <bwwdwkT-nZT9pant-Nb_0PF8R531C5F2gDKrs-rZvW7MG1LHPf-MGmBH5YOSWTBnvZkRl4cPfXSzukcHaxoUZE1Ow0zvIfFCaOqYESzLjZE=@protonmail.com> <DL3UHUKN6Q0Y.1HN2PJA78WK3M@kernel.org>
Feedback-ID: 214933398:user:proton
X-Pm-Message-ID: bbd1bcf378a5854f4d0c441df69344155bc5f42e
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_015251_378123_FE4F5192 
X-CRM114-Status: UNSURE (   8.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, 1 September 2026 at 10:43, Michael Walle <mwalle@kernel.org> wrote:

> This feels like I'm talking with an AI agent. Honestly, this is
> rather discouraging.
> 
> So my short answer: I don't want to clutter the code just for some
> weird behavior and my point stands: whats the use, if it's not
> possible to unprotect that region. The intel-spi controller is
> rather restrictive anyway.

Already disclosed LLM was used in translating and research/execution. But point taken. I will bow out.
I never intended to write a patch but was asked.
My intention was to merely report a bug.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
