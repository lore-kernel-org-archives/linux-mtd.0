Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbJDH-0007Sn-Mt
 for linux-mtd@lists.infradead.org; Sat, 19 Apr 2014 00:33:00 +0000
Received: by mail-qg0-f45.google.com with SMTP id a108so2223397qge.32
 for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2014 17:32:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1397719309-2022-4-git-send-email-computersforpeace@gmail.com>
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
 <1397719309-2022-4-git-send-email-computersforpeace@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 18 Apr 2014 17:24:06 -0700
Message-ID: <CAGVrzcZLUgpZZKAHjPSWaBs6w1XoegLaoWUAaMYUD9zW9yzq0w@mail.gmail.com>
Subject: Re: [PATCH 3/5] mips: defconfigs: add MTD_SPI_NOR (new dependency for
 M25P80)
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Linux-MIPS <linux-mips@linux-mips.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-04-17 0:21 GMT-07:00 Brian Norris <computersforpeace@gmail.com>:
> These defconfigs contain the CONFIG_M25P80 symbol, which is now
> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to the
> relevant defconfigs.

so CONFIG_M25P80 should select CONFIG_MTD_SPI_NOR, right? in that
case, I do not think this is needed at all, as it would be
automatically picked up during the build and if someone refreshes the
defconfigs, although it cannot hurt.

>
> At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Cc: linux-kernel@vger.kernel.org
> ---
> This change is based on l2-mtd.git/spinor, which is based on 3.15-rc1:
>
>   git://git.infradead.org/l2-mtd.git +spinor
>
>  arch/mips/configs/ath79_defconfig  | 3 +--
>  arch/mips/configs/db1xxx_defconfig | 1 +
>  arch/mips/configs/rt305x_defconfig | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
> index e3a3836508ec..134879c1310a 100644
> --- a/arch/mips/configs/ath79_defconfig
> +++ b/arch/mips/configs/ath79_defconfig
> @@ -46,7 +46,6 @@ CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-2
>  CONFIG_MTD_CMDLINE_PARTS=y
> -CONFIG_MTD_CHAR=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
>  CONFIG_MTD_JEDECPROBE=y
> @@ -54,7 +53,7 @@ CONFIG_MTD_CFI_AMDSTD=y
>  CONFIG_MTD_COMPLEX_MAPPINGS=y
>  CONFIG_MTD_PHYSMAP=y
>  CONFIG_MTD_M25P80=y
> -# CONFIG_M25PXX_USE_FAST_READ is not set
> +CONFIG_MTD_SPI_NOR=y
>  CONFIG_NETDEVICES=y
>  # CONFIG_NET_PACKET_ENGINE is not set
>  CONFIG_ATH_COMMON=m
> diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
> index c99b6eeda90b..a64b30b96a0d 100644
> --- a/arch/mips/configs/db1xxx_defconfig
> +++ b/arch/mips/configs/db1xxx_defconfig
> @@ -113,6 +113,7 @@ CONFIG_MTD_NAND=y
>  CONFIG_MTD_NAND_ECC_BCH=y
>  CONFIG_MTD_NAND_AU1550=y
>  CONFIG_MTD_NAND_PLATFORM=y
> +CONFIG_MTD_SPI_NOR=y
>  CONFIG_EEPROM_AT24=y
>  CONFIG_EEPROM_AT25=y
>  CONFIG_SCSI_TGT=y
> diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
> index d1741bcf8949..d14ae2fa7d13 100644
> --- a/arch/mips/configs/rt305x_defconfig
> +++ b/arch/mips/configs/rt305x_defconfig
> @@ -81,7 +81,6 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_FIRMWARE_IN_KERNEL is not set
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
> -CONFIG_MTD_CHAR=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
>  CONFIG_MTD_CFI_AMDSTD=y
> @@ -89,6 +88,7 @@ CONFIG_MTD_COMPLEX_MAPPINGS=y
>  CONFIG_MTD_PHYSMAP=y
>  CONFIG_MTD_PHYSMAP_OF=y
>  CONFIG_MTD_M25P80=y
> +CONFIG_MTD_SPI_NOR=y
>  CONFIG_EEPROM_93CX6=m
>  CONFIG_SCSI=y
>  CONFIG_BLK_DEV_SD=y
> --
> 1.8.3.2
>
>



-- 
Florian
