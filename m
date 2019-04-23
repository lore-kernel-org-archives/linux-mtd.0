Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0734DC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 05:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C47D020811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 05:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gDXWO/ic";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xDJKWy9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C47D020811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hS1yRTLVnb6GgKqW5Sl9bbhEVeHmTpVjD5aJFdRHZY=; b=gDXWO/icONFhLU
	59LZRcGMzgyMUNuzwI8/uxjOGulyEhggWyfkREuJUtD+0ALWxrwqX9S72nJFDJ8XaNkhAdWJsxg3n
	b06nY4ONt8Ps5EusgmGCeU6/wzI4xuwqweVZ0OpySGN1o7IrGnpzMYGVsYoi4X/3WzhxKsL4cBCgD
	9do6ZVn2tCVdUjt8U7hvN/SxN3LoNsvBxwIy2kQMitquzhszK1A1uF7kvRS9gLbyOKBBAjWbD8lcW
	gakBAvMi5D5D8LFaJRYp7Sl/EZktYNE0/a2KTG3Er9iNU/B92MWldmsSF2lmtQa8VsM3k/5wIw90F
	amxwtSW5dJOjX2uUU0SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hInv6-0007fc-0T; Tue, 23 Apr 2019 05:24:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hInv3-0007fE-GP
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2019 05:24:38 +0000
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75E2720811;
 Tue, 23 Apr 2019 05:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555997076;
 bh=azJUsLWq4cu1LbtPyN7G/yM8U5D5Rj9pwQ5GnEhL/rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xDJKWy9WBgDB8vA7s4c41QW5HdCcPhgUciwEhJa4+KmoJNG2Q5VxselaLJyqzcE50
 6eefrEmu0pFMxB35Iwy5rDY2B/0wdY1TreOAwysDdAUjROTrs3JfmdIKhG45DitgeP
 wgjEK/NekAqcd4vyG24JRSCVq42LVHqt89gDUmSk=
Date: Tue, 23 Apr 2019 10:54:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 12/14] dma: mxs: Add header file to be shared with gpmi
 nand driver
Message-ID: <20190423052430.GI28103@vkoul-mobl>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-13-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409113421.3037-13-s.hauer@pengutronix.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_222437_579184_D5153590 
X-CRM114-Status: GOOD (  21.26  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09-04-19, 13:34, Sascha Hauer wrote:
> The mxs dma driver can do PIO transfers. A pointer to the PIO words
> to transfer is passed in the struct scatterlist * argument of
> dmaengine_prep_slave_sg(). It's quite ugly and non obvious to cast
> u32 * to struct scatterlist * each time when calling
> dmaengine_prep_slave_sg(), so add a static inline wrapper function
> to be called by the user along with a description what is going on.

Again after fixing subsystem tag to dmanegine: 

Acked-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/dma/mxs-dma.c                      |  1 +
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 36 +++++++++-------------
>  include/linux/dma/mxs-dma.h                | 21 +++++++++++++
>  3 files changed, 36 insertions(+), 22 deletions(-)
>  create mode 100644 include/linux/dma/mxs-dma.h
> 
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index ce92a3626ea4..62ee9328aea1 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -24,6 +24,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_dma.h>
>  #include <linux/list.h>
> +#include <linux/dma/mxs-dma.h>
>  
>  #include <asm/irq.h>
>  
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index a6e769afc89a..cf016ec0b1c6 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -15,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/dma/mxs-dma.h>
>  #include "gpmi-nand.h"
>  #include "gpmi-regs.h"
>  #include "bch-regs.h"
> @@ -913,9 +914,8 @@ static int gpmi_send_command(struct gpmi_nand_data *this)
>  		| BM_GPMI_CTRL0_ADDRESS_INCREMENT
>  		| BF_GPMI_CTRL0_XFER_COUNT(this->command_length);
>  	pio[1] = pio[2] = 0;
> -	desc = dmaengine_prep_slave_sg(channel,
> -					(struct scatterlist *)pio,
> -					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
> +				      DMA_TRANS_NONE, 0);
>  	if (!desc)
>  		return -EINVAL;
>  
> @@ -988,8 +988,8 @@ static int gpmi_send_data(struct gpmi_nand_data *this, const void *buf,
>  		| BF_GPMI_CTRL0_ADDRESS(address)
>  		| BF_GPMI_CTRL0_XFER_COUNT(len);
>  	pio[1] = 0;
> -	desc = dmaengine_prep_slave_sg(channel, (struct scatterlist *)pio,
> -					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
> +				      DMA_TRANS_NONE, 0);
>  	if (!desc)
>  		return -EINVAL;
>  
> @@ -1025,9 +1025,8 @@ static int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
>  		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
>  		| BF_GPMI_CTRL0_XFER_COUNT(len);
>  	pio[1] = 0;
> -	desc = dmaengine_prep_slave_sg(channel,
> -					(struct scatterlist *)pio,
> -					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
> +				      DMA_TRANS_NONE, 0);
>  	if (!desc)
>  		return -EINVAL;
>  
> @@ -1083,10 +1082,8 @@ static int gpmi_send_page(struct gpmi_nand_data *this,  dma_addr_t payload,
>  	pio[4] = payload;
>  	pio[5] = auxiliary;
>  
> -	desc = dmaengine_prep_slave_sg(channel,
> -					(struct scatterlist *)pio,
> -					ARRAY_SIZE(pio), DMA_TRANS_NONE,
> -					DMA_CTRL_ACK);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
> +				      DMA_TRANS_NONE, DMA_CTRL_ACK);
>  	if (!desc)
>  		return -EINVAL;
>  
> @@ -1117,9 +1114,7 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
>  		| BF_GPMI_CTRL0_ADDRESS(address)
>  		| BF_GPMI_CTRL0_XFER_COUNT(0);
>  	pio[1] = 0;
> -	desc = dmaengine_prep_slave_sg(channel,
> -				(struct scatterlist *)pio, 2,
> -				DMA_TRANS_NONE, 0);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, 2, DMA_TRANS_NONE, 0);
>  	if (!desc)
>  		return -EINVAL;
>  
> @@ -1144,10 +1139,8 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
>  	pio[3] = geo->page_size;
>  	pio[4] = payload;
>  	pio[5] = auxiliary;
> -	desc = dmaengine_prep_slave_sg(channel,
> -					(struct scatterlist *)pio,
> -					ARRAY_SIZE(pio), DMA_TRANS_NONE,
> -					DMA_CTRL_ACK);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
> +				      DMA_TRANS_NONE, DMA_CTRL_ACK);
>  	if (!desc)
>  		return -EINVAL;
>  
> @@ -1163,9 +1156,8 @@ static int gpmi_read_page(struct gpmi_nand_data *this,
>  		| BF_GPMI_CTRL0_XFER_COUNT(geo->page_size);
>  	pio[1] = 0;
>  	pio[2] = 0; /* clear GPMI_HW_GPMI_ECCCTRL, disable the BCH. */
> -	desc = dmaengine_prep_slave_sg(channel,
> -				(struct scatterlist *)pio, 3,
> -				DMA_TRANS_NONE, DMA_CTRL_ACK);
> +	desc = mxs_dmaengine_prep_pio(channel, pio, 3, DMA_TRANS_NONE,
> +				      DMA_CTRL_ACK);
>  	if (!desc)
>  		return -EINVAL;
>  
> diff --git a/include/linux/dma/mxs-dma.h b/include/linux/dma/mxs-dma.h
> new file mode 100644
> index 000000000000..092b2a7b92ac
> --- /dev/null
> +++ b/include/linux/dma/mxs-dma.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _MXS_DMA_H_
> +#define _MXS_DMA_H_
> +
> +#include <linux/dmaengine.h>
> +
> +/*
> + * The mxs dmaengine can do PIO transfers. We pass a pointer to the PIO words
> + * in the second argument to dmaengine_prep_slave_sg when the direction is
> + * set to DMA_TRANS_NONE. To make this clear and to prevent users from doing
> + * the error prone casting we have this wrapper function
> + */
> +static inline struct dma_async_tx_descriptor *mxs_dmaengine_prep_pio(
> +        struct dma_chan *chan, u32 *pio, unsigned int npio,
> +        enum dma_transfer_direction dir, unsigned long flags)
> +{
> +	return dmaengine_prep_slave_sg(chan, (struct scatterlist *)pio, npio,
> +				       dir, flags);
> +}
> +
> +#endif /* _MXS_DMA_H_ */
> -- 
> 2.20.1

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
