Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSoMl-0000oe-37
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 18:51:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubifs: Fix memory leak in lprobs self-check
Date: Tue, 12 Jun 2018 20:49:45 +0200
Message-Id: <20180612184945.7544-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allocate the buffer after we return early.
Otherwise memory is being leaked.

Cc: <stable@vger.kernel.org>
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/lprops.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index f5a46844340c..8ade493a423a 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1089,10 +1089,6 @@ static int scan_check_cb(struct ubifs_info *c,
 		}
 	}
 
-	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	/*
 	 * After an unclean unmount, empty and freeable LEBs
 	 * may contain garbage - do not scan them.
@@ -1111,6 +1107,10 @@ static int scan_check_cb(struct ubifs_info *c,
 		return LPT_SCAN_CONTINUE;
 	}
 
+	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
 	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
 		ret = PTR_ERR(sleb);
-- 
2.13.6
