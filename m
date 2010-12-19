Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUR8v-0003D8-3r
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 21:50:14 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 2/3] omap3 nand: cleanup virtual address usages
Date: Mon, 20 Dec 2010 10:50:10 +1300
References: <1278660308-8689-1-git-send-email-s-ghorai@ti.com>
	<1278660308-8689-2-git-send-email-s-ghorai@ti.com>
	<1278660308-8689-3-git-send-email-s-ghorai@ti.com>
In-Reply-To: <1278660308-8689-3-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012201050.10726.manningc2@actrix.gen.nz>
Cc: linux-omap@vger.kernel.org, Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 July 2010 19:25:07 Sukumar Ghorai wrote:

> +++ b/arch/arm/plat-omap/include/plat/nand.h
> @@ -21,13 +21,11 @@ struct omap_nand_platform_data {
>  	int			(*dev_ready)(struct omap_nand_platform_data *);
>  	int			dma_channel;
>  	unsigned long		phys_base;
> -	void __iomem		*gpmc_cs_baseaddr;
> -	void __iomem		*gpmc_baseaddr;
>  	int			devsize;
>  };
>
> -/* size (4 KiB) for IO mapping */
> -#define	NAND_IO_SIZE	SZ_4K
> +/* minimum size for IO mapping */
> +#define	NAND_IO_SIZE	4

Is this really only for a 4-byte region? I would have expected that this 
controls access to a multi-register NAND controller and should really be 
larger. 

-- Charles
