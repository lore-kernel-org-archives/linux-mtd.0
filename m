Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHEvU-0008R9-D9
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 17:32:30 +0000
Received: by padck2 with SMTP id ck2so104000408pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 10:32:07 -0700 (PDT)
Date: Mon, 20 Jul 2015 10:32:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: dwmw2@infradead.org, santosh.shilimkar@ti.com, grygorii.strashko@ti.com,
 m-karicheri2@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsa@the-dreams.de, Hao Zhang <hzhang@ti.com>
Subject: Re: [Patch v2] nand: davinci: add support for 4K page size nand
 devices
Message-ID: <20150720173203.GB24125@google.com>
References: <1408451514-4204-1-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408451514-4204-1-git-send-email-ivan.khoronzhuk@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 19, 2014 at 03:31:54PM +0300, Ivan Khoronzhuk wrote:
> From: Sandeep Paulraj <s-paulraj@ti.com>
> 
> It is needed for k2l keystone2 EVM which uses NAND flash with 4K page
> size, hence add support for 4K page size nand devices.
> 
> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
> 
> Based on l2-mtd/master
> 
> v1..v2:
> - fixed comment style, no functional changes

This was resurrected Murali Karicheri. Since this one is nearly
identical and much preceded it, I've pushed it to l2-mtd.git.

Thanks,
Brian

>  drivers/mtd/nand/davinci_nand.c | 42 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index b922c8e..d7df32c 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -520,6 +520,32 @@ static struct nand_ecclayout hwecc4_2048 = {
>  	},
>  };
>  
> +/*
> + * An ECC layout for using 4-bit ECC with large-page (4096bytes) flash,
> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
> + * and not overlapping the default BBT markers.
> + */
> +static struct nand_ecclayout hwecc4_4096 = {
> +	.eccbytes = 80,
> +	.eccpos = {
> +		/* at the end of spare sector */
> +		48, 49, 50, 51, 52, 53, 54, 55, 56, 57,
> +		58, 59, 60, 61, 62, 63, 64, 65, 66, 67,
> +		68, 69, 70, 71, 72, 73, 74, 75, 76, 77,
> +		78, 79, 80, 81, 82, 83, 84, 85, 86, 87,
> +		88, 89, 90, 91, 92, 93, 94, 95, 96, 97,
> +		98, 99, 100, 101, 102, 103, 104, 105, 106, 107,
> +		108, 109, 110, 111, 112, 113, 114, 115, 116, 117,
> +		118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
> +	},
> +	.oobfree = {
> +		/* 2 bytes at offset 0 hold manufacturer badblock markers */
> +		{.offset = 2, .length = 46, },
> +		/* 5 bytes at offset 8 hold BBT markers */
> +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
> +	},
> +};
> +
>  #if defined(CONFIG_OF)
>  static const struct of_device_id davinci_nand_of_match[] = {
>  	{.compatible = "ti,davinci-nand", },
> @@ -796,18 +822,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
>  			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
>  			goto syndrome_done;
>  		}
> +		if (chunks == 8) {
> +			info->ecclayout = hwecc4_4096;
> +			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
> +			goto syndrome_done;
> +		}
>  
> -		/* 4KiB page chips are not yet supported. The eccpos from
> -		 * nand_ecclayout cannot hold 80 bytes and change to eccpos[]
> -		 * breaks userspace ioctl interface with mtd-utils. Once we
> -		 * resolve this issue, NAND_ECC_HW_OOB_FIRST mode can be used
> -		 * for the 4KiB page chips.
> -		 *
> -		 * TODO: Note that nand_ecclayout has now been expanded and can
> -		 *  hold plenty of OOB entries.
> -		 */
> -		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
> -				"for 4KiB-page NAND\n");
>  		ret = -EIO;
>  		goto err;
>  
> -- 
> 1.8.3.2
> 
