Received: from arrakis.dune.hu ([78.24.191.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJOAu-0001rn-Je
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 13:07:57 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] fix NVRAM partition size if larger than expected
Date: Sat, 23 Mar 2013 14:07:46 +0100
Message-Id: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some device vendors use a larger nvram size than expected. While Broadcom
has defined it as 64K max, devices with 128K have been seen in the wild.
Luckily they properly set the nvram's PSI size to the correct value, so
we can use that to size the nvram partion.

Yes it's a bit confusing as there are two nvrams, one with a fixed layout
with in the bootloader, with the size information about the other.

Since 2 of 3 patches are for the mtd tree, this patchset should go there
(but it applies to both l2-mtd and mips-next fine).

Jonas Gorski (3):
  MTD: bcm63xxpart: use size macro for CFE block size
  MIPS: BCM63XX: export PSI size from nvram
  MTD: bcm63xxpart: use nvram for PSI size

 arch/mips/bcm63xx/nvram.c                          |   11 +++++++++++
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |    2 ++
 drivers/mtd/bcm63xxpart.c                          |    9 ++++++---
 3 files changed, 19 insertions(+), 3 deletions(-)

-- 
1.7.10.4
