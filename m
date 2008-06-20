Received: from smtpout.cs.fsu.edu ([128.186.122.75] helo=mail.cs.fsu.edu)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9krz-00069H-5s
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 17:57:55 +0000
Received: from cs.fsu.edu (diablo.cs.fsu.edu [128.186.120.2])
	by mail.cs.fsu.edu (Postfix) with ESMTP id 1347FF2934
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 13:59:49 -0400 (EDT)
Received: from localhost (diesburg@localhost)
	by cs.fsu.edu (8.13.1/8.13.1/Submit) with ESMTP id m5KHvpMQ021006
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jun 2008 13:57:51 -0400
Date: Fri, 20 Jun 2008 13:57:51 -0400 (EDT)
From: Sarah Diesburg <diesburg@cs.fsu.edu>
To: linux-mtd@lists.infradead.org
Subject: inftl and diskonchip 2000 256MB
Message-ID: <Pine.LNX.4.62.0806201305110.20473@diablo.cs.fsu.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm attempting to mount a DoC 2000 256MB DIP using ext3 on top
of inftl in Linux.  I'm using a 2.6.25.6 kernel, and I have
the latest mtd utilities from the git repository.

I've been running into some problems, and they seem to start when I load 
the inftl module.  Does anyone have any idea of what might be happening?

Output of "modprobe diskonchip"

Found DiskOnChip BNAND Media Header at 0x4000
     bootRecordID          = BNAND
     NoOfBootImageBlocks   = -1
     NoOfBinaryPartitions  = 1
     NoOfBDTLPartitions    = 1
     BlockMultiplerBits    = 0
     FormatFlgs            = 1
     OsakVersion           = 5.1.4.0
     PercentUsed           = 98
     PARTITION[0] ->
         virtualUnits    = 4
         firstUnit       = 2
         lastUnit        = 5
         flags           = 0x20000000
         spareUnits      = 0
     PARTITION[1] ->
         virtualUnits    = 16045
         firstUnit       = 10
         lastUnit        = 16383
         flags           = 0xc0000000
         spareUnits      = 2
Creating 2 MTD partitions on DiskOnChip 2000 (INFTL Model)":
0x00008000-0x00018000 : " DiskOnChip BDK partition"
0x00028000-0x10000000 : " DiskOnChip BDTL partition"

output of "modprobe inftl" (starts with block 10, goes all the way to 
block 11166)
...
INFTL: formatting chain at block 7435
INFTL: formatting block 7435
INFTL: corrupt block 7436 in chain 
7436, chain length 0, erase mark 0xffff?
INFTL: formatting chain at block 7436
INFTL: formatting block 7436
INFTL: corrupt block 7437 in chain 
7437, chain length 0, erase mark 0xffff?
...

After this, I also sometimes see

INFTL: cannot calculate a geometry to match size of 0x7d5a0
INFTL: using C:1002 H:16 S:32 (== 0x7d400 sects)
inftl: unknown partition table

No matter how many times I halt, reboot, or reload inftl, it always goes 
through this long procedure.

After this, I procede to fdisk /dev/inftla.  fdisk thinks the device is 
262MB (instead of 256MB), so I only make a 256MB partition.

output of fdisk /dev/inftla:

FrenchRoast:/home/user# fdisk /dev/inftla
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF 
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.

Warning: invalid flag 0x0000 of partition table 4 will be corrected by 
w(rite)

Command (m for help): p

Disk /dev/inftla: 262 MB, 262881280 bytes
16 heads, 32 sectors/track, 1002 cylinders
Units = cylinders of 512 * 512 = 262144 bytes

       Device Boot      Start         End      Blocks   Id  System
Command (m for help): n
Command action
    e   extended
    p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-1002, default 1):
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-1002, default 1002): +256M
Command (m for help): p

Disk /dev/inftla: 262 MB, 262881280 bytes
16 heads, 32 sectors/track, 1002 cylinders, total 513440 sectors
Units = sectors of 1 * 512 = 512 bytes

       Device Boot      Start         End      Blocks   Id  System
/dev/inftla1              32      500735      250352   83  Linux

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
FrenchRoast:/home/user#

I then formatted /dev/inftla for ext3, and then the kernel fell into a 
recursive fault. This is the first trace (forgive me, hand-typed).

WARNING: at kernel/exit.c:889 do_exit+0x651/0x6d6()
Modules linked in: inftl mtd_blkdevs diskonchip reed_solomon nand nand_ids
nand_ecc mtd i915 drm ipv6 usbhid dm_snapshot dm_mirror dm_mod loop evdev 
floppy pcspkr psmouse serio_raw i2c_i8-1 i2c_core ehci_hcd uhci_hcd tg3 
intel_agp dcdbas ext3 jbd mbcache sr_mod cdrom sd_mod sg
Pid: 4515, comm: dbus-launch ainted: G    B D  2.6.25.6 #1
[<c0121798>]warn_on_slowpath+0x4d/0x5c
[<c014ac00>]pagecache_write_end+0xdb/0xe2
[<c014cdfa>]filemap_fault+0x10b/0x3f9
[<c0156dff>]__do_fault+0x172/0x383
[<c01042ed>]do_notify_resume+0x3d6/0x716
[<c01572f9>]do_wp_page+0x2e9/0x406
[<c0158bea>]handle_mm_fault+0x3c5/0x538
[<c0134fbe>]update_rmtp+0x3b/0x5e
[<c0124ef3>]do_exit+0x651/0x6d6
[<c0115b4c>]do_page_fault+0xdc/0x620
[<c0124f9e>]do_group_exit+0x26/0x79
[<c01048de>]sysenter_past_esp+0x5f/0x85
[<c02f0000>]schedule+0x17c/0x6ac
========================================================


Thanks for any help!

-- Sarah
