Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq6vA-0008Ti-IK
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 21:32:01 +0000
Message-ID: <554A882E.5040709@broadcom.com>
Date: Wed, 6 May 2015 14:31:26 -0700
From: Florian Fainelli <fainelli@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 00/10] mtd: nand: add Broadcom NAND controller support
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/05/15 10:59, Brian Norris wrote:
> Hi,
> 
> This is version 3 of support for the Broadcom BCM7xxx Set-Top Box NAND
> controller. This controller has been used in a variety of Broadcom SoCs.
> 
> This series now adds support for a few new chips: BCM63138, and the iProc chip
> family. These add an additional 6 new patches to the original 4. If the only
> comments end up on the latter 6 patches, the first 4 might be worth merging
> independently.

This looks great, thanks!

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>

on 63138DVT:

[    0.575390] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xf1
[    0.581885] nand: Micron MT29F1G08ABADAWP
[    0.585979] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048,
OOB size: 64
[    0.593864] brcmstb_nand fffea000.nand: detected 128MiB total, 128KiB
blocks, 2KiB pages, 164
[    0.593864]
[    0.605742] Scanning device for bad blocks

> 
> Summary changelog:
> 
> v1 -> v2:
>  * add NAND to DTS for BCM7445 / BCM97445SVMB
>  * rename DT binding file to have 'brcm,' prefix
>  * catch DMA mapping errors
>  * fixup timeout / error messages (hex, remove misleading info)
>  * MODULE_LICENSE("GPL v2")
>  * fix incorrect comments
>  * print why we fail, when checking for supported controller revisions
>  * disable prefetch when using Flash DMA (see FIXME); will re-enable once we
>    get a good erased-page verification scheme merged
> 
> v2 -> v3:
>  * rebase to v4.1-rc1
>  * add SoC-specific infrastructure, to help support other SoCs:
>    - add BCM63138 support
>    - add iProc/Cygnus support
>  * disable prefetch on v6.1
> 
> Brian Norris (8):
>   mtd: nand: add common DT init code
>   Documentation: devicetree: add binding doc for Broadcom NAND
>     controller
>   mtd: nand: add NAND driver for Broadcom STB NAND controller
>   ARM: bcm7445: add NAND to DTS
>   Documentation: devicetree: brcmstb_nand: add 'brcm,nand-soc' bindings
>   mtd: brcmstb_nand: add SoC-specific support
>   mtd: brcsmtb_nand_soc: add support for BCM63138
>   ARM: bcm63138: add NAND DT support
> 
> Ray Jui (2):
>   mtd: brcsmtb_nand_soc: add iProc support
>   ARM: dts: cygnus: Enable NAND support for Cygnus
> 
>  .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  |  147 ++
>  arch/arm/boot/dts/bcm-cygnus.dtsi                  |   20 +
>  arch/arm/boot/dts/bcm63138.dtsi                    |   17 +
>  arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |   23 +
>  arch/arm/boot/dts/bcm7445.dtsi                     |   22 +
>  arch/arm/boot/dts/bcm958300k.dts                   |   16 +
>  arch/arm/boot/dts/bcm963138dvt.dts                 |   12 +
>  drivers/mtd/nand/Kconfig                           |    8 +
>  drivers/mtd/nand/Makefile                          |    2 +
>  drivers/mtd/nand/brcmnand.h                        |   56 +
>  drivers/mtd/nand/brcmstb_nand.c                    | 2263 ++++++++++++++++++++
>  drivers/mtd/nand/brcmstb_nand_soc.c                |  244 +++
>  drivers/mtd/nand/nand_base.c                       |   41 +
>  include/linux/mtd/nand.h                           |    5 +
>  14 files changed, 2876 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
>  create mode 100644 drivers/mtd/nand/brcmnand.h
>  create mode 100644 drivers/mtd/nand/brcmstb_nand.c
>  create mode 100644 drivers/mtd/nand/brcmstb_nand_soc.c
> 


-- 
Florian
