Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeqPm-0006vl-7o
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 13:46:10 +0000
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NeqPj-0003J3-9R
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 08:46:03 -0500
Date: Tue, 9 Feb 2010 08:44:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] Web site:  Some grammatical fixes for the FAQ General
 page.
Message-ID: <alpine.LFD.2.00.1002090844070.8655@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/faq/general.xml b/faq/general.xml
index 81ba994..1c0551f 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -79,7 +79,7 @@ also block devices.</P>

 <TABLE cellpadding="5" cellspacing="0" border="1">
 	<TR>
-		<TD><B>Block drives</B></TD>
+		<TD><B>Block device</B></TD>
 		<TD><B>MTD device</B></TD>
 	</TR>
 	<TR>
@@ -104,7 +104,7 @@ also block devices.</P>
 		<TD>
 			Bad sectors are re-mapped and hidden by hardware (at
 			least in modern LBA hard drives); in case of FTL
-			devices it is the resposibility of FTL to provide this
+			devices it is the responsibility of FTL to provide this
 		</TD>
 		<TD>
 			Bad eraseblocks are not hidden and should be dealt with
@@ -164,7 +164,7 @@ device nodes.

 <P>
 But in many cases using <CODE>mtdblock</CODE> is a very bad idea because what
-it basically does if you change any sector of you mtdblockX device, it reads
+it basically does if you change any sector of your mtdblockX device, it reads
 the whole corresponding eraseblock into the memory, erases the eraseblock,
 changes the sector in RAM, and writes the whole eraseblock back. This is very
 straightforward. If you have a power failure when the eraseblock is being
@@ -183,7 +183,7 @@ UBI.
 <P>
 It makes sense to use <CODE>mtdblock_ro</CODE> for read-only file systems or
 read-only mounts. For example, one may use SquashFS as it compresses data quite
-well. But think twice before using <CODE>mtdblock</CODE> in read-write more.
+well. But think twice before using <CODE>mtdblock</CODE> in read-write mode.
 And don't try to use it on NAND flash as it is does not handle bad
 eraseblocks.
 </P>


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
