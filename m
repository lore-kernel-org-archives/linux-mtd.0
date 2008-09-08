Received: from relay03.pair.com ([209.68.5.17])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcYMU-0002K5-SF
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 04:28:27 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] [MTD-UTILS] nandwrite: Utilize Standard Exit Mnemonics
Date: Sun,  7 Sep 2008 21:28:24 -0700
Message-Id: <1220848104-22284-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace main exit and return status codes with equivalent mnemonics.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nandwrite.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 8e0609d..b1a4307 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -103,7 +103,7 @@ static void display_version (void)
 			"You may redistribute copies of " PROGRAM "\n"
 			"under the terms of the GNU General Public Licence.\n"
 			"See the file `COPYING' for more information.\n");
-	exit(0);
+	exit (EXIT_SUCCESS);
 }
 
 static const char	*mtd_device, *img;
@@ -225,20 +225,20 @@ int main(int argc, char * const argv[])
 
 	if (pad && writeoob) {
 		fprintf(stderr, "Can't pad when oob data is present.\n");
-		exit(1);
+		exit (EXIT_FAILURE);
 	}
 
 	/* Open the device */
 	if ((fd = open(mtd_device, O_RDWR)) == -1) {
 		perror("open flash");
-		exit(1);
+		exit (EXIT_FAILURE);
 	}
 
 	/* Fill in MTD device capability structure */
 	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
 		perror("MEMGETINFO");
 		close(fd);
-		exit(1);
+		exit (EXIT_FAILURE);
 	}
 
 	/* Set erasesize to specified number of blocks - to match jffs2
@@ -252,7 +252,7 @@ int main(int argc, char * const argv[])
 			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
 		close(fd);
-		exit(1);
+		exit (EXIT_FAILURE);
 	}
 
 	if (autoplace) {
@@ -260,7 +260,7 @@ int main(int argc, char * const argv[])
 		if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
 			perror ("MEMGETOOBSEL");
 			close (fd);
-			exit (1);
+			exit (EXIT_FAILURE);
 		}
 
 		// autoplace ECC ?
@@ -269,7 +269,7 @@ int main(int argc, char * const argv[])
 			if (ioctl (fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
 				perror ("MEMSETOOBSEL");
 				close (fd);
-				exit (1);
+				exit (EXIT_FAILURE);
 			}
 			oobinfochanged = 1;
 		}
@@ -285,19 +285,19 @@ int main(int argc, char * const argv[])
 				if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
 					perror ("MEMGETOOBSEL");
 					close (fd);
-					exit (1);
+					exit (EXIT_FAILURE);
 				}
 				if (ioctl (fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
 					perror ("MEMSETOOBSEL");
 					close (fd);
-					exit (1);
+					exit (EXIT_FAILURE);
 				}
 				oobinfochanged = 1;
 				break;
 			default:
 				perror ("MTDFILEMODE");
 				close (fd);
-				exit (1);
+				exit (EXIT_FAILURE);
 			}
 		}
 	}
@@ -506,7 +506,7 @@ restoreoob:
 		if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
 			perror ("MEMSETOOBSEL");
 			close (fd);
-			exit (1);
+			exit (EXIT_FAILURE);
 		}
 	}
 
@@ -514,9 +514,9 @@ restoreoob:
 
 	if (imglen > 0) {
 		perror ("Data was only partially written due to error\n");
-		exit (1);
+		exit (EXIT_FAILURE);
 	}
 
 	/* Return happy */
-	return 0;
+	return EXIT_SUCCESS;
 }
-- 
1.6.0.1
