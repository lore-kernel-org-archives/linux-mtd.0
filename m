Received: from krynn.se.axis.com ([193.13.178.10])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CIPhv-0007pU-4c
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2004 06:53:12 -0400
Received: from PCSTARVIK (dh10-84-127-108.se.axis.com [10.84.127.108])
	by krynn.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP id
	i9FAr5YE019650
	for <linux-mtd@lists.infradead.org>; Fri, 15 Oct 2004 12:53:05 +0200
From: "Mikael Starvik" <mikael.starvik@axis.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 15 Oct 2004 12:53:06 +0200
Message-ID: <BFECAF9E178F144FAEF2BF4CE739C66818F58E@exmail1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: NAND programming bug in Linux 2.6.8?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In nand_base.c:nand_command() the following happens (stripped pseudo-code):

if (NAND_CMD_SEQIN) {
  if (column > OOB) {
    column -= OOB;
    use READ_OOB;
  }
  else if (column < 256)
    use READ0;
  else {
    column -= 256;
    use READ1;
  }
  send_command();
}
if (16bit)
  column >>= 1;
write_column();

The problem is that for a 16-bit device the READ1 command will be issued
even though the column address fits in 8 bits. Suggested patch below.

Comments?

/Mikael (not a member of this list)

Index: nand_base.c
===================================================================
RCS file: /usr/local/cvs/linux/os/lx25/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.1.1.1
diff -u -r1.1.1.1 nand_base.c
--- nand_base.c	16 Aug 2004 08:14:36 -0000	1.1.1.1
+++ nand_base.c	15 Oct 2004 10:46:16 -0000
@@ -506,8 +506,8 @@
 			/* OOB area */
 			column -= mtd->oobblock;
 			readcmd = NAND_CMD_READOOB;
-		} else if (column < 256) {
-			/* First 256 bytes --> READ0 */
+		} else if ((column < 256) || (this->options &
NAND_BUSWIDTH_16)) {
+			/* First 256 bytes/words --> READ0 */
 			readcmd = NAND_CMD_READ0;
 		} else {
 			column -= 256;
