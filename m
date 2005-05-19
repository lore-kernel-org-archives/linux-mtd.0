Received: from go4.ext.ti.com ([192.91.75.132])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYmUs-0006Co-Nm
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 10:59:40 -0400
Received: from dlep91.itg.ti.com ([157.170.152.55])
	by go4.ext.ti.com (8.13.1/8.13.1) with ESMTP id j4JExisC022541
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2005 09:59:44 -0500 (CDT)
Received: from dlep90.itg.ti.com (localhost [127.0.0.1])
	by dlep91.itg.ti.com (8.12.11/8.12.11) with ESMTP id j4JExhaZ008481
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2005 09:59:43 -0500 (CDT)
Received: from dlee70.ent.ti.com (localhost [127.0.0.1])
	by dlep90.itg.ti.com (8.12.11/8.12.11) with ESMTP id j4JExhDg029841
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2005 09:59:43 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2005 09:58:46 -0500
Message-ID: <520AB2AD990DC04082102F77CA17263813A8E2@dlee03.ent.ti.com>
From: "Menon, Nishanth" <x0nishan@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: Question on first time umount delay
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

I am working with a nor flash (intel strata flash) on an OMAP 1710 2.6.9
platform (and a newbie to flash and jjfs2), and I saw an interesting
behavior that I am unable to explain so far to my satisfaction.
The issue is that umount following a mount seems to be taking time to
complete. Following the thread here:
http://lists.infradead.org/pipermail/linux-mtd/2005-April/012404.html
which, I don't think applies to me as I just have a 32 MB flash.

The hypothesis I have is that a mount followed by an umount, done
immediately after boot, causes sync to be called, which maps to
fs/jffs2.c:jffs2_fsync()->jffs2_flush_wbuf_gc() the garbage collector
thread then completes the verification which it had started during
mount, but completes it pretty late.

Unfortunately, my understanding from the mentioned thread was that the
gc thread ought to die once the umount is called. This does confuse me.
Is something wrong here or if it is an expected behavior, why?

The log is as follows:
<snip>
OMAP NOR FLASH: MTD Self-Contained Driver ver. 1.0 size=3D0x33554432lx
OMAP NOR FLASH: Intel 28F256L18T found at 0xc2880000
Creating 4 MTD partitions on "OMAP NOR FLASH":
0x00000000-0x00020000 : "bootloader"
0x00020000-0x00040000 : "params"
0x00040000-0x00240000 : "kernel"
0x00240000-0x02000000 : "file system"
<snip - immediately after boot prompt>
# ls -l ../../Flash/Flash-jffs2/rootfs.bin.nor
-rw-r--r--    1 25041    200       1703936 Feb 11  2005
../../Flash/Flash-jffs2/rootfs.bin.nor
# time ./flash_eraseall /dev/mtd/3
Erasing 128 Kibyte @ 1da0000 -- 99 % complete.[[B

real    5m1.270s
user    0m0.030s
sys     5m1.150s
# time cat ../../Flash/Flash-jffs2/rootfs.bin.nor>/dev/mtd/3

real    1m26.771s
user    0m0.010s
sys     1m26.600s
# time mount -t jffs2 /dev/mtdblock/3 /mnt

real    0m0.177s
user    0m0.000s
sys     0m0.170s
# time ls /mnt
bin  dev  etc  lib  mnt  mtdutil  proc  sbin  tmp  usr  var

real    0m0.055s
user    0m0.030s
sys     0m0.010s
# time umount /mnt

real    4m46.783s
user    0m0.000s
sys     4m46.580s
# time mount -t jffs2 /dev/mtdblock/3 /mnt

real    0m0.158s
user    0m0.010s
sys     0m0.140s
# ls /mnt/
bin  dev  etc  lib  mnt  mtdutil  proc  sbin  tmp  usr  var
# time umount /mnt

real    0m0.038s
user    0m0.000s
sys     0m0.000s

<reboot>
# time mount -t jffs2 /dev/mtdblock/3 /mnt

real    0m0.165s
user    0m0.010s
sys     0m0.140s
# ls /mnt
bin  dev  etc  lib  mnt  mtdutil  proc  sbin  tmp  usr  var
# time umount /mnt

real    0m0.039s
user    0m0.000s
sys     0m0.010s

Why does it take so long to unmount the filesystem the first time? If
Garbage collector is involved, why? Kinda been thinking about this for a
couple of days now, and never got a satisfactory answer so far.

Regards,
Nishanth Menon
