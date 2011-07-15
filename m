Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QhZKS-0008Gm-Oj
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2011 03:44:41 +0000
From: Lei Wen <leiwen@marvell.com>
To: Daniel Mack <zonque@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	Igor Grinberg <grinberg@compulab.co.il>, Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Yu Tang <ytang5@marvell.com>
Subject: [PATCH V8 0/4] pxa3xx_nand: add two chip select support
Date: Thu, 14 Jul 2011 20:44:29 -0700
Message-Id: <1310701473-31632-1-git-send-email-leiwen@marvell.com>
In-Reply-To: <1310481336-13230-1-git-send-email-leiwen@marvell.com>
References: <1310481336-13230-1-git-send-email-leiwen@marvell.com>
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

V7:
Fix build bug
Fix zylonite machine cannot resume back

V8:
Fix typos and code style

Lei Wen (4):
  MTD: pxa3xx_nand: enhance suspend and resume routine
  MTD: pxa3xx_nand: convert all printk into dev_*
  MTD: pxa3xx_nand: sperate each chip individual info
  MTD: pxa3xx_nand: enable multiple chip select support

 arch/arm/mach-mmp/aspenite.c                 |    5 +-
 arch/arm/mach-pxa/cm-x300.c                  |    5 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c           |    5 +-
 arch/arm/mach-pxa/littleton.c                |    5 +-
 arch/arm/mach-pxa/mxm8x10.c                  |    9 +-
 arch/arm/mach-pxa/raumfeld.c                 |    5 +-
 arch/arm/mach-pxa/zylonite.c                 |    5 +-
 arch/arm/plat-pxa/include/plat/pxa3xx_nand.h |   20 +-
 drivers/mtd/nand/pxa3xx_nand.c               |  453 ++++++++++++++++----------
 9 files changed, 327 insertions(+), 185 deletions(-)
