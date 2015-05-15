Received: from mailrelay101.isp.belgacom.be ([195.238.20.128])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtNPN-0003cx-1h
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 21:44:41 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6 linux-next] ubifs: simplify return in layout_cnodes()
Date: Fri, 15 May 2015 23:43:57 +0200
Message-Id: <1431726240-4675-3-git-send-email-fabf@skynet.be>
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

Directly return dbg_chk_lpt_sz() instead of storing
value in err and testing it.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/lpt_commit.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index ce89bdc..79a8e96 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -313,10 +313,7 @@ static int layout_cnodes(struct ubifs_info *c)
 	alen = ALIGN(offs, c->min_io_size);
 	upd_ltab(c, lnum, c->leb_size - alen, alen - offs);
 	dbg_chk_lpt_sz(c, 4, alen - offs);
-	err = dbg_chk_lpt_sz(c, 3, alen);
-	if (err)
-		return err;
-	return 0;
+	return dbg_chk_lpt_sz(c, 3, alen);
 
 no_space:
 	ubifs_err(c, "LPT out of space at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
-- 
2.4.0
