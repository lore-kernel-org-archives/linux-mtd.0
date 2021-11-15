Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6946AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAE861A82
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CAE861A82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjHa6YGowff3yQ1ESiDpiPFR4TxrJDOMYbpufpaW4Fg=; b=rXuZAlNslWBvGl
	6BJ4IQOEAnBbaFev6Yw/Y8O2xAc74FhM/M0zZwgw6HLWAWmmUyf0IXhz5puw7p2kUvJ+4Y1do+Sbc
	qx6WRJ3KYXSa9Jvirg3i/CQSIxTYtZum2G3p7fN0cXObKc432HZOIDSKo6j1SWEUDLAD2A3jvCdkT
	47Us+07CGAh9RuCmBsqbgBBxtuIDQj2Y6HrDyG+1/Eoe84CjiyfPYpFlsilxroPDsN2xquHQNe2jc
	ngWjL1ZrQM08NUJxbZzvnf8Sc9QyNXaVc6l6UhB6zmWrMyaEzPFREsRkOX3WP9S7GiV3z5/eWRt73
	fZpsiyX8XSZuH4FDBxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmcDn-00FhcF-6Q; Mon, 15 Nov 2021 13:40:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmcDZ-00FhYc-Or; Mon, 15 Nov 2021 13:40:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 644E36323D;
 Mon, 15 Nov 2021 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636983617;
 bh=wWcBwOu3cL9+U+zjsSAWtUQyMjCz3CDgA4mV4eUmQEI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q4vpjH0uJaOnwWSUMmOGk4RBT6eS8WH2rt9ntVsxRfGOv9U1AcRtQ11fRaF90BIV8
 sqeJ0HBpuF+KPmzxxWjlJGgSJ1OjqCnX5IF3kDB9UyaLteVQzEs63BelRJSGp/MN27
 rl3mqKgow43UyjRBZHGLKQ4QfjwptO5RKrADCb33Z2mbHzpBKSuGr6uGe5kRDEdiBG
 HHrLzrj7SUybGgQXnJJsO7yrqVHV48pmOVUw23xSRWxB7Me79U0ZJtPK4hVpkgoTGX
 utmi82G0Uxv9J6Q2ftbl+jiVLtnlcx62LHYmA20iHfeUpWAVrLzRRvgSwCTpk4pzn6
 ofL6tkRYcgMKA==
Received: by mail-wr1-f51.google.com with SMTP id w29so30724159wra.12;
 Mon, 15 Nov 2021 05:40:17 -0800 (PST)
X-Gm-Message-State: AOAM533Se2jGvF+vt1qI4UQY6VJi511i7kntDIsr0LlpC+yYqGVKGqGg
 Brg1vvIdEeTgAeoIpPnlutEQdId/QsS+cuwul00=
X-Google-Smtp-Source: ABdhPJydx+lGNyCCL10Ss+u6AlrY7F7Dh3irA5L/rafXQwz2EG7YLwST7GsA7bIvQOTqpVGT64n5uQbouKk1WaS2cho=
X-Received: by 2002:adf:f088:: with SMTP id n8mr7443019wro.411.1636983615679; 
 Mon, 15 Nov 2021 05:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
 <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
 <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
In-Reply-To: <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 14:39:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a16s6dwvb-7REjF-pmnKod2qQRq+mta-g8pDXbQpGQvHA@mail.gmail.com>
Message-ID: <CAK8P3a16s6dwvb-7REjF-pmnKod2qQRq+mta-g8pDXbQpGQvHA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211115_054017_867252_19C71409 
X-CRM114-Status: GOOD (  17.02  )
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

On Mon, Nov 15, 2021 at 2:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 01:38:07PM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart wrote:
> >
> > Right. I wonder if there is even a point in using the dmaengine API
> > in that case, I think for other single-purpose drivers we tend to just
> > integrate the functionality in the client driver. No point changing this
> > now of course, but it does feel odd.
>
> I agree, and that's what I would have done as well, if it wasn't for the
> fact that the DMA engine also supports a second client for audio. This
> isn't supported in upstream yet. We could still have created an ad-hoc
> solution, possibly based on the components framework, but the DMA engine
> subsystem wasn't a bad fit.

Ah, makes sense. In this case, I guess the data could have been
part of the DMA specifier after all, in a second cell after the
channel number.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
