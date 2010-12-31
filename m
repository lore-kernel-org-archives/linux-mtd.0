Received: from www.wytron.com.tw ([211.75.82.101])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PYVS6-0008TU-MO
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2010 03:14:51 +0000
From: Thomas Chou <thomas@wytron.com.tw>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mkfs.jffs2: fix devtable count as mkfs.ubifs does
Date: Fri, 31 Dec 2010 11:16:06 +0800
Message-Id: <1293765366-27147-1-git-send-email-thomas@wytron.com.tw>
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

The counting was incorrect. Follow that of mkfs.ubifs.

Signed-off-by: Thomas Chou <thomas@wytron.com.tw>
---
 mkfs.jffs2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 717e1cc..3aab533 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -497,10 +497,10 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 					unsigned long i;
 					char *dname, *hpath;
 
-					for (i = start; i < count; i++) {
+					for (i = start; i < (start + count); i++) {
 						xasprintf(&dname, "%s%lu", name, i);
 						xasprintf(&hpath, "%s/%s%lu", rootdir, name, i);
-						rdev = makedev(major, minor + (i * increment - start));
+						rdev = makedev(major, minor + (i - start) * increment);
 						add_host_filesystem_entry(dname, hpath, uid, gid,
 								mode, rdev, parent);
 						free(dname);
-- 
1.7.3.4
