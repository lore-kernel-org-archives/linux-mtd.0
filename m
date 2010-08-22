From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Sun, 22 Aug 2010 21:27:30 +0300
Subject: [PATCH] UBIFS: improve error reporting when reading bad node
Message-ID: <mailman.209.1282501841.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

When an error happens during validation of read node, the typical situation is that
the LEB we read is unmapped (due to some bug). It is handy to include the mapping
status into the error message.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index bcf5a16..9432431 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -815,7 +815,8 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 	return 0;
 
 out:
-	ubifs_err("bad node at LEB %d:%d", lnum, offs);
+	ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum, offs,
+		  ubi_is_mapped(c->ubi, lnum));
 	dbg_dump_node(c, buf);
 	dbg_dump_stack();
 	return -EINVAL;
-- 
1.7.2.1
