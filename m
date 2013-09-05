Received: from mail-db8lp0188.outbound.messaging.microsoft.com
 ([213.199.154.188] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHPNp-0005SK-Bv
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2013 02:33:22 +0000
Message-ID: <5227EDAD.6000808@freescale.com>
Date: Thu, 5 Sep 2013 10:34:21 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 07/12] mtd: nand: return failure when failing to get ECC
 from ONFI
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
 <1378319126-24473-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-8-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C205=C8=D5 02:25, Brian Norris =D0=B4=B5=C0:
> If ONFI fails to provide ECC information, we should not use it. Print
> appropriate error messages and return.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index 7ed4841..38b8dd4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3010,8 +3010,13 @@ static int nand_flash_detect_onfi(struct mtd_inf=
o *mtd, struct nand_chip *chip,
>  			chip->cmdfunc =3D nand_command_lp;
> =20
>  		/* The Extended Parameter Page is supported since ONFI 2.1. */
> -		if (nand_flash_detect_ext_param_page(mtd, chip, p))
> -			pr_info("Failed to detect the extended param page.\n");
> +		if (nand_flash_detect_ext_param_page(mtd, chip, p)) {
> +			pr_info("Failed to detect ONFI extended param page\n");
> +			return 0;
> +		}
> +	} else {
> +		pr_err("Could not retrieve ONFI ECC requirements\n");
> +		return 0;
This return will skips the message "ONFI flash detected", could we
remove the 'return' from this patch?

most of the drivers will not use the ECC info, so i think even we fail
to detect the ECC info
we do not need to skip the message "ONFI flash detected".

My suggestion is to use the pr_warn() to just print out the warning,
such as:
pr_warn("Could not retrieve ONFI ECC requirements\n");



thanks
Huang Shijie

>  	}
> =20
>  	pr_info("ONFI flash detected\n");
