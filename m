Received: from mx10.radisys.com ([206.102.10.36])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16K6OP-0002IZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 28 Dec 2001 23:26:25 +0000
Subject: Newbie - JFFS as Root FS
To: linux-mtd@lists.infradead.org
Message-ID: <OF3491AE15.E3C01AEE-ON88256B30.007D7D64@radisys.com>
From: Sheela.Kashyap@radisys.com
Date: Fri, 28 Dec 2001 15:27:36 -0800
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I am relatively new to Linux and definitely new to MTD/JFFS. We have a
motorola 8xx board, the boot loader used is ppcboot. We are currently using
NFS as the root file system.  The kernel has been compiled with the right
JFFS and MTD options. I am able to erase the MTD device, copy the file
system on to it and mount and umount multiple times without any problems.
The kernel is in the flash.  We are using Dhcp to figure out its IP
address.

When I set the bootargs in ppcboot to "root=/dev/mtdblock1 rw" or
"root=/dev/mtdblock1 rw ip=10.100.4.44" and try booting the kernel,
everything is fine till it comes time to mount the root FS.It still seems
to try and go out on the net. This is the trace I see. I have cut out some
parts to reduce the clutter.

-----------------------------------------------------------------------------------------------------------------------------------------


Initializing...
  CPU:   XPC860xxZPnnD4 at 80 MHz: 16 kB I-Cache 8 kB D-Cache FEC present
  Board:   DRAM:  About to program UPMB... finished programming UPMB
Setting value for MPTPR to 400
Run precharge command for each chip-select used
<snip...>

cas latensies supported          3  2
<snip...>

ppcboot->printenv
bootdelay=10
baudrate=19200
ipaddr=10.0.0.77
serverip=10.0.0.128
bootcmd=bootm 28080000
stdin=serial
stdout=serial
stderr=serial
bootargs=root=/dev/mtdblock1 rw ip=10.100.4.44

SWSE(bootrom)->bootm 28080000
## Booting Linux kernel at 28080000 ...
   Image Name:   HHL 2.0 for SWSE version 0.005
   Created:      2001-12-06   5:07:40
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    550042 Bytes = 537 kB = 0 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
## Transferring control to Linux (at address 00000000) ...
Linux version 2.4.2_hhl20 (rick@localhost.localdomain) (gcc version 2.95.3
20010
315 (release/MontaVista)) #6 Wed Dec 5 21:03:08 PST 2001
On node 0 totalpages: 65536
zone(0): 65536 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/mtdblock1 rw ip=10.100.4.44
Decrementer Frequency = 300000000/60

<snip....>

JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
loop: loaded (max 8 devices)
physmap flash device: 1780000 at 28880000
Physically mapped flash: Found 2 x16 CFI devices at location 0 in 16 bit
mode
JEDEC ID: 89 18
cstm_cfi_jedec flash device: 1780000 at 28880000
MTD flash: Found 2 x16 CFI devices at location 0 in 16 bit mode
JEDEC ID: 89 18
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 16384)
Sending BOOTP requests............. timed out!
IP-Config: Auto-configuration of network failed.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Root-NFS: No NFS server available, giving up.
VFS: Unable to mount root fs via NFS, trying floppy.
request_module[block-major-2]: Root fs not mounted
VFS: Cannot open root device "mtdblock1" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00
Rebooting in 180 seconds..

--------------------------------------------------------------------------------------------------------

The "Sending BOOTP requests" line is what I don't understand. The kernel
obviously does not figure out that the root filesystem to be used is
'jffs'. How can I get it to do that? Do I need to make changes to some
kernel files? Or is it that I need to change the kernel so that it detects
the MTD block device first and figures out the filesystem?

Any help is greatly appreciated.

Thanks,
Sheela.
