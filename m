Received: from mail.spectracomcorp.com ([64.65.245.202]
	helo=nexserver.spectracomcorp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5XWT-0001Hx-50
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 22:03:54 +0000
Received: (from root@localhost)
	by nexserver.spectracomcorp.com (8.11.6/8.11.6) id i2MM37g16167
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 17:03:07 -0500
Received: from CoOp4 ([10.10.200.196])i2MM34716093
	for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2004 17:03:05 -0500
Message-ID: <00e501c41059$7533cf80$c4c80a0a@CoOp4>
From: "Eric Hammerle" <ehammerle@spectracomcorp.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 22 Mar 2004 17:03:07 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 IO
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently developing on a custom board running uClinux kernel 2.4.20-uc0
on an
ARM7TDMI.  We use Intel J3 Strataflash and are using jffs2 as our fs.  I've
run into a
problem where after FTPing a binary file around 1.3 megs, upon reboot the fs
outputs
a single warning such as:

jffs2_scan_inode_node(): Data CRC failed on node at 0x0060000c: Read
0x17a11a74,
 calculated 0xedda2a7c

Unfortunately, the garbage collector never reclaims this node, so any
subsequent reboot
will print out the same message.  This wouldn't be a problem, but if I
upload the file to the
board one or two more times I get many print outs similar to:

jffs2_scan_dirent_node(): Name CRC failed on node at 0x0052d8b4: Read
0xd7d56506
, calculated 0xe489d5cc
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0052d910: Read
0x3c262956
, calculated 0xc2dbebe9
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0052d940: Read
0x8b4199a0
, calculated 0x8c19c269
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0052d99c: Read
0x3640ef2e
, calculated 0x0b987af9

The board then boots into single user mode with most of the fs missing.  The
same
effect can be achieved from copying the file described above several times.
I patched
my jffs2 and mtd to add the changes found in kernel version 2.4.21 and this
improved
the situation for smaller files, but larger files suffer from this problem.

I've found that if I remove the file instead of moving it from the upload
directory, I start
getting error messages similar to:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a16190:
0x0044 in
stead

Should I try patching further or could this be related to alignment problems
related to
some of the alignment troubles found in the ARM7TDMI's?

TIA

E. Hammerle
