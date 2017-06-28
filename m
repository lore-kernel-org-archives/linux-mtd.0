Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqg-0006gD-5r
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:36 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 1F62724E001F
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:44 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 7/9] Remove unused variables and functions
Date: Wed, 28 Jun 2017 13:08:17 +0200
Message-Id: <20170628110819.30563-8-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
References: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libiniparser.c      | 18 ------------------
 nand-utils/nandwrite.c  |  2 --
 tests/ubi-tests/integ.c |  2 --
 3 files changed, 22 deletions(-)

diff --git a/lib/libiniparser.c b/lib/libiniparser.c
index ba70c08..a6ddcc7 100644
--- a/lib/libiniparser.c
+++ b/lib/libiniparser.c
@@ -389,24 +389,6 @@ int iniparser_find_entry(
 
 /*-------------------------------------------------------------------------*/
 /**
-  @brief    Set an entry in a dictionary.
-  @param    ini     Dictionary to modify.
-  @param    entry   Entry to modify (entry name)
-  @param    val     New value to associate to the entry.
-  @return   int 0 if Ok, -1 otherwise.
-
-  If the given entry can be found in the dictionary, it is modified to
-  contain the provided value. If it cannot be found, -1 is returned.
-  It is Ok to set val to NULL.
- */
-/*--------------------------------------------------------------------------*/
-int iniparser_set(dictionary * ini, char * entry, char * val)
-{
-    return dictionary_set(ini, strlwc(entry), val) ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
   @brief    Delete an entry in a dictionary
   @param    ini     Dictionary to modify
   @param    entry   Entry to delete (entry name)
diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index f29fc67..8f21593 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -261,8 +261,6 @@ static int is_virt_block_bad(struct mtd_dev_info *mtd, int fd,
  */
 int main(int argc, char * const argv[])
 {
-	int allffs;
-	int ii;
 	int fd = -1;
 	int ifd = -1;
 	int pagelen;
diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
index 94d546b..26c2ce5 100644
--- a/tests/ubi-tests/integ.c
+++ b/tests/ubi-tests/integ.c
@@ -561,8 +561,6 @@ static void get_ubi_devices_info(void)
 
 static void load_ubi(void)
 {
-	int ret;
-
 	if (system("modprobe -r ubi"))
 		error_exit("Failed to unload UBI module");
 
-- 
2.12.3
