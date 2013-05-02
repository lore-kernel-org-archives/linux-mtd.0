Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXwS3-0004Iu-Hg
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 16:33:48 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 30CD333DE0C
 for <linux-mtd@lists.infradead.org>; Thu,  2 May 2013 16:33:23 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] flash_erase: use pwrite() rather than lseek() && write()
Date: Thu,  2 May 2013 12:33:21 -0400
Message-Id: <1367512401-14689-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Saves a syscall.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_erase.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 326a299..1421cf9 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -277,11 +277,7 @@ int main(int argc, char *argv[])
 				continue;
 			}
 		} else {
-			if (lseek(fd, offset, SEEK_SET) < 0) {
-				sys_errmsg("%s: MTD lseek failure", mtd_device);
-				continue;
-			}
-			if (write(fd, &cleanmarker, sizeof(cleanmarker)) != sizeof(cleanmarker)) {
+			if (pwrite(fd, &cleanmarker, sizeof(cleanmarker), (loff_t)offset) != sizeof(cleanmarker)) {
 				sys_errmsg("%s: MTD write failure", mtd_device);
 				continue;
 			}
-- 
1.8.2.1
