Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0Y1z-0006qT-QL
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 11:39:48 +0000
Received: from eru.research.nokia.com (esdhcp03787.research.nokia.com
	[172.21.37.87])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2IBdjmR026183
	for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2011 13:39:45 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] nanddump: fail if -s parameter is unaligned
Date: Fri, 18 Mar 2011 13:42:40 +0200
Message-Id: <1300448560-4166-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300448560-4166-1-git-send-email-dedekind1@gmail.com>
References: <1300448560-4166-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Implement the feature which we planned long time ago - make nanddump
fail if the -s parameter is not NAND page-aligned. Also bump nanddump
version.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 feature-removal-schedule.txt |   12 +-----------
 nanddump.c                   |    9 ++++-----
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 2899e34..30f0403 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -26,15 +26,5 @@ to stop using them.
 The further step is to remove both of them.
 
 ---------------------------
-2. nanddump: fail when the -s parameter is not page aligned
-
-nanddump should be consistent with nandwrite, and refuse accepting non page
-aligned start addresses. These dumps are most likely useless, since nandwrite
-won't write then at this location. Currently only a warning is issued to keep
-backward compatibility during a transition period. This should become an error
-one release after the next release (current is mtd-utils-1.4.0, 18 Sep 2010).
-
-To be done by Artem Bityutskiy.
----------------------------
-3.
+2.
 ---------------------------
diff --git a/nanddump.c b/nanddump.c
index 1dbb247..214fb12 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -14,7 +14,7 @@
  */
 
 #define PROGRAM_NAME "nanddump"
-#define VERSION "$Revision: 1.29 $"
+#define VERSION "1.30"
 
 #define _GNU_SOURCE
 #include <ctype.h>
@@ -366,11 +366,10 @@ int main(int argc, char * const argv[])
 
 	/* Initialize start/end addresses and block size */
 	if (start_addr & (mtd.min_io_size - 1)) {
-		fprintf(stderr, "WARNING: The start address is not page-aligned !\n"
-				"The pagesize of this NAND Flash is 0x%x.\n"
-				"nandwrite doesn't allow writes starting at this location.\n"
-				"Future versions of nanddump will fail here.\n",
+		fprintf(stderr, "the start address (-s parameter) is not page-aligned!\n"
+				"The pagesize of this NAND Flash is 0x%x.\n",
 				mtd.min_io_size);
+		goto closeall;
 	}
 	if (length)
 		end_addr = start_addr + length;
-- 
1.7.2.3
