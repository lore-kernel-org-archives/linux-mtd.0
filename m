Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD02C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 11:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DDE63220
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 11:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9DDE63220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfcSzD6198MRbVcZ7DqQ+pNb37GhT/1IyQrqmT8KN+8=; b=UiOXeAo40yYgxB
	QJ7UpTXnl1P+07svBiVSTIzwNcJvaTCzf59lazBAD5hCQRuOkVI4tsm9AwvBVz/Ma2CKIKt2vPKkf
	AOvxq1FnBr5rIZt644Cp/NEjqQuNyCC0JkZkjaRtvLm7rBNh6XEDGPbUizXCUo/jY4Ybvr/FxF/ZJ
	Wvn8gCxlGJtBSSXNZkYFRZGL/J6wL9bay4AtTVT+xo6GrqarXBVhC91r1Y1wUijTsbekJ4rc/hHI0
	nByk9BuNbQtUmqbe5W2FYhMQ9On0xF+uSta+tE9E4DLVIjzeXvYJ41IFVRaAN95IFqGaSdklStYo4
	1hqhU9uvOiX0GqNsM86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmaV8-00FRke-8J; Mon, 15 Nov 2021 11:50:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmaUv-00FRiQ-3z; Mon, 15 Nov 2021 11:50:06 +0000
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A4AB9CA;
 Mon, 15 Nov 2021 12:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636977002;
 bh=8re/QsV/3GPHXV9j74dqu0H+3pTypCailVuz8uMMvrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTtRDp36OT7fx+mEQdB5Q6I6Uf3svTjc7O60k3oZ4d4LDZwX9gRNLXKCFKYdS58b6
 iochdzQTE6K7vejlHf4MMrQFHA3VGrfZCRSuARACO154L7RPOUcQFEq3FEieaAnbP9
 1Q/7byArzgxRl2K9AECFy7SDhkfUFmq2YmZNiRrQ=
Date: Mon, 15 Nov 2021 13:49:40 +0200
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
Message-ID: <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_035005_499145_920E46C5 
X-CRM114-Status: GOOD (  33.81  )
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

On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > >       spin_lock_irqsave(&chan->lock, flags);
> > >
> > >       /*
> > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > -      * group.
> > > +      * Abuse the peripheral_config to indicate that the channel is part
> >
> > Is it still an abuse, or is this now the right way to pass custom data
> > to the DMA engine driver ?
> 
> It doesn't make the driver any more portable, but it's now being
> more explicit about it. As far as I can tell, this is the best way
> to pass data that cannot be expressed through the regular interfaces
> in DT and the dmaengine API.
> 
> Ideally there would be a generic way to pass this flag, but I couldn't
> figure out what this is actually doing, or whether there is a better
> way. Maybe Vinod has an idea.

I don't think we need a generic API in this case. The DMA engine is
specific to the display device, I don't foresee a need to mix-n-match.

> I'll change s/Abuse/Use/ for the moment until I get a definite answer.
> 
> > > +      * of a video group.
> > >        */
> > > -     if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> > > -             chan->video_group = config->slave_id != 0;
> > > +     pconfig = config->peripheral_config;
> >
> > This could be moved to the variable declaration above, up to you.
> 
> I considered that but since it doesn't fit in a normal 80-column
> line, it seemed best to do it here.
> 
> > > +     if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > > +         config->peripheral_size == sizeof(*pconfig))
> >
> > Silently ignoring a size mismatch isn't nice. Could we validate the size
> > at the beginning of the function and return an error ?
> 
> Yes, good idea. Since this would mean a bug in another driver,
> I'll add a WARN_ON() as well to make it clear which driver caused it.
> This is what I have now, let me know if you have any further suggestions:
> 
>         /*
>          * Use the peripheral_config to indicate that the channel is part
>          * of a video group. This requires matching use of the custom
>          * structure in each driver.
>          */
>         pconfig = config->peripheral_config;
>         if (WARN_ON(config->peripheral_size != 0 &&
>                     config->peripheral_size != sizeof(*pconfig)))
>                 return -EINVAL;

How about

 	if (WARN_ON(config->peripheral_config &&
		    config->peripheral_size != sizeof(*pconfig)))

> 
>         spin_lock_irqsave(&chan->lock, flags);
>         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
>             config->peripheral_size == sizeof(*pconfig))

And here you can test pconfig != NULL.

>                 chan->video_group = pconfig->video_group;
>         spin_unlock_irqrestore(&chan->lock, flags);
> 
>         return 0;
> 
> > With these issues addressed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
