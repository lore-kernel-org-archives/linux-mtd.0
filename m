From: Philip Avinash <avinashphilip@ti.com>
To: <khilman@ti.com>, <tony@atomide.com>, <linux@arm.linux.org.uk>,
 <dwmw2@infradead.org>
Subject: [PATCH 0/4] LOW power sleep support for OMAP nand driver
Date: Wed, 23 Jan 2013 14:56:12 +0530
Message-ID: <1358933176-12409-1-git-send-email-avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: afzal@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 gururaja.hebbar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series adds low power transition support for OMAP NAND driver.
This includes low power transition support of
- GPMC module
- ELM module
- OMAP2 NAND driver

Low power transition support tested on am335x-evm with NAND flash support.
This patch series based on [1] and depends on [2] and is available [2]

1. ARM: OMAP2+: AM33XX: Add suspend-resume support
   http://comments.gmane.org/gmane.linux.ports.arm.omap/91405
2. https://github.com/avinashphilip/am335x_linux/commits/NAND_supend_resume_support

Philip Avinash (4):
  arch: arm: gpmc: gpmc migration support
  mtd: devices: elm: Low power transition support
  arm: gpmc: Low power transition support
  mtd: nand: omap2: Low power transition support

 arch/arm/mach-omap2/gpmc.c   |   22 ++++++++++++++++++++--
 arch/arm/mach-omap2/pm34xx.c |    5 -----
 drivers/mtd/devices/elm.c    |   40 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/omap2.c     |   19 +++++++++++++++++++
 4 files changed, 79 insertions(+), 7 deletions(-)

-- 
1.7.9.5
