Received: from mailrelay109.isp.belgacom.be ([195.238.20.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVkhB-0001Az-RV
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 17:45:27 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1 linux-next] UBIFS: simplify returns
Date: Wed, 11 Mar 2015 18:44:51 +0100
Message-Id: <1426095891-17827-1-git-send-email-fabf@skynet.be>
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

directly return recover_head() and ubifs_leb_unmap()
instead of storing value in err and testing it.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/recovery.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c640938..a2e1f7f 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -975,11 +975,8 @@ int ubifs_recover_inl_heads(struct ubifs_info *c, void *sbuf)
 		return err;
 
 	dbg_rcvry("checking LPT head at %d:%d", c->nhead_lnum, c->nhead_offs);
-	err = recover_head(c, c->nhead_lnum, c->nhead_offs, sbuf);
-	if (err)
-		return err;
 
-	return 0;
+	return recover_head(c, c->nhead_lnum, c->nhead_offs, sbuf);
 }
 
 /**
@@ -1002,13 +999,9 @@ static int clean_an_unclean_leb(struct ubifs_info *c,
 
 	dbg_rcvry("LEB %d len %d", lnum, len);
 
-	if (len == 0) {
+	if (len == 0)
 		/* Nothing to read, just unmap it */
-		err = ubifs_leb_unmap(c, lnum);
-		if (err)
-			return err;
-		return 0;
-	}
+		return ubifs_leb_unmap(c, lnum);
 
 	err = ubifs_leb_read(c, lnum, buf, offs, len, 0);
 	if (err && err != -EBADMSG)
-- 
1.9.1
