From: Roger Quadros <rogerq@ti.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH 0/2] mtd: nand: omap: Fix build with CONFIG_MTD_NAND_OMAP_BCH=m
Date: Wed, 1 Oct 2014 14:33:28 +0300
Message-ID: <1412163210-12948-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: arnd@arndb.de, pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, linux-omap@vger.kernel.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Patch 1 fixes build with OMAP nand driver as built-in and the BCH driver as a module.
Ezequiel, I took the liberty to address an issue with your original patch so this is v2.

Patch 2 fixes the help message for CONFIG_MTD_NAND_OMAP_BCH to avoid user confusion.
CONFIG_MTD_NAND_OMAP_BCH is optional but doesn't harm on legacy OMAP platforms not having
the ELM/BCH hardware.

--
cheers,
-roger

Ezequiel Garcia (1):
  mtd: nand: Force omap_elm to be built as a module if omap2_nand is a
    module

Roger Quadros (1):
  mtd: nand: omap: Correct CONFIG_MTD_NAND_OMAP_BCH help message

 drivers/mtd/nand/Kconfig  | 7 +++++--
 drivers/mtd/nand/Makefile | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.3.2
