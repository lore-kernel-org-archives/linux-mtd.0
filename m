Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616C8C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kp8v9w+kZduv5H0DHPzFZFBLbsgVQ6Otmu28AwFukew=; b=Pf/2W6tH+veEJ5
	Uc2EyLkHPI7Q6to3VSu5c8SiuuCKA3Sjts1c1Gxv9cXrFGKNZAf/gln4cCNkv14kPeNxQjJcBUrm4
	EV4lqokA54FvUL1LBONxddbBtLWtP+R5P3bjCCnWWIQO7Ks8Ps6rNr2cb2eqsrZ+72t8NhiZ4cyUO
	yixWdT2YE/JVj3mHkL6m7C7q1kMOXeCkl5LBNUaSX9ilfrM/bHX2E0cLCRuGGAoxkwHlP+rNA3F1v
	/x1XMSHOaXEb14RyPVQUdlKB1WVcJuuFOG4hECxAuSmnoZxqsa1sG4RMTmBpflGn6S4/FWbw5DPEg
	Xn93dBfH2vNMBtyApIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLxJ-000lkE-4S; Tue, 10 May 2022 09:14:57 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLxG-000ljG-3I
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 09:14:55 +0000
Received: by mail-qk1-f169.google.com with SMTP id bs17so3189811qkb.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 02:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A15r4+EoT4EZyVbRMp20MyCJWBQTiIY9T0jy9XAyUCg=;
 b=iJIGzDJHAEOEH1NEoGO0dSZkSMmBFDW3f845WBA15z6F1u7kgX9kEqA2qsJXA6rJpJ
 +blAn4fARjxLA8LlCJoeckTmu5QVvMcC8ZLPGL0zhUuMTfV16muLoCJPjebRWoXZ7IKp
 rjmvOkUGJaHDfoC5Oj+w/fmXWslmoSBAlImY0vwh9owObdhSkfVMhHXSlMYmrt1AKh1d
 PDzZoT6WHGpXKb5sWkMMr53Bg+IqDD7ipNw/dNAyDyjW3Ry8rQogONUld6PED0mTgDw9
 2yYCM57omtOhZd7TfV0J7Kan8+Hrxgu/89rtl3NDPSFtHHTBxTRTzWPmqVSm1tYrVbu3
 oErQ==
X-Gm-Message-State: AOAM531ONabxxE+qIc3+SRgErRj3xTP23Ph+M2Y7xKmnf53QL1SEHwk3
 kDgp/D2PWk1+KeglijwiXl36giY3qCMuYw==
X-Google-Smtp-Source: ABdhPJwFNo24Gu6E+DL+z9YW7rf+SYVYyZ0KwBtqOOKxz9XR/h7OprSZjCmW9loYMbHrFrag8Oy1Hg==
X-Received: by 2002:a05:620a:414f:b0:6a0:435:cb2d with SMTP id
 k15-20020a05620a414f00b006a00435cb2dmr14718391qko.625.1652174091498; 
 Tue, 10 May 2022 02:14:51 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 c68-20020a379a47000000b006a03cbb1323sm7786447qke.65.2022.05.10.02.14.49
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 02:14:50 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id e12so29523022ybc.11
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 02:14:49 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr17702940ybu.604.1652174088988; Tue, 10
 May 2022 02:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
 <20220509154943.25422-3-miquel.raynal@bootlin.com>
 <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
 <20220510110257.11ac55f1@xps13>
In-Reply-To: <20220510110257.11ac55f1@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 May 2022 11:14:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2KHuh2d_cw6xZEiZv+-v8P_YFfzxr2qLdC=HKaLr2ZQ@mail.gmail.com>
Message-ID: <CAMuHMdU2KHuh2d_cw6xZEiZv+-v8P_YFfzxr2qLdC=HKaLr2ZQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220510_021454_187907_EA3ADE7D 
X-CRM114-Status: GOOD (  35.70  )
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

On Tue, May 10, 2022 at 11:03 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Tue, 10 May 2022 10:52:41 +0200:
> > On Mon, May 9, 2022 at 5:49 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > This NAND controller is part of a well defined power domain handled by
> > > the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> > > and exclusively use the runtime PM API to enable/disable the clocks.
> > >
> > > We still need to retrieve the external clock rate in order to derive the
> > > NAND timings, but that is not a big deal, we can still do that in the
> > > probe and just save this value to reuse it later.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > @@ -1365,12 +1347,27 @@ static int rnandc_probe(struct platform_device *pdev)
> > >                 ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
> > >                                        "renesas-nand-controller", rnandc);
> > >                 if (ret < 0)
> > > -                       goto disable_eclk;
> > > +                       return ret;
> > >         }
> > >
> > >         ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> > >         if (ret)
> > > -               goto disable_eclk;
> > > +               return ret;
> > > +
> > > +       devm_pm_runtime_enable(&pdev->dev);
> > > +       ret = pm_runtime_get_sync(&pdev->dev);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       /* The external NAND bus clock rate is needed for computing timings */
> > > +       eclk = clk_get(&pdev->dev, "eclk");
> > > +       if (IS_ERR(eclk)) {
> > > +               ret = PTR_ERR(eclk);
> > > +               goto dis_runtime_pm;
> > > +       }
> > > +
> > > +       rnandc->ext_clk_rate = clk_get_rate(eclk);
> >
> > Personally, I would do this before requesting the interrupt.
> > But I guess it's fine to do that here, too.
>
> What do you mean by "do this"? If you are talking about getting the

Getting the clock (which could -EPROBE_DEFER, in theory) and its rate.

> rate of the clock it's only needed when initializing the timings which
> happens later in the probe path and has no relationship with the
> interrupts at all. Anyway, I will move all of that earlier so that we
> don't have a possible situation where the device is not clocked when
> accessing it.

OK.

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
