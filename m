Message-Id: <201004272114.o3RLEBKf020266@imap1.linux-foundation.org>
Subject: [patch 2/2] mtd: nand: remove stray endchoice from Kconfig help text
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 27 Apr 2010 14:14:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: akpm@linux-foundation.org, wferi@niif.hu, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ferenc Wagner <wferi@niif.hu>

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/Kconfig |    2 --
 1 file changed, 2 deletions(-)

diff -puN drivers/mtd/nand/Kconfig~mtd-nand-remove-stray-endchoice-from-kconfig-help-text drivers/mtd/nand/Kconfig
--- a/drivers/mtd/nand/Kconfig~mtd-nand-remove-stray-endchoice-from-kconfig-help-text
+++ a/drivers/mtd/nand/Kconfig
@@ -373,8 +373,6 @@ config MTD_NAND_ATMEL_ECC_NONE
 
 	  If unsure, say N
 
-	  endchoice
-
 endchoice
 
 config MTD_NAND_PXA3xx
_
