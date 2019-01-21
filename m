Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EBFC282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A88A2084A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mz//B41X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSfn3siP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A88A2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkbAQ4bzQdUC/dgGrMV75zf6lvi/0r+waXMDLhoJ9Mc=; b=Mz//B41X92eB7H
	g/UkxJWTqH0VtmNysIVhi4o54hmWZWIK57tWiw55qxenk0eJjEZEttlnpVdycKWcIAClsc4BzcASQ
	q+GHg22kb0UM7w0pzkTvwJslXRsz4kPf1Bddj+mLn5WnC9IZzMJk7qbTDnO3HwJ4yNieO3TvlcNBm
	qj/JGMwfl73F3Itz0LOTekFN0SeMLnC6J9YUUMgia00qqBWAEH6KYiu30reaA3TfTMFmahPxxINUD
	bOF88rr2Alc58JJa0AiPWs9V0ozzYX1z0aHAikb7t6VBubf8cjcq9caGRL5W7AnSLgIlq2XHu+tET
	NB5Bhi1QjdOOHJ8gPTgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glUqo-0001i8-Ih; Mon, 21 Jan 2019 08:22:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glUql-0001hT-Mc
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 08:22:32 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D91D214C6;
 Mon, 21 Jan 2019 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548058951;
 bh=Zy0xMNjpzTK6gI2Aqi7JpDXQfssMfrXCaF6BskGj2NU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GSfn3siPom75KlyF5NcDeFVSFqKAl+cQIkx7jqLnelMH8gujxowymFywvcpV+Szmx
 3HjdUQsQBwuzhGGQ6oOg6889/omwkDzWQg6TBYJ2Y1TDk9EGhlKdEoEzrxXwDbDcIN
 2XGbfIRJp8lf+QcuDYldQ6m2MX6bB7AbIEIyq3nI=
Date: Mon, 21 Jan 2019 09:22:22 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] mtd: rawnand: fsmc: Disable NAND on remove()
Message-ID: <20190121092222.2794d873@bbrezillon>
In-Reply-To: <20190118210615.8286-1-linus.walleij@linaro.org>
References: <20190118210615.8286-1-linus.walleij@linaro.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_002231_756451_798F89C5 
X-CRM114-Status: GOOD (  20.93  )
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

On Fri, 18 Jan 2019 22:06:15 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> This disables the NAND on remove() and the errorpath,
> making sure the chipselect gets deasserted when the
> NAND is not in use.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index 4050843dd35e..118b1b1cd8da 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -979,6 +979,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  	dma_cap_mask_t mask;
>  	int ret = 0;
>  	u32 pid;
> +	u32 val;
>  	int i;
>  
>  	/* Allocate memory for the device structure (and zero it) */
> @@ -1120,6 +1121,9 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  	if (host->mode == USE_DMA_ACCESS)
>  		dma_release_channel(host->read_dma_chan);
>  disable_clk:
> +	val = readl(host->regs_va + FSMC_PC);
> +	val &= ~FSMC_ENABLE;
> +	writel(val, host->regs_va + FSMC_PC);

Can you move this code in a separate function so that you don't have to
duplicate the logic in fsmc_nand_remove()?

>  	clk_disable_unprepare(host->clk);
>  
>  	return ret;
> @@ -1131,10 +1135,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  static int fsmc_nand_remove(struct platform_device *pdev)
>  {
>  	struct fsmc_nand_data *host = platform_get_drvdata(pdev);
> +	u32 val;
>  
>  	if (host) {
>  		nand_release(&host->nand);
>  
> +		val = readl(host->regs_va + FSMC_PC);
> +		val &= ~FSMC_ENABLE;
> +		writel(val, host->regs_va + FSMC_PC);
> +
>  		if (host->mode == USE_DMA_ACCESS) {
>  			dma_release_channel(host->write_dma_chan);
>  			dma_release_channel(host->read_dma_chan);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
