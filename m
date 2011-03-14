Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz8ze-0000nI-94
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:43:37 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEhT11004527
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:43:29 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 2/6] UBIFS: allocate scanning buffer on demand
Date: Mon, 14 Mar 2011 16:46:08 +0200
Message-Id: <1300113972-4507-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
References: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using pre-allocated 'c->dbg->buf' buffer in
'scan_check_cb()', dynamically allocate it when needed. The intend
is to get rid of the pre-allocated 'c->dbg->buf' buffer and save
128KiB of RAM (or more if PEB size is larger). Indeed, currently we
allocate this memory even if the user never enables any self-check,
which is wasteful.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lprops.c |   26 ++++++++++++++++++++------
 1 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 4d4ca38..c7b25e2 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1035,7 +1035,8 @@ static int scan_check_cb(struct ubifs_info *c,
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
 	struct ubifs_lp_stats *lst = &data->lst;
-	int cat, lnum = lp->lnum, is_idx = 0, used = 0, free, dirty;
+	int cat, lnum = lp->lnum, is_idx = 0, used = 0, free, dirty, ret;
+	void *buf = NULL;
 
 	cat = lp->flags & LPROPS_CAT_MASK;
 	if (cat != LPROPS_UNCAT) {
@@ -1093,7 +1094,13 @@ static int scan_check_cb(struct ubifs_info *c,
 		}
 	}
 
-	sleb = ubifs_scan(c, lnum, 0, c->dbg->buf, 0);
+	buf = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf) {
+		ubifs_err("cannot allocate memory to scan LEB %d", lnum);
+		goto out;
+	}
+
+	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
 		/*
 		 * After an unclean unmount, empty and freeable LEBs
@@ -1105,7 +1112,8 @@ static int scan_check_cb(struct ubifs_info *c,
 			lst->empty_lebs += 1;
 			lst->total_free += c->leb_size;
 			lst->total_dark += ubifs_calc_dark(c, c->leb_size);
-			return LPT_SCAN_CONTINUE;
+			ret = LPT_SCAN_CONTINUE;
+			goto exit;
 		}
 
 		if (lp->free + lp->dirty == c->leb_size &&
@@ -1115,10 +1123,12 @@ static int scan_check_cb(struct ubifs_info *c,
 			lst->total_free  += lp->free;
 			lst->total_dirty += lp->dirty;
 			lst->total_dark  +=  ubifs_calc_dark(c, c->leb_size);
-			return LPT_SCAN_CONTINUE;
+			ret = LPT_SCAN_CONTINUE;
+			goto exit;
 		}
 		data->err = PTR_ERR(sleb);
-		return LPT_SCAN_STOP;
+		ret = LPT_SCAN_STOP;
+		goto exit;
 	}
 
 	is_idx = -1;
@@ -1236,7 +1246,10 @@ static int scan_check_cb(struct ubifs_info *c,
 	}
 
 	ubifs_scan_destroy(sleb);
-	return LPT_SCAN_CONTINUE;
+	ret = LPT_SCAN_CONTINUE;
+exit:
+	vfree(buf);
+	return ret;
 
 out_print:
 	ubifs_err("bad accounting of LEB %d: free %d, dirty %d flags %#x, "
@@ -1246,6 +1259,7 @@ out_print:
 out_destroy:
 	ubifs_scan_destroy(sleb);
 out:
+	vfree(buf);
 	data->err = -EINVAL;
 	return LPT_SCAN_STOP;
 }
-- 
1.7.2.3
