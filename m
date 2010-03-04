Received: from [74.213.171.136] (helo=hi.ry.ca)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnFk7-0003vK-P1
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2010 18:25:56 +0000
Received: from mail-gy0-f177.google.com (mail-gy0-f177.google.com
	[209.85.160.177]) by hi.ry.ca (Postfix) with ESMTPSA id 7C6D6170B9A
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Mar 2010 13:33:32 -0500 (EST)
Received: by gyd12 with SMTP id 12so1376581gyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Mar 2010 10:25:47 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 4 Mar 2010 12:25:47 -0600
Message-ID: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
Subject: JFFS2 errors on ppc-4xx with CFI NOR flash
From: Ryan Thompson <i@ry.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We've been seeing errors on our ~32MiB jffs2 filesystem on a custom
ppc-4xx board with a Numonyx 128MiB CFI NOR flash (128KiB erase
blocks).

The filesystem is mounted from /dev/mtd/modules, which is a symlink to
/dev/mtdblock16, defined in the FDT as follows:

            /* Modules (32128 KiB) */
            partition@2e80000 {
                reg = <0x2E80000 0x1F60000>;
                label = "modules";
            };

When a significant amount of data (i.e., a few files over a few megs
each) is written to the filesystem, we start seeing erase block
errors, checksum failures, and garbage collection errors. However,
these same filesystems have been in steady R&D use on this hardware
and same 2.6.28 kernel for ~6 months without issue. Until recently our
use case has only involved writing a small number of tiny files. We
only started seeing errors when we began to write larger files.

(Console output is at the end of this message.)

I have been able to reproduce this problem on multiple systems with
the following script (/mnt is defined in fstab(5) as jffs2 with
noatime,noauto,rw):

--------------------------

#!/bin/sh

umount /mnt && mount /mnt
cd /mnt
df /mnt
while dd if=/dev/urandom of=`mktemp` count=512 2>/dev/null; do
    sync
    df /mnt | tail -1
done
echo "Filesystem full?"
sync; sync
df /mnt
rm *.tmp
sync; sync; sync
df /mnt | tail -1

--------------------------

The errors tend to occur just after df shows approximately 52-55%
(perhaps garbage collection starts around this time?)

This occurs on at least 2.6.31. After the errors occur, the filesystem
is unusable until I reboot the system (the errors just keep repeating,
all reads and writes fail). However when the system is rebooted the
filesystem seems to (silently) recover and be completely intact.

We saw essentially the same errors on 2.6.28, but the kernel would
panic. With 2.6.31, there is no panic, but a reboot is still necessary
to restore operation.

We use other partitions of the flash in block mode through mtdblockXX.
As a test, I also formatted mtdblock16 (the jffs2 partition) as vfat.
(Yes, I know how horrible this is!) With vfat, the above script filled
the filesystem 10 times without issue (except for significantly
reducing the lifespan of my flash part, I'm sure!) I additionally used
a more complex version of the above script in some of my trials to
store and verify the md5 sums of the random files written after the
vfat filesystem was full; all files verified successfully.

Here's the console output from one such incident:

----------- Console output --------------
Newly-erased block contained word 0x19850003 at offset 0x01f20000
Jan  1 00:06:15 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01f20000
/dev/mtd/modules         32128     16916     15212  53% /mnt
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Jan  1 00:06:16 rjt Node totlen on flash (0xffffffff) != totlen from
node ref (0x00000044)
kernel: Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Jan  1 Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
00:06:16 TerraceNode CRC ffffffff != calculated CRC f09e7845 for node
at 01e162f0
Q kernel: Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Jan  1 00:06:16 rjtNewly-erased block contained word 0x19850003 at
offset 0x01d20000
 kerneNewly-erased block contained word 0x19850003 at offset 0x01d00000
l: Node totlen on flash (0xffffffff) != totlen from node ref (0x00000244)
Filesystem full?
Jan  1 00:06:16 rjt last message 'kernel: Node totlen on flash
(0xffffffff) != totlen from node ref
Jan  1 00:06:16 rjt kernel: Node CRC ffffffff != calculated CRC
f09e7845 for node at 01e162f0
Jan  1 00:06:16 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01d20000
Jan  1 00:06:16 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01d00000
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mtd/modules         32128     17172     14956  53% /mnt
rm: cannot remove '*.tmp': No such file or directory
/dev/mtd/modules         32128     17172     14956  53% /mnt
# Newly-erased block contained word 0x19850003 at offset 0x01ce0000
Jan  1Newly-erased block contained word 0x19850003 at offset 0x01ca0000
 00:06Newly-erased block contained word 0x19850003 at offset 0x01cc0000
:20 Newly-erased block contained word 0x19850003 at offset 0x01c80000
rjt kernel: Newly-erased block contained word 0x19850003 at offset 0x01ce0000
Jan  1 00:06:20 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01ca0000
Jan  1 00:06:20 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01cc0000
Jan  1 00:06:20 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01c80000
Newly-erased block contained word 0x19850003 at offset 0x01c60000
Jan  1Newly-erased block contained word 0x19850003 at offset 0x01c40000
 00:06Newly-erased block contained word 0x19850003 at offset 0x01c20000
:25 rjNewly-erased block contained word 0x19850003 at offset 0x01c00000
t Newly-erased block contained word 0x19850003 at offset 0x01be0000
kernel:Newly-erased block contained word 0x19850003 at offset 0x01bc0000
 Newly-erased block contained word 0x19850003 at offset 0x01c60000
Jan  1 00:06:25 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01c40000
Jan  1 00:06:25 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01c20000
Jan  1 00:06:25 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01c00000
Jan  1 00:06:25 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01be0000
Jan  1 00:06:25 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01bc0000
Newly-erased block contained word 0x19850003 at offset 0x01ba0000
Jan  1 Newly-erased block contained word 0x19850003 at offset 0x01b80000
00:06:Argh. No free space left for GC. nr_erasing_blocks is 0.
nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes,
erasependingempty: yes)
26 rjtjffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
 Error garbage collecting node at 01b6db84!
kerneNo space for garbage collection. Aborting GC thread
l: Newly-erased block contained word 0x19850003 at offset 0x01ba0000
Jan  1 00:06:26 rjt kernel: Newly-erased block contained word
0x19850003 at offset 0x01b80000
Jan  1 00:06:26 rjt kernel: Argh. No free space left for GC.
nr_erasing_blocks is 0. nr_free_blocks is 0. (erasableempty: yes,
erasingempty: yes, erasependingempty: yes)
Jan  1 00:06:26 rjt kernel: jffs2_reserve_space_gc of 196 bytes for
garbage_collect_dnode failed: -28
Jan  1 00:06:26 rjt kernel: Error garbage collecting node at 01b6db84!
Jan  1 00:06:26 rjt kernel: No space for garbage collection. Aborting GC thread

I'd of course welcome any advice or further debugging suggestions.

Thanks,
- R
