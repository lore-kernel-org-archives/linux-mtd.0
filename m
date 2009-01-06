Message-Id: <56202C2B-2CE6-4AB3-86FC-A4FF30B41953@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Fwd: [PATCH] Set the fsl elbc ECCM according the settings in
	bootloader.
Date: Tue, 6 Jan 2009 13:38:42 -0600
References: <1228707663-26995-1-git-send-email-Jason.jin@freescale.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Begin forwarded message:

> From: Jason Jin <Jason.jin@freescale.com>
> Date: December 7, 2008 9:41:03 PM CST
> To: galak@kernel.crashing.org
> Cc: linuxppc-dev@ozlabs.org, scottwood@freescale.com, Jason Jin <Jason.jin@freescale.com 
> >
> Subject: [PATCH] Set the fsl elbc ECCM according the settings in  
> bootloader.
>
> The ECCM maybe set in bootloader, Get ECCM settings from the  
> bootloader,
> can avoid the image written by bootloader cannot read out by kernel.
>
> But the limitation of doing it this way is that, it could break  
> large page
> NAND if it is written with NAND disabled in u-boot and read with NAND
> enabled, or vice versa.
>
> Signed-off-by: Jason Jin <Jason.jin@freescale.com>
> ---
> drivers/mtd/nand/fsl_elbc_nand.c |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/ 
> fsl_elbc_nand.c
> index 4aa5bd6..65929db 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -777,7 +777,9 @@ static int fsl_elbc_chip_init(struct  
> fsl_elbc_mtd *priv)
> 	/* Fill in fsl_elbc_mtd structure */
> 	priv->mtd.priv = chip;
> 	priv->mtd.owner = THIS_MODULE;
> -	priv->fmr = 0; /* rest filled in later */
> +
> +	/* Set the ECCM according to the settings in bootloader.*/
> +	priv->fmr = in_be32(&lbc->fmr) & FMR_ECCM;
>
> 	/* fill in nand_chip structure */
> 	/* set up function call table */
> -- 
> 1.5.4

This patch seems to have gotten lost on the linuxppc-dev list.  Wanted  
to make sure you saw it (would be nice for .29) (or if you Ack I'll  
deal w/it via the powerpc tree)

- k
