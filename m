Received: from mailrelay101.isp.belgacom.be ([195.238.20.128])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtNPO-0003d0-8W
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 21:44:43 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6 linux-next] ubifs: remove else after return
Date: Fri, 15 May 2015 23:44:00 +0200
Message-Id: <1431726240-4675-6-git-send-email-fabf@skynet.be>
In-Reply-To: <1431726240-4675-1-git-send-email-fabf@skynet.be>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

simplify code in add_to_lpt_heap()

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/lprops.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index a0011aa..e1454cf 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -208,13 +208,12 @@ static int add_to_lpt_heap(struct ubifs_info *c, struct ubifs_lprops *lprops,
 		}
 		dbg_check_heap(c, heap, cat, -1);
 		return 0; /* Not added to heap */
-	} else {
-		lprops->hpos = heap->cnt++;
-		heap->arr[lprops->hpos] = lprops;
-		move_up_lpt_heap(c, heap, lprops, cat);
-		dbg_check_heap(c, heap, cat, lprops->hpos);
-		return 1; /* Added to heap */
 	}
+	lprops->hpos = heap->cnt++;
+	heap->arr[lprops->hpos] = lprops;
+	move_up_lpt_heap(c, heap, lprops, cat);
+	dbg_check_heap(c, heap, cat, lprops->hpos);
+	return 1; /* Added to heap */
 }
 
 /**
-- 
2.4.0
