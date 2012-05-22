Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWq7q-0005v5-B9
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 14:31:50 +0000
Received: by mail-pz0-f49.google.com with SMTP id m1so9457565dad.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 07:31:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtd: nand: remove NAND_BBT_SEARCH option
Date: Tue, 22 May 2012 07:30:48 -0700
Message-Id: <1337697048-4577-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1337697048-4577-1-git-send-email-computersforpeace@gmail.com>
References: <1337697048-4577-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This option was never used and isn't currently used.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/DocBook/mtdnand.tmpl |    2 --
 include/linux/mtd/bbm.h            |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index e0aedb7..fe122d6 100644
--- a/Documentation/DocBook/mtdnand.tmpl
+++ b/Documentation/DocBook/mtdnand.tmpl
@@ -1216,8 +1216,6 @@ in this page</entry>
 #define	NAND_BBT_LASTBLOCK	0x00000010
 /* The bbt is at the given page, else we must scan for the bbt */
 #define NAND_BBT_ABSPAGE	0x00000020
-/* The bbt is at the given page, else we must scan for the bbt */
-#define NAND_BBT_SEARCH		0x00000040
 /* bbt is stored per chip on multichip devices */
 #define NAND_BBT_PERCHIP	0x00000080
 /* bbt has a version counter at offset veroffs */
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 650ef35..5d9fcb7 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -78,8 +78,6 @@ struct nand_bbt_descr {
 #define NAND_BBT_LASTBLOCK	0x00000010
 /* The bbt is at the given page, else we must scan for the bbt */
 #define NAND_BBT_ABSPAGE	0x00000020
-/* The bbt is at the given page, else we must scan for the bbt */
-#define NAND_BBT_SEARCH		0x00000040
 /* bbt is stored per chip on multichip devices */
 #define NAND_BBT_PERCHIP	0x00000080
 /* bbt has a version counter at offset veroffs */
-- 
1.7.5.4.2.g519b1
