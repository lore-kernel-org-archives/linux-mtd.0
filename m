Received: from assei2bl6.telenet-ops.be ([195.130.133.69])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLQRV-00028m-Aj
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 14:53:30 -0500
To: linux-mtd@lists.infradead.org
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Mar 2006 20:53:38 +0100
Message-ID: <87hd5slwot.fsf@48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mtd/redboot: Handle holes in fis table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Redboot simply sets the first character of a fis entry to 0xff on
"fis delete". The kernel redboot parser stops parsing on such an
entry, and without this patch any entries after a deleted image would
not be detected.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
--

 drivers/mtd/redboot.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

Index: linux/drivers/mtd/redboot.c
===================================================================
--- linux.orig/drivers/mtd/redboot.c	2006-03-20 15:54:37.000000000 +0100
+++ linux/drivers/mtd/redboot.c	2006-03-20 16:00:06.000000000 +0100
@@ -85,10 +85,6 @@
 
 	numslots = (master->erasesize / sizeof(struct fis_image_desc));
 	for (i = 0; i < numslots; i++) {
-		if (buf[i].name[0] == 0xff) {
-			i = numslots;
-			break;
-		}
 		if (!memcmp(buf[i].name, "FIS directory", 14)) {
 			/* This is apparently the FIS directory entry for the
 			 * FIS directory itself.  The FIS directory size is
@@ -128,7 +124,7 @@
 		struct fis_list *new_fl, **prev;
 
 		if (buf[i].name[0] == 0xff)
-			break;
+			continue;
 		if (!redboot_checksum(&buf[i]))
 			break;
 
-- 
Bye, Peter Korsgaard
