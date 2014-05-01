Message-ID: <53628282.10201@antcom.de>
Date: Thu, 01 May 2014 19:21:06 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 05/12] ARM: lpc32xx: add MTD_SPI_NOR (new dependency
 for M25P80)
References: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
 <1398925607-7482-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1398925607-7482-6-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/05/14 08:26, Brian Norris wrote:
> This defconfig contains the CONFIG_M25P80 symbol, which is now
> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to satisfy
> the new dependency.

Can't the CONFIG_M25P80 declare its dependency on CONFIG_MTD_SPI_NOR
itself, or put CONFIG_M25P80 etc. into a submenu under CONFIG_MTD_SPI_NOR?

> 
> At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Roland Stigge <stigge@antcom.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/configs/lpc32xx_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
> index 398a367ffce8..2de54c35fb47 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -53,12 +53,12 @@ CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
> -CONFIG_MTD_CHAR=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_M25P80=y
>  CONFIG_MTD_NAND=y
>  CONFIG_MTD_NAND_SLC_LPC32XX=y
>  CONFIG_MTD_NAND_MLC_LPC32XX=y
> +CONFIG_MTD_SPI_NOR=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_CRYPTOLOOP=y
>  CONFIG_BLK_DEV_RAM=y
> 
