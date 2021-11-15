Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9458C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E5BD61BF5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E5BD61BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HsnDZyyv3OP3DAtOg25OEMmortKzPvfwaQ22Ns5NT8=; b=4QAxUyRrC1CPUQ
	263LPKDiraHeTtq72QWbeQzwzGeul9vuFDiLZisgzd3pv/QjRsxV9U9FUcfegjmTmWB9fZM3y2d4X
	hD0EycB3VZa97CUNIxkNmBF6iZHTgDdl0KhcsWi826/nQqz6ZgvWfQst1kNMsjSmlQ11wILbfR872
	W9zYQrbljSCyBAD8N5q5F8nhudwPmq0MOBvF4L9CpWRJmJt1XNp/WBKqlna7Eyl5Vv0WzzmhNZWFt
	OQYnBgOUOsLI6FBrLzIdeVf9hDdM+B20ShNZDTm52vT7AexXZZU5tgfkvWl3KTpUp9Hj0tNpDhzZY
	vRMRe5KgRv5B0paZ+q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmbk7-00FbCs-Sj; Mon, 15 Nov 2021 13:09:51 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmbk4-00FbBN-OF
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 13:09:50 +0000
Received: by mail-lj1-x22c.google.com with SMTP id e9so35391130ljl.5
 for <linux-mtd@lists.infradead.org>; Mon, 15 Nov 2021 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zdNnu6u0t53RxSPdU4MDPOEl5NW5wFhi+3tVJwsouBE=;
 b=AdlSGIXoBXq0VXgOWXENRxISfNEhM8HAmvts1hlgX2aW8p19gg4TWR8iIt27dsvmv1
 Er40yU2EVPgsKue7HjKRPzcvCEAOuYUSYPQRd7hA06J3e13A1mkLA77EDajw9vHVT420
 Lbp3x0tqpEh+8MBGtUYl/2+fVKsJM1+f+AKqTG6X7Kh0veEaJi77Iw0fl7cmv+hbpWsF
 4j+O7DBKUFLat0Nxi8uwYiTs345Prp9Z/jgqtkOJyAyKfWa7I7unOeTjMa5rmjmc3Xwr
 9Mt+CjQwmzF7FQsUxJSUVdME7aWf6slT3nqVKg54VhTbXds90COzK7cp9x7YBV5y9jx3
 XScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zdNnu6u0t53RxSPdU4MDPOEl5NW5wFhi+3tVJwsouBE=;
 b=xap9q8e2KmtRxliGzBcWencFVG1OMb22BUYeOGIwHLeETe4yu1bgkQxwYCwv6fPSjp
 SiFP4sAS/qlWYTdVf+yWW3IXusWU3umY8N46OwDd+scBeVl2trnRYj9FBrAN72IksLZ3
 4JGbw00tc3caDzLE42G50fsdCE8+LyXsOkyGdqOVmie3M99ug6h1wfEluRyisbbRy+co
 7qr99Xg3J5Io30eLCZ+7xQZzgTn5BProqv4UMLxJQ/1/4GD5H7Ppjlocz6zw6IMJ++HI
 w/TMPdaD71Ti0xvSGO+wMuJBNAYmXDYCRmUWjYqa+R0ncdgKt06D/qH3PmWX7/A0MLg9
 jVHQ==
X-Gm-Message-State: AOAM532T7582LpSLvPZ9w6Sc0BsS2EEC9rVclnvHMtiHvnyUdnRu93KR
 ZZwM1ut1j50pTwFLtPIGvB22ZARuPQsS7mdXVIdq+g==
X-Google-Smtp-Source: ABdhPJxdsC0uW2HE6zj+9SqQN+4ObrVjDxA5TLNECz/k4cRg87wjRG7GU625P/bUeyp/NjunxRKqIwie+Tr+AjkZQG4=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr38617043ljg.4.1636981785962;
 Mon, 15 Nov 2021 05:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-4-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-4-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Nov 2021 14:09:09 +0100
Message-ID: <CAPDyKFovVgrDxJ5eFgvAzwJNTrYSzjtz7z9UCa3rHMsgkFqsxA@mail.gmail.com>
Subject: Re: [PATCH 03/11] mmc: bcm2835: stop setting chan_config->slave_id
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
X-CRM114-CacheID: sfid-20211115_050948_850749_0E8CB308 
X-CRM114-Status: GOOD (  16.07  )
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

On Mon, 15 Nov 2021 at 09:55, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

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
> 2.30.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
