Received: from reverse-177-55.fdn.fr ([80.67.177.55] helo=alix.dadboo.eu)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFxag-0004tc-Fv
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 05:54:15 +0000
Date: Thu, 23 Jun 2016 07:53:44 +0200
From: Sylvain Etienne <seti@dadboo.eu>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] ubifs: switch_gc_head: remove redondant sync of wbuf
Message-ID: <20160623055344.GA5896@dadboo.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The wbuf is already sync-ed before ubifs_leb_unmap()

Signed-off-by: Sylvain Etienne <seti@dadboo.eu>
---

Notes:
    This is my first patch on this mailing list. Please let me know if I missed
    something.

 fs/ubifs/gc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 9718da8..821b348 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -100,10 +100,6 @@ static int switch_gc_head(struct ubifs_info *c)
 	if (err)
 		return err;
 
-	err = ubifs_wbuf_sync_nolock(wbuf);
-	if (err)
-		return err;
-
 	err = ubifs_add_bud_to_log(c, GCHD, gc_lnum, 0);
 	if (err)
 		return err;
-- 
2.7.4
