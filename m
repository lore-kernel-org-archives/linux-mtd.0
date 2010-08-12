Date: Thu, 12 Aug 2010 08:42:38 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] nand: fix .correct callback return value check
Message-ID: <20100812054237.GB13166@jasper.tkos.co.il>
References: <20100808204341.GA20065@pengutronix.de>
	<ca767a0d6cafbea862c307e944c2b800dafb6660.1281327492.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca767a0d6cafbea862c307e944c2b800dafb6660.1281327492.git.baruch@tkos.co.il>
Cc: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi linux-mtd list,

Ping?

At least the atmel_nand and the bf5xx_nand drivers may return -EIO for 
uncorrectable errors, so this patch fixes a real bug.

baruch

On Mon, Aug 09, 2010 at 07:20:23AM +0300, Baruch Siach wrote:
> Drivers may (and do) return negative errno values other than -1 from the
> .correct callback.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4a7b864..080f551 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1210,7 +1210,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
>  		int stat;
>  
>  		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
> -		if (stat == -1)
> +		if (stat < 0)
>  			mtd->ecc_stats.failed++;
>  		else
>  			mtd->ecc_stats.corrected += stat;
> -- 
> 1.7.1

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
