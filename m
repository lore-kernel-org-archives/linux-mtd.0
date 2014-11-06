Date: Thu, 6 Nov 2014 10:03:33 -0800
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] mtd: nand: omap: Fix NAND enumeration on 3430 LDP
Message-ID: <20141106180333.GZ31454@atomide.com>
References: <1415185258-11747-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415185258-11747-1-git-send-email-rogerq@ti.com>
Cc: computersforpeace@gmail.com, stable@vger.kernel.org, pekon@pek-sem.com,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [141105 03:02]:
> In commit 7d5929c1f343 ("mtd: nand: omap: Revert to using software ECC by default"),
> we switched back to using 1-bit SW ECC scheme by default. However
> commit b491da7233d5 ("mtd: nand: omap: clean-up ecc layout for BCH ecc schemes")
> didn't take into account the 1-bit SW scheme (i.e. OMAP_ECC_HAM1_CODE_SW)
> when checking for small page devices because it was already got rid of
> one commit earlier. Consider OMAP_ECC_HAM1_CODE_SW while deciding
> if we can proceed with small page devices or not.
> 
> Fixes: 7d5929c1f34 ("mtd: nand: omap: Revert to using software ECC by default")
> 
> Cc: <stable@vger.kernel.org>        [3.17+]
> Reported-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 3b357e9..758e594 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1742,7 +1742,8 @@ static int omap_nand_probe(struct platform_device *pdev)
>  	}
>  
>  	/* check for small page devices */
> -	if ((mtd->oobsize < 64) && (pdata->ecc_opt != OMAP_ECC_HAM1_CODE_HW)) {
> +	if ((mtd->oobsize < 64) && (pdata->ecc_opt != OMAP_ECC_HAM1_CODE_HW) &&
> +	    (pdata->ecc_opt != OMAP_ECC_HAM1_CODE_SW)) {
>  		dev_err(&info->pdev->dev, "small page devices are not supported\n");
>  		err = -EINVAL;
>  		goto return_error;

Should this maybe have || instead of && For the OMAP_ECC_HAM1_CODE_SW?

With this patch applied on top of the other pending fixes, I still
get:

nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xba
nand: Micron MT29F2G16ABD
nand: 128MiB, SLC, page size: 1024, OOB size: 32
omap2-nand omap2-nand.0: small page devices are not supported
omap2-nand: probe of omap2-nand.0 failed with error -22

Regards,

Tony
