Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBI7l-0003Kj-MQ
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:07:47 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00LO6908UT20@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:07:20 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 0/8] mtd: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:07:19 +0900
Message-id: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message. For example,
k.alloc and v.alloc failures use dump_stack().

Jingoo Han (8):
      mtd: devices: elm: Remove unnecessary OOM messages
      mtd: spear_smi: Remove unnecessary OOM messages
      mtd: pmc551: Remove unnecessary OOM messages
      mtd: plat-ram: Remove unnecessary OOM messages
      mtd: lpddr: Remove unnecessary OOM messages
      mtd: onenand: Remove unnecessary OOM messages
      mtd: cfi: Remove unnecessary OOM messages
      mtd: gen_probe: Remove unnecessary OOM messages

---
 drivers/mtd/chips/cfi_cmdset_0001.c |    8 ++------
 drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++------
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 --
 drivers/mtd/chips/cfi_probe.c       |    4 +---
 drivers/mtd/chips/cfi_util.c        |    4 +---
 drivers/mtd/chips/gen_probe.c       |    2 --
 drivers/mtd/devices/elm.c           |    4 +---
 drivers/mtd/devices/pmc551.c        |    7 +------
 drivers/mtd/devices/spear_smi.c     |    2 --
 drivers/mtd/lpddr/lpddr_cmds.c      |    4 +---
 drivers/mtd/lpddr/qinfo_probe.c     |    5 +----
 drivers/mtd/maps/plat-ram.c         |    1 -
 drivers/mtd/onenand/onenand_base.c  |    7 +------
 drivers/mtd/onenand/samsung.c       |    4 +---
 14 files changed, 12 insertions(+), 50 deletions(-)
