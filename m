Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10947C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4528214AE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGXclkZ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FYFepXDU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4528214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2laaGG641GoK4eSwUtUqI1gG40t9CIo47OLZ0NLPKQ=; b=hGXclkZ/TNFY0f
	F50neMG6wjAGkqzoI1QTEVFTOmhRpPqsGB6TdcXt2wKXPGLE67dfQTCF/C3ttVe97cSt8Aarn4BIn
	e4F2iYKXOOumUfdVBvt+Q+9UPbQC3/D/YCDltYW6UdQ8qcX5xmQWeg2vIK9jyRlXdy8Ja0QCgBK9S
	WtWA1UfFOMrK/1nNZ3gEpVSfnY4N9gGvBqwi6OQSS5Pg46r1DqF7ajqOv0Oh2DnzFzffB8jsvs4bQ
	0wlhpIjvYZJ+6vXBwSEjzdbK3z9tQQZOd9FNjlj5BbxjdEKtW5eI3Cihm789WqgByjwXFGfUpoqHn
	Cobvi1374t+tPeX255nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h41Cz-0004dO-LL; Wed, 13 Mar 2019 10:34:01 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h41AV-0001eR-Mq
 for linux-mtd@bombadil.infradead.org; Wed, 13 Mar 2019 10:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0iSqXJx8+z6SHwhSAJ48Nf3VAnrfBTdURCZr2r2inds=; b=FYFepXDUB2bWxvkipzuLyzpfH
 042GmUkZxDIIr6PoLFS9pwXq6qHFrI24r/a2EWV/Nb+D2PAqswMs+qLbDgTWBM2oO6YHmeNI1LxJ+
 AZIueRW2XEkEBYewaf4i3B3TUr8/RmnqCjJ2Av7/r3eFXyN6lU5JcaVirO761ajlqg6gu0vakLFT/
 m4hPOTU3KKTLgDJFGAu6tLE1HINALwNeh3wm+zj8pz+XBMXMwwhiaRwZE8kUKHujynkdwPkZ8NU9Z
 VrpKrzpBpfpeawqpgR4oRsqocPpUAcjQOeoQ0pg8FPZeXRsp0xb985DYBH5ss2M/8RezHiR4DAogw
 grgWnO8lg==;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3zWU-0007H1-VF
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 08:46:04 +0000
Received: by mail-vs1-f66.google.com with SMTP id u6so504546vso.10
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2019 01:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iSqXJx8+z6SHwhSAJ48Nf3VAnrfBTdURCZr2r2inds=;
 b=T8KvL5gAEf53lBecjvb7ZoyGlDGUOE/lYygcoTkyLKeXJyrng9CIKE8mCtmB4PNBBx
 XwnQArsM202B4b/TdOR26/sKibIJNmbgi17S7z83vRhDb9h1Nf9oupOLbUiB46xnaIcr
 879Vj1WuBwoiU4f2+u0UK0vstYXyJMrTx3GcxYde5ApgBh6PAcFzYkwbWoe6Id5Ha/6C
 P+ClBsxQUQ8Xp1J47BCN4OfrGW88WGyZo9cJi/VWW8JN2dCStO2ZNxH7SToeme+QZxd7
 dB9ZyL7R25ihpO4izMiHAfhcLaZ8N4UA+MRXLfLCi5Lsx4R0Fr4SBxADnJoBj0IBiTIT
 d5Rw==
X-Gm-Message-State: APjAAAVub2sruliM1/rT7L99MEBiTn846HuhRi17V4Y8I3WdjkPr+V8Q
 ax2LFizeJauCnVVecHMqJ4i2HMRsUav0lImOUlc=
X-Google-Smtp-Source: APXvYqwXkwdvu49wXECKnDBE8WMcazYYxaXeoPD48glQZQ89yvhJqWXUrxdEufBxfCxr6qeJPY/1se77CiFxlYSkkHM=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr22441363vsp.166.1552466113131; 
 Wed, 13 Mar 2019 01:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190312184331.13755-1-geert+renesas@glider.be>
In-Reply-To: <20190312184331.13755-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Mar 2019 09:35:00 +0100
Message-ID: <CAMuHMdUPEjtzq8wVz7aHQdohdZiXZA3e7GrVS5TnHZ3Y-HsFAg@mail.gmail.com>
Subject: Re: [PATCH] spi: rspi: Fix register initialization while
 runtime-suspended
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_044603_022662_EAA13989 
X-CRM114-Status: GOOD (  28.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 7:43 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The Renesas RSPI/QSPI driver performs SPI controller register
> initialization in its spi_operations.setup() callback, without calling
> pm_runtime_get_sync() first, which may cause spurious failures.
>
> So far this went unnoticed, as this SPI controller is typically used
> with a single SPI NOR FLASH containing the boot loader:
>   1. If the device's module clock is still enabled (left enabled by the
>      bootloader, and not yet disabled by the clk_disable_unused() late
>      initcall), register initialization succeeds,
>   2. If the device's module clock is disabled, register writes don't
>      seem to cause lock-ups or crashes.
>      Data received in the first SPI message may be corrupted, though.
>      Subsequent SPI messages seem to be OK.
>      E.g. on r8a7791/koelsch, one bit is lost while receiving the 6th
>      byte of the JEDEC ID for the s25fl512s FLASH, corrupting that byte
>      and all later bytes.  But until commit a2126b0a010905e5 ("mtd:
>      spi-nor: refine Spansion S25FL512S ID"), the 6th byte was not
>      considered for FLASH identification.
>
> Fix this by moving all initialization from the .setup() to the
> .prepare_message() callback.  The latter is always called after the
> device has been runtime-resumed by the SPI core.
>
> This also makes the driver follow the rule that .setup() must not change
> global driver state or register values, as that might break a transfer
> in progress.
>
> Fixes: 490c97747d5dc77d ("spi: rspi: Add runtime PM support, using spi core auto_runtime_pm")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.1-rc1, as a2126b0a010905e5 will be in v5.1-rc1.
> ---
>  drivers/spi/spi-rspi.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
> index 556870dcdf7995f8..b30fed824e6643a2 100644
> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c
> @@ -868,28 +868,6 @@ static int qspi_transfer_one(struct spi_controller *ctlr,
>         }
>  }
>
> -static int rspi_setup(struct spi_device *spi)
> -{
> -       struct rspi_data *rspi = spi_controller_get_devdata(spi->controller);
> -
> -       rspi->max_speed_hz = spi->max_speed_hz;
> -
> -       rspi->spcmd = SPCMD_SSLKP;
> -       if (spi->mode & SPI_CPOL)
> -               rspi->spcmd |= SPCMD_CPOL;
> -       if (spi->mode & SPI_CPHA)
> -               rspi->spcmd |= SPCMD_CPHA;
> -
> -       /* CMOS output mode and MOSI signal from previous transfer */
> -       rspi->sppcr = 0;
> -       if (spi->mode & SPI_LOOP)
> -               rspi->sppcr |= SPPCR_SPLP;
> -
> -       set_config_register(rspi, 8);
> -
> -       return 0;
> -}
> -
>  static u16 qspi_transfer_mode(const struct spi_transfer *xfer)
>  {
>         if (xfer->tx_buf)
> @@ -959,8 +937,24 @@ static int rspi_prepare_message(struct spi_controller *ctlr,
>                                 struct spi_message *msg)
>  {
>         struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
> +       struct spi_device *spi = msg->spi;
>         int ret;
>
> +       rspi->max_speed_hz = spi->max_speed_hz;
> +
> +       rspi->spcmd = SPCMD_SSLKP;
> +       if (spi->mode & SPI_CPOL)
> +               rspi->spcmd |= SPCMD_CPOL;
> +       if (spi->mode & SPI_CPHA)
> +               rspi->spcmd |= SPCMD_CPHA;
> +
> +       /* CMOS output mode and MOSI signal from previous transfer */
> +       rspi->sppcr = 0;
> +       if (spi->mode & SPI_LOOP)
> +               rspi->sppcr |= SPPCR_SPLP;
> +
> +       set_config_register(rspi, 8);

Probably some of the operations in the (SoC-specific) set_config_register()
could be moved to .prepare_transfer_hardware(), but that can be done
in a future optimization.

> +
>         if (msg->spi->mode &
>             (SPI_TX_DUAL | SPI_TX_QUAD | SPI_RX_DUAL | SPI_RX_QUAD)) {
>                 /* Setup sequencer for messages with multiple transfer modes */
> @@ -1267,7 +1261,6 @@ static int rspi_probe(struct platform_device *pdev)
>         init_waitqueue_head(&rspi->wait);
>
>         ctlr->bus_num = pdev->id;
> -       ctlr->setup = rspi_setup;
>         ctlr->auto_runtime_pm = true;
>         ctlr->transfer_one = ops->transfer_one;
>         ctlr->prepare_message = rspi_prepare_message;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
