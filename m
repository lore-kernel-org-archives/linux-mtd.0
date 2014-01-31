Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9Ikh-0000ye-Gl
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 18:23:44 +0000
Received: by mail-pb0-f49.google.com with SMTP id up15so4688611pbc.22
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2014 10:23:21 -0800 (PST)
Date: Fri, 31 Jan 2014 10:23:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 4/5 fix] mtd: nand: parse out the JEDEC compliant nand
Message-ID: <20140131182317.GB10094@norris-Latitude-E6410>
References: <1388121286-32620-5-git-send-email-b32955@freescale.com>
 <1388137870-11421-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388137870-11421-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 27, 2013 at 05:51:10PM +0800, Huang Shijie wrote:
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3038,6 +3038,95 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /*
> + * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
> + */
> +static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
> +					int *busw)
> +{
...
> +	/*
> +	 * JEDEC must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> +	 * with NAND_BUSWIDTH_16
> +	 */
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		pr_err("JEDEC cannot be probed in 16-bit mode; aborting\n");
> +		return 0;
> +	}

According to the patches that recently went in for ONFI, I think we can
support x16 devices. See my comment below.

> +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
> +	for (i = 0; i < 3; i++) {
> +		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));

Rather than using read_buf(), can you run read_byte() in a loop? That
will solve our problems with x16 bus devices, I think.

> +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
> +				le16_to_cpu(p->crc))
> +			break;
> +	}
> +
...

I have yet to look closely at the JEDEC spec, so I can't comment much
more yet.

Thanks,
Brian
