Date: Mon, 6 Jul 2015 14:01:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: arm@kernel.org, zajec5@gmail.com, hauke@hauke-m.de, nbd@openwrt.org,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 jdzheng@broadcom.com, sbranden@broadcom.com, jonathar@broadcom.com,
 rjui@broadcom.com, gregory.0xf0@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: BCM: Do not select CONFIG_MTD_NAND_BRCMNAND
Message-ID: <20150706210106.GA18370@brian-ubuntu>
References: <1435422344-31059-1-git-send-email-f.fainelli@gmail.com>
 <1435422344-31059-2-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435422344-31059-2-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 27, 2015 at 09:25:43AM -0700, Florian Fainelli wrote:
> This reverts 7dc95b40f599293aedf30432749ad25b51549041 ("ARM: BCM: Enable
> NAND support for iProc SoCs") since it creates an unmet dependency for
> MTD_NAND_BRCMNAND which depends on MTD and MTD_NAND, this results in the
> following build failure for brcmnand:
> 
>  LD      init/built-in.o
> drivers/built-in.o: In function `brcmnand_remove':
> /home/fainelli/dev/linux/drivers/mtd/nand/brcmnand/brcmnand.c:2234:
> undefined reference to `nand_release'
> drivers/built-in.o: In function `brcmnand_init_cs':
> /home/fainelli/dev/linux/drivers/mtd/nand/brcmnand/brcmnand.c:1933:
> undefined reference to `nand_scan_ident'
> /home/fainelli/dev/linux/drivers/mtd/nand/brcmnand/brcmnand.c:1958:
> undefined reference to `nand_scan_tail'
> Makefile:931: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
> 
> Instead, select this driver an all dependencies on the
> multi_v7_defconfig.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

FWIW (I've been a bit disconnected this last week):

Acked-by: Brian Norris <computersforpeace@gmail.com>

Drivers should not be select-ed like this. Thanks for the patch.

> ---
>  arch/arm/mach-bcm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index e9184feffc4e..0ac9e4b3b265 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -19,7 +19,6 @@ config ARCH_BCM_IPROC
>  	select ARCH_REQUIRE_GPIOLIB
>  	select ARM_AMBA
>  	select PINCTRL
> -	select MTD_NAND_BRCMNAND
>  	help
>  	  This enables support for systems based on Broadcom IPROC architected SoCs.
>  	  The IPROC complex contains one or more ARM CPUs along with common
