Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5C3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5DlevrI4MWTHHWyQ2+TCY31njynC/M2YSK6JnvNhCk=; b=BNGSiOeIf8BQMU
	+qHGD5lwB70MB2j1gUhFg/FJ/P2kIHlhBtiqMnomdE4BR3N6NQYJmFKJpkaZtJb3L1tWCtr7ZsbDY
	QRE03VuT3oSkG+im0jXL76QNEIh/R2qODaTCH5jPoeAHO8RCGK92s+dpb4cmfexu8u75Ow1i3G9bT
	6zH1Cly3T4PMH3ENr8kM/U9aHto187Q5k+myxptBoAUeCpSiVX4F5YcUUFrSVEECNeeAImt9gNAyx
	c9OxF+IfsEwwrJ1p4TGHA5B4Kpr/vydLJU/C+r2Av6DseKUw56atDd6hFzdPCMPsN4/FIv0uZ0HDw
	FI/BYPs4XyO53evoF3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlXQQ-001RTV-FU; Mon, 02 May 2022 14:53:22 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlXQJ-001RTB-Jq
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 14:53:19 +0000
Received: by mail-qk1-f178.google.com with SMTP id a76so3933089qkg.12
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 07:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XwFwDnsF3xtqeaJMjwj9Ym8eT8poLMp81Qmp6tqQGNs=;
 b=1BPXjRPAq+A6m0BJRKQRTXnDhwdsqXETzxeQbHLe41MxEsAth5lg4mR5Uoo+cWXR9f
 iavaoZBoRaE6oukJzgTCwTjNhHdThoRAC7pRNtpbhOUxBXTqn2ctqEEKIKkwk2mvTc9+
 VSpf0qQCUyuP52qWJ9b/kj2e/xz37/Iga/PNYyMSXqwasRmvb7U1J2+0hpgt4uZ+rtRE
 XvZ09FYd43oy25g7zUbUpC1oNOb+5Adz59u9YDoQcBS7lydt41Lg2MaBnu970274bIim
 rshVursFGEqMNIuY3dchqTAM/WZnSUKQdxwN7avmDwL+noUI6N7/RtkjVJOaMaIdOEtR
 zvJA==
X-Gm-Message-State: AOAM532Cupa037aTc1ZRnUvrnsBAe+naixjzALiiC0KM1VyDyM0VXCuO
 69+PmqnQLD/5Ff/TraTZADnfC2phRUlgCA==
X-Google-Smtp-Source: ABdhPJzSz8lqCaLXeYg0PGatqJfaSGI48Hkpl+9IG8dPh6xTtdXmWNR82paL1MTgqgvghUd3FWWg7A==
X-Received: by 2002:a05:620a:100b:b0:69f:d71e:3156 with SMTP id
 z11-20020a05620a100b00b0069fd71e3156mr4477372qkj.248.1651503192477; 
 Mon, 02 May 2022 07:53:12 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 m25-20020ae9e719000000b0069fc13ce208sm4192356qka.57.2022.05.02.07.53.11
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 07:53:12 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id w187so26463493ybe.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 07:53:11 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr11231735ybb.36.1651503191604; Mon, 02
 May 2022 07:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
 <20220429105229.368728-4-miquel.raynal@bootlin.com>
In-Reply-To: <20220429105229.368728-4-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 May 2022 16:53:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
Message-ID: <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: rawnand: renesas: Use runtime PM instead of the
 raw clock API
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
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_075315_698592_4EAE9672 
X-CRM114-Status: GOOD (  32.07  )
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

On Fri, Apr 29, 2022 at 12:52 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
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
> @@ -1319,6 +1319,7 @@ static int rnandc_chips_init(struct rnandc *rnandc)
>  static int rnandc_probe(struct platform_device *pdev)
>  {
>         struct rnandc *rnandc;
> +       struct clk *eclk;
>         int irq, ret;
>
>         rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
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
>         irq = platform_get_irq_optional(pdev, 0);
>         if (irq == -EPROBE_DEFER) {
> -               ret = irq;
> -               goto disable_eclk;
> +               return irq;
>         } else if (irq < 0) {
>                 dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
>                 rnandc->use_polling = true;
> @@ -1365,12 +1347,25 @@ static int rnandc_probe(struct platform_device *pdev)
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
> +       pm_runtime_enable(&pdev->dev);
> +       pm_runtime_get_sync(&pdev->dev);

ret = pm_runtime_resume_and_get)...);
if (ret < 0) ...

> +
> +       /* The external NAND bus clock rate is needed for computing timings */
> +       eclk = clk_get(&pdev->dev, "eclk");
> +       if (IS_ERR(eclk)) {
> +               ret = PTR_ERR(eclk);
> +               goto dis_runtime_pm;
> +       }
> +
> +       rnandc->ext_clk_rate = clk_get_rate(eclk);
> +       clk_put(eclk);
>
>         rnandc_clear_fifo(rnandc);
>
> @@ -1378,14 +1373,13 @@ static int rnandc_probe(struct platform_device *pdev)
>
>         ret = rnandc_chips_init(rnandc);
>         if (ret)
> -               goto disable_eclk;
> +               goto dis_runtime_pm;
>
>         return 0;
>
> -disable_eclk:
> -       clk_disable_unprepare(rnandc->eclk);
> -disable_hclk:
> -       clk_disable_unprepare(rnandc->hclk);
> +dis_runtime_pm:
> +       pm_runtime_put_sync(&pdev->dev);

pm_runtime_put()

> +       pm_runtime_disable(&pdev->dev);
>
>         return ret;
>  }
> @@ -1396,8 +1390,8 @@ static int rnandc_remove(struct platform_device *pdev)
>
>         rnandc_chips_cleanup(rnandc);
>
> -       clk_disable_unprepare(rnandc->eclk);
> -       clk_disable_unprepare(rnandc->hclk);
> +       pm_runtime_put_sync(&pdev->dev);

pm_runtime_put()

> +       pm_runtime_disable(&pdev->dev);

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
