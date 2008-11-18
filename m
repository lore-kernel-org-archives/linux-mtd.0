Received: from ex.2n.cz ([213.29.92.11])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L2Vks-0006Ga-96
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 18:56:54 +0000
Date: Tue, 18 Nov 2008 19:56:52 +0100
To: Stefan Roese <sr@denx.de>
Subject: Re: flash_eraseall reports incorrect percentage
Message-ID: <20081118185652.GA32157@michl.2n.cz>
References: <200801301403.13149.sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <200801301403.13149.sr@denx.de>
From: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 30, 2008 at 02:03:13PM +0100, Stefan Roese wrote:
> It seems that the flash_eraseall utility doesn't report the correct percentage 
> upon completion. After erasing the last sector, the output seems not to get 
> updated anymore. This leads to something like this on a partition with only 2 
> sectors:
> 
> flash_eraseall /dev/mtd6
> Erasing 256 Kibyte @ 40000 -- 50 % complete.
> 
> I'm just posting this report as a reference. Perhaps somebody has a little 
> time to fix it.

Well, I sacrificed a little time otherwise used to prepare supper, but
fridge is emty...

# flash_eraseall /dev/mtd4
Erasing 128 Kibyte @ 2800000 -- 100 % complete.

flash_eraseall
 * fix percentage reporting
 * exit()ing from main() is overkill, just return

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 60036d3..a22fc49 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -49,6 +49,7 @@ static int quiet;		/* true -- don't output progress */
 static int jffs2;		// format for jffs2 usage
 
 static void process_options (int argc, char *argv[]);
+void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
 static void display_help (void);
 static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
@@ -63,16 +64,15 @@ int main (int argc, char *argv[])
 
 	process_options(argc, argv);
 
-
 	if ((fd = open(mtd_device, O_RDWR)) < 0) {
 		fprintf(stderr, "%s: %s: %s\n", exe_name, mtd_device, strerror(errno));
-		exit(1);
+		return 1;
 	}
 
 
 	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
 		fprintf(stderr, "%s: %s: unable to get MTD device info\n", exe_name, mtd_device);
-		exit(1);
+		return 1;
 	}
 
 	erase.length = meminfo.erasesize;
@@ -88,7 +88,7 @@ int main (int argc, char *argv[])
 
 			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
 				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
-				exit(1);
+				return 1;
 			}
 
 			/* Check for autoplacement */
@@ -96,7 +96,7 @@ int main (int argc, char *argv[])
 				/* Get the position of the free bytes */
 				if (!oobinfo.oobfree[0][1]) {
 					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
-					exit(1);
+					return 1;
 				}
 				clmpos = oobinfo.oobfree[0][0];
 				clmlen = oobinfo.oobfree[0][1];
@@ -137,23 +137,17 @@ int main (int argc, char *argv[])
 					bbtest = 0;
 					if (isNAND) {
 						fprintf(stderr, "%s: %s: Bad block check not available\n", exe_name, mtd_device);
-						exit(1);
+						return 1;
 					}
 				} else {
 					fprintf(stderr, "\n%s: %s: MTD get bad block failed: %s\n", exe_name, mtd_device, strerror(errno));
-					exit(1);
+					return 1;
 				}
 			}
 		}
 
-		if (!quiet) {
-			printf
-				("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
-				 meminfo.erasesize / 1024, erase.start,
-				 (unsigned long long)
-				 erase.start * 100 / meminfo.size);
-		}
-		fflush(stdout);
+		if (!quiet)
+			show_progress(&meminfo, &erase);
 
 		if (ioctl(fd, MEMERASE, &erase) != 0) {
 			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name, mtd_device, strerror(errno));
@@ -187,8 +181,10 @@ int main (int argc, char *argv[])
 		if (!quiet)
 			printf (" Cleanmarker written at %x.", erase.start);
 	}
-	if (!quiet)
+	if (!quiet) {
+		show_progress(&meminfo, &erase);
 		printf("\n");
+	}
 
 	return 0;
 }
@@ -254,6 +250,13 @@ void process_options (int argc, char *argv[])
 	mtd_device = argv[optind];
 }
 
+void show_progress (mtd_info_t *meminfo, erase_info_t *erase)
+{
+	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
+		meminfo->erasesize / 1024, erase->start,
+		(unsigned long long) erase->start * 100 / meminfo->size);
+	fflush(stdout);
+}
 
 void display_help (void)
 {
