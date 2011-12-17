Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbtqn-0008Ie-17
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 12:58:53 +0000
Received: by eaak12 with SMTP id k12so3598635eaa.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 04:58:50 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/5] MTD: bcm63xxpart: improve robustness
Date: Sat, 17 Dec 2011 13:58:13 +0100
Message-Id: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset aims at improving the robustness of the CFE detection and
image tag validation and parsing.

The image tag parsing improvement is especially useful when booting a
ramdisk image through tftp, since there is no guarantee that the image
on the flash is valid at this point.

As usual this patchset should got through the MTD tree and is based on
the l2-mtd-2.6 git.

Jonas Gorski (5):
  MTD: bcm63xxpart: check version marker string for newer CFEs
  MTD: bcm63xxpart: make sure CFE and NVRAM partitions are at least 64K
  MTD: bcm63xxpart: don't assume NVRAM is always the fourth partition
  MIPS: BCM63XX: bcm963xx_tag.h: make crc fields integers
  MTD: bcm63xxpart: check the image tag's crc32

 arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h |   11 +--
 drivers/mtd/bcm63xxpart.c                         |   89 ++++++++++++++-------
 2 files changed, 66 insertions(+), 34 deletions(-)

-- 
1.7.2.5
