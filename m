Received: from mail-lb0-f174.google.com ([209.85.217.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcDD7-00033c-NZ
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 11:16:02 +0000
Received: by mail-lb0-f174.google.com with SMTP id r10so469469lbi.33
 for <linux-mtd@lists.infradead.org>; Tue, 14 May 2013 04:15:38 -0700 (PDT)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
Date: Tue, 14 May 2013 08:15:20 -0300
Message-Id: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Maen Suleiman <maen@marvell.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Armada 370 and Armada XP SoC include a NAND controller (NFCv2) that
is similar to the one in PXA SoC. Therefore, it should be possible to support
Armada NAND using pxa3xx-nand driver.

While this effort is not ready yet, here is a set of patches that are needed
for such work.

A small summary of the patches:

  * 1/5 is a fix for a 2-year regression that removed DMA support.

  * 2/5 and 3/5 are needed to build the driver on platforms other PXA.

  * 4/5 and 5/5 add ONFI-compliant device detection and are needed
    to successfully probe newer flash devices.

Applies cleanly on top of l2-mtd.git.

Thanks!

Ezequiel Garcia (5):
  mtd: nand: pxa3xx: Set info->use_dma properly
  mtd: nand: pxa3xx: Use of_machine_is_compatible()
  mtd: nand: pxa3xx: Fix MODULE_DEVICE_TABLE declaration
  mtd: nand: pxa3xx: Add address support for READID command
  mtd: nand: pxa3xx: Add support for Read parameter page command

 drivers/mtd/nand/pxa3xx_nand.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
1.8.1.5
