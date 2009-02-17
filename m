Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZQY3-0006gv-HR
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 14:03:46 +0000
Received: by ey-out-1920.google.com with SMTP id 4so228075eyg.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Feb 2009 06:03:42 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: handle non-power-of-2 erase size (E.G. for
	dataflash)
Date: Tue, 17 Feb 2009 15:03:40 +0100
Message-Id: <1234879420-29736-1-git-send-email-jacmet@sunsite.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 flashcp.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/flashcp.c b/flashcp.c
index 7f7764a..8775022 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -255,8 +255,9 @@ int main (int argc,char *argv[])
 #warning "Check for smaller erase regions"
 
 	erase.start = 0;
-	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
-	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
+	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
+	erase.length *= mtd.erasesize;
+
 	if (flags & FLAG_VERBOSE)
 	{
 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
-- 
1.5.6.5
