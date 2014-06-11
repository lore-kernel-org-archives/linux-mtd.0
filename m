Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wuh4x-0006WI-5H
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 11:52:33 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi2so5286964wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2014 04:52:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1402477001-31132-1-git-send-email-rogerq@ti.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
Date: Wed, 11 Jun 2014 13:52:07 +0200
Message-ID: <CABxcv=mMAnnjd=F7itDWCt5QpVr=U5_mP=xhCW-oB5c2Doo75w@mail.gmail.com>
Subject: Re: [PATCH 00/36] OMAP: GPMC: Restructure and move OMAP GPMC driver
 out of mach-omap2
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, nsekhar@ti.com,
 Linux Kernel <linux-kernel@vger.kernel.org>, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, "Gupta, Pekon" <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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

Hello Roger,

What a great series!!

On Wed, Jun 11, 2014 at 10:56 AM, Roger Quadros <rogerq@ti.com> wrote:
> Hi,
>
> This is a complete functional set to get the gpmc driver out of mach-omap2
> and into drivers/memory. The DT binding remains the same except for the
> following minor changes

I probably won't have time to do a proper review until at least next
week but doing a quick glance it looks very good to me.

> - compatible property is required for NAND & OneNAND nodes

This is a minor ABI breakage but I agree with you that it is wrong
that these were not introduced in the first place and relied on the
dev node so I think is not that bad to break it in this case.

> - Second register space and interrupts properties are required for
>   NAND controller node
> - ti,onenand-sync-rw property added for OneNAND node.
>
> The series does the following changes
> - Move GPMC IRQ and NAND register handling to NAND driver.
>   The entire GPMC register space is made available to the NAND driver.
> - Clean up NAND device tree handling. Don't rely on legacy platform device
>   i.e. don't call gpmc_nand_init()
> - Add 2 public APIs omap_gpmc_retime() and omap_gpmc_get_clk_period()
>   omap_gpmc_retime() allows to reconfigure the GPMC settings and timings
>   for the specified Chip select region.
>   omap_gpmc_get_clk_period() allows to query the GPMC_CLK (external clock)
>   period, to perform timing calculations.
>   Both functions will be needed by the OneNAND driver since it calculates
>   device timings on the fly and needs to change from Asynchronous mode
>   to Synchronous mode.
> - Setup OneNAND in Asynchronous mode by default and move Synchronous
>   setting code into OneNAND driver.
> - Clean up OneNAND device tree handling. Don't rely on legacy platform device
>   i.e. don't call gpmc_onenand_init()
> - Introduce gpmc_generic_init() that should be used by board files to specify
>   GPMC chip select setting/timing and platform device within that Chip Select.
> - Stop using all gpmc*() that are meant to be private to GPMC driver.
> - Move GPMC driver into drivers/memory
>
> Tested on:
>
> - beagleboard C4: NAND
> - Nokia N900: OneNAND
>

Do you have a tree somewhere that I can use it to test on the boards I
maintain and post patches to update the DTS according the new binding?

> Changelog:
>
> [1] RFC patch - https://lkml.org/lkml/2014/5/21/218
>
> cheers,
> -roger
>
> ---
> Roger Quadros (36):
>   ARM: OMAP3: hwmod: Fix gpmc memory resource space
>   ARM: dts: OMAP2+: Fix GPMC register space size
>   ARM: OMAP2+: gpmc: Add platform data
>   ARM: OMAP2+: gpmc: Add gpmc timings and settings to platform data
>   mtd: nand: omap: Move IRQ handling from GPMC to NAND driver
>   mtd: nand: omap: Move gpmc_update_nand_reg to nand driver
>   mtd: nand: omap: Move NAND write protect code from GPMC to NAND driver
>   mtd: nand: omap: Copy platform data parameters to omap_nand_info data
>   mtd: nand: omap: Clean up device tree support
>   ARM: dts: OMAP2+: Fix NAND device nodes
>   mtd: nand: omap: Update DT binding documentation
>   ARM: dts: omap3-beagle: Add NAND device
>   ARM: OMAP2+: gpmc.c: sanity check bank-width DT property
>   ARM: OMAP2+: gpmc: Allow drivers to reconfigure GPMC settings &
>     timings
>   ARM: OMAP2+: gpmc: Allow drivers to query GPMC_CLK period
>   mtd: onenand: omap: Remove regulator management code
>   ARM: OMAP2+: gpmc-onenand: Use Async settings/timings by default
>   ARM: OMAP2+: gpmc-onenand: Move Synchronous setting code to drivers/
>   mtd: onenand: omap: Use devres managed resources
>   mtd: onenand: omap: Clean up device tree support
>   ARM: dts: OMAP2+: Fix OneNAND device nodes
>   ARM: OMAP2+: gmpc: add gpmc_generic_init()
>   ARM: OMAP2+: gpmc: use platform data to configure CS space and
>     poplulate device
>   ARM: OMAP2+: gpmc: add NAND specific setup
>   ARM: OMAP2+: gpmc: Support multiple Chip Selects per device
>   ARM: OMAP2+: gpmc-smc91x: Get rid of retime() from
>     omap_smc91x_platform_data
>   ARM: OMAP2+: usb-tusb6010: Use omap_gpmc_retime()
>   ARM: OMAP2+: nand: Update gpmc_nand_init() to use generic_gpmc_init()
>   ARM: OMAP2+: gpmc-smc91x: Use gpmc_generic_init()
>   ARM: OMAP2+: gpmc-smsc911x: Use gpmc_generic_init()
>   ARM: OMAP2: usb-tusb6010: Use gpmc_generic_init()
>   ARM: OMAP2+: onenand: Use gpmc_generic_init()
>   ARM: OMAP2+: board-flash: Use gpmc_generic_init() for NOR
>   ARM: OMAP2+: gpmc: Make externally unused functions/defines private
>   ARM: OMAP2+: gpmc: move GPMC driver into drivers/memory
>   ARM: OMAP2+: defconfig: Enable TI GPMC driver
>
>  .../devicetree/bindings/mtd/gpmc-nand.txt          |   16 +-
>  .../devicetree/bindings/mtd/gpmc-onenand.txt       |    4 +
>  arch/arm/boot/dts/am335x-evm.dts                   |    8 +-
>  arch/arm/boot/dts/am335x-igep0033.dtsi             |    8 +-
>  arch/arm/boot/dts/am33xx.dtsi                      |    2 +-
>  arch/arm/boot/dts/am4372.dtsi                      |    2 +-
>  arch/arm/boot/dts/am43x-epos-evm.dts               |    8 +-
>  arch/arm/boot/dts/omap2420-n8x0-common.dtsi        |    5 +-
>  arch/arm/boot/dts/omap2420.dtsi                    |    2 +-
>  arch/arm/boot/dts/omap2430.dtsi                    |    2 +-
>  arch/arm/boot/dts/omap3-beagle.dts                 |   53 +
>  arch/arm/boot/dts/omap3-devkit8000.dts             |    9 +-
>  arch/arm/boot/dts/omap3-evm-37xx.dts               |   10 +-
>  arch/arm/boot/dts/omap3-igep0020.dts               |   10 +-
>  arch/arm/boot/dts/omap3-igep0030.dts               |    8 +-
>  arch/arm/boot/dts/omap3-ldp.dts                    |   10 +-
>  arch/arm/boot/dts/omap3-lilly-a83x.dtsi            |   10 +-
>  arch/arm/boot/dts/omap3-lilly-dbb056.dts           |    7 +-
>  arch/arm/boot/dts/omap3-n900.dts                   |    6 +-
>  arch/arm/boot/dts/omap3-n950-n9.dtsi               |    6 +-
>  arch/arm/boot/dts/omap3.dtsi                       |    2 +-
>  arch/arm/boot/dts/omap3430-sdp.dts                 |   14 +-
>  arch/arm/boot/dts/omap4.dtsi                       |    2 +-
>  arch/arm/boot/dts/omap5.dtsi                       |    2 +-
>  arch/arm/configs/omap2plus_defconfig               |    2 +
>  arch/arm/mach-omap2/Makefile                       |    2 +-
>  arch/arm/mach-omap2/board-3430sdp.c                |    8 +-
>  arch/arm/mach-omap2/board-flash.c                  |   28 +-
>  arch/arm/mach-omap2/gpmc-nand.c                    |   66 +-
>  arch/arm/mach-omap2/gpmc-onenand.c                 |  351 +---
>  arch/arm/mach-omap2/gpmc-smc91x.c                  |   91 +-
>  arch/arm/mach-omap2/gpmc-smc91x.h                  |    1 -
>  arch/arm/mach-omap2/gpmc-smsc911x.c                |   76 +-
>  arch/arm/mach-omap2/gpmc.c                         | 1872 --------------------
>  arch/arm/mach-omap2/gpmc.h                         |  221 +--
>  arch/arm/mach-omap2/gpmc_legacy.c                  |  296 ++++
>  arch/arm/mach-omap2/omap_hwmod_3xxx_data.c         |    2 +-
>  arch/arm/mach-omap2/usb-tusb6010.c                 |  172 +-
>  drivers/memory/Kconfig                             |   10 +
>  drivers/memory/Makefile                            |    1 +
>  drivers/memory/ti-gpmc.c                           | 1829 +++++++++++++++++++
>  drivers/mtd/nand/Kconfig                           |    2 +-
>  drivers/mtd/nand/omap2.c                           |  364 +++-
>  drivers/mtd/onenand/Kconfig                        |    6 +-
>  drivers/mtd/onenand/omap2.c                        |  456 +++--
>  include/linux/platform_data/gpmc-omap.h            |  189 ++
>  include/linux/platform_data/mtd-nand-omap2.h       |   10 +-
>  include/linux/platform_data/mtd-onenand-omap2.h    |    7 +-
>  48 files changed, 3361 insertions(+), 2907 deletions(-)
>  delete mode 100644 arch/arm/mach-omap2/gpmc.c
>  create mode 100644 arch/arm/mach-omap2/gpmc_legacy.c
>  create mode 100644 drivers/memory/ti-gpmc.c
>  create mode 100644 include/linux/platform_data/gpmc-omap.h
>
> --
> 1.8.3.2
>

Best regards,
Javier
