Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB095C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACA161C32
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AACA161C32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f557+Y+JKZGauS8IFHQ+LS0f0PyuKD//2QVqM87JKI=; b=U/nZ2s8NaaT+B0
	ot9C4djvvPP14/vJRKh312Ym0dDIZARHyKt2DWchJZNodvwtBxhEZrlMnMtn8BUzuRNphw2TY9+fI
	q2wQamv636VshZRy/XFF28V1aU8cLnWXuScJqS6MmqIxlo4B6wk0AkFN5LzpsPC0+QRSM6GwAwRRi
	gyCgk658gOi4TJ5iVMpweAy7ZjXZNyS27haDtC8TPgHbzDjx5ol3q9WiSVxRMBDIEcrw2m0bHZYOk
	PUVgUEWM0rSDOO2aKpB+utpP4US0wpLU+IccbGBDds+iBtwmQwQTMjiuahoTX9OR5KOlJie7F2bfr
	PYwlUxHPFFwlcE5iaa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmbgr-00FaTK-72; Mon, 15 Nov 2021 13:06:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmbgd-00FaQV-D8; Mon, 15 Nov 2021 13:06:17 +0000
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1142FD3E;
 Mon, 15 Nov 2021 14:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636981573;
 bh=S400eBbi5TVNWpj2Sq2il82O7vrNbB0L6EDIkwL9CvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuJFczqyURd3bNnnE6zXNftSaB5jKtcwJnjQTyM3WJG89V2u+Roo+NiwAr/RUngIA
 E2c1ezIwcRsLVNxRRAuadHct1K/oTpdoEKIdJ5k7m96EiJ+UGAbd4M/hv76UAtnoqx
 GP2lyD8TkFiLO/jC+DLqQVsUesrxNYWsEhNFrXjc=
Date: Mon, 15 Nov 2021 15:05:50 +0200
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
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
 <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_050615_628975_7DD9D2A8 
X-CRM114-Status: GOOD (  38.30  )
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

On Mon, Nov 15, 2021 at 01:38:07PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart wrote:
> > On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> > > On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > > > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > > >       spin_lock_irqsave(&chan->lock, flags);
> > > > >
> > > > >       /*
> > > > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > > > -      * group.
> > > > > +      * Abuse the peripheral_config to indicate that the channel is part
> > > >
> > > > Is it still an abuse, or is this now the right way to pass custom data
> > > > to the DMA engine driver ?
> > >
> > > It doesn't make the driver any more portable, but it's now being
> > > more explicit about it. As far as I can tell, this is the best way
> > > to pass data that cannot be expressed through the regular interfaces
> > > in DT and the dmaengine API.
> > >
> > > Ideally there would be a generic way to pass this flag, but I couldn't
> > > figure out what this is actually doing, or whether there is a better
> > > way. Maybe Vinod has an idea.
> >
> > I don't think we need a generic API in this case. The DMA engine is
> > specific to the display device, I don't foresee a need to mix-n-match.
> 
> Right. I wonder if there is even a point in using the dmaengine API
> in that case, I think for other single-purpose drivers we tend to just
> integrate the functionality in the client driver. No point changing this
> now of course, but it does feel odd.

I agree, and that's what I would have done as well, if it wasn't for the
fact that the DMA engine also supports a second client for audio. This
isn't supported in upstream yet. We could still have created an ad-hoc
solution, possibly based on the components framework, but the DMA engine
subsystem wasn't a bad fit.

> From my earlier reading of the driver, my impression was that this
> is just a memory-to-memory device, so it could be used that way
> as well, but does need a flag when working on the video memory.
> I couldn't quite make sense of that though.

It's only memory-to-device (video and audio). See figures 33-1 and 33-16
in https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

> > >         /*
> > >          * Use the peripheral_config to indicate that the channel is part
> > >          * of a video group. This requires matching use of the custom
> > >          * structure in each driver.
> > >          */
> > >         pconfig = config->peripheral_config;
> > >         if (WARN_ON(config->peripheral_size != 0 &&
> > >                     config->peripheral_size != sizeof(*pconfig)))
> > >                 return -EINVAL;
> >
> > How about
> >
> >         if (WARN_ON(config->peripheral_config &&
> >                     config->peripheral_size != sizeof(*pconfig)))
> >
> > >
> > >         spin_lock_irqsave(&chan->lock, flags);
> > >         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > >             config->peripheral_size == sizeof(*pconfig))
> >
> > And here you can test pconfig != NULL.
> 
> Good idea. Changed now, using 'if (pconfig)' without the '!= NULL'
> in both expressions.

Sounds good to me.

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
