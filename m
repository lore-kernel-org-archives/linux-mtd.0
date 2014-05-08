From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/22] Random ARM randconfig fixes in drivers
Date: Thu,  8 May 2014 16:46:51 +0200
Message-Id: <1399560433-1402630-1-git-send-email-arnd@arndb.de>
Cc: wsa@the-dreams.de, tony@atomide.com, linux-pci@vger.kernel.org,
 linus.walleij@linaro.org, nicolas.ferre@atmel.com, linux-ide@vger.kernel.org,
 wim@iguana.be, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, vinod.koul@intel.com,
 linux-sh@vger.kernel.org, kishon@ti.com, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, plagnioj@jcrosoft.com, ohad@wizery.com,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 broonie@kernel.org, bhelgaas@google.com, linux@arm.linux.org.uk,
 gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, balbi@ti.com, josh.wu@atmel.com,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, dwmw2@infradead.org,
 jic23@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These are a bunch of fixes I had to do to get all randconfig
configurations on ARM working. Most of these are really old
bugs, but there are also some new ones. I don't think any of
them require a backport to linux-stable.

I have checked that they are all still required on yesterday's
linux-next kernel. Please apply on the appropriate trees unless
there are objections.

Patch numbers are per subsystem, which I thought is less confusing
than numbering them 1-22 when they are all totall independent.

Arnd Bergmann (22):
  mdio_bus: fix devm_mdiobus_alloc_size export
  phy: kona2: use 'select GENERIC_PHY' in Kconfig
  phy: exynos: fix SATA phy license typo
  dmaengine: omap: hide filter_fn for built-in drivers
  dmaengine: sa11x0: remove broken #ifdef
  mtd/onenand: fix build warning for dma type
  mtd: orion-nand: fix build error with ARMv4
  clk/versatile: export symbols for impd1
  bus/omap_l3: avoid sync initcall for modules
  bus/arm-cci: add dependency on OF && CPU_V7
  watchdog: iop_wdt only builds for mach-iop13xx
  mpilib: use 'static inline' for mpi-inline.h
  ata: pata_at91 only works on sam9
  i2c/nuc900: fix ancient build error
  iio: always select ANON_INODES
  iio:adc: at91 requires the input subsystem
  pci: rcar host needs OF
  input: fix ps2/serio module dependency
  input: atmel-wm97xx: only build for AVR32
  misc: atmel_pwm: only build for supported platforms
  remoteproc: da8xx: don't select CMA on no-MMU
  regulator: arizona-ldo1: add missing #include

 drivers/ata/Kconfig               | 2 +-
 drivers/bus/Kconfig               | 2 +-
 drivers/bus/omap_l3_noc.c         | 4 ++++
 drivers/bus/omap_l3_smx.c         | 4 ++++
 drivers/clk/versatile/clk-icst.c  | 1 +
 drivers/clk/versatile/clk-impd1.c | 2 ++
 drivers/dma/sa11x0-dma.c          | 4 ----
 drivers/i2c/busses/i2c-nuc900.c   | 2 +-
 drivers/iio/Kconfig               | 1 +
 drivers/iio/adc/Kconfig           | 1 +
 drivers/input/keyboard/Kconfig    | 2 +-
 drivers/input/mouse/Kconfig       | 2 +-
 drivers/input/touchscreen/Kconfig | 2 +-
 drivers/misc/Kconfig              | 3 ++-
 drivers/mtd/nand/orion_nand.c     | 5 +++++
 drivers/mtd/onenand/samsung.c     | 8 ++++----
 drivers/net/phy/mdio_bus.c        | 2 +-
 drivers/pci/host/Kconfig          | 2 +-
 drivers/phy/Kconfig               | 2 +-
 drivers/phy/phy-exynos5250-sata.c | 2 +-
 drivers/regulator/arizona-ldo1.c  | 1 +
 drivers/remoteproc/Kconfig        | 2 +-
 drivers/watchdog/Kconfig          | 2 +-
 include/linux/omap-dma.h          | 2 +-
 lib/mpi/mpi-inline.h              | 2 +-
 lib/mpi/mpi-internal.h            | 8 --------
 26 files changed, 39 insertions(+), 31 deletions(-)

-- 
1.8.3.2

Cc: bhelgaas@google.com
Cc: dwmw2@infradead.org
Cc: dmitry.torokhov@gmail.com
Cc: balbi@ti.com
Cc: gregkh@linuxfoundation.org
Cc: plagnioj@jcrosoft.com
Cc: jic23@kernel.org
Cc: josh.wu@atmel.com
Cc: kishon@ti.com
Cc: linus.walleij@linaro.org
Cc: broonie@kernel.org
Cc: mturquette@linaro.org
Cc: nicolas.ferre@atmel.com
Cc: ohad@wizery.com
Cc: linux@arm.linux.org.uk
Cc: tony@atomide.com
Cc: vinod.koul@intel.com
Cc: wim@iguana.be
Cc: wsa@the-dreams.de
Cc: dmaengine@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-pci@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: netdev@vger.kernel.org
