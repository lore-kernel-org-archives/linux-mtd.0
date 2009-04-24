Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxGY2-00042o-SI
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 08:14:22 +0000
Subject: Re: [PATCH] [MTD] [NAND] Add OMAP2 / OMAP3 NAND driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <49321.192.168.10.89.1239008519.squirrel@dbdmail.itg.ti.com>
References: <49321.192.168.10.89.1239008519.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Apr 2009 11:13:34 +0300
Message-Id: <1240560814.22645.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few comments of stylistic nature are below.

On Mon, 2009-04-06 at 14:31 +0530, vimal singh wrote:
> +/*
> + * drivers/mtd/nand/omap2.c
Would it be possible to remove the above?

> +#define GPMC_IRQ_STATUS		0x18
> +#define GPMC_ECC_CONFIG		0x1F4
> +#define GPMC_ECC_CONTROL	0x1F8
> +#define GPMC_ECC_SIZE_CONFIG	0x1FC
> +#define GPMC_ECC1_RESULT	0x200
> +
> +#define	DRIVER_NAME	"omap2-nand"
Are you going to change driver name often? If not, do not
define this.

> +#define	NAND_IO_SIZE	SZ_4K
Confusing variable, can you please add a comment?

> +
> +#define	NAND_WP_ON	1
> +#define	NAND_WP_OFF	0
I think these defines should be killed.

> +#define TF(value)	(value ? 1 : 0)\
Could this define be killed please?


> +
> +/*
> + * omap_nand_wp - This function enable or disable the Write Protect feature on
> + * NAND device
> + * @mtd: MTD device structure
> + * @mode: WP ON/OFF
> + */

Kerneldoc comments should start with /**

> +/*
> + * hardware specific access to control-lines
> + * NOTE: boards may use different bits for these!!
> + *
> + * ctrl:
> + * NAND_NCE: bit 0 - don't care
> + * NAND_CLE: bit 1 -> Command Latch
> + * NAND_ALE: bit 2 -> Address Latch
> + */

If you try to use kerneldoc comments, use them everywhere,
be consistent please.

Documentation/kernel-doc-nano-HOWTO.txt

Glance at all comments.

> +static int omap_verify_buf(struct mtd_info *mtd, const u_char * buf, int len)
> +{
> +	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
> +							mtd);
It is less ugly to do:

struct omap_nand_info *info;

info = container_of(mtd, struct omap_nand_info, mtd);

> +	u16 *p = (u16 *) buf;
> +
> +	len >>= 1;
> +
> +	while (len--) {
> +
> +		if (*p++ != cpu_to_le16(readw(info->nand.IO_ADDR_R)))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
Very sparse code, too many blank lines...

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
