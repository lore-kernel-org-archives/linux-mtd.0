From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 09/15] mtd: sh_flctl: Enable driver compilation with
 COMPILE_TEST
Date: Wed, 11 Dec 2013 13:48:50 +0100
Message-ID: <3651259.U0RP9jvU5Q@avalon>
In-Reply-To: <1385515117-23664-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1385515117-23664-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1385515117-23664-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Could you please pick this patch up for v3.14 ?

On Wednesday 27 November 2013 02:18:31 Laurent Pinchart wrote:
> This helps increasing build testing coverage.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Simon Horman <horms@verge.net.au>
> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 93ae6a6..cb1f2ec 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -458,7 +458,7 @@ config MTD_NAND_MXC
> 
>  config MTD_NAND_SH_FLCTL
>  	tristate "Support for NAND on Renesas SuperH FLCTL"
> -	depends on SUPERH || ARCH_SHMOBILE
> +	depends on SUPERH || ARCH_SHMOBILE || COMPILE_TEST
>  	help
>  	  Several Renesas SuperH CPU has FLCTL. This option enables support
>  	  for NAND Flash using FLCTL.
-- 
Regards,

Laurent Pinchart
