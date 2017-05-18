Received: from mail.sysgo.com ([176.9.12.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBLmo-0003pg-CD
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 13:48:16 +0000
From: David Engraf <david.engraf@sysgo.com>
To: linux-mtd@lists.infradead.org
Cc: David Engraf <david.engraf@sysgo.com>
Subject: [PATCH] mkfs.ubifs: Add support for symlinks in device table
Date: Thu, 18 May 2017 15:38:54 +0200
Message-Id: <20170518133854.20744-1-david.engraf@sysgo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is not possible to change permissions and ownership for symlinks in the
device table file. This patch adds support for symlinks equal to mkfs.jffs2
and updates the sample device table file.

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 jffsX-utils/device_table.txt      | 1 +
 ubifs-utils/mkfs.ubifs/devtable.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/jffsX-utils/device_table.txt b/jffsX-utils/device_table.txt
index 394a62b..8930cae 100644
--- a/jffsX-utils/device_table.txt
+++ b/jffsX-utils/device_table.txt
@@ -14,6 +14,7 @@
 #	c	Character special device file
 #	b	Block special device file
 #	p	Fifo (named pipe)
+#	l	Link
 # uid is the user id for the target file, gid is the group id for the
 # target file.  The rest of the entried apply only to device special
 # file.
diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/mkfs.ubifs/devtable.c
index dee035d..c96de53 100644
--- a/ubifs-utils/mkfs.ubifs/devtable.c
+++ b/ubifs-utils/mkfs.ubifs/devtable.c
@@ -33,6 +33,7 @@
  * c  Character special device file
  * b  Block special device file
  * p  Fifo (named pipe)
+ * l  Link
  *
  * Don't bother with symlinks (permissions are irrelevant), hard links (special
  * cases of regular files), or sockets (why bother).
@@ -177,6 +178,9 @@ static int interpret_table_entry(const char *line)
 		case 'b':
 			mode |= S_IFBLK;
 			break;
+		case 'l':
+			mode |= S_IFLNK;
+			break;
 		default:
 			return err_msg("unsupported file type '%c'", type);
 	}
-- 
2.11.0
