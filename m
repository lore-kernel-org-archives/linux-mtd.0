Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBxCV-0004N7-QV
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 01:27:08 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so1088408pbb.33
 for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2013 18:26:46 -0700 (PDT)
Date: Tue, 20 Aug 2013 18:26:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v5 2/4] mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW
 ECC configurations in device_probe
Message-ID: <20130821012642.GC28382@ld-irv-0074.broadcom.com>
References: <1373748891-7779-1-git-send-email-pekon@ti.com>
 <1373748891-7779-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1373748891-7779-3-git-send-email-pekon@ti.com>
Cc: mugunthanvnm@ti.com, arnd@arndb.de, dedekind1@gmail.com, tony@atomide.com,
 devicetree-discuss@lists.ozlabs.org, avinashphilipk@gmail.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, olof@lixom.net, benoit.cousson@linaro.org,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 14, 2013 at 02:24:49AM +0530, Pekon Gupta wrote:
> ECC scheme on NAND devices can be implemented in multiple ways.Some using
> Software algorithm, while others using in-build Hardware engines.
> omap2-nand driver currently supports following flavours of ECC schemes.
> 
> +---------------------------------------+---------------+---------------+
> | ECC scheme                            |ECC calculation|Error detection|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_HAMMING_CODE_DEFAULT          |S/W            |S/W            |
> |OMAP_ECC_HAMMING_CODE_HW               |H/W (GPMC)     |S/W            |
> |OMAP_ECC_HAMMING_CODE_HW_ROMCODE       |H/W (GPMC)     |S/W            |
> +---------------------------------------+---------------+---------------+
> |(requires CONFIG_MTD_NAND_ECC_BCH)     |               |               |
> |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW     |H/W (GPMC)     |S/W            |
> +---------------------------------------+---------------+---------------+
> |(requires CONFIG_MTD_NAND_OMAP_BCH)    |               |               |
> |OMAP_ECC_BCH8_CODE_HW                  |H/W (GPMC)     |H/W (ELM)      |
> +---------------------------------------+---------------+---------------+
> 
> This patch
> - separates the configurations for various ECC schemes.
> - fixes dependency issues based on Kconfig options.
> - cleans up redundant code
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 505 +++++++++++++++++++++++------------------------
>  1 file changed, 249 insertions(+), 256 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index daa3dfc..ea857cc 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c

[...]

> @@ -2075,11 +2066,13 @@ out_release_mem_region:
>  		free_irq(info->gpmc_irq_fifo, info);
>  	release_mem_region(info->phys_base, info->mem_size);
>  out_free_info:
> +	omap3_free_bch(&info->mtd);
>  	kfree(info);
>  
>  	return err;
>  }
>  
> +

Extra blank line?

>  static int omap_nand_remove(struct platform_device *pdev)
>  {
>  	struct mtd_info *mtd = platform_get_drvdata(pdev);

Brian
