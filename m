Received: from smtp23.services.sfr.fr ([93.17.128.22])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OF75i-0000tX-UM
	for linux-mtd@lists.infradead.org; Thu, 20 May 2010 14:51:20 +0000
Subject: [PATCH 2/2] mtd: cfi_cmdset_0002: use AMD standard command-set with
	Winbond flash chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 20 May 2010 16:54:10 +0200
Message-ID: <20100520145410.6262.50350.stgit@dev.siriade.com>
In-Reply-To: <20100520145405.6262.90666.stgit@dev.siriade.com>
References: <20100520145405.6262.90666.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested with W19L320SBT9C [1].

[1] http://www.datasheetarchive.com/pdf-datasheets/Datasheets-40/DSA-795343.pdf

Signed-off-by: Obinou <obconseil@gmail.com>
Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Acked-by: Florian Fainelli <florian@openwrt.org>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    3 +++
 drivers/mtd/chips/gen_probe.c       |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index cd905a1..d81079e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -489,8 +489,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 
 	return cfi_amdstd_setup(mtd);
 }
+struct mtd_info *cfi_cmdset_0006(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
 struct mtd_info *cfi_cmdset_0701(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
 EXPORT_SYMBOL_GPL(cfi_cmdset_0002);
+EXPORT_SYMBOL_GPL(cfi_cmdset_0006);
 EXPORT_SYMBOL_GPL(cfi_cmdset_0701);
 
 static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
@@ -2042,4 +2044,5 @@ static void cfi_amdstd_destroy(struct mtd_info *mtd)
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");
 MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");
+MODULE_ALIAS("cfi_cmdset_0006");
 MODULE_ALIAS("cfi_cmdset_0701");
diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 75a8f9d..3b9a284 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct map_info *map, int primary)
 #ifdef CONFIG_MTD_CFI_AMDSTD
 	case P_ID_AMD_STD:
 	case P_ID_SST_OLD:
+	case P_ID_WINBOND:
 		return cfi_cmdset_0002(map, primary);
 #endif
 #ifdef CONFIG_MTD_CFI_STAA
