Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwcNP-0003aM-OP
 for linux-mtd@lists.infradead.org; Mon, 25 Sep 2017 23:01:27 +0000
Subject: Re: Issue with Micron QSPI flash in 4.14-rc1
To: Andras Szemzo <szemzo.andras@gmail.com>, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 Richard Weinberger <richard@nod.at>
References: <E36A7C66-EC4D-46FF-A6E1-835E1C466E55@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
Date: Tue, 26 Sep 2017 01:00:56 +0200
MIME-Version: 1.0
In-Reply-To: <E36A7C66-EC4D-46FF-A6E1-835E1C466E55@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andras,

thanks for your report, I'll try to study it more closely and propose a
fixup withing the next few days (thinking about invert the logic of
SKIP_SFDP to disable the parsing by default and enable it memory by
memory when needed) but here some comments:

Le 25/09/2017 à 16:28, Andras Szemzo a écrit :
> Hi,
> 
> I try to use Micron QSPI flash (n25q512ax3) on my Atmel SAMV7 armv7m SoC, with the atmel-quadspi driver.
> 
> With 4.13.x kernel, everything was working, but after the mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables
> patch this is not working, with the error:
> 
> ubi0 error: ubi_read_volume_table: the layout volume was not found
> ubi0 error: ubi_attach_mtd_dev: failed to attach mtd2, error -22
> 
> After adding SPI_NOR_SKIP_SFDP to n25q512ax3 flags it works again with 4.14-rc1 kernel.
> 
> This flash has only JESD216 compatible SFDP table. 
> 
> (For me it seems the flash reports supporting dual/quad read modes,
> but with Micron flashes, the QUAD enable procedure isn’t supported by the spi-nor driver, and this can be the problem, but
> it’s absolutely possible that I overlooked something and I’m completly wrong :)
> 
>

The wording used in Micron datasheets is quite confusing. They talk
about their Quad SPI mode only when using the SPI 4-4-4 protocol,
whereas other manufacturers and the SFDP specification talk about
enabling Quad SPI (or Quad Enable requirements) when using any Quad SPI
protocols, that is SPI 1-1-4, SPI 1-4-4 or SPI 4-4-4.

The Quad Enable requirement is indeed a procedure to set some bit in
some manufacturer specific status register so pins #Write Protect and
#Hold/#Reset are reassigned to function IO2 and IO3.

Then Micron memories don't have any quad enable requirement: AFAIK, they
just check the value of the 8bit opcode to decide whether or not #Write
Protect and #Hold/#Reset functions should be disabled and replaced by
IO2 and IO3 functions. That's why there is nothing special to do with
Micron memories before using SPI 1-1-4 or SPI 1-4-4.

> Here are the flash parameteres with SFDP tables:
> 
> bfpt.dwords[0]: 0xfffb20e5
> bfpt.dwords[1]: 0x1fffffff
> bfpt.dwords[2]: 0x6b27eb29
> bfpt.dwords[3]: 0xbb273b27
> bfpt.dwords[4]: 0xffffffff
> bfpt.dwords[5]: 0xbb27ffff
> bfpt.dwords[6]: 0xeb29ffff
> bfpt.dwords[7]: 0xd810200c
> bfpt.dwords[8]: 0x00000000
> bfpt.dwords[9]: 0x00000000
> bfpt.dwords[10]: 0x00000000
> bfpt.dwords[11]: 0x00000000
> bfpt.dwords[12]: 0x00000000
> bfpt.dwords[13]: 0x00000000
> bfpt.dwords[14]: 0x00000000
> bfpt.dwords[15]: 0x00000000

VERY useful data for me, thanks!

At the first look, I would say that this memory is only compliant with
the JESD216 specification but not with rev A or rev B. Indeed, the basic
flash parameter table has:
- 9 DWORDs for JESD216 (v1.0)
- 16 DWORDs for JESD216 rev A (v1.5)
- 16 DWORDs for JESD216 rev B (v1.6)

I would say it is possible for DWORD9 (bfpt.dwoards[8]) to be equal to
zero: it just means that Erase Types 3 and 4 are not supported.


Could you please test 2 different things for me?

1 - just add a debug trace in spi_nor_parse_bfpt() to print the version
and length of the BFPT header:

+	dev_info(nor->dev, "BFPT version %d.%d (length = %u)\n",
+		 bfpt_header->major,
+		 bfpt_header->minor,
+		 bfpt_header->length);

With you memory, it should output version 1.0 (length = 9). If not, the
SFDP tables of your memory are likely to have been incorrectly
programmed in factory by Micron. It has already happened with some
Spansion/Cypress memories.

2 - Comment the SNOR_HWCAPS_READ_1_4_4 and SNOR_HWCAPS_READ_4_4_4
hardware capabilities in the atmel-quadspi.c driver.

For read operations and Quad SPI protocols, let's keep only the SPI
1-1-4 (SNOR_HWCAPS_READ_1_1_4).

This driver was developed and tested for the QSPI controller of SAMA5D2
and I think the controller (IP version) is not quite the same on SAMV7.

I would be surprised that SPI 1-4-4 doesn't work with the Atmel QSPI
controller of SAMV7 but let's verify it.

Best regards,

Cyrille


> flash_parameter (size): 67108864
> flash_parameter (page_size): 256
> flash_parameter (hw_caps): 0x103bb
> flash_parameter reads #0
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 3
>         proto: 65793
> flash_parameter reads #1
>         num_mode_clocks: 0
>         num_wait_states: 8
>         opcode: 11
>         proto: 65793
> flash_parameter reads #2
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #3
>         num_mode_clocks: 1
>         num_wait_states: 7
>         opcode: 59
>         proto: 65794
> flash_parameter reads #4
>         num_mode_clocks: 1
>         num_wait_states: 7
>         opcode: 187
>         proto: 66050
> flash_parameter reads #5
>         num_mode_clocks: 1
>         num_wait_states: 7
>         opcode: 187
>         proto: 131586
> flash_parameter reads #6
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #7
>         num_mode_clocks: 1
>         num_wait_states: 7
>         opcode: 107
>         proto: 65796
> flash_parameter reads #8
>         num_mode_clocks: 1
>         num_wait_states: 9
>         opcode: 235
>         proto: 66564
> flash_parameter reads #9
>         num_mode_clocks: 1
>         num_wait_states: 9
>         opcode: 235
>         proto: 263172
> flash_parameter reads #10
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #11
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #12
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #13
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #14
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #0
>         opcode: 2
>         proto: 65793
> flash_parameter page_programs #1
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #2
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #3
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #4
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #5
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #6
>         opcode: 0
>         proto: 0
> atmel_qspi 4007c000.qspi: n25q512ax3 (65536 Kbytes)
> 
> 
> 
> And here with the SPI_NOR_SKIP_SFDP added flag, using static parameters:
> 
> flash_parameter (size): 67108864
> flash_parameter (page_size): 256
> flash_parameter (hw_caps): 0x10083
> flash_parameter reads #0
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 3
>         proto: 65793
> flash_parameter reads #1
>         num_mode_clocks: 0
>         num_wait_states: 8
>         opcode: 11
>         proto: 65793
> flash_parameter reads #2
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #3
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #4
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #5
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #6
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #7
>         num_mode_clocks: 0
>         num_wait_states: 8
>         opcode: 107
>         proto: 65796
> flash_parameter reads #8
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #9
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #10
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #11
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #12
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #13
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter reads #14
>         num_mode_clocks: 0
>         num_wait_states: 0
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #0
>         opcode: 2
>         proto: 65793
> flash_parameter page_programs #1
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #2
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #3
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #4
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #5
>         opcode: 0
>         proto: 0
> flash_parameter page_programs #6
>         opcode: 0
>         proto: 0
> atmel_qspi 4007c000.qspi: n25q512ax3 (65536 Kbytes)
> 
> 
> Here is the full bootlog with using SFDP tables:
> 
> xboot v1.0
> QSPI boot selected
> Trying protocol 0 opcode 0x9f
> Found memory with JEDEC ID 0x0020ba20.
> Found supported memory with JEDEC ID 0x0020ba20 (N25Q512Ax3).
> QSPI Flash: Micron Quad mode disabled, will enable it
> QSPI: dt blob: Read from 0x400000 to 0x71000000 size: 24572 bytes
> QSPI: Image: Read from 0x00 to 0x70007FC0, size: 3252864 bytes
> QSPI Flash: Micron Quad mode enabled, will disable it
> starting kernel 0x70008001
> 
> Booting Linux on physical CPU 0x0
> Linux version 4.14.0-rc1 (root@devel) (gcc version 4.9.2 ( 4.9.2-10)) #39 Mon Sep 25 15:30:07 CEST 2017
> CPU: ARMv7-M [410fc271] revision 1 (ARMv7M), cr=00000000
> CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> OF: fdt: Machine model: SAME70-sampione board
> debug: ignoring loglevel setting.
> Reserved memory: created DMA memory pool at 0x73e00000, size 2 MiB
> OF: reserved mem: initialized node linux,dma, compatible id shared-dma-pool
> Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 4 of 16 regions
> On node 0 totalpages: 15872
> free_area_init_node: node 0, pgdat 70317be0, node_mem_map 73d80000
>   Normal zone: 124 pages used for memmap
>   Normal zone: 0 pages reserved
>   Normal zone: 15872 pages, LIFO batch:0
> random: fast init done
> pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> pcpu-alloc: [0] 0 
> Built 1 zonelists, mobility grouping off.  Total pages: 15748
> Kernel command line: console=ttyS1,115200 rootfstype=ubifs rw ubi.mtd=2 root=ubi0:rootfs ignore_loglevel
> PID hash table entries: 256 (order: -2, 1024 bytes)
> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Memory: 59452K/63488K available (1780K kernel code, 143K rwdata, 1056K rodata, 80K init, 143K bss, 4036K reserved, 0K cma-reserved)
> Virtual kernel memory layout:
>     vector  : 0x00000000 - 0x00001000   (   4 kB)
>     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
>     vmalloc : 0x00000000 - 0xffffffff   (4095 MB)
>     lowmem  : 0x70000000 - 0x73e00000   (  62 MB)
>     modules : 0x70000000 - 0x74000000   (  64 MB)
>       .text : 0x70008000 - 0x701c5368   (1781 kB)
>       .init : 0x702e8000 - 0x702fc000   (  80 kB)
>       .data : 0x702fc000 - 0x7031fc28   ( 144 kB)
>        .bss : 0x70322280 - 0x70345edc   ( 144 kB)
> NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> clocksource: timer@4000c000:0,1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 101933890472 ns
> sched_clock: 32 bits at 18MHz, resolution 53ns, wraps every 114532461029ns
> Calibrating delay loop... 580.40 BogoMIPS (lpj=2902016)
> pid_max: default: 4096 minimum: 301
> Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> devtmpfs: initialized
> DMA-API: preallocated 4096 debug entries
> DMA-API: debugging enabled by kernel config
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> pinctrl core: initialized pinctrl subsystem
> DMA: default coherent area is set
> NET: Registered protocol family 16
> gpio-at91 400e0e00.gpio: at address 400e0e00
> gpio-at91 400e1000.gpio: at address 400e1000
> gpio-at91 400e1200.gpio: at address 400e1200
> gpio-at91 400e1400.gpio: at address 400e1400
> gpio-at91 400e1600.gpio: at address 400e1600
> pinctrl-at91 soc:pinctrl@400e0e00: initialized AT91 pinctrl driver
> at_xdmac 40078000.dma-controller: 24 channels, mapped at 0x40078000
> AT91: Detected SoC family: same7
> AT91: Detected SoC: same70q20, revision 0
> at91_i2c 40018000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
> at91_i2c 40018000.i2c: AT91 i2c bus driver (hw version: 0x610).
> pps_core: LinuxPPS API ver. 1 registered
> pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> PTP clock support registered
> clocksource: Switched to clocksource timer@4000c000:0,1
> NET: Registered protocol family 2
> TCP established hash table entries: 1024 (order: 0, 4096 bytes)
> TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
> TCP: Hash tables configured (established 1024 bind 1024)
> UDP hash table entries: 256 (order: 0, 4096 bytes)
> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> NET: Registered protocol family 1
> workingset: timestamp_bits=30 max_order=14 bucket_order=0
> io scheduler noop registered
> io scheduler deadline registered (default)
> 40024000.serial: ttyS0 at MMIO 0x40024000 (irq = 40, base_baud = 9375000) is a ATMEL_SERIAL
> 40028000.serial: ttyS1 at MMIO 0x40028000 (irq = 41, base_baud = 9375000) is a ATMEL_SERIAL
> console [ttyS1] enabled
> 400e0800.serial: ttyS3 at MMIO 0x400e0800 (irq = 42, base_baud = 9375000) is a ATMEL_SERIAL
> 400e0a00.serial: ttyS4 at MMIO 0x400e0a00 (irq = 43, base_baud = 9375000) is a ATMEL_SERIAL
> 400e1a00.serial: ttyS5 at MMIO 0x400e1a00 (irq = 44, base_baud = 9375000) is a ATMEL_SERIAL
> 400e1e00.serial: ttyS7 at MMIO 0x400e1e00 (irq = 45, base_baud = 9375000) is a ATMEL_SERIAL
> atmel_qspi 4007c000.qspi: n25q512ax3 (65536 Kbytes)
> 3 ofpart partitions found on MTD device 4007c000.qspi
> Creating 3 MTD partitions on "4007c000.qspi":
> 0x000000000000-0x000000400000 : "qspi-linux-kernel"
> 0x000000400000-0x000000420000 : "qspi-device-tree"
> 0x000000420000-0x000004000000 : "qspi-rootfs"
> atmel_spi 40008000.spi: Using dma0chan2 (tx) and dma0chan3 (rx) for DMA transfers
> atmel_spi 40008000.spi: Using FIFO (0 data)
> atmel_spi 40008000.spi: Atmel SPI Controller version 0x232 at 0x40008000 (irq 37)
> libphy: Fixed MDIO Bus: probed
> CAN device driver interface
> m_can 40034000.can: m_can device registered (irq=25, version=30)
> libphy: MACB_mii_bus: probed
> NS DP83848C 10/100 Mbps PHY 40050000.ethernet-ffffffff:01: attached PHY driver [NS DP83848C 10/100 Mbps PHY] (mii_bus:phy_addr=40050000.ethernet-ffffffff:01, irq=52)
> macb 40050000.ethernet eth0: Cadence GEM rev 0x00020203 at 0x40050000 irq 49 (02:97:2d:60:64:39)
> rtc rtc0: invalid alarm value: 1900-1-1 0:0:0
> at91_rtc 400e1860.rtc: registered as rtc0
> at91_rtc 400e1860.rtc: AT91 Real Time Clock driver.
> rtc-at91sam9 400e1830.rtt: rtc core: registered 400e1830.rtt as rtc1
> rtc-at91sam9 400e1830.rtt: rtc1: SET TIME!
> i2c /dev entries driver
> AT91: Starting after software reset
> at91sam9_wdt: enabled (heartbeat=8 sec, nowayout=0)
> atmel_mci 40000000.mmc: version: 0x600
> atmel_mci 40000000.mmc: using dma0chan4 for DMA transfers
> atmel_mci 40000000.mmc: Atmel MCI controller at 0x40000000 irq 36, 1 slots
> atmel_aes 4006c000.aes: version: 0x201
> atmel_aes 4006c000.aes: Atmel AES - Using dma0chan5, dma0chan6 for DMA transfers
> iio iio:device0: freq: 200000, startup: 3, prescal: 32
> samv7_adc 4003c000.adc: version: 0x213
> iio iio:device1: freq: 200000, startup: 3, prescal: 32
> samv7_adc 40064000.adc: version: 0x213
> samv7_dac 40040000.dac: f_per: 150000000, prescal: 11, MR: 0xb000000, ACR: 0x8
> samv7_dac 40040000.dac: version: 0x306
> NET: Registered protocol family 17
> can: controller area network core (rev 20170425 abi 9)
> NET: Registered protocol family 29
> can: raw protocol (rev 20170425)
> can: broadcast manager protocol (rev 20170425 t)
> can: netlink gateway (rev 20170425) max_hops=1
> ubi0: default fastmap pool size: 45
> ubi0: default fastmap WL pool size: 22
> ubi0: attaching mtd2
> mmc0: host does not support reading read-only switch, assuming write-enable
> mmc0: new high speed SDHC card at address aaaa
> mmcblk0: mmc0:aaaa SL08G 7.40 GiB 
>  mmcblk0: p1 p2
> ubi0: scanning is finished
> ubi0 error: ubi_read_volume_table: the layout volume was not found
> ubi0 error: ubi_attach_mtd_dev: failed to attach mtd2, error -22
> UBI error: cannot attach mtd2
> at91_rtc 400e1860.rtc: setting system clock to 2012-01-01 00:02:11 UTC (1325376131)
> atmel_usart 40028000.serial: using dma0chan7 for rx DMA transfers
> atmel_usart 40028000.serial: using dma0chan8 for tx DMA transfers
> VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -19
> Please append a correct "root=" boot option; here are the available partitions:
> b300         7761920 mmcblk0 
>  driver: mmcblk
>   b301          131072 mmcblk0p1 3e7fd08e-01
> 
>   b302         7629824 mmcblk0p2 3e7fd08e-02
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc1 #39
> Hardware name: Generic DT based system
> [<7000c9ad>] (unwind_backtrace) from [<7000b59f>] (show_stack+0xb/0xc)
> [<7000b59f>] (show_stack) from [<7000ee71>] (panic+0x71/0x180)
> [<7000ee71>] (panic) from [<702e8997>] (mount_block_root+0x187/0x1ec)
> [<702e8997>] (mount_block_root) from [<702e8a9d>] (prepare_namespace+0x4d/0xf0)
> [<702e8a9d>] (prepare_namespace) from [<702e871d>] (kernel_init_freeable+0x101/0x144)
> [<702e871d>] (kernel_init_freeable) from [<701c28bb>] (kernel_init+0x7/0x98)
> [<701c28bb>] (kernel_init) from [<70009d51>] (ret_from_fork+0x11/0x20)
> ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> 
> 
> 
