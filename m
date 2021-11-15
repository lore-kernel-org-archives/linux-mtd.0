Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDDBC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3E461B04
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F3E461B04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTklb/Cqiqh7RxnpGHCGPoVYwScwXXOMoMldVkMYmH8=; b=nL2jbOi6M6RS/Q
	/uQ9wW4ErpFQAFhrFDZ4mpkrtWDlFpAdr5l6LOaRW4HIdEZlP0Es9arS1ZvE1y4JWWanrrxeL3sB6
	DaeAoMJzJhK3UQ3GzwPhSqkbf+im+svG30NfRf1lz55oDWoJbvK354HcWSSxBEpK9PWYhIBzkf5tB
	WIYB5cqK7rNlxDRyO0dz1P4pfP+6JffKwafHDZDfWPd76lVkeEyhsBzCujlUOZL3UF/Rh9BWee0PG
	fl5c66BxzAfs2k3DbUuHn049X+nBeYcin4w0ujfy/2gDJ+8KbIL1UnTzDkHsdQ24zczjEQPcXvN25
	a3eLu6Fiuy50Ini0vgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZA7-00FAqn-IV; Mon, 15 Nov 2021 10:24:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZ7V-00FA6E-1z; Mon, 15 Nov 2021 10:21:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A21B63227;
 Mon, 15 Nov 2021 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971708;
 bh=ngAS50rMmpV59azjOqW2oXCBrEGHx6Ekm0yN36KEY7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oHFZaspA4e0JT2Bappei5MG7xUfxAKnXH43mnsdk+R7rbsdvrD3kUDLGpF994Lv8o
 iEcy1Ug+arpeVBA1gxKJr+XFzRMEEncjc2K9qzGu6o1iL3o1bXVBgArPKaXh3sM1KT
 pqByKGVIvlUsnVpeQARzzgb4qc9a17HQolmIyWVeIgrGPfLon8Wq7NbhnRmyj2zeoK
 0Pg+gQgghuvRxMHQ7IajfS53HSxlou+O9e931O/rQqPebWyZ0jpnTj4gKlP7r3MKfQ
 +aPZLeOvA+8d8JqKBiRKzMCqrAk2Zb1jIIa11uVmY4fIYw/I+SHpBH5/oWpHirfE6z
 g6me8ygTpOC9g==
Received: by mail-wr1-f49.google.com with SMTP id s13so29644355wrb.3;
 Mon, 15 Nov 2021 02:21:48 -0800 (PST)
X-Gm-Message-State: AOAM532zYEdaIVrdGsp1EKWx10d8iO+rLPEhtphKTSbNCWa/6Q2R9S0/
 bppOd83763KTWhWgcKCn0Aev/2cs6Vwv/kcM3E8=
X-Google-Smtp-Source: ABdhPJyrUjRCeMXfDabLLUXG4+a6meFiuvFYQKG804WvMbrQRiaBMGWgH0F0OdgqzdIGH+oZqJIqfFrTkkuSnIDyxB0=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45196660wrl.336.1636971706955; 
 Mon, 15 Nov 2021 02:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
In-Reply-To: <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:21:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
Message-ID: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Laxman Dewangan <ldewangan@nvidia.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_022149_166339_7A416CC7 
X-CRM114-Status: GOOD (  26.25  )
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

On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> >       spin_lock_irqsave(&chan->lock, flags);
> >
> >       /*
> > -      * Abuse the slave_id to indicate that the channel is part of a video
> > -      * group.
> > +      * Abuse the peripheral_config to indicate that the channel is part
>
> Is it still an abuse, or is this now the right way to pass custom data
> to the DMA engine driver ?

It doesn't make the driver any more portable, but it's now being
more explicit about it. As far as I can tell, this is the best way
to pass data that cannot be expressed through the regular interfaces
in DT and the dmaengine API.

Ideally there would be a generic way to pass this flag, but I couldn't
figure out what this is actually doing, or whether there is a better
way. Maybe Vinod has an idea.

I'll change s/Abuse/Use/ for the moment until I get a definite answer.

> > +      * of a video group.
> >        */
> > -     if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> > -             chan->video_group = config->slave_id != 0;
> > +     pconfig = config->peripheral_config;
>
> This could be moved to the variable declaration above, up to you.

I considered that but since it doesn't fit in a normal 80-column
line, it seemed best to do it here.

> > +     if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > +         config->peripheral_size == sizeof(*pconfig))
>
> Silently ignoring a size mismatch isn't nice. Could we validate the size
> at the beginning of the function and return an error ?

Yes, good idea. Since this would mean a bug in another driver,
I'll add a WARN_ON() as well to make it clear which driver caused it.
This is what I have now, let me know if you have any further suggestions:

        /*
         * Use the peripheral_config to indicate that the channel is part
         * of a video group. This requires matching use of the custom
         * structure in each driver.
         */
        pconfig = config->peripheral_config;
        if (WARN_ON(config->peripheral_size != 0 &&
                    config->peripheral_size != sizeof(*pconfig)))
                return -EINVAL;

        spin_lock_irqsave(&chan->lock, flags);
        if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
            config->peripheral_size == sizeof(*pconfig))
                chan->video_group = pconfig->video_group;
        spin_unlock_irqrestore(&chan->lock, flags);

        return 0;

> With these issues addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
