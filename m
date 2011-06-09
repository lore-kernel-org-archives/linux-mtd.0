From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Thu, 9 Jun 2011 15:08:59 +0300
Subject: [PATCH] UBIFS: temporary: hack to check recovery
Message-ID: <mailman.13.1307621700.24103.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

We suspect that recovery cuts nodes sometimes. This is the hack which should
catch such things. We hack ubifs_change_leb and scan the leb right after
changing it - if we wrote corrupted data there, scan should fail.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 9228950..9f7dbbf 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -153,6 +153,30 @@ int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
 		ubifs_ro_mode(c, err);
 		dbg_dump_stack();
 	}
+
+	/* Temporary hack to catch incorrect recovery, if we have such */
+	if (!err && (lnum < c->lpt_first || lnum > c->lpt_last)) {
+		void *buf = vmalloc(c->leb_size);
+		struct ubifs_scan_leb *sleb;
+
+		if (!buf)
+			return 0;
+
+		sleb = ubifs_scan(c, lnum, 0, buf, 0);
+		if (!IS_ERR(sleb)) {
+			/* Scan succeeded */
+			vfree(buf);
+			return 0;
+		}
+
+		ubifs_err("scanning after LEB %d change failed, error %d!", lnum, err);
+		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1,
+			       buf, c->leb_size, 1);
+		dump_stack();
+		vfree(buf);
+		return -EINVAL;
+	}
+
 	return err;
 }
 
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
