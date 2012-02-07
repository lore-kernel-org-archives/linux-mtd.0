From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Moving EMIF driver to MFD framework
Date: Tue, 7 Feb 2012 20:41:50 +0530
Message-ID: <1328627513-30134-1-git-send-email-prakash.pm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: davinci-linux-open-source@linux.davincidsp.com,
 Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>,
 Sekhar Nori <nsekhar@ti.com>, "Manjunathappa, Prakash" <prakash.pm@ti.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch series are based on the discussion and concerns expressed in
davinci-linux-open-source community. Here is the link for the same:
http://davinci-linux-open-source.1494791.n2.nabble.com/PATCH-arm-davinci-configure-davinci-aemif-chipselects-through-OF-tt7059739.html#none

Manjunathappa, Prakash (3):
  arm:davinci: prepare to move aemif driver to drivers/mfd
  arm:davinci: Move emif driver to drivers/mfd from mach-davinci folder
  arm:davinci: move NAND and NOR devices as aemif MFD slaves

 arch/arm/Kconfig                                   |    1 +
 arch/arm/mach-davinci/Makefile                     |    2 +-
 arch/arm/mach-davinci/aemif.c                      |  133 -------------
 arch/arm/mach-davinci/board-da830-evm.c            |   33 +++-
 arch/arm/mach-davinci/board-da850-evm.c            |   56 +++---
 arch/arm/mach-davinci/board-dm355-evm.c            |   33 +++-
 arch/arm/mach-davinci/board-dm355-leopard.c        |   35 +++-
 arch/arm/mach-davinci/board-dm365-evm.c            |   34 +++-
 arch/arm/mach-davinci/board-dm644x-evm.c           |  175 ++++++++++-------
 arch/arm/mach-davinci/board-dm646x-evm.c           |   32 +++-
 arch/arm/mach-davinci/board-mityomapl138.c         |   34 +++-
 arch/arm/mach-davinci/board-neuros-osd2.c          |    1 +
 arch/arm/mach-davinci/board-sffsdr.c               |   34 +++-
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/davinci_aemif.c                        |  206 ++++++++++++++++++++
 drivers/mtd/nand/davinci_nand.c                    |    2 +-
 .../aemif.h => include/linux/mfd/davinci_aemif.h   |   14 ++
 17 files changed, 527 insertions(+), 299 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/aemif.c
 create mode 100644 drivers/mfd/davinci_aemif.c
 rename arch/arm/mach-davinci/include/mach/aemif.h => include/linux/mfd/davinci_aemif.h (74%)
