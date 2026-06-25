Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2757CDB479
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2026 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwH/pQBPP1IpLNvH1esSKA2dG4pFBVmssD9x3BgF13U=; b=LrTpaOZp2sqf0c
	VAxf5n/+ZzWbMulHkgJk5IdFQv2fBsldLXZt9vuORBL2kRM5j+JX/tPq5clqtrSsbnsqJfG6qizZ+
	DS/An5LjpQW6cqxXlEZ2ej+nBlz+eMIfc9aY0Y0v4u7Z4rxW/SQtJ7zElRRNYl951oN+KtHORXgDv
	9c53h5KRkTf+S7mG+2hDUBvBdcuGB/l8r2gsKEnTTjT5LePhG7HMXOrj2pFGLoF7x0YItSnLU97it
	drbgMpTb9+ybNHE9Powca+1Clj6yOuZhm1y0329Ljn17qHtQTV3XlChHVe1t3N0E4NQSrVM5YqnoT
	a5tqUgHfDZlyKVBKxHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckLc-00000009FT6-0Kr2;
	Thu, 25 Jun 2026 13:42:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckLa-00000009FSt-3JuO;
	Thu, 25 Jun 2026 13:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9B2460018;
	Thu, 25 Jun 2026 13:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C8D1F000E9;
	Thu, 25 Jun 2026 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782394945;
	bh=SJAhd9EXpnbV5xvn2yo6WXU0yr2K8rRtYOdERhXPr6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GTUTNvfDrSn0z3yT5RtPLuVGmFTm05NXLRBcRe+Sen1FXbh5E8GD7Ff3cqJ7vuF7U
	 SwpgKWJmsPCrSVgku/P/S/Asju0nCzXwlTivaJ1upesKR3hkW2P9tnCWtmQ9ViJtX7
	 ZjNb4FW43QmJ/dgmxv6nUW0rz6SHQa2P8LygXNgEh/qbjqTG7o9DjY3vzOOMJAMzER
	 KFNba/XnE5YIAQorUNKxTXZMPoUQd1M1Os5ioWr2rhcbFiSRtCtebp6FEu3d3c6EQe
	 F6lBoBpkHdMZrcNA8SY/jlTZiBfXuWR7Mszr+dh/o1r6MgfoTh9BJCrVp9t4BLtbdj
	 jQwUNB1XFnm1g==
Message-ID: <88e3f1a6-b07e-4442-a275-269d68aa8120@kernel.org>
Date: Thu, 25 Jun 2026 16:42:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_mlc: fail DMA transfers on timeout
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260625003327.11060-1-pengpeng@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260625003327.11060-1-pengpeng@iscas.ac.cn>
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

On 6/25/26 03:33, Pengpeng Hou wrote:
> lpc32xx_xmit_dma() starts a DMA transfer and waits up to one second for
> its completion, but it ignores the wait result and returns success after
> unmapping the buffer.
> 
> A timed out read can therefore return success with incomplete data, and a
> timed out write can continue the NAND operation without proof that the DMA
> payload reached the controller.
> 
> Terminate the DMA channel on timeout, unmap the scatterlist through the
> existing cleanup path, and return -ETIMEDOUT to the NAND read/write
> callers.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/mtd/nand/raw/lpc32xx_mlc.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
> index 19b13ae53..8f6a89d9b 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
> @@ -396,6 +396,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
>   	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
>   	struct dma_async_tx_descriptor *desc;
>   	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> +	unsigned long time_left;
>   	int res;
>   
>   	sg_init_one(&host->sgl, mem, len);
> @@ -410,6 +411,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
>   				       flags);
>   	if (!desc) {
>   		dev_err(mtd->dev.parent, "Failed to prepare slave sg\n");
> +		res = -ENXIO;
>   		goto out1;
>   	}
>   
> @@ -420,7 +422,13 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
>   	dmaengine_submit(desc);
>   	dma_async_issue_pending(host->dma_chan);
>   
> -	wait_for_completion_timeout(&host->comp_dma, msecs_to_jiffies(1000));
> +	time_left = wait_for_completion_timeout(&host->comp_dma,
> +						msecs_to_jiffies(1000));
> +	if (!time_left) {
> +		dmaengine_terminate_sync(host->dma_chan);
> +		res = -ETIMEDOUT;
> +		goto out1;
> +	}
>   
>   	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
>   		     DMA_BIDIRECTIONAL);
> @@ -428,7 +436,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
>   out1:
>   	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
>   		     DMA_BIDIRECTIONAL);
> -	return -ENXIO;
> +	return res;
>   }
>   
>   static int lpc32xx_read_page(struct nand_chip *chip, uint8_t *buf,

Thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
