Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz90E-0000qQ-34
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:44:10 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEgx2O003787
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:44:00 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 6/6] UBIFS: save 128KiB or more RAM
Date: Mon, 14 Mar 2011 16:46:12 +0200
Message-Id: <1300113972-4507-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
References: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When debugging is enabled, we allocate a buffer of PEB size for
various debugging purposes. However, now all users of this buffer
are gone and we can safely remove it and save 128KiB or more RAM.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    9 ---------
 fs/ubifs/debug.h |    2 --
 2 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c2e5c08..01c2b02 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2701,16 +2701,8 @@ int ubifs_debugging_init(struct ubifs_info *c)
 	if (!c->dbg)
 		return -ENOMEM;
 
-	c->dbg->buf = vmalloc(c->leb_size);
-	if (!c->dbg->buf)
-		goto out;
-
 	failure_mode_init(c);
 	return 0;
-
-out:
-	kfree(c->dbg);
-	return -ENOMEM;
 }
 
 /**
@@ -2720,7 +2712,6 @@ out:
 void ubifs_debugging_exit(struct ubifs_info *c)
 {
 	failure_mode_exit(c);
-	vfree(c->dbg->buf);
 	kfree(c->dbg);
 }
 
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 10190c1..4efbba7 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -27,7 +27,6 @@
 
 /**
  * ubifs_debug_info - per-FS debugging information.
- * @buf: a buffer of LEB size, used for various purposes
  * @old_zroot: old index root - used by 'dbg_check_old_index()'
  * @old_zroot_level: old index root level - used by 'dbg_check_old_index()'
  * @old_zroot_sqnum: old index root sqnum - used by 'dbg_check_old_index()'
@@ -54,7 +53,6 @@
  * dfs_dump_tnc: "dump TNC" debugfs knob
  */
 struct ubifs_debug_info {
-	void *buf;
 	struct ubifs_zbranch old_zroot;
 	int old_zroot_level;
 	unsigned long long old_zroot_sqnum;
-- 
1.7.2.3
