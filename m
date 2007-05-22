Received: from wx-out-0506.google.com ([66.249.82.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqZim-0007mZ-6K
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 15:08:41 -0400
Received: by wx-out-0506.google.com with SMTP id h30so692249wxd
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 May 2007 12:08:29 -0700 (PDT)
Message-ID: <47c31da80705221208g11463f3bpdba6bea4fbd9747a@mail.gmail.com>
Date: Tue, 22 May 2007 14:08:28 -0500
From: "Jonathan Kotta" <jpkotta@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: trouble with mounting ext2/jffs2
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am new to MTDs and to embedded Linux in general.  I have a
at91sam9260ek board.  I just got my NAND flash working, in the sense
that the kernel can see it and do things with it (the kernel sees it
as "NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND
256MiB 3,3V 8-bit)"
, which is correct).  However I can't get it to work with either
ext2fs or jffs2 filesystems.  I think my problem with jffs2 might be
because I don't have a config option for CONFIG_JFFS2_FS_NAND in my
kernel.  I am using 2.6.21.1 with Maxim patches at
http://maxim.org.za/at91_26.html.  Is there another patch I need?  The
mount command I'm using is the one from BusyBox, which the docs say
doesn't work with a certain syntax, but don't really go into much more
detail.  Anyway, I tried with the syntax in
http://www.linux-mtd.infradead.org/faq/jffs2.html and the "vanilla"
syntax that appears below, with the same results.

This is what I've tried:
# flash_eraseall -j /dev/mtd0
Erasing 128 Kibyte @ 10c0000 --  6 % complete. Cleanmarker written at 10c0000.
Skipping bad block at 0x010e0000
Erasing 128 Kibyte @ 5aa0000 -- 35 % complete. Cleanmarker written at 5aa0000.
Skipping bad block at 0x05ac0000
Erasing 128 Kibyte @ 6780000 -- 40 % complete. Cleanmarker written at 6780000.
Skipping bad block at 0x067a0000
Erasing 128 Kibyte @ 7540000 -- 45 % complete. Cleanmarker written at 7540000.
Skipping bad block at 0x07560000
Erasing 128 Kibyte @ 7b40000 -- 48 % complete. Cleanmarker written at 7b40000.
Skipping bad block at 0x07b60000
Erasing 128 Kibyte @ 8ca0000 -- 54 % complete. Cleanmarker written at 8ca0000.
Skipping bad block at 0x08cc0000
Erasing 128 Kibyte @ 8fa0000 -- 56 % complete. Cleanmarker written at 8fa0000.
Skipping bad block at 0x08fc0000

Skipping bad block at 0x08fe0000
Erasing 128 Kibyte @ 91a0000 -- 56 % complete. Cleanmarker written at 91a0000.
Skipping bad block at 0x091c0000
Erasing 128 Kibyte @ fda0000 -- 99 % complete. Cleanmarker written at fda0000.
Skipping bad block at 0x0fdc0000
Erasing 128 Kibyte @ ffe0000 -- 99 % complete. Cleanmarker written at ffe0000.
# mount -t jffs2 /dev/mtd0 /mnt
mount: mounting /dev/mtd0 on /mnt failed
# mount -t jffs2 /dev/mtdblock0 /mnt
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 10, c->nr_blocks 2048
mount: mounting /dev/mtdblock0 on /mnt failed

ext2fs doesn't work either.  The way I understand it, the MTD block
driver makes MTDs look like block devices, thus I should be able to
format with ext2fs like any other block device.  I don't plan on using
this method, because it's warned against many times over, but I wanted
to just get something working.

# mke2fs /dev/mtdblock0
mke2fs 1.39 (29-May-2006)
ext2fs_check_if_mount: No such file or directory while determining
whether /dev/mtdblock0 is mounted.
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
65536 inodes, 262144 blocks
13107 blocks (5.00%) reserved for the super user
First data block=1
Maximum filesystem blocks=67371008
32 block groups
8192 blocks per group, 8192 fragments per group
2048 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 34 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
# mount -t ext2fs /dev/mtdblock0 /mnt
mount: mounting /dev/mtdblock0 on /mnt failed
#

It feels like I'm close to getting this to work, and I'm just missing
a couple of little things.  Does anyone have advice for me?

-- 
Thanks,

Jonathan Kotta

Hofstadter's Law:
    It always takes longer than you expect, even
    when you take into account Hofstadter's Law.
