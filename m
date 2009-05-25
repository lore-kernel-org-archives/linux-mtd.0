Received: from an-out-0708.google.com ([209.85.132.245])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Wr6-0003CY-EF
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 09:52:35 +0000
Received: by an-out-0708.google.com with SMTP id d14so1654981and.27
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 02:52:24 -0700 (PDT)
Date: Mon, 25 May 2009 11:52:20 +0200
From: Alberto Panizzo <maramaopercheseimorto@gmail.com>
To: Vladimir Barinov <vova.barinov@gmail.com>
Subject: Re: [PATCH] [MTD] MXC NAND support for 2k page size flashes
Message-ID: <20090525115220.1ace479d@Marramao-laptop>
In-Reply-To: <1243242377-4470-1-git-send-email-vbarinov@embeddedalley.com>
References: <1243242377-4470-1-git-send-email-vbarinov@embeddedalley.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: lilja.magnus@gmail.com, s.hauer@pengutronix.de,
	lanconelli.claudio@eptar.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 May 2009 13:06:17 +0400
Vladimir Barinov <vova.barinov@gmail.com> wrote:

> - Add support for 2k page size flashes
> - Fix page address access for large pages
> - Detect oob layout at runtime
> - handle pagesize_2k variable
> - Fix oob16 layout: reserve location 5 of oob area since it's used for bbt
> ---
>  drivers/mtd/nand/mxc_nand.c |   60 ++++++++++++++++++++++++++++++++++++------
>  1 files changed, 51 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index f3548d0..5ab8985 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -138,7 +138,14 @@ static struct nand_ecclayout nand_hw_eccoob_8 = {
>  static struct nand_ecclayout nand_hw_eccoob_16 = {
>  	.eccbytes = 5,
>  	.eccpos = {6, 7, 8, 9, 10},
> -	.oobfree = {{0, 6}, {12, 4}, }
> +	.oobfree = {{0, 5}, {11, 5}, }
> +};
> +
> +static struct nand_ecclayout nand_hw_eccoob_64 = {
> +	.eccbytes = 20,
> +	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
> +		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
> +	.oobfree = {{2, 4}, {11, 10}, {27, 10}, {43, 10}, {59, 5}, }
>  };
>  
>  #ifdef CONFIG_MTD_PARTITIONS
> @@ -795,9 +802,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>  		send_addr(host, (page_addr & 0xff), false);
>  
>  		if (host->pagesize_2k) {
> -			send_addr(host, (page_addr >> 8) & 0xFF, false);
> -			if (mtd->size >= 0x40000000)
> +			if (mtd->size >= 0x10000000) {
> +				/* paddr_8 - paddr_15 */
> +				send_addr(host, (page_addr >> 8) & 0xff, false);
>  				send_addr(host, (page_addr >> 16) & 0xff, true);
> +			} else
> +				/* paddr_8 - paddr_15 */
> +				send_addr(host, (page_addr >> 8) & 0xff, true);
>  		} else {
>  			/* One more address cycle for higher density devices */
>  			if (mtd->size >= 0x4000000) {
> @@ -919,7 +930,6 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  		this->ecc.mode = NAND_ECC_HW;
>  		this->ecc.size = 512;
>  		this->ecc.bytes = 3;
> -		this->ecc.layout = &nand_hw_eccoob_8;
>  		tmp = readw(host->regs + NFC_CONFIG1);
>  		tmp |= NFC_ECC_EN;
>  		writew(tmp, host->regs + NFC_CONFIG1);
> @@ -953,12 +963,44 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  		this->ecc.layout = &nand_hw_eccoob_16;
>  	}
>  
> -	host->pagesize_2k = 0;
> +	/* first scan to find the device and get the page size */
> +	if (nand_scan_ident(mtd, 1)) {
> +		err = -ENXIO;
> +		goto escan;
> +	}
>  
> -	/* Scan to find existence of the device */
> -	if (nand_scan(mtd, 1)) {
> -		DEBUG(MTD_DEBUG_LEVEL0,
> -		      "MXC_ND: Unable to find any NAND device.\n");
> +	host->pagesize_2k = (mtd->writesize == 2048) ? 1 : 0;
> +
> +	if (this->ecc.mode == NAND_ECC_HW) {
> +		switch (mtd->oobsize) {
> +		case 8:
> +			this->ecc.layout = &nand_hw_eccoob_8;
> +			break;
> +		case 16:
> +			this->ecc.layout = &nand_hw_eccoob_16;
> +			break;
> +		case 64:
> +			this->ecc.layout = &nand_hw_eccoob_64;
> +			break;
> +		default:
> +			/* page size not handled by HW ECC */
> +			/* switching back to soft ECC */
> +			this->ecc.size = 512;
> +			this->ecc.bytes = 3;
> +			this->ecc.layout = &nand_hw_eccoob_8;
> +			this->ecc.mode = NAND_ECC_SOFT;
> +			this->ecc.calculate = NULL;
> +			this->ecc.correct = NULL;
> +			this->ecc.hwctl = NULL;
> +			tmp = readw(host->regs + NFC_CONFIG1);
> +			tmp &= ~NFC_ECC_EN;
> +			writew(tmp, host->regs + NFC_CONFIG1);
> +			break;
> +		}
> +	}
> +
> +	/* second phase scan */
> +	if (nand_scan_tail(mtd)) {
>  		err = -ENXIO;
>  		goto escan;
>  	}

Hi Vladimir! Very thanks for your patch! This and setting correct value of NFMS bit, solve the problem!

Alberto!
