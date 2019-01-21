Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2131CC282F4
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE9F2084A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8fENFir";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwuvTAUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDE9F2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRXRKrPWMX/W6qzhYfVUx3madWeA8q2hFHnKKBxi4ho=; b=I8fENFirlXRVp0
	pUYKozEgJUbQ8aSYyos6IZqGTBl/gW+sL56G3ZiiTYxQsgqTdI2Dm08wyc8wp5NLeFOycn2u8mcVC
	VZCR0WXCkrmkIEZihZI9/bOC2lSCGe/SAm6KnfErQeADs5D94p1JZF/wGDbnVJQxnThF62jFqxMSm
	fDTg0Cy+AXwL/6CryTYRTgxAxqcXr1HnRSzR4+dfjXOxHdwqG6d6oG2zYtaQrxwMq0bHFbg0VA1a/
	gLMD9uKO5FKnJSthLbEp6hV2WUymv8slxqUdglat4ohZg7pUuK3x99bJbrEblnOUJnKWK5rX0mc3p
	3v0eUgktXFKDR43BdTww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glUp4-0000Zp-45; Mon, 21 Jan 2019 08:20:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glUp1-0000ZV-75
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 08:20:44 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4289920855;
 Mon, 21 Jan 2019 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548058842;
 bh=MJkhogmuL5zxjpl6vNApkWRVH7AW21+otVh6ZbeENRU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fwuvTAUcNBT/JDhzNCaO5ee+L0Y+eXRGTY85IswygpzJfQ5aGvNy10EaZZcesMuFM
 BNOSwTeiHal4mb1fj3pZ80OPZODXlWU1QUMxUx+7RVHs6CmDcDaJqRSn2tAxSb9FOz
 f/Plt1I24mi4NAt5MmThHwVLq6LRlEvInLL6ugog=
Date: Mon, 21 Jan 2019 09:20:33 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] mtd: rawnand: fsmc: Reset NAND timings on resume()
Message-ID: <20190121092033.68d5a2ed@bbrezillon>
In-Reply-To: <20190118210604.8231-1-linus.walleij@linaro.org>
References: <20190118210604.8231-1-linus.walleij@linaro.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_002043_278919_979F0569 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 22:06:04 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> When we go through a suspend/resume cycle the NAND
> timings may have been lost so reset the chip.

Actually, it's not only about resetting the timings (even if the side
effect of calling nand_reset() is that the core re-applies the
correct timings through ->setup_data_interface()). We need it to start
in a known working state.

> 
> This hardware will autonomously enable/disable the
> chip selects depending on what memory is accessed and
> chip selects are not software controlled, so we
> only lass chip select "0" for "all chips".

The FSMC driver only supports single CS chips which explain why you
only have to call nand_reset(chip, 0).

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index c9149a37f8f0..4050843dd35e 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -1164,6 +1164,7 @@ static int fsmc_nand_resume(struct device *dev)
>  		clk_prepare_enable(host->clk);
>  		if (host->dev_timings)
>  			fsmc_nand_setup(host, host->dev_timings);
> +		nand_reset(&host->nand, 0);
>  	}
>  
>  	return 0;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
