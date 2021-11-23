Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC26C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8bxtlBK/6zPqRIdcm7zXJtO2HI5hqJH50GFdCg+VM8=; b=j99TISUF5ObMTe
	u8hr6bbHEPqAWv1OFmr3AyPNU8m0PkFCA/77QViFklmGWWpiNDKziG/hF6emp3WDvhnPMGjd3Gpwe
	5T3+QLhJfUDWxyeVcCa/R5XwbLD46Z+ZJCycg92C8NmHscaKiDRutt5xPy7HzEotz6ceCEqsu/vZO
	/DS/8tMrq4OlLg9z21ZnLY6xtf5BGFx5minRUkA2W3UgDF2cDV+KF2JpHRrbDY4FwLylyxugVaWZJ
	tMaLREdfLLKkexBZrqbfoT65IHOxIh/rM6P5+sEiknmbXEYtiR7wbLRfQ88iYqOvtgnPApiJBXQvR
	nP0UY8wYEZTkIai/obpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTpb-001rdj-64; Tue, 23 Nov 2021 11:19:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTpY-001rbx-7K
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 11:19:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id l7so5140522lja.2
 for <linux-mtd@lists.infradead.org>; Tue, 23 Nov 2021 03:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+ogjWxG1DbsOOSKAdBRBvdcSf1vlOMjAXY68aT/3+U=;
 b=g2Y3CYQC1NcCLavzUvr4ErWMQvZ4fzsgBv6CCbmTOoZcOun8WjSds54sZrtzeYEA0U
 N5KF7mJ3kl8nFIULnhlxeAUeFZAuCfq+uX5Urd7Y31Xp8cHxNzCxkkp6HS46EZb3D6jZ
 c7TwybE0YdC9woGghm+c/KCOlK35CIfDZrYTO7zFljpZaTHjklc27An1TOol1n/1idvS
 kCKfDejnDdUw+aN2JJNNmUQf32+SP4pOXJVkzxhNH+rbEkLFMLkjE8yfz5ElxThNneaF
 SJXtBIs1DuxaYn0676eJKdryXGQlku5s0UQEwOdM0oGilYhXoK+2140z6YDVV15iHy6a
 9PQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+ogjWxG1DbsOOSKAdBRBvdcSf1vlOMjAXY68aT/3+U=;
 b=bmUnIWFxYi0p9tfb8i1dvO5kDGZjXzIUKAG+4kSPnufVnC3ukVmXWGh8Wtz6YHEzBS
 04JNgqSa28/1MEst7NTTjvWkXJ5/BsRbviBajoo/VWf/EBSIrjziGTmhlcJxth4XXPUL
 N3e2aWJxcBMZ3QvdujkpOTwa1kPpqozMBRJnFA4APweGYs3g0mfA+mTn2IkEFj6O2296
 bdTiJsDfX9uy7xyiEiSbFoVBJIkEbx/H9xlr0nxqt0a9gwe4JKMn8LiV9OoxpxrKiHSn
 5GmBOaz4BMvUfmCSO2192NNmZCHMpJU3dKMoxjQvNBS0/R/2x7UCgIm90/d2nL78Z1Y4
 2Zug==
X-Gm-Message-State: AOAM533r6rikBYIxMwfls0kpx5WMOqkxwXEpPYh+VhG0joMnWMe4FJmI
 reTW5AqzACkUJAF4N7orQPnL96XW6bOdaNr1xXFRdA==
X-Google-Smtp-Source: ABdhPJxH+dIDF8nBsp8fxznpkoFe9y9Zmc/xUzjvp4Mfv2L5TNuCMH6djlHGcQ7ManpwMDd1PzQBcWJG8pF2EVa/HSY=
X-Received: by 2002:a05:651c:1507:: with SMTP id
 e7mr4381662ljf.300.1637666356182; 
 Tue, 23 Nov 2021 03:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-5-arnd@kernel.org>
In-Reply-To: <20211122222203.4103644-5-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Nov 2021 12:18:40 +0100
Message-ID: <CAPDyKFrCOoFWuM_6Renu+M5SHotyuzXeyH99WZb69G1PFQ1z5A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] mmc: bcm2835: stop setting chan_config->slave_id
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org, 
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_031920_276112_7A93BE53 
X-CRM114-Status: GOOD (  16.34  )
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

On Mon, 22 Nov 2021 at 23:23, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
>
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think I acked the previous version, but nevermind:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/bcm2835.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 8c2361e66277..463b707d9e99 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1293,14 +1293,12 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>
>                 host->dma_cfg_tx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>                 host->dma_cfg_tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -               host->dma_cfg_tx.slave_id = 13;         /* DREQ channel */
>                 host->dma_cfg_tx.direction = DMA_MEM_TO_DEV;
>                 host->dma_cfg_tx.src_addr = 0;
>                 host->dma_cfg_tx.dst_addr = host->phys_addr + SDDATA;
>
>                 host->dma_cfg_rx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>                 host->dma_cfg_rx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -               host->dma_cfg_rx.slave_id = 13;         /* DREQ channel */
>                 host->dma_cfg_rx.direction = DMA_DEV_TO_MEM;
>                 host->dma_cfg_rx.src_addr = host->phys_addr + SDDATA;
>                 host->dma_cfg_rx.dst_addr = 0;
> --
> 2.29.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
