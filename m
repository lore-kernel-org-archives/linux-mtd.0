Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oybdc-0005bT-LJ
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:34:21 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 80E2D1B4060
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 02:34:19 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ftl_check: drop unused verbose flag
Date: Wed, 22 Sep 2010 22:33:32 -0400
Message-Id: <1285209212-32647-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The verbose flag isn't actually checked anywhere, so punt it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ftl_check.c |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/ftl_check.c b/ftl_check.c
index f41e79a..485eaa8 100644
--- a/ftl_check.c
+++ b/ftl_check.c
@@ -79,7 +79,7 @@ static void print_size(u_int s)
 
 /*====================================================================*/
 
-static void check_partition(int fd, int verbose)
+static void check_partition(int fd)
 {
 	mtd_info_t mtd;
 	erase_unit_header_t hdr, hdr2;
@@ -180,26 +180,21 @@ static void check_partition(int fd, int verbose)
 /* Show usage information */
 void showusage(char *pname)
 {
-	fprintf(stderr, "usage: %s [-v] device\n", pname);
-	fprintf(stderr, "-v verbose messages\n");
+	fprintf(stderr, "usage: %s device\n", pname);
 }
 
 /*====================================================================*/
 
 int main(int argc, char *argv[])
 {
-	int verbose;
 	int optch, errflg, fd;
 	struct stat buf;
 
 	errflg = 0;
-	verbose = 0;
-	while ((optch = getopt(argc, argv, "vh")) != -1) {
+	while ((optch = getopt(argc, argv, "h")) != -1) {
 		switch (optch) {
 			case 'h':
 				errflg = 1; break;
-			case 'v':
-				verbose = 1; break;
 			default:
 				errflg = -1; break;
 		}
@@ -224,7 +219,7 @@ int main(int argc, char *argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	check_partition(fd, verbose);
+	check_partition(fd);
 	close(fd);
 
 	exit(EXIT_SUCCESS);
-- 
1.7.3
