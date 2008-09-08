Received: from relay03.pair.com ([209.68.5.17])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaVA-00043D-2g
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:45:32 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] [MTD-UTILS] nanddump: Utilize Standard Exit Mnemonics
Date: Sun,  7 Sep 2008 23:45:29 -0700
Message-Id: <1220856329-22740-1-git-send-email-gerickson@nuovations.com>
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
 nanddump.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index e35caf8..8c7175c 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -51,7 +51,7 @@ static void display_help (void)
 			"-b         --omitbad            omit bad blocks from the dump\n"
 			"-p         --prettyprint        print nice (hexdump)\n"
 			"-s addr    --startaddress=addr  start address\n");
-	exit(0);
+	exit(EXIT_SUCCESS);
 }
 
 static void display_version (void)
@@ -64,7 +64,7 @@ static void display_version (void)
 			"You may redistribute copies of " PROGRAM "\n"
 			"under the terms of the GNU General Public Licence.\n"
 			"See the file `COPYING' for more information.\n");
-	exit(0);
+	exit(EXIT_SUCCESS);
 }
 
 // Option variables
@@ -126,7 +126,7 @@ static void process_options (int argc, char * const argv[])
 			case 'f':
 				if (!(dumpfile = strdup(optarg))) {
 					perror("stddup");
-					exit(1);
+					exit(EXIT_FAILURE);
 				}
 				break;
 			case 'i':
@@ -183,14 +183,14 @@ int main(int argc, char * const argv[])
 	/* Open MTD device */
 	if ((fd = open(mtddev, O_RDONLY)) == -1) {
 		perror("open flash");
-		exit (1);
+		exit (EXIT_FAILURE);
 	}
 
 	/* Fill in MTD device capability structure */
 	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
 		perror("MEMGETINFO");
 		close(fd);
-		exit (1);
+		exit (EXIT_FAILURE);
 	}
 
 	/* Make sure device page sizes are valid */
@@ -201,7 +201,7 @@ int main(int argc, char * const argv[])
 			!(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
 		close(fd);
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 	/* Read the real oob length */
 	oob.length = meminfo.oobsize;
@@ -216,19 +216,19 @@ int main(int argc, char * const argv[])
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
 	} else {
@@ -251,7 +251,7 @@ int main(int argc, char * const argv[])
 	} else if ((ofd = open(dumpfile, O_WRONLY | O_TRUNC | O_CREAT, 0644))== -1) {
 		perror ("open outfile");
 		close(fd);
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Initialize start/end addresses and block size */
@@ -379,7 +379,7 @@ int main(int argc, char * const argv[])
 			perror ("MEMSETOOBSEL");
 			close(fd);
 			close(ofd);
-			return 1;
+			return EXIT_FAILURE;
 		}
 	}
 	/* Close the output file and MTD device */
@@ -387,7 +387,7 @@ int main(int argc, char * const argv[])
 	close(ofd);
 
 	/* Exit happy */
-	return 0;
+	return EXIT_SUCCESS;
 
 closeall:
 	/* The new mode change is per file descriptor ! */
@@ -398,5 +398,5 @@ closeall:
 	}
 	close(fd);
 	close(ofd);
-	exit(1);
+	exit(EXIT_FAILURE);
 }
-- 
1.6.0.1
