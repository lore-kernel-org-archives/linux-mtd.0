Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA28C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 14:05:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9FF20842
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 14:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajDboVIh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9FF20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsecqW8kxW8Ejn3epe8f8OrnF8cEmT4QTqmFTHOaZno=; b=ajDboVIhXG4gPx
	sDjw43HBDLRZmwiPVeszxpRBg4ZQbqORg+Xu2NTs/OgK22TTeAtFsHpl2z4KZ5K/8v9rie7LO6ber
	ZCf5eEPIVdjx0/9hTlSEoU5OSQvxKJrQM7+TzvdVZkb0chnuSe8HOvdW6lZQNloztDNuaLgrl05rA
	Mj4PeELMO+LUMCz9JhqW4cUZiRM/SCJ7JIeYOUrl6DZoWGY2xR0l65EqNjP9jgXk5XMrwOI6qM6zm
	/BGWg5nbDsapB3qEuDMq2g8JqYh8izIBAfTUZa6uVNUdmi5GqG4R+hfEbXrqSLmlHg4/XBNXVGPgA
	Kqyh0wmyqNQxHRU3E+Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1AhC-00015j-TX; Tue, 05 Mar 2019 14:05:26 +0000
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1Ah9-00015L-Da
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 14:05:25 +0000
Received: by mail-ua1-f65.google.com with SMTP id d4so7738602uap.5
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2019 06:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYXkgi80vTtMx51TYzxZQuyfsOpsBgFFPSuFh4joC88=;
 b=QmY8s7EWiujUMbQF2CfiEFuk2z2b1Qu6GlIs+O/HplLFJ2TEbFCOeLsmrPiUW6SF7r
 pdL1QtUgPoK7e17oJkMDYvmlLuGK7R+txLjU53R60d3cUkD/qN8+1Jg60pzNN0P6xbCd
 JyMSEjEJ5g+NitjvKa5OsI8uwMK0fOwcR9PCYVPvvcv5UxqQl+J8zOjEFDDg4xkIWygs
 FCHDnH2g072oJJ4oGDoZj4fSGk3pFqQCROqsoF34FoSuXTY4P8xYLx4he1jMM4iH30qt
 JFwP5XZAMsq7JMXPPbzB6hAn4yBcTA+Idp4xxsrpM+0x24Sl/CACnLr2IXn9657uIPB5
 i8Ag==
X-Gm-Message-State: APjAAAWiO/54rp9faJyEQRyE2L4U8a2FJfUmUjeCQZGYzcpfadHFV2RG
 +tdo6p3aQEUFk0N+JYSWUlhtu4fV47Xr70rOvR0=
X-Google-Smtp-Source: APXvYqyx/fTIRHtoLcLJ3wHPwHk2jK52tYdNL0seM4Uz2uQpSoqHTNF16kHxW9zMEQ9Rp0cVYtHcw3Yczj4XWZL/ygg=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr1261608uab.75.1551794721536; 
 Tue, 05 Mar 2019 06:05:21 -0800 (PST)
MIME-Version: 1.0
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
In-Reply-To: <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2019 15:05:09 +0100
Message-ID: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_060523_469575_37217B79 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei,

On Wed, Jan 16, 2019 at 6:53 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
> family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
> covering S25FS512S and now that we have added 6-byte ID for that chip, we
> can convert S25FL512S to using a proper 6-byte ID as well...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This is now commit a2126b0a010905e5 ("mtd: spi-nor: refine Spansion
S25FL512S ID"), and turns out to cause a regression on r8a7791/koelsch.
Dmesg diff before/after:

    -m25p80 spi0.0: s25fl512s (65536 Kbytes)
    -3 fixed-partitions partitions found on MTD device spi0.0
    -Creating 3 MTD partitions on "spi0.0":
    -0x000000000000-0x000000080000 : "loader"
    -0x000000080000-0x000000600000 : "user"
    -0x000000600000-0x000004000000 : "flash"
    +m25p80 spi0.0: unrecognized JEDEC id bytes: 01, 02, 20

As the (old) U-Boot on my Koelsch keeps many module clocks enabled, I
typically merge in my topic/renesas-debug branch, which makes sure all
non-critical module clocks are disabled early during boot, to catch
drivers not properly implementing Runtime PM.

However, it turns out this has some impact on JEDEC ID detection:
  - When module clocks are left untouched, spi_nor_read_id() reads
    0x01:0x02:0x20:0x4d:0x00:0x80.
  - When my debug code has disabled module clocks during early boot,
    The last byte is 0x00.

Before the above commit, only the first 5 bytes were compared, and the
last byte was ignored, thus not causing problems.
When comparing all 6 bytes, detection fails if the last byte is 0x00.

I believe mainline U-Boot for R-Car Gen2 boards doesn't keep the QSPI
module clock enabled, so this commit may breaks those boards.

To be investigated more (e.g. with a logic analyzer)...

> --- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
> @@ -1887,8 +1887,8 @@ static const struct flash_info spi_nor_i
>         { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>         { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>         { "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -       { "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>         { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },

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
