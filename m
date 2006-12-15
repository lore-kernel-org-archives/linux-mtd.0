Received: from 24.152.213.223.res-cmts.eph.ptd.net ([24.152.213.223]
	helo=mx.dlasys.net)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvJJe-0005HQ-9K
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 20:06:02 +0000
Received: from l-dhlii.dlasys.net ([206.223.20.247]:3726)
	by mx.dlasys.net with esmtpa (Exim 4.63 #1 (Debian))
	id 1GvK2H-00020Z-Pv by authid <dhlii> with plain_server
	for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2006 15:52:05 -0500
Message-ID: <4582FED8.7020903@dlasys.net>
Date: Fri, 15 Dec 2006 15:00:24 -0500
From: "David H. Lynch Jr." <dhlii@dlasys.net>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Can't mount /dev/mtdblock# - looking for clue ?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


    I am improving the BSP for the Pico E12/E14
    I have developed a map driver for the onboard Spansion mirrobit nor
flash - A driver was required because the flash is accesible to boht the
host and target and  the target has to map the flash into its memory to
access it. I am testing the flash map driver  and implimenting a
filesystem driver for Pico's filesystem.

    The mtd map driver seems to pass simple tests - I can hexdump
selected regions of /dev/mtd0 and I get what I expect.

    I am now trying to work on the PicoFS filesystem driver. I have lots
of debugging in the PicoFS driver so attempting to do anything should
spray the console with output.

    When I try to mount -t picofs -r /dev/mtdblock0 /mnt

    I get "mount: Mounting /dev/mtdblock0 on /mnt failed: No such device"

    I have CONFIG_MTD_BLOCK enabled.

    I have tried with and without partitioning in the map driver with
the same results.

    cut and past of my most recent attempt is below.

    Thanks in advance.
===========================================================================================



Loading MonitorK.elf.
Pico Monitor V3.9.2.5 Dec  8 2006 10:05:42 10000000.
Loading zImage.elf.
Calling 00800000, flags=0
Config Options: PICO_DEBUG PICO_EXPERIMENTAL PICO_DISABLE_MCE MTD_PICO
SERIAL_UARTLITE SERIAL_UARTLITE_PICO SERIAL_KEYHOLE
SERIAL_KEYHOLE_CONSOLE PICOFS

loaded at:     00800000 00AC014C
board data at: 0FFF0030 0FFF005C
relocated to:  00804060 0080408C

zimage at:     00804F43 00ABD9F7
avail ram:     00AC1000 0FFFFFFF

Linux/PPC load:
commandline:   root=/dev/ram
Uncompressing Linux...done.
Now booting the kernel

Linux version 2.6.19-g2b5f6dcc-dirty (root@pico.dlasys.net) (gcc version
3.4.1) #10 Sat Dec 9 05:44:54 EST 2006
Pico Virtex-4 port
Port by DLA Systems (info@dlasys.net)
Zone PFN ranges:
  DMA             0 ->    65535
  Normal      65535 ->    65535
early_node_map[1] active PFN ranges
    0:        0 ->    65535
Built 1 zonelists.  Total pages: 65024
Kernel command line:   root=/dev/ram
Xilinx INTC #0 at 0x41200000 mapped to 0xF5FFD000
PID hash table entries: 1024 (order: 10, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 255488k available (1344k kernel code, 644k data, 2056k init, 0k
highmem)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
            
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 8192 bind 4096)
TCP reno registered
io scheduler noop registered (default)
Serial: Xilinx uartlite driver $Revision: 0.10 $ 1 ports
Serial: Pico keyhole driver $Revision: 0.20 $
ttyS0 at MMIO 0x70000000 (irq = -1) is a keyhole
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
pico-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
pico-Flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
picoFlash: info->nr_parts=2
picoFlash: partsz
picoFlash: pico_partitions[0].size=02000000
picoFlash: pico_partitions[0].offset=00000000
picoFlash: pico_partitions[1].size=02000000
picoFlash: pico_partitions[1].offset=02000000
Creating 2 MTD partitions on "pico-Flash.0":
0x00000000-0x02000000 : "PicoFS"
0x02000000-0x04000000 : "JFFS2"
TCP cubic registered
NET: Registered protocol family 17
Freeing unused kernel memory: 2056k init
command='/bin/sh' action='2' terminal='/dev/ttyS0'

command='/etc/init.d/rcS' action='1' terminal='/dev/ttyS0'

command='/sbin/init' action='128' terminal='/dev/ttyS0'

command='/sbin/reboot' action='32' terminal='/dev/ttyS0'

command='/sbin/swapoff -a 2>/dev/null' action='64' terminal='/dev/ttyS0'

command='/bin/umount -a -r' action='64' terminal='/dev/ttyS0'

Starting DHCP client: udhcpc already running.

BusyBox v1.2.0 (2006.07.21-07:20+0000) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

/ $ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00020000 "PicoFS"
mtd1: 02000000 00020000 "JFFS2"
/ ls -al /dev/m*
crw-------    1 root     root       1,   1 Jan  1 00:00 /dev/mem
crw-------    1 root     root      90,   0 Jan  1 00:00 /dev/mtd0
crw-------    1 root     root      90,   2 Jan  1 00:00 /dev/mtd1
crw-------    1 root     root      90,   4 Jan  1 00:00 /dev/mtd2
crw-------    1 root     root      90,   6 Jan  1 00:00 /dev/mtd3
brw-------    1 root     root      31,   0 Jan  1 00:00 /dev/mtdblock0
brw-------    1 root     root      31,   1 Jan  1 00:00 /dev/mtdblock1
brw-------    1 root     root      31,   2 Jan  1 00:00 /dev/mtdblock2
brw-------    1 root     root      31,   3 Jan  1 00:00 /dev/mtdblock3
/ $ mount -t picofs /dev/mtdblock0 /mnt
mount: Mounting /dev/mtdblock0 on /mnt failed: No such device
/ $ mount -t picofs /dev/mtdblock1 /mnt
mount: Mounting /dev/mtdblock1 on /mnt failed: No such device
/ $ mount -t picofs /dev/mtdblock2 /mnt
mount: Mounting /dev/mtdblock2 on /mnt failed: No such device
/ $


-- 
Dave Lynch 					  	    DLA Systems
Software Development:  				         Embedded Linux
717.627.3770 	       dhlii@dlasys.net 	  http://www.dlasys.net
fax: 1.253.369.9244 			           Cell: 1.717.587.7774
Over 25 years' experience in platforms, languages, and technologies too numerous to list.

"Any intelligent fool can make things bigger and more complex... It takes a touch of genius - and a lot of courage to move in the opposite direction."
Albert Einstein
