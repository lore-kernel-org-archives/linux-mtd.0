Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXsjm-00055T-Ro
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 12:03:35 +0000
Received: by mail-ea0-f177.google.com with SMTP id n13so2357999eaa.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 04:03:32 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH V2 0/6] bcm47xxnflash: read support for BCM4706
Date: Mon, 12 Nov 2012 13:03:19 +0100
Message-Id: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe I've made "verify" tool working in my system and fixed
all warning/errors reported by it.

Rafał Miłecki (6):
  bcma: export PLL reading function
  mtd: prepare place for BCMA NAND flash driver(s)
  mtd: bcm47xxnflash: init NAND on BCM4706
  mtd: bcm47xxnflash: support for NAND_CMD_READID command
  mtd: bcm47xxnflash: implement reading
  mtd: bcm47xxnflash: enable BCM4706 driver

 drivers/bcma/driver_chipcommon_pmu.c           |    3 +-
 drivers/mtd/nand/Kconfig                       |    9 +
 drivers/mtd/nand/Makefile                      |    1 +
 drivers/mtd/nand/bcm47xxnflash/Makefile        |    4 +
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |   22 ++
 drivers/mtd/nand/bcm47xxnflash/main.c          |  108 ++++++++
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c   |  316 ++++++++++++++++++++++++
 include/linux/bcma/bcma.h                      |    1 +
 8 files changed, 463 insertions(+), 1 deletions(-)
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/Makefile
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/main.c
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c

-- 
1.7.7
