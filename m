Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BC6C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 12:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6997920578
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 12:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kvc7KUpP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6997920578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuOsQbmyRdFpFB0mlKAmCzqYqWlv323TwO//1rbhyXY=; b=kvc7KUpP170uC+
	I+WSYbExIC2Cqrin1RIxDb44JiOnxu9Auz31gCEgAz/eEr7unEbmM386BK1jE6Wjsoi55gk4QLeeI
	cZu7vgPl6ChfuTIvqOvh9FTXR7TYrigUrtMfSSOcwwq5yMoeIhDxIy4bhZzvQkAI2O/V3s5POHpY4
	puucROxazMYoQytRdUtQe1vWFAswhyDT2Uy2SRV0EdnS6OHM3tFqXhqTbgrIuQmdebTwJUKTXcugL
	qmhUt7SznsTXooo0zd/mljNPcZPxPQ8eP+YsMPR0TloCUYjexZ7ucjA6J2f25HyV4dAksFaarpB63
	Pb3YrcapszHJTxEUkCmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNzas-00030b-Dm; Tue, 07 May 2019 12:53:14 +0000
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNzap-000304-93
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 12:53:13 +0000
Received: by mail-vs1-f67.google.com with SMTP id e2so10256580vsc.13
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 05:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ksDxWT8TpcQLcxcJbwsbzpbA+5sHWxlau7ieo4SeWo8=;
 b=BD2wrSpH18NNPGRc3uxKziHe+pFmrVcAkNzwr7GbSF+EJky8FjXUHgKH6lIoq5ZGzi
 SXck2EMfeOZkKM/Gi5ZD34rBmXI+W0qwcw8Yw5lFnZsQ1k/EAlWSRZj+5QGtMx8emvtH
 LotacQaxE30IdeEBNZ01ZhOl0P7zZ3g3O98/MOhHae4sNhfkGgUZME/2Qi8jfrC4fdRK
 MI3InBKIDTV95nemBE912q88RQDB7grpRg2Jy1+ugAzZH4/QlmFJ0BmTdN6FYx1gzzlA
 Uxv9g4OeU72wzM+3muPTWX78XoWZSqJAPUC0LDiEqtuPQrgvNowGyZ8urv7aJv3buL1g
 kQMg==
X-Gm-Message-State: APjAAAW7gRsA4JzVauxFxRhh8+ouCRmQZCSugiLH/gQqxfabXQJ0Ruf7
 v6pGHM7MC16kGbpUeaNLkiM9XcEF+WPTijvy/to=
X-Google-Smtp-Source: APXvYqwvomkoI4cacmn/V2CCF0iEOqtns3XDrT0Z8NRMXceiJ/82GKiFOc8oTWh+rCZwt8g5GefGOORrKHKrN1e12wA=
X-Received: by 2002:a67:e407:: with SMTP id d7mr3471798vsf.166.1557233588729; 
 Tue, 07 May 2019 05:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
In-Reply-To: <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 14:52:56 +0200
Message-ID: <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Jonas Bonn <jonas@norrbonn.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_055311_319409_9CA681BB 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jonas,

On Tue, May 7, 2019 at 1:14 PM Jonas Bonn <jonas@norrbonn.se> wrote:
> On 07/05/2019 12:50, Geert Uytterhoeven wrote:
> > On Tue, May 7, 2019 at 12:42 PM <Tudor.Ambarus@microchip.com> wrote:
> >> On 05/07/2019 12:53 PM, Geert Uytterhoeven wrote:
> >>> On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
> >>>> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
> >>>> Tested and verified on a Cypress s25fl512s.
> >>>>
> >>>> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> >>>
> >>> This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
> >>> locking") in mtd/next.
> >>>
> >>>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>>> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
> >>>>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
> >>>>          { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>>> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>>> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> >>>> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >>>> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> >>>
> >>> Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
> >>> probing.
> >>>
> >>> Before/after:
> >>>
> >>>      -m25p80 spi0.0: s25fl512s (65536 Kbytes)
> >>>      -3 fixed-partitions partitions found on MTD device spi0.0
> >>>      -Creating 3 MTD partitions on "spi0.0":
> >>>      -0x000000000000-0x000000080000 : "loader"
> >>>      -0x000000080000-0x000000600000 : "user"
> >>>      -0x000000600000-0x000004000000 : "flash"
> >>>      +m25p80 spi0.0: Erase Error occurred
> >>>      +m25p80 spi0.0: Erase Error occurred
> >>>      +m25p80 spi0.0: timeout while writing configuration register
> >>>      +m25p80 spi0.0: quad mode not supported
> >>>      +m25p80: probe of spi0.0 failed with error -5
> >>>
>
> In drivers/mtd/spi-nor/spi-nor.c you have:
>
> static int spi_nor_init(struct spi_nor *nor)
> {
>          int err;
>
>          /*
>           * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>           * with the software protection bits set
>           */
>          if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
>              JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
>              JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>              nor->info->flags & SPI_NOR_HAS_LOCK) {
>                  write_enable(nor);

With more debug prints:

    m25p80 spi0.0: spi_nor_init:3925: write_enable() returned 0

>                  write_sr(nor, 0);

    m25p80 spi0.0: spi_nor_init:3927: write_sr() returned 0

>                  spi_nor_wait_till_ready(nor);

    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
                                     ...
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
    m25p80 spi0.0: Erase Error occurred
    m25p80 spi0.0: spi_nor_init:3929: spi_nor_wait_till_ready() returned -5

>          }
>
>          if (nor->quad_enable) {
>                  err = nor->quad_enable(nor);

    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
    m25p80 spi0.0: Erase Error occurred
    m25p80 spi0.0: timeout while writing configuration register
    m25p80 spi0.0: spi_nor_init:3937: spansion_quad_enable() returned -5

>                  if (err) {
>                          dev_err(nor->dev, "quad mode not supported\n");
>                          return err;
>                  }
>          }
>
> This is the only meaningful thing that I can see may have changed with
> this flag.  We now have an additional write_enable before quad_enable.
> What happens if you swap those two blocks above so that quad_enable is
> called first?

With the two blocks swapped:

    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x0
    m25p80 spi0.0: spi_nor_init:3919: spansion_quad_enable() returned 0
    m25p80 spi0.0: spi_nor_init:3937: write_enable() returned 0
    m25p80 spi0.0: spi_nor_init:3939: write_sr() returned 0
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
                                                                  ...
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
    m25p80 spi0.0: Erase Error occurred
    m25p80 spi0.0: spi_nor_init:3941: spi_nor_wait_till_ready() returned -5
    m25p80 spi0.0: s25fl512s (65536 Kbytes)
    3 fixed-partitions partitions found on MTD device spi0.0
    Creating 3 MTD partitions on "spi0.0":
    0x000000000000-0x000000080000 : "loader"
    0x000000080000-0x000000600000 : "user"
    0x000000600000-0x000004000000 : "flash"

Note that spi_nor_wait_till_ready() still fails.

While the device (which contains the boot loader) now appears to be
detected fine, reading returns bogus repetitive data, for all partitions:

    # hd /dev/mtd0 | head
    00000000  33 33 33 33 33 33 33 33  33 33 3b bb ff ff ff ff
|3333333333;.....|
    00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
    *
    00001000  33 33 33 33 33 33 33 33  33 33 3b bb ff ff ff ff
|3333333333;.....|
    00001010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
    *

If I remove the call to "write_sr(nor, 0)", everything works as
before, regardless
of swapping the blocks.

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
