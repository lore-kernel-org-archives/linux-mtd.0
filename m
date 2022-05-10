Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B73C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+APLxZUha0GbmziDpAatxiVXeKhbj/qkbm3QpC+EvI=; b=2N9hfpFsQrdi2B
	G0hBDc8uTEfcAGol0WSn15i69hYrxCdDMQ/6I2OR2pBpr1OdPQgCmRw/RfI/D6DMmod485p9uQCkq
	JZzXVdG6rYgqehCdoJf44z8xrB2TFwBzg6PSi3qZOvUISEHt7I/XnwxgZzmqt7AWmfkKTduo9EOK8
	6KFooA4OdKpRvlWUtWc3U1CyOXZ6PwnF06rEi/8410+KOczDtafxvaZT7oo0lVgcjTgbmUCrZY2gs
	6kESe6YuRvDm3jRIGYBjpMt9bSvIg2HuZxgcnCIGj5Q0iqaL92jj+v3K0orFzMPrfU0JeZR73INc7
	4cw/KHUGiTCDLxPJW6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLc3-000iDu-2n; Tue, 10 May 2022 08:52:59 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLc0-000iD5-Fs
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 08:52:57 +0000
Received: by mail-qt1-f170.google.com with SMTP id o18so13045299qtk.7
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 01:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3aRSud9RaBfHsmVcVpAPA+KhZytVfJcesv8QWo45pcY=;
 b=wYtxa4fEzd7xvzYjdSj3SH7XBJEM6Mg/7i6d466Pe5QqP4u3orDRYdhocdYauhM9+R
 VKRUK/fOJguI+CmJKzNWrK5yas+GGfO1qCd/BKxgN4f527jvyPgrHOf1GRFCgHQMNOhY
 HuiCswcVYAOoBgWQn/g9oMFY2yJYlUMHvmS9CLtP+Y7WuyHkEfUXYibZcUByEZ8ENLJq
 FEZqdIa2HRV1pIK3UPD6WoSJQurQzCFt7udd8CR780N3vCzlde1PAsFgyi1PU6XSbhpx
 awVLbABB8VmbXDPgl70EGCW8kvA/ayjO0/0h/XlF87Ji6qb3jaPaodFK56ABJYYRuk1N
 ReKQ==
X-Gm-Message-State: AOAM5327RNY68I79QEYYUBrC99dvpdOgSlcgLzDZu0W2xSheLrVkdbbs
 QKojyMskOrcPOCaOgC6UKasKwNjjXgKc6w==
X-Google-Smtp-Source: ABdhPJzNi7q6G2k2rfKAFy7xyvJYSX3bIwQrNoEgp6UuxtvWPrAm8ip03ydMJvr/CLA7r8ZjcgK2Eg==
X-Received: by 2002:ac8:764a:0:b0:2f3:a183:e89d with SMTP id
 i10-20020ac8764a000000b002f3a183e89dmr18842556qtr.214.1652172774071; 
 Tue, 10 May 2022 01:52:54 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 i16-20020a05620a075000b0069fc13ce1e7sm8137551qki.24.2022.05.10.01.52.52
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 01:52:53 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2ec42eae76bso171683547b3.10
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 01:52:52 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr18436143ywh.384.1652172772572; Tue, 10
 May 2022 01:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
 <20220509154943.25422-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220509154943.25422-3-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 May 2022 10:52:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
Message-ID: <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>, Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, 
 Clement Leger <clement.leger@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_015256_568608_665EC68B 
X-CRM114-Status: GOOD (  32.58  )
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

Hi Miquel,

On Mon, May 9, 2022 at 5:49 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> This NAND controller is part of a well defined power domain handled by
> the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> and exclusively use the runtime PM API to enable/disable the clocks.
>
> We still need to retrieve the external clock rate in order to derive the
> NAND timings, but that is not a big deal, we can still do that in the
> probe and just save this value to reuse it later.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c

> @@ -1335,29 +1336,10 @@ static int rnandc_probe(struct platform_device *pdev)
>         if (IS_ERR(rnandc->regs))
>                 return PTR_ERR(rnandc->regs);
>
> -       /* APB clock */
> -       rnandc->hclk = devm_clk_get(&pdev->dev, "hclk");
> -       if (IS_ERR(rnandc->hclk))
> -               return PTR_ERR(rnandc->hclk);
> -
> -       /* External NAND bus clock */
> -       rnandc->eclk = devm_clk_get(&pdev->dev, "eclk");
> -       if (IS_ERR(rnandc->eclk))
> -               return PTR_ERR(rnandc->eclk);
> -
> -       ret = clk_prepare_enable(rnandc->hclk);
> -       if (ret)
> -               return ret;
> -
> -       ret = clk_prepare_enable(rnandc->eclk);
> -       if (ret)
> -               goto disable_hclk;
> -
>         rnandc_dis_interrupts(rnandc);

This touches the hardware, so the device must be operational.
Hence please move the pm_runtime_*() calls up, to make sure the device
is accessible.
Sorry for missing that before.

>         irq = platform_get_irq_optional(pdev, 0);
>         if (irq == -EPROBE_DEFER) {
> -               ret = irq;
> -               goto disable_eclk;
> +               return irq;
>         } else if (irq < 0) {
>                 dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
>                 rnandc->use_polling = true;
> @@ -1365,12 +1347,27 @@ static int rnandc_probe(struct platform_device *pdev)
>                 ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
>                                        "renesas-nand-controller", rnandc);
>                 if (ret < 0)
> -                       goto disable_eclk;
> +                       return ret;
>         }
>
>         ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
>         if (ret)
> -               goto disable_eclk;
> +               return ret;
> +
> +       devm_pm_runtime_enable(&pdev->dev);
> +       ret = pm_runtime_get_sync(&pdev->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* The external NAND bus clock rate is needed for computing timings */
> +       eclk = clk_get(&pdev->dev, "eclk");
> +       if (IS_ERR(eclk)) {
> +               ret = PTR_ERR(eclk);
> +               goto dis_runtime_pm;
> +       }
> +
> +       rnandc->ext_clk_rate = clk_get_rate(eclk);

Personally, I would do this before requesting the interrupt.
But I guess it's fine to do that here, too.

> +       clk_put(eclk);
>
>         rnandc_clear_fifo(rnandc);
>

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
