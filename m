Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KfXWH-000799-Ed
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 10:10:53 +0000
Date: Tue, 16 Sep 2008 11:10:48 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Karl Beldan <karl.beldan@gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] nand_base.c: reset chip first
Message-ID: <20080916101048.GA4322@fluff.org.uk>
References: <ea2442770809150537p538f5298s9b5b003a1825b09f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea2442770809150537p538f5298s9b5b003a1825b09f@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 15, 2008 at 02:37:29PM +0200, Karl Beldan wrote:
> Some chips require a RESET after power-up (e.g. Micron MT29FxGxxxxx).
> The first command sent is NAND_CMD_READID.
> Issue a NAND_CMD_RESET in nand_scan_ident before reading the device id.
> Tested with an MT29F4G08AAC.

This seems sensible to me, we don't really know what state the NAND
chip is in.

Does there need to be a delay after sending the reset command before
attempting to read the chip's identity?
 
> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
> ---
> Prior to resetting, the chip gives a correct first ID byte though.
> 
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d1129ba..2cfac9b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2318,6 +2318,12 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd,
>  	/* Select the device */
>  	chip->select_chip(mtd, 0);
> 
> +	/*
> +	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
> +	 * after power-up
> +	 */
> +	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +
>  	/* Send the command for reading device ID */
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> 
> @@ -2488,6 +2494,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips)
>  	/* Check for a chip array */
>  	for (i = 1; i < maxchips; i++) {
>  		chip->select_chip(mtd, i);
> +		/* See comment in nand_get_flash_type for reset */
> +		chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
>  		/* Send the command for reading device ID */
>  		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>  		/* Read manufacturer and device IDs */
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
