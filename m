Received: from f69.mail.ru ([194.67.57.220])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JsbWe-00081q-3F
	for linux-mtd@lists.infradead.org; Sun, 04 May 2008 10:33:00 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: David Woodhouse <dwmw2@infradead.org>,
	=?windows-1251?Q?linux-mtd=40lists.infradead.org?=
	<linux-mtd@lists.infradead.org>
Subject: =?windows-1251?Q?[PATCH][NOR]Remove_cfi=5Fcmdset=5F0001.c_erase_suspend_fixup_typo_(take_2)?=
Mime-Version: 1.0
Date: Sun, 04 May 2008 14:32:58 +0400
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1JsbWc-000IbB-00.abelyako-mail-ru@f69.mail.ru>
Cc: Alexander Belyakov <abelyako@gmail.com>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix typo in erase suspend while write fixup code leading to compile time error if CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE was defined.

drivers/mtd/chips/cfi_cmdset_0001.c: In function 'fixup_intel_strataflash':
drivers/mtd/chips/cfi_cmdset_0001.c:212: error: 'struct cfi_pri_amdstd' has no member named 'SuspendCmdSupport'

---
Signed-off-by: Alexander Belyakov <abelyako@googlemail.com>

diff -uNrp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-01 22:15:28.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-04 14:45:49.000000000 +0400
@@ -204,7 +204,7 @@ static void fixup_intel_strataflash(stru
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 
 	printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
 	                    "erase on write disabled.\n");
