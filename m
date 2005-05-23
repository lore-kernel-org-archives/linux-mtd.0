Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DaAoi-0007ap-OL
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 07:09:54 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
In-Reply-To: <Pine.LNX.4.61.0505230940590.25999@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230940590.25999@kukac.halom.u-szeged.hu>
Content-Type: text/plain
Date: Mon, 23 May 2005 15:09:19 +0400
Message-Id: <1116846559.16577.18.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][03/03] nandsim own geometry
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> diff -Naur mtd-work2/drivers/mtd/nand/nand_ids.c mtd-work3/drivers/mtd/nand/nand_ids.c
> --- mtd-work2/drivers/mtd/nand/nand_ids.c	2005-02-16 10:33:27.000000000 +0100
> +++ mtd-work3/drivers/mtd/nand/nand_ids.c	2005-05-23 08:36:57.000000000 +0200
> @@ -103,6 +103,35 @@
>   	 */
>   	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000, NAND_IS_AND | NAND_NO_AUTOINCR | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},
> 
> +#ifdef CONFIG_MTD_NAND_GEOM
> +#  ifdef CONFIG_MTD_NAND_NANDSIM_8BIT_BUS
> +#    define CONFIG_MTD_NAND_NANDSIM_BUSWIDTH 0
> +#  elif defined(CONFIG_MTD_NAND_NANDSIM_16BIT_BUS)
> +#    define CONFIG_MTD_NAND_NANDSIM_BUSWIDTH NAND_BUSWIDTH_16
> +#  endif
> +#  ifdef CONFIG_MTD_NAND_NANDSIM_OLD
> +#    ifdef CONFIG_MTD_NAND_NANDSIM_256B_PAGE
> +#      define CONFIG_MTD_NAND_NANDSIM_PAGESIZE 256
> +#    elif defined(CONFIG_MTD_NAND_NANDSIM_512B_PAGE)
> +#      define CONFIG_MTD_NAND_NANDSIM_PAGESIZE 512
> +#    endif
> +#    ifdef CONFIG_MTD_NAND_NANDSIM_4KB_ERASE
> +#      define CONFIG_MTD_NAND_NANDSIM_EBSIZE 4096
> +#    elif defined(CONFIG_MTD_NAND_NANDSIM_8KB_ERASE)
> +#      define CONFIG_MTD_NAND_NANDSIM_EBSIZE 8192
> +#    elif defined(CONFIG_MTD_NAND_NANDSIM_16KB_ERASE)
> +#      define CONFIG_MTD_NAND_NANDSIM_EBSIZE 16384
> +#    endif
> +
> +   {"NANDSIM (old)",               CONFIG_MTD_NAND_NANDSIM_ID, CONFIG_MTD_NAND_NANDSIM_PAGESIZE, CONFIG_MTD_NAND_NANDSIM_CHIPSIZE, CONFIG_MTD_NAND_NANDSIM_EBSIZE, CONFIG_MTD_NAND_NANDSIM_BUSWIDTH},
> +
> +#  elif defined(CONFIG_MTD_NAND_NANDSIM_NEW)
> +
> +   {"NANDSIM (new)",               CONFIG_MTD_NAND_NANDSIM_ID, 0, CONFIG_MTD_NAND_NANDSIM_CHIPSIZE, 0, CONFIG_MTD_NAND_NANDSIM_BUSWIDTH},
> +
> +#  endif
> +#endif
> +
>   	{NULL,}
>   };
Patrik,

is it possible to avoid such a changes in nand_ids.c ?
AFAICS, your patch assumes that one should recompile nand_ids when
nandsim configuration has been changed. It shouldn't be so I think.


I'd better do:
1. initialize all the needed fields in 'struct mtd_info' and 'struct
nand_chip' in case of a custom chip in _nandsim_.
2. Introduce some special option (say, NAND_SKIP_READ_ID for this-
>options) which tells nand_scan not to read NAND chip's ID.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
