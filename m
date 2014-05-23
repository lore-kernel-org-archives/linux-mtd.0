Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wngjy-00034l-MQ
 for linux-mtd@lists.infradead.org; Fri, 23 May 2014 04:05:55 +0000
Received: by mail-qc0-f182.google.com with SMTP id e16so7238533qcx.27
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 21:05:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1400813650-7417-1-git-send-email-ted.juan@gmail.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EAD825F@DBDE04.ent.ti.com>
 <1400813650-7417-1-git-send-email-ted.juan@gmail.com>
Date: Fri, 23 May 2014 12:05:32 +0800
Message-ID: <CAE94FHEEpdyO-4nk-CVvSh6agECKsMibxSzgS=U_8osdVav5Rg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop
 error
From: Ted Juan <ted.juan@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "ted.juan" <ted.juan@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

When I add "CC: <stable@vger.kernel.org> # 3.13.x+" in patch, then git
send-email.

There are some warning message as blow. Should I fix it?
And which stable version I should mark?

Thanks.

(mbox) Adding cc: "ted.juan" <ted_juan@weintek.com> from line 'From:
"ted.juan" <ted_juan@weintek.com>'
(body) Adding cc: <stable@vger.kernel.org> # 3.13.x+ from line 'CC:
<stable@vger.kernel.org> # 3.13.x+'
Use of uninitialized value $cc in string eq at
/usr/lib/git-core/git-send-email line 983.
Use of uninitialized value $cc in quotemeta at
/usr/lib/git-core/git-send-email line 983.
W: unable to extract a valid address from: <stable@vger.kernel.org> # 3.13.x+
W: unable to extract a valid address from: <stable@vger.kernel.org> # 3.13.x+


2014-05-23 10:54 GMT+08:00 ted.juan <ted.juan@gmail.com>:
> From: "ted.juan" <ted.juan@gmail.com>
>
>
>  Fixes:  2c9f2365d1e1d0e318b068f683f18c99515b80f8
>  mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4 in omap_calculate_ecc_bch
>
>  Fixes: 7bcd1dca1d587ad29f9825ba4414620440e8c8da
>  mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch8 in omap_calculate_ecc_bch
>
> Hi Pekon,
>
> Thanks a lot for your comments.
> I hope I don't misunderstand what you say.
>
> CC: <stable@vger.kernel.org> # 3.13.x+
> Signed-off-by: ted.juan <ted.juan@gmail.com>
> Acked-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 1ff49b8..e21145a 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1162,7 +1162,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>         struct gpmc_nand_regs   *gpmc_regs = &info->reg;
>         u8 *ecc_code;
>         unsigned long nsectors, bch_val1, bch_val2, bch_val3, bch_val4;
> -       int i;
> +       int i, j;
>
>         nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
>         for (i = 0; i < nsectors; i++) {
> @@ -1210,8 +1210,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>                 case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>                         /* Add constant polynomial to remainder, so that
>                          * ECC of blank pages results in 0x0 on reading back */
> -                       for (i = 0; i < eccbytes; i++)
> -                               ecc_calc[i] ^= bch4_polynomial[i];
> +                       for (j = 0; j < eccbytes; j++)
> +                               ecc_calc[j] ^= bch4_polynomial[j];
>                         break;
>                 case OMAP_ECC_BCH4_CODE_HW:
>                         /* Set  8th ECC byte as 0x0 for ROM compatibility */
> @@ -1220,8 +1220,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>                 case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
>                         /* Add constant polynomial to remainder, so that
>                          * ECC of blank pages results in 0x0 on reading back */
> -                       for (i = 0; i < eccbytes; i++)
> -                               ecc_calc[i] ^= bch8_polynomial[i];
> +                       for (j = 0; j < eccbytes; j++)
> +                               ecc_calc[j] ^= bch8_polynomial[j];
>                         break;
>                 case OMAP_ECC_BCH8_CODE_HW:
>                         /* Set 14th ECC byte as 0x0 for ROM compatibility */
> --
> 1.7.9.5
>
