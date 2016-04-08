Received: from smtprelay0253.hostedemail.com ([216.40.44.253]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoU06-0007uW-P8
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:50:55 +0000
Message-ID: <1460112618.1800.36.camel@perches.com>
Subject: Re: [PATCH] mtd: nand: pasemi: switch to pr_* functions
From: Joe Perches <joe@perches.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Olof
 Johansson <olof@lixom.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, "open list:LINUX FOR POWERPC PA SEMI
 PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Fri, 08 Apr 2016 03:50:18 -0700
In-Reply-To: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
References: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-04-08 at 12:33 +0200, Rafał Miłecki wrote:
> This patch also replaces %08llx with %08zx for printing resource start
> address. Old format was triggering:
> warning: format ‘%08llx’ expects type ‘long long unsigned int’, but argument 2 has type ‘resource_size_t’

trivia:

> diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
[]
> @@ -112,8 +112,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
>  	/* Allocate memory for MTD device structure and private data */
>  	chip = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
>  	if (!chip) {
> -		printk(KERN_WARNING
> -		       "Unable to allocate PASEMI NAND MTD device structure\n");
> +		pr_warn("Unable to allocate PASEMI NAND MTD device structure\n");

Maybe remove this unnecessary as there's an OOM stack dump.

>  		err = -ENOMEM;
>  		goto out;
>  	}
> @@ -163,13 +162,13 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
>  	}
>  
>  	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
> -		printk(KERN_ERR "pasemi_nand: Unable to register MTD device\n");
> +		pr_err("pasemi_nand: Unable to register MTD device\n");

Maybe remove the embedded "pasemi_nand: " and add
#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
before the first #include?

>  		err = -ENODEV;
>  		goto out_lpc;
>  	}
>  
> -	printk(KERN_INFO "PA Semi NAND flash at %08llx, control at I/O %x\n",
> -	       res.start, lpcctl);
> +	pr_info("PA Semi NAND flash at %08zx, control at I/O %x\n", res.start,
> +		lpcctl);

Maybe use %pR, &res instead of res.start?

	pr_info("PA Semi NAND flash at %pR, control at I/O %x\n", &res, lpcctl);
