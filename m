Subject: Re: [PATCH] - NAND - Samsung LP nand feature support - nand_base.c
	upated
From: David Woodhouse <dwmw2@infradead.org>
To: Sameer <x0081444@ti.com>
In-Reply-To: <00ed01c84ee5$b4928e40$ec8818ac@ent.ti.com>
References: <00ed01c84ee5$b4928e40$ec8818ac@ent.ti.com>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 16:09:32 +0100
Message-Id: <1208876972.9212.611.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-01-04 at 20:53 +0530, Sameer wrote:
> Hi,
> This patch add the Large page NAND feature support for Samsung nand flash.
> 
> Regards,
> -Sameer
> 
> 
> Signed-off-by: Sameer U <sameersu@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c |    4 ++++
>  1 files changed, 4 insertions(+)
> 
> Index: linux-omap-git/drivers/mtd/nand/nand_base.c
> ===================================================================
> --- linux-omap-git.orig/drivers/mtd/nand/nand_base.c
> +++ linux-omap-git/drivers/mtd/nand/nand_base.c
> @@ -2322,6 +2322,10 @@ static struct nand_flash_dev *nand_get_f
> 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
> 	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
> 
> +	/* adding feature support for large page samsung nand */
> +	if ((*maf_id == NAND_MFR_SAMSUNG) && (mtd->writesize > 512))
> +		chip->options |= NAND_SAMSUNG_LP_OPTIONS;
> +

This doesn't seem to make sense. These chips have the options bit set in
the ID table by default, and we mask them _out_ for non-Samsung chips.

Which chip are you using, and why isn't it working as intended?

-- 
dwmw2
