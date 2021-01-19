Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549A3C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 16:07:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084E021D1B
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 16:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 084E021D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dXuMMJ/d8t4AsHWVeYh06utmkuP1XTNUCdPtze75cpE=; b=pf0slXXYpd7kGR3zwBHUUz+pB
	xUJ+xXMGLhbgfOkXdhlvjBonm2HZuK9zvys5wMC2zjjmKTUuaBTjaax8GwvsJJ7tk4V/AhSkWtP6K
	8A51dLvsxZLeZq6YEbWX420jqn8jawQovgSaDyuiRlYfkrlIhqXdlAAgQNpiMIKT+O0LUsRivTSdE
	C9T8AmPuPJT9+PvxrtHNGxrUmXWFDAFPZKU13tBcdFZV7WsybM++R5veiw5ciokN/u5R3WMTSmWC2
	uO6wKs35Ot5sGv8pUpMDxx5WrQKiwSQlCACOf2wUdlQhqGIMPDAws8G+2M3Vl+jhjBmdvY7c6HtAp
	n/hd6DaiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1tWH-0007hN-Bl; Tue, 19 Jan 2021 16:06:13 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tWF-0007gd-At
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 16:06:12 +0000
Received: by mail-io1-xd2e.google.com with SMTP id e22so16866831iog.6
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jan 2021 08:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bAg2f8YRZ7e61OhdamQRh5GFioQ2CPSlZRXbBITfyAU=;
 b=uXQVhL6Fge29XPc0zvbmdtq2oqbMHcBJdb/r3NRO2ddTdUi6gm5VzupP8ySr7zMm7I
 X5actPltoIal42TeavczBZuISJ7UT4/NJNRufW/TsqomHWtiA8MuWHUODIsrThiNHW+0
 v1kWviAcUxQTSfnFtMNHm4cWNuVnW3cVkpyAom1DBd6m+9K4M5KZZeE21dbuFoRKEtc+
 RAIWcUQF3MuWNXsbw1rrXVMP0cprfGkzyC/is40GrZAvifBoa75KviEZZpCPLP3drP+z
 0e9v36UV1hNS9cKjNL/Kzgqe63FS4bnB75tcjXpxegshs1rSAgVOtkZX671hkk59NtLU
 8C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bAg2f8YRZ7e61OhdamQRh5GFioQ2CPSlZRXbBITfyAU=;
 b=bxMpiU6KsNgp3H6JIcGgluFe0zJszzlXjW+vGcfYGpDeeXXtB9hzxBCF01gRwFImum
 y8zHkD7Duliyl8zcMvXSRPeefGWJ/zYL5l2YxevDQkwi2ixPOh1nuGsPnlpb5TLXJCIP
 E8g19SUax0zTOKbDDyATSqg3pXMCVPdOCBYkckoLOEWesgiCC9xK6agKM7L/+xpoaEMa
 h1VK87cMRhSjX2ghDiBQA5pG84R4ckfn97ApWIZGmxcAwVOHP/GbjalpIb1zGrOiOPL+
 mrGVGXBYpBYwIbIjmvmtARAYxURTkNq0QpUCjnZ1thoxmQcGccvgY+7LJhaCde7ozUeh
 QJMw==
X-Gm-Message-State: AOAM5336HaV5sBwbN20PkucgFMe++O4EzoIkXk98C8H6LoKaN9MI2XWe
 npl7trzIQfUx5rHHyA8Ryb39lA59/wYkhkxr6XE5kIJ8i4lwdw==
X-Google-Smtp-Source: ABdhPJw2rjriV62rQ9/qEok5q0VLRDLEJ36sHJd1CmslJel8jdPyHALs9CP9jLcOC7jK/sC3P3GtiWM4V6wWKi2aryg=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr4007952ilv.214.1611072369244; 
 Tue, 19 Jan 2021 08:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20210119155510.5655-1-miquel.raynal@bootlin.com>
In-Reply-To: <20210119155510.5655-1-miquel.raynal@bootlin.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Jan 2021 10:05:58 -0600
Message-ID: <CAHCN7xKyZronVcCUXtaaC76NpYX5dLRoMXKpTB6BfYd2QeMrGw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: omap: Use BCH private fields in the
 specific OOB layout
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_110611_392780_7886C921 
X-CRM114-Status: GOOD (  30.17  )
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
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 19, 2021 at 9:55 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> The OMAP driver may leverage software BCH logic to locate errors while
> using its own hardware to detect the presence of errors. This is
> achieved with a "mixed" mode which initializes manually the software
> BCH internal logic while providing its own OOB layout.
>
> The issue here comes from the fact that the BCH driver has been
> updated to only use generic NAND objects, and no longer depend on raw
> NAND structures as it is usable from SPI-NAND as well. However, at the
> end of the BCH context initialization, the driver checks the validity
> of the OOB layout. At this stage, the raw NAND fields have not been
> populated yet while being used by the layout helpers, leading to an
> invalid layout.
>
> The chosen solution here is to include the BCH structure definition
> and to refer to the BCH fields directly (de-referenced as a const
> pointer here) to know as early as possible the number of steps and ECC
> bytes which have been chosen.
>
> Note: I don't know which commit exactly triggered the error, but the
> entire migration to a generic BCH driver got merged in one go, so this
> should not be a problem for stable backports.
>
Thanks for addressing that.

Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit-28.dts
> Reported-by: Adam Ford <aford173@gmail.com>
> Fixes: 80fe603160a4 ("mtd: nand: ecc-bch: Stop using raw NAND structures")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/omap2.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index fbb9955f2467..2c3e65cb68f3 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -15,6 +15,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/sched.h>
>  #include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand-ecc-sw-bch.h>
>  #include <linux/mtd/rawnand.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/omap-dma.h>
> @@ -1866,18 +1867,19 @@ static const struct mtd_ooblayout_ops omap_ooblayout_ops = {
>  static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
>                                  struct mtd_oob_region *oobregion)
>  {
> -       struct nand_chip *chip = mtd_to_nand(mtd);
> +       struct nand_device *nand = mtd_to_nanddev(mtd);
> +       const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
>         int off = BADBLOCK_MARKER_LENGTH;
>
> -       if (section >= chip->ecc.steps)
> +       if (section >= engine_conf->nsteps)
>                 return -ERANGE;
>
>         /*
>          * When SW correction is employed, one OMAP specific marker byte is
>          * reserved after each ECC step.
>          */
> -       oobregion->offset = off + (section * (chip->ecc.bytes + 1));
> -       oobregion->length = chip->ecc.bytes;
> +       oobregion->offset = off + (section * (engine_conf->code_size + 1));
> +       oobregion->length = engine_conf->code_size;
>
>         return 0;
>  }
> @@ -1885,7 +1887,8 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
>  static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
>                                   struct mtd_oob_region *oobregion)
>  {
> -       struct nand_chip *chip = mtd_to_nand(mtd);
> +       struct nand_device *nand = mtd_to_nanddev(mtd);
> +       const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
>         int off = BADBLOCK_MARKER_LENGTH;
>
>         if (section)
> @@ -1895,7 +1898,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
>          * When SW correction is employed, one OMAP specific marker byte is
>          * reserved after each ECC step.
>          */
> -       off += ((chip->ecc.bytes + 1) * chip->ecc.steps);
> +       off += ((engine_conf->code_size + 1) * engine_conf->nsteps);
>         if (off >= mtd->oobsize)
>                 return -ERANGE;
>
> --
> 2.20.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
