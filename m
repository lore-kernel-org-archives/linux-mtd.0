Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1D3L-0004DW-2S
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 11:46:04 +0000
From: Oleksij Rempel <linux@rempel-privat.de>
To: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com
Subject: [PATCH RFC] Alphascale ASM9260 NAND controller driver
Date: Wed, 17 Dec 2014 12:45:17 +0100
Message-Id: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
Cc: Oleksij Rempel <linux@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I collected some questions with this driver. It will be great if you
can help me:
* Do HW_ECC driver should provideo option for SW_ECC?
* My HW do ECC correction for n-bits per 512B, it mean it will
split block in 512B parts. If one of part has uncorrectable error, complete block will be
reported as failed. Are there any way for partial recovery?
* This HW reports count of ECC bitflips for each part. Do i need to return count of errors on
all parts for one block?
* If HW_ECC different stranges, how it should be configured? With DT or automatically
calculated?

Oleksij Rempel (1):
  mtd: nand: add asm9260 NFC driver

 drivers/mtd/nand/Kconfig        |    7 +
 drivers/mtd/nand/Makefile       |    1 +
 drivers/mtd/nand/asm9260_nand.c | 1148 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 1156 insertions(+)
 create mode 100644 drivers/mtd/nand/asm9260_nand.c

-- 
1.9.1
