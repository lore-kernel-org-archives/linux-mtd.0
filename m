Message-Id: <201002022243.o12MhAST019182@imap1.linux-foundation.org>
Subject: [patch 3/5] mtd: chips/cfi, remove unneeded NULL checks
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 02 Feb 2010 14:43:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: jslaby@suse.cz, akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jiri Slaby <jslaby@suse.cz>

In cfi_intelext_setup and cfi_amdstd_setup, mtd is never NULL.  Remove
unnecessary checks.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/chips/cfi_cmdset_0001.c |    6 ++----
 drivers/mtd/chips/cfi_cmdset_0002.c |    6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff -puN drivers/mtd/chips/cfi_cmdset_0001.c~mtd-chips-cfi-remove-unneeded-null-checks drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c~mtd-chips-cfi-remove-unneeded-null-checks
+++ a/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -615,10 +615,8 @@ static struct mtd_info *cfi_intelext_set
 	return mtd;
 
  setup_err:
-	if(mtd) {
-		kfree(mtd->eraseregions);
-		kfree(mtd);
-	}
+	kfree(mtd->eraseregions);
+	kfree(mtd);
 	kfree(cfi->cmdset_priv);
 	return NULL;
 }
diff -puN drivers/mtd/chips/cfi_cmdset_0002.c~mtd-chips-cfi-remove-unneeded-null-checks drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c~mtd-chips-cfi-remove-unneeded-null-checks
+++ a/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -494,10 +494,8 @@ static struct mtd_info *cfi_amdstd_setup
 	return mtd;
 
  setup_err:
-	if(mtd) {
-		kfree(mtd->eraseregions);
-		kfree(mtd);
-	}
+	kfree(mtd->eraseregions);
+	kfree(mtd);
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
 	return NULL;
_
