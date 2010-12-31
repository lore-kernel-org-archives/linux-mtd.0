Received: from www.wytron.com.tw ([211.75.82.101])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PYU36-0003XM-Cf
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2010 01:45:00 +0000
From: Thomas Chou <thomas@wytron.com.tw>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mkfs.jffs2: fix repeated dev nodes
Date: Fri, 31 Dec 2010 09:45:19 +0800
Message-Id: <1293759919-3297-1-git-send-email-thomas@wytron.com.tw>
In-Reply-To: <4D1C3565.1030800@wytron.com.tw>
References: <4D1C3565.1030800@wytron.com.tw>
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>,
	Thomas Chou <thomas@wytron.com.tw>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the repeated nodes with the same primary name in device_table.txt.
They were not generated correctly.

/dev/tty    c    666    0    0    5    0    0    0    -
/dev/tty    c    666    0    0    4    0    0    1    6

# IDE Devices
/dev/hda    b    640    0    0    3    0    0    0    -
/dev/hda    b    640    0    0    3    1    1    1    15
/dev/hdb    b    640    0    0    3    64    0    0    -
/dev/hdb    b    640    0    0    3    65    1    1    15

Only created,
/dev/tty
/dev/hda
/dev/hdb

Signed-off-by: Thomas Chou <thomas@wytron.com.tw>
---
 mkfs.jffs2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 256eec4..717e1cc 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -457,7 +457,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 			errmsg_die("Unsupported file type '%c'", type);
 	}
 	entry = find_filesystem_entry(root, name, mode);
-	if (entry) {
+	if (entry && !(count > 0 && (type == 'c' || type == 'b'))) {
 		/* Ok, we just need to fixup the existing entry
 		 * and we will be all done... */
 		entry->sb.st_uid = uid;
-- 
1.7.3.4
