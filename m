Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMITE-0001uL-SZ
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 12:34:21 +0000
Received: by dadn15 with SMTP id n15so18907645dad.16
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 05:34:19 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 23 Apr 2012 14:34:19 +0200
Message-ID: <CAHea38QAtH52kLu29dztxLhfBBdPFdpSPUV3pyUxMCruBpPweg@mail.gmail.com>
Subject: UBIFS mount error: No space left on device
From: Matteo Mattei <matteo.mattei@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

After about 2 weeks with continuous read/write stress operation (w/o
powercycles) I moved a board to the power-cycles reliability lab to
perform also some other tests.
After a while I had an error during mounting the filesystem.

After a further analysis seems that there is not enough space to mount
the device (I don't know who is the responsible for this because there
is a quite big empty space in the device).
What is strange is that in read-only mode I am able to mount it.


Software and environment:
- linux kernel 2.6.32 (from TI)
- ubifs backport (from git://git.infradead.org/~dedekind/ubifs-v2.6.32.git).
- 8-bit BCH.
- UBIFS mounted with no compression.
- usage of ubiformat instead of flash_eraseall for the first
filesystem initialization.


Hardware:
- CPU: OMAP3530.
- NAND chips: Micron MT29F4G08ABBDAH4-IT.


I have the board that failed in this condition:

[root@myhost /]# mount -t ubifs ubi0:Filesystem /rootfs -o
sync,noatime,compr=none
UBIFS: recovery needed
...bch correct (1 512 byte) count=1
mount: mounting ubi0:Filesystem on /rootfs failed: No space left on device
[root@myhost /]#
[root@myhost /]#
[root@myhost /]# mount
rootfs on / type rootfs (rw)
none on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
none on /proc type proc (rw,nosuid,nodev,noexec,relatime)
none on /dev type devtmpfs (rw,relatime,size=107880k,nr_inodes=26970,mode=755)
none on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620)
[root@myhost /]#
[root@myhost /]#
[root@myhost /]# mount -t ubifs ubi0:Filesystem /rootfs -o
ro,sync,noatime,compr=none
UBIFS: recovery needed
UBIFS: recovery deferred
UBIFS: mounted UBI device 0, volume 0, name "Filesystem"
UBIFS: mounted read-only
UBIFS: file system size:   840708096 bytes (821004 KiB, 801 MiB, 6621 LEBs)
UBIFS: journal size:       33521664 bytes (32736 KiB, 31 MiB, 264 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[root@myhost /]#
[root@myhost /]#
[root@myhost /]# mount
rootfs on / type rootfs (rw)
none on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
none on /proc type proc (rw,nosuid,nodev,noexec,relatime)
none on /dev type devtmpfs (rw,relatime,size=107880k,nr_inodes=26970,mode=755)
none on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620)
ubi0:Filesystem on /rootfs type ubifs (ro,sync,noatime,compr=none)
[root@myhost /]#
[root@myhost /]#
[root@myhost /]# df -h
Filesystem                Size      Used Available Use% Mounted on
none                    105.4M         0    105.4M   0% /dev
ubi0:Filesystem    740.9M    523.7M    212.5M  71% /rootfs
[root@myhost /]#
[root@myhost /]#
[root@myhost /]# mount -o remount,rw /rootfs
UBIFS: completing deferred recovery
mount: mounting ubi0:Filesystem on /rootfs failed: No space left on device
[root@myhost /]#


Can you clarify why this strange behavior happened?
Maybe there is not enough space in the journal?!
Is there a way to avoid this or a workaround to let me to recover the board?

I have also one other question but not strictly related to this issue
(maybe there are already some other threads on this, but I didn't find
the answer): Do the UBI and UBIFS handle the erased space?
If so, how do they handle it?

Thanks a lot for your time,

Matteo
