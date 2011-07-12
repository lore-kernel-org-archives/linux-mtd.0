Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QgaD8-0003D9-Os
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2011 10:29:05 +0000
From: Lei Wen <leiwen@marvell.com>
To: Daniel Mack <zonque@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	Igor Grinberg <grinberg@compulab.co.il>, Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Yu Tang <ytang5@marvell.com>
Subject: [PATCH V6 0/4] pxa3xx_nand: add two chip select support
Date: Tue, 12 Jul 2011 03:28:51 -0700
Message-Id: <1310466535-15287-1-git-send-email-leiwen@marvell.com>
In-Reply-To: <1310096084-14646-1-git-send-email-leiwen@marvell.com>
References: <1310096084-14646-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V2:
Choose to at most keep original pxa3xx_nand_info structure to reduce
patch size

V3:
Seperate original one patch into a patch set

V4:
Further seperate patch into small pieces:
Mainly change make in two patch, which seperate do
the new structure definition and two chip select support add.

V5:
Merge platform change patch and two chip feature into one patch.
Clean some format issue.

V6:
Add suspend and resume enhancement as a part of this patch set.

Lei Wen (4):
  MTD: pxa3xx_nand: convert all printk into dev_*
  MTD: pxa3xx_nand: sperate each chip individual info
  MTD: pxa3xx_nand: enable multiple chip select support
  MTD: pxa3xx_nand: enhance suspend and resume routine

 arch/arm/mach-mmp/aspenite.c                 |    5 +-
 arch/arm/mach-pxa/cm-x300.c                  |    5 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c           |    5 +-
 arch/arm/mach-pxa/littleton.c                |    5 +-
 arch/arm/mach-pxa/mxm8x10.c                  |    9 +-
 arch/arm/mach-pxa/raumfeld.c                 |    5 +-
 arch/arm/mach-pxa/zylonite.c                 |    5 +-
 arch/arm/plat-pxa/include/plat/pxa3xx_nand.h |   20 +-
 drivers/mtd/nand/pxa3xx_nand.c               |  452 ++++++++++++++++----------
 9 files changed, 327 insertions(+), 184 deletions(-)
