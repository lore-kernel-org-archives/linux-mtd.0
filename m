Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5S2j-0002JH-1H
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 07:16:18 +0000
Date: Tue, 2 May 2017 09:15:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: don't make vendor-specific code un-set their
 data pointer
Message-ID: <20170502091553.7d666a50@bbrezillon>
In-Reply-To: <20170502000455.13240-2-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-2-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  1 May 2017 17:04:51 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> It makes sense to do this in nand_base.
> 
> (Alternatively: we don't really need to do this at all.)

Actually, I was just trying to handle a potential 'double-free' error
nicely (see the 'if (hynix) return;' statement at the beginning of
hynix_nand_cleanup(), but I'm not sure this was a good idea.

Let's drop this assignment.

> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Compile tested only
> 
>  drivers/mtd/nand/nand_base.c  | 11 +++++++++--
>  drivers/mtd/nand/nand_hynix.c |  1 -
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ed49a1d634b0..2adcc8cdedf1 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3910,11 +3910,16 @@ static void nand_manufacturer_detect(struct nand_chip *chip)
>   */
>  static int nand_manufacturer_init(struct nand_chip *chip)
>  {
> +	int ret;
> +
>  	if (!chip->manufacturer.desc || !chip->manufacturer.desc->ops ||
>  	    !chip->manufacturer.desc->ops->init)
>  		return 0;
>  
> -	return chip->manufacturer.desc->ops->init(chip);
> +	ret = chip->manufacturer.desc->ops->init(chip);
> +	if (ret)
> +		nand_set_manufacturer_data(chip, NULL);
> +	return ret;
>  }
>  
>  /*
> @@ -3927,8 +3932,10 @@ static void nand_manufacturer_cleanup(struct nand_chip *chip)
>  {
>  	/* Release manufacturer private data */
>  	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> -	    chip->manufacturer.desc->ops->cleanup)
> +	    chip->manufacturer.desc->ops->cleanup) {
>  		chip->manufacturer.desc->ops->cleanup(chip);
> +		nand_set_manufacturer_data(chip, NULL);
> +	}
>  }
>  
>  /*
> diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
> index b12dc7325378..54d99f90aa9f 100644
> --- a/drivers/mtd/nand/nand_hynix.c
> +++ b/drivers/mtd/nand/nand_hynix.c
> @@ -598,7 +598,6 @@ static void hynix_nand_cleanup(struct nand_chip *chip)
>  
>  	kfree(hynix->read_retry);
>  	kfree(hynix);
> -	nand_set_manufacturer_data(chip, NULL);
>  }
>  
>  static int hynix_nand_init(struct nand_chip *chip)
