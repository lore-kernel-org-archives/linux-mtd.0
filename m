Date: Wed, 1 Apr 2015 08:58:05 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Message-ID: <1162655988.11370.1427896685060.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1426245828-15640-1-git-send-email-hofrat@osadl.org>
References: <1426245828-15640-1-git-send-email-hofrat@osadl.org>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: use msecs_to_jiffies for time
 conversion
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 Joe Schultz <jschultz@xes-inc.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message -----
> From: "Nicholas Mc Guire" <hofrat@osadl.org>
> Sent: Friday, March 13, 2015 6:23:47 AM
> 
> This is only an API consolidation and should make things more readable
> it replaces var * HZ / 1000 by msecs_to_jiffies(var) which helps readability
> and also handles all corner-cases properly.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> Patch was compile tested with corenet64_smp_defconfig
> (implies CONFIG_MTD_NAND_FSL_IFC=y)
> 
> Patch is against 4.0-rc3 (localversion-next is -next-20150313
> 
>  drivers/mtd/nand/fsl_ifc_nand.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c
> b/drivers/mtd/nand/fsl_ifc_nand.c
> index 4c05f4f..51394e5 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -317,7 +317,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  
>  	/* wait for command complete flag or timeout */
>  	wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
> -			   IFC_TIMEOUT_MSECS * HZ/1000);
> +			   msecs_to_jiffies(IFC_TIMEOUT_MSECS));

Nicholas,
Your patch makes me think that this timeout value should be calculated
once during initialization and stored in a new member of
struct fsl_ifc_mtd. That would improve readability AND have some
positive impact on performance.

-Aaron S.

>  
>  	/* ctrl->nand_stat will be updated from IRQ context */
>  	if (!ctrl->nand_stat)
> @@ -860,7 +860,7 @@ static void fsl_ifc_sram_init(struct fsl_ifc_mtd *priv)
>  
>  	/* wait for command complete flag or timeout */
>  	wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
> -			   IFC_TIMEOUT_MSECS * HZ/1000);
> +			   msecs_to_jiffies(IFC_TIMEOUT_MSECS));
>  
>  	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
>  		printk(KERN_ERR "fsl-ifc: Failed to Initialise SRAM\n");
> --
> 1.7.10.4
> 
> 
