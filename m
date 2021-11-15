Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB475C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 15:15:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABD661AA2
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 15:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ABD661AA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4SR+9oqi2+P/hNA7kPXLGQuhU9fcBciQwrrA37UIHM=; b=Jl1H0jldFQn5oV
	echeF7o5xvmI6to+4DhY9qlqQ2uz9mP1SWnCwWAEsMZQddKkfbrtjoF7k6ZnwajQCqhVVagGYtTv5
	2jpBre53/wUWSEAZfIywNu9OjGmsrQrcQgShrgRHPYFmIbiEdCUsgVGPh9ENgc/k19mw/xAK2lUoB
	2OQBL1a44ViLh8l5duWMenEbEXtg5Y/1YNnxnZP6UZHhocMaJU/SM8+oYdBm5SYEIHNptak7MJmBh
	3bUmne17FU4FWyLxev/5yji40pJHwP3aqaluNUY4C1DpxL1oJjKKTgoNZcNPpaby9SQj3wbf6xYCc
	PEevecdV30nxNF+pafxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmdhj-00FxbO-Vq; Mon, 15 Nov 2021 15:15:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmdhW-00FxYi-8T; Mon, 15 Nov 2021 15:15:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD68E61AA2;
 Mon, 15 Nov 2021 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636989317;
 bh=caNhQR6MItqyqj8aVGADFWmRHHEWyDNeG1UmwE7ptic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dr80sE3aw+SJUtKRA8bYPi28rK3JmreYcEl7h8agB+wJiaLEDAvVbRPvWEeL8APNa
 RY0QuVKIPlt/TDI9mCAVapj4PC3N6zojsQO9Jk5Xq7/WB42HlA+6bLBGulMWWYWIzC
 nfiEVn1oCHhuEaGpo7fB4SpuDXTqWEgNm38Czh97cWr55BmoFJtemhO8EjP+zLl9wD
 lf7Kgcy9fGAQu5ifnLgquyEJjMa4wmfV5f1ETuHrh9lSk80d0CZKYl1k5xBB1h60+F
 HcHx4lDoMCAaNVq1R+OnUQ5PgeGVPc2XhM6R1A9aToMBsx/9uV/KcgTXZBBtcJTbUR
 VW+s6K6bFg9zA==
Received: by mail-wm1-f49.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso13206540wms.3; 
 Mon, 15 Nov 2021 07:15:17 -0800 (PST)
X-Gm-Message-State: AOAM533HcpsqKd56AO1woLkYHLHfQUFudBfY78P4Ad6jfKale6z943iq
 qvtMhBmz+UATG1+/5Fdk7LPIEBXfjLs9IWx+L0c=
X-Google-Smtp-Source: ABdhPJy8n2MSwzh6suyWZ9JESZ+B+WCCwhvtwsBUIZeDj84QhV0+ZckRDxWsOxlhdmOo7jylNl8QiKm3gBRShRPmqHI=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr42651026wmj.35.1636989316377; 
 Mon, 15 Nov 2021 07:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
 <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
 <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
In-Reply-To: <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 16:15:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1dGSF-S4msKKWvPYORwYCFvtkNSJwkhtxvETgiQjC7_Q@mail.gmail.com>
Message-ID: <CAK8P3a1dGSF-S4msKKWvPYORwYCFvtkNSJwkhtxvETgiQjC7_Q@mail.gmail.com>
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, 
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
X-CRM114-CacheID: sfid-20211115_071518_355032_38FC8C10 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBOb3YgMTUsIDIwMjEgYXQgMzo0NiBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+IDE1LjExLjIwMjEgMTQ6NTMsIExhcnMtUGV0ZXIgQ2xhdXNlbiDQ
v9C40YjQtdGCOgo+IFRoYXQgVGVncmEgU1BESUYgZHJpdmVyIHdhcyBuZXZlciB1c2VkLiBTdGls
bCB0aGVyZSBpcyBhIGdyb3dpbmcKPiBpbnRlcmVzdCBub3dhZGF5cyBpbiBtYWtpbmcgaXQgYWxp
dmUgYnkgaW1wbGVtZW50aW5nIEhETUkgYXVkaW8gc3VwcG9ydAo+IGZvciBUZWdyYTIwIFNvQy4g
SXQgd2FzIG9uIG15IHRvZG8gbGlzdCBmb3IgYSBsb25nIHRpbWUsIEknbGwgdHJ5IHRvCj4gcHJp
b3JpdGl6ZSB0aGF0IHdvcmsgNS4xNywgaXQgc2hvdWxkbid0IHRha2UgbXVjaCBlZmZvcnQuCj4K
PiBUaGUgc2xhdmVfaWQgc2hvdWxkIGJlIHJlbW92ZWQgYW55d2F5cywgaXQgd29uJ3QgYmUgbmVl
ZGVkLgoKT2ssIHRoYW5rcyBmb3IgdGhlIGJhY2tncm91bmQsIEknbGwgbWVudGlvbiB0aGF0IGlu
IHRoZSBjaGFuZ2Vsb2cgdGV4dCB0aGVuLgoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
