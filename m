Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zi4h0-00081M-Cj
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 18:04:28 +0000
Received: by padhy16 with SMTP id hy16so112586426pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Oct 2015 11:04:05 -0700 (PDT)
Date: Fri, 2 Oct 2015 11:04:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/3 v2] mtd: nand: fsmc: Add BCH4 SW ECC support for
 SPEAr600
Message-ID: <20151002180402.GI107187@google.com>
References: <1443782422-4515-1-git-send-email-sr@denx.de>
 <1443782422-4515-3-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1443782422-4515-3-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please base your series on linux-next.git or l2-mtd.git. See:

http://linux-mtd.infradead.org/source.html

or the MAINTAINERS file.

On Fri, Oct 02, 2015 at 12:40:22PM +0200, Stefan Roese wrote:
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -1023,12 +1023,17 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  	nand->cmd_ctrl = fsmc_cmd_ctrl;
>  	nand->chip_delay = 30;
>  
> +	/*
> +	 * Setup default ECC mode. nand_dt_init() called from nand_scan_init()
> +	 * can overwrite this value if the DT provides a different value.
> +	 */
>  	nand->ecc.mode = NAND_ECC_HW;
>  	nand->ecc.hwctl = fsmc_enable_hwecc;
>  	nand->ecc.size = 512;
>  	nand->options = pdata->options;
>  	nand->select_chip = fsmc_select_chip;
>  	nand->badblockbits = 7;
> +	nand->dn = np;

drivers/mtd/nand/fsmc_nand.c: In function ‘fsmc_nand_probe’:
drivers/mtd/nand/fsmc_nand.c:1036:6: error: ‘struct nand_chip’ has no member named ‘dn’

This field was renamed for clarity, to flash_node.

>  
>  	if (pdata->width == FSMC_NAND_BW16)
>  		nand->options |= NAND_BUSWIDTH_16;

[...]

Brian
