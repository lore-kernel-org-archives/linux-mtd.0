Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827E5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:33:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476CB61A89
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 476CB61A89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/klDunr44j1Y3xUg/U20J1Yl2NWyKs0v7vdtSGqE9Fc=; b=oIgqmA0sE/zctO
	u08WKMR7pLodAKUpcKTw9/0rO01pxGvBaKHlFOH7UWcOaiK4NsVO2F1XKjPJN9+OO6WvcFfHvCf/o
	H8ra+gRE4n7li45VMIpsCH9P/1tvNjHt6/XHdMiNAEq8uR/dtd+zRm2J39R0ZLzgwkcJbWeLh9xk8
	HG2wZZHsFOx3JNnbm7B26iQNLYrey2oyMxZssnf1v+eHdZxkKx40u3z+GvedQ7Kf3iYCurc5KqqPe
	/Qzi+f/0x8+rZwvDXOHgzGUPfDifPvanlyqFo+JlbsR2xGyH4jTgnthiQeUT5UY978zlK43nzG5rk
	+B9dzQShIFInZ0ihjLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYML-00EwlJ-M2; Mon, 15 Nov 2021 09:33:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY0L-00Er3G-Q7; Mon, 15 Nov 2021 09:10:23 +0000
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2837F9CA;
 Mon, 15 Nov 2021 10:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967417;
 bh=bs5FwrGJKmZiUyJUhZtsFFkCbThCR2+MNX7sYGLdInI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dnjNnE+BxQubVBzyvt35tp9eSPunAc+NOuowzVjMVfnO6jqLw3nMEngEl53CjbMh0
 UYxBQSy9hDC4AXM+j7bivGr1bDYL75caLR3Kpvgip4jQNeMxX1tvkF1//Xh3honHLn
 XZyCAuT51XsudJZ+zXrp60OeLJ0gprUub8NgbGw0=
Date: Mon, 15 Nov 2021 11:09:54 +0200
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
Subject: Re: [PATCH 04/11] dmaengine: shdma: remove legacy slave_id parsing
Message-ID: <YZIj4iKUsj/QQ+BH@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-5-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011022_051103_933E126D 
X-CRM114-Status: GOOD (  19.62  )
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

On Mon, Nov 15, 2021 at 09:53:56AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The slave device is picked through either devicetree or a filter
> function, and any remaining out-of-tree drivers would have warned
> about this usage since 2015.
> 
> Stop interpreting the field finally so it can be removed from
> the interface.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/dma/sh/shdma-base.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
> index 7f72b3f4cd1a..41c6bc650fa3 100644
> --- a/drivers/dma/sh/shdma-base.c
> +++ b/drivers/dma/sh/shdma-base.c
> @@ -786,14 +786,6 @@ static int shdma_config(struct dma_chan *chan,
>  	if (!config)
>  		return -EINVAL;
>  
> -	/*
> -	 * overriding the slave_id through dma_slave_config is deprecated,
> -	 * but possibly some out-of-tree drivers still do it.
> -	 */
> -	if (WARN_ON_ONCE(config->slave_id &&
> -			 config->slave_id != schan->real_slave_id))
> -		schan->real_slave_id = config->slave_id;
> -
>  	/*
>  	 * We could lock this, but you shouldn't be configuring the
>  	 * channel, while using it...

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
