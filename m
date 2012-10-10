Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLrPv-0003TY-Te
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 08:13:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brent Taylor <motobud@gmail.com>
Subject: [PATCH 1/2] UBIFS: introduce categorized lprops counter
Date: Wed, 10 Oct 2012 11:13:34 +0300
Message-Id: <1349856815-22893-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This commit is a preparation for a subsequent bugfix. We introduce a
counter for categorized lprops.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 fs/ubifs/lprops.c |    6 ++++++
 fs/ubifs/ubifs.h  |    3 +++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 86eb8e5..b33ec7a 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -300,8 +300,11 @@ void ubifs_add_to_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
 	default:
 		ubifs_assert(0);
 	}
+
 	lprops->flags &= ~LPROPS_CAT_MASK;
 	lprops->flags |= cat;
+	c->in_a_category_cnt += 1;
+	ubifs_assert(c->in_a_category_cnt <= c->main_lebs);
 }
 
 /**
@@ -334,6 +337,9 @@ static void ubifs_remove_from_cat(struct ubifs_info *c,
 	default:
 		ubifs_assert(0);
 	}
+
+	c->in_a_category_cnt -= 1;
+	ubifs_assert(c->in_a_category_cnt >= 0);
 }
 
 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1e5a086..51ac3e6 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1184,6 +1184,8 @@ struct ubifs_debug_info;
  * @freeable_list: list of freeable non-index LEBs (free + dirty == @leb_size)
  * @frdi_idx_list: list of freeable index LEBs (free + dirty == @leb_size)
  * @freeable_cnt: number of freeable LEBs in @freeable_list
+ * @in_a_category_cnt: count of lprops which are in a certain category, which
+ *                     basically meants that they were loaded from the flash
  *
  * @ltab_lnum: LEB number of LPT's own lprops table
  * @ltab_offs: offset of LPT's own lprops table
@@ -1413,6 +1415,7 @@ struct ubifs_info {
 	struct list_head freeable_list;
 	struct list_head frdi_idx_list;
 	int freeable_cnt;
+	int in_a_category_cnt;
 
 	int ltab_lnum;
 	int ltab_offs;
-- 
1.7.7.6
