Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BKwFV-0002Bx-5C
	for linux-mtd@lists.infradead.org; Tue, 04 May 2004 10:30:01 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i449ZIc21768
	for <linux-mtd@lists.infradead.org>;
	Tue, 4 May 2004 12:35:18 +0300 (EEST)
Message-ID: <40975FDA.3080904@intracom.gr>
Date: Tue, 04 May 2004 12:18:18 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
   Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed;
 boundary="------------050109080900060509000704"
Subject: MTD util patch for NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050109080900060509000704
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello

The following patch fixes nandwrite/eraseall to work correctly on NANDs with
the current mtd code.

There is a new option for nandwrite -a/--autoplace which places the OOB
bytes according to the autoplaced OOB of the current code.

Regards

Pantelis


--------------050109080900060509000704
Content-Type: text/x-patch;
 name="mtd-util-nand.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-util-nand.diff"

diff -ruN mtd-original/util/eraseall.c mtd-work/util/eraseall.c
--- mtd-original/util/eraseall.c	2003-05-03 01:00:10.000000000 +0300
+++ mtd-work/util/eraseall.c	2004-05-04 12:09:23.543752712 +0300
@@ -111,8 +111,20 @@
 			struct mtd_oob_buf oob;
 			oob.ptr = (unsigned char *) &cleanmarker;
 			oob.start = erase.start;
-			oob.start += meminfo.oobsize == 16 ? 8 : 6;
-			oob.length = meminfo.oobsize == 16 ? 8 : 2;
+			switch (meminfo.oobsize) {
+				case 8:
+					oob.start += 6;
+					oob.length = 2;
+					break;
+				case 16:
+					oob.start += 8;
+					oob.length = 8;
+					break;
+				case 64:
+					oob.start += 2;
+					oob.length = 8;
+					break;
+			}
 			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
 				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
diff -ruN mtd-original/util/nandwrite.c mtd-work/util/nandwrite.c
--- mtd-original/util/nandwrite.c	2003-05-01 01:00:28.000000000 +0300
+++ mtd-work/util/nandwrite.c	2004-05-03 15:03:43.045463248 +0300
@@ -47,24 +47,29 @@
 
 // oob layouts to pass into the kernel as default
 struct nand_oobinfo none_oobinfo = { 
-	useecc: 0,
+	.useecc = MTD_NANDECC_OFF,
 };
 
 struct nand_oobinfo jffs2_oobinfo = { 
-	useecc: 1,
-	eccpos:	{ 0, 1, 2, 3, 6, 7}
+	.useecc = MTD_NANDECC_PLACE,
+	.eccpos = { 0, 1, 2, 3, 6, 7 }
 };
 
 struct nand_oobinfo yaffs_oobinfo = { 
-	useecc: 1,
-	eccpos:	{ 8, 9, 10, 13, 14, 15}
+	.useecc = MTD_NANDECC_PLACE,
+	.eccpos = { 8, 9, 10, 13, 14, 15}
+};
+
+struct nand_oobinfo autoplace_oobinfo = {
+	.useecc = MTD_NANDECC_AUTOPLACE
 };
 
 void display_help (void)
 {
 	printf("Usage: nandwrite [OPTION] MTD_DEVICE INPUTFILE\n"
-	       "Erases all of the specified MTD device.\n"
+	       "Writes to the specified MTD device.\n"
 	       "\n"
+	       "  -a, --autoplace  	Use auto oob layout\n"
 	       "  -j, --jffs2  	 	force jffs2 oob layout\n"
 	       "  -y, --yaffs  	 	force yaffs oob layout\n"
 	       "  -n, --noecc		write without ecc\n"
@@ -95,6 +100,7 @@
 int 	mtdoffset = 0;
 int 	quiet = 0;
 int	writeoob = 0;
+int	autoplace = 0;
 int	forcejffs2 = 0;
 int	forceyaffs = 0;
 int	noecc = 0;
@@ -105,12 +111,13 @@
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "os:jynq";
+		static const char *short_options = "os:ajynq";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
 			{"oob", no_argument, 0, 'o'},
 			{"start", required_argument, 0, 's'},
+			{"autoplace", no_argument, 0, 'a'},
 			{"jffs2", no_argument, 0, 'j'},
 			{"yaffs", no_argument, 0, 'y'},
 			{"noecc", no_argument, 0, 'n'},
@@ -138,6 +145,9 @@
 		case 'q':
 			quiet = 1;
 			break;
+		case 'a':
+			autoplace = 1;
+			break;
 		case 'j':
 			forcejffs2 = 1;
 			break;
@@ -166,14 +176,13 @@
 	img = argv[optind];
 }
 
-
 /*
  * Main program
  */
 int main(int argc, char **argv)
 {
 	int cnt, fd, ifd, imglen, pagelen, blockstart = -1;
-	mtd_info_t meminfo;
+	struct mtd_info_user meminfo;
 	struct mtd_oob_buf oob;
 
 	process_options(argc, argv);
@@ -208,6 +217,15 @@
 		} 
 	}
 
+	// autoplace ECC ?
+	if (autoplace) {
+		if (ioctl (fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
+			perror ("MEMSETOOBSEL");
+			close (fd);
+			exit (1);
+		} 
+	}
+
 	// force oob layout for jffs2 or yaffs ?
 	if (forcejffs2 || forceyaffs) {
 		struct nand_oobinfo *oobsel = forcejffs2 ? &jffs2_oobinfo : &yaffs_oobinfo;

--------------050109080900060509000704--
