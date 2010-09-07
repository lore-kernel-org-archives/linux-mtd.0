Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsuHq-0007CT-4g
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 09:16:20 +0000
Received: by qyk8 with SMTP id 8so5616043qyk.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 02:16:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1283427501.3085.11.camel@brekeke>
References: <AANLkTinR9H7B5taVHmowOQ8Z==dQU4PdcnjLyHKPRibV@mail.gmail.com>
	<1283427501.3085.11.camel@brekeke>
Date: Tue, 7 Sep 2010 11:16:15 +0200
Message-ID: <AANLkTim5Feo4a_37eRpx0TSsNWBoR2TxtX7cUPxRG6ry@mail.gmail.com>
Subject: Re: [RFC] [MTD-utils] mkfs.jffs2: JFFS2 and minimal erase block size
From: Yegor Yefremov <yegorslists@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

>> I'm using a NOR flash SST39VF3201. According to its data sheet the
>> erase size is 2 Kword. That corresponds to -e 0x1000 value. But the
>> mkfs.jffs2 utility has a limit of 0x2000 bytes. If I change this limit
>> to 0x1000 and create an image, I can successfully mount and use it,
>> with 8KiB value the jffs2 driver fails to work with such an image. I
>> have found some similar complains like this one
>> http://lists.infradead.org/pipermail/linux-mtd/2009-February/024523.html,
>> but no one seems to have asked this question on the list.
>>
>> Is there any reason for limiting erase block to 0x2000?
>>
>> I've created a patch to decrease this value to 0x1000, but perhaps
>> there are any other way?
>
> JFFS2 should be able to fit at least one node to eraseblock. The maximum
> node size is 4KiB+few bytes. This is why the minimum eraseblocks size is
> 8KiB.
>
> But in practice, even 8KiB is bad because you and up with wasting a lot
> of space at the end of eraseblocks.
>
> You should join several erasblock into one virtual eraseblock of 64 or
> 128 KiB and use it - this will be more optiomal.

I tried to use 128KiB, but still got following errors:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f4024:
0xadec instead
Further such events for this erase block will not be printed
Node at 0x000f4fb8 with length 0x0000004a would run over the end of
the erase block
Perhaps the file system was created with the wrong erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f5000:
0x706d instead
# JFFS2 warning: (563) jffs2_do_read_inode_internal: Truncating ino
#318 to 62192 bytes failed because it only had 61440 bytes to start
with!
JFFS2 warning: (563) jffs2_do_read_inode_internal: Truncating ino #424
to 7828 bytes failed because it only had 4096 bytes to start with!
JFFS2 warning: (563) jffs2_do_read_inode_internal: Truncating ino #489 to 11528
bytes failed because it only had 8192 bytes to start with!

To my system:

kernel 2.6.35.1 with following setting regarding JFFS2

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_CONFIGFS_FS=y
CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_WRITEBUFFER is not set
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_UBIFS_FS is not set
CONFIG_LOGFS=y
CONFIG_CRAMFS=y
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_XATTRS=y
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set

The file system will be created by buildroot:

mkfs.jffs2 -e 0x20000 -p -l -s 0x1000 -D
target/generic/device_table.txt -d output/target -o
output/images/rootfs.jffs2

mkfs.jffs2: revision 1.60

Prior to burning jffs2 image I have erased the MTD partition with

flash_eraseall -j /dev/mtd2

and then burned image via cat img > /dev/mtdblock2

I'm not using FTL.

Any ideas?

Yegor
