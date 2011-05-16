Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Z4-R4
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:08 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTDV011101
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/20] UBIFS: improve debugging lprops scanning a little
Date: Mon, 16 May 2011 10:44:20 +0300
Message-Id: <1305531879-19311-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When doing the lprops extra check ('dbg_check_lprops()') we scan whole media.
We even scan empty and freeable LEBs which may contain garbage, which we handle
after scanning. This patch teach the lprops checking function
('scan_check_cb()') to avoid scanning for free and freeable LEBs and save time.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lprops.c |   42 ++++++++++++++++++------------------------
 1 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 0ee0847..ce9fe39 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1100,32 +1100,26 @@ static int scan_check_cb(struct ubifs_info *c,
 		goto out;
 	}
 
+	/*
+	 * After an unclean unmount, empty and freeable LEBs
+	 * may contain garbage - do not scan them.
+	 */
+	if (lp->free == c->leb_size) {
+		lst->empty_lebs += 1;
+		lst->total_free += c->leb_size;
+		lst->total_dark += ubifs_calc_dark(c, c->leb_size);
+		return LPT_SCAN_CONTINUE;
+	}
+	if (lp->free + lp->dirty == c->leb_size &&
+	    !(lp->flags & LPROPS_INDEX)) {
+		lst->total_free  += lp->free;
+		lst->total_dirty += lp->dirty;
+		lst->total_dark  +=  ubifs_calc_dark(c, c->leb_size);
+		return LPT_SCAN_CONTINUE;
+	}
+
 	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
-		/*
-		 * After an unclean unmount, empty and freeable LEBs
-		 * may contain garbage.
-		 */
-		if (lp->free == c->leb_size) {
-			ubifs_err("scan errors were in empty LEB "
-				  "- continuing checking");
-			lst->empty_lebs += 1;
-			lst->total_free += c->leb_size;
-			lst->total_dark += ubifs_calc_dark(c, c->leb_size);
-			ret = LPT_SCAN_CONTINUE;
-			goto exit;
-		}
-
-		if (lp->free + lp->dirty == c->leb_size &&
-		    !(lp->flags & LPROPS_INDEX)) {
-			ubifs_err("scan errors were in freeable LEB "
-				  "- continuing checking");
-			lst->total_free  += lp->free;
-			lst->total_dirty += lp->dirty;
-			lst->total_dark  +=  ubifs_calc_dark(c, c->leb_size);
-			ret = LPT_SCAN_CONTINUE;
-			goto exit;
-		}
 		data->err = PTR_ERR(sleb);
 		ret = LPT_SCAN_STOP;
 		goto exit;
-- 
1.7.2.3
