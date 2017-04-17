Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0Dz0-0008Ri-EZ
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 21:14:52 +0000
Received: by mail-wm0-x244.google.com with SMTP id o81so11166160wmb.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 14:14:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170417192942.32219-1-hauke@hauke-m.de>
References: <20170417192942.32219-1-hauke@hauke-m.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 17 Apr 2017 23:14:08 +0200
Message-ID: <CAFBinCCTmOh17bAc-4LbiZJrAy+mKjtC5giS3rB5asw-T8PR2g@mail.gmail.com>
Subject: Re: [PATCH 00/13] MIPS: lantiq: handle RCU register by separate
 drivers
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hauke,

On Mon, Apr 17, 2017 at 9:29 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> The RCU (Reset controller Unit) register block provides many different
> functionalities. Before they were handed by the code in arch/mips/lantiq
> /xway/reset.c, now there are separate drivers for the functionality.
> This block provides support for reset controller, GPHY firmware
> loading, USB PHY initialization and cross bar configuration.
>
> These changes are making the old device tree incompatible with the
> current kernel. The upstream Linux kernel supports loading the device
> tree blob from the boot loader since about one year, the latest
> released vendor kernel does not support loading the device tree from a
> bot loader.
great to see that you could use my work :-)

> I would prefer if this would go through the mips tree.
> There are more patches planed which would convert the Lantiq code
> to the common clock framework.
>
> Hauke Mehrtens (4):
>   mtd: lantiq-flash: drop check of boot select
>   mtd: spi-falcon: drop check of boot select
>   watchdog: lantiq: access boot cause register through regmap
>   MIPS: lantiq: remove old GPHY loader code
>
> Martin Blumenstingl (9):
>   MIPS: lantiq: Use of_platform_populate instead of __dt_register_buses
>   MIPS: lantiq: Enable MFD_SYSCON to be able to use it for the RCU MFD
>   MIPS: lantiq: Convert the xbar driver to a platform_driver
>   MIPS: lantiq: remove ltq_reset_cause() and ltq_boot_select()
>   reset: Add a reset controller driver for the Lantiq XWAY based SoCs
>   MIPS: lantiq: Add a GPHY driver which uses the RCU syscon-mfd
>   phy: Add an USB PHY driver for the Lantiq SoCs using the RCU module
>   Documentation: DT: MIPS: lantiq: Add docs for the RCU bindings
>   MIPS: lantiq: Remove the arch/mips/lantiq/xway/reset.c implementation
if anyone is wondering:
I started porting the lantiq target to the common clock framework
"some" time ago. unfortunately it turned out that some of the
"drivers" are tightly coupled and one cannot simply port the clock
handling to the common clock framework. so I started tackling more
drivers in arch/mips/lantiq/ until I had a huge pile of patches in my
tree but no time to improve them so they were ready to submit. so the
patches from Hauke are roughly based on the ideas of my patches (and
probably a few lines of code here and there).


>  .../devicetree/bindings/mips/lantiq/rcu-gphy.txt   |  54 +++
>  .../devicetree/bindings/mips/lantiq/rcu.txt        |  82 +++++
>  .../devicetree/bindings/mips/lantiq/xbar.txt       |  22 ++
>  .../bindings/phy/phy-lantiq-rcu-usb2.txt           |  59 ++++
>  .../devicetree/bindings/reset/lantiq,rcu-reset.txt |  43 +++
>  MAINTAINERS                                        |   1 +
>  arch/mips/include/asm/mach-lantiq/lantiq.h         |   4 -
>  arch/mips/lantiq/Kconfig                           |   2 +
>  arch/mips/lantiq/falcon/reset.c                    |  22 --
>  arch/mips/lantiq/prom.c                            |   3 +-
>  arch/mips/lantiq/xway/Makefile                     |   4 +-
>  arch/mips/lantiq/xway/reset.c                      | 387 ---------------------
>  arch/mips/lantiq/xway/sysctrl.c                    |  69 +---
>  arch/mips/lantiq/xway/xrx200_phy_fw.c              | 113 ------
>  drivers/mtd/maps/lantiq-flash.c                    |   6 -
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-lantiq-rcu-usb2.c                  | 325 +++++++++++++++++
>  drivers/reset/Kconfig                              |   6 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-lantiq-rcu.c                   | 231 ++++++++++++
>  drivers/soc/Makefile                               |   1 +
>  drivers/soc/lantiq/Makefile                        |   2 +
>  drivers/soc/lantiq/gphy.c                          | 242 +++++++++++++
>  drivers/soc/lantiq/xbar.c                          | 100 ++++++
>  drivers/spi/spi-falcon.c                           |   5 -
>  drivers/watchdog/lantiq_wdt.c                      |  47 ++-
>  include/dt-bindings/mips/lantiq_rcu_gphy.h         |  15 +
>  28 files changed, 1255 insertions(+), 600 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/rcu-gphy.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/rcu.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/xbar.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt
>  create mode 100644 Documentation/devicetree/bindings/reset/lantiq,rcu-reset.txt
>  delete mode 100644 arch/mips/lantiq/xway/reset.c
>  delete mode 100644 arch/mips/lantiq/xway/xrx200_phy_fw.c
>  create mode 100644 drivers/phy/phy-lantiq-rcu-usb2.c
>  create mode 100644 drivers/reset/reset-lantiq-rcu.c
>  create mode 100644 drivers/soc/lantiq/Makefile
>  create mode 100644 drivers/soc/lantiq/gphy.c
>  create mode 100644 drivers/soc/lantiq/xbar.c
>  create mode 100644 include/dt-bindings/mips/lantiq_rcu_gphy.h
>
> --
> 2.11.0
>
