Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43405C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 034B961AE2
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 034B961AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqiP0ApGTU0zDUp88/217ETo3GKlyRauC8zFhUwzYCQ=; b=gslXUK2huTJ6D4
	4NrCCx0vEwH14E4mJF8ZBXc9HcuyfgZl0JGchZLo+OzMw227MIaTAWLdTMze+GLqJczzu0FAZXOwX
	iG1uvnbCi86wsOvDMeADaBNidFcQEYnPhdfKy9OXJGBfBcUrzgTCsGHjTJA7x766XqawKu13E3a6e
	3OASeLxLhznSMU1krCtz8ZiD1iHyN2qq0vVGXJaio243AQUOn5SbQZJ5RU2jR6vKeWCgvf90lYknT
	BmqI2GzjdkMmJj9Z2CGO4ls5VEAdy7AR7uNERKMEjVo4DtYzGTXMo+CBxfs4FpiMU4IVt1aOaexdb
	F/nrTvVcHQeG2Qu/Pm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZ1y-00F8Ux-7y; Mon, 15 Nov 2021 10:16:06 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYig-00F2Mt-1T; Mon, 15 Nov 2021 09:56:11 +0000
Received: by mail-ua1-x92a.google.com with SMTP id az37so33542698uab.13;
 Mon, 15 Nov 2021 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsBk71NedBBsVpsWIk4ACHvjoj+bC3+VIVEUbcpO8IA=;
 b=ehc21nRzLc8i1U+EqW4HnjY+RWjGWh14ZBLj7yNPUxl816A1Dbell6St7S/yW4X/vv
 tt7qOOmMMY85WSc7GghoYpJGJ9xgEBBUokeqlapvAJX5EFUnaN1rvUlEUeE8epbheu5B
 bWVKVRopMxxBfMWO9giRCidfYfZ56vuyGO7o4CSsyVdRcdOlFmosB/G0CBJUF76Dwi9T
 Bi5dKD3S2Ixk/FkU0QqBfwiiGLH1DDHTmYGg0Ci2mql4cvEo0wmrzkz2B7tgBgY5liPS
 E361qlo75lRj9Ddb/VA9aIMjLtX6LX3ck8/h22UNs9feaHP2NMM+vvRDoJtlPCwrDlmi
 9GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsBk71NedBBsVpsWIk4ACHvjoj+bC3+VIVEUbcpO8IA=;
 b=SPeP+5mgbuRo+1hrnM6sgePy9pfxPN15DnqidG/ljdXyMNWnju37zltdJNQaPxpj5k
 4KzDoxqfRoRciLK2jSjdz7IrBDXrdVANzl99UY4s2hA4kglX28W8Z/aiALv9xyoDIcrQ
 bmyNraygPL5LkbV5nY7VrVCXg2R3SNB6plE1JWxYIXqeQuohNfnA3SK2k3WARYxA2DvF
 T3VutEzPUoyWJ803mJax9s6uxUIRjo8gG5OlQN/xi+mhFUrnFjip5zIkY36Ui+TnEsn+
 zMi+9AmTxLjF2EOxmi1tPUa0oA3y/3MlYQwiDgXXq7b4quy//X6oiBucQHvNOcJ7csx3
 JV8g==
X-Gm-Message-State: AOAM530YFxVMg4I73nJzOnN7c35elKxWXAlcnGCK3UMba3LArqY/l8lH
 zNe1eFn7RDlKtrOHi2Z4IB5ZX+fD+atlhp1N3y8=
X-Google-Smtp-Source: ABdhPJz6ESqhwfmkhVT1QvVuW/9wYB2eiEui3t3htInxrDx0SkRrPjrQEm+aetErjkG15iM6y1caYpqVdHJBHexZMiA=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr56751869uar.66.1636970168537; 
 Mon, 15 Nov 2021 01:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-11-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-11-arnd@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 15 Nov 2021 10:55:56 +0100
Message-ID: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
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
 linux-arm-msm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_015610_175433_31322028 
X-CRM114-Status: GOOD (  25.01  )
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

On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Picking the connection between a DMA controller and its attached device
> is done through devicetree using the "dmas" property, which is implemented
> by the gdma driver, but it also allows overriding the "req" configuration
> with the slave_id field, as it was done in some linux-2.6 era drivers.
>
> There is no driver in the tree that sets these values, so stop
> interpreting them before anything accidentally starts relying on it.
> Rename the field in the channel from "slave_id" to "req" to better match
> the purpose and the naming in the hardware.
>
> If any driver actually starts using this DMA engine, it may be necessary
> to implement a .xlate callback that sets this field at probe time.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

This driver has been already deleted from the staging tree. See [0].

Best regards,
    Sergio Paracuellos

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=5bfc10690c6c590a972be014ed8595e77e1e2dea

>
> diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
> index b5229bc6eae5..f00240e62e1b 100644
> --- a/drivers/staging/ralink-gdma/ralink-gdma.c
> +++ b/drivers/staging/ralink-gdma/ralink-gdma.c
> @@ -106,7 +106,7 @@ struct gdma_dma_desc {
>  struct gdma_dmaengine_chan {
>         struct virt_dma_chan vchan;
>         unsigned int id;
> -       unsigned int slave_id;
> +       unsigned int req;
>
>         dma_addr_t fifo_addr;
>         enum gdma_dma_transfer_size burst_size;
> @@ -194,7 +194,6 @@ static int gdma_dma_config(struct dma_chan *c,
>                         dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
>                         return -EINVAL;
>                 }
> -               chan->slave_id = config->slave_id;
>                 chan->fifo_addr = config->dst_addr;
>                 chan->burst_size = gdma_dma_maxburst(config->dst_maxburst);
>                 break;
> @@ -203,7 +202,6 @@ static int gdma_dma_config(struct dma_chan *c,
>                         dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
>                         return -EINVAL;
>                 }
> -               chan->slave_id = config->slave_id;
>                 chan->fifo_addr = config->src_addr;
>                 chan->burst_size = gdma_dma_maxburst(config->src_maxburst);
>                 break;
> @@ -288,12 +286,12 @@ static int rt305x_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
>                 dst_addr = chan->fifo_addr;
>                 ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED |
>                         (8 << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
> -                       (chan->slave_id << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
> +                       (chan->req << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_DEV_TO_MEM) {
>                 src_addr = chan->fifo_addr;
>                 dst_addr = sg->dst_addr;
>                 ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED |
> -                       (chan->slave_id << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
> +                       (chan->req << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
>                         (8 << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_MEM_TO_MEM) {
>                 /*
> @@ -365,12 +363,12 @@ static int rt3883_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
>                 dst_addr = chan->fifo_addr;
>                 ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED;
>                 ctrl1 = (32 << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
> -                       (chan->slave_id << GDMA_REG_CTRL1_DST_REQ_SHIFT);
> +                       (chan->req << GDMA_REG_CTRL1_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_DEV_TO_MEM) {
>                 src_addr = chan->fifo_addr;
>                 dst_addr = sg->dst_addr;
>                 ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED;
> -               ctrl1 = (chan->slave_id << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
> +               ctrl1 = (chan->req << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
>                         (32 << GDMA_REG_CTRL1_DST_REQ_SHIFT) |
>                         GDMA_REG_CTRL1_COHERENT;
>         } else if (chan->desc->direction == DMA_MEM_TO_MEM) {
> --
> 2.30.2
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
