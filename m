Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82606C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E9863211
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E9863211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/1I6hFJesEDBorxu5mkBfc9/luwJk2AZcgt0LdzTuI=; b=Q5W6Vc5ZtkEN0R
	h9gPACSIwjQAS35EEBg0U078acpMgKk0Mp0erODn/e56cO6IEI5sRduOrINIZSE8pOnM202/0iMSI
	lEJw90wo9KetV/k0N6M6Yu9FfCT6DJ3AqpkiYNeoXMc51sJR389eXFWLrn00oxWv2aiPbzCfldmuC
	rll2afaIswVF9AAf3yQHZ2R26dTtkKJekcicgdft7c/NFHqgv3xuPTaxD/0MHF/TNZrC+1jAo/YpH
	SQOfTxb7gE9lwOcAezrzIajIfkyF0WetuB5XilIWMoDIlXHBhnBxiJ5eC3RX4d2O0dk+sbEaZkxRa
	RIvN+IP1dWT7qfb58ucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZS6-00FF4s-Av; Mon, 15 Nov 2021 10:43:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZRW-00FEsi-TC; Mon, 15 Nov 2021 10:42:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D2D163210;
 Mon, 15 Nov 2021 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636972950;
 bh=GF5ppKwJBGyzBz8YYmc0v0PuTfRZzEb8KsPYdX9kZys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ah/2tRgiVpL5fsi7FPpcL635JDhcln6l2ExZIWHTLBUbMjdBJtz0DoVh8A2lD2GeS
 Vn5loajjfQVDFPQtLSRLZGgFOOu9gaKK3ygqoSrLlln9jWXCpaNqhh48lZ8c+k+4gu
 sRf7wuCD69gIDwdqAcDKjxNp/YsEuFSMvDDDQT7VHpaJYuJxZPW/xofRGd5PidTsHa
 kAWstx1aMCAeHyFhdJIprnubYysWs5QAKZBMy/vWApTOP0uD7D8phUBIQiY3lLQ5f/
 +MVP+HB9F9xrWDthVsi8GxjjhUCyNhOn85FTRAs3rVEuGA/K5Upw6e+cpw5gK86TyV
 zRQeafG4VMnqA==
Received: by mail-wm1-f45.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so12038758wmz.2; 
 Mon, 15 Nov 2021 02:42:30 -0800 (PST)
X-Gm-Message-State: AOAM5318+uDmUXB2h+TkoapURULBly94WftYPXfyog99SrvsTi2iLNXo
 CFLkz0RBMdQ22Nu+tmIQcZMvlc0/CKyh2p2WOb8=
X-Google-Smtp-Source: ABdhPJxXAexhirAvGW2LKyfe3zijMEf2dKYT5qfqRJ6eAMXzz6GR60sm0yXhnH6+pWfe4YG9EjpedQhiHwxXAXFjyDM=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr57234330wmi.173.1636972948695; 
 Mon, 15 Nov 2021 02:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
In-Reply-To: <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:42:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Message-ID: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_024231_015749_04ED61A2 
X-CRM114-Status: GOOD (  22.80  )
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

On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de> wrote:
>
> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This field is never set, and serves no purpose, so remove it.
>
> I agree that we should remove it. Its been legacy support code for a
> while, but the description that there is no user is not right.
>
> The tegra20_spdif driver obviously uses it and that user is removed in
> this patch. I think it makes sense to split that out into a separate
> patch with a description why the driver will still work even with
> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
> driver.

Ok, I'll split out the tegra patch and try to come up with a better
description for it. What I saw in that driver is it just passes down the
slave_id number from a 'struct resource', but there is nothing in
the kernel that sets up this resource.

Do you or someone else have more information on the state of this
driver? I can see that it does not contain any of_device_id based
probing, so it seems that this is either dead code, the platform_device
gets created by some other code that is no longer compatible with
this driver.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
