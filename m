Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA4FC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:31:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDD92087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqEhUkTH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7e694dC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BDD92087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDy80f9ZSg+yxZpsGPsPFD7rpwl8zFS0lFgwgeKeGQs=; b=BqEhUkTHSTaNDU
	8AIDBqriEs9xi9ZtQdXuB3Is+QegXFKV14zC4yxfS2YvqRRY4ZsNRddnaQ9XufoaWj7X/CU1Qd/Oo
	hIxdRrET0ksDasABAVeNIjG7O858/v7aHBuPfkGsb1FiR60HVnd2+XqTAQf1fJ2Xn4Pi0udArVi0Z
	Jd4hmyi4RZpM2bSLmUHZFEJRNlaI+MQLJLB+W1tHeluv2Xofm8HrZHLSc36LA1VaUqHDlE2Spo7+N
	Z24ma5c/FhBiK4PeNpu/3bJBDDs+2NW40YaPfvKs13yNYprvaVLkYfj3SyoG6/WPI7lPyAR8/x/LT
	3WMSQ3V5Sidy5MNR9ArQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPYr-0001W6-MT; Fri, 18 Jan 2019 08:31:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPYo-0001Vh-I0
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:31:31 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C208220823;
 Fri, 18 Jan 2019 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547800290;
 bh=j4wJkOh8VBMuO7q7T8A8LmO1ycPaKYrAP1xJRrV6BI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l7e694dChsW66HRP6c7dVMlfNHym6zFg3coasB6CzNx+pXtx+nwo0NkkyGuKfZedB
 iLsYf+A5qKaL1Cb2K4AKhpx7n4u2QT8Cp6PbJv1IHwDfVvTuBWFVXrnx4QmvWigx9F
 fXoln2l/FdqaSNQcEIunaBM+jc3OTdbepd7ZCmh0=
Date: Fri, 18 Jan 2019 09:31:16 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 6/8] mtd: rawnand: jz4780-bch: Don't set clock rate in
 driver
Message-ID: <20190118093116.5f62efa5@bbrezillon>
In-Reply-To: <20190118010634.27399-6-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
 <20190118010634.27399-6-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_003130_633614_F4C6259B 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 22:06:32 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> This should be done in devicetree. Besides, it prevents us from
> supporting other SoCs which don't use the same clock frequency for the
> BCH hardware.

As I said earlier, I disagree with this statement, plus, you're
breaking backward compat with existing DTs when doing that.

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/mtd/nand/raw/jz4780_bch.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
> index 7e4e5e627603..161d3821e1c4 100644
> --- a/drivers/mtd/nand/raw/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/jz4780_bch.c
> @@ -57,8 +57,6 @@
>  #define BCH_BHINT_UNCOR			BIT(1)
>  #define BCH_BHINT_ERR			BIT(0)
>  
> -#define BCH_CLK_RATE			(200 * 1000 * 1000)
> -
>  /* Timeout for BCH calculation/correction. */
>  #define BCH_TIMEOUT_US			100000
>  
> @@ -348,8 +346,6 @@ static int jz4780_bch_probe(struct platform_device *pdev)
>  		return PTR_ERR(bch->clk);
>  	}
>  
> -	clk_set_rate(bch->clk, BCH_CLK_RATE);
> -
>  	mutex_init(&bch->lock);
>  
>  	bch->dev = dev;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
