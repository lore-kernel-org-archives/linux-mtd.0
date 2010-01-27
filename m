Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaGwU-0006g4-TR
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 23:05:03 +0000
Received: from mail174-tx2 (localhost [127.0.0.1])	by
	mail174-tx2-R.bigfish.com (Postfix) with ESMTP id 63AB01758D2F	for
	<linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 23:04:55 +0000 (UTC)
Received: from TX2EHSMHS010.bigfish.com (unknown [10.9.14.240])	by
	mail174-tx2.bigfish.com (Postfix) with ESMTP id 493EFBD8097	for
	<linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 23:04:54 +0000 (UTC)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: UBIFS log replay error
Date: Wed, 27 Jan 2010 17:04:52 -0600
Message-ID: <A117B9F753B6EB4580D381ED91D0FED00174D955@transmail01.transcrypt.local>
From: Brian Niebuhr <BNiebuhr@efjohnson.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All -=20

I am bringing up a custom board with an UBIFS root file system.  The
board appears to boot fine and I am able to access files in the file
system.  I have been debugging other issues and in the process I have
been powering off the board abruptly (i.e. turning off the power
supply), and hence the filesystem doesn't get unmounted correctly.  The
filesystem recovers most of the time, but on multiple occasions I've got
the following error:

UBIFS: recovery needed
UBIFS error (pid 1): validate_ref: bud at LEB 31:93848 was already
referred
UBIFS error (pid 1): replay_log_leb: log error detected while replaying
the log at LEB 5:32

Obviously the filesystem wouldn't mount and my only option was
re-flashing the filesystem.

Can anyone tell me what might be happening, and how I can correct it?
The filesystem is being stored in Numonyx P30 NOR flash.  The dmesg
output is as follows:


[    0.000000] Linux version 2.6.32-rc6 (devel@devel-desktop) (gcc
version 4.4.2(GCC) ) #6 PREEMPT Wed Jan 27 10:57:07 CST 2010
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ),
cr=3D00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: Test
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] DaVinci da850/omap-l138 variant 0x0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.
Total pages: 3556
[    0.000000] Kernel command line: mem=3D14M console=3DttyS0,115200n8
rootfstype=3Dubifs ubi.mtd=3D3 root=3Dubi0:rootfs
[    0.000000] PID hash table entries: 64 (order: -4, 256 bytes)
[    0.000000] Dentry cache hash table entries: 2048 (order: 1, 8192
bytes)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096
bytes)
[    0.000000] Memory: 14MB =3D 14MB total
[    0.000000] Memory: 11816KB available (1996K code, 184K data, 80K
init, 0K highmem)
[    0.000000] SLUB: Genslabs=3D11, HWalign=3D32, Order=3D0-3, =
MinObjects=3D0,
CPUs=3D1, Nodes=3D1
[    0.000000] Experimental preemptable hierarchical RCU implementation.
[    0.000000] NR_IRQS:245
[    0.000000] Console: colour dummy device 80x30
[    0.000000] Calibrating delay loop... 49.76 BogoMIPS (lpj=3D248832)
[    0.180000] Mount-cache hash table entries: 512
[    0.180000] CPU: Testing write buffer coherency: ok
[    0.190000] DaVinci: 144 gpio irqs
[    0.200000] NET: Registered protocol family 16
[    0.220000] MUX: initialized EMA_CLK
[    0.220000] MUX: initialized EMA_WAIT_1
[    0.220000] MUX: initialized I2C1_SCL
[    0.220000] MUX: initialized I2C1_SDA
[    0.240000] MUX: initialized SPI1_CS_0
[    0.240000] MUX: initialized SPI1_CLK
[    0.240000] MUX: initialized SPI1_SOMI
[    0.240000] MUX: initialized SPI1_SIMO
[    0.300000] bio: create slab <bio-0> at 0
[    0.320000] Switching to clocksource timer0_1
[    0.330000] musb_hdrc: version 6.0, cppi4.1-dma, peripheral, =
debug=3D0
[    0.330000] Waiting for USB PHY clock good...
[    0.350000] musb_hdrc: USB Peripheral mode controller at fee00000
using DMA,IRQ 58
[    0.350000] NET: Registered protocol family 2
[    0.350000] IP route cache hash table entries: 1024 (order: 0, 4096
bytes)
[    0.350000] TCP established hash table entries: 512 (order: 0, 4096
bytes)
[    0.350000] TCP bind hash table entries: 512 (order: -1, 2048 bytes)
[    0.350000] TCP: Hash tables configured (established 512 bind 512)
[    0.350000] TCP reno registered
[    0.350000] NET: Registered protocol family 1
[    0.490000] msgmni has been set to 23
[    0.500000] io scheduler noop registered
[    0.500000] io scheduler deadline registered (default)
[    0.700000] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
[    0.700000] serial8250.0: ttyS0 at MMIO 0x1c42000 (irq =3D 25) is a
16550A
[    0.950000] console [ttyS0] enabled
[    0.960000] serial8250 serial8250.0: unable to register port at index
1 (IO0MEM1d0c000 IRQ53): -22
[    0.970000] serial8250 serial8250.0: unable to register port at index
2 (IO0MEM1d0d000 IRQ61): -22
[    0.980000] physmap platform flash device: 01000000 at 60000000
[    0.990000] physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit
bank
[    1.000000]  Intel/Sharp Extended Query Table at 0x010A
[    1.010000]  Intel/Sharp Extended Query Table at 0x010A
[    1.010000]  Intel/Sharp Extended Query Table at 0x010A
[    1.020000]  Intel/Sharp Extended Query Table at 0x010A
[    1.020000]  Intel/Sharp Extended Query Table at 0x010A
[    1.030000] Using buffer write method
[    1.030000] Using auto-unlock on power-up/resume
[    1.040000] cfi_cmdset_0001: Erase suspend on write enabled
[    1.040000] RedBoot partition parsing not available
[    1.050000] Using physmap partition information
[    1.050000] Creating 4 MTD partitions on "physmap-flash.0":
[    1.060000] 0x000000000000-0x000000040000 : "bootloader"
[    1.070000] 0x000000040000-0x000000220000 : "kernel"
[    1.090000] 0x000000220000-0x000000400000 : "kernel_copy"
[    1.100000] 0x000000400000-0x000001000000 : "filesystem"
[    1.120000] UBI: attaching mtd3 to ubi0
[    1.130000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    1.140000] UBI: logical eraseblock size:    130944 bytes
[    1.140000] UBI: smallest flash I/O unit:    1
[    1.150000] UBI: VID header offset:          64 (aligned 64)
[    1.150000] UBI: data offset:                128
[    1.210000] UBI: attached mtd3 to ubi0
[    1.220000] UBI: MTD device name:            "filesystem"
[    1.220000] UBI: MTD device size:            12 MiB
[    1.230000] UBI: number of good PEBs:        96
[    1.230000] UBI: number of bad PEBs:         0
[    1.240000] UBI: max. allowed volumes:       128
[    1.240000] UBI: wear-leveling threshold:    4096
[    1.250000] UBI: number of internal volumes: 1
[    1.250000] UBI: number of user volumes:     1
[    1.260000] UBI: available PEBs:             0
[    1.260000] UBI: total number of reserved PEBs: 96
[    1.270000] UBI: number of PEBs reserved for bad PEB handling: 0
[    1.270000] UBI: max/mean erase counter: 2/0
[    1.280000] UBI: image sequence number: 0
[    1.280000] UBI: background thread "ubi_bgt0d" started, PID 263
[    1.300000] davinci SPI Controller driver at 0xfef0e000 (irq =3D 56)
use_dma=3D1
[    1.320000] omap_rtc omap_rtc: rtc core: registered omap_rtc as rtc0
[    1.320000] omap_rtc: RTC power up reset detected
[    1.330000] omap_rtc: already running
[    1.330000] i2c /dev entries driver
[    1.350000] TCP cubic registered
[    1.350000] NET: Registered protocol family 17
[    1.370000] omap_rtc omap_rtc: setting system clock to 2000-01-15
06:57:46 UTC (947919466)
[    1.550000] UBIFS: recovery needed
[    1.720000] UBIFS error (pid 1): validate_ref: bud at LEB 31:93848
was already referred
[    1.730000] UBIFS error (pid 1): replay_log_leb: log error detected
while replaying the log at LEB 5:32
[    1.760000] List of all partitions:
[    1.760000] 1f00             256 mtdblock0 (driver?)
[    1.770000] 1f01            1920 mtdblock1 (driver?)
[    1.770000] 1f02            1920 mtdblock2 (driver?)
[    1.780000] 1f03           12288 mtdblock3 (driver?)
[    1.780000] No filesystem could mount root, tried:  ubifs
[    1.790000] Kernel panic - not syncing: VFS: Unable to mount root fs
on unknown-block(0,0)


Thanks for any help you can provide!

Brian
