Received: from swampdragon.chaosbits.net ([90.184.90.115])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QWDhG-0004bq-Ag
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 20:25:19 +0000
Date: Mon, 13 Jun 2011 22:16:44 +0200 (CEST)
From: Jesper Juhl <jj@chaosbits.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH/Trivial] jffs2: Avoid unneeded 'if' before kfree
Message-ID: <alpine.LNX.2.00.1106132213500.30934@swampdragon.chaosbits.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: trivial@kernel.org, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kfree() deals gracefully with NULL pointers, so it's pointless to test for 
one prior to calling it.
This removes such a test from jffs2_scan_medium().

Signed-off-by: Jesper Juhl <jj@chaosbits.net>
---
 scan.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 8d8cd34..28107ca 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -275,9 +275,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	else
 		c->mtd->unpoint(c->mtd, 0, c->mtd->size);
 #endif
-	if (s)
-		kfree(s);
-
+	kfree(s);
 	return ret;
 }
 

-- 
Jesper Juhl <jj@chaosbits.net>       http://www.chaosbits.net/
Don't top-post http://www.catb.org/jargon/html/T/top-post.html
Plain text mails only, please.
