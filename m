Date: Mon, 26 Oct 2015 11:34:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, robert.jarzmik@free.fr, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mtd: nand: allow compile test of MTD_NAND_PXA3xx
Message-ID: <20151026183407.GB13239@google.com>
References: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
 <1445416144-9194-3-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445416144-9194-3-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 21, 2015 at 10:29:01AM +0200, Antoine Tenart wrote:
> Allow compile test of the MTD_NAND_PXA3xx nand driver.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 289664089cf3..554aff7b2f8b 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -329,7 +329,7 @@ config MTD_NAND_ATMEL
>  
>  config MTD_NAND_PXA3xx
>  	tristate "NAND support on PXA3xx and Armada 370/XP"
> -	depends on PXA3xx || ARCH_MMP || PLAT_ORION
> +	depends on PXA3xx || ARCH_MMP || PLAT_ORION || COMPILE_TEST

You need at least a dependency on HAS_IOMEM. I'll drop this patch for
now, as it's unrelated. Feel free to send another revision.

Brian

>  	help
>  	  This enables the driver for the NAND flash device found on
>  	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
> -- 
> 2.6.2
> 
