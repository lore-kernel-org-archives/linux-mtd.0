Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC38FCC6B2F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gg11OjufKB6oRvN2hcE5Q5Nej5dZ3Y/dR4iQFN3ekk=; b=d5A4l8Xp8aTzMW
	N3gBg7zVxGf8M8FQ/WgXFCPL0tOyFu4tLCpW7NrWtLiAVvP+dSwVzGyNb/wsN5qJa01vcH11xfm5h
	ebbVk89R9Fn18CoDy+67uJSfb8zcsIviS0wG6eL5CiPZn/7JEKdKnQ6DDsLnqhdXQnyy5UL+Zo5AV
	Et+4KtbHf2AqlwhWp4TMgGAbkGBj+cwvADqnl/JUXwVhBNIRdnpeEvr2r5SdtruqCqqt4+eVeK8A9
	K1WIhto0UGhdZPYKukq89zEwF9nlHzpts1xaITMV4qchoxtIsJsbepNm6rzC5Zs2L5VuzAXmOyJzl
	1z0R9CQztwQHTXX7bV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFkn-0000000H1fC-3yCp;
	Thu, 15 Oct 2026 07:19:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFkl-0000000H1eb-1Gq2;
	Thu, 15 Oct 2026 07:19:52 +0000
Date: Thu, 15 Oct 2026 09:19:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792048785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMYu6XVNal0AJcS3PUZBVy2r/rGrO8ylXWPO84VbQeo=;
	b=2dhabvrmaiB4B2VAEeswkB7yZk+pT6F/neoH/LS31NDI2EasvjB3yVv4534B6du3DDiMSw
	gMrc965fNvSGCVlP87f6uNl3leecQv3nIZRDmwfmb8S2h/cJW559zsz1m+2w3dBJKq/Ruc
	CwYvgSTmAKPw18wco3hfv5EYFXB0cfCf1E5PBGBQET2HTHFjkzd2aEsSZKUubuexi86NZu
	9JjQ++YpNiWDfm8w5sPlbjl7kAfi5zXU47N+ESy5a776vyVgUcr93gLbDSCiqK1Q+sWEDr
	PfqofcDMr1vdOjhET3/jJZnJZC2gee+wkLn2s1LESxe+zvqTtxnEuGerbM2Mdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792048785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMYu6XVNal0AJcS3PUZBVy2r/rGrO8ylXWPO84VbQeo=;
	b=AkUw+EUCmsaDH+sGC2dLGo8hwRAJMoyzJ70p9vgVLsV/6hgT9AkOw03tMby+l6jzeW5i4D
	mP6nSW669f2bkfAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Message-ID: <20261015071943.7OihPadq@linutronix.de>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
 <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_001951_507639_DBD551C3 
X-CRM114-Status: GOOD (  13.41  )
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

On 2026-10-14 19:33:51 [-0600], James Hilliard wrote:
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -454,16 +457,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
>  		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
>  
>  	if (!use_polling) {
> -		init_completion(&nfc->complete);
> +		reinit_completion(&nfc->complete);
>  
>  		writel(events, nfc->regs + NFC_REG_INT);
>  
>  		ret = wait_for_completion_timeout(&nfc->complete,
>  						msecs_to_jiffies(timeout_ms));
> -		if (!ret)
> +		if (!ret) {
> +			/* Drain the handler before it can restore an old IRQ mask. */
> +			disable_irq(nfc->irq);
>  			ret = -ETIMEDOUT;
> -		else
> +		} else {
>  			ret = 0;
> +		}
>  
>  		writel(0, nfc->regs + NFC_REG_INT);
>  	} else {
> @@ -476,6 +482,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
>  
>  	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
>  
> +	if (!use_polling && ret) {
> +		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
> +		readl(nfc->regs + NFC_REG_INT);
> +		enable_irq(nfc->irq);

Shouldn't you re-read NFC_REG_ST, checking if the event became true even
in the case of a timeout?
Say the interrupt wake the thread but the thread never had a chance
to run. The timer (on another CPU) had a chance to run and did wake this
thread. Checking the event in the timeout case would help to prevent
that.

> +	}
> +
>  	if (ret)
>  		dev_err(nfc->dev, "wait interrupt timedout\n");
>  

Sebastian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
