Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LGPxP-0007lR-Mq
	for linux-mtd@lists.infradead.org; Sat, 27 Dec 2008 03:35:20 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id C1F3964265
	for <linux-mtd@lists.infradead.org>;
	Sat, 27 Dec 2008 03:35:08 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.jffs2: fix dir creation in /
Date: Fri, 26 Dec 2008 22:35:08 -0500
Message-Id: <1230348908-22199-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1230295082.11802.2.camel@sauron>
References: <1230295082.11802.2.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With older mtd-utils, creating a directory in the root worked fine.  With
current git, the parent dir search algo breaks this.

For example, just take the current git tree, build it up, and then run:
$ ./mkfs.jffs2 -d . -D device_table.txt -o /dev/null
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/dev/mem': no parent directory!
...
Doing `mkdir ./dev` first works around the issue, but where's the fun in
that.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 mkfs.jffs2.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 7255536..23a8cf8 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -273,6 +273,11 @@ static struct filesystem_entry *find_filesystem_entry(
 	struct filesystem_entry *e = dir;
 
 	if (S_ISDIR(dir->sb.st_mode)) {
+		/* If this is the first call, and we actually want this
+		 * directory, then return it now */
+		if (strcmp(fullname, e->fullname) == 0)
+			return e;
+
 		e = dir->files;
 	}
 	while (e) {
-- 
1.6.0.6
