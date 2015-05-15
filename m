Received: from mailrelay101.isp.belgacom.be ([195.238.20.128])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtNPN-0003d0-4B
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 21:44:41 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6 linux-next] ubifs: simplify return in sort_nodes()
Date: Fri, 15 May 2015 23:43:58 +0200
Message-Id: <1431726240-4675-4-git-send-email-fabf@skynet.be>
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

Directly return dbg_check_nondata_nodes_order()
instead of storing value in err and testing it.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/gc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 9718da8..bf0a3eb 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -301,10 +301,7 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	err = dbg_check_data_nodes_order(c, &sleb->nodes);
 	if (err)
 		return err;
-	err = dbg_check_nondata_nodes_order(c, nondata);
-	if (err)
-		return err;
-	return 0;
+	return dbg_check_nondata_nodes_order(c, nondata);
 }
 
 /**
-- 
2.4.0
