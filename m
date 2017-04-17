Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czwI8-0005AR-Lg
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 02:21:27 +0000
From: Stefan Agner <stefan@agner.ch>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH] UBIFS: remove unnecessary assignment
Date: Sun, 16 Apr 2017 19:22:43 -0700
Message-Id: <20170417022243.4459-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Assigning a value of a variable to itself is not useful.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 fs/ubifs/recovery.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 586d59347fff..3af4472061cc 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -442,7 +442,6 @@ static void clean_buf(const struct ubifs_info *c, void **buf, int lnum,
 {
 	int empty_offs, pad_len;
 
-	lnum = lnum;
 	dbg_rcvry("cleaning corruption at %d:%d", lnum, *offs);
 
 	ubifs_assert(!(*offs & 7));
-- 
2.12.2
