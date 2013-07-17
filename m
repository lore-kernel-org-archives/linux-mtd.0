Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzXnq-0006SR-GO
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2013 19:54:23 +0000
From: Pekon Gupta <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v1 0/4] mtd: nand: omap: add support for BCH16_ECC
Date: Thu, 18 Jul 2013 01:22:02 +0530
Message-ID: <1374090726-9393-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, tony@atomide.com, devicetree-discuss@lists.ozlabs.org,
 avinashphilipk@gmail.com, balbi@ti.com, Pekon Gupta <pekon@ti.com>,
 benoit.cousson@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series add support of BCH16_ECC scheme.
As BCH16_ECC scheme generates 26bytes of ECC syndrome per 512B data,
hence this scheme is usable only for NAND devices having 4K or above
page-size, as their OOB/spare area has enough space to accomodate ECC.

This patch series is applicable over an above following series:
[1] [Patch] mtd:nand:omap2: clean-up of supported ECC schemes 
 http://lists.infradead.org/pipermail/linux-mtd/2013-July/047530.html
[2] [Patch] optimize and clean-up of OMAP NAND and ELM driver
 http://lists.infradead.org/pipermail/linux-mtd/2013-July/047538.html

Also this BCH16_ECC patch series is sparsely tested, due to limited
availability of boards with 4K/224NAND, so request the users to test
the mentioned series, and provide Tested-by.


Pekon Gupta (4):
  mtd: nand: omap: add support for BCH16_ECC - DT updates
  mtd: nand: omap: add support for BCH16_ECC - ELM driver updates
  mtd: nand: omap: add support for BCH16_ECC - GPMC driver updates
  mtd: nand: omap: add support for BCH16_ECC - NAND driver updates

 .../devicetree/bindings/mtd/gpmc-nand.txt          |   7 ++
 arch/arm/mach-omap2/gpmc.c                         |  22 +++--
 drivers/mtd/devices/elm.c                          |  29 ++++++
 drivers/mtd/nand/omap2.c                           | 104 +++++++++++++++++++--
 include/linux/platform_data/elm.h                  |   8 +-
 include/linux/platform_data/mtd-nand-omap2.h       |   7 +-
 6 files changed, 155 insertions(+), 22 deletions(-)

-- 
1.8.1
