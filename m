Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LF4DA-0005Zr-6Y
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2008 10:10:04 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 92EAB64C0F
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Dec 2008 10:09:54 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.jffs2: fix dir creation in /
Date: Tue, 23 Dec 2008 05:54:24 -0500
Message-Id: <1230029664-22328-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <8bd0f97a0806200828u2aefc887n37cb48b4cf75528b@mail.gmail.com>
References: <8bd0f97a0806200828u2aefc887n37cb48b4cf75528b@mail.gmail.com>
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

I've "fixed" the issue in interpret_table_entry() by special casing the
root directory "/" and having the code return the root directory rather
than attempting to do a search for it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
i mentioned this back in June with no response:
http://lists.infradead.org/pipermail/linux-mtd/2008-June/022089.html

 mkfs.jffs2.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 7255536..a419bb8 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -565,7 +565,10 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 		 * try and find our parent now) */
 		tmp = strdup(name);
 		dir = dirname(tmp);
-		parent = find_filesystem_entry(root, dir, S_IFDIR);
+		if (!strcmp(dir, "/"))
+			parent = root;
+		else
+			parent = find_filesystem_entry(root, dir, S_IFDIR);
 		free(tmp);
 		if (parent == NULL) {
 			error_msg ("skipping device_table entry '%s': no parent directory!", name);
-- 
1.6.0.4
