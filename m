Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC076C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 12:39:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C067A60EFD
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 12:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C067A60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkQBtXtfLXAPWSeKl+fOA5wQ8HsEUlP/ffKdR9x36PQ=; b=Ik5/Pvgd+CWv/X
	Dp73jDGUYijxMIZUwnOf9HgfFGx1yJ8+494v4cB8uFroHLdHMHroodcITdlsNRrX/V4s+Uu6gSQKL
	Tpvf//xNwt8wrNXS4saU0nkzZdTgqT5XWQ4em5zs1HI6Dt7k1fPo6V8MtGt/ZyHJhKCNVrEvbXjbw
	onbG++VmpJzh3cFm+IRbUdPL3ZwZDh4ASUyoKnZZGgQ3bAI3hIb9dT9c6V2aLBaRBn1HzRCmP2NSN
	RUDFMUWi1Ykjwg8Jw0cfX3vUIoxqA4mU3SnJZJA1a9m5Jk1S5ttW8voD3/ztTsUzz3zVVbOwJ4bRa
	YPxaK+YiZzh26emiq4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmbFu-00FWxF-VX; Mon, 15 Nov 2021 12:38:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmbFh-00FWuE-LY; Mon, 15 Nov 2021 12:38:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5027561B5E;
 Mon, 15 Nov 2021 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636979905;
 bh=0vPaiFLUq2SXWicOiHJ0dTL68j+HqvYqhdUUZpm4Lbg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I+1x2XZxjf0LcgW3lMmbiJPZ71Bi+3kqOGuAZRKXN1JfNBFrZaiB21OzI8/74f0h0
 Qq9j3mNJNww5Ebh37UUU7T73Uy/xgxrT9Cch7mYImOv2H/bbOmofM9xkajEGTkGGUU
 hGAI73KgAeiXM888w+zysyYQTZ4yYyjDXcXqXXwQJ8IyYB0pf/b0pqA/XCjqw9IpRl
 yCWpvb6UA7WovNrxde2iEzHRITt42AWtZE7nvXGbJMW3vN4eAR3DyqEs1DZrNZzLk2
 tuMyHLag1K86+X0psZqBhLcvq1czh8i8zV/S46+iyDlDN0sbFnwCD3e9XH7d1GqYQT
 IxYpNW3g9oKFg==
Received: by mail-wm1-f48.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so15717843wme.0; 
 Mon, 15 Nov 2021 04:38:25 -0800 (PST)
X-Gm-Message-State: AOAM531FDLFGxOZ6l3NEJDDcaZSgAe0lRi05xICIe0pzXhMa+8bh3IjP
 lujIvjMMaZLHSg25LKK1Q6HsVulB7GmlFwFVQkY=
X-Google-Smtp-Source: ABdhPJwFTprJJd11s9duELVend6oLQx+lemeU4w9vOaJiXxZUrLq0sghW72KOFAqYJMNV8KCFht4GWVIPZFIhNgyYas=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr58047076wmi.173.1636979903584; 
 Mon, 15 Nov 2021 04:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
In-Reply-To: <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
Message-ID: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211115_043825_773919_D1B111A7 
X-CRM114-Status: GOOD (  31.65  )
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

On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > >       spin_lock_irqsave(&chan->lock, flags);
> > > >
> > > >       /*
> > > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > > -      * group.
> > > > +      * Abuse the peripheral_config to indicate that the channel is part
> > >
> > > Is it still an abuse, or is this now the right way to pass custom data
> > > to the DMA engine driver ?
> >
> > It doesn't make the driver any more portable, but it's now being
> > more explicit about it. As far as I can tell, this is the best way
> > to pass data that cannot be expressed through the regular interfaces
> > in DT and the dmaengine API.
> >
> > Ideally there would be a generic way to pass this flag, but I couldn't
> > figure out what this is actually doing, or whether there is a better
> > way. Maybe Vinod has an idea.
>
> I don't think we need a generic API in this case. The DMA engine is
> specific to the display device, I don't foresee a need to mix-n-match.


Right. I wonder if there is even a point in using the dmaengine API
in that case, I think for other single-purpose drivers we tend to just
integrate the functionality in the client driver. No point changing this
now of course, but it does feel odd.

From my earlier reading of the driver, my impression was that this
is just a memory-to-memory device, so it could be used that way
as well, but does need a flag when working on the video memory.
I couldn't quite make sense of that though.

> >         /*
> >          * Use the peripheral_config to indicate that the channel is part
> >          * of a video group. This requires matching use of the custom
> >          * structure in each driver.
> >          */
> >         pconfig = config->peripheral_config;
> >         if (WARN_ON(config->peripheral_size != 0 &&
> >                     config->peripheral_size != sizeof(*pconfig)))
> >                 return -EINVAL;
>
> How about
>
>         if (WARN_ON(config->peripheral_config &&
>                     config->peripheral_size != sizeof(*pconfig)))
>
> >
> >         spin_lock_irqsave(&chan->lock, flags);
> >         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> >             config->peripheral_size == sizeof(*pconfig))
>
> And here you can test pconfig != NULL.

Good idea. Changed now, using 'if (pconfig)' without the '!= NULL'
in both expressions.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
