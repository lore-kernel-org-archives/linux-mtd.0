Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBA7CDB479
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8TLruAsbQQUwoKzirjzjRNB5ylA9FX4N9kFJRUhzgU=; b=1Jm6/RUuOaU5ud
	qFNpAMklFu+uz3sd/nbSnkmhNM2xemivB1VZj+QfWi3Agt2YH5SznInVmCPyuNDZidupVp/vTbDgS
	WVtuKZm6w+cm/Z3/GzUNTiMPIcTDyEZ4ItdDeEAwbsHsKUYAOsDp31WrhCOJDlXQPyKexTdsnB2G7
	IVRh+82rpIMwoskr56CjOoWGWIAeBlJd5W8T3ifiSN6AZhTl6RaqRJnqfIHfzQKY8ii+/3JvRJUL5
	ikHDwiQQSXY/XK8EBGo1C3HHs3tNHc/Jvrc0p9TJsvIwd1hvXcJBXxgCzLLBjWcnZfrgWdRx8cAfM
	qUMGBfEaGRypE5zVmM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPXz-00000008017-3VhB;
	Wed, 24 Jun 2026 15:29:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPXy-0000000800M-0VgN;
	Wed, 24 Jun 2026 15:29:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 181294092D;
	Wed, 24 Jun 2026 15:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17A11F000E9;
	Wed, 24 Jun 2026 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782314989;
	bh=Rj2JE8zO6no8N19Xf+hPBpJrN/JqjceY+56abTgyUFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XLDm6g9GAodM8pC2/f+uZJTm0nL7Bn/5yyaDWiJwx5+0uYYpwkCS+LLaLjGywwJDh
	 6m38XQn4xXiB6IkaEG42dhGJHQio/K7E7J2aMGysRFwhnm/iquOfr5gSr3wQ95bxj6
	 52vQXPwgJNmCtibqjJzeKZu2j/XYEjBFt++Uub9lzAuLArT6s/oriu2G+vbptKypGK
	 RLKogMdVEdDzryCWPfCoK1x5XyMyFJtnibrR34mBCno1LaUrVqAcDgy1lb7himOpfk
	 Qu8FigHebosh39hFR3ZRyrwScqvaA3Q0f+e9NtNob5j5vrrdsJqBghRNz036X84f7E
	 x24ALDcbn1DUQ==
Message-ID: <fd56dbc6-7b30-4fdf-9a76-289cd5154cc5@kernel.org>
Date: Wed, 24 Jun 2026 18:29:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: fail DMA transfer on
 completion timeout
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260624144127.69075-1-pengpeng@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260624144127.69075-1-pengpeng@iscas.ac.cn>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/24/26 17:41, Pengpeng Hou wrote:
> lpc32xx_xmit_dma() waits for the DMA completion callback but ignores
> wait_for_completion_timeout(). A timed out DMA transfer is therefore
> unmapped and reported as successful to the NAND read/write path.
> 
> Return -ETIMEDOUT when the completion wait expires. Terminate the DMA
> channel before unmapping the scatterlist so the timed out transfer cannot
> continue to access the buffer after the error is returned.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/mtd/nand/raw/lpc32xx_slc.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index 3ca30e7dc..10c808020 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -430,6 +430,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
>   	struct dma_async_tx_descriptor *desc;
>   	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
>   	int res;
> +	unsigned long time_left;
>   
>   	host->dma_slave_config.direction = dir;
>   	host->dma_slave_config.src_addr = dma;
> @@ -467,12 +468,19 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
>   	dmaengine_submit(desc);
>   	dma_async_issue_pending(host->dma_chan);
>   
> -	wait_for_completion_timeout(&host->comp, msecs_to_jiffies(1000));
> +	time_left = wait_for_completion_timeout(&host->comp,
> +						msecs_to_jiffies(1000));
> +	if (!time_left) {
> +		dmaengine_terminate_sync(host->dma_chan);
> +		res = -ETIMEDOUT;
> +	} else {
> +		res = 0;
> +	}
>   
>   	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
>   		     DMA_BIDIRECTIONAL);
>   
> -	return 0;
> +	return res;
>   out1:
>   	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
>   		     DMA_BIDIRECTIONAL);

Thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
