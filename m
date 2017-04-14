Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyuXN-0001pE-Dg
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 06:16:54 +0000
Received: by mail-pg0-x242.google.com with SMTP id 63so2018876pgh.0
 for <linux-mtd@lists.infradead.org>; Thu, 13 Apr 2017 23:16:32 -0700 (PDT)
From: Rock Lee <rockdotlee@gmail.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	Rock Lee <rockdotlee@gmail.com>
Subject: [PATCH] ubifs: fix a typo in comment of ioctl2ubifs & ubifs2ioctl
Date: Thu, 13 Apr 2017 23:16:06 -0700
Message-Id: <1492150566-3158-1-git-send-email-rockdotlee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change 'convert' to 'converts'
Change 'UBIFS' to 'UBIFS inode flags'

Signed-off-by: Rock Lee <rockdotlee@gmail.com>
---
 fs/ubifs/ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index da519ba..79ae003 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -53,7 +53,7 @@ void ubifs_set_inode_flags(struct inode *inode)
  * ioctl2ubifs - convert ioctl inode flags to UBIFS inode flags.
  * @ioctl_flags: flags to convert
  *
- * This function convert ioctl flags (@FS_COMPR_FL, etc) to UBIFS inode flags
+ * This function converts ioctl flags (@FS_COMPR_FL, etc) to UBIFS inode flags
  * (@UBIFS_COMPR_FL, etc).
  */
 static int ioctl2ubifs(int ioctl_flags)
@@ -78,8 +78,8 @@ static int ioctl2ubifs(int ioctl_flags)
  * ubifs2ioctl - convert UBIFS inode flags to ioctl inode flags.
  * @ubifs_flags: flags to convert
  *
- * This function convert UBIFS (@UBIFS_COMPR_FL, etc) to ioctl flags
- * (@FS_COMPR_FL, etc).
+ * This function converts UBIFS inode flags (@UBIFS_COMPR_FL, etc) to ioctl
+ * flags (@FS_COMPR_FL, etc).
  */
 static int ubifs2ioctl(int ubifs_flags)
 {
-- 
1.9.1
