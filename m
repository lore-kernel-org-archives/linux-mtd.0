Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Z0-RL
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eT3x011095
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/20] UBIFS: simplify error path in lprops debugging check
Date: Mon, 16 May 2011 10:44:21 +0300
Message-Id: <1305531879-19311-3-git-send-email-dedekind1@gmail.com>
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

Simplify error path in 'scan_check_cb()' and stop using the special 'data->err'
field, but instead return the error code directly.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lprops.c |   25 ++++++++++---------------
 1 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index ce9fe39..ac4521a 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1044,7 +1044,7 @@ static int scan_check_cb(struct ubifs_info *c,
 		if (cat != (lp->flags & LPROPS_CAT_MASK)) {
 			ubifs_err("bad LEB category %d expected %d",
 				  (lp->flags & LPROPS_CAT_MASK), cat);
-			goto out;
+			return -EINVAL;
 		}
 	}
 
@@ -1078,7 +1078,7 @@ static int scan_check_cb(struct ubifs_info *c,
 			}
 			if (!found) {
 				ubifs_err("bad LPT list (category %d)", cat);
-				goto out;
+				return -EINVAL;
 			}
 		}
 	}
@@ -1090,15 +1090,13 @@ static int scan_check_cb(struct ubifs_info *c,
 		if ((lp->hpos != -1 && heap->arr[lp->hpos]->lnum != lnum) ||
 		    lp != heap->arr[lp->hpos]) {
 			ubifs_err("bad LPT heap (category %d)", cat);
-			goto out;
+			return -EINVAL;
 		}
 	}
 
 	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
-	if (!buf) {
-		ubifs_err("cannot allocate memory to scan LEB %d", lnum);
-		goto out;
-	}
+	if (!buf)
+		return -ENOMEM;
 
 	/*
 	 * After an unclean unmount, empty and freeable LEBs
@@ -1120,9 +1118,8 @@ static int scan_check_cb(struct ubifs_info *c,
 
 	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
-		data->err = PTR_ERR(sleb);
-		ret = LPT_SCAN_STOP;
-		goto exit;
+		ret = PTR_ERR(sleb);
+		goto out;
 	}
 
 	is_idx = -1;
@@ -1240,10 +1237,8 @@ static int scan_check_cb(struct ubifs_info *c,
 	}
 
 	ubifs_scan_destroy(sleb);
-	ret = LPT_SCAN_CONTINUE;
-exit:
 	vfree(buf);
-	return ret;
+	return LPT_SCAN_CONTINUE;
 
 out_print:
 	ubifs_err("bad accounting of LEB %d: free %d, dirty %d flags %#x, "
@@ -1252,10 +1247,10 @@ out_print:
 	dbg_dump_leb(c, lnum);
 out_destroy:
 	ubifs_scan_destroy(sleb);
+	ret = -EINVAL;
 out:
 	vfree(buf);
-	data->err = -EINVAL;
-	return LPT_SCAN_STOP;
+	return ret;
 }
 
 /**
-- 
1.7.2.3
