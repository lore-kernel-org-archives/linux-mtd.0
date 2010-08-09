From: Sekhar Nori <nsekhar@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] davinci: add support for aemif timing configuration
Date: Mon,  9 Aug 2010 15:46:34 +0530
Message-Id: <1281349000-822-1-git-send-email-nsekhar@ti.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, Sekhar Nori <nsekhar@ti.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series of patches adds support for AEMIF timing configuration
for DaVinci SoCs.

Currently AEMIF timing configuration is done as a special case for
DM644x EVM. This work provides for a generic way of doing this.

David,
	Patch 1/6 and 2/6 of this series touch the
	drivers/mtd/nand/davinci_nand.c file along with other arch specific
	files. Based on the discussion on DaVinci list, Kevin is OK to merge
	this with your agreement. Please let us know how to proceed.

Sekhar Nori (5):
  davinci: add support for aemif timing configuration
  nand: davinci: add support for timing configuration
  davinci: dm644x evm: setup NAND flash timing
  davinci: am18x/da850/omap-l138 evm: setup NAND flash timing
  davinci: dm6467t evm: setup NAND flash timing

Sudhakar Rajashekhara (1):
  davinci: am17x/da830/omap-l137 evm: setup NAND flash timing

 arch/arm/mach-davinci/Makefile             |    2 +-
 arch/arm/mach-davinci/aemif.c              |  133 ++++++++++++++++++++++++++++
 arch/arm/mach-davinci/board-da830-evm.c    |   12 +++
 arch/arm/mach-davinci/board-da850-evm.c    |   12 +++
 arch/arm/mach-davinci/board-dm644x-evm.c   |   12 +++
 arch/arm/mach-davinci/board-dm646x-evm.c   |   14 +++
 arch/arm/mach-davinci/include/mach/aemif.h |   36 ++++++++
 arch/arm/mach-davinci/include/mach/nand.h  |    6 +-
 drivers/mtd/nand/davinci_nand.c            |   61 +++++--------
 9 files changed, 246 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/mach-davinci/aemif.c
 create mode 100644 arch/arm/mach-davinci/include/mach/aemif.h
