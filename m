Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5eDe-0004Hl-PN
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 14:21:27 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBI: fix eraseblock picking criteria
Date: Thu,  8 Mar 2012 16:21:31 +0200
Message-Id: <1331216491-6728-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1331216491-6728-1-git-send-email-dedekind1@gmail.com>
References: <1331216491-6728-1-git-send-email-dedekind1@gmail.com>
Cc: Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'find_wl_entry()' function expects the maximum difference as the second
argument, not the maximum absolute value. So the "unknown" eraseblock picking
was incorrect, as Shmulik Ladkani spotted. This patch fixes the issue.

Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Cc: stable@kernel.org
---
 drivers/mtd/ubi/wl.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8616f52..512eab0 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -390,7 +390,7 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
  */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
-	int err, medium_ec;
+	int err;
 	struct ubi_wl_entry *e, *first, *last;
 
 	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
@@ -428,7 +428,7 @@ retry:
 		 * For unknown data we pick a physical eraseblock with medium
 		 * erase counter. But we by no means can pick a physical
 		 * eraseblock with erase counter greater or equivalent than the
-		 * lowest erase counter plus %WL_FREE_MAX_DIFF.
+		 * lowest erase counter plus %WL_FREE_MAX_DIFF/2.
 		 */
 		first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry,
 					u.rb);
@@ -437,10 +437,8 @@ retry:
 		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
 			e = rb_entry(ubi->free.rb_node,
 					struct ubi_wl_entry, u.rb);
-		else {
-			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
-			e = find_wl_entry(&ubi->free, medium_ec);
-		}
+		else
+			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
 		break;
 	case UBI_SHORTTERM:
 		/*
-- 
1.7.9.1
