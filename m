Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvmXv-0006Zx-0B
 for linux-mtd@lists.infradead.org; Sun, 16 Oct 2016 14:36:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Peter Pan <peterpansjtu@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] mtd: nand: move BBT code to drivers/mtd/nand/
Date: Sun, 16 Oct 2016 16:35:18 +0200
Message-Id: <1476628518-20450-8-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the BBT code is generic, we can move it to drivers/mtd/nand/.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Kconfig                   | 3 +++
 drivers/mtd/nand/Makefile                  | 4 ++++
 drivers/mtd/nand/{raw/nand_bbt.c => bbt.c} | 5 +++++
 drivers/mtd/nand/raw/Kconfig               | 1 +
 drivers/mtd/nand/raw/Makefile              | 2 +-
 5 files changed, 14 insertions(+), 1 deletion(-)
 rename drivers/mtd/nand/{raw/nand_bbt.c => bbt.c} (99%)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 6d5373471809..1c1a1f487e20 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1 +1,4 @@
+config MTD_NAND_CORE
+	tristate
+
 source "drivers/mtd/nand/raw/Kconfig"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index eee2f27e92fc..fe430d919224 100644
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
index 0ad2c43adbd3..f308f1ed9fe0 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -1289,6 +1289,7 @@ int nand_scan_bbt(struct nand_device *this)
 	this->bbt.bbt = NULL;
 	return res;
 }
+EXPORT_SYMBOL_GPL(nand_scan_bbt);
 
 /**
  * nand_update_bbt - update bad block table(s)
@@ -1342,6 +1343,7 @@ int nand_update_bbt(struct nand_device *this, loff_t offs)
 	kfree(buf);
 	return res;
 }
+EXPORT_SYMBOL_GPL(nand_update_bbt);
 
 /**
  * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
@@ -1355,6 +1357,7 @@ int nand_isreserved_bbt(struct nand_device *this, loff_t offs)
 	block = nand_offs_to_eraseblock(this, offs);
 	return bbt_get_entry(this, block) == BBT_BLOCK_RESERVED;
 }
+EXPORT_SYMBOL_GPL(nand_isreserved_bbt);
 
 /**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
@@ -1382,6 +1385,7 @@ int nand_isbad_bbt(struct nand_device *this, loff_t offs, int allowbbt)
 	}
 	return 1;
 }
+EXPORT_SYMBOL_GPL(nand_isbad_bbt);
 
 /**
  * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
@@ -1403,3 +1407,4 @@ int nand_markbad_bbt(struct nand_device *this, loff_t offs)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(nand_markbad_bbt);
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 7b7a887b4709..9b4b90039dc3 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -15,6 +15,7 @@ menuconfig MTD_NAND
 	depends on MTD
 	select MTD_NAND_IDS
 	select MTD_NAND_ECC
+	select MTD_NAND_CORE
 	help
 	  This enables support for accessing all type of NAND flash
 	  devices. For further information see
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index cafde6f3d957..1df932034ae2 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -59,4 +59,4 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
-nand-objs := nand_base.o nand_bbt.o nand_timings.o
+nand-objs := nand_base.o nand_timings.o
-- 
2.7.4
