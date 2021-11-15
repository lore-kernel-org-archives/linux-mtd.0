Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E35C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7FD61875
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A7FD61875
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+NdP7lMVph45fC10uKuJMZY2qNnHV+NX5V/Jo7fFvE=; b=SfW1h6/jQFaNh3
	SKt/rUIGfptk+GUUQwsOjUyOzrUz+AB/xE6xctJKfQErjETxKztq4T7FPdz60oChX6EGr0j7PlPbu
	0Kj9b3y4dgm5VkW5GIgZhxWe2Gq+PU2r3n2bx1kbY7Xoh3mq4uKVFu6WenUBgDOId7AneI6l2iZCQ
	3j5hMW3MoxZX3c9PiUoG5QvJqpKjoDHP+EhaKCdfA57zHeTMy+xEnVy9ogaw7RaJZ6YRNHwixMBjA
	EyEUekk2qCnBerWKgrqjsyTq3TNDrw60Scn7ef0yYWeWz2cgXlUAYkhh5PyfJhrZH+IqezZg3Y1nx
	q1R17JtK3VMP+a9cIBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYUf-00EyV9-AL; Mon, 15 Nov 2021 09:41:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY4X-00EsB4-8X; Mon, 15 Nov 2021 09:14:42 +0000
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68509D3E;
 Mon, 15 Nov 2021 10:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967679;
 bh=Mqu9AjHOXNqVwePLKX9nbSoWI9lixf+/xad48n+NCXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmpIYw6iL+QGg/jQfPaAXjxBhbT8ed5+LXpS9Vfki8On0XIjUU+Fxa8QV1Z77Uq7z
 y6IDsVjB8zbvUKldzAH2W1BEVsA/FZvp6/ibJRVnAxSdL6j4sHfh4FyJeHP6WjIk0w
 BufJuEgiIHtwCFssoB38BxxBci3DM0+P7P/jbs7w=
Date: Mon, 15 Nov 2021 11:14:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-9-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011441_494743_CA04CE8E 
X-CRM114-Status: GOOD (  34.64  )
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

Hi Arnd,

Thank you for the patch.

On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The display driver wants to pass a custom flag to the DMA engine driver,
> which it started doing by using the slave_id field that was traditionally
> used for a different purpose.
> 
> As there is no longer a correct use for the slave_id field, it should
> really be removed, and the remaining users changed over to something
> different.
> 
> The new mechanism for passing nonstandard settings is using the
> .peripheral_config field, so use that to pass a newly defined structure
> here, making it clear that this will not work in portable drivers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma/xilinx/xilinx_dpdma.c  | 12 ++++++++----
>  drivers/gpu/drm/xlnx/zynqmp_disp.c |  9 +++++++--
>  include/linux/dma/xilinx_dpdma.h   | 11 +++++++++++
>  3 files changed, 26 insertions(+), 6 deletions(-)
>  create mode 100644 include/linux/dma/xilinx_dpdma.h
> 
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index ce5c66e6897d..e2c1ef7a659c 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -12,6 +12,7 @@
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> +#include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dmapool.h>
>  #include <linux/interrupt.h>
> @@ -1273,6 +1274,7 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
>  			       struct dma_slave_config *config)
>  {
>  	struct xilinx_dpdma_chan *chan = to_xilinx_chan(dchan);
> +	struct xilinx_dpdma_peripheral_config *pconfig;
>  	unsigned long flags;
>  
>  	/*
> @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
>  	spin_lock_irqsave(&chan->lock, flags);
>  
>  	/*
> -	 * Abuse the slave_id to indicate that the channel is part of a video
> -	 * group.
> +	 * Abuse the peripheral_config to indicate that the channel is part

Is it still an abuse, or is this now the right way to pass custom data
to the DMA engine driver ?

> +	 * of a video group.
>  	 */
> -	if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> -		chan->video_group = config->slave_id != 0;
> +	pconfig = config->peripheral_config;

This could be moved to the variable declaration above, up to you.

> +	if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> +	    config->peripheral_size == sizeof(*pconfig))

Silently ignoring a size mismatch isn't nice. Could we validate the size
at the beginning of the function and return an error ?

With these issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		chan->video_group = pconfig->video_group;
>  
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ff2b308d8651..11c409cbc88e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -24,6 +24,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
> @@ -1058,14 +1059,18 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
>  
>  	/*
> -	 * Set slave_id for each DMA channel to indicate they're part of a
> +	 * Set pconfig for each DMA channel to indicate they're part of a
>  	 * video group.
>  	 */
>  	for (i = 0; i < info->num_planes; i++) {
>  		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
> +		struct xilinx_dpdma_peripheral_config pconfig = {
> +			.video_group = true,
> +		};
>  		struct dma_slave_config config = {
>  			.direction = DMA_MEM_TO_DEV,
> -			.slave_id = 1,
> +			.peripheral_config = &pconfig,
> +			.peripheral_size = sizeof(pconfig),
>  		};
>  
>  		dmaengine_slave_config(dma->chan, &config);
> diff --git a/include/linux/dma/xilinx_dpdma.h b/include/linux/dma/xilinx_dpdma.h
> new file mode 100644
> index 000000000000..83a1377f03f8
> --- /dev/null
> +++ b/include/linux/dma/xilinx_dpdma.h
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef __LINUX_DMA_XILINX_DPDMA_H
> +#define __LINUX_DMA_XILINX_DPDMA_H
> +
> +#include <linux/types.h>
> +
> +struct xilinx_dpdma_peripheral_config {
> +	bool video_group;
> +};
> +
> +#endif /* __LINUX_DMA_XILINX_DPDMA_H */

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
