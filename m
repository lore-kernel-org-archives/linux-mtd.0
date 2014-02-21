Received: from perceval.ideasonboard.com ([95.142.166.194])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGwgA-0008Aq-If
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 20:26:39 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: MTD_NAND_SH_FLCTL should depend on HAS_DMA
Date: Fri, 21 Feb 2014 21:27:27 +0100
Message-ID: <8022927.N4UoME29Ho@avalon>
In-Reply-To: <1393012474-22399-1-git-send-email-geert@linux-m68k.org>
References: <1393012474-22399-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Geert,

Thank you for the patch.

On Friday 21 February 2014 20:54:34 Geert Uytterhoeven wrote:
> If NO_DMA=y:
> 
>     drivers/built-in.o: In function `flctl_dma_fifo0_transfer':
>     sh_flctl.c:(.text+0x210398): undefined reference to `dma_map_single'
>     sh_flctl.c:(.text+0x2104b0): undefined reference to `dma_unmap_single'
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/mtd/nand/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 90ff447bf043..e7786913280a 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -458,6 +458,7 @@ config MTD_NAND_MXC
> 
>  config MTD_NAND_SH_FLCTL
>  	tristate "Support for NAND on Renesas SuperH FLCTL"
> +	depends on HAS_DMA
>  	depends on SUPERH || ARCH_SHMOBILE || COMPILE_TEST
>  	help
>  	  Several Renesas SuperH CPU has FLCTL. This option enables support

-- 
Regards,

Laurent Pinchart
