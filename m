Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65425C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B31861AFB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B31861AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCbZzJiIyH14p3XEERQgv/RB2pyvBnwGEUG6m/SxxPY=; b=I2yyCFMMEFAngY
	O/4Z+ftmYls2kMJuwx6dCFtmUB06iWnakT1iPls6L0+jJz1VsZ9WXyS4utUZcQf4Y3GgoyQrxp1jp
	BJKAUE/U2RivumZLo+YoKBOleo1nSDRJIxojdnfwPrZ06Up2A7xQ0QKAi2y3UmCNRl8J3ZO6L0zT5
	+RLW8oQY/BrIi5rJbGwddsER63WYjMJEXzxvj3YXXCpvChgLz1F+lgPbp2iR3XfiWvLJoFVjMbJX/
	idwEnCaVG2l7l4WMAdbmYth98ZigpDd3UirXY1nuHy834IWqdLRJ08Mk8PuHUredwld4iw/rNU5JR
	X0Mb6e7iO2Wk1G/YdgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYXr-00EzMq-EB; Mon, 15 Nov 2021 09:44:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY8u-00EtGC-Fs; Mon, 15 Nov 2021 09:19:14 +0000
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9F1E9CA;
 Mon, 15 Nov 2021 10:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967950;
 bh=DyMiGF8dYpIO7sFrfkTrEHyV1KL7y6BUoG/PpdzWVzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IazgGZ0N2QKgbD2xiliOgSKM/Wh6Ku2e/ttwUbC+gF1dv3N9Q27dBA+K+YHkhhn3f
 128fjkKnCXSOo6RM9eqPTMGb4Rdwc+4oI3NFochnUeHBJsqlLB6JXS7U5djKpnhGrr
 6nHRXJmkdxcDwrNkgsOFzaGTd+Zdnc73MAIEaL64=
Date: Mon, 15 Nov 2021 11:18:47 +0200
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
Subject: Re: [PATCH 11/11] dmaengine: remove slave_id config field
Message-ID: <YZIl92Akt2QEqad9@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-12-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-12-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011912_717225_45156127 
X-CRM114-Status: GOOD (  17.53  )
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

On Mon, Nov 15, 2021 at 09:54:03AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All references to the slave_id field have been removed, so
> remove the field as well to prevent new references from
> creeping in again.

A rationale to explain why the slave_id field shouldn't be used would be
nice.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/linux/dmaengine.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 9000f3ffce8b..0349b35235e6 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -418,9 +418,6 @@ enum dma_slave_buswidth {
>   * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
>   * with 'true' if peripheral should be flow controller. Direction will be
>   * selected at Runtime.
> - * @slave_id: Slave requester id. Only valid for slave channels. The dma
> - * slave peripheral will have unique id as dma requester which need to be
> - * pass as slave config.
>   * @peripheral_config: peripheral configuration for programming peripheral
>   * for dmaengine transfer
>   * @peripheral_size: peripheral configuration buffer size
> @@ -448,7 +445,6 @@ struct dma_slave_config {
>  	u32 src_port_window_size;
>  	u32 dst_port_window_size;
>  	bool device_fc;
> -	unsigned int slave_id;
>  	void *peripheral_config;
>  	size_t peripheral_size;
>  };

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
