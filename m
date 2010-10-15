Received: from mail.cranems.com ([12.10.34.81])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6rnS-0006rE-M0
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 21:26:39 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: jffs2 file corruption, clues needed
Date: Fri, 15 Oct 2010 16:26:50 -0500
Message-ID: <45D7FBEF6D444F41AEF557AF2DB5F301047281BE@hakuna.cranems.int>
From: "Blachman, Steven" <sblachman@cranems.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having problems with corrupted files on jffs2 and am looking for
some help finding the cause.

The kernel is version 2.6.27.8 and jffs2 is running on NAND.  Out of
several thousand devices, some have
been returned inoperable because of corrupted files.  The file
corruption is sometimes in the form of a
single-bit error and sometimes in multiple 4K byte chunks.  The 4K
chunks are sometimes all 0s, sometimes
all 1s, sometimes seemingly random, and are occasionally recognizable
pieces of a log file.  In all cases the file
appears to be viewed as valid by jffs2.  I can typically execute such a
file for example although the program
usually crashes.

Most of these files are never written by the application and the systems
often worked for some time before
becoming corrupted.  I do have atime active so perhaps this is causing
thrash to the never written files that
allows them to be garbage collected and therefore subject to this. Is
this correct?

Tests of the NAND on these devices have shown no problems and raw NAND
dumps show no bad blocks.
There are no ECC errors from MTD raw NAND dumps. It looks as if the
files were written wrong!

I have a couple of devices whose raw MTD NAND dumps return a consistent
data set while repeated jffs2 tars
get different results (jffs2 mounted read only of course).

I am hoping for some sugesstions about where I should look for the
problem.  I suspect an original hardware
error caused all this havoc downstream.  How can I go about trying to
localize this?

I have looked at the CVS logs and see that there are a few corrupted
file-related changes but it is not clear
to me that any of these could result in this pathology.   Maybe this has
been fixed already!

I appreciate any clues,
Steven
