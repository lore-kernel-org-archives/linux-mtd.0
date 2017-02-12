Received: from srv-hp10-72.netsons.net ([94.141.22.72])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cd29B-0000l9-Ly
 for linux-mtd@lists.infradead.org; Sun, 12 Feb 2017 21:57:30 +0000
From: Luca Ceresoli <luca@lucaceresoli.net>
To: linux-mtd@lists.infradead.org
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] ubirename: trivial fixes to the help text
Date: Sun, 12 Feb 2017 22:55:54 +0100
Message-Id: <1486936554-14274-1-git-send-email-luca@lucaceresoli.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a missing space after PROGRAM_NAME and fix a typo.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 ubi-utils/ubirename.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubirename.c b/ubi-utils/ubirename.c
index 288475b37eba..f88ef82ce517 100644
--- a/ubi-utils/ubirename.c
+++ b/ubi-utils/ubirename.c
@@ -34,7 +34,7 @@
 
 static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [<old name> <new name>|...]\n\n"
-"Example: " PROGRAM_NAME "/dev/ubi0 A B C D - rename volume A to B, and C to D\n\n"
+"Example: " PROGRAM_NAME " /dev/ubi0 A B C D - rename volume A to B, and C to D\n\n"
 "This utility allows re-naming several volumes in one go atomically.\n"
 "For example, if you have volumes A and B, then you may rename A into B\n"
 "and B into A at one go, and the operation will be atomic. This allows\n"
@@ -44,7 +44,7 @@ static const char usage[] =
 "may remove old volume B.\n"
 "It is also allowed to re-name multiple volumes at a time, but 16 max.\n"
 "renames at once, which means you may specify up to 32 volume names.\n"
-"If you have volumes A and B, and re-name A to B, bud do not re-name\n"
+"If you have volumes A and B, and re-name A to B, but do not re-name\n"
 "B to something else in the same request, old volume B will be removed\n"
 "and A will be renamed into B.\n";
 
-- 
2.7.4
