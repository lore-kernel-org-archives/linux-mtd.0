Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB40C43334
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Jul 2022 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xk5XrTb+TmT4b06/KcRNtHxGuXExrBiVJ81u+ggLVjU=; b=M0tr8orXd/mo8X
	oVtOwCDvL+RSP39DrydCobC4WsNqUqbWRtk88n3TTjT20987oiFbLxPtmUFbIJxGBDJoDU+/+3Cb9
	2kDywzWj8fb4NMoc+6+tN7ebB+EYmvmYpUhhwJEGy7vk2WUKOS0kZNMSoujZOopSa/DtWefdLsStb
	pLFS5o4kf5jE+jRfUOa8P20Pivmq1oJS8IgIRwHcdVbGo/CBi5Yt3OJ0mfTKmQRyD1YPOpEuR/OXA
	snHaZxu3nHyNIv3/+YC4ao+8DoKlcbfe9MMFDVyjkWe2OHzfB4PF5QRgBNPPJI4BtTRdmH7ZQwsRA
	EeGTxtcJXDUDc2lFZg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7v3L-00EYxF-BI; Sun, 03 Jul 2022 08:34:03 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7v3H-00EYvU-Tj; Sun, 03 Jul 2022 08:34:01 +0000
Received: by mail-qt1-f178.google.com with SMTP id k14so5832203qtm.3;
        Sun, 03 Jul 2022 01:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSHHOsfszPZ4Xzy/z0YVRPTZZp58PE4uq16iJ2kH/Zw=;
        b=OFRmcRQhCAghJANmDo4I6zsXfPiq2zBKUGWJK/JM/bZ9fnuQWsJUuBNNmZETlUuJ/l
         bcGXG5NDLGrDdX49ZrnSiXdlU0lcK2ffYpeg1JWBQDEep53XvfLPx1dcECM9S0Shrg81
         2Mcq8f009McLaM5567lCZa/74cBcEy3aDMSNMcHIMzqRC46xcCOIxKYqhnD/eIlQfDG4
         mVC/Py+i5SfrH26RCznySgVSlmNiSC7rARMIrC41IiGGTS/YtlBkDkhv/vhdPfDMM293
         ZC5sFZXiFIhUDwcGpkqPT1U4GhNMcR9RrQ5q9JvkIV3pxJ4K7AB7yNNFE7q9uA5FxEB6
         Viuw==
X-Gm-Message-State: AJIora8thAQPTVG/hwpidAHoOCfPogj7IcclWg4O8Huq5iLfIokOPs7w
	D9PwtHUQxqQJbg8T26OXLZHUj7z7RsNmEw==
X-Google-Smtp-Source: AGRyM1sz484j8Id5aqFytWFUJic/2DQxFnrtrCBTLyipimfvFCrDoeUigwWRQHcDP2O3Yd0znin9+A==
X-Received: by 2002:a05:6214:761:b0:472:f5f3:5139 with SMTP id f1-20020a056214076100b00472f5f35139mr200995qvz.48.1656837237749;
        Sun, 03 Jul 2022 01:33:57 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 93-20020aed3166000000b00304df6f73f0sm18098217qtg.0.2022.07.03.01.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 01:33:57 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id d145so8384907ybh.1;
        Sun, 03 Jul 2022 01:33:57 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr8702569ybu.604.1656837236792; Sun, 03
 Jul 2022 01:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190625075746.10439-1-vigneshr@ti.com> <20190625075746.10439-4-vigneshr@ti.com>
 <CAMuHMdUCdjfAoZm-cb4v+STt5C0T6OejdcCCQNBRqqAHL6JD=w@mail.gmail.com> <75fee78a-f411-1c7e-a902-d28d02703c16@ti.com>
In-Reply-To: <75fee78a-f411-1c7e-a902-d28d02703c16@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Jul 2022 10:33:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXczeOP9J_A6q1GdhBG42SwZa6VrwOCAdrbB4kSPF+8g@mail.gmail.com>
Message-ID: <CAMuHMdUXczeOP9J_A6q1GdhBG42SwZa6VrwOCAdrbB4kSPF+8g@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] mtd: Add support for HyperBus memory devices
To: "Raghavendra, Vignesh" <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Tokunori Ikegami <ikegami.t@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Mason Yang <masonccyang@mxic.com.tw>, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_013400_012870_37D2E033 
X-CRM114-Status: GOOD (  37.75  )
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

Hi Vignesh,

On Sat, Jul 2, 2022 at 7:10 PM Raghavendra, Vignesh <vigneshr@ti.com> wrote:
> On 6/27/2022 8:58 PM, Geert Uytterhoeven wrote:
> > On Tue, Jun 25, 2019 at 10:00 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> >> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
> >> Bus interface between a host system master and one or more slave
> >> interfaces. HyperBus is used to connect microprocessor, microcontroller,
> >> or ASIC devices with random access NOR flash memory (called HyperFlash)
> >> or self refresh DRAM (called HyperRAM).
> >>
> >> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> >> signal and either Single-ended clock(3.0V parts) or Differential clock
> >> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> >> At bus level, it follows a separate protocol described in HyperBus
> >> specification[1].
> >>
> >> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> >> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
> >> its equivalent to x16 parallel NOR flash with respect to bits per clock
> >> cycle. But HyperBus operates at >166MHz frequencies.
> >> HyperRAM provides direct random read/write access to flash memory
> >> array.
> >>
> >> But, HyperBus memory controllers seem to abstract implementation details
> >> and expose a simple MMIO interface to access connected flash.
> >>
> >> Add support for registering HyperFlash devices with MTD framework. MTD
> >> maps framework along with CFI chip support framework are used to support
> >> communicating with flash.
> >>
> >> Framework is modelled along the lines of spi-nor framework. HyperBus
> >> memory controller (HBMC) drivers calls hyperbus_register_device() to
> >> register a single HyperFlash device. HyperFlash core parses MMIO access
> >> information from DT, sets up the map_info struct, probes CFI flash and
> >> registers it with MTD framework.
> >>
> >> Some HBMC masters need calibration/training sequence[3] to be carried
> >> out, in order for DLL inside the controller to lock, by reading a known
> >> string/pattern. This is done by repeatedly reading CFI Query
> >> Identification String. Calibration needs to be done before trying to detect
> >> flash as part of CFI flash probe.
> >>
> >> HyperRAM is not supported at the moment.
> >
> > Thanks for your patch, which is now commit dcc7d3446a0fa19b ("mtd:
> > Add support for HyperBus memory devices") in v5.3.
> >
> >> HyperBus specification can be found at[1]
> >> HyperFlash datasheet can be found at[2]
> >>
> >> [1] https://www.cypress.com/file/213356/download
> >> [2] https://www.cypress.com/file/213346/download
> >> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
> >>     Table 12-5741. HyperFlash Access Sequence
> >
> > The last link no longer works.  Do you have a replacement?
>
> Looks like I used a link point to specific version instead of top level
> redirector link. Please use:
>
> https://www.ti.com/lit/pdf/spruid7

Thank you, that link works for me.

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
