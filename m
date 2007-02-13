Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGw6H-0004ey-Pf
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 06:45:37 -0500
Date: Tue, 13 Feb 2007 11:45:25 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: Re: [PATCH] S3C2412 fix hw ecc
Message-ID: <20070213114525.GD2211@fluff.org.uk>
References: <45D1A15E.5030109@parrot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45D1A15E.5030109@parrot.fr>
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben-fbdev@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 13, 2007 at 12:30:38PM +0100, Matthieu CASTET wrote:
> Hi,
> 
> S3C2412 use differents registers than s3c2440 for hw ecc handling.
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.fr>
Acked-by: Ben Dooks <ben-linux@fluff.org>


> Index: linux-2.6.20/drivers/mtd/nand/s3c2410.c
> ===================================================================
> --- linux-2.6.20.orig/drivers/mtd/nand/s3c2410.c	2007-02-13 10:17:54.000000000 +0100
> +++ linux-2.6.20/drivers/mtd/nand/s3c2410.c	2007-02-13 12:07:10.000000000 +0100
> @@ -419,6 +419,15 @@
>  	writel(ctrl, info->regs + S3C2410_NFCONF);
>  }
>  
> +static void s3c2412_nand_enable_hwecc(struct mtd_info *mtd, int mode)
> +{
> +	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> +	unsigned long ctrl;
> +
> +	ctrl = readl(info->regs + S3C2440_NFCONT);
> +	writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC, info->regs + S3C2440_NFCONT);
> +}
> +
>  static void s3c2440_nand_enable_hwecc(struct mtd_info *mtd, int mode)
>  {
>  	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> @@ -442,6 +451,20 @@
>  	return 0;
>  }
>  
> +static int s3c2412_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
> +{
> +	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> +	unsigned long ecc = readl(info->regs + S3C2412_NFMECC0);
> +
> +	ecc_code[0] = ecc;
> +	ecc_code[1] = ecc >> 8;
> +	ecc_code[2] = ecc >> 16;
> +
> +	pr_debug("calculate_ecc: returning ecc %02x,%02x,%02x\n", ecc_code[0], ecc_code[1], ecc_code[2]);
> +
> +	return 0;
> +}
> +
>  static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
>  {
>  	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> @@ -619,6 +642,10 @@
>  			break;
>  
>  		case TYPE_S3C2412:
> +  			chip->ecc.hwctl     = s3c2412_nand_enable_hwecc;
> +  			chip->ecc.calculate = s3c2412_nand_calculate_ecc;
> +			break;
> +
>  		case TYPE_S3C2440:
>    			chip->ecc.hwctl     = s3c2440_nand_enable_hwecc;
>    			chip->ecc.calculate = s3c2440_nand_calculate_ecc;
> 

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
