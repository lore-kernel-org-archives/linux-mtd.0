Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYrEc-0005oK-1A
 for linux-mtd@lists.infradead.org; Sun, 14 Aug 2016 08:57:34 +0000
Date: Sun, 14 Aug 2016 10:57:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Kconfig: nand: Make MTD_NAND_FSL_ELBC depend on FSL_SOC
Message-ID: <20160814105701.2a0d8afe@bbrezillon>
In-Reply-To: <1469138361-14173-1-git-send-email-andrew.smirnov@gmail.com>
References: <1469138361-14173-1-git-send-email-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 Jul 2016 14:59:18 -0700
Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> MTD_NAND_FSL_ELBC selects FSL_LBC that in turn depends on FSL_SOC, so
> depending on PPC instead of FSL_SOC leads to this message:
> 
> 	  warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC &&
> 	  MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct
> 	  dependencies (FSL_SOC)
> 
> when doing
> 
> 	  make ARCH=powerpc \
> 	       CROSS_COMPILE=powerpc-e500v2-linux-gnuspe- \
> 	       allmodconfig"
> 
> Changing dependency to FSL_SOC fixes that.

Applied the whole series.

Thanks,

Boris

> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index bcb519b..e528747 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -426,7 +426,7 @@ config MTD_NAND_ORION
>  
>  config MTD_NAND_FSL_ELBC
>  	tristate "NAND support for Freescale eLBC controllers"
> -	depends on PPC
> +	depends on FSL_SOC
>  	select FSL_LBC
>  	help
>  	  Various Freescale chips, including the 8313, include a NAND Flash
