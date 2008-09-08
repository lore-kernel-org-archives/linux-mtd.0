Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcYN0-0002UK-IG
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 04:28:58 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] [MTD-UTILS] nandwrite: Pass Real Names as Arguments to
	perror
Date: Sun,  7 Sep 2008 21:28:56 -0700
Message-Id: <1220848136-22314-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pass the MTD device node and input file name as arguments to perror
rather than more ambigous, static messages on open failures.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
This change results in more meaningful error messages when there is an
error with the MTD device node and input file positional parameters:

	# nandwrite /dev/foobar
	/dev/foobar: No such file or directory

versus:

	# nandwrite /dev/foobar vmlinux
	open flash: No such file or directory

or:

	# nandwrite /dev/mtd8 foobar  
	open input file: No such file or directory

versus:

	# ./nandwrite /dev/mtd8 foobar
	foobar: No such file or directory

 nandwrite.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index b1a4307..e5de140 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -230,7 +230,7 @@ int main(int argc, char * const argv[])
 
 	/* Open the device */
 	if ((fd = open(mtd_device, O_RDWR)) == -1) {
-		perror("open flash");
+		perror(mtd_device);
 		exit (EXIT_FAILURE);
 	}
 
@@ -337,7 +337,7 @@ int main(int argc, char * const argv[])
 
 	/* Open the input file */
 	if ((ifd = open(img, O_RDONLY)) == -1) {
-		perror("open input file");
+		perror(img);
 		goto restoreoob;
 	}
 
-- 
1.6.0.1
