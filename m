Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSZq3-0004KR-Kg
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 22:28:56 +0000
Received: by mail-we0-f182.google.com with SMTP id p61so818128wes.27
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 15:28:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
References: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
Date: Tue, 25 Mar 2014 19:28:30 -0300
Message-ID: <CAK4VdL33t-rbVGfj5xH3nVeGt5fjnZjvcNH+zZ=4Dibj7snsYg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fix mention to CONFIG_MTD_NAND_ECC_BCH
From: Erico Nunes <nunes.erico@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com,
 linux-kernel <linux-kernel@vger.kernel.org>, b32955@freescale.com,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-03-11 1:31 GMT-03:00 Erico Nunes <nunes.erico@gmail.com>:
> Mention to CONFIG_MTD_ECC_BCH in the warning message can be confusing as this
> doesn't match the exact name of the configuration option.
> This warning showed up once to me when I was starting to set up BCH. After
> checking my .config file, it took a moment before realizing it is
> CONFIG_MTD_NAND_ECC_BCH instead of CONFIG_MTD_ECC_BCH.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9715a7b..5a93787 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3825,7 +3825,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>
>         case NAND_ECC_SOFT_BCH:
>                 if (!mtd_nand_has_bch()) {
> -                       pr_warn("CONFIG_MTD_ECC_BCH not enabled\n");
> +                       pr_warn("CONFIG_MTD_NAND_ECC_BCH not enabled\n");
>                         BUG();
>                 }
>                 ecc->calculate = nand_bch_calculate_ecc;
> --
> 1.9.0
>

Ping.
