Received: from [216.166.168.36] (helo=vpmail.theglobal.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A59ON-0005Up-DV
	for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2003 20:45:39 +0100
Received: from tim.rtg.net (unverified [172.16.40.129]) by
	vpmail.theglobal.net<B0009376289@vpmail.theglobal.net> for
	<linux-mtd@lists.infradead.org>; Thu, 2 Oct 2003 13:43:35 -0600
Received: from tim.rtg.net (localhost [127.0.0.1])h92JiVL4003655
	for <linux-mtd@lists.infradead.org>; Thu, 2 Oct 2003 13:44:31 -0600
Received: from localhost (localhost [[UNIX: localhost]])
	by tim.rtg.net (8.12.3/8.12.3/Submit) id h92JiFmw003647
	for linux-mtd@lists.infradead.org; Thu, 2 Oct 2003 13:44:15 -0600
From: Tim Gardner <timg@tpi.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 2 Oct 2003 13:44:14 -0600
MIME-Version: 1.0
Message-Id: <200310021344.14931.timg@tpi.com>
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_QTA5VQK524MK7Y4JIUPP"
Subject: Patches to nanddump.c
Reply-To: timg@tpi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--------------Boundary-00=_QTA5VQK524MK7Y4JIUPP
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've added a couple of options to nanddump.c:

-no-oob allowa you to retrieve the contents of a NAND character partiion=20
without the OOB info.=20

-no-print satisfies the interactive pretty-print request.=20

See attached patch file.
--=20
Tim Gardner - timg@tpi.com 406-443-5357
TriplePoint, Inc. - http://www.tpi.com
PGP: http://www.tpi.com/PGP/Tim.txt
--------------Boundary-00=_QTA5VQK524MK7Y4JIUPP
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mtd.diff.IceCube"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mtd.diff.IceCube"

diff -r -u --new-file mtd/util/nanddump.c mtd.new/util/nanddump.c
--- mtd/util/nanddump.c	2003-02-20 06:34:20.000000000 -0700
+++ mtd.new/util/nanddump.c	2003-10-02 12:11:27.000000000 -0600
@@ -41,17 +41,31 @@
 int main(int argc, char **argv)
 {
 	unsigned long ofs;
-	int i, fd, ofd, bs, start_addr, end_addr, pretty_print;
+	int i, fd, ofd, bs, start_addr, end_addr;
+	int pretty_print=(-1);
+	int no_oob=0;
 	struct mtd_oob_buf oob = {0, 16, oobbuf};
 	mtd_info_t meminfo;
 	unsigned char pretty_buf[80];
 
 	/* Make sure enough arguments were passed */ 
 	if (argc < 3) {
-		printf("usage: %s <mtdname> <dumpname> [start addr] [length]\n", argv[0]);
+		printf("usage: %s <mtdname> <dumpname> [start addr] [length] [-no-oob] [-no-print]\n", argv[0]);
 		exit(1);
 	}
 
+	for (i=1; i<argc; i++)
+	{
+		if (!strcmp(argv[i],"-no-oob"))
+		{
+			no_oob = 1;
+		}
+		if (!strcmp(argv[i],"-no-print"))
+		{
+			pretty_print = 0;
+		}
+	}
+
 	/* Open MTD device */
 	if ((fd = open(argv[1], O_RDONLY)) == -1) {
 		perror("open flash");
@@ -72,6 +86,7 @@
 		close(fd);
 		exit(1);
 	}
+	printf("NAND block size %u Oob block %u\n", meminfo.oobblock,meminfo.oobsize);
 
 	/* Open output file for writing */
 	if ((ofd = open(argv[2], O_WRONLY | O_TRUNC | O_CREAT, 0644)) == -1) {
@@ -86,20 +101,23 @@
 	bs = meminfo.oobblock;
 
 	/* See if start address and length were specified */
-	if (argc == 4) {
+	if (argc >= 4) {
 		start_addr = strtoul(argv[3], NULL, 0) & ~(bs - 1);
 		end_addr = meminfo.size;
-	} else if (argc == 5) {
+	} else if (argc >= 5) {
 		start_addr = strtoul(argv[3], NULL, 0) & ~(bs - 1);
 		end_addr = (strtoul(argv[3], NULL, 0) + strtoul(argv[4], NULL, 0)) & ~(bs - 1);
 	}
 
 	/* Ask user if they would like pretty output */
-	printf("Would you like formatted output? ");
-	if (tolower(getc(stdin)) != 'y')
-		pretty_print = 0;
-	else
-		pretty_print = 1;
+	if (pretty_print < 0)
+	{
+		printf("Would you like formatted output? ");
+		if (tolower(getc(stdin)) != 'y')
+			pretty_print = 0;
+		else
+			pretty_print = 1;
+	}
 
 	/* Print informative message */
 	printf("Dumping data starting at 0x%08x and ending at 0x%08x...\n",
@@ -138,7 +156,7 @@
 
 		/* Read OOB data and exit on failure */
 		oob.start = ofs;
-		printf("Dumping %lx\n", ofs);
+		if (pretty_print > 0) printf("Dumping %lx\n", ofs);
 		if (ioctl(fd, MEMREADOOB, &oob) != 0) {
 			perror("ioctl(MEMREADOOB)");
 			close(fd);
@@ -147,7 +165,7 @@
 		}
 
 		/* Write out OOB data */
-		if (pretty_print) {
+		if ((!no_oob) && pretty_print) {
 			if (meminfo.oobsize == 16) {
 				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
 					"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
@@ -166,7 +184,7 @@
 					oobbuf[6], oobbuf[7]);
 				write(ofd, pretty_buf, 48);
 			}
-		} else
+		} else if (!no_oob)
 			write(ofd, oobbuf, meminfo.oobsize);
 	}
 

--------------Boundary-00=_QTA5VQK524MK7Y4JIUPP--
