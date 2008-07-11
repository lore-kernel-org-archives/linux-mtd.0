Received: from mail01.prevas.se ([62.95.78.3])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KHGMP-0001EP-Nb
	for linux-mtd@lists.infradead.org; Fri, 11 Jul 2008 11:00:22 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Obsolete bit in JFFS2
Date: Fri, 11 Jul 2008 13:00:18 +0200
Message-ID: <4580734D35C1BC4B8B0CA42EBD58741B416BED@prevas1.prevas.se>
From: "Peter Aagaard Kristensen" <Peter.Kristensen@prevas.dk>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone

I'm having some problems with the obsolete bit (aka
!JFFS2_NODE_ACCURATE) in the JFFS2 file system. I have a number of ARM
(Atmel AT91RM9200) embedded modules using JFFS2 on an Atmel serial flash
chip running the Linux 2.6.12 kernel patched with a snapshot of mtd from
july 21 2005. After the systems have worked without any problems for
some time (days - weeks) the filesystem gets slightly corrupted.=20

I have extracted the filesystem and analyzed it with jffs2dump and
sometimes inodes are suddenly marked obsolete. There is never any trace
of a newer version of the inode so it does not seem to be because the
filesystem is moving data to wear-level.

Example:
Below is a jffs2dump snip of a filesystem. Busybox and all the symbolic
links pointing to it are part of the initial filesystem created on an
x86 with mkfs.jffs2 and they are never touched after the embedded system
is up and running. As you can see the contents of some of the files like
eg. chgrp has now been marked obsolete (there are no other references to
#ino 28 in the filesystem except the two shown in the example). The
result is that chgrp has disappeared from the filesystem.

I have experienced cases where a large file has had several inodes
marked obsolete corrupting the file. But if I manually flip the bit in
the filesystem the file is okay again - so no data is changed, just the
obsolete bit.

Does anybody have a clue about why it suddenly would mark it obsolete?

Any help appreciated :-)

/ Peter




The example:

         Dirent     node at 0x0016b364, totlen 0x0000002b, #pino     2,
version    25, #ino        27, nsize        3, name cat
         Inode      node at 0x0016b390, totlen 0x0000004b, #ino     27,
version     1, isize        7, csize        7, dsize        7, offset
0
         Dirent     node at 0x0016b3dc, totlen 0x0000002d, #pino     2,
version    26, #ino        28, nsize        5, name chgrp
Obsolete Inode      node at 0x0016b40c, totlen 0x0000004b, #ino     28,
version     1, isize        7, csize        7, dsize        7, offset
0
         Dirent     node at 0x0016b458, totlen 0x0000002d, #pino     2,
version    27, #ino        29, nsize        5, name chmod
         Inode      node at 0x0016b488, totlen 0x0000004b, #ino     29,
version     1, isize        7, csize        7, dsize        7, offset
0
         Dirent     node at 0x0016b4d4, totlen 0x0000002d, #pino     2,
version    28, #ino        30, nsize        5, name chown
Obsolete Inode      node at 0x0016b504, totlen 0x0000004b, #ino     30,
version     1, isize        7, csize        7, dsize        7, offset
0
         Dirent     node at 0x0016b550, totlen 0x0000002a, #pino     2,
version    29, #ino        31, nsize        2, name cp
         Inode      node at 0x0016b57c, totlen 0x0000004b, #ino     31,
version     1, isize        7, csize        7, dsize        7, offset
0
