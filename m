Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5ITO-0006Xn-Fh
 for linux-mtd@lists.infradead.org; Mon, 01 May 2017 21:03:12 +0000
Received: by mail-pg0-x244.google.com with SMTP id t7so17689799pgt.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 14:02:49 -0700 (PDT)
Date: Mon, 1 May 2017 14:02:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
Message-ID: <20170501210246.GA140640@google.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-6-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483448495-31607-6-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jan 03, 2017 at 02:01:25PM +0100, Boris Brezillon wrote:
> A lot of NANDs are implementing generic features in a non-generic way,
> or are providing advanced auto-detection logic where the NAND ID bytes
> meaning changes with the NAND generation.
> 
> Providing this vendor specific initialization step will allow us to get
> rid of the full ids in the nand_ids table or all the vendor specific
> cases added over the time in the generic NAND ID decoding logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 67 +++++++++++++++++++++++++++++++++++---------
>  include/linux/mtd/nand.h     | 35 +++++++++++++++++++++++
>  2 files changed, 89 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index efb3ade568d8..8f80faa57984 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c

...

> @@ -4163,6 +4196,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>  		chip->cmdfunc = nand_command_lp;
>  
> +	ret = nand_manufacturer_init(chip);
> +	if (ret)
> +		return ret;
> +

AFAICT, you're leaking anything that should be cleaned up in the
->cleanup() hook, for any error case after this. Not absolutely critical
to fix immediately, but I'd expect we should fix this in the 4.12 cycle.

>  	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
>  		maf_id, dev_id);
>  
> @@ -4907,6 +4944,10 @@ void nand_cleanup(struct nand_chip *chip)
>  	if (chip->badblock_pattern && chip->badblock_pattern->options
>  			& NAND_BBT_DYNAMICSTRUCT)
>  		kfree(chip->badblock_pattern);
> +
> +	/* Release manufacturer private data */
> +	if (chip->manufacturer.ops && chip->manufacturer.ops->cleanup)
> +		chip->manufacturer.ops->cleanup(chip);
>  }
>  EXPORT_SYMBOL_GPL(nand_cleanup);
>  

[...]

Brian
