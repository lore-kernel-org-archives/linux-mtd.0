Received: from [151.203.97.45] (helo=mail.atlanticmicrowave.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ItDL-00009y-O3
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 17:46:47 +0100
From: "Stephen D. Cohen" <scohen@atlanticpositioners.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 22 May 2003 12:46:34 -0400
Message-ID: <001201c32081$b4e2d360$1d28a8c0@flpalmharbor>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Corrupted DOC 2000 and Tools Building Problems
Reply-To: scohen@atlanticpositioners.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gang,

	I am using linux-2.4.20 on a National Geode based PC.  All worked well
until I tried to create a JFFS2 file system on the raw /dev/mtd0 slice.
Needless to say this scrogged the NFTL formatting on the DOC.  So I figured
I would just reformat it using the DOS utilities available from the
M-Systems web site.  Wrong - I get an "ERROR IPL block is bad, Error
formatting DOC" when I try to use it.  This is on a DOC that worked just
fine until I tried to build the JFFS2 file system.  Whoops.

	I have also tried to build the util sub-tree from the mtd CVS archive.
Unfortunately I get many errors on headers with undefined types.  In
particular, uint32_t is flagged in crc32.h.  There are several others that
cause trouble further down the build, particularly the list structures.  I
am sure others have run in to this and I am doing something simple and
stupid - any help is greatly appreciated.

	If anyone can suggest a method to revive my scrogged DOC, I will greatly
appreciate it.  Any additional information on building the tools will be
gravy.  Heck, a pointer to a recently compiled binary version of the toosl
for i386 alone would be worth its weight in bits.

Regards,

Steve

----------------
Stephen D. Cohen
Engineering Manager
Atlantic Positioning Systems
11528 53rd Street North
Clearwater, FL 33760
(727) 299-0150
fax: (727) 299-0804
