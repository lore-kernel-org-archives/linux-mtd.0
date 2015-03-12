Received: from mailrelay116.isp.belgacom.be ([195.238.20.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW9oh-0004o8-Ka
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 20:34:52 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V2 linux-next] UBIFS: simplify returns
Date: Thu, 12 Mar 2015 21:34:21 +0100
Message-Id: <1426192461-16011-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 geert@linux-m68k.org, Adrian Hunter <adrian.hunter@intel.com>,
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
V2: Keep curly braces around comment + 1 line in if.
    (suggested by Geert Uytterhoeven)

 fs/ubifs/recovery.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c640938..13ca4db 100644
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
@@ -1004,10 +1001,7 @@ static int clean_an_unclean_leb(struct ubifs_info *c,
 
 	if (len == 0) {
 		/* Nothing to read, just unmap it */
-		err = ubifs_leb_unmap(c, lnum);
-		if (err)
-			return err;
-		return 0;
+		return ubifs_leb_unmap(c, lnum);
 	}
 
 	err = ubifs_leb_read(c, lnum, buf, offs, len, 0);
-- 
1.9.1
