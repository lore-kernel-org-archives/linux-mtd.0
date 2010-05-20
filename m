Received: from smtp22.services.sfr.fr ([93.17.128.13])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OF75f-0000l9-HX
	for linux-mtd@lists.infradead.org; Thu, 20 May 2010 14:51:17 +0000
Subject: [PATCH 1/2] mtd: cfi_cmdset_0002: allow automatic loading of command
	set 0x0701 from cfi_cmdset_unknown()
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 20 May 2010 16:54:05 +0200
Message-ID: <20100520145405.6262.90666.stgit@dev.siriade.com>
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

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 87e86e9..cd905a1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -489,7 +489,9 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 
 	return cfi_amdstd_setup(mtd);
 }
+struct mtd_info *cfi_cmdset_0701(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
 EXPORT_SYMBOL_GPL(cfi_cmdset_0002);
+EXPORT_SYMBOL_GPL(cfi_cmdset_0701);
 
 static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 {
@@ -2040,3 +2042,4 @@ static void cfi_amdstd_destroy(struct mtd_info *mtd)
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");
 MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");
+MODULE_ALIAS("cfi_cmdset_0701");
