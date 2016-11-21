Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8nzC-0002tu-ME
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 12:46:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Peter Pan <peterpansjtu@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH v3 7/7] mtd: nand: move BBT code to drivers/mtd/nand/
Date: Mon, 21 Nov 2016 13:45:28 +0100
Message-Id: <1479732328-18363-8-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
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
index 575f0b1dc548..94cd3e5faf46 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -1308,6 +1308,7 @@ int nand_scan_bbt(struct nand_device *this)
 	this->bbt.bbt = NULL;
 	return res;
 }
+EXPORT_SYMBOL_GPL(nand_scan_bbt);
 
 /**
  * nand_update_bbt - update bad block table(s)
@@ -1361,6 +1362,7 @@ int nand_update_bbt(struct nand_device *this, loff_t offs)
 	kfree(buf);
 	return res;
 }
+EXPORT_SYMBOL_GPL(nand_update_bbt);
 
 /**
  * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
@@ -1374,6 +1376,7 @@ int nand_isreserved_bbt(struct nand_device *this, loff_t offs)
 	block = nand_offs_to_eraseblock(this, offs);
 	return bbt_get_entry(this, block) == NAND_BBT_BLOCK_RESERVED;
 }
+EXPORT_SYMBOL_GPL(nand_isreserved_bbt);
 
 /**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
@@ -1401,6 +1404,7 @@ int nand_isbad_bbt(struct nand_device *this, loff_t offs, int allowbbt)
 	}
 	return 1;
 }
+EXPORT_SYMBOL_GPL(nand_isbad_bbt);
 
 /**
  * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
@@ -1422,3 +1426,4 @@ int nand_markbad_bbt(struct nand_device *this, loff_t offs)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(nand_markbad_bbt);
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 353a9ddf6b97..dd6ad347ef1f 100644
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
index 19a66e404d5b..d80fa7e9cfee 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -61,4 +61,4 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
-nand-objs := nand_base.o nand_bbt.o nand_timings.o
+nand-objs := nand_base.o nand_timings.o
-- 
2.7.4
