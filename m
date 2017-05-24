Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHt-0000GL-Gz
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:01 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 07/15] mtd: nand: move BBT code to drivers/mtd/nand/
Date: Wed, 24 May 2017 15:07:03 +0800
Message-ID: <1495609631-18880-8-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Now that the BBT code is generic, we can move it to drivers/mtd/nand/.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/Kconfig                   | 3 +++
 drivers/mtd/nand/Makefile                  | 4 ++++
 drivers/mtd/nand/{raw/nand_bbt.c => bbt.c} | 5 +++++
 drivers/mtd/nand/raw/Kconfig               | 1 +
 drivers/mtd/nand/raw/Makefile              | 2 +-
 5 files changed, 14 insertions(+), 1 deletion(-)
 rename drivers/mtd/nand/{raw/nand_bbt.c => bbt.c} (99%)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 6d53734..1c1a1f4 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1 +1,4 @@
+config MTD_NAND_CORE
+	tristate
+
 source "drivers/mtd/nand/raw/Kconfig"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index eee2f27..fe430d9 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -1 +1,5 @@
+obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
+
+nandcore-objs :=  bbt.o
+
 obj-y	+= raw/
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/bbt.c
similarity index 99%
rename from drivers/mtd/nand/raw/nand_bbt.c
rename to drivers/mtd/nand/bbt.c
index 26f5c3f..56115d5 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -1308,6 +1308,7 @@ int nand_scan_bbt(struct nand_device *this)
 	this->bbt.bbt = NULL;
 	return res;
 }
+EXPORT_SYMBOL_GPL(nand_scan_bbt);
 
 /**
  * nand_release_bbt - release bad block table(s)
@@ -1372,6 +1373,7 @@ int nand_update_bbt(struct nand_device *this, loff_t offs)
 	kfree(buf);
 	return res;
 }
+EXPORT_SYMBOL_GPL(nand_update_bbt);
 
 /**
  * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
@@ -1385,6 +1387,7 @@ int nand_isreserved_bbt(struct nand_device *this, loff_t offs)
 	block = nand_offs_to_eraseblock(this, offs);
 	return bbt_get_entry(this, block) == NAND_BBT_BLOCK_RESERVED;
 }
+EXPORT_SYMBOL_GPL(nand_isreserved_bbt);
 
 /**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
@@ -1412,6 +1415,7 @@ int nand_isbad_bbt(struct nand_device *this, loff_t offs, int allowbbt)
 	}
 	return 1;
 }
+EXPORT_SYMBOL_GPL(nand_isbad_bbt);
 
 /**
  * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
@@ -1433,3 +1437,4 @@ int nand_markbad_bbt(struct nand_device *this, loff_t offs)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(nand_markbad_bbt);
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 0bd2319..d7c97f9 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -14,6 +14,7 @@ menuconfig MTD_NAND
 	tristate "NAND Device Support"
 	depends on MTD
 	select MTD_NAND_ECC
+	select MTD_NAND_CORE
 	help
 	  This enables support for accessing all type of NAND flash
 	  devices. For further information see
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 523d5c1..e9207e3 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -60,7 +60,7 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
-nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs := nand_base.o nand_timings.o nand_ids.o
 nand-objs += nand_amd.o
 nand-objs += nand_hynix.o
 nand-objs += nand_macronix.o
-- 
1.9.1
