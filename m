Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8vac-0008Ol-6s
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 06:08:04 -0400
Message-ID: <4695FC93.7040800@parrot.com>
Date: Thu, 12 Jul 2007 12:04:03 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] S3C24XX large page NAND support
References: <20070709231147.GA30072@fluff.org.uk>
In-Reply-To: <20070709231147.GA30072@fluff.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks wrote:
> This adds support for using large page NAND devices
> with the S3C24XX NAND controllers. This also adds the 
> file Documentation/arm/Samsung-S3C24XX/NAND.txt to
> describe the differences.
> 
> The basic stratergy is to maintain 3 bytes of ECC for
> each 256 byte block read from the NAND which is similar
> to the default kernel layout (altough we are using the
> hardware ECC generator to make our ECC calculations).
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> 
> Index: linux-2.6.21-tmp/drivers/mtd/nand/s3c2410.c
> ===================================================================
> --- linux-2.6.21-tmp.orig/drivers/mtd/nand/s3c2410.c	2007-04-26 04:08:32.000000000 +0100
> +++ linux-2.6.21-tmp/drivers/mtd/nand/s3c2410.c	2007-05-22 12:26:49.000000000 +0100
> @@ -473,7 +473,7 @@ static int s3c2440_nand_calculate_ecc(st
>  	ecc_code[1] = ecc >> 8;
>  	ecc_code[2] = ecc >> 16;
>  
> -	pr_debug("%s: returning ecc %06lx\n", __func__, ecc);
> +	pr_debug("%s: returning ecc %06lx\n", __func__, ecc & 0xffffff);
>  
>  	return 0;
>  }
> @@ -630,9 +630,6 @@ static void s3c2410_nand_init_chip(struc
>  		chip->ecc.calculate = s3c2410_nand_calculate_ecc;
>  		chip->ecc.correct   = s3c2410_nand_correct_data;
>  		chip->ecc.mode	    = NAND_ECC_HW;
> -		chip->ecc.size	    = 512;
> -		chip->ecc.bytes	    = 3;
> -		chip->ecc.layout    = &nand_hw_eccoob;
>  
>  		switch (info->cpu_type) {
>  		case TYPE_S3C2410:
> @@ -656,6 +653,34 @@ static void s3c2410_nand_init_chip(struc
>  	}
>  }
>  
> +/* s3c2410_nand_update_chip
> + *
> + * post-probe chip update, to change any items, such as the
> + * layout for large page nand
> + */
> +
> +static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
> +				     struct s3c2410_nand_mtd *nmtd)
> +{
> +	struct nand_chip *chip = &nmtd->chip;
> +
> +	printk("%s: chip %p: %d\n", __func__, chip, chip->page_shift);
> +
> +	if (hardware_ecc) {
> +		/* change the behaviour depending on wether we are using
> +		 * the large or small page nand device */
> +
> +		if (chip->page_shift > 10) {
> +			chip->ecc.size	    = 256;
> +			chip->ecc.bytes	    = 3;
> +		} else {
> +			chip->ecc.size	    = 512;
> +			chip->ecc.bytes	    = 3;
> +			chip->ecc.layout    = &nand_hw_eccoob;
> +		}
> +	}
> +}
> +
>  /* s3c2410_nand_probe
>   *
>   * called by device layer when it finds a device matching
> @@ -762,9 +787,12 @@ static int s3c24xx_nand_probe(struct pla
>  
>  		s3c2410_nand_init_chip(info, nmtd, sets);
>  
> -		nmtd->scan_res = nand_scan(&nmtd->mtd, (sets) ? sets->nr_chips : 1);
> +		nmtd->scan_res = nand_scan_ident(&nmtd->mtd,
> +						 (sets) ? sets->nr_chips : 1);
>  
>  		if (nmtd->scan_res == 0) {
> +			s3c2410_nand_update_chip(info, nmtd);
> +			nand_scan_tail(&nmtd->mtd);
>  			s3c2410_nand_add_partition(info, nmtd, sets);
>  		}
Shouldn't nand_scan_ident and nand_scan_tail be used here ?


Matthieu
