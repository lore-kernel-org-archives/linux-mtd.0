Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUVBz-0006G4-9W
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:27:47 +0000
Received: by mail-pd0-f174.google.com with SMTP id v10so740580pde.33
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:27:26 -0700 (PDT)
Date: Wed, 17 Sep 2014 23:27:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/4] mtd: bcm47xxnflash: add dev_ready and fill chip_delay
Message-ID: <20140918062722.GI7362@norris-Latitude-E6410>
References: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
 <1408432456-27280-2-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408432456-27280-2-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 19, 2014 at 09:14:14AM +0200, Rafał Miłecki wrote:
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> index dc204f3..1ea5e77 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> +++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> @@ -174,6 +174,14 @@ static void bcm47xxnflash_ops_bcm4706_select_chip(struct mtd_info *mtd,
>  	return;
>  }
>  
> +static int bcm47xxnflash_ops_bcm4706_dev_ready(struct mtd_info *mtd)
> +{
> +	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
> +	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
> +
> +	return !!(bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_CTL) & NCTL_READY);

BTW, you don't actually need the double negation, since
chip->dev_ready() is always used as a bool anyway. But no matter.

> +}
> +
>  /*
>   * Default nand_command and nand_command_lp don't match BCM4706 hardware layout.
>   * For example, reading chip id is performed in a non-standard way.
> @@ -341,6 +349,7 @@ static void bcm47xxnflash_ops_bcm4706_write_buf(struct mtd_info *mtd,
>  
>  int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
>  {
> +	struct nand_chip *nand_chip = (struct nand_chip *)&b47n->nand_chip;
>  	int err;
>  	u32 freq;
>  	u16 clock;
> @@ -351,10 +360,13 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
>  	u32 val;
>  
>  	b47n->nand_chip.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
> +	nand_chip->dev_ready = bcm47xxnflash_ops_bcm4706_dev_ready;
>  	b47n->nand_chip.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
>  	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
>  	b47n->nand_chip.read_buf = bcm47xxnflash_ops_bcm4706_read_buf;
>  	b47n->nand_chip.write_buf = bcm47xxnflash_ops_bcm4706_write_buf;
> +
> +	nand_chip->chip_delay = 50;

I'm curious, did you have a good reason to use something other than the
default provided by nand_base?

>  	b47n->nand_chip.bbt_options = NAND_BBT_USE_FLASH;
>  	b47n->nand_chip.ecc.mode = NAND_ECC_NONE; /* TODO: implement ECC */
>  

Brian
