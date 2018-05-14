Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8h9-00027E-86
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:13 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/6] ubifs: Spelling fix someting -> something
Date: Mon, 14 May 2018 10:18:16 +0200
Message-Id: <20180514081819.20921-4-s.hauer@pengutronix.de>
In-Reply-To: <20180514081819.20921-1-s.hauer@pengutronix.de>
References: <20180514081819.20921-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace "someting" with "something"

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index f10a72a75ed7..85c2a43082b7 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1034,7 +1034,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 			 * The head of the log must always start with the
 			 * "commit start" node on a properly formatted UBIFS.
 			 * But we found no nodes at all, which means that
-			 * someting went wrong and we cannot proceed mounting
+			 * something went wrong and we cannot proceed mounting
 			 * the file-system.
 			 */
 			ubifs_err(c, "no UBIFS nodes found at the log head LEB %d:%d, possibly corrupted",
-- 
2.17.0
