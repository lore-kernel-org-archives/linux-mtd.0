Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNIEJ-00046r-I0
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 08:40:08 +0000
Received: by mail-wi0-f176.google.com with SMTP id hr14so498324wib.3
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 01:39:45 -0700 (PDT)
Date: Tue, 11 Mar 2014 08:39:40 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix mention to CONFIG_MTD_NAND_ECC_BCH
Message-ID: <20140311083940.GK2839@lee--X1>
References: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 b32955@freescale.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
>  	case NAND_ECC_SOFT_BCH:
>  		if (!mtd_nand_has_bch()) {
> -			pr_warn("CONFIG_MTD_ECC_BCH not enabled\n");
> +			pr_warn("CONFIG_MTD_NAND_ECC_BCH not enabled\n");
>  			BUG();
>  		}
>  		ecc->calculate = nand_bch_calculate_ecc;

Not sure if CONFIG options should be printed in the log at all, but
the correct option is better than an incorrect one. Seeing as
CONFIG_MTD_ECC_BCH doesn't actually exist:
  Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
