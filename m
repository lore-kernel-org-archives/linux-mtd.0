Received: from imf23aec.mail.bellsouth.net ([205.152.59.71])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ii5C-0000kN-7E
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2003 23:09:06 +0100
Received: from luna.siliconmotorsports.com ([68.154.56.59])
	by imf23aec.mail.bellsouth.netSMTP
	<20030801220831.CKLF8750.imf23aec.mail.bellsouth.net@luna.siliconmotorsports.com>
	for <linux-mtd@lists.infradead.org>;
	Fri, 1 Aug 2003 18:08:31 -0400
From: "Tim Drury" <tdrury@siliconmotorsports.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 1 Aug 2003 18:08:19 -0400
Message-ID: <000601c35879$6af19450$f546a8c0@SIMOTORSPORTS>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: compiling latest CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I got the latest CVS to build, but with a few issues.

patches/patchin.sh ran successfully.  Upon building my kernel
modules I got an error in nand.c that 'i' was undeclared.  So in
mtd/drivers/nand/nand.c, line 936 add 'i' to the int declaration.

Now cross-compiling the kernel and modules worked fine.

I sym-linked mtd/util into the kernel source base as instructed
in the README.  Building failed complaining about something in
crc32.h and I realized that it wasn't finding linux/types.h.
I needed to include the linux kernel include directory to get
past this.  Then it failed trying to find zlib.h.  Added that
then it failed to find libz.so.  

The above can all be done without modifying files:

make CROSS=i386-linux- CFLAGS='-I/path/to/kernel/linux-2.4.21/include
-I/path/to/zlib-1.4.1' \
LDFLAGS=-L/path/to/zlib/lib

and everything cross-compiled to my target system.  Was pointing to
the kernel/include directory bad?

-tim
