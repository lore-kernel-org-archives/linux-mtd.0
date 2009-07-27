Received: from smtp-2.hut.fi ([130.233.228.92])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MVXOU-0007MN-3i
	for linux-mtd@lists.infradead.org; Mon, 27 Jul 2009 21:06:06 +0000
Received: from localhost (katosiko.hut.fi [130.233.228.115])
	by smtp-2.hut.fi (8.13.6/8.12.10) with ESMTP id n6RL5xg8027031
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2009 00:05:59 +0300
Received: from smtp-2.hut.fi ([130.233.228.92])
	by localhost (katosiko.hut.fi [130.233.228.115]) (amavisd-new,
	port 10024)
	with LMTP id 25894-502 for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jul 2009 00:05:59 +0300 (EEST)
Received: from mail.lan (quadrant.hut.fi [130.233.157.233])
	by smtp-2.hut.fi (8.13.6/8.12.10) with ESMTP id n6RL5UGs026883
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2009 00:05:30 +0300
Received: from lindi1.lan (lindi1.lan [10.7.6.28])
	by mail.lan (Postfix) with ESMTPS id 8D01510F124
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jul 2009 00:05:30 +0300 (EEST)
Received: from lindi by lindi1.lan with local (Exim 4.69)
	(envelope-from <lindi@kurp.hut.fi>) id 1MVXNy-0004eO-DU
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 00:05:30 +0300
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2dump: rewrite --help output to be more suitable for
	help2man
From: Timo Lindfors <lindi@kurp.hut.fi>
Date: Tue, 28 Jul 2009 00:05:30 +0300
Message-ID: <kr8wi9et0l.fsf@lindi1.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Timo Juhani Lindfors <timo.lindfors@iki.fi>

$ help2man /usr/sbin/jffs2dump | man /dev/stdin

currently creates badly formatted output like

-b          --bigendian                 image is big endian
-l          --littleendian              image   is   little
endian  -c          --content                   dump  image
contents  -e  fname    --endianconvert=fname        convert
image endianness, output to file fname -r         --recalc-

This patch modifies the --help output for jffs2dump to be more
suitable for help2man and thus makes it possible to easily create
manual pages that stay up-to-date.

Signed-off-by: Timo Juhani Lindfors <timo.lindfors@iki.fi>
---
 jffs2dump.c |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/jffs2dump.c b/jffs2dump.c
index c5a99df..2802682 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -52,19 +52,18 @@ char	*data;		// image data
 
 void display_help (void)
 {
-	printf("Usage: dumpjffs2 [OPTION] INPUTFILE\n"
-			"Dumps the contents of a binary JFFS2 image.\n"
-			"\n"
-			"           --help     	              display this help and exit\n"
-			"           --version  	              output version information and exit\n"
-			"-b         --bigendian	              image is big endian\n"
-			"-l         --littleendian             image is little endian\n"
-			"-c         --content  	              dump image contents\n"
-			"-e fname   --endianconvert=fname      convert image endianness, output to file fname\n"
-			"-r         --recalccrc                recalc name and data crc on endian conversion\n"
-			"-d len     --datsize=len              size of data chunks, when oob data in binary image (NAND only)\n"
-			"-o len     --oobsize=len              size of oob data chunk in binary image (NAND only)\n"
-			"-v         --verbose		      verbose output\n");
+	printf("Usage: " PROGRAM " [OPTION]... INPUTFILE\n"
+	       "Dump the contents of a binary JFFS2 image.\n\n"
+	       "     --help                   display this help and exit\n"
+	       "     --version                display version information and exit\n"
+	       " -b, --bigendian              image is big endian\n"
+	       " -l, --littleendian           image is little endian\n"
+	       " -c, --content                dump image contents\n"
+	       " -e, --endianconvert=FNAME    convert image endianness, output to file fname\n"
+	       " -r, --recalccrc              recalc name and data crc on endian conversion\n"
+	       " -d, --datsize=LEN            size of data chunks, when oob data in binary image (NAND only)\n"
+	       " -o, --oobsize=LEN            size of oob data chunk in binary image (NAND only)\n"
+	       " -v, --verbose                verbose output\n");
 	exit(0);
 }
 
---

If this patch looks ok, I'd be willing to write similar patches for at
least nandread, flash_erase and flash_eraseall tools that I use
regularly myself.

best regards,
Timo Lindfors
