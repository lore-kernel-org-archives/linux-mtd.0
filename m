Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKs20-0006ay-Me
 for linux-mtd@lists.infradead.org; Fri, 22 Aug 2014 16:49:41 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mkfs.ubifs: use gid from table instead 2x uid
Date: Fri, 22 Aug 2014 18:49:01 +0200
Message-Id: <1408726141-25608-1-git-send-email-bigeasy@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the devtable is used then the tool uses uid twice and doesn't
consider gid at all. This changes it to use gid & uid.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 200c8a5..d7a252c 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -1535,7 +1535,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 
 		memcpy(&fake_st, &root_st, sizeof(struct stat));
 		fake_st.st_uid  = nh_elt->uid;
-		fake_st.st_uid  = nh_elt->uid;
+		fake_st.st_gid  = nh_elt->gid;
 		fake_st.st_mode = nh_elt->mode;
 		fake_st.st_rdev = nh_elt->dev;
 		fake_st.st_nlink = 1;
-- 
2.1.0
