Received: from f131.mail.ru ([194.67.57.112])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4c4e-0007V5-No
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 13:01:35 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: David Woodhouse <dwmw2@infradead.org>, Nicolas Pitre <nico@cam.org>,
	=?windows-1251?Q?linux-mtd=40lists.infradead.org?=
	<linux-mtd@lists.infradead.org>, Alexander Belyakov <abelyako@gmail.com>
Subject: [PATCH][NOR]Disable erase suspend on write fixup
Mime-Version: 1.0
Date: Tue, 18 Dec 2007 16:01:27 +0300
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1J4c4d-000LmP-00.abelyako-mail-ru@f131.mail.ru>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

the patch below fixes typo in fixup_intel_strataflash().

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

diff -uNrp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-12-03 17:00:16.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-12-18 16:01:42.000000000 +0300
@@ -205,7 +205,7 @@ static void fixup_intel_strataflash(stru
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 
 	printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
 	                    "erase on write disabled.\n");
