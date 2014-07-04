Received: from smtprelay03.ispgateway.de ([80.67.29.7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X36r2-0006lQ-8e
 for linux-mtd@lists.infradead.org; Fri, 04 Jul 2014 17:00:57 +0000
Received: from [178.26.58.240] (helo=remote.symeo.com)
 by smtprelay03.ispgateway.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.68) (envelope-from <christoph.mammitzsch@symeo.com>)
 id 1X36qR-00027p-NQ
 for linux-mtd@lists.infradead.org; Fri, 04 Jul 2014 19:00:19 +0200
Message-ID: <53B6DDA2.7000508@symeo.com>
Date: Fri, 4 Jul 2014 19:00:18 +0200
From: Christoph Mammitzsch <Christoph.Mammitzsch@symeo.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Disappearing directories
Content-Type: multipart/mixed; boundary="------------040106060905010600080307"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------040106060905010600080307
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8bit

Hello,

I think I might have stumbled across a bug in jffs2, that caused our
JFFS2 NAND flash partitions to lose subdirectories now and then.

The embedded system in question was running on linux 2.6.38.2, but using
the nandsim module, I was able to recreate the bug on workstations
running linux 3.0.0 as well as linux 3.2.0.

The attached script should demonstrate the bug, however since the ways
of the garbage collector are not exactly deterministic, it might not
work every time. When the bug hits, the following lines can be found in
dmesg:
> [ 7917.087199] JFFS2 notice: (9354) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
> [ 7917.433015] JFFS2 error: (9409) jffs2_build_inode_pass1: child dir "subdir" (ino #6) of dir ino #2 appears to be a hard link
> [ 7917.433058] JFFS2 notice: (9409) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
> [ 7917.436272] JFFS2 warning: (9411) jffs2_get_inode_nodes: Eep. No valid nodes for ino #6.
> [ 7917.436277] JFFS2 warning: (9411) jffs2_do_read_inode_internal: no data nodes found for ino #6

Here is, what I think happens:

"mkdir tmpdir" creates inode 2 and links to it from inode 1 using the
name tmpdir. This entry shares an eraseblock with the DELETE[12] files.
"mkdir tmpdir/subdir" creates inode 6 and links to it from inode 2 using
the name tmpdir. This entry shares an eraseblock with the KEEP[12] files.
"mv tmpdir/subdir ." and "rmdir tmpdir" create three consecutive log
entries:
 - create new link to inode 6 from inode 1 using the name subdir
 - delete entry named subdir from inode 2
 - delete entry named tmpdir from inode 1
These these three steps share an eraseblock with DELETE[34]

Now after "rm DELETE*", the creation of inode 6 and the link from inode
2 to it share an eraseblock with lots of valid data, while all the other
entries sit in very dirty eraseblocks. These eraseblocks are very likely
to be garbage collected during the following "cp ../rnd DELETE" sequence.

If that happens, inode 2 as well as the link to it vanish. The deletion
of the link from inode 2 to inode 6 also disappears. However the
creation of a link from inode 2 to inode 6 still remains in flash, since
it is "protected" by the heap of valid data.

This does not cause any trouble as long as the filesystem stays mounted.
However if you unmount the partition at this point and then remount it,
jffs2 can't get around the fact, that there are now two links to inode
6, even if one is from a directory, that itself doesn't exist anymore.


Best Regards,

i. A. Christoph Mammitzsch
-- 
Symeo GmbH
Professor-Messerschmitt-Str. 3
85579 Neubiberg / München
phone: +49 (89) 6607796-301

Symeo GmbH; Managing Directors: Dirk Brunnengräber, Christoph Rommel;
Registered Office: Munich; Commercial Register: Munich, HRB 157340

--------------040106060905010600080307
Content-Type: text/plain; charset="windows-1252"; name="trigger_bug.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="trigger_bug.sh"

#!/bin/sh

# load needed modules
modprobe nandsim first_id_byte=0x2c second_id_byte=0xa1 third_id_byte=0x80 fourth_id_byte=0x15 parts=128
modprobe mtdblock

# generate some arbitrary data
dd if=/dev/urandom of=rnd bs=2048 count=64

# clean and mount simulated NAND partition
flash_erase /dev/mtd0 0 0
mkdir -p mnt_jffs2
mount -t jffs2 /dev/mtdblock0 mnt_jffs2

# set up a critical node structure
cd mnt_jffs2
mkdir tmpdir
cp ../rnd DELETE1
cp ../rnd DELETE2
cp ../rnd KEEP1
mkdir tmpdir/subdir
cp ../rnd KEEP2
cp ../rnd DELETE3
mv tmpdir/subdir .
rmdir tmpdir
cp ../rnd DELETE4
rm DELETE*
# and excercise the garbage collector
cp ../rnd DELETE1
cp ../rnd DELETE2
cp ../rnd DELETE3
cp ../rnd DELETE4
cp ../rnd DELETE5
cp ../rnd DELETE6
cp ../rnd DELETE7
cp ../rnd DELETE8
cp ../rnd DELETE9
cp ../rnd DELETE1
cp ../rnd DELETE2
cp ../rnd DELETE3
cp ../rnd DELETE4
cp ../rnd DELETE5
cp ../rnd DELETE6
cp ../rnd DELETE7
cp ../rnd DELETE8
cp ../rnd DELETE9
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
cp ../rnd DELETE
rm DELETE*
cd ..

# unmount and remount partition. Notice how ls barfs after remount, but not before.
ls -l mnt_jffs2
umount mnt_jffs2
mount -t jffs2 /dev/mtdblock0 mnt_jffs2
ls -l mnt_jffs2

# unmount again for next run
umount mnt_jffs2

--------------040106060905010600080307--
