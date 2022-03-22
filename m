Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE36C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiwF/AGs0ZQfRCjEZx9aYnqSS0YPJQZ7NF1ecSh/HJ8=; b=B8XZKk3ysepzDY
	LNf2MZSk4MEOp7+1Qa6kSiJUDAuDggWFLds1KLELQPLdtEd+jkFUL+DlqRyPkszIdDO5eqW7z/0DL
	qR8F0nF9nOpaKV40voeZ49BblwX/9WhrcW+og2iY9M+1L79rUSVQrz/ytzX7KcEc4xje9wrIB3zGZ
	WsbSKLy7RotnkM0Na+xU189/qlPLDWAj6ti+2mNYpn5bvEkbMNSzktwK0HC0B149fKy7U1ZVyzsaW
	VdXw+Krhm1pY6ub1u0+t4Ru1RdBAtHQ+SeR9DnLJ57gtdwGa2PKAk1ASKxQAttvQbvpRNF1b9JL2Y
	DXqo4ma16V3F9bZtmMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWkHT-00C2Cs-3L; Tue, 22 Mar 2022 19:34:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWkHP-00C2CG-Kk
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 19:34:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so2576009pjh.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2022 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f7fMMyIHvQ5lcxZE+vlJRdHZEJAzCIsS7W8urvPZEaU=;
 b=ggAZFWPGwV7VPvXYDrlugDlRz+NIEfYH60G3Hii4AnYGEVzI0+ys4s2dbhEoKBbUav
 vgoOnYwwhUbTBHID8lV75MpUDBeo7gtrSEndXyqeyAz+q9EX3TTdsh8i4LSsvmDKPrJW
 HGRlYcDbXwp0HZH15OA38VA437AGJ57aBkJkR1RuOvZwSeAzlFfAm312Tj+J3hPsY1zn
 x5/ez2VU596nnu0zcwLDXdqCLufYdKMVFlvpiXgWe9KhM7K+WuPhA1bLhNnIfCDtrzgA
 mcd2MJtjQXz2BZgQfsBRWf1o86JG7Cc3uKjDfMGSrEWExPPUWUEcpD9Qr75fIOYNyfMc
 XTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f7fMMyIHvQ5lcxZE+vlJRdHZEJAzCIsS7W8urvPZEaU=;
 b=Zk+qBNsoSvWpCkKET86mEu6EBd+gJXHjnwgCYqOIx/CuhXWR1ZPZyVphIgVweZJ5gA
 Lzwvi9UNveRA/fC9ieAuasJ3t5u6qPbGmgMgxxSe3rrSrlsZup5eO3KKfrxEkjdOgzGE
 jkktdlo3+M3x68pOkiuAsmOzqKnSGU+FoypWWYxueMQ8WiO/RFoKUIQ6RrjmG/oVfvwA
 hgJnwG1gfKovvSex+7eN4VsgWmNXcCm2PrxBF7plArkGzbhV0H7G/FI0aGRi0Eb+sxyR
 Su/FwjnmOmgM9GrUa9yJnKQQkMX5dW4QC41skFMwGW1Z2gdT2pXbRcwRExGcNenRf6fc
 j+bg==
X-Gm-Message-State: AOAM533JZpjfB+AN4f6AxuCz+Sy0iUm3TmMtiVf/IGVkdaK6nW0izK+Q
 kGYs5xnQqxCcNe40pCxsqxEGh9g/6Gt0Kq1Z4Eso4Q==
X-Google-Smtp-Source: ABdhPJx+2JCSnfGzC3Oq95GdHHojRbdFS9zfhq0sTg3lPYXwih3oCVXDhCvIEB8wANYSjrX/DRkU91ED9U4wxzScU+4=
X-Received: by 2002:a17:90a:1db:b0:1bf:711d:267a with SMTP id
 27-20020a17090a01db00b001bf711d267amr6924857pjd.155.1647977694603; Tue, 22
 Mar 2022 12:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220321201834.28546-1-han.xu@nxp.com>
In-Reply-To: <20220321201834.28546-1-han.xu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 22 Mar 2022 12:34:43 -0700
Message-ID: <CAJ+vNU3REM8k1aKRKE8yDRMAWnCqFBYVvPSSWV4HQwOeHKz-8w@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: fix the gpmi bch setting unalignment issue
To: Han Xu <han.xu@nxp.com>
Cc: Stefano Babic <sbabic@denx.de>, Sean Nyekjaer <sean@geanix.com>, 
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, u-boot <u-boot@lists.denx.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 dl-uboot-imx <uboot-imx@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_123455_781660_E36C3B46 
X-CRM114-Status: GOOD (  33.94  )
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

On Mon, Mar 21, 2022 at 1:37 PM Han Xu <han.xu@nxp.com> wrote:
>
> The code change fixed the kernel gpmi bch setting not aligned with
> u-boot settings issue. It still uses the legacy bch geometry as the
> default option. If users need to choose the minimum ecc strength that
> NAND chips required, it can be enabled by either adding DT flag
> "fsl,use-minimum-ecc" or CONFIG_NAND_MXS_USE_MINIMUM_ECC in configs.
>
> Fixes: 51cdf83eea mtd: gpmi: provide the option to use legacy bch geometry
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/raw/mxs_nand.c | 71 ++++++++++++++++++++++++++++-----
>  1 file changed, 62 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/mxs_nand.c b/drivers/mtd/nand/raw/mxs_nand.c
> index 748056a43e..ee5d7fde9c 100644
> --- a/drivers/mtd/nand/raw/mxs_nand.c
> +++ b/drivers/mtd/nand/raw/mxs_nand.c
> @@ -195,6 +195,7 @@ static inline int mxs_nand_legacy_calc_ecc_layout(struct bch_geometry *geo,
>         struct nand_chip *chip = mtd_to_nand(mtd);
>         struct mxs_nand_info *nand_info = nand_get_controller_data(chip);
>         unsigned int block_mark_bit_offset;
> +       int corr, ds_corr;
>
>         /* The default for the length of Galois Field. */
>         geo->gf_len = 13;
> @@ -225,6 +226,17 @@ static inline int mxs_nand_legacy_calc_ecc_layout(struct bch_geometry *geo,
>         geo->ecc_strength = min(round_down(geo->ecc_strength, 2),
>                                 nand_info->max_ecc_strength_supported);
>
> +       /* check ecc strength, same as nand_ecc_is_strong_enough() did*/
> +       if (chip->ecc_step_ds) {
> +               corr = mtd->writesize * geo->ecc_strength /
> +                      geo->ecc_chunkn_size;
> +               ds_corr = mtd->writesize * chip->ecc_strength_ds /
> +                      chip->ecc_step_ds;
> +               if (corr < ds_corr ||
> +                   geo->ecc_strength < chip->ecc_strength_ds)
> +                       return -EINVAL;
> +       }
> +
>         block_mark_bit_offset = mtd->writesize * 8 -
>                 (geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - 1)
>                                 + MXS_NAND_METADATA_SIZE * 8);
> @@ -1111,6 +1123,7 @@ static int mxs_nand_set_geometry(struct mtd_info *mtd, struct bch_geometry *geo)
>         struct nand_chip *chip = mtd_to_nand(mtd);
>         struct nand_chip *nand = mtd_to_nand(mtd);
>         struct mxs_nand_info *nand_info = nand_get_controller_data(nand);
> +       int err;
>
>         if (chip->ecc_strength_ds > nand_info->max_ecc_strength_supported) {
>                 printf("unsupported NAND chip, minimum ecc required %d\n"
> @@ -1118,19 +1131,57 @@ static int mxs_nand_set_geometry(struct mtd_info *mtd, struct bch_geometry *geo)
>                 return -EINVAL;
>         }
>
> -       if ((!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0) &&
> -            mtd->oobsize < 1024) || nand_info->legacy_bch_geometry) {
> -               dev_warn(mtd->dev, "use legacy bch geometry\n");
> -               return mxs_nand_legacy_calc_ecc_layout(geo, mtd);
> +       /* use the legacy bch setting by default */
> +       if ((!nand_info->use_minimum_ecc && mtd->oobsize < 1024) ||
> +           !(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0)) {
> +               dev_dbg(mtd->dev, "use legacy bch geometry\n");
> +               err = mxs_nand_legacy_calc_ecc_layout(geo, mtd);
> +               if (!err)
> +                       return 0;
>         }
>
> -       if (mtd->oobsize > 1024 || chip->ecc_step_ds < mtd->oobsize)
> -               return mxs_nand_calc_ecc_for_large_oob(geo, mtd);
> +       /* for large oob nand */
> +       if (mtd->oobsize > 1024) {
> +               dev_dbg(mtd->dev, "use large oob bch geometry\n");
> +               err = mxs_nand_calc_ecc_for_large_oob(geo, mtd);
> +               if (!err)
> +                       return 0;
> +       }
>
> -       return mxs_nand_calc_ecc_layout_by_info(geo, mtd,
> -                               chip->ecc_strength_ds, chip->ecc_step_ds);
> +       /* otherwise use the minimum ecc nand chips required */
> +       dev_dbg(mtd->dev, "use minimum ecc bch geometry\n");
> +       err = mxs_nand_calc_ecc_layout_by_info(geo, mtd, chip->ecc_strength_ds,
> +                                              chip->ecc_step_ds);
>
> -       return 0;
> +       if (err)
> +               dev_err(mtd->dev, "none of the bch geometry setting works\n");
> +
> +       return err;
> +}
> +
> +void mxs_nand_dump_geo(struct mtd_info *mtd)
> +{
> +       struct nand_chip *nand = mtd_to_nand(mtd);
> +       struct mxs_nand_info *nand_info = nand_get_controller_data(nand);
> +       struct bch_geometry *geo = &nand_info->bch_geometry;
> +
> +       dev_dbg(mtd->dev, "BCH Geometry :\n"
> +               "GF Length\t\t: %u\n"
> +               "ECC Strength\t\t: %u\n"
> +               "ECC for Meta\t\t: %u\n"
> +               "ECC Chunk0 Size\t\t: %u\n"
> +               "ECC Chunkn Size\t\t: %u\n"
> +               "ECC Chunk Count\t\t: %u\n"
> +               "Block Mark Byte Offset\t: %u\n"
> +               "Block Mark Bit Offset\t: %u\n",
> +               geo->gf_len,
> +               geo->ecc_strength,
> +               geo->ecc_for_meta,
> +               geo->ecc_chunk0_size,
> +               geo->ecc_chunkn_size,
> +               geo->ecc_chunk_count,
> +               geo->block_mark_byte_offset,
> +               geo->block_mark_bit_offset);
>  }
>
>  /*
> @@ -1159,6 +1210,8 @@ int mxs_nand_setup_ecc(struct mtd_info *mtd)
>         if (ret)
>                 return ret;
>
> +       mxs_nand_dump_geo(mtd);
> +
>         /* Configure BCH and set NFC geometry */
>         mxs_reset_block(&bch_regs->hw_bch_ctrl_reg);
>
> --
> 2.17.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Han,

I have boards (gwventana_nand_defconfig / boards/gateworks/gw_ventana)
that support several different NAND chips:
2GiB Micron Technology MT29F16G08ADACAH4 (4k page size, 256k erase
size, 224 oob size)
2GiB Cypress S34ML16G202BHI000 (2k page size, 128k erase size, 128B oob size)
1GiB Micron MT29F8G08ABACAH4 (4k page size, 156k erase size, 224 oob size)
256MiB Micron MT29F2G08ABAEAH4 (2k page size, 128k erase size, 64B oob size)

commit 616f03dabacb ("mtd: gpmi: change the BCH layout setting for
large oob NAND") did break NAND for these boards by forcing a change
to this 'modern' geometry that never even existed in the mainline
kernel
commit 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
geometry") does not help my boards as like Frieder, I don't have
access in DT at this time to set the flag (if I alter code to force
legacy mode it fixes it)

This patch does resolve the issue on my boards by using the legacy
layout by default. I would say that this fixes an issue that pre-dates
commit ("51cdf83eea mtd: gpmi: provide the option to use legacy bch
geometry") so I would add:
Fixes: 616f03dabacb ("mtd: gpmi: change the BCH layout setting for
large oob NAND")

I agree with Sean's comments that the commit log should not indicate
anything about the kernel as there was no change done in the mainline
kernel and this was simply a breakage of U-Boot and that a follow-up
patch is needed to remove the unused 'fsl,legacy-bch-geometry'.

Tested-by: Tim Harvey <tharvey@gateworks.com>

Best regards,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
