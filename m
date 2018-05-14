Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8h9-00027B-8f
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:16 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 4/6] ubifs: log: Some spelling fixes
Date: Mon, 14 May 2018 10:18:17 +0200
Message-Id: <20180514081819.20921-5-s.hauer@pengutronix.de>
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

- add missing article
- remove misplaced 'it'
- s/tress/trees

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/log.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 8c795e6392b1..7cffa120a750 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -167,10 +167,10 @@ void ubifs_add_bud(struct ubifs_info *c, struct ubifs_bud *bud)
  * @lnum: LEB number of the bud
  * @offs: starting offset of the bud
  *
- * This function writes reference node for the new bud LEB @lnum it to the log,
- * and adds it to the buds tress. It also makes sure that log size does not
+ * This function writes a reference node for the new bud LEB @lnum to the log,
+ * and adds it to the buds trees. It also makes sure that log size does not
  * exceed the 'c->max_bud_bytes' limit. Returns zero in case of success,
- * %-EAGAIN if commit is required, and a negative error codes in case of
+ * %-EAGAIN if commit is required, and a negative error code in case of
  * failure.
  */
 int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
-- 
2.17.0
