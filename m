Received: from reloaded.ext.ti.com ([192.94.94.6])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EeaUm-0001T5-00
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 10:55:52 -0500
Received: from dlep30.itg.ti.com ([157.170.170.32])
	by reloaded.ext.ti.com (8.13.4/8.13.4) with ESMTP id jAMFtPVf009138
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Nov 2005 09:55:30 -0600 (CST)
Received: from dlep90.itg.ti.com (localhost [127.0.0.1])
	by dlep30.itg.ti.com (8.12.11/8.12.11) with ESMTP id jAMFtOXA022489
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Nov 2005 09:55:24 -0600 (CST)
Received: from dlee70.ent.ti.com (localhost [127.0.0.1])
	by dlep90.itg.ti.com (8.12.11/8.12.11) with ESMTP id jAMFtObb023331
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Nov 2005 09:55:24 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Nov 2005 09:55:23 -0600
Message-ID: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
From: "Menon, Nishanth" <x0nishan@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I have been trying Sibley NOR flash and the latest (as of today) MTD
tree on my kernel.
When I use the character device, I am able to unlock, erase, write and
read from it successfully. Unfortunately, when I try to use jffs2 on it,
I face the following issue:
root@128.247.81.110:/mnt# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "bootloader"
mtd1: 00020000 00020000 "params"
mtd2: 00200000 00020000 "kernel"
mtd3: 03dc0000 00020000 "filesystem"
mtd4: 00040000 00040000 "bootloader"
mtd5: 00040000 00040000 "params"
mtd6: 00200000 00040000 "kernel"
mtd7: 07d80000 00040000 "filesystem"

> The first 4 are my strata flash partitions which work fine - even
jffs2 works on it.

root@128.247.81.110:~/nor/mtd-util# mount -t jffs2 /dev/mtdblock/6 /mnt/
root@128.247.81.110:~/nor/mtd-util# cd /mnt
root@128.247.81.110:/mnt# ls
root@128.247.81.110:/mnt# touch a
root@128.247.81.110:/mnt# jffs2: Couldn't find erase block to garbage
collect!
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 00000000
Refiling block at 00000000 to bad_used_list
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 00040000
Refiling block at 00040000 to bad_used_list
jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
jffs2: Couldn't find erase block to garbage collect!
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 00080000
Refiling block at 00080000 to bad_used_list
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 000c0000
Refiling block at 000c0000 to bad_used_list
jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
jffs2: Couldn't find erase block to garbage collect!
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 00100000
Refiling block at 00100000 to bad_used_list
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 00140000
Refiling block at 00140000 to bad_used_list
jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
jffs2: Couldn't find erase block to garbage collect!
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 00180000
Refiling block at 00180000 to bad_used_list
Sibley: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
About to refile bad block at 001c0000
Refiling block at 001c0000 to bad_used_list
jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
jffs2: Couldn't find erase block to garbage collect!

root@128.247.81.110:/mnt# ls
a
root@128.247.81.110:/mnt# cd
root@128.247.81.110:~# umount /mnt
root@128.247.81.110:~# mount -t jffs2 /dev/mtdblock/6 /mnt/
Empty flash at 0x00040018 ends at 0x00040400
Eraseblock header found at 0x00040400 is not at the beginning of block
(0x00040000)
Eraseblock header found at 0x00040418 is not at the beginning of block
(0x00040000)
Eraseblock header found at 0x00040430 is not at the beginning of block
(0x00040000)
Eraseblock header found at 0x00040448 is not at the beginning of block
(0x00040000)
Eraseblock header found at 0x00040460 is not at the beginning of block
(0x00040000)
Eraseblock header found at 0x00040478 is not at the beginning of block
(0x00040000)
Eraseblock header found at 0x00040490 is not at the beginning of block
(0x00040000)
Empty flash at 0x000404a8 ends at 0x000404c0
root@128.247.81.110:~#

For comparison: Strata flash:
root@128.247.81.110:~/nor/mtd-util# ./flash_unlock /dev/mtd/2
root@128.247.81.110:~/nor/mtd-util# ./flash_eraseall -j /dev/mtd/2
Erasing 128 Kibyte @ 1e0000 -- 93 % complete. Cleanmarker written at
1e0000.
root@128.247.81.110:~/nor/mtd-util# mount -t jffs2  /dev/mtdblock/2 /mnt
root@128.247.81.110:~/nor/mtd-util# cd /mnt
root@128.247.81.110:/mnt# touch a
root@128.247.81.110:/mnt# ls
a
root@128.247.81.110:/mnt# echo "ehllow">a
root@128.247.81.110:/mnt# cd -
/root/nor/mtd-util
root@128.247.81.110:~/nor/mtd-util# umount /mnt
root@128.247.81.110:~/nor/mtd-util# mount -t jffs2  /dev/mtdblock/2 /mnt
root@128.247.81.110:~/nor/mtd-util# cd -
/mnt
root@128.247.81.110:/mnt# cat a
ehllow
root@128.247.81.110:/mnt# cd -
/root/nor/mtd-util
root@128.247.81.110:~/nor/mtd-util# umount /mnt

root@128.247.81.110:~/nor/mtd-util# ./flash_info /dev/mtd/2
Device /dev/mtd/2 has 0 erase regions
root@128.247.81.110:~/nor/mtd-util# ./flash_info /dev/mtd/6
Device /dev/mtd/6 has 0 erase regions

My .config for JFFS2 looks like the following:
CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D2
CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
CONFIG_JFFS2_ZLIB=3Dy
CONFIG_JFFS2_RTIME=3Dy
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_JFFS2_LZO is not set
# CONFIG_JFFS2_LZARI is not set
# CONFIG_JFFS2_CMODE_NONE is not set
CONFIG_JFFS2_CMODE_PRIORITY=3Dy
# CONFIG_JFFS2_CMODE_SIZE is not set
CONFIG_JFFS2_PROC=3Dy

Has any body else seen a similar problem?

Regards,
Nishanth Menon
