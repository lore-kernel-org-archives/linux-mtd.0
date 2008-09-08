Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaVG-000548-MC
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:45:38 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] [MTD-UTILS] nanddump: Pass Real Names as Arguments to
	perror
Date: Sun,  7 Sep 2008 23:45:36 -0700
Message-Id: <1220856336-22772-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pass the MTD device node and dump file name as arguments to perror
rather than more ambigous, static messages on open failures.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nanddump.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 8c7175c..168fbbb 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -182,7 +182,7 @@ int main(int argc, char * const argv[])
 
 	/* Open MTD device */
 	if ((fd = open(mtddev, O_RDONLY)) == -1) {
-		perror("open flash");
+		perror(mtddev);
 		exit (EXIT_FAILURE);
 	}
 
@@ -249,7 +249,7 @@ int main(int argc, char * const argv[])
 	if (!dumpfile) {
 		ofd = STDOUT_FILENO;
 	} else if ((ofd = open(dumpfile, O_WRONLY | O_TRUNC | O_CREAT, 0644))== -1) {
-		perror ("open outfile");
+		perror (dumpfile);
 		close(fd);
 		exit(EXIT_FAILURE);
 	}
-- 
1.6.0.1
