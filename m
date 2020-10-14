Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40437C433E7
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 21:37:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D7521D7F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 21:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1T7jWyr1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcbJEmUZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D7521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SMcWsqkmf8Jf6i0gXih6Zgf3lO3HYYfeYj4nxqKLcBk=; b=1T7jWyr1dvUBQ9wTod8HwLC41
	Sp3j7cTLXmhVjLXEMr3v8OQOE+XDjMc6llr46LGQzLQx2gY8rpNiO/VtfcxlqOZwbJ/Bbw7HXNsSJ
	WhlyiclxeFyEa9NDelbVOXzO9zRYSLk8alirY4d1DSCjvX4OgeQhmlTWznxMMB/CUDGpKdGo2wVpr
	dUMfKIsIJKjGd8eWOdjnKjJ7tYSYkvF8OJ7CpfQIK2YpLpLSDzMZydyuRMKamxiC8BskyunftUEsn
	hG5563OgBnRTRlGUYAM9PwgFIBJdzrB0Gg5HqQUfMUxunZpVoehnxNdeRJnxxEW34dPB3omf5u13j
	GiNdpM0EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSoS7-0007TG-Nc; Wed, 14 Oct 2020 21:36:55 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSoS1-0007SL-9Z
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2020 21:36:50 +0000
Received: by mail-il1-x144.google.com with SMTP id q1so1360405ilt.6
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2020 14:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2/XXBukPQCqhKTWWomwO0cUNWvasvbs9SFlu0Eb0R6g=;
 b=DcbJEmUZWrhxTHvH4HnuPVWxrTn3gEz5+R89XtRs/vHJpsU1j/0WCY9vMEumvZ0/1L
 20LSMfuPqIKOoJOM8EWxxWLaMLfKiJGNxC3JbvmHrYKzclA/PsFi9eTgEmxzjNkAtXUx
 Tvf+X4LHP7W3QJDRgP20FKQmO9F5cQ5iux5S6pETlVHaCnw+ssrMnjb4PicEaTrmoWsw
 MuLSU3LSpjlrqp8GcXYw/ffHC50GaTHHPRawSyoqngqyd6K3cTEQDzddMx4jLS9S7Ull
 bcPFpBcapiFijnr5HfMHhcOhxaAgWtq5Nmp3aQobyUVkIL0XOSzJFWFQuYe5+Ddhv9op
 v+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/XXBukPQCqhKTWWomwO0cUNWvasvbs9SFlu0Eb0R6g=;
 b=R7bSKOXRtTRNycdiSSj4rJ6x6vEk5+UzT622fCWnTvxjzcw2axKe4Yn42iwpafDc7o
 lP7wCqZBdDnd4JkwAyM7tS1KwhaNvwx6yTmv0SWJwb17aT+lEYO4EH2ocAUfcxa/as/U
 PJe3f+ALDeFmWT3kVNdbwybvqMDKyPIktaBTBfpp7/rD7y6pY7GL2VCIkRWW+EfuW5+u
 ctMpkkLcFDFZSWIK0lgs6D5CklZw1C4q3YewFooNa+b7dSrYlO4kzfh0QxM3KJQM+Isl
 W8o44b8Tv3wzwDTILd0UMqyCc21KLq4HQUyo2NE7yqDuxsLNaVtDyyPt5SCQJU+nvrR7
 kI1g==
X-Gm-Message-State: AOAM532N5JIYuErFUUk+0e1zQoUgNVH/bQEpZLIX76COL+7AAmL/NzgZ
 VukwXXHjZRMQeMEM+EHU5OZ0rWzkdm16hhjRRQ8x1Mtp
X-Google-Smtp-Source: ABdhPJxIuHORE0mjkju1bVfCGCLxhX9U/irOTdSuHQw1pqLSN0t9KH/RhnhibZdp+eeIh9FdBGR9YEmIaEUlElWK6HM=
X-Received: by 2002:a92:de0f:: with SMTP id x15mr961581ilm.164.1602711405865; 
 Wed, 14 Oct 2020 14:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
In-Reply-To: <20200827085208.16276-10-miquel.raynal@bootlin.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Wed, 14 Oct 2020 16:36:35 -0500
Message-ID: <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_173649_339975_AA310F4C 
X-CRM114-Status: GOOD (  24.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 3:55 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> The use of "syndrome" placement should not be encoded in the ECC
> engine mode/type.
>
> Create a "placement" field in NAND chip and change all occurrences of
> the NAND_ECC_HW_SYNDROME enumeration to be just NAND_ECC_HW and
> possibly a placement entry like NAND_ECC_PLACEMENT_INTERLEAVED.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  arch/arm/mach-davinci/board-dm355-leopard.c |   3 +-
>  drivers/mtd/nand/raw/cafe_nand.c            |   3 +-
>  drivers/mtd/nand/raw/davinci_nand.c         |   5 +-
>  drivers/mtd/nand/raw/denali.c               |   3 +-
>  drivers/mtd/nand/raw/diskonchip.c           |   3 +-
>  drivers/mtd/nand/raw/lpc32xx_slc.c          |   3 +-
>  drivers/mtd/nand/raw/nand_base.c            | 109 +++++++++++---------
>  drivers/mtd/nand/raw/r852.c                 |   3 +-
>  include/linux/mtd/rawnand.h                 |   6 +-
>  include/linux/platform_data/mtd-davinci.h   |   1 +
>  10 files changed, 81 insertions(+), 58 deletions(-)
>
> diff --git a/arch/arm/mach-davinci/board-dm355-leopard.c b/arch/arm/mach-davinci/board-dm355-leopard.c
> index b9e9950dd300..4c8a592754ac 100644
> --- a/arch/arm/mach-davinci/board-dm355-leopard.c
> +++ b/arch/arm/mach-davinci/board-dm355-leopard.c
> @@ -76,7 +76,8 @@ static struct davinci_nand_pdata davinci_nand_data = {
>         .mask_chipsel           = BIT(14),
>         .parts                  = davinci_nand_partitions,
>         .nr_parts               = ARRAY_SIZE(davinci_nand_partitions),
> -       .ecc_mode               = NAND_ECC_HW_SYNDROME,
> +       .ecc_mode               = NAND_HW_ECC_ENGINE,
> +       .ecc_placement          = NAND_ECC_PLACEMENT_INTERLEAVED,
>         .ecc_bits               = 4,
>         .bbt_options            = NAND_BBT_USE_FLASH,
>  };
> diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> index 92173790f20b..2bf8ab542e38 100644
> --- a/drivers/mtd/nand/raw/cafe_nand.c
> +++ b/drivers/mtd/nand/raw/cafe_nand.c
> @@ -629,7 +629,8 @@ static int cafe_nand_attach_chip(struct nand_chip *chip)
>                 goto out_free_dma;
>         }
>
> -       cafe->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
> +       cafe->nand.ecc.mode = NAND_ECC_HW;
> +       cafe->nand.ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
>         cafe->nand.ecc.size = mtd->writesize;
>         cafe->nand.ecc.bytes = 14;
>         cafe->nand.ecc.strength = 4;
> diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
> index 551515c223bb..3640c7e45e15 100644
> --- a/drivers/mtd/nand/raw/davinci_nand.c
> +++ b/drivers/mtd/nand/raw/davinci_nand.c
> @@ -168,7 +168,7 @@ static int nand_davinci_correct_1bit(struct nand_chip *chip, u_char *dat,
>  /*
>   * 4-bit hardware ECC ... context maintained over entire AEMIF
>   *
> - * This is a syndrome engine, but we avoid NAND_ECC_HW_SYNDROME
> + * This is a syndrome engine, but we avoid NAND_ECC_PLACEMENT_INTERLEAVED
>   * since that forces use of a problematic "infix OOB" layout.
>   * Among other things, it trashes manufacturer bad block markers.
>   * Also, and specific to this hardware, it ECC-protects the "prepad"
> @@ -851,6 +851,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
>
>         /* Use board-specific ECC config */
>         info->chip.ecc.mode     = pdata->ecc_mode;
> +       info->chip.ecc.placement = pdata->ecc_placement;
>
>         spin_lock_irq(&davinci_nand_lock);
>
> @@ -897,7 +898,7 @@ static int nand_davinci_remove(struct platform_device *pdev)
>         int ret;
>
>         spin_lock_irq(&davinci_nand_lock);
> -       if (info->chip.ecc.mode == NAND_ECC_HW_SYNDROME)
> +       if (info->chip.ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
>                 ecc4_busy = false;
>         spin_unlock_irq(&davinci_nand_lock);
>
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 9d99dade95ce..0e54b8a61cf0 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1237,7 +1237,8 @@ int denali_chip_init(struct denali_controller *denali,
>         chip->bbt_options |= NAND_BBT_USE_FLASH;
>         chip->bbt_options |= NAND_BBT_NO_OOB;
>         chip->options |= NAND_NO_SUBPAGE_WRITE;
> -       chip->ecc.mode = NAND_ECC_HW_SYNDROME;
> +       chip->ecc.mode = NAND_ECC_HW;
> +       chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
>         chip->ecc.read_page = denali_read_page;
>         chip->ecc.write_page = denali_write_page;
>         chip->ecc.read_page_raw = denali_read_page_raw;
> diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
> index 43721863a0d8..40360352136b 100644
> --- a/drivers/mtd/nand/raw/diskonchip.c
> +++ b/drivers/mtd/nand/raw/diskonchip.c
> @@ -1456,7 +1456,8 @@ static int __init doc_probe(unsigned long physadr)
>         nand->ecc.calculate     = doc200x_calculate_ecc;
>         nand->ecc.correct       = doc200x_correct_data;
>
> -       nand->ecc.mode          = NAND_ECC_HW_SYNDROME;
> +       nand->ecc.mode          = NAND_ECC_HW;
> +       nand->ecc.placement     = NAND_ECC_PLACEMENT_INTERLEAVED;
>         nand->ecc.size          = 512;
>         nand->ecc.bytes         = 6;
>         nand->ecc.strength      = 2;
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index b151fd000815..ccb189c8e343 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -881,7 +881,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, host);
>
>         /* NAND callbacks for LPC32xx SLC hardware */
> -       chip->ecc.mode = NAND_ECC_HW_SYNDROME;
> +       chip->ecc.mode = NAND_ECC_HW;
> +       chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
>         chip->legacy.read_byte = lpc32xx_nand_read_byte;
>         chip->legacy.read_buf = lpc32xx_nand_read_buf;
>         chip->legacy.write_buf = lpc32xx_nand_write_buf;
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 1d403b439850..5e1f4c1faec0 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5795,61 +5795,74 @@ static int nand_scan_tail(struct nand_chip *chip)
>
>         switch (ecc->mode) {
>         case NAND_ECC_HW:
> -               /* Use standard hwecc read page function? */
> -               if (!ecc->read_page)
> -                       ecc->read_page = nand_read_page_hwecc;
> -               if (!ecc->write_page)
> -                       ecc->write_page = nand_write_page_hwecc;
> -               if (!ecc->read_page_raw)
> -                       ecc->read_page_raw = nand_read_page_raw;
> -               if (!ecc->write_page_raw)
> -                       ecc->write_page_raw = nand_write_page_raw;
> -               if (!ecc->read_oob)
> -                       ecc->read_oob = nand_read_oob_std;
> -               if (!ecc->write_oob)
> -                       ecc->write_oob = nand_write_oob_std;
> -               if (!ecc->read_subpage)
> -                       ecc->read_subpage = nand_read_subpage;
> -               if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
> -                       ecc->write_subpage = nand_write_subpage_hwecc;
> -               fallthrough;
> -       case NAND_ECC_HW_SYNDROME:
> -               if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
> -                   (!ecc->read_page ||
> -                    ecc->read_page == nand_read_page_hwecc ||
> -                    !ecc->write_page ||
> -                    ecc->write_page == nand_write_page_hwecc)) {
> -                       WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
> -                       ret = -EINVAL;
> -                       goto err_nand_manuf_cleanup;
> -               }
> -               /* Use standard syndrome read/write page function? */
> -               if (!ecc->read_page)
> -                       ecc->read_page = nand_read_page_syndrome;
> -               if (!ecc->write_page)
> -                       ecc->write_page = nand_write_page_syndrome;
> -               if (!ecc->read_page_raw)
> -                       ecc->read_page_raw = nand_read_page_raw_syndrome;
> -               if (!ecc->write_page_raw)
> -                       ecc->write_page_raw = nand_write_page_raw_syndrome;
> -               if (!ecc->read_oob)
> -                       ecc->read_oob = nand_read_oob_syndrome;
> -               if (!ecc->write_oob)
> -                       ecc->write_oob = nand_write_oob_syndrome;
> +               switch (ecc->placement) {
> +               case NAND_ECC_PLACEMENT_UNKNOWN:
> +               case NAND_ECC_PLACEMENT_OOB:
> +                       /* Use standard hwecc read page function? */
> +                       if (!ecc->read_page)
> +                               ecc->read_page = nand_read_page_hwecc;
> +                       if (!ecc->write_page)
> +                               ecc->write_page = nand_write_page_hwecc;
> +                       if (!ecc->read_page_raw)
> +                               ecc->read_page_raw = nand_read_page_raw;
> +                       if (!ecc->write_page_raw)
> +                               ecc->write_page_raw = nand_write_page_raw;
> +                       if (!ecc->read_oob)
> +                               ecc->read_oob = nand_read_oob_std;
> +                       if (!ecc->write_oob)
> +                               ecc->write_oob = nand_write_oob_std;
> +                       if (!ecc->read_subpage)
> +                               ecc->read_subpage = nand_read_subpage;
> +                       if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
> +                               ecc->write_subpage = nand_write_subpage_hwecc;
> +                       fallthrough;
>
> -               if (mtd->writesize >= ecc->size) {
> -                       if (!ecc->strength) {
> -                               WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
> +               case NAND_ECC_PLACEMENT_INTERLEAVED:
> +                       if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
> +                           (!ecc->read_page ||
> +                            ecc->read_page == nand_read_page_hwecc ||
> +                            !ecc->write_page ||
> +                            ecc->write_page == nand_write_page_hwecc)) {
> +                               WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
>                                 ret = -EINVAL;
>                                 goto err_nand_manuf_cleanup;
>                         }
> +                       /* Use standard syndrome read/write page function? */
> +                       if (!ecc->read_page)
> +                               ecc->read_page = nand_read_page_syndrome;
> +                       if (!ecc->write_page)
> +                               ecc->write_page = nand_write_page_syndrome;
> +                       if (!ecc->read_page_raw)
> +                               ecc->read_page_raw = nand_read_page_raw_syndrome;
> +                       if (!ecc->write_page_raw)
> +                               ecc->write_page_raw = nand_write_page_raw_syndrome;
> +                       if (!ecc->read_oob)
> +                               ecc->read_oob = nand_read_oob_syndrome;
> +                       if (!ecc->write_oob)
> +                               ecc->write_oob = nand_write_oob_syndrome;
> +
> +                       if (mtd->writesize >= ecc->size) {
> +                               if (!ecc->strength) {
> +                                       WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
> +                                       ret = -EINVAL;
> +                                       goto err_nand_manuf_cleanup;
> +                               }
> +                               break;

Hi Miquel, the changes to the nested switch statement make the logic
of this break wrong.

> +                       }
> +                       pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
> +                               ecc->size, mtd->writesize);
> +                       ecc->mode = NAND_ECC_SOFT;
> +                       ecc->algo = NAND_ECC_ALGO_HAMMING;
>                         break;
> +
> +               default:
> +                       pr_warn("Invalid NAND_ECC_PLACEMENT %d\n",
> +                               ecc->placement);
> +                       ret = -EINVAL;
> +                       goto err_nand_manuf_cleanup;
>                 }
> -               pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
> -                       ecc->size, mtd->writesize);
> -               ecc->mode = NAND_ECC_SOFT;
> -               ecc->algo = NAND_ECC_ALGO_HAMMING;
>                 fallthrough;
> +
>         case NAND_ECC_SOFT:
>                 ret = nand_set_ecc_soft_ops(chip);
>                 if (ret) {
> diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
> index f865e3a47b01..f0988cda4479 100644
> --- a/drivers/mtd/nand/raw/r852.c
> +++ b/drivers/mtd/nand/raw/r852.c
> @@ -859,7 +859,8 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
>         chip->legacy.write_buf = r852_write_buf;
>
>         /* ecc */
> -       chip->ecc.mode = NAND_ECC_HW_SYNDROME;
> +       chip->ecc.mode = NAND_ECC_HW;
> +       chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
>         chip->ecc.size = R852_DMA_LEN;
>         chip->ecc.bytes = SM_OOB_SIZE;
>         chip->ecc.strength = 2;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 10bbfbf4ad7f..cfd75a12f802 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -304,6 +304,7 @@ static const struct nand_ecc_caps __name = {                        \
>  /**
>   * struct nand_ecc_ctrl - Control structure for ECC
>   * @mode:      ECC mode
> + * @placement: OOB bytes placement
>   * @algo:      ECC algorithm
>   * @steps:     number of ECC steps per page
>   * @size:      data bytes per ECC step
> @@ -331,7 +332,7 @@ static const struct nand_ecc_caps __name = {                        \
>   *                     controller and always return contiguous in-band and
>   *                     out-of-band data even if they're not stored
>   *                     contiguously on the NAND chip (e.g.
> - *                     NAND_ECC_HW_SYNDROME interleaves in-band and
> + *                     NAND_ECC_PLACEMENT_INTERLEAVED interleaves in-band and
>   *                     out-of-band data).
>   * @write_page_raw:    function to write a raw page without ECC. This function
>   *                     should hide the specific layout used by the ECC
> @@ -339,7 +340,7 @@ static const struct nand_ecc_caps __name = {                        \
>   *                     in-band and out-of-band data. ECC controller is
>   *                     responsible for doing the appropriate transformations
>   *                     to adapt to its specific layout (e.g.
> - *                     NAND_ECC_HW_SYNDROME interleaves in-band and
> + *                     NAND_ECC_PLACEMENT_INTERLEAVED interleaves in-band and
>   *                     out-of-band data).
>   * @read_page: function to read a page according to the ECC generator
>   *             requirements; returns maximum number of bitflips corrected in
> @@ -356,6 +357,7 @@ static const struct nand_ecc_caps __name = {                        \
>   */
>  struct nand_ecc_ctrl {
>         enum nand_ecc_mode mode;
> +       enum nand_ecc_placement placement;
>         enum nand_ecc_algo algo;
>         int steps;
>         int size;
> diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
> index 03e92c71b3fa..6e2b252a4ce6 100644
> --- a/include/linux/platform_data/mtd-davinci.h
> +++ b/include/linux/platform_data/mtd-davinci.h
> @@ -69,6 +69,7 @@ struct davinci_nand_pdata {           /* platform_data */
>          * using it with large page chips.
>          */
>         enum nand_ecc_mode      ecc_mode;
> +       enum nand_ecc_placement ecc_placement;
>         u8                      ecc_bits;
>
>         /* e.g. NAND_BUSWIDTH_16 */
> --
> 2.20.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
