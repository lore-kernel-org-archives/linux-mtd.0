Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59CBC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:15:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4FC120661
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ecHjtk13";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="y/sZzdyL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4FC120661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYA89uOEusWjQQVQsJGLdKyr+8zD0hEvF+wSLme2UBY=; b=ecHjtk13JP3xj2
	/vobjX4eOt9ng9HQdPSZsUZ/6qnoYfuGJ+RZDcXU1uZ9c+W+8Lwhg05TOoRLIfwgbNFWvxTMVksvh
	akGJYxIVWHkrO+8NmXXeZu+O+uCM8GBR6ga7jttcnhjStipss/wLzua+DK/FcsuemeqRzZlU3t6Xk
	0p3PdSVx+AzGj/5jbZHRKo8Mh/422jy4ijsaW1/8laknahN4TDlMl9yAq8VLpvXm+VrEIsTOgORVe
	cHRZJXqWk9dJaynzhNZMJigguI1DE+7NrzC7sYdKiryGWee2ZAItC0b0myCcVqglgqfI8csY7WwR7
	a6mmcRZXcY0JcDyMxy8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipaT4-00021b-TT; Thu, 09 Jan 2020 16:15:30 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipaL2-0000HI-Tg
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:07:17 +0000
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 009G6v5I031719
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 01:06:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 009G6v5I031719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1578586018;
 bh=k8jTaE2xbIiQDd54sogLUlEULj1XHwQrpsjDqVBmQwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=y/sZzdyLFOtYw9c2wgBtK0rqoD6/W9YIMcpdWwNH0yGvmshd8DNRo5usCFh+pFM/n
 OoLA7Ai19lpymNvghMShWq/KVApFbb34/aV5V0QNPQuiBOA4lRPHGmn2OIMtDeEKXm
 e8+ashjvf/7R3oslEoIgNbFs0wo+doqk1iEJek7Mpaw2y1HKy+1eSLxHvCNtckwCWV
 SZkHZ4OdRLoWXDr5xJRpGyUjf5RBpxEPbrjJxbPBMPSUXh1HZMceWmm0sTUgiSQQ6z
 IdHeS9sTh/+ySyWDsCaivtnE2e9faIW+ZljTdln5N654EFIiknyZ35qn3axZIY68Dd
 K0A40I3yewomg==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id i4so2102646vkc.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2020 08:06:57 -0800 (PST)
X-Gm-Message-State: APjAAAVV6Q3J4O2vvJ+NlKXOkBZx+yv3Om6hVXdfIwEeQlNwRyY6hSIM
 ZaEUFBPOi26TV+GCRkUY+rLzwMynaJIUdRwJ1ao=
X-Google-Smtp-Source: APXvYqxKxoT9MZW3mB7c/bKDieal6w3Ikp1C6sLd1g5RqvgVjmVhz7WjTd/weC+kDtVEKBo9rd/H2/5vBTbTZpRlHLA=
X-Received: by 2002:a1f:18b:: with SMTP id 133mr7081862vkb.73.1578586016315;
 Thu, 09 Jan 2020 08:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20191220093900.1855751-1-marex@denx.de>
In-Reply-To: <20191220093900.1855751-1-marex@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jan 2020 01:06:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkwtNsRrmq=9Cv+hgM2b68m7_2sV1mnrLuYuZ6H4j=vA@mail.gmail.com>
Message-ID: <CAK7LNARkwtNsRrmq=9Cv+hgM2b68m7_2sV1mnrLuYuZ6H4j=vA@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_080713_211621_85824D51 
X-CRM114-Status: GOOD (  25.49  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 6:39 PM Marek Vasut <marex@denx.de> wrote:
>
> The SPARE_AREA_SKIP_BYTES register is reset when the controller reset
> signal is toggled. Yet, this register must be configured to match the
> content of the NAND OOB area. The current default value is always set
> to 8 and is programmed into the hardware in case the hardware was not
> programmed before (e.g. in a bootloader) with a different value. This
> however does not work when the block is reset properly by Linux.
>
> On Altera SoCFPGA CycloneV, ArriaV and Arria10, which are the SoCFPGA
> platforms which support booting from NAND, the SPARE_AREA_SKIP_BYTES
> value must be set to 2. On Socionext Uniphier, the value is 8. This
> patch adds support for preconfiguring the default value and handles
> the special SoCFPGA case by setting the default to 2 on all SoCFPGA
> platforms, while retaining the original behavior and default value of
> 8 on all the other platforms.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> To: linux-mtd@lists.infradead.org
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> V2: Move denali->oob_skip_bytes = data->oob_skip_bytes; right after
>     of_device_get_match_data()


FYI.

This patch was rebased to avoid a conflict:
http://patchwork.ozlabs.org/patch/1214018/

My Ack is in v3.


I solved a merge conflict, and bundled in a series:
http://patchwork.ozlabs.org/project/linux-mtd/list/?series=149821




> ---
>  drivers/mtd/nand/raw/denali.c    | 13 ++++++++++---
>  drivers/mtd/nand/raw/denali_dt.c |  5 +++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 3102ddbd8abdb..b6c463d021677 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
>
>         /*
>          * Set how many bytes should be skipped before writing data in OOB.
> +        * If a non-zero value has already been configured, update it in HW.
>          * If a non-zero value has already been set (by firmware or something),
>          * just use it. Otherwise, set the driver's default.
>          */
> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> -       if (!denali->oob_skip_bytes) {
> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> +       if (denali->oob_skip_bytes) {
>                 iowrite32(denali->oob_skip_bytes,
>                           denali->reg + SPARE_AREA_SKIP_BYTES);
> +       } else {
> +               denali->oob_skip_bytes =
> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> +               if (!denali->oob_skip_bytes) {
> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> +                       iowrite32(denali->oob_skip_bytes,
> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
> +               }
>         }
>
>         iowrite32(0, denali->reg + TRANSFER_SPARE_REG);
> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
> index 8b779a899dcf4..443f9c1f6854d 100644
> --- a/drivers/mtd/nand/raw/denali_dt.c
> +++ b/drivers/mtd/nand/raw/denali_dt.c
> @@ -27,6 +27,7 @@ struct denali_dt {
>  struct denali_dt_data {
>         unsigned int revision;
>         unsigned int caps;
> +       unsigned int oob_skip_bytes;
>         const struct nand_ecc_caps *ecc_caps;
>  };
>
> @@ -34,6 +35,7 @@ NAND_ECC_CAPS_SINGLE(denali_socfpga_ecc_caps, denali_calc_ecc_bytes,
>                      512, 8, 15);
>  static const struct denali_dt_data denali_socfpga_data = {
>         .caps = DENALI_CAP_HW_ECC_FIXUP,
> +       .oob_skip_bytes = 2,
>         .ecc_caps = &denali_socfpga_ecc_caps,
>  };
>
> @@ -42,6 +44,7 @@ NAND_ECC_CAPS_SINGLE(denali_uniphier_v5a_ecc_caps, denali_calc_ecc_bytes,
>  static const struct denali_dt_data denali_uniphier_v5a_data = {
>         .caps = DENALI_CAP_HW_ECC_FIXUP |
>                 DENALI_CAP_DMA_64BIT,
> +       .oob_skip_bytes = 8,
>         .ecc_caps = &denali_uniphier_v5a_ecc_caps,
>  };
>
> @@ -51,6 +54,7 @@ static const struct denali_dt_data denali_uniphier_v5b_data = {
>         .revision = 0x0501,
>         .caps = DENALI_CAP_HW_ECC_FIXUP |
>                 DENALI_CAP_DMA_64BIT,
> +       .oob_skip_bytes = 8,
>         .ecc_caps = &denali_uniphier_v5b_ecc_caps,
>  };
>
> @@ -122,6 +126,7 @@ static int denali_dt_probe(struct platform_device *pdev)
>                 denali->revision = data->revision;
>                 denali->caps = data->caps;
>                 denali->ecc_caps = data->ecc_caps;
> +               denali->oob_skip_bytes = data->oob_skip_bytes;
>         }
>
>         denali->dev = dev;
> --
> 2.24.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
