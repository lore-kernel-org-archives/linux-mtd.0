Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D0FC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GB8NVYKIeu/7KoDmzh3EjLrIHq8nNuoyMjRCao9CGbM=; b=GC+wZ1+eAltH1W
	IHOtaVcAHyuNaxP2WneJpxuWambOTc9vao9Ng6eyFv3UIwdq8KfOBhfMoj0lFk1BA2MaMaSZBu7er
	Z7YFt3nMLD86wwuBt1MNjaYmO7ITxwq4izUGCIxDDYTsxNbf3hNiVlqGlkyLRaQk0Rd5+dXMhZ8K4
	rfXcI2Ago/EVbGC6/KtulMEh/h020/MF/vvqJdlvb7QpgMdsU6R3AwsesznDJ6MGa8dyscOCaLfpS
	LTGGvow3SsQzW4oere84YGX2C9KCpmkjgj5HV4h0Dfj3kUge2Ke/Pw7tzpuumN5IEnLNztzIGfQ2T
	8Q3XCN750o+m2ggHku0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qfa-001e5I-6Q; Mon, 27 Jun 2022 15:28:58 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qfW-001e3v-Rt; Mon, 27 Jun 2022 15:28:56 +0000
Received: by mail-qv1-f49.google.com with SMTP id o43so15231860qvo.4;
        Mon, 27 Jun 2022 08:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cew7BXEncqN8cEBUoXDCQbsV+p26HXetoRwi9DMFMVs=;
        b=1K5pOHQ1cey9t2pt+83RbWKd7Td46Kxi+u9z4I2z84gy487PfZRzfLP9rxd8SNAnKh
         Mc/4LzdTCyRtaYighDZYSC63SXKrAOgjdz8i6s1zK7HULwxKkaEQKuDU27skKyGDR1py
         xbXw3SuK7l879zqHn830PJIh19Chc8CqfwD5pGrFVcNxatyIwiSCvKVr5A6YtPYC7Vkq
         P+z6xvMCzVIIddEwcvdRPZvA6uPTvkpLCPCv7zADusZwZimBtO95KwQAgSbEHgBJSs9T
         Rvt+t4f5PC517GWix4Kp+Hl0vKwAwFtqthawhzoLWDhiLPhrguQk0eTSRGXzis7aqrxp
         sAuw==
X-Gm-Message-State: AJIora+zVuQ0TFP2vCpOuSYAlbrg99z86+7k97EJX9pfQKntXkb3qLsd
	eR3axqUjCwtky5KCwEDdPress2MutQgWJQ==
X-Google-Smtp-Source: AGRyM1vLyztJBhMdoVWjq2JjeDrmkTqMpc+JuZ8s+oAYBhu9Gl8MEEQHtXR83EG8iT9kQr3GS2AwnA==
X-Received: by 2002:a05:622a:487:b0:319:5476:6932 with SMTP id p7-20020a05622a048700b0031954766932mr6274595qtx.351.1656343732389;
        Mon, 27 Jun 2022 08:28:52 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id y17-20020a05620a25d100b006a6a5d1e240sm9668214qko.34.2022.06.27.08.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 08:28:51 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i15so17416440ybp.1;
        Mon, 27 Jun 2022 08:28:51 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr14703242ybb.202.1656343731074; Mon, 27
 Jun 2022 08:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190625075746.10439-1-vigneshr@ti.com> <20190625075746.10439-4-vigneshr@ti.com>
In-Reply-To: <20190625075746.10439-4-vigneshr@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jun 2022 17:28:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCdjfAoZm-cb4v+STt5C0T6OejdcCCQNBRqqAHL6JD=w@mail.gmail.com>
Message-ID: <CAMuHMdUCdjfAoZm-cb4v+STt5C0T6OejdcCCQNBRqqAHL6JD=w@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] mtd: Add support for HyperBus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Tokunori Ikegami <ikegami.t@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Mason Yang <masonccyang@mxic.com.tw>, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_082854_943095_DB2A15B1 
X-CRM114-Status: GOOD (  30.58  )
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

On Tue, Jun 25, 2019 at 10:00 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
> Bus interface between a host system master and one or more slave
> interfaces. HyperBus is used to connect microprocessor, microcontroller,
> or ASIC devices with random access NOR flash memory (called HyperFlash)
> or self refresh DRAM (called HyperRAM).
>
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in HyperBus
> specification[1].
>
> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash with respect to bits per clock
> cycle. But HyperBus operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
>
> But, HyperBus memory controllers seem to abstract implementation details
> and expose a simple MMIO interface to access connected flash.
>
> Add support for registering HyperFlash devices with MTD framework. MTD
> maps framework along with CFI chip support framework are used to support
> communicating with flash.
>
> Framework is modelled along the lines of spi-nor framework. HyperBus
> memory controller (HBMC) drivers calls hyperbus_register_device() to
> register a single HyperFlash device. HyperFlash core parses MMIO access
> information from DT, sets up the map_info struct, probes CFI flash and
> registers it with MTD framework.
>
> Some HBMC masters need calibration/training sequence[3] to be carried
> out, in order for DLL inside the controller to lock, by reading a known
> string/pattern. This is done by repeatedly reading CFI Query
> Identification String. Calibration needs to be done before trying to detect
> flash as part of CFI flash probe.
>
> HyperRAM is not supported at the moment.

Thanks for your patch, which is now commit dcc7d3446a0fa19b ("mtd:
Add support for HyperBus memory devices") in v5.3.

> HyperBus specification can be found at[1]
> HyperFlash datasheet can be found at[2]
>
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence

The last link no longer works.  Do you have a replacement?
Thanks!

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
