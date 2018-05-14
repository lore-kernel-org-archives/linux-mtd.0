Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8hP-0003PJ-4x
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:16 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/6] ubifs: journal: Remove wrong comment
Date: Mon, 14 May 2018 10:18:15 +0200
Message-Id: <20180514081819.20921-3-s.hauer@pengutronix.de>
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

In the description of reserve_space() it is claimed that write_node()
and write_head() unlock the journal head. This is not true and has never
been true. All callers of write_node() and write_head() call
release_head() themselves. Remove the wrong comment.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/journal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 04c4ec6483e5..da8afdfccaa6 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -98,9 +98,8 @@ static inline void zero_trun_node_unused(struct ubifs_trun_node *trun)
  *
  * This function reserves space in journal head @head. If the reservation
  * succeeded, the journal head stays locked and later has to be unlocked using
- * 'release_head()'. 'write_node()' and 'write_head()' functions also unlock
- * it. Returns zero in case of success, %-EAGAIN if commit has to be done, and
- * other negative error codes in case of other failures.
+ * 'release_head()'. Returns zero in case of success, %-EAGAIN if commit has to
+ * be done, and other negative error codes in case of other failures.
  */
 static int reserve_space(struct ubifs_info *c, int jhead, int len)
 {
-- 
2.17.0
