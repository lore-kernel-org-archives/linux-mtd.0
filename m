Received: from smtp12.smtpout.orange.fr ([80.12.242.134]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWS86-0003u9-0z
 for linux-mtd@lists.infradead.org; Tue, 02 Jan 2018 19:22:31 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon> <877etkecig.fsf@belgarion.home>
 <20171218092535.2ca1fe13@xps13> <87y3lxccr7.fsf@belgarion.home>
 <20171220224121.2cb6f690@bbrezillon> <87lghucykr.fsf@belgarion.home>
 <20171222222441.0fd77df9@bbrezillon> <20171222233730.68d9cb9d@xps13>
 <87k1xdblxf.fsf@belgarion.home> <20171223155709.2ba16e95@xps13>
 <87fu81bc45.fsf@belgarion.home> <20180102120326.7a2cf1d1@xps13>
Date: Tue, 02 Jan 2018 20:21:09 +0100
In-Reply-To: <20180102120326.7a2cf1d1@xps13> (Miquel RAYNAL's message of "Tue,
 2 Jan 2018 12:03:26 +0100")
Message-ID: <87d12scbiy.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Miquel RAYNAL <miquel.raynal@free-electrons.com> writes:

> I think the ECC issue you faced was related to pages being written
> *and* empty. If this guess is right, the board should boot fine with
> these changes.
>
> Otherwise, please add the DEBUG define as before in both the core and
> the driver and do not hesitate to add another dump_stack() where it
> crashes (if applicable).

The problem looks still the same :
[    3.560163] Bad block table not found for chip 0

Cheers.

--
Robert

-- 
Robert

[1] Dmesg
---8>---
netconsole: port not set
netconsole: registered as netconsole-1
smc91c111 smc91c1110: chip is revision= 9, version= 2
mdio_bus: miibus0: probed
eth0: got preset MAC address: 00:0e:0c:a7:26:f7
nand: NAND device: Manufacturer ID: 0x20, Chip ID: 0xba (ST Micro NAND 256MiB 1,8V 16-bit), 256MiB, page size: 2048, OOB size: 64
mrvl_nand mrvl_nand0: ECC strength 1, ECC step size 512
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
malloc space: 0x83700000 -> 0x83efffff (size 8 MiB)
running /env/bin/init...
magicvar: No such file or directory
magicvar: No such file or directory
magicvar: No such file or directory

Hit any key to stop autoboot:  3 2 1 0
booting net
netconsole: netconsole initialized with 255.255.255.255:6662
eth0: 100Mbps full duplex link detected
DHCP client bound to address 192.168.1.232
netconsole: netconsole initialized with 255.255.255.255:6662
could not open /mnt/tftp/none-linux-zylonite: No such file or directory
Booting net failed: No such file or directory
booting net failed: No such file or directory
boot: No such file or directory
.[1;32mbarebox@.[1;36mZylonite:/.[0m global linux.bootargs.debug=earlycon
.[1;32mbarebox@.[1;36mZylonite:/.[0m bootm /mnt/tftp/zImage_jenkins

Loading ARM Linux zImage '/mnt/tftp/zImage_jenkins'
commandline: ram=64M console=ttyS0,115200 ip=dhcp root=/dev/nfs nfsroot=/home/none/nfsroot/zylonite,v3,tcp earlycon mtdparts=pxa3xx_nand-0:128k@0(TIMH)ro,128k@128k(OBMI)ro,768k@256k(barebox),256k@1024k(barebox-env),12M@1280k(kernel),38016k@13568k(root)
arch_number: 1233
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.15.0-rc1-00042-ge693b77 (jenkins@belgarath) (gcc version 4.8.3 20140320 (prerelease) (Sourcery CodeBench Lite 2014.05-29)) #817 PREEMPT Tue Jan 2 18:08:25 CET 2018
[    0.000000] CPU: XScale-V3 based processor [69056891] revision 1 (ARMv5TE), cr=0000397f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: PXA3xx Platform Development Kit (aka Zylonite)
[    0.000000] Ignoring tag cmdline (using the default kernel command line)
[    0.000000] Memory policy: Data cache writeback
[    0.000000] RO Mode clock: 0.00MHz
[    0.000000] Run Mode clock: 0.00MHz
[    0.000000] Turbo Mode clock: 0.00MHz
[    0.000000] System bus clock: 0.00MHz
[    0.000000] On node 0 totalpages: 16384
[    0.000000]   Normal zone: 128 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 16384 pages, LIFO batch:3
[    0.000000] random: fast init done
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16256
[    0.000000] Kernel command line: root=/dev/ram0 ip=192.168.1.232:192.168.1.5::255.255.255.0::eth0:on console=ttyS0,115200 mem=64M mtdparts=pxa3xx_nand-0:128k@0(TIMH)ro,128k@128k(OBMI)ro,768k@256k(barebox),256k@1024k(barebox-env),12M@1280k(kernel),38016k@13568k(root) ubi.mtd=5 earlycon=pxa,io,0xf6200000,115200n8 debug no_console_suspend
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 56856K/65536K available (4226K kernel code, 202K rwdata, 972K rodata, 2396K init, 102K bss, 8680K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xc4800000 - 0xff800000   ( 944 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0428a28   (4227 kB)
[    0.000000]       .init : 0xc053f000 - 0xc0796000   (2396 kB)
[    0.000000]       .data : 0xc0796000 - 0xc07c8bec   ( 203 kB)
[    0.000000]        .bss : 0xc07c8bec - 0xc07e25fc   ( 103 kB)
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] NR_IRQS: 16, nr_irqs: 336, preallocated irqs: 336
[    0.000000] RJK: parent_rate=13000000, xl=8, xn=1
[    0.000069] sched_clock: 32 bits at 3250kHz, resolution 307ns, wraps every 660764198758ns
[    0.000265] clocksource: oscr0: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 588080137591 ns
[    0.002135] Console: colour dummy device 80x30
[    0.002294] Calibrating delay loop... 103.83 BogoMIPS (lpj=519168)
[    0.081023] pid_max: default: 32768 minimum: 301
[    0.081861] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.081961] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.085176] CPU: Testing write buffer coherency: ok
[    0.088966] Setting up static identity map for 0x80008200 - 0x80008260
[    0.089928] Hierarchical SRCU implementation.
[    0.102939] devtmpfs: initialized
[    0.113807] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.113949] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.116286] NET: Registered protocol family 16
[    0.119101] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.385393] Advanced Linux Sound Architecture Driver Initialized.
[    0.398663] clocksource: Switched to clocksource oscr0
[    0.551533] NET: Registered protocol family 2
[    0.557291] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.557517] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.557699] TCP: Hash tables configured (established 1024 bind 1024)
[    0.558259] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.558438] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.560686] NET: Registered protocol family 1
[    0.562714] RPC: Registered named UNIX socket transport module.
[    0.562816] RPC: Registered udp transport module.
[    0.562871] RPC: Registered tcp transport module.
[    0.562931] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    2.501505] Initialise system trusted keyrings
[    2.502977] workingset: timestamp_bits=30 max_order=14 bucket_order=0
[    2.507421] NFS: Registering the id_resolver key type
[    2.507626] Key type id_resolver registered
[    2.507689] Key type id_legacy registered
[    2.513786] Key type asymmetric registered
[    2.513887] Asymmetric key parser 'x509' registered
[    2.514050] io scheduler noop registered
[    2.514116] io scheduler deadline registered
[    2.514509] io scheduler cfq registered (default)
[    2.514579] io scheduler mq-deadline registered
[    2.514643] io scheduler kyber registered
[    2.574261] pxa-dma pxa-dma.0: initialized 32 channels on 100 requestors
[    2.578634] pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq = 38, base_baud = 928571) is a UART1
[    3.054506] console [ttyS0] enabled
[    3.061109] pxa2xx-uart.1: ttyS1 at MMIO 0x40200000 (irq = 37, base_baud = 928571) is a UART2
[    3.073618] pxa2xx-uart.2: ttyS2 at MMIO 0x40700000 (irq = 36, base_baud = 928571) is a UART3
[    3.091288] nand: executing subop:
[    3.094787] nand:     ->CMD      [0xff]
[    3.099973] nand:     ->WAITRDY  [max 250 ms]
[    3.104480] marvell-nfc pxa3xx-nand: 
[    3.104480] NDCR:  0x90079fff
[    3.104480] NDCB0: 0x00a000ff
[    3.104480] NDCB1: 0x00000000
[    3.104480] NDCB2: 0x00000000
[    3.104480] NDCB3: 0x00000000
[    3.123768] nand: executing subop:
[    3.127243] nand:     ->CMD      [0x90]
[    3.131549] nand:     ->ADDR     [1 cyc: 00]
[    3.135876] nand:     ->DATA_IN  [2 B, force 8-bit]
[    3.141219] marvell-nfc pxa3xx-nand: 
[    3.141219] NDCR:  0x90079fff
[    3.141219] NDCB0: 0x00610090
[    3.141219] NDCB1: 0x00000000
[    3.141219] NDCB2: 0x00000000
[    3.141219] NDCB3: 0x00000000
[    3.160073] nand: executing subop:
[    3.163536] nand:     ->CMD      [0x90]
[    3.167410] nand:     ->ADDR     [1 cyc: 00]
[    3.171900] nand:     ->DATA_IN  [8 B, force 8-bit]
[    3.176892] marvell-nfc pxa3xx-nand: 
[    3.176892] NDCR:  0x90079fff
[    3.176892] NDCB0: 0x00610090
[    3.176892] NDCB1: 0x00000000
[    3.176892] NDCB2: 0x00000000
[    3.176892] NDCB3: 0x00000000
[    3.195557] nand: executing subop:
[    3.199162] nand:     ->CMD      [0x90]
[    3.203053] nand:     ->ADDR     [1 cyc: 20]
[    3.207353] nand:     ->DATA_IN  [4 B, force 8-bit]
[    3.212466] marvell-nfc pxa3xx-nand: 
[    3.212466] NDCR:  0x90079fff
[    3.212466] NDCB0: 0x00610090
[    3.212466] NDCB1: 0x00000020
[    3.212466] NDCB2: 0x00000000
[    3.212466] NDCB3: 0x00000000
[    3.231108] nand: executing subop:
[    3.234561] nand:     ->CMD      [0x90]
[    3.238433] nand:     ->ADDR     [1 cyc: 40]
[    3.242882] nand:     ->DATA_IN  [5 B, force 8-bit]
[    3.247869] marvell-nfc pxa3xx-nand: 
[    3.247869] NDCR:  0x90079fff
[    3.247869] NDCB0: 0x00610090
[    3.247869] NDCB1: 0x00000040
[    3.247869] NDCB2: 0x00000000
[    3.247869] NDCB3: 0x00000000
[    3.266511] nand: device found, Manufacturer ID: 0x20, Chip ID: 0xba
[    3.273022] nand: ST Micro NAND 256MiB 1,8V 16-bit
[    3.277867] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    3.285604] marvell-nfc pxa3xx-nand: No minimum ECC strength, using 1b/512B
[    3.293273] marvell-nfc pxa3xx-nand: 
[    3.293273] NDCR:  0xdd079fff
[    3.293273] NDCB0: 0x000d3000
[    3.293273] NDCB1: 0xffc00000
[    3.293273] NDCB2: 0x00000001
[    3.293273] NDCB3: 0x00000000
[    3.312627] marvell-nfc pxa3xx-nand: 
[    3.312627] NDCR:  0xdd079fff
[    3.312627] NDCB0: 0x000d3000
[    3.312627] NDCB1: 0xff800000
[    3.312627] NDCB2: 0x00000001
[    3.312627] NDCB3: 0x00000000
[    3.331669] marvell-nfc pxa3xx-nand: 
[    3.331669] NDCR:  0xdd079fff
[    3.331669] NDCB0: 0x000d3000
[    3.331669] NDCB1: 0xff400000
[    3.331669] NDCB2: 0x00000001
[    3.331669] NDCB3: 0x00000000
[    3.350652] marvell-nfc pxa3xx-nand: 
[    3.350652] NDCR:  0x9d079fff
[    3.350652] NDCB0: 0x000d3000
[    3.350652] NDCB1: 0xff400000
[    3.350652] NDCB2: 0x00000001
[    3.350652] NDCB3: 0x00000000
[    3.369749] marvell-nfc pxa3xx-nand: 
[    3.369749] NDCR:  0xdd079fff
[    3.369749] NDCB0: 0x000d3000
[    3.369749] NDCB1: 0xff000000
[    3.369749] NDCB2: 0x00000001
[    3.369749] NDCB3: 0x00000000
[    3.388952] marvell-nfc pxa3xx-nand: 
[    3.388952] NDCR:  0x9d079fff
[    3.388952] NDCB0: 0x000d3000
[    3.388952] NDCB1: 0xff000000
[    3.388952] NDCB2: 0x00000001
[    3.388952] NDCB3: 0x00000000
[    3.408036] marvell-nfc pxa3xx-nand: 
[    3.408036] NDCR:  0xdd079fff
[    3.408036] NDCB0: 0x000d3000
[    3.408036] NDCB1: 0xfec00000
[    3.408036] NDCB2: 0x00000001
[    3.408036] NDCB3: 0x00000000
[    3.427024] marvell-nfc pxa3xx-nand: 
[    3.427024] NDCR:  0x9d079fff
[    3.427024] NDCB0: 0x000d3000
[    3.427024] NDCB1: 0xfec00000
[    3.427024] NDCB2: 0x00000001
[    3.427024] NDCB3: 0x00000000
[    3.446101] marvell-nfc pxa3xx-nand: 
[    3.446101] NDCR:  0xdd079fff
[    3.446101] NDCB0: 0x000d3000
[    3.446101] NDCB1: 0xfe800000
[    3.446101] NDCB2: 0x00000001
[    3.446101] NDCB3: 0x00000000
[    3.465087] marvell-nfc pxa3xx-nand: 
[    3.465087] NDCR:  0x9d079fff
[    3.465087] NDCB0: 0x000d3000
[    3.465087] NDCB1: 0xfe800000
[    3.465087] NDCB2: 0x00000001
[    3.465087] NDCB3: 0x00000000
[    3.484155] marvell-nfc pxa3xx-nand: 
[    3.484155] NDCR:  0xdd079fff
[    3.484155] NDCB0: 0x000d3000
[    3.484155] NDCB1: 0xfe400000
[    3.484155] NDCB2: 0x00000001
[    3.484155] NDCB3: 0x00000000
[    3.503139] marvell-nfc pxa3xx-nand: 
[    3.503139] NDCR:  0x9d079fff
[    3.503139] NDCB0: 0x000d3000
[    3.503139] NDCB1: 0xfe400000
[    3.503139] NDCB2: 0x00000001
[    3.503139] NDCB3: 0x00000000
[    3.522207] marvell-nfc pxa3xx-nand: 
[    3.522207] NDCR:  0xdd079fff
[    3.522207] NDCB0: 0x000d3000
[    3.522207] NDCB1: 0xfe000000
[    3.522207] NDCB2: 0x00000001
[    3.522207] NDCB3: 0x00000000
[    3.541194] marvell-nfc pxa3xx-nand: 
[    3.541194] NDCR:  0x9d079fff
[    3.541194] NDCB0: 0x000d3000
[    3.541194] NDCB1: 0xfe000000
[    3.541194] NDCB2: 0x00000001
[    3.541194] NDCB3: 0x00000000
[    3.560163] Bad block table not found for chip 0
[    3.564937] marvell-nfc pxa3xx-nand: 
[    3.564937] NDCR:  0xdd079fff
[    3.564937] NDCB0: 0x000d3000
[    3.564937] NDCB1: 0xffc00000
[    3.564937] NDCB2: 0x00000001
[    3.564937] NDCB3: 0x00000000
[    3.583953] marvell-nfc pxa3xx-nand: 
[    3.583953] NDCR:  0xdd079fff
[    3.583953] NDCB0: 0x000d3000
[    3.583953] NDCB1: 0xff800000
[    3.583953] NDCB2: 0x00000001
[    3.583953] NDCB3: 0x00000000
[    3.602976] marvell-nfc pxa3xx-nand: 
[    3.602976] NDCR:  0xdd079fff
[    3.602976] NDCB0: 0x000d3000
[    3.602976] NDCB1: 0xff400000
[    3.602976] NDCB2: 0x00000001
[    3.602976] NDCB3: 0x00000000
[    3.621958] marvell-nfc pxa3xx-nand: 
[    3.621958] NDCR:  0x9d079fff
[    3.621958] NDCB0: 0x000d3000
[    3.621958] NDCB1: 0xff400000
[    3.621958] NDCB2: 0x00000001
[    3.621958] NDCB3: 0x00000000
[    3.641031] marvell-nfc pxa3xx-nand: 
[    3.641031] NDCR:  0xdd079fff
[    3.641031] NDCB0: 0x000d3000
[    3.641031] NDCB1: 0xff000000
[    3.641031] NDCB2: 0x00000001
[    3.641031] NDCB3: 0x00000000
[    3.660018] marvell-nfc pxa3xx-nand: 
[    3.660018] NDCR:  0x9d079fff
[    3.660018] NDCB0: 0x000d3000
[    3.660018] NDCB1: 0xff000000
[    3.660018] NDCB2: 0x00000001
[    3.660018] NDCB3: 0x00000000
[    3.679132] marvell-nfc pxa3xx-nand: 
[    3.679132] NDCR:  0xdd079fff
[    3.679132] NDCB0: 0x000d3000
[    3.679132] NDCB1: 0xfec00000
[    3.679132] NDCB2: 0x00000001
[    3.679132] NDCB3: 0x00000000
[    3.698111] marvell-nfc pxa3xx-nand: 
[    3.698111] NDCR:  0x9d079fff
[    3.698111] NDCB0: 0x000d3000
[    3.698111] NDCB1: 0xfec00000
[    3.698111] NDCB2: 0x00000001
[    3.698111] NDCB3: 0x00000000
[    3.717181] marvell-nfc pxa3xx-nand: 
[    3.717181] NDCR:  0xdd079fff
[    3.717181] NDCB0: 0x000d3000
[    3.717181] NDCB1: 0xfe800000
[    3.717181] NDCB2: 0x00000001
[    3.717181] NDCB3: 0x00000000
[    3.736169] marvell-nfc pxa3xx-nand: 
[    3.736169] NDCR:  0x9d079fff
[    3.736169] NDCB0: 0x000d3000
[    3.736169] NDCB1: 0xfe800000
[    3.736169] NDCB2: 0x00000001
[    3.736169] NDCB3: 0x00000000
[    3.755238] marvell-nfc pxa3xx-nand: 
[    3.755238] NDCR:  0xdd079fff
[    3.755238] NDCB0: 0x000d3000
[    3.755238] NDCB1: 0xfe400000
[    3.755238] NDCB2: 0x00000001
[    3.755238] NDCB3: 0x00000000
[    3.774224] marvell-nfc pxa3xx-nand: 
[    3.774224] NDCR:  0x9d079fff
[    3.774224] NDCB0: 0x000d3000
[    3.774224] NDCB1: 0xfe400000
[    3.774224] NDCB2: 0x00000001
[    3.774224] NDCB3: 0x00000000
[    3.793297] marvell-nfc pxa3xx-nand: 
[    3.793297] NDCR:  0xdd079fff
[    3.793297] NDCB0: 0x000d3000
[    3.793297] NDCB1: 0xfe000000
[    3.793297] NDCB2: 0x00000001
[    3.793297] NDCB3: 0x00000000
[    3.812287] marvell-nfc pxa3xx-nand: 
[    3.812287] NDCR:  0x9d079fff
[    3.812287] NDCB0: 0x000d3000
[    3.812287] NDCB1: 0xfe000000
[    3.812287] NDCB2: 0x00000001
[    3.812287] NDCB3: 0x00000000
[    3.831254] Bad block table not found for chip 0
[    3.835915] Scanning device for bad blocks
[    3.840247] nand: nand_do_read_oob: from = 0x00000000, len = 64
[    3.846271] marvell-nfc pxa3xx-nand: 
[    3.846271] NDCR:  0x9d079fff
[    3.846271] NDCB0: 0x000d3000
[    3.846271] NDCB1: 0x00000000
[    3.846271] NDCB2: 0x00000000
[    3.846271] NDCB3: 0x00000000
[    3.865153] Bad eraseblock 0 at 0x000000000000
[    3.869834] nand: nand_do_read_oob: from = 0x00020000, len = 64
[    3.875857] marvell-nfc pxa3xx-nand: 
[    3.875857] NDCR:  0x9d079fff
[    3.875857] NDCB0: 0x000d3000
[    3.875857] NDCB1: 0x00400000
[    3.875857] NDCB2: 0x00000000
[    3.875857] NDCB3: 0x00000000
[    3.894763] nand: nand_do_read_oob: from = 0x00040000, len = 64
[    3.900960] marvell-nfc pxa3xx-nand: 
[    3.900960] NDCR:  0x9d079fff
[    3.900960] NDCB0: 0x000d3000
[    3.900960] NDCB1: 0x00800000
[    3.900960] NDCB2: 0x00000000
[    3.900960] NDCB3: 0x00000000
[    3.919870] Bad eraseblock 2 at 0x000000040000
[    3.924394] nand: nand_do_read_oob: from = 0x00060000, len = 64
[    3.930571] marvell-nfc pxa3xx-nand: 
[    3.930571] NDCR:  0x9d079fff
[    3.930571] NDCB0: 0x000d3000
[    3.930571] NDCB1: 0x00c00000
[    3.930571] NDCB2: 0x00000000
[    3.930571] NDCB3: 0x00000000
[    3.949456] Bad eraseblock 3 at 0x000000060000
[    3.953984] nand: nand_do_read_oob: from = 0x00080000, len = 64
[    3.960164] marvell-nfc pxa3xx-nand: 
[    3.960164] NDCR:  0x9d079fff
[    3.960164] NDCB0: 0x000d3000
[    3.960164] NDCB1: 0x01000000
[    3.960164] NDCB2: 0x00000000
[    3.960164] NDCB3: 0x00000000
[    3.979047] Bad eraseblock 4 at 0x000000080000
[    3.983571] nand: nand_do_read_oob: from = 0x000a0000, len = 64
[    3.989747] marvell-nfc pxa3xx-nand: 
[    3.989747] NDCR:  0x9d079fff
[    3.989747] NDCB0: 0x000d3000
[    3.989747] NDCB1: 0x01400000
[    3.989747] NDCB2: 0x00000000
[    3.989747] NDCB3: 0x00000000
[    4.008735] Bad eraseblock 5 at 0x0000000a0000
[    4.013265] nand: nand_do_read_oob: from = 0x000c0000, len = 64
[    4.019426] marvell-nfc pxa3xx-nand: 
[    4.019426] NDCR:  0x9d079fff
[    4.019426] NDCB0: 0x000d3000
[    4.019426] NDCB1: 0x01800000
[    4.019426] NDCB2: 0x00000000
[    4.019426] NDCB3: 0x00000000
[    4.038293] Bad eraseblock 6 at 0x0000000c0000
[    4.042975] nand: nand_do_read_oob: from = 0x000e0000, len = 64
[    4.049149] marvell-nfc pxa3xx-nand: 
[    4.049149] NDCR:  0x9d079fff
[    4.049149] NDCB0: 0x000d3000
[    4.049149] NDCB1: 0x01c00000
[    4.049149] NDCB2: 0x00000000
[    4.049149] NDCB3: 0x00000000
[    4.068019] Bad eraseblock 7 at 0x0000000e0000
[    4.072699] nand: nand_do_read_oob: from = 0x00100000, len = 64
[    4.078875] marvell-nfc pxa3xx-nand: 
[    4.078875] NDCR:  0x9d079fff
[    4.078875] NDCB0: 0x000d3000
[    4.078875] NDCB1: 0x02000000
[    4.078875] NDCB2: 0x00000000
[    4.078875] NDCB3: 0x00000000
[    4.098109] Bad eraseblock 8 at 0x000000100000
[    4.102830] nand: nand_do_read_oob: from = 0x00120000, len = 64
[    4.109007] marvell-nfc pxa3xx-nand: 
[    4.109007] NDCR:  0x9d079fff
[    4.109007] NDCB0: 0x000d3000
[    4.109007] NDCB1: 0x02400000
[    4.109007] NDCB2: 0x00000000
[    4.109007] NDCB3: 0x00000000
[    4.127919] nand: nand_do_read_oob: from = 0x00140000, len = 64
[    4.134120] marvell-nfc pxa3xx-nand: 
[    4.134120] NDCR:  0x9d079fff
[    4.134120] NDCB0: 0x000d3000
[    4.134120] NDCB1: 0x02800000
[    4.134120] NDCB2: 0x00000000
[    4.134120] NDCB3: 0x00000000
[    4.153008] Bad eraseblock 10 at 0x000000140000
[    4.157619] nand: nand_do_read_oob: from = 0x00160000, len = 64
[    4.163799] marvell-nfc pxa3xx-nand: 
[    4.163799] NDCR:  0x9d079fff
[    4.163799] NDCB0: 0x000d3000
[    4.163799] NDCB1: 0x02c00000
[    4.163799] NDCB2: 0x00000000
[    4.163799] NDCB3: 0x00000000
[    4.182687] Bad eraseblock 11 at 0x000000160000
[    4.187300] nand: nand_do_read_oob: from = 0x00180000, len = 64
[    4.193478] marvell-nfc pxa3xx-nand: 
[    4.193478] NDCR:  0x9d079fff
[    4.193478] NDCB0: 0x000d3000
[    4.193478] NDCB1: 0x03000000
[    4.193478] NDCB2: 0x00000000
[    4.193478] NDCB3: 0x00000000
[    4.212367] Bad eraseblock 12 at 0x000000180000
[    4.216978] nand: nand_do_read_oob: from = 0x001a0000, len = 64
[    4.223158] marvell-nfc pxa3xx-nand: 
[    4.223158] NDCR:  0x9d079fff
[    4.223158] NDCB0: 0x000d3000
[    4.223158] NDCB1: 0x03400000
[    4.223158] NDCB2: 0x00000000
[    4.223158] NDCB3: 0x00000000
[    4.242047] Bad eraseblock 13 at 0x0000001a0000
[    4.246659] nand: nand_do_read_oob: from = 0x001c0000, len = 64
[    4.252836] marvell-nfc pxa3xx-nand: 
[    4.252836] NDCR:  0x9d079fff
[    4.252836] NDCB0: 0x000d3000
[    4.252836] NDCB1: 0x03800000
[    4.252836] NDCB2: 0x00000000
[    4.252836] NDCB3: 0x00000000
[    4.271724] Bad eraseblock 14 at 0x0000001c0000
[    4.276329] nand: nand_do_read_oob: from = 0x001e0000, len = 64
[    4.282510] marvell-nfc pxa3xx-nand: 
[    4.282510] NDCR:  0x9d079fff
[    4.282510] NDCB0: 0x000d3000
[    4.282510] NDCB1: 0x03c00000
[    4.282510] NDCB2: 0x00000000
[    4.282510] NDCB3: 0x00000000
[    4.301396] Bad eraseblock 15 at 0x0000001e0000
[    4.306010] nand: nand_do_read_oob: from = 0x00200000, len = 64
[    4.312187] marvell-nfc pxa3xx-nand: 
[    4.312187] NDCR:  0x9d079fff
[    4.312187] NDCB0: 0x000d3000
[    4.312187] NDCB1: 0x04000000
[    4.312187] NDCB2: 0x00000000
[    4.312187] NDCB3: 0x00000000
[    4.331078] Bad eraseblock 16 at 0x000000200000
[    4.335690] nand: nand_do_read_oob: from = 0x00220000, len = 64
[    4.341868] marvell-nfc pxa3xx-nand: 
[    4.341868] NDCR:  0x9d079fff
[    4.341868] NDCB0: 0x000d3000
[    4.341868] NDCB1: 0x04400000
[    4.341868] NDCB2: 0x00000000
[    4.341868] NDCB3: 0x00000000
[    4.360757] Bad eraseblock 17 at 0x000000220000
[    4.365371] nand: nand_do_read_oob: from = 0x00240000, len = 64
[    4.371546] marvell-nfc pxa3xx-nand: 
[    4.371546] NDCR:  0x9d079fff
[    4.371546] NDCB0: 0x000d3000
[    4.371546] NDCB1: 0x04800000
[    4.371546] NDCB2: 0x00000000
[    4.371546] NDCB3: 0x00000000
[    4.390428] Bad eraseblock 18 at 0x000000240000
[    4.395041] nand: nand_do_read_oob: from = 0x00260000, len = 64
[    4.401219] marvell-nfc pxa3xx-nand: 
[    4.401219] NDCR:  0x9d079fff
[    4.401219] NDCB0: 0x000d3000
[    4.401219] NDCB1: 0x04c00000
[    4.401219] NDCB2: 0x00000000
[    4.401219] NDCB3: 0x00000000
[    4.420110] Bad eraseblock 19 at 0x000000260000
[    4.424721] nand: nand_do_read_oob: from = 0x00280000, len = 64
[    4.430902] marvell-nfc pxa3xx-nand: 
[    4.430902] NDCR:  0x9d079fff
[    4.430902] NDCB0: 0x000d3000
[    4.430902] NDCB1: 0x05000000
[    4.430902] NDCB2: 0x00000000
[    4.430902] NDCB3: 0x00000000
[    4.449790] Bad eraseblock 20 at 0x000000280000
[    4.454402] nand: nand_do_read_oob: from = 0x002a0000, len = 64
[    4.460578] marvell-nfc pxa3xx-nand: 
[    4.460578] NDCR:  0x9d079fff
[    4.460578] NDCB0: 0x000d3000
[    4.460578] NDCB1: 0x05400000
[    4.460578] NDCB2: 0x00000000
[    4.460578] NDCB3: 0x00000000
[    4.479469] Bad eraseblock 21 at 0x0000002a0000
[    4.484081] nand: nand_do_read_oob: from = 0x002c0000, len = 64
[    4.490260] marvell-nfc pxa3xx-nand: 
[    4.490260] NDCR:  0x9d079fff
[    4.490260] NDCB0: 0x000d3000
[    4.490260] NDCB1: 0x05800000
[    4.490260] NDCB2: 0x00000000
[    4.490260] NDCB3: 0x00000000
[    4.509171] Bad eraseblock 22 at 0x0000002c0000
[    4.513779] nand: nand_do_read_oob: from = 0x002e0000, len = 64
[    4.519957] marvell-nfc pxa3xx-nand: 
[    4.519957] NDCR:  0x9d079fff
[    4.519957] NDCB0: 0x000d3000
[    4.519957] NDCB1: 0x05c00000
[    4.519957] NDCB2: 0x00000000
[    4.519957] NDCB3: 0x00000000
[    4.538865] Bad eraseblock 23 at 0x0000002e0000
[    4.543479] nand: nand_do_read_oob: from = 0x00300000, len = 64
[    4.549653] marvell-nfc pxa3xx-nand: 
[    4.549653] NDCR:  0x9d079fff
[    4.549653] NDCB0: 0x000d3000
[    4.549653] NDCB1: 0x06000000
[    4.549653] NDCB2: 0x00000000
[    4.549653] NDCB3: 0x00000000
[    4.568531] Bad eraseblock 24 at 0x000000300000
[    4.573297] nand: nand_do_read_oob: from = 0x00320000, len = 64
[    4.579473] marvell-nfc pxa3xx-nand: 
[    4.579473] NDCR:  0x9d079fff
[    4.579473] NDCB0: 0x000d3000
[    4.579473] NDCB1: 0x06400000
[    4.579473] NDCB2: 0x00000000
[    4.579473] NDCB3: 0x00000000
[    4.598354] Bad eraseblock 25 at 0x000000320000
[    4.603123] nand: nand_do_read_oob: from = 0x00340000, len = 64
[    4.609298] marvell-nfc pxa3xx-nand: 
[    4.609298] NDCR:  0x9d079fff
[    4.609298] NDCB0: 0x000d3000
[    4.609298] NDCB1: 0x06800000
[    4.609298] NDCB2: 0x00000000
[    4.609298] NDCB3: 0x00000000
[    4.628177] Bad eraseblock 26 at 0x000000340000
[    4.632941] nand: nand_do_read_oob: from = 0x00360000, len = 64
[    4.639116] marvell-nfc pxa3xx-nand: 
[    4.639116] NDCR:  0x9d079fff
[    4.639116] NDCB0: 0x000d3000
[    4.639116] NDCB1: 0x06c00000
[    4.639116] NDCB2: 0x00000000
[    4.639116] NDCB3: 0x00000000
[    4.657995] Bad eraseblock 27 at 0x000000360000
[    4.662757] nand: nand_do_read_oob: from = 0x00380000, len = 64
[    4.668933] marvell-nfc pxa3xx-nand: 
[    4.668933] NDCR:  0x9d079fff
[    4.668933] NDCB0: 0x000d3000
[    4.668933] NDCB1: 0x07000000
[    4.668933] NDCB2: 0x00000000
[    4.668933] NDCB3: 0x00000000
[    4.687812] Bad eraseblock 28 at 0x000000380000
[    4.692577] nand: nand_do_read_oob: from = 0x003a0000, len = 64
[    4.698602] marvell-nfc pxa3xx-nand: 
[    4.698602] NDCR:  0x9d079fff
[    4.698602] NDCB0: 0x000d3000
[    4.698602] NDCB1: 0x07400000
[    4.698602] NDCB2: 0x00000000
[    4.698602] NDCB3: 0x00000000
[    4.717583] Bad eraseblock 29 at 0x0000003a0000
[    4.722352] nand: nand_do_read_oob: from = 0x003c0000, len = 64
[    4.728375] marvell-nfc pxa3xx-nand: 
[    4.728375] NDCR:  0x9d079fff
[    4.728375] NDCB0: 0x000d3000
[    4.728375] NDCB1: 0x07800000
[    4.728375] NDCB2: 0x00000000
[    4.728375] NDCB3: 0x00000000
[    4.747249] Bad eraseblock 30 at 0x0000003c0000
[    4.752017] nand: nand_do_read_oob: from = 0x003e0000, len = 64
[    4.758038] marvell-nfc pxa3xx-nand: 
[    4.758038] NDCR:  0x9d079fff
[    4.758038] NDCB0: 0x000d3000
[    4.758038] NDCB1: 0x07c00000
[    4.758038] NDCB2: 0x00000000
[    4.758038] NDCB3: 0x00000000
[    4.776911] Bad eraseblock 31 at 0x0000003e0000
[    4.781677] nand: nand_do_read_oob: from = 0x00400000, len = 64
[    4.787702] marvell-nfc pxa3xx-nand: 
[    4.787702] NDCR:  0x9d079fff
[    4.787702] NDCB0: 0x000d3000
[    4.787702] NDCB1: 0x08000000
[    4.787702] NDCB2: 0x00000000
[    4.787702] NDCB3: 0x00000000
[    4.806582] Bad eraseblock 32 at 0x000000400000
[    4.811349] nand: nand_do_read_oob: from = 0x00420000, len = 64
[    4.817375] marvell-nfc pxa3xx-nand: 
[    4.817375] NDCR:  0x9d079fff
[    4.817375] NDCB0: 0x000d3000
[    4.817375] NDCB1: 0x08400000
[    4.817375] NDCB2: 0x00000000
[    4.817375] NDCB3: 0x00000000
[    4.836255] Bad eraseblock 33 at 0x000000420000
[    4.841020] nand: nand_do_read_oob: from = 0x00440000, len = 64
[    4.847043] marvell-nfc pxa3xx-nand: 
[    4.847043] NDCR:  0x9d079fff
[    4.847043] NDCB0: 0x000d3000
[    4.847043] NDCB1: 0x08800000
[    4.847043] NDCB2: 0x00000000
[    4.847043] NDCB3: 0x00000000
[    4.865918] Bad eraseblock 34 at 0x000000440000
[    4.870684] nand: nand_do_read_oob: from = 0x00460000, len = 64
[    4.876706] marvell-nfc pxa3xx-nand: 
[    4.876706] NDCR:  0x9d079fff
[    4.876706] NDCB0: 0x000d3000
[    4.876706] NDCB1: 0x08c00000
[    4.876706] NDCB2: 0x00000000
[    4.876706] NDCB3: 0x00000000
[    4.895580] Bad eraseblock 35 at 0x000000460000
[    4.900347] nand: nand_do_read_oob: from = 0x00480000, len = 64
[    4.906370] marvell-nfc pxa3xx-nand: 
[    4.906370] NDCR:  0x9d079fff
[    4.906370] NDCB0: 0x000d3000
[    4.906370] NDCB1: 0x09000000
[    4.906370] NDCB2: 0x00000000
[    4.906370] NDCB3: 0x00000000
[    4.925252] Bad eraseblock 36 at 0x000000480000
[    4.930018] nand: nand_do_read_oob: from = 0x004a0000, len = 64
[    4.936039] marvell-nfc pxa3xx-nand: 
[    4.936039] NDCR:  0x9d079fff
[    4.936039] NDCB0: 0x000d3000
[    4.936039] NDCB1: 0x09400000
[    4.936039] NDCB2: 0x00000000
[    4.936039] NDCB3: 0x00000000
[    4.954915] Bad eraseblock 37 at 0x0000004a0000
[    4.959680] nand: nand_do_read_oob: from = 0x004c0000, len = 64
[    4.965704] marvell-nfc pxa3xx-nand: 
[    4.965704] NDCR:  0x9d079fff
[    4.965704] NDCB0: 0x000d3000
[    4.965704] NDCB1: 0x09800000
[    4.965704] NDCB2: 0x00000000
[    4.965704] NDCB3: 0x00000000
[    4.984575] Bad eraseblock 38 at 0x0000004c0000
[    4.989344] nand: nand_do_read_oob: from = 0x004e0000, len = 64
[    4.995365] marvell-nfc pxa3xx-nand: 
[    4.995365] NDCR:  0x9d079fff
[    4.995365] NDCB0: 0x000d3000
[    4.995365] NDCB1: 0x09c00000
[    4.995365] NDCB2: 0x00000000
[    4.995365] NDCB3: 0x00000000
[    5.014251] Bad eraseblock 39 at 0x0000004e0000
[    5.019025] nand: nand_do_read_oob: from = 0x00500000, len = 64
[    5.025046] marvell-nfc pxa3xx-nand: 
[    5.025046] NDCR:  0x9d079fff
[    5.025046] NDCB0: 0x000d3000
[    5.025046] NDCB1: 0x0a000000
[    5.025046] NDCB2: 0x00000000
[    5.025046] NDCB3: 0x00000000
[    5.043920] Bad eraseblock 40 at 0x000000500000
[    5.048527] nand: nand_do_read_oob: from = 0x00520000, len = 64
[    5.054704] marvell-nfc pxa3xx-nand: 
[    5.054704] NDCR:  0x9d079fff
[    5.054704] NDCB0: 0x000d3000
[    5.054704] NDCB1: 0x0a400000
[    5.054704] NDCB2: 0x00000000
[    5.054704] NDCB3: 0x00000000
[    5.073594] Bad eraseblock 41 at 0x000000520000
[    5.078207] nand: nand_do_read_oob: from = 0x00540000, len = 64
[    5.084401] marvell-nfc pxa3xx-nand: 
[    5.084401] NDCR:  0x9d079fff
[    5.084401] NDCB0: 0x000d3000
[    5.084401] NDCB1: 0x0a800000
[    5.084401] NDCB2: 0x00000000
[    5.084401] NDCB3: 0x00000000
[    5.103292] Bad eraseblock 42 at 0x000000540000
[    5.107905] nand: nand_do_read_oob: from = 0x00560000, len = 64
[    5.114083] marvell-nfc pxa3xx-nand: 
[    5.114083] NDCR:  0x9d079fff
[    5.114083] NDCB0: 0x000d3000
[    5.114083] NDCB1: 0x0ac00000
[    5.114083] NDCB2: 0x00000000
[    5.114083] NDCB3: 0x00000000
[    5.132972] Bad eraseblock 43 at 0x000000560000
[    5.137584] nand: nand_do_read_oob: from = 0x00580000, len = 64
[    5.143763] marvell-nfc pxa3xx-nand: 
[    5.143763] NDCR:  0x9d079fff
[    5.143763] NDCB0: 0x000d3000
[    5.143763] NDCB1: 0x0b000000
[    5.143763] NDCB2: 0x00000000
[    5.143763] NDCB3: 0x00000000
[    5.162648] Bad eraseblock 44 at 0x000000580000
[    5.167257] nand: nand_do_read_oob: from = 0x005a0000, len = 64
[    5.173434] marvell-nfc pxa3xx-nand: 
[    5.173434] NDCR:  0x9d079fff
[    5.173434] NDCB0: 0x000d3000
[    5.173434] NDCB1: 0x0b400000
[    5.173434] NDCB2: 0x00000000
[    5.173434] NDCB3: 0x00000000
[    5.192323] Bad eraseblock 45 at 0x0000005a0000
[    5.196934] nand: nand_do_read_oob: from = 0x005c0000, len = 64
[    5.203113] marvell-nfc pxa3xx-nand: 
[    5.203113] NDCR:  0x9d079fff
[    5.203113] NDCB0: 0x000d3000
[    5.203113] NDCB1: 0x0b800000
[    5.203113] NDCB2: 0x00000000
[    5.203113] NDCB3: 0x00000000
[    5.222004] Bad eraseblock 46 at 0x0000005c0000
[    5.226617] nand: nand_do_read_oob: from = 0x005e0000, len = 64
[    5.232793] marvell-nfc pxa3xx-nand: 
[    5.232793] NDCR:  0x9d079fff
[    5.232793] NDCB0: 0x000d3000
[    5.232793] NDCB1: 0x0bc00000
[    5.232793] NDCB2: 0x00000000
[    5.232793] NDCB3: 0x00000000
[    5.251684] Bad eraseblock 47 at 0x0000005e0000
[    5.256295] nand: nand_do_read_oob: from = 0x00600000, len = 64
[    5.262474] marvell-nfc pxa3xx-nand: 
[    5.262474] NDCR:  0x9d079fff
[    5.262474] NDCB0: 0x000d3000
[    5.262474] NDCB1: 0x0c000000
[    5.262474] NDCB2: 0x00000000
[    5.262474] NDCB3: 0x00000000
[    5.281361] Bad eraseblock 48 at 0x000000600000
[    5.285975] nand: nand_do_read_oob: from = 0x00620000, len = 64
[    5.292155] marvell-nfc pxa3xx-nand: 
[    5.292155] NDCR:  0x9d079fff
[    5.292155] NDCB0: 0x000d3000
[    5.292155] NDCB1: 0x0c400000
[    5.292155] NDCB2: 0x00000000
[    5.292155] NDCB3: 0x00000000
[    5.311043] Bad eraseblock 49 at 0x000000620000
[    5.315655] nand: nand_do_read_oob: from = 0x00640000, len = 64
[    5.321833] marvell-nfc pxa3xx-nand: 
[    5.321833] NDCR:  0x9d079fff
[    5.321833] NDCB0: 0x000d3000
[    5.321833] NDCB1: 0x0c800000
[    5.321833] NDCB2: 0x00000000
[    5.321833] NDCB3: 0x00000000
[    5.340720] Bad eraseblock 50 at 0x000000640000
[    5.345329] nand: nand_do_read_oob: from = 0x00660000, len = 64
[    5.351504] marvell-nfc pxa3xx-nand: 
[    5.351504] NDCR:  0x9d079fff
[    5.351504] NDCB0: 0x000d3000
[    5.351504] NDCB1: 0x0cc00000
[    5.351504] NDCB2: 0x00000000
[    5.351504] NDCB3: 0x00000000
[    5.370397] Bad eraseblock 51 at 0x000000660000
[    5.375006] nand: nand_do_read_oob: from = 0x00680000, len = 64
[    5.381188] marvell-nfc pxa3xx-nand: 
[    5.381188] NDCR:  0x9d079fff
[    5.381188] NDCB0: 0x000d3000
[    5.381188] NDCB1: 0x0d000000
[    5.381188] NDCB2: 0x00000000
[    5.381188] NDCB3: 0x00000000
[    5.400075] Bad eraseblock 52 at 0x000000680000
[    5.404686] nand: nand_do_read_oob: from = 0x006a0000, len = 64
[    5.410866] marvell-nfc pxa3xx-nand: 
[    5.410866] NDCR:  0x9d079fff
[    5.410866] NDCB0: 0x000d3000
[    5.410866] NDCB1: 0x0d400000
[    5.410866] NDCB2: 0x00000000
[    5.410866] NDCB3: 0x00000000
[    5.429755] Bad eraseblock 53 at 0x0000006a0000
[    5.434365] nand: nand_do_read_oob: from = 0x006c0000, len = 64
[    5.440546] marvell-nfc pxa3xx-nand: 
[    5.440546] NDCR:  0x9d079fff
[    5.440546] NDCB0: 0x000d3000
[    5.440546] NDCB1: 0x0d800000
[    5.440546] NDCB2: 0x00000000
[    5.440546] NDCB3: 0x00000000
[    5.459434] Bad eraseblock 54 at 0x0000006c0000
[    5.464046] nand: nand_do_read_oob: from = 0x006e0000, len = 64
[    5.470225] marvell-nfc pxa3xx-nand: 
[    5.470225] NDCR:  0x9d079fff
[    5.470225] NDCB0: 0x000d3000
[    5.470225] NDCB1: 0x0dc00000
[    5.470225] NDCB2: 0x00000000
[    5.470225] NDCB3: 0x00000000
[    5.489114] Bad eraseblock 55 at 0x0000006e0000
[    5.493729] nand: nand_do_read_oob: from = 0x00700000, len = 64
[    5.499905] marvell-nfc pxa3xx-nand: 
[    5.499905] NDCR:  0x9d079fff
[    5.499905] NDCB0: 0x000d3000
[    5.499905] NDCB1: 0x0e000000
[    5.499905] NDCB2: 0x00000000
[    5.499905] NDCB3: 0x00000000
[    5.518853] Bad eraseblock 56 at 0x000000700000
[    5.523471] nand: nand_do_read_oob: from = 0x00720000, len = 64
[    5.529652] marvell-nfc pxa3xx-nand: 
[    5.529652] NDCR:  0x9d079fff
[    5.529652] NDCB0: 0x000d3000
[    5.529652] NDCB1: 0x0e400000
[    5.529652] NDCB2: 0x00000000
[    5.529652] NDCB3: 0x00000000
[    5.548558] nand: nand_do_read_oob: from = 0x00740000, len = 64
[    5.554762] marvell-nfc pxa3xx-nand: 
[    5.554762] NDCR:  0x9d079fff
[    5.554762] NDCB0: 0x000d3000
[    5.554762] NDCB1: 0x0e800000
[    5.554762] NDCB2: 0x00000000
[    5.554762] NDCB3: 0x00000000
[    5.573683] nand: nand_do_read_oob: from = 0x00760000, len = 64
[    5.579883] marvell-nfc pxa3xx-nand: 
[    5.579883] NDCR:  0x9d079fff
[    5.579883] NDCB0: 0x000d3000
[    5.579883] NDCB1: 0x0ec00000
[    5.579883] NDCB2: 0x00000000
[    5.579883] NDCB3: 0x00000000
[    5.598875] nand: nand_do_read_oob: from = 0x00780000, len = 64
[    5.604907] marvell-nfc pxa3xx-nand: 
[    5.604907] NDCR:  0x9d079fff
[    5.604907] NDCB0: 0x000d3000
[    5.604907] NDCB1: 0x0f000000
[    5.604907] NDCB2: 0x00000000
[    5.604907] NDCB3: 0x00000000
[    5.623835] nand: nand_do_read_oob: from = 0x007a0000, len = 64
[    5.630035] marvell-nfc pxa3xx-nand: 
[    5.630035] NDCR:  0x9d079fff
[    5.630035] NDCB0: 0x000d3000
[    5.630035] NDCB1: 0x0f400000
[    5.630035] NDCB2: 0x00000000
[    5.630035] NDCB3: 0x00000000
[    5.648994] nand: nand_do_read_oob: from = 0x007c0000, len = 64
[    5.655020] marvell-nfc pxa3xx-nand: 
[    5.655020] NDCR:  0x9d079fff
[    5.655020] NDCB0: 0x000d3000
[    5.655020] NDCB1: 0x0f800000
[    5.655020] NDCB2: 0x00000000
[    5.655020] NDCB3: 0x00000000
[    5.673942] nand: nand_do_read_oob: from = 0x007e0000, len = 64
[    5.680140] marvell-nfc pxa3xx-nand: 
[    5.680140] NDCR:  0x9d079fff
[    5.680140] NDCB0: 0x000d3000
[    5.680140] NDCB1: 0x0fc00000
[    5.680140] NDCB2: 0x00000000
[    5.680140] NDCB3: 0x00000000
[    5.699079] nand: nand_do_read_oob: from = 0x00800000, len = 64
[    5.705111] marvell-nfc pxa3xx-nand: 
[    5.705111] NDCR:  0x9d079fff
[    5.705111] NDCB0: 0x000d3000
[    5.705111] NDCB1: 0x10000000
[    5.705111] NDCB2: 0x00000000
[    5.705111] NDCB3: 0x00000000
[    5.724036] nand: nand_do_read_oob: from = 0x00820000, len = 64
[    5.730239] marvell-nfc pxa3xx-nand: 
[    5.730239] NDCR:  0x9d079fff
[    5.730239] NDCB0: 0x000d3000
[    5.730239] NDCB1: 0x10400000
[    5.730239] NDCB2: 0x00000000
[    5.730239] NDCB3: 0x00000000
[    5.749158] nand: nand_do_read_oob: from = 0x00840000, len = 64
[    5.755191] marvell-nfc pxa3xx-nand: 
[    5.755191] NDCR:  0x9d079fff
[    5.755191] NDCB0: 0x000d3000
[    5.755191] NDCB1: 0x10800000
[    5.755191] NDCB2: 0x00000000
[    5.755191] NDCB3: 0x00000000
[    5.774114] nand: nand_do_read_oob: from = 0x00860000, len = 64
[    5.780313] marvell-nfc pxa3xx-nand: 
[    5.780313] NDCR:  0x9d079fff
[    5.780313] NDCB0: 0x000d3000
[    5.780313] NDCB1: 0x10c00000
[    5.780313] NDCB2: 0x00000000
[    5.780313] NDCB3: 0x00000000
[    5.799234] nand: nand_do_read_oob: from = 0x00880000, len = 64
[    5.805263] marvell-nfc pxa3xx-nand: 
[    5.805263] NDCR:  0x9d079fff
[    5.805263] NDCB0: 0x000d3000
[    5.805263] NDCB1: 0x11000000
[    5.805263] NDCB2: 0x00000000
[    5.805263] NDCB3: 0x00000000
[    5.824187] nand: nand_do_read_oob: from = 0x008a0000, len = 64
[    5.830385] marvell-nfc pxa3xx-nand: 
[    5.830385] NDCR:  0x9d079fff
[    5.830385] NDCB0: 0x000d3000
[    5.830385] NDCB1: 0x11400000
[    5.830385] NDCB2: 0x00000000
[    5.830385] NDCB3: 0x00000000
[    5.849304] nand: nand_do_read_oob: from = 0x008c0000, len = 64
[    5.855338] marvell-nfc pxa3xx-nand: 
[    5.855338] NDCR:  0x9d079fff
[    5.855338] NDCB0: 0x000d3000
[    5.855338] NDCB1: 0x11800000
[    5.855338] NDCB2: 0x00000000
[    5.855338] NDCB3: 0x00000000
[    5.874259] nand: nand_do_read_oob: from = 0x008e0000, len = 64
[    5.880457] marvell-nfc pxa3xx-nand: 
[    5.880457] NDCR:  0x9d079fff
[    5.880457] NDCB0: 0x000d3000
[    5.880457] NDCB1: 0x11c00000
[    5.880457] NDCB2: 0x00000000
[    5.880457] NDCB3: 0x00000000
[    5.899376] nand: nand_do_read_oob: from = 0x00900000, len = 64
[    5.905410] marvell-nfc pxa3xx-nand: 
[    5.905410] NDCR:  0x9d079fff
[    5.905410] NDCB0: 0x000d3000
[    5.905410] NDCB1: 0x12000000
[    5.905410] NDCB2: 0x00000000
[    5.905410] NDCB3: 0x00000000
[    5.924331] nand: nand_do_read_oob: from = 0x00920000, len = 64
[    5.930531] marvell-nfc pxa3xx-nand: 
[    5.930531] NDCR:  0x9d079fff
[    5.930531] NDCB0: 0x000d3000
[    5.930531] NDCB1: 0x12400000
[    5.930531] NDCB2: 0x00000000
[    5.930531] NDCB3: 0x00000000
[    5.949454] nand: nand_do_read_oob: from = 0x00940000, len = 64
[    5.955481] marvell-nfc pxa3xx-nand: 
[    5.955481] NDCR:  0x9d079fff
[    5.955481] NDCB0: 0x000d3000
[    5.955481] NDCB1: 0x12800000
[    5.955481] NDCB2: 0x00000000
[    5.955481] NDCB3: 0x00000000
[    5.974403] nand: nand_do_read_oob: from = 0x00960000, len = 64
[    5.980602] marvell-nfc pxa3xx-nand: 
[    5.980602] NDCR:  0x9d079fff
[    5.980602] NDCB0: 0x000d3000
[    5.980602] NDCB1: 0x12c00000
[    5.980602] NDCB2: 0x00000000
[    5.980602] NDCB3: 0x00000000
[    5.999523] nand: nand_do_read_oob: from = 0x00980000, len = 64
[    6.005555] marvell-nfc pxa3xx-nand: 
[    6.005555] NDCR:  0x9d079fff
[    6.005555] NDCB0: 0x000d3000
[    6.005555] NDCB1: 0x13000000
[    6.005555] NDCB2: 0x00000000
[    6.005555] NDCB3: 0x00000000
[    6.024485] nand: nand_do_read_oob: from = 0x009a0000, len = 64
[    6.030687] marvell-nfc pxa3xx-nand: 
[    6.030687] NDCR:  0x9d079fff
[    6.030687] NDCB0: 0x000d3000
[    6.030687] NDCB1: 0x13400000
[    6.030687] NDCB2: 0x00000000
[    6.030687] NDCB3: 0x00000000
[    6.049604] nand: nand_do_read_oob: from = 0x009c0000, len = 64
[    6.055636] marvell-nfc pxa3xx-nand: 
[    6.055636] NDCR:  0x9d079fff
[    6.055636] NDCB0: 0x000d3000
[    6.055636] NDCB1: 0x13800000
[    6.055636] NDCB2: 0x00000000
[    6.055636] NDCB3: 0x00000000
[    6.074560] nand: nand_do_read_oob: from = 0x009e0000, len = 64
[    6.080757] marvell-nfc pxa3xx-nand: 
[    6.080757] NDCR:  0x9d079fff
[    6.080757] NDCB0: 0x000d3000
[    6.080757] NDCB1: 0x13c00000
[    6.080757] NDCB2: 0x00000000
[    6.080757] NDCB3: 0x00000000
[    6.100387] nand: nand_do_read_oob: from = 0x00a00000, len = 64
[    6.106431] marvell-nfc pxa3xx-nand: 
[    6.106431] NDCR:  0x9d079fff
[    6.106431] NDCB0: 0x000d3000
[    6.106431] NDCB1: 0x14000000
[    6.106431] NDCB2: 0x00000000
[    6.106431] NDCB3: 0x00000000
[    6.125594] nand: nand_do_read_oob: from = 0x00a20000, len = 64
[    6.131995] marvell-nfc pxa3xx-nand: 
[    6.131995] NDCR:  0x9d079fff
[    6.131995] NDCB0: 0x000d3000
[    6.131995] NDCB1: 0x14400000
[    6.131995] NDCB2: 0x00000000
[    6.131995] NDCB3: 0x00000000
[    6.151138] nand: nand_do_read_oob: from = 0x00a40000, len = 64
[    6.157180] marvell-nfc pxa3xx-nand: 
[    6.157180] NDCR:  0x9d079fff
[    6.157180] NDCB0: 0x000d3000
[    6.157180] NDCB1: 0x14800000
[    6.157180] NDCB2: 0x00000000
[    6.157180] NDCB3: 0x00000000
[    6.176135] nand: nand_do_read_oob: from = 0x00a60000, len = 64
[    6.182335] marvell-nfc pxa3xx-nand: 
[    6.182335] NDCR:  0x9d079fff
[    6.182335] NDCB0: 0x000d3000
[    6.182335] NDCB1: 0x14c00000
[    6.182335] NDCB2: 0x00000000
[    6.182335] NDCB3: 0x00000000
[    6.201252] nand: nand_do_read_oob: from = 0x00a80000, len = 64
[    6.207284] marvell-nfc pxa3xx-nand: 
[    6.207284] NDCR:  0x9d079fff
[    6.207284] NDCB0: 0x000d3000
[    6.207284] NDCB1: 0x15000000
[    6.207284] NDCB2: 0x00000000
[    6.207284] NDCB3: 0x00000000
[    6.226208] nand: nand_do_read_oob: from = 0x00aa0000, len = 64
[    6.232417] marvell-nfc pxa3xx-nand: 
[    6.232417] NDCR:  0x9d079fff
[    6.232417] NDCB0: 0x000d3000
[    6.232417] NDCB1: 0x15400000
[    6.232417] NDCB2: 0x00000000
[    6.232417] NDCB3: 0x00000000
[    6.251343] nand: nand_do_read_oob: from = 0x00ac0000, len = 64
[    6.257374] marvell-nfc pxa3xx-nand: 
[    6.257374] NDCR:  0x9d079fff
[    6.257374] NDCB0: 0x000d3000
[    6.257374] NDCB1: 0x15800000
[    6.257374] NDCB2: 0x00000000
[    6.257374] NDCB3: 0x00000000
[    6.276297] nand: nand_do_read_oob: from = 0x00ae0000, len = 64
[    6.282505] marvell-nfc pxa3xx-nand: 
[    6.282505] NDCR:  0x9d079fff
[    6.282505] NDCB0: 0x000d3000
[    6.282505] NDCB1: 0x15c00000
[    6.282505] NDCB2: 0x00000000
[    6.282505] NDCB3: 0x00000000
[    6.301425] nand: nand_do_read_oob: from = 0x00b00000, len = 64
[    6.307456] marvell-nfc pxa3xx-nand: 
[    6.307456] NDCR:  0x9d079fff
[    6.307456] NDCB0: 0x000d3000
[    6.307456] NDCB1: 0x16000000
[    6.307456] NDCB2: 0x00000000
[    6.307456] NDCB3: 0x00000000
[    6.326378] nand: nand_do_read_oob: from = 0x00b20000, len = 64
[    6.332603] marvell-nfc pxa3xx-nand: 
[    6.332603] NDCR:  0x9d079fff
[    6.332603] NDCB0: 0x000d3000
[    6.332603] NDCB1: 0x16400000
[    6.332603] NDCB2: 0x00000000
[    6.332603] NDCB3: 0x00000000
[    6.351525] nand: nand_do_read_oob: from = 0x00b40000, len = 64
[    6.357553] marvell-nfc pxa3xx-nand: 
[    6.357553] NDCR:  0x9d079fff
[    6.357553] NDCB0: 0x000d3000
[    6.357553] NDCB1: 0x16800000
[    6.357553] NDCB2: 0x00000000
[    6.357553] NDCB3: 0x00000000
[    6.376477] nand: nand_do_read_oob: from = 0x00b60000, len = 64
[    6.382676] marvell-nfc pxa3xx-nand: 
[    6.382676] NDCR:  0x9d079fff
[    6.382676] NDCB0: 0x000d3000
[    6.382676] NDCB1: 0x16c00000
[    6.382676] NDCB2: 0x00000000
[    6.382676] NDCB3: 0x00000000
[    6.401595] nand: nand_do_read_oob: from = 0x00b80000, len = 64
[    6.407627] marvell-nfc pxa3xx-nand: 
[    6.407627] NDCR:  0x9d079fff
[    6.407627] NDCB0: 0x000d3000
[    6.407627] NDCB1: 0x17000000
[    6.407627] NDCB2: 0x00000000
[    6.407627] NDCB3: 0x00000000
[    6.426558] nand: nand_do_read_oob: from = 0x00ba0000, len = 64
[    6.432755] marvell-nfc pxa3xx-nand: 
[    6.432755] NDCR:  0x9d079fff
[    6.432755] NDCB0: 0x000d3000
[    6.432755] NDCB1: 0x17400000
[    6.432755] NDCB2: 0x00000000
[    6.432755] NDCB3: 0x00000000
[    6.451675] nand: nand_do_read_oob: from = 0x00bc0000, len = 64
[    6.457708] marvell-nfc pxa3xx-nand: 
[    6.457708] NDCR:  0x9d079fff
[    6.457708] NDCB0: 0x000d3000
[    6.457708] NDCB1: 0x17800000
[    6.457708] NDCB2: 0x00000000
[    6.457708] NDCB3: 0x00000000
[    6.476632] nand: nand_do_read_oob: from = 0x00be0000, len = 64
[    6.482837] marvell-nfc pxa3xx-nand: 
[    6.482837] NDCR:  0x9d079fff
[    6.482837] NDCB0: 0x000d3000
[    6.482837] NDCB1: 0x17c00000
[    6.482837] NDCB2: 0x00000000
[    6.482837] NDCB3: 0x00000000
[    6.501760] nand: nand_do_read_oob: from = 0x00c00000, len = 64
[    6.507789] marvell-nfc pxa3xx-nand: 
[    6.507789] NDCR:  0x9d079fff
[    6.507789] NDCB0: 0x000d3000
[    6.507789] NDCB1: 0x18000000
[    6.507789] NDCB2: 0x00000000
[    6.507789] NDCB3: 0x00000000
[    6.526712] nand: nand_do_read_oob: from = 0x00c20000, len = 64
[    6.532916] marvell-nfc pxa3xx-nand: 
[    6.532916] NDCR:  0x9d079fff
[    6.532916] NDCB0: 0x000d3000
[    6.532916] NDCB1: 0x18400000
[    6.532916] NDCB2: 0x00000000
[    6.532916] NDCB3: 0x00000000
[    6.551839] nand: nand_do_read_oob: from = 0x00c40000, len = 64
[    6.557871] marvell-nfc pxa3xx-nand: 
[    6.557871] NDCR:  0x9d079fff
[    6.557871] NDCB0: 0x000d3000
[    6.557871] NDCB1: 0x18800000
[    6.557871] NDCB2: 0x00000000
[    6.557871] NDCB3: 0x00000000
[    6.576801] nand: nand_do_read_oob: from = 0x00c60000, len = 64
[    6.583001] marvell-nfc pxa3xx-nand: 
[    6.583001] NDCR:  0x9d079fff
[    6.583001] NDCB0: 0x000d3000
[    6.583001] NDCB1: 0x18c00000
[    6.583001] NDCB2: 0x00000000
[    6.583001] NDCB3: 0x00000000
[    6.601918] nand: nand_do_read_oob: from = 0x00c80000, len = 64
[    6.607951] marvell-nfc pxa3xx-nand: 
[    6.607951] NDCR:  0x9d079fff
[    6.607951] NDCB0: 0x000d3000
[    6.607951] NDCB1: 0x19000000
[    6.607951] NDCB2: 0x00000000
[    6.607951] NDCB3: 0x00000000
[    6.626875] nand: nand_do_read_oob: from = 0x00ca0000, len = 64
[    6.633083] marvell-nfc pxa3xx-nand: 
[    6.633083] NDCR:  0x9d079fff
[    6.633083] NDCB0: 0x000d3000
[    6.633083] NDCB1: 0x19400000
[    6.633083] NDCB2: 0x00000000
[    6.633083] NDCB3: 0x00000000
[    6.652000] nand: nand_do_read_oob: from = 0x00cc0000, len = 64
[    6.658032] marvell-nfc pxa3xx-nand: 
[    6.658032] NDCR:  0x9d079fff
[    6.658032] NDCB0: 0x000d3000
[    6.658032] NDCB1: 0x19800000
[    6.658032] NDCB2: 0x00000000
[    6.658032] NDCB3: 0x00000000
[    6.676957] nand: nand_do_read_oob: from = 0x00ce0000, len = 64
[    6.683154] marvell-nfc pxa3xx-nand: 
[    6.683154] NDCR:  0x9d079fff
[    6.683154] NDCB0: 0x000d3000
[    6.683154] NDCB1: 0x19c00000
[    6.683154] NDCB2: 0x00000000
[    6.683154] NDCB3: 0x00000000
[    6.702072] nand: nand_do_read_oob: from = 0x00d00000, len = 64
[    6.708106] marvell-nfc pxa3xx-nand: 
[    6.708106] NDCR:  0x9d079fff
[    6.708106] NDCB0: 0x000d3000
[    6.708106] NDCB1: 0x1a000000
[    6.708106] NDCB2: 0x00000000
[    6.708106] NDCB3: 0x00000000
[    6.727028] nand: nand_do_read_oob: from = 0x00d20000, len = 64
[    6.733227] marvell-nfc pxa3xx-nand: 
[    6.733227] NDCR:  0x9d079fff
[    6.733227] NDCB0: 0x000d3000
[    6.733227] NDCB1: 0x1a400000
[    6.733227] NDCB2: 0x00000000
[    6.733227] NDCB3: 0x00000000
[    6.752146] nand: nand_do_read_oob: from = 0x00d40000, len = 64
[    6.758177] marvell-nfc pxa3xx-nand: 
[    6.758177] NDCR:  0x9d079fff
[    6.758177] NDCB0: 0x000d3000
[    6.758177] NDCB1: 0x1a800000
[    6.758177] NDCB2: 0x00000000
[    6.758177] NDCB3: 0x00000000
[    6.777073] Bad eraseblock 106 at 0x000000d40000
[    6.781928] nand: nand_do_read_oob: from = 0x00d60000, len = 64
[    6.787951] marvell-nfc pxa3xx-nand: 
[    6.787951] NDCR:  0x9d079fff
[    6.787951] NDCB0: 0x000d3000
[    6.787951] NDCB1: 0x1ac00000
[    6.787951] NDCB2: 0x00000000
[    6.787951] NDCB3: 0x00000000
[    6.806828] Bad eraseblock 107 at 0x000000d60000
[    6.811686] nand: nand_do_read_oob: from = 0x00d80000, len = 64
[    6.817711] marvell-nfc pxa3xx-nand: 
[    6.817711] NDCR:  0x9d079fff
[    6.817711] NDCB0: 0x000d3000
[    6.817711] NDCB1: 0x1b000000
[    6.817711] NDCB2: 0x00000000
[    6.817711] NDCB3: 0x00000000
[    6.836594] Bad eraseblock 108 at 0x000000d80000
[    6.841444] nand: nand_do_read_oob: from = 0x00da0000, len = 64
[    6.847469] marvell-nfc pxa3xx-nand: 
[    6.847469] NDCR:  0x9d079fff
[    6.847469] NDCB0: 0x000d3000
[    6.847469] NDCB1: 0x1b400000
[    6.847469] NDCB2: 0x00000000
[    6.847469] NDCB3: 0x00000000
[    6.866351] Bad eraseblock 109 at 0x000000da0000
[    6.871211] nand: nand_do_read_oob: from = 0x00dc0000, len = 64
[    6.877233] marvell-nfc pxa3xx-nand: 
[    6.877233] NDCR:  0x9d079fff
[    6.877233] NDCB0: 0x000d3000
[    6.877233] NDCB1: 0x1b800000
[    6.877233] NDCB2: 0x00000000
[    6.877233] NDCB3: 0x00000000
[    6.896109] Bad eraseblock 110 at 0x000000dc0000
[    6.900958] nand: nand_do_read_oob: from = 0x00de0000, len = 64
[    6.906983] marvell-nfc pxa3xx-nand: 
[    6.906983] NDCR:  0x9d079fff
[    6.906983] NDCB0: 0x000d3000
[    6.906983] NDCB1: 0x1bc00000
[    6.906983] NDCB2: 0x00000000
[    6.906983] NDCB3: 0x00000000
[    6.925856] Bad eraseblock 111 at 0x000000de0000
[    6.930708] nand: nand_do_read_oob: from = 0x00e00000, len = 64
[    6.936732] marvell-nfc pxa3xx-nand: 
[    6.936732] NDCR:  0x9d079fff
[    6.936732] NDCB0: 0x000d3000
[    6.936732] NDCB1: 0x1c000000
[    6.936732] NDCB2: 0x00000000
[    6.936732] NDCB3: 0x00000000
[    6.955620] Bad eraseblock 112 at 0x000000e00000
[    6.960474] nand: nand_do_read_oob: from = 0x00e20000, len = 64
[    6.966498] marvell-nfc pxa3xx-nand: 
[    6.966498] NDCR:  0x9d079fff
[    6.966498] NDCB0: 0x000d3000
[    6.966498] NDCB1: 0x1c400000
[    6.966498] NDCB2: 0x00000000
[    6.966498] NDCB3: 0x00000000
[    6.985403] Bad eraseblock 113 at 0x000000e20000
[    6.990259] nand: nand_do_read_oob: from = 0x00e40000, len = 64
[    6.996282] marvell-nfc pxa3xx-nand: 
[    6.996282] NDCR:  0x9d079fff
[    6.996282] NDCB0: 0x000d3000
[    6.996282] NDCB1: 0x1c800000
[    6.996282] NDCB2: 0x00000000
[    6.996282] NDCB3: 0x00000000
[    7.015181] Bad eraseblock 114 at 0x000000e40000
[    7.020031] nand: nand_do_read_oob: from = 0x00e60000, len = 64
[    7.026057] marvell-nfc pxa3xx-nand: 
[    7.026057] NDCR:  0x9d079fff
[    7.026057] NDCB0: 0x000d3000
[    7.026057] NDCB1: 0x1cc00000
[    7.026057] NDCB2: 0x00000000
[    7.026057] NDCB3: 0x00000000
[    7.044942] Bad eraseblock 115 at 0x000000e60000
[    7.049799] nand: nand_do_read_oob: from = 0x00e80000, len = 64
[    7.055822] marvell-nfc pxa3xx-nand: 
[    7.055822] NDCR:  0x9d079fff
[    7.055822] NDCB0: 0x000d3000
[    7.055822] NDCB1: 0x1d000000
[    7.055822] NDCB2: 0x00000000
[    7.055822] NDCB3: 0x00000000
[    7.074706] Bad eraseblock 116 at 0x000000e80000
[    7.079564] nand: nand_do_read_oob: from = 0x00ea0000, len = 64
[    7.085588] marvell-nfc pxa3xx-nand: 
[    7.085588] NDCR:  0x9d079fff
[    7.085588] NDCB0: 0x000d3000
[    7.085588] NDCB1: 0x1d400000
[    7.085588] NDCB2: 0x00000000
[    7.085588] NDCB3: 0x00000000
[    7.104464] Bad eraseblock 117 at 0x000000ea0000
[    7.109323] nand: nand_do_read_oob: from = 0x00ec0000, len = 64
[    7.115347] marvell-nfc pxa3xx-nand: 
[    7.115347] NDCR:  0x9d079fff
[    7.115347] NDCB0: 0x000d3000
[    7.115347] NDCB1: 0x1d800000
[    7.115347] NDCB2: 0x00000000
[    7.115347] NDCB3: 0x00000000
[    7.134230] Bad eraseblock 118 at 0x000000ec0000
[    7.139089] nand: nand_do_read_oob: from = 0x00ee0000, len = 64
[    7.145111] marvell-nfc pxa3xx-nand: 
[    7.145111] NDCR:  0x9d079fff
[    7.145111] NDCB0: 0x000d3000
[    7.145111] NDCB1: 0x1dc00000
[    7.145111] NDCB2: 0x00000000
[    7.145111] NDCB3: 0x00000000
[    7.163986] Bad eraseblock 119 at 0x000000ee0000
[    7.168847] nand: nand_do_read_oob: from = 0x00f00000, len = 64
[    7.174868] marvell-nfc pxa3xx-nand: 
[    7.174868] NDCR:  0x9d079fff
[    7.174868] NDCB0: 0x000d3000
[    7.174868] NDCB1: 0x1e000000
[    7.174868] NDCB2: 0x00000000
[    7.174868] NDCB3: 0x00000000
[    7.193745] Bad eraseblock 120 at 0x000000f00000
[    7.198446] nand: nand_do_read_oob: from = 0x00f20000, len = 64
[    7.204625] marvell-nfc pxa3xx-nand: 
[    7.204625] NDCR:  0x9d079fff
[    7.204625] NDCB0: 0x000d3000
[    7.204625] NDCB1: 0x1e400000
[    7.204625] NDCB2: 0x00000000
[    7.204625] NDCB3: 0x00000000
[    7.223514] Bad eraseblock 121 at 0x000000f20000
[    7.228211] nand: nand_do_read_oob: from = 0x00f40000, len = 64
[    7.234388] marvell-nfc pxa3xx-nand: 
[    7.234388] NDCR:  0x9d079fff
[    7.234388] NDCB0: 0x000d3000
[    7.234388] NDCB1: 0x1e800000
[    7.234388] NDCB2: 0x00000000
[    7.234388] NDCB3: 0x00000000
[    7.253281] Bad eraseblock 122 at 0x000000f40000
[    7.257975] nand: nand_do_read_oob: from = 0x00f60000, len = 64
[    7.264156] marvell-nfc pxa3xx-nand: 
[    7.264156] NDCR:  0x9d079fff
[    7.264156] NDCB0: 0x000d3000
[    7.264156] NDCB1: 0x1ec00000
[    7.264156] NDCB2: 0x00000000
[    7.264156] NDCB3: 0x00000000
[    7.283045] Bad eraseblock 123 at 0x000000f60000
[    7.287743] nand: nand_do_read_oob: from = 0x00f80000, len = 64
[    7.293923] marvell-nfc pxa3xx-nand: 
[    7.293923] NDCR:  0x9d079fff
[    7.293923] NDCB0: 0x000d3000
[    7.293923] NDCB1: 0x1f000000
[    7.293923] NDCB2: 0x00000000
[    7.293923] NDCB3: 0x00000000
[    7.312812] Bad eraseblock 124 at 0x000000f80000
[    7.317510] nand: nand_do_read_oob: from = 0x00fa0000, len = 64
[    7.323688] marvell-nfc pxa3xx-nand: 
[    7.323688] NDCR:  0x9d079fff
[    7.323688] NDCB0: 0x000d3000
[    7.323688] NDCB1: 0x1f400000
[    7.323688] NDCB2: 0x00000000
[    7.323688] NDCB3: 0x00000000
[    7.342578] Bad eraseblock 125 at 0x000000fa0000
[    7.347274] nand: nand_do_read_oob: from = 0x00fc0000, len = 64
[    7.353455] marvell-nfc pxa3xx-nand: 
[    7.353455] NDCR:  0x9d079fff
[    7.353455] NDCB0: 0x000d3000
[    7.353455] NDCB1: 0x1f800000
[    7.353455] NDCB2: 0x00000000
[    7.353455] NDCB3: 0x00000000
[    7.372344] Bad eraseblock 126 at 0x000000fc0000
[    7.377042] nand: nand_do_read_oob: from = 0x00fe0000, len = 64
[    7.383218] marvell-nfc pxa3xx-nand: 
[    7.383218] NDCR:  0x9d079fff
[    7.383218] NDCB0: 0x000d3000
[    7.383218] NDCB1: 0x1fc00000
[    7.383218] NDCB2: 0x00000000
[    7.383218] NDCB3: 0x00000000
[    7.402110] Bad eraseblock 127 at 0x000000fe0000
[    7.406807] nand: nand_do_read_oob: from = 0x01000000, len = 64
[    7.412988] marvell-nfc pxa3xx-nand: 
[    7.412988] NDCR:  0x9d079fff
[    7.412988] NDCB0: 0x000d3000
[    7.412988] NDCB1: 0x20000000
[    7.412988] NDCB2: 0x00000000
[    7.412988] NDCB3: 0x00000000
[    7.431878] Bad eraseblock 128 at 0x000001000000
[    7.436572] nand: nand_do_read_oob: from = 0x01020000, len = 64
[    7.442752] marvell-nfc pxa3xx-nand: 
[    7.442752] NDCR:  0x9d079fff
[    7.442752] NDCB0: 0x000d3000
[    7.442752] NDCB1: 0x20400000
[    7.442752] NDCB2: 0x00000000
[    7.442752] NDCB3: 0x00000000
[    7.461643] Bad eraseblock 129 at 0x000001020000
[    7.466341] nand: nand_do_read_oob: from = 0x01040000, len = 64
[    7.472520] marvell-nfc pxa3xx-nand: 
[    7.472520] NDCR:  0x9d079fff
[    7.472520] NDCB0: 0x000d3000
[    7.472520] NDCB1: 0x20800000
[    7.472520] NDCB2: 0x00000000
[    7.472520] NDCB3: 0x00000000
[    7.491406] Bad eraseblock 130 at 0x000001040000
[    7.496107] nand: nand_do_read_oob: from = 0x01060000, len = 64
[    7.502284] marvell-nfc pxa3xx-nand: 
[    7.502284] NDCR:  0x9d079fff
[    7.502284] NDCB0: 0x000d3000
[    7.502284] NDCB1: 0x20c00000
[    7.502284] NDCB2: 0x00000000
[    7.502284] NDCB3: 0x00000000
[    7.521175] Bad eraseblock 131 at 0x000001060000
[    7.525873] nand: nand_do_read_oob: from = 0x01080000, len = 64
[    7.532049] marvell-nfc pxa3xx-nand: 
[    7.532049] NDCR:  0x9d079fff
[    7.532049] NDCB0: 0x000d3000
[    7.532049] NDCB1: 0x21000000
[    7.532049] NDCB2: 0x00000000
[    7.532049] NDCB3: 0x00000000
[    7.550940] Bad eraseblock 132 at 0x000001080000
[    7.555640] nand: nand_do_read_oob: from = 0x010a0000, len = 64
[    7.561815] marvell-nfc pxa3xx-nand: 
[    7.561815] NDCR:  0x9d079fff
[    7.561815] NDCB0: 0x000d3000
[    7.561815] NDCB1: 0x21400000
[    7.561815] NDCB2: 0x00000000
[    7.561815] NDCB3: 0x00000000
[    7.580710] Bad eraseblock 133 at 0x0000010a0000
[    7.585404] nand: nand_do_read_oob: from = 0x010c0000, len = 64
[    7.591583] marvell-nfc pxa3xx-nand: 
[    7.591583] NDCR:  0x9d079fff
[    7.591583] NDCB0: 0x000d3000
[    7.591583] NDCB1: 0x21800000
[    7.591583] NDCB2: 0x00000000
[    7.591583] NDCB3: 0x00000000
[    7.610492] Bad eraseblock 134 at 0x0000010c0000
[    7.615187] nand: nand_do_read_oob: from = 0x010e0000, len = 64
[    7.621369] marvell-nfc pxa3xx-nand: 
[    7.621369] NDCR:  0x9d079fff
[    7.621369] NDCB0: 0x000d3000
[    7.621369] NDCB1: 0x21c00000
[    7.621369] NDCB2: 0x00000000
[    7.621369] NDCB3: 0x00000000
[    7.640258] Bad eraseblock 135 at 0x0000010e0000
[    7.644954] nand: nand_do_read_oob: from = 0x01100000, len = 64
[    7.651134] marvell-nfc pxa3xx-nand: 
[    7.651134] NDCR:  0x9d079fff
[    7.651134] NDCB0: 0x000d3000
[    7.651134] NDCB1: 0x22000000
[    7.651134] NDCB2: 0x00000000
[    7.651134] NDCB3: 0x00000000
[    7.670024] Bad eraseblock 136 at 0x000001100000
[    7.674721] nand: nand_do_read_oob: from = 0x01120000, len = 64
[    7.680897] marvell-nfc pxa3xx-nand: 
[    7.680897] NDCR:  0x9d079fff
[    7.680897] NDCB0: 0x000d3000
[    7.680897] NDCB1: 0x22400000
[    7.680897] NDCB2: 0x00000000
[    7.680897] NDCB3: 0x00000000
[    7.699789] Bad eraseblock 137 at 0x000001120000
[    7.704485] nand: nand_do_read_oob: from = 0x01140000, len = 64
[    7.710665] marvell-nfc pxa3xx-nand: 
[    7.710665] NDCR:  0x9d079fff
[    7.710665] NDCB0: 0x000d3000
[    7.710665] NDCB1: 0x22800000
[    7.710665] NDCB2: 0x00000000
[    7.710665] NDCB3: 0x00000000
[    7.729559] Bad eraseblock 138 at 0x000001140000
[    7.734253] nand: nand_do_read_oob: from = 0x01160000, len = 64
[    7.740432] marvell-nfc pxa3xx-nand: 
[    7.740432] NDCR:  0x9d079fff
[    7.740432] NDCB0: 0x000d3000
[    7.740432] NDCB1: 0x22c00000
[    7.740432] NDCB2: 0x00000000
[    7.740432] NDCB3: 0x00000000
[    7.759321] Bad eraseblock 139 at 0x000001160000
[    7.764019] nand: nand_do_read_oob: from = 0x01180000, len = 64
[    7.770198] marvell-nfc pxa3xx-nand: 
[    7.770198] NDCR:  0x9d079fff
[    7.770198] NDCB0: 0x000d3000
[    7.770198] NDCB1: 0x23000000
[    7.770198] NDCB2: 0x00000000
[    7.770198] NDCB3: 0x00000000
[    7.789086] Bad eraseblock 140 at 0x000001180000
[    7.793786] nand: nand_do_read_oob: from = 0x011a0000, len = 64
[    7.799963] marvell-nfc pxa3xx-nand: 
[    7.799963] NDCR:  0x9d079fff
[    7.799963] NDCB0: 0x000d3000
[    7.799963] NDCB1: 0x23400000
[    7.799963] NDCB2: 0x00000000
[    7.799963] NDCB3: 0x00000000
[    7.818901] nand: nand_do_read_oob: from = 0x011c0000, len = 64
[    7.824937] marvell-nfc pxa3xx-nand: 
[    7.824937] NDCR:  0x9d079fff
[    7.824937] NDCB0: 0x000d3000
[    7.824937] NDCB1: 0x23800000
[    7.824937] NDCB2: 0x00000000
[    7.824937] NDCB3: 0x00000000
[    7.843870] nand: nand_do_read_oob: from = 0x011e0000, len = 64
[    7.850073] marvell-nfc pxa3xx-nand: 
[    7.850073] NDCR:  0x9d079fff
[    7.850073] NDCB0: 0x000d3000
[    7.850073] NDCB1: 0x23c00000
[    7.850073] NDCB2: 0x00000000
[    7.850073] NDCB3: 0x00000000
[    7.869032] nand: nand_do_read_oob: from = 0x01200000, len = 64
[    7.875058] marvell-nfc pxa3xx-nand: 
[    7.875058] NDCR:  0x9d079fff
[    7.875058] NDCB0: 0x000d3000
[    7.875058] NDCB1: 0x24000000
[    7.875058] NDCB2: 0x00000000
[    7.875058] NDCB3: 0x00000000
[    7.893983] nand: nand_do_read_oob: from = 0x01220000, len = 64
[    7.900179] marvell-nfc pxa3xx-nand: 
[    7.900179] NDCR:  0x9d079fff
[    7.900179] NDCB0: 0x000d3000
[    7.900179] NDCB1: 0x24400000
[    7.900179] NDCB2: 0x00000000
[    7.900179] NDCB3: 0x00000000
[    7.919100] nand: nand_do_read_oob: from = 0x01240000, len = 64
[    7.925130] marvell-nfc pxa3xx-nand: 
[    7.925130] NDCR:  0x9d079fff
[    7.925130] NDCB0: 0x000d3000
[    7.925130] NDCB1: 0x24800000
[    7.925130] NDCB2: 0x00000000
[    7.925130] NDCB3: 0x00000000
[    7.944059] nand: nand_do_read_oob: from = 0x01260000, len = 64
[    7.950261] marvell-nfc pxa3xx-nand: 
[    7.950261] NDCR:  0x9d079fff
[    7.950261] NDCB0: 0x000d3000
[    7.950261] NDCB1: 0x24c00000
[    7.950261] NDCB2: 0x00000000
[    7.950261] NDCB3: 0x00000000
[    7.969181] nand: nand_do_read_oob: from = 0x01280000, len = 64
[    7.975214] marvell-nfc pxa3xx-nand: 
[    7.975214] NDCR:  0x9d079fff
[    7.975214] NDCB0: 0x000d3000
[    7.975214] NDCB1: 0x25000000
[    7.975214] NDCB2: 0x00000000
[    7.975214] NDCB3: 0x00000000
[    7.994144] nand: nand_do_read_oob: from = 0x012a0000, len = 64
[    8.000341] marvell-nfc pxa3xx-nand: 
[    8.000341] NDCR:  0x9d079fff
[    8.000341] NDCB0: 0x000d3000
[    8.000341] NDCB1: 0x25400000
[    8.000341] NDCB2: 0x00000000
[    8.000341] NDCB3: 0x00000000
[    8.019272] nand: nand_do_read_oob: from = 0x012c0000, len = 64
[    8.025304] marvell-nfc pxa3xx-nand: 
[    8.025304] NDCR:  0x9d079fff
[    8.025304] NDCB0: 0x000d3000
[    8.025304] NDCB1: 0x25800000
[    8.025304] NDCB2: 0x00000000
[    8.025304] NDCB3: 0x00000000
[    8.044235] nand: nand_do_read_oob: from = 0x012e0000, len = 64
[    8.050440] marvell-nfc pxa3xx-nand: 
[    8.050440] NDCR:  0x9d079fff
[    8.050440] NDCB0: 0x000d3000
[    8.050440] NDCB1: 0x25c00000
[    8.050440] NDCB2: 0x00000000
[    8.050440] NDCB3: 0x00000000
[    8.069360] nand: nand_do_read_oob: from = 0x01300000, len = 64
[    8.075391] marvell-nfc pxa3xx-nand: 
[    8.075391] NDCR:  0x9d079fff
[    8.075391] NDCB0: 0x000d3000
[    8.075391] NDCB1: 0x26000000
[    8.075391] NDCB2: 0x00000000
[    8.075391] NDCB3: 0x00000000
[    8.094921] nand: nand_do_read_oob: from = 0x01320000, len = 64
[    8.101167] marvell-nfc pxa3xx-nand: 
[    8.101167] NDCR:  0x9d079fff
[    8.101167] NDCB0: 0x000d3000
[    8.101167] NDCB1: 0x26400000
[    8.101167] NDCB2: 0x00000000
[    8.101167] NDCB3: 0x00000000
[    8.120098] nand: nand_do_read_oob: from = 0x01340000, len = 64
[    8.126128] marvell-nfc pxa3xx-nand: 
[    8.126128] NDCR:  0x9d079fff
[    8.126128] NDCB0: 0x000d3000
[    8.126128] NDCB1: 0x26800000
[    8.126128] NDCB2: 0x00000000
[    8.126128] NDCB3: 0x00000000
[    8.145054] nand: nand_do_read_oob: from = 0x01360000, len = 64
[    8.151260] marvell-nfc pxa3xx-nand: 
[    8.151260] NDCR:  0x9d079fff
[    8.151260] NDCB0: 0x000d3000
[    8.151260] NDCB1: 0x26c00000
[    8.151260] NDCB2: 0x00000000
[    8.151260] NDCB3: 0x00000000
[    8.170181] nand: nand_do_read_oob: from = 0x01380000, len = 64
[    8.176210] marvell-nfc pxa3xx-nand: 
[    8.176210] NDCR:  0x9d079fff
[    8.176210] NDCB0: 0x000d3000
[    8.176210] NDCB1: 0x27000000
[    8.176210] NDCB2: 0x00000000
[    8.176210] NDCB3: 0x00000000
[    8.195135] nand: nand_do_read_oob: from = 0x013a0000, len = 64
[    8.201338] marvell-nfc pxa3xx-nand: 
[    8.201338] NDCR:  0x9d079fff
[    8.201338] NDCB0: 0x000d3000
[    8.201338] NDCB1: 0x27400000
[    8.201338] NDCB2: 0x00000000
[    8.201338] NDCB3: 0x00000000
[    8.220259] nand: nand_do_read_oob: from = 0x013c0000, len = 64
[    8.226290] marvell-nfc pxa3xx-nand: 
[    8.226290] NDCR:  0x9d079fff
[    8.226290] NDCB0: 0x000d3000
[    8.226290] NDCB1: 0x27800000
[    8.226290] NDCB2: 0x00000000
[    8.226290] NDCB3: 0x00000000
[    8.245237] nand: nand_do_read_oob: from = 0x013e0000, len = 64
[    8.251438] marvell-nfc pxa3xx-nand: 
[    8.251438] NDCR:  0x9d079fff
[    8.251438] NDCB0: 0x000d3000
[    8.251438] NDCB1: 0x27c00000
[    8.251438] NDCB2: 0x00000000
[    8.251438] NDCB3: 0x00000000
[    8.270359] nand: nand_do_read_oob: from = 0x01400000, len = 64
[    8.276388] marvell-nfc pxa3xx-nand: 
[    8.276388] NDCR:  0x9d079fff
[    8.276388] NDCB0: 0x000d3000
[    8.276388] NDCB1: 0x28000000
[    8.276388] NDCB2: 0x00000000
[    8.276388] NDCB3: 0x00000000
[    8.295315] nand: nand_do_read_oob: from = 0x01420000, len = 64
[    8.301520] marvell-nfc pxa3xx-nand: 
[    8.301520] NDCR:  0x9d079fff
[    8.301520] NDCB0: 0x000d3000
[    8.301520] NDCB1: 0x28400000
[    8.301520] NDCB2: 0x00000000
[    8.301520] NDCB3: 0x00000000
[    8.320439] nand: nand_do_read_oob: from = 0x01440000, len = 64
[    8.326470] marvell-nfc pxa3xx-nand: 
[    8.326470] NDCR:  0x9d079fff
[    8.326470] NDCB0: 0x000d3000
[    8.326470] NDCB1: 0x28800000
[    8.326470] NDCB2: 0x00000000
[    8.326470] NDCB3: 0x00000000
[    8.345396] nand: nand_do_read_oob: from = 0x01460000, len = 64
[    8.351599] marvell-nfc pxa3xx-nand: 
[    8.351599] NDCR:  0x9d079fff
[    8.351599] NDCB0: 0x000d3000
[    8.351599] NDCB1: 0x28c00000
[    8.351599] NDCB2: 0x00000000
[    8.351599] NDCB3: 0x00000000
[    8.370521] nand: nand_do_read_oob: from = 0x01480000, len = 64
[    8.376552] marvell-nfc pxa3xx-nand: 
[    8.376552] NDCR:  0x9d079fff
[    8.376552] NDCB0: 0x000d3000
[    8.376552] NDCB1: 0x29000000
[    8.376552] NDCB2: 0x00000000
[    8.376552] NDCB3: 0x00000000
[    8.395475] nand: nand_do_read_oob: from = 0x014a0000, len = 64
[    8.401671] marvell-nfc pxa3xx-nand: 
[    8.401671] NDCR:  0x9d079fff
[    8.401671] NDCB0: 0x000d3000
[    8.401671] NDCB1: 0x29400000
[    8.401671] NDCB2: 0x00000000
[    8.401671] NDCB3: 0x00000000
[    8.420591] nand: nand_do_read_oob: from = 0x014c0000, len = 64
[    8.426625] marvell-nfc pxa3xx-nand: 
[    8.426625] NDCR:  0x9d079fff
[    8.426625] NDCB0: 0x000d3000
[    8.426625] NDCB1: 0x29800000
[    8.426625] NDCB2: 0x00000000
[    8.426625] NDCB3: 0x00000000
[    8.445558] nand: nand_do_read_oob: from = 0x014e0000, len = 64
[    8.451760] marvell-nfc pxa3xx-nand: 
[    8.451760] NDCR:  0x9d079fff
[    8.451760] NDCB0: 0x000d3000
[    8.451760] NDCB1: 0x29c00000
[    8.451760] NDCB2: 0x00000000
[    8.451760] NDCB3: 0x00000000
[    8.470686] nand: nand_do_read_oob: from = 0x01500000, len = 64
[    8.476715] marvell-nfc pxa3xx-nand: 
[    8.476715] NDCR:  0x9d079fff
[    8.476715] NDCB0: 0x000d3000
[    8.476715] NDCB1: 0x2a000000
[    8.476715] NDCB2: 0x00000000
[    8.476715] NDCB3: 0x00000000
[    8.495649] nand: nand_do_read_oob: from = 0x01520000, len = 64
[    8.501852] marvell-nfc pxa3xx-nand: 
[    8.501852] NDCR:  0x9d079fff
[    8.501852] NDCB0: 0x000d3000
[    8.501852] NDCB1: 0x2a400000
[    8.501852] NDCB2: 0x00000000
[    8.501852] NDCB3: 0x00000000
[    8.520778] nand: nand_do_read_oob: from = 0x01540000, len = 64
[    8.526815] marvell-nfc pxa3xx-nand: 
[    8.526815] NDCR:  0x9d079fff
[    8.526815] NDCB0: 0x000d3000
[    8.526815] NDCB1: 0x2a800000
[    8.526815] NDCB2: 0x00000000
[    8.526815] NDCB3: 0x00000000
[    8.545750] nand: nand_do_read_oob: from = 0x01560000, len = 64
[    8.551951] marvell-nfc pxa3xx-nand: 
[    8.551951] NDCR:  0x9d079fff
[    8.551951] NDCB0: 0x000d3000
[    8.551951] NDCB1: 0x2ac00000
[    8.551951] NDCB2: 0x00000000
[    8.551951] NDCB3: 0x00000000
[    8.570873] nand: nand_do_read_oob: from = 0x01580000, len = 64
[    8.576904] marvell-nfc pxa3xx-nand: 
[    8.576904] NDCR:  0x9d079fff
[    8.576904] NDCB0: 0x000d3000
[    8.576904] NDCB1: 0x2b000000
[    8.576904] NDCB2: 0x00000000
[    8.576904] NDCB3: 0x00000000
[    8.595838] nand: nand_do_read_oob: from = 0x015a0000, len = 64
[    8.602043] marvell-nfc pxa3xx-nand: 
[    8.602043] NDCR:  0x9d079fff
[    8.602043] NDCB0: 0x000d3000
[    8.602043] NDCB1: 0x2b400000
[    8.602043] NDCB2: 0x00000000
[    8.602043] NDCB3: 0x00000000
[    8.620971] nand: nand_do_read_oob: from = 0x015c0000, len = 64
[    8.627001] marvell-nfc pxa3xx-nand: 
[    8.627001] NDCR:  0x9d079fff
[    8.627001] NDCB0: 0x000d3000
[    8.627001] NDCB1: 0x2b800000
[    8.627001] NDCB2: 0x00000000
[    8.627001] NDCB3: 0x00000000
[    8.645925] nand: nand_do_read_oob: from = 0x015e0000, len = 64
[    8.652130] marvell-nfc pxa3xx-nand: 
[    8.652130] NDCR:  0x9d079fff
[    8.652130] NDCB0: 0x000d3000
[    8.652130] NDCB1: 0x2bc00000
[    8.652130] NDCB2: 0x00000000
[    8.652130] NDCB3: 0x00000000
[    8.671050] nand: nand_do_read_oob: from = 0x01600000, len = 64
[    8.677083] marvell-nfc pxa3xx-nand: 
[    8.677083] NDCR:  0x9d079fff
[    8.677083] NDCB0: 0x000d3000
[    8.677083] NDCB1: 0x2c000000
[    8.677083] NDCB2: 0x00000000
[    8.677083] NDCB3: 0x00000000
[    8.696005] nand: nand_do_read_oob: from = 0x01620000, len = 64
[    8.702203] marvell-nfc pxa3xx-nand: 
[    8.702203] NDCR:  0x9d079fff
[    8.702203] NDCB0: 0x000d3000
[    8.702203] NDCB1: 0x2c400000
[    8.702203] NDCB2: 0x00000000
[    8.702203] NDCB3: 0x00000000
[    8.721125] nand: nand_do_read_oob: from = 0x01640000, len = 64
[    8.727154] marvell-nfc pxa3xx-nand: 
[    8.727154] NDCR:  0x9d079fff
[    8.727154] NDCB0: 0x000d3000
[    8.727154] NDCB1: 0x2c800000
[    8.727154] NDCB2: 0x00000000
[    8.727154] NDCB3: 0x00000000
[    8.746081] nand: nand_do_read_oob: from = 0x01660000, len = 64
[    8.752284] marvell-nfc pxa3xx-nand: 
[    8.752284] NDCR:  0x9d079fff
[    8.752284] NDCB0: 0x000d3000
[    8.752284] NDCB1: 0x2cc00000
[    8.752284] NDCB2: 0x00000000
[    8.752284] NDCB3: 0x00000000
[    8.771175] Bad eraseblock 179 at 0x000001660000
[    8.775871] nand: nand_do_read_oob: from = 0x01680000, len = 64
[    8.782048] marvell-nfc pxa3xx-nand: 
[    8.782048] NDCR:  0x9d079fff
[    8.782048] NDCB0: 0x000d3000
[    8.782048] NDCB1: 0x2d000000
[    8.782048] NDCB2: 0x00000000
[    8.782048] NDCB3: 0x00000000
[    8.800940] Bad eraseblock 180 at 0x000001680000
[    8.805635] nand: nand_do_read_oob: from = 0x016a0000, len = 64
[    8.811815] marvell-nfc pxa3xx-nand: 
[    8.811815] NDCR:  0x9d079fff
[    8.811815] NDCB0: 0x000d3000
[    8.811815] NDCB1: 0x2d400000
[    8.811815] NDCB2: 0x00000000
[    8.811815] NDCB3: 0x00000000
[    8.830704] Bad eraseblock 181 at 0x0000016a0000
[    8.835402] nand: nand_do_read_oob: from = 0x016c0000, len = 64
[    8.841583] marvell-nfc pxa3xx-nand: 
[    8.841583] NDCR:  0x9d079fff
[    8.841583] NDCB0: 0x000d3000
[    8.841583] NDCB1: 0x2d800000
[    8.841583] NDCB2: 0x00000000
[    8.841583] NDCB3: 0x00000000
[    8.860473] Bad eraseblock 182 at 0x0000016c0000
[    8.865168] nand: nand_do_read_oob: from = 0x016e0000, len = 64
[    8.871347] marvell-nfc pxa3xx-nand: 
[    8.871347] NDCR:  0x9d079fff
[    8.871347] NDCB0: 0x000d3000
[    8.871347] NDCB1: 0x2dc00000
[    8.871347] NDCB2: 0x00000000
[    8.871347] NDCB3: 0x00000000
[    8.890257] Bad eraseblock 183 at 0x0000016e0000
[    8.894953] nand: nand_do_read_oob: from = 0x01700000, len = 64
[    8.901132] marvell-nfc pxa3xx-nand: 
[    8.901132] NDCR:  0x9d079fff
[    8.901132] NDCB0: 0x000d3000
[    8.901132] NDCB1: 0x2e000000
[    8.901132] NDCB2: 0x00000000
[    8.901132] NDCB3: 0x00000000
[    8.920020] Bad eraseblock 184 at 0x000001700000
[    8.924718] nand: nand_do_read_oob: from = 0x01720000, len = 64
[    8.930895] marvell-nfc pxa3xx-nand: 
[    8.930895] NDCR:  0x9d079fff
[    8.930895] NDCB0: 0x000d3000
[    8.930895] NDCB1: 0x2e400000
[    8.930895] NDCB2: 0x00000000
[    8.930895] NDCB3: 0x00000000
[    8.949786] Bad eraseblock 185 at 0x000001720000
[    8.954485] nand: nand_do_read_oob: from = 0x01740000, len = 64
[    8.960662] marvell-nfc pxa3xx-nand: 
[    8.960662] NDCR:  0x9d079fff
[    8.960662] NDCB0: 0x000d3000
[    8.960662] NDCB1: 0x2e800000
[    8.960662] NDCB2: 0x00000000
[    8.960662] NDCB3: 0x00000000
[    8.979554] Bad eraseblock 186 at 0x000001740000
[    8.984250] nand: nand_do_read_oob: from = 0x01760000, len = 64
[    8.990427] marvell-nfc pxa3xx-nand: 
[    8.990427] NDCR:  0x9d079fff
[    8.990427] NDCB0: 0x000d3000
[    8.990427] NDCB1: 0x2ec00000
[    8.990427] NDCB2: 0x00000000
[    8.990427] NDCB3: 0x00000000
[    9.009331] Bad eraseblock 187 at 0x000001760000
[    9.014025] nand: nand_do_read_oob: from = 0x01780000, len = 64
[    9.020206] marvell-nfc pxa3xx-nand: 
[    9.020206] NDCR:  0x9d079fff
[    9.020206] NDCB0: 0x000d3000
[    9.020206] NDCB1: 0x2f000000
[    9.020206] NDCB2: 0x00000000
[    9.020206] NDCB3: 0x00000000
[    9.039094] Bad eraseblock 188 at 0x000001780000
[    9.043792] nand: nand_do_read_oob: from = 0x017a0000, len = 64
[    9.049970] marvell-nfc pxa3xx-nand: 
[    9.049970] NDCR:  0x9d079fff
[    9.049970] NDCB0: 0x000d3000
[    9.049970] NDCB1: 0x2f400000
[    9.049970] NDCB2: 0x00000000
[    9.049970] NDCB3: 0x00000000
[    9.068867] Bad eraseblock 189 at 0x0000017a0000
[    9.073569] nand: nand_do_read_oob: from = 0x017c0000, len = 64
[    9.079741] marvell-nfc pxa3xx-nand: 
[    9.079741] NDCR:  0x9d079fff
[    9.079741] NDCB0: 0x000d3000
[    9.079741] NDCB1: 0x2f800000
[    9.079741] NDCB2: 0x00000000
[    9.079741] NDCB3: 0x00000000
[    9.098623] Bad eraseblock 190 at 0x0000017c0000
[    9.103465] nand: nand_do_read_oob: from = 0x017e0000, len = 64
[    9.109624] marvell-nfc pxa3xx-nand: 
[    9.109624] NDCR:  0x9d079fff
[    9.109624] NDCB0: 0x000d3000
[    9.109624] NDCB1: 0x2fc00000
[    9.109624] NDCB2: 0x00000000
[    9.109624] NDCB3: 0x00000000
[    9.128502] Bad eraseblock 191 at 0x0000017e0000
[    9.133362] nand: nand_do_read_oob: from = 0x01800000, len = 64
[    9.139533] marvell-nfc pxa3xx-nand: 
[    9.139533] NDCR:  0x9d079fff
[    9.139533] NDCB0: 0x000d3000
[    9.139533] NDCB1: 0x30000000
[    9.139533] NDCB2: 0x00000000
[    9.139533] NDCB3: 0x00000000
[    9.158414] Bad eraseblock 192 at 0x000001800000
[    9.163264] nand: nand_do_read_oob: from = 0x01820000, len = 64
[    9.169438] marvell-nfc pxa3xx-nand: 
[    9.169438] NDCR:  0x9d079fff
[    9.169438] NDCB0: 0x000d3000
[    9.169438] NDCB1: 0x30400000
[    9.169438] NDCB2: 0x00000000
[    9.169438] NDCB3: 0x00000000
[    9.188319] Bad eraseblock 193 at 0x000001820000
[    9.193177] nand: nand_do_read_oob: from = 0x01840000, len = 64
[    9.199354] marvell-nfc pxa3xx-nand: 
[    9.199354] NDCR:  0x9d079fff
[    9.199354] NDCB0: 0x000d3000
[    9.199354] NDCB1: 0x30800000
[    9.199354] NDCB2: 0x00000000
[    9.199354] NDCB3: 0x00000000
[    9.218231] Bad eraseblock 194 at 0x000001840000
[    9.223090] nand: nand_do_read_oob: from = 0x01860000, len = 64
[    9.229262] marvell-nfc pxa3xx-nand: 
[    9.229262] NDCR:  0x9d079fff
[    9.229262] NDCB0: 0x000d3000
[    9.229262] NDCB1: 0x30c00000
[    9.229262] NDCB2: 0x00000000
[    9.229262] NDCB3: 0x00000000
[    9.248142] Bad eraseblock 195 at 0x000001860000
[    9.252993] nand: nand_do_read_oob: from = 0x01880000, len = 64
[    9.259168] marvell-nfc pxa3xx-nand: 
[    9.259168] NDCR:  0x9d079fff
[    9.259168] NDCB0: 0x000d3000
[    9.259168] NDCB1: 0x31000000
[    9.259168] NDCB2: 0x00000000
[    9.259168] NDCB3: 0x00000000
[    9.278047] Bad eraseblock 196 at 0x000001880000
[    9.282898] nand: nand_do_read_oob: from = 0x018a0000, len = 64
[    9.289072] marvell-nfc pxa3xx-nand: 
[    9.289072] NDCR:  0x9d079fff
[    9.289072] NDCB0: 0x000d3000
[    9.289072] NDCB1: 0x31400000
[    9.289072] NDCB2: 0x00000000
[    9.289072] NDCB3: 0x00000000
[    9.307953] Bad eraseblock 197 at 0x0000018a0000
[    9.312811] nand: nand_do_read_oob: from = 0x018c0000, len = 64
[    9.318985] marvell-nfc pxa3xx-nand: 
[    9.318985] NDCR:  0x9d079fff
[    9.318985] NDCB0: 0x000d3000
[    9.318985] NDCB1: 0x31800000
[    9.318985] NDCB2: 0x00000000
[    9.318985] NDCB3: 0x00000000
[    9.337863] Bad eraseblock 198 at 0x0000018c0000
[    9.342715] nand: nand_do_read_oob: from = 0x018e0000, len = 64
[    9.348889] marvell-nfc pxa3xx-nand: 
[    9.348889] NDCR:  0x9d079fff
[    9.348889] NDCB0: 0x000d3000
[    9.348889] NDCB1: 0x31c00000
[    9.348889] NDCB2: 0x00000000
[    9.348889] NDCB3: 0x00000000
[    9.367767] Bad eraseblock 199 at 0x0000018e0000
[    9.372618] nand: nand_do_read_oob: from = 0x01900000, len = 64
[    9.378794] marvell-nfc pxa3xx-nand: 
[    9.378794] NDCR:  0x9d079fff
[    9.378794] NDCB0: 0x000d3000
[    9.378794] NDCB1: 0x32000000
[    9.378794] NDCB2: 0x00000000
[    9.378794] NDCB3: 0x00000000
[    9.397663] Bad eraseblock 200 at 0x000001900000
[    9.402530] nand: nand_do_read_oob: from = 0x01920000, len = 64
[    9.408554] marvell-nfc pxa3xx-nand: 
[    9.408554] NDCR:  0x9d079fff
[    9.408554] NDCB0: 0x000d3000
[    9.408554] NDCB1: 0x32400000
[    9.408554] NDCB2: 0x00000000
[    9.408554] NDCB3: 0x00000000
[    9.427438] Bad eraseblock 201 at 0x000001920000
[    9.432289] nand: nand_do_read_oob: from = 0x01940000, len = 64
[    9.438313] marvell-nfc pxa3xx-nand: 
[    9.438313] NDCR:  0x9d079fff
[    9.438313] NDCB0: 0x000d3000
[    9.438313] NDCB1: 0x32800000
[    9.438313] NDCB2: 0x00000000
[    9.438313] NDCB3: 0x00000000
[    9.457195] Bad eraseblock 202 at 0x000001940000
[    9.462047] nand: nand_do_read_oob: from = 0x01960000, len = 64
[    9.468069] marvell-nfc pxa3xx-nand: 
[    9.468069] NDCR:  0x9d079fff
[    9.468069] NDCB0: 0x000d3000
[    9.468069] NDCB1: 0x32c00000
[    9.468069] NDCB2: 0x00000000
[    9.468069] NDCB3: 0x00000000
[    9.486945] Bad eraseblock 203 at 0x000001960000
[    9.491807] nand: nand_do_read_oob: from = 0x01980000, len = 64
[    9.497826] marvell-nfc pxa3xx-nand: 
[    9.497826] NDCR:  0x9d079fff
[    9.497826] NDCB0: 0x000d3000
[    9.497826] NDCB1: 0x33000000
[    9.497826] NDCB2: 0x00000000
[    9.497826] NDCB3: 0x00000000
[    9.516702] Bad eraseblock 204 at 0x000001980000
[    9.521563] nand: nand_do_read_oob: from = 0x019a0000, len = 64
[    9.527585] marvell-nfc pxa3xx-nand: 
[    9.527585] NDCR:  0x9d079fff
[    9.527585] NDCB0: 0x000d3000
[    9.527585] NDCB1: 0x33400000
[    9.527585] NDCB2: 0x00000000
[    9.527585] NDCB3: 0x00000000
[    9.546470] Bad eraseblock 205 at 0x0000019a0000
[    9.551328] nand: nand_do_read_oob: from = 0x019c0000, len = 64
[    9.557350] marvell-nfc pxa3xx-nand: 
[    9.557350] NDCR:  0x9d079fff
[    9.557350] NDCB0: 0x000d3000
[    9.557350] NDCB1: 0x33800000
[    9.557350] NDCB2: 0x00000000
[    9.557350] NDCB3: 0x00000000
[    9.576226] Bad eraseblock 206 at 0x0000019c0000
[    9.581084] nand: nand_do_read_oob: from = 0x019e0000, len = 64
[    9.587109] marvell-nfc pxa3xx-nand: 
[    9.587109] NDCR:  0x9d079fff
[    9.587109] NDCB0: 0x000d3000
[    9.587109] NDCB1: 0x33c00000
[    9.587109] NDCB2: 0x00000000
[    9.587109] NDCB3: 0x00000000
[    9.605994] Bad eraseblock 207 at 0x0000019e0000
[    9.610854] nand: nand_do_read_oob: from = 0x01a00000, len = 64
[    9.616874] marvell-nfc pxa3xx-nand: 
[    9.616874] NDCR:  0x9d079fff
[    9.616874] NDCB0: 0x000d3000
[    9.616874] NDCB1: 0x34000000
[    9.616874] NDCB2: 0x00000000
[    9.616874] NDCB3: 0x00000000
[    9.635751] Bad eraseblock 208 at 0x000001a00000
[    9.640608] nand: nand_do_read_oob: from = 0x01a20000, len = 64
[    9.646633] marvell-nfc pxa3xx-nand: 
[    9.646633] NDCR:  0x9d079fff
[    9.646633] NDCB0: 0x000d3000
[    9.646633] NDCB1: 0x34400000
[    9.646633] NDCB2: 0x00000000
[    9.646633] NDCB3: 0x00000000
[    9.665517] Bad eraseblock 209 at 0x000001a20000
[    9.670375] nand: nand_do_read_oob: from = 0x01a40000, len = 64
[    9.676397] marvell-nfc pxa3xx-nand: 
[    9.676397] NDCR:  0x9d079fff
[    9.676397] NDCB0: 0x000d3000
[    9.676397] NDCB1: 0x34800000
[    9.676397] NDCB2: 0x00000000
[    9.676397] NDCB3: 0x00000000
[    9.695274] Bad eraseblock 210 at 0x000001a40000
[    9.700130] nand: nand_do_read_oob: from = 0x01a60000, len = 64
[    9.706155] marvell-nfc pxa3xx-nand: 
[    9.706155] NDCR:  0x9d079fff
[    9.706155] NDCB0: 0x000d3000
[    9.706155] NDCB1: 0x34c00000
[    9.706155] NDCB2: 0x00000000
[    9.706155] NDCB3: 0x00000000
[    9.725032] Bad eraseblock 211 at 0x000001a60000
[    9.729891] nand: nand_do_read_oob: from = 0x01a80000, len = 64
[    9.735912] marvell-nfc pxa3xx-nand: 
[    9.735912] NDCR:  0x9d079fff
[    9.735912] NDCB0: 0x000d3000
[    9.735912] NDCB1: 0x35000000
[    9.735912] NDCB2: 0x00000000
[    9.735912] NDCB3: 0x00000000
[    9.754791] Bad eraseblock 212 at 0x000001a80000
[    9.759646] nand: nand_do_read_oob: from = 0x01aa0000, len = 64
[    9.765671] marvell-nfc pxa3xx-nand: 
[    9.765671] NDCR:  0x9d079fff
[    9.765671] NDCB0: 0x000d3000
[    9.765671] NDCB1: 0x35400000
[    9.765671] NDCB2: 0x00000000
[    9.765671] NDCB3: 0x00000000
[    9.784546] Bad eraseblock 213 at 0x000001aa0000
[    9.789405] nand: nand_do_read_oob: from = 0x01ac0000, len = 64
[    9.795428] marvell-nfc pxa3xx-nand: 
[    9.795428] NDCR:  0x9d079fff
[    9.795428] NDCB0: 0x000d3000
[    9.795428] NDCB1: 0x35800000
[    9.795428] NDCB2: 0x00000000
[    9.795428] NDCB3: 0x00000000
[    9.814303] Bad eraseblock 214 at 0x000001ac0000
[    9.819164] nand: nand_do_read_oob: from = 0x01ae0000, len = 64
[    9.825186] marvell-nfc pxa3xx-nand: 
[    9.825186] NDCR:  0x9d079fff
[    9.825186] NDCB0: 0x000d3000
[    9.825186] NDCB1: 0x35c00000
[    9.825186] NDCB2: 0x00000000
[    9.825186] NDCB3: 0x00000000
[    9.844070] Bad eraseblock 215 at 0x000001ae0000
[    9.848921] nand: nand_do_read_oob: from = 0x01b00000, len = 64
[    9.854943] marvell-nfc pxa3xx-nand: 
[    9.854943] NDCR:  0x9d079fff
[    9.854943] NDCB0: 0x000d3000
[    9.854943] NDCB1: 0x36000000
[    9.854943] NDCB2: 0x00000000
[    9.854943] NDCB3: 0x00000000
[    9.873819] Bad eraseblock 216 at 0x000001b00000
[    9.878521] nand: nand_do_read_oob: from = 0x01b20000, len = 64
[    9.884699] marvell-nfc pxa3xx-nand: 
[    9.884699] NDCR:  0x9d079fff
[    9.884699] NDCB0: 0x000d3000
[    9.884699] NDCB1: 0x36400000
[    9.884699] NDCB2: 0x00000000
[    9.884699] NDCB3: 0x00000000
[    9.903587] Bad eraseblock 217 at 0x000001b20000
[    9.908284] nand: nand_do_read_oob: from = 0x01b40000, len = 64
[    9.914463] marvell-nfc pxa3xx-nand: 
[    9.914463] NDCR:  0x9d079fff
[    9.914463] NDCB0: 0x000d3000
[    9.914463] NDCB1: 0x36800000
[    9.914463] NDCB2: 0x00000000
[    9.914463] NDCB3: 0x00000000
[    9.933355] Bad eraseblock 218 at 0x000001b40000
[    9.938052] nand: nand_do_read_oob: from = 0x01b60000, len = 64
[    9.944230] marvell-nfc pxa3xx-nand: 
[    9.944230] NDCR:  0x9d079fff
[    9.944230] NDCB0: 0x000d3000
[    9.944230] NDCB1: 0x36c00000
[    9.944230] NDCB2: 0x00000000
[    9.944230] NDCB3: 0x00000000
[    9.963121] Bad eraseblock 219 at 0x000001b60000
[    9.967817] nand: nand_do_read_oob: from = 0x01b80000, len = 64
[    9.973996] marvell-nfc pxa3xx-nand: 
[    9.973996] NDCR:  0x9d079fff
[    9.973996] NDCB0: 0x000d3000
[    9.973996] NDCB1: 0x37000000
[    9.973996] NDCB2: 0x00000000
[    9.973996] NDCB3: 0x00000000
[    9.992886] Bad eraseblock 220 at 0x000001b80000
[    9.997584] nand: nand_do_read_oob: from = 0x01ba0000, len = 64
[   10.003762] marvell-nfc pxa3xx-nand: 
[   10.003762] NDCR:  0x9d079fff
[   10.003762] NDCB0: 0x000d3000
[   10.003762] NDCB1: 0x37400000
[   10.003762] NDCB2: 0x00000000
[   10.003762] NDCB3: 0x00000000
[   10.022661] Bad eraseblock 221 at 0x000001ba0000
[   10.027358] nand: nand_do_read_oob: from = 0x01bc0000, len = 64
[   10.033541] marvell-nfc pxa3xx-nand: 
[   10.033541] NDCR:  0x9d079fff
[   10.033541] NDCB0: 0x000d3000
[   10.033541] NDCB1: 0x37800000
[   10.033541] NDCB2: 0x00000000
[   10.033541] NDCB3: 0x00000000
[   10.052456] Bad eraseblock 222 at 0x000001bc0000
[   10.057151] nand: nand_do_read_oob: from = 0x01be0000, len = 64
[   10.063329] marvell-nfc pxa3xx-nand: 
[   10.063329] NDCR:  0x9d079fff
[   10.063329] NDCB0: 0x000d3000
[   10.063329] NDCB1: 0x37c00000
[   10.063329] NDCB2: 0x00000000
[   10.063329] NDCB3: 0x00000000
[   10.082230] Bad eraseblock 223 at 0x000001be0000
[   10.086925] nand: nand_do_read_oob: from = 0x01c00000, len = 64
[   10.093541] marvell-nfc pxa3xx-nand: 
[   10.093541] NDCR:  0x9d079fff
[   10.093541] NDCB0: 0x000d3000
[   10.093541] NDCB1: 0x38000000
[   10.093541] NDCB2: 0x00000000
[   10.093541] NDCB3: 0x00000000
[   10.112522] Bad eraseblock 224 at 0x000001c00000
[   10.117221] nand: nand_do_read_oob: from = 0x01c20000, len = 64
[   10.123407] marvell-nfc pxa3xx-nand: 
[   10.123407] NDCR:  0x9d079fff
[   10.123407] NDCB0: 0x000d3000
[   10.123407] NDCB1: 0x38400000
[   10.123407] NDCB2: 0x00000000
[   10.123407] NDCB3: 0x00000000
[   10.142307] Bad eraseblock 225 at 0x000001c20000
[   10.147009] nand: nand_do_read_oob: from = 0x01c40000, len = 64
[   10.153187] marvell-nfc pxa3xx-nand: 
[   10.153187] NDCR:  0x9d079fff
[   10.153187] NDCB0: 0x000d3000
[   10.153187] NDCB1: 0x38800000
[   10.153187] NDCB2: 0x00000000
[   10.153187] NDCB3: 0x00000000
[   10.172087] Bad eraseblock 226 at 0x000001c40000
[   10.176784] nand: nand_do_read_oob: from = 0x01c60000, len = 64
[   10.182963] marvell-nfc pxa3xx-nand: 
[   10.182963] NDCR:  0x9d079fff
[   10.182963] NDCB0: 0x000d3000
[   10.182963] NDCB1: 0x38c00000
[   10.182963] NDCB2: 0x00000000
[   10.182963] NDCB3: 0x00000000
[   10.201861] Bad eraseblock 227 at 0x000001c60000
[   10.206558] nand: nand_do_read_oob: from = 0x01c80000, len = 64
[   10.212737] marvell-nfc pxa3xx-nand: 
[   10.212737] NDCR:  0x9d079fff
[   10.212737] NDCB0: 0x000d3000
[   10.212737] NDCB1: 0x39000000
[   10.212737] NDCB2: 0x00000000
[   10.212737] NDCB3: 0x00000000
[   10.231639] Bad eraseblock 228 at 0x000001c80000
[   10.236333] nand: nand_do_read_oob: from = 0x01ca0000, len = 64
[   10.242510] marvell-nfc pxa3xx-nand: 
[   10.242510] NDCR:  0x9d079fff
[   10.242510] NDCB0: 0x000d3000
[   10.242510] NDCB1: 0x39400000
[   10.242510] NDCB2: 0x00000000
[   10.242510] NDCB3: 0x00000000
[   10.261400] Bad eraseblock 229 at 0x000001ca0000
[   10.266099] nand: nand_do_read_oob: from = 0x01cc0000, len = 64
[   10.272278] marvell-nfc pxa3xx-nand: 
[   10.272278] NDCR:  0x9d079fff
[   10.272278] NDCB0: 0x000d3000
[   10.272278] NDCB1: 0x39800000
[   10.272278] NDCB2: 0x00000000
[   10.272278] NDCB3: 0x00000000
[   10.291176] Bad eraseblock 230 at 0x000001cc0000
[   10.295877] nand: nand_do_read_oob: from = 0x01ce0000, len = 64
[   10.302060] marvell-nfc pxa3xx-nand: 
[   10.302060] NDCR:  0x9d079fff
[   10.302060] NDCB0: 0x000d3000
[   10.302060] NDCB1: 0x39c00000
[   10.302060] NDCB2: 0x00000000
[   10.302060] NDCB3: 0x00000000
[   10.320960] Bad eraseblock 231 at 0x000001ce0000
[   10.325658] nand: nand_do_read_oob: from = 0x01d00000, len = 64
[   10.331836] marvell-nfc pxa3xx-nand: 
[   10.331836] NDCR:  0x9d079fff
[   10.331836] NDCB0: 0x000d3000
[   10.331836] NDCB1: 0x3a000000
[   10.331836] NDCB2: 0x00000000
[   10.331836] NDCB3: 0x00000000
[   10.350735] Bad eraseblock 232 at 0x000001d00000
[   10.355433] nand: nand_do_read_oob: from = 0x01d20000, len = 64
[   10.361611] marvell-nfc pxa3xx-nand: 
[   10.361611] NDCR:  0x9d079fff
[   10.361611] NDCB0: 0x000d3000
[   10.361611] NDCB1: 0x3a400000
[   10.361611] NDCB2: 0x00000000
[   10.361611] NDCB3: 0x00000000
[   10.380512] Bad eraseblock 233 at 0x000001d20000
[   10.385207] nand: nand_do_read_oob: from = 0x01d40000, len = 64
[   10.391387] marvell-nfc pxa3xx-nand: 
[   10.391387] NDCR:  0x9d079fff
[   10.391387] NDCB0: 0x000d3000
[   10.391387] NDCB1: 0x3a800000
[   10.391387] NDCB2: 0x00000000
[   10.391387] NDCB3: 0x00000000
[   10.410286] Bad eraseblock 234 at 0x000001d40000
[   10.414983] nand: nand_do_read_oob: from = 0x01d60000, len = 64
[   10.421161] marvell-nfc pxa3xx-nand: 
[   10.421161] NDCR:  0x9d079fff
[   10.421161] NDCB0: 0x000d3000
[   10.421161] NDCB1: 0x3ac00000
[   10.421161] NDCB2: 0x00000000
[   10.421161] NDCB3: 0x00000000
[   10.440059] Bad eraseblock 235 at 0x000001d60000
[   10.444759] nand: nand_do_read_oob: from = 0x01d80000, len = 64
[   10.450935] marvell-nfc pxa3xx-nand: 
[   10.450935] NDCR:  0x9d079fff
[   10.450935] NDCB0: 0x000d3000
[   10.450935] NDCB1: 0x3b000000
[   10.450935] NDCB2: 0x00000000
[   10.450935] NDCB3: 0x00000000
[   10.469837] Bad eraseblock 236 at 0x000001d80000
[   10.474531] nand: nand_do_read_oob: from = 0x01da0000, len = 64
[   10.480709] marvell-nfc pxa3xx-nand: 
[   10.480709] NDCR:  0x9d079fff
[   10.480709] NDCB0: 0x000d3000
[   10.480709] NDCB1: 0x3b400000
[   10.480709] NDCB2: 0x00000000
[   10.480709] NDCB3: 0x00000000
[   10.499610] Bad eraseblock 237 at 0x000001da0000
[   10.504306] nand: nand_do_read_oob: from = 0x01dc0000, len = 64
[   10.510483] marvell-nfc pxa3xx-nand: 
[   10.510483] NDCR:  0x9d079fff
[   10.510483] NDCB0: 0x000d3000
[   10.510483] NDCB1: 0x3b800000
[   10.510483] NDCB2: 0x00000000
[   10.510483] NDCB3: 0x00000000
[   10.529383] Bad eraseblock 238 at 0x000001dc0000
[   10.534081] nand: nand_do_read_oob: from = 0x01de0000, len = 64
[   10.540259] marvell-nfc pxa3xx-nand: 
[   10.540259] NDCR:  0x9d079fff
[   10.540259] NDCB0: 0x000d3000
[   10.540259] NDCB1: 0x3bc00000
[   10.540259] NDCB2: 0x00000000
[   10.540259] NDCB3: 0x00000000
[   10.559159] Bad eraseblock 239 at 0x000001de0000
[   10.563856] nand: nand_do_read_oob: from = 0x01e00000, len = 64
[   10.570034] marvell-nfc pxa3xx-nand: 
[   10.570034] NDCR:  0x9d079fff
[   10.570034] NDCB0: 0x000d3000
[   10.570034] NDCB1: 0x3c000000
[   10.570034] NDCB2: 0x00000000
[   10.570034] NDCB3: 0x00000000
[   10.588971] Bad eraseblock 240 at 0x000001e00000
[   10.593675] nand: nand_do_read_oob: from = 0x01e20000, len = 64
[   10.599851] marvell-nfc pxa3xx-nand: 
[   10.599851] NDCR:  0x9d079fff
[   10.599851] NDCB0: 0x000d3000
[   10.599851] NDCB1: 0x3c400000
[   10.599851] NDCB2: 0x00000000
[   10.599851] NDCB3: 0x00000000
[   10.618811] Bad eraseblock 241 at 0x000001e20000
[   10.623511] nand: nand_do_read_oob: from = 0x01e40000, len = 64
[   10.629689] marvell-nfc pxa3xx-nand: 
[   10.629689] NDCR:  0x9d079fff
[   10.629689] NDCB0: 0x000d3000
[   10.629689] NDCB1: 0x3c800000
[   10.629689] NDCB2: 0x00000000
[   10.629689] NDCB3: 0x00000000
[   10.648573] Bad eraseblock 242 at 0x000001e40000
[   10.653415] nand: nand_do_read_oob: from = 0x01e60000, len = 64
[   10.659598] marvell-nfc pxa3xx-nand: 
[   10.659598] NDCR:  0x9d079fff
[   10.659598] NDCB0: 0x000d3000
[   10.659598] NDCB1: 0x3cc00000
[   10.659598] NDCB2: 0x00000000
[   10.659598] NDCB3: 0x00000000
[   10.678480] Bad eraseblock 243 at 0x000001e60000
[   10.683333] nand: nand_do_read_oob: from = 0x01e80000, len = 64
[   10.689511] marvell-nfc pxa3xx-nand: 
[   10.689511] NDCR:  0x9d079fff
[   10.689511] NDCB0: 0x000d3000
[   10.689511] NDCB1: 0x3d000000
[   10.689511] NDCB2: 0x00000000
[   10.689511] NDCB3: 0x00000000
[   10.708391] Bad eraseblock 244 at 0x000001e80000
[   10.713249] nand: nand_do_read_oob: from = 0x01ea0000, len = 64
[   10.719423] marvell-nfc pxa3xx-nand: 
[   10.719423] NDCR:  0x9d079fff
[   10.719423] NDCB0: 0x000d3000
[   10.719423] NDCB1: 0x3d400000
[   10.719423] NDCB2: 0x00000000
[   10.719423] NDCB3: 0x00000000
[   10.738306] Bad eraseblock 245 at 0x000001ea0000
[   10.743159] nand: nand_do_read_oob: from = 0x01ec0000, len = 64
[   10.749336] marvell-nfc pxa3xx-nand: 
[   10.749336] NDCR:  0x9d079fff
[   10.749336] NDCB0: 0x000d3000
[   10.749336] NDCB1: 0x3d800000
[   10.749336] NDCB2: 0x00000000
[   10.749336] NDCB3: 0x00000000
[   10.768217] Bad eraseblock 246 at 0x000001ec0000
[   10.773071] nand: nand_do_read_oob: from = 0x01ee0000, len = 64
[   10.779248] marvell-nfc pxa3xx-nand: 
[   10.779248] NDCR:  0x9d079fff
[   10.779248] NDCB0: 0x000d3000
[   10.779248] NDCB1: 0x3dc00000
[   10.779248] NDCB2: 0x00000000
[   10.779248] NDCB3: 0x00000000
[   10.798129] Bad eraseblock 247 at 0x000001ee0000
[   10.802985] nand: nand_do_read_oob: from = 0x01f00000, len = 64
[   10.809163] marvell-nfc pxa3xx-nand: 
[   10.809163] NDCR:  0x9d079fff
[   10.809163] NDCB0: 0x000d3000
[   10.809163] NDCB1: 0x3e000000
[   10.809163] NDCB2: 0x00000000
[   10.809163] NDCB3: 0x00000000
[   10.828050] Bad eraseblock 248 at 0x000001f00000
[   10.832908] nand: nand_do_read_oob: from = 0x01f20000, len = 64
[   10.839079] marvell-nfc pxa3xx-nand: 
[   10.839079] NDCR:  0x9d079fff
[   10.839079] NDCB0: 0x000d3000
[   10.839079] NDCB1: 0x3e400000
[   10.839079] NDCB2: 0x00000000
[   10.839079] NDCB3: 0x00000000
[   10.857967] Bad eraseblock 249 at 0x000001f20000
[   10.862820] nand: nand_do_read_oob: from = 0x01f40000, len = 64
[   10.868995] marvell-nfc pxa3xx-nand: 
[   10.868995] NDCR:  0x9d079fff
[   10.868995] NDCB0: 0x000d3000
[   10.868995] NDCB1: 0x3e800000
[   10.868995] NDCB2: 0x00000000
[   10.868995] NDCB3: 0x00000000
[   10.887877] Bad eraseblock 250 at 0x000001f40000
[   10.892733] nand: nand_do_read_oob: from = 0x01f60000, len = 64
[   10.898908] marvell-nfc pxa3xx-nand: 
[   10.898908] NDCR:  0x9d079fff
[   10.898908] NDCB0: 0x000d3000
[   10.898908] NDCB1: 0x3ec00000
[   10.898908] NDCB2: 0x00000000
[   10.898908] NDCB3: 0x00000000
[   10.917786] Bad eraseblock 251 at 0x000001f60000
[   10.922645] nand: nand_do_read_oob: from = 0x01f80000, len = 64
[   10.928821] marvell-nfc pxa3xx-nand: 
[   10.928821] NDCR:  0x9d079fff
[   10.928821] NDCB0: 0x000d3000
[   10.928821] NDCB1: 0x3f000000
[   10.928821] NDCB2: 0x00000000
[   10.928821] NDCB3: 0x00000000
[   10.947705] Bad eraseblock 252 at 0x000001f80000
[   10.952560] nand: nand_do_read_oob: from = 0x01fa0000, len = 64
[   10.958582] marvell-nfc pxa3xx-nand: 
[   10.958582] NDCR:  0x9d079fff
[   10.958582] NDCB0: 0x000d3000
[   10.958582] NDCB1: 0x3f400000
[   10.958582] NDCB2: 0x00000000
[   10.958582] NDCB3: 0x00000000
[   10.977575] Bad eraseblock 253 at 0x000001fa0000
[   10.982426] nand: nand_do_read_oob: from = 0x01fc0000, len = 64
[   10.988452] marvell-nfc pxa3xx-nand: 
[   10.988452] NDCR:  0x9d079fff
[   10.988452] NDCB0: 0x000d3000
[   10.988452] NDCB1: 0x3f800000
[   10.988452] NDCB2: 0x00000000
[   10.988452] NDCB3: 0x00000000
[   11.007336] Bad eraseblock 254 at 0x000001fc0000
[   11.012204] nand: nand_do_read_oob: from = 0x01fe0000, len = 64
[   11.018226] marvell-nfc pxa3xx-nand: 
[   11.018226] NDCR:  0x9d079fff
[   11.018226] NDCB0: 0x000d3000
[   11.018226] NDCB1: 0x3fc00000
[   11.018226] NDCB2: 0x00000000
[   11.018226] NDCB3: 0x00000000
[   11.037111] Bad eraseblock 255 at 0x000001fe0000
[   11.041971] nand: nand_do_read_oob: from = 0x02000000, len = 64
[   11.047994] marvell-nfc pxa3xx-nand: 
[   11.047994] NDCR:  0x9d079fff
[   11.047994] NDCB0: 0x000d3000
[   11.047994] NDCB1: 0x40000000
[   11.047994] NDCB2: 0x00000000
[   11.047994] NDCB3: 0x00000000
[   11.066878] Bad eraseblock 256 at 0x000002000000
[   11.071736] nand: nand_do_read_oob: from = 0x02020000, len = 64
[   11.077758] marvell-nfc pxa3xx-nand: 
[   11.077758] NDCR:  0x9d079fff
[   11.077758] NDCB0: 0x000d3000
[   11.077758] NDCB1: 0x40400000
[   11.077758] NDCB2: 0x00000000
[   11.077758] NDCB3: 0x00000000
[   11.096643] Bad eraseblock 257 at 0x000002020000
[   11.101500] nand: nand_do_read_oob: from = 0x02040000, len = 64
[   11.107524] marvell-nfc pxa3xx-nand: 
[   11.107524] NDCR:  0x9d079fff
[   11.107524] NDCB0: 0x000d3000
[   11.107524] NDCB1: 0x40800000
[   11.107524] NDCB2: 0x00000000
[   11.107524] NDCB3: 0x00000000
[   11.126407] Bad eraseblock 258 at 0x000002040000
[   11.131260] nand: nand_do_read_oob: from = 0x02060000, len = 64
[   11.137283] marvell-nfc pxa3xx-nand: 
[   11.137283] NDCR:  0x9d079fff
[   11.137283] NDCB0: 0x000d3000
[   11.137283] NDCB1: 0x40c00000
[   11.137283] NDCB2: 0x00000000
[   11.137283] NDCB3: 0x00000000
[   11.156165] Bad eraseblock 259 at 0x000002060000
[   11.161024] nand: nand_do_read_oob: from = 0x02080000, len = 64
[   11.167050] marvell-nfc pxa3xx-nand: 
[   11.167050] NDCR:  0x9d079fff
[   11.167050] NDCB0: 0x000d3000
[   11.167050] NDCB1: 0x41000000
[   11.167050] NDCB2: 0x00000000
[   11.167050] NDCB3: 0x00000000
[   11.185934] Bad eraseblock 260 at 0x000002080000
[   11.190810] nand: nand_do_read_oob: from = 0x020a0000, len = 64
[   11.196833] marvell-nfc pxa3xx-nand: 
[   11.196833] NDCR:  0x9d079fff
[   11.196833] NDCB0: 0x000d3000
[   11.196833] NDCB1: 0x41400000
[   11.196833] NDCB2: 0x00000000
[   11.196833] NDCB3: 0x00000000
[   11.215718] Bad eraseblock 261 at 0x0000020a0000
[   11.220575] nand: nand_do_read_oob: from = 0x020c0000, len = 64
[   11.226599] marvell-nfc pxa3xx-nand: 
[   11.226599] NDCR:  0x9d079fff
[   11.226599] NDCB0: 0x000d3000
[   11.226599] NDCB1: 0x41800000
[   11.226599] NDCB2: 0x00000000
[   11.226599] NDCB3: 0x00000000
[   11.245482] Bad eraseblock 262 at 0x0000020c0000
[   11.250340] nand: nand_do_read_oob: from = 0x020e0000, len = 64
[   11.256364] marvell-nfc pxa3xx-nand: 
[   11.256364] NDCR:  0x9d079fff
[   11.256364] NDCB0: 0x000d3000
[   11.256364] NDCB1: 0x41c00000
[   11.256364] NDCB2: 0x00000000
[   11.256364] NDCB3: 0x00000000
[   11.275246] Bad eraseblock 263 at 0x0000020e0000
[   11.280108] nand: nand_do_read_oob: from = 0x02100000, len = 64
[   11.286131] marvell-nfc pxa3xx-nand: 
[   11.286131] NDCR:  0x9d079fff
[   11.286131] NDCB0: 0x000d3000
[   11.286131] NDCB1: 0x42000000
[   11.286131] NDCB2: 0x00000000
[   11.286131] NDCB3: 0x00000000
[   11.305013] Bad eraseblock 264 at 0x000002100000
[   11.309866] nand: nand_do_read_oob: from = 0x02120000, len = 64
[   11.315888] marvell-nfc pxa3xx-nand: 
[   11.315888] NDCR:  0x9d079fff
[   11.315888] NDCB0: 0x000d3000
[   11.315888] NDCB1: 0x42400000
[   11.315888] NDCB2: 0x00000000
[   11.315888] NDCB3: 0x00000000
[   11.334770] Bad eraseblock 265 at 0x000002120000
[   11.339622] nand: nand_do_read_oob: from = 0x02140000, len = 64
[   11.345645] marvell-nfc pxa3xx-nand: 
[   11.345645] NDCR:  0x9d079fff
[   11.345645] NDCB0: 0x000d3000
[   11.345645] NDCB1: 0x42800000
[   11.345645] NDCB2: 0x00000000
[   11.345645] NDCB3: 0x00000000
[   11.364528] Bad eraseblock 266 at 0x000002140000
[   11.369389] nand: nand_do_read_oob: from = 0x02160000, len = 64
[   11.375411] marvell-nfc pxa3xx-nand: 
[   11.375411] NDCR:  0x9d079fff
[   11.375411] NDCB0: 0x000d3000
[   11.375411] NDCB1: 0x42c00000
[   11.375411] NDCB2: 0x00000000
[   11.375411] NDCB3: 0x00000000
[   11.394297] Bad eraseblock 267 at 0x000002160000
[   11.399156] nand: nand_do_read_oob: from = 0x02180000, len = 64
[   11.405178] marvell-nfc pxa3xx-nand: 
[   11.405178] NDCR:  0x9d079fff
[   11.405178] NDCB0: 0x000d3000
[   11.405178] NDCB1: 0x43000000
[   11.405178] NDCB2: 0x00000000
[   11.405178] NDCB3: 0x00000000
[   11.424063] Bad eraseblock 268 at 0x000002180000
[   11.428921] nand: nand_do_read_oob: from = 0x021a0000, len = 64
[   11.434944] marvell-nfc pxa3xx-nand: 
[   11.434944] NDCR:  0x9d079fff
[   11.434944] NDCB0: 0x000d3000
[   11.434944] NDCB1: 0x43400000
[   11.434944] NDCB2: 0x00000000
[   11.434944] NDCB3: 0x00000000
[   11.453828] Bad eraseblock 269 at 0x0000021a0000
[   11.458530] nand: nand_do_read_oob: from = 0x021c0000, len = 64
[   11.464707] marvell-nfc pxa3xx-nand: 
[   11.464707] NDCR:  0x9d079fff
[   11.464707] NDCB0: 0x000d3000
[   11.464707] NDCB1: 0x43800000
[   11.464707] NDCB2: 0x00000000
[   11.464707] NDCB3: 0x00000000
[   11.483605] Bad eraseblock 270 at 0x0000021c0000
[   11.488303] nand: nand_do_read_oob: from = 0x021e0000, len = 64
[   11.494480] marvell-nfc pxa3xx-nand: 
[   11.494480] NDCR:  0x9d079fff
[   11.494480] NDCB0: 0x000d3000
[   11.494480] NDCB1: 0x43c00000
[   11.494480] NDCB2: 0x00000000
[   11.494480] NDCB3: 0x00000000
[   11.513370] Bad eraseblock 271 at 0x0000021e0000
[   11.518070] nand: nand_do_read_oob: from = 0x02200000, len = 64
[   11.524247] marvell-nfc pxa3xx-nand: 
[   11.524247] NDCR:  0x9d079fff
[   11.524247] NDCB0: 0x000d3000
[   11.524247] NDCB1: 0x44000000
[   11.524247] NDCB2: 0x00000000
[   11.524247] NDCB3: 0x00000000
[   11.543147] Bad eraseblock 272 at 0x000002200000
[   11.547845] nand: nand_do_read_oob: from = 0x02220000, len = 64
[   11.554024] marvell-nfc pxa3xx-nand: 
[   11.554024] NDCR:  0x9d079fff
[   11.554024] NDCB0: 0x000d3000
[   11.554024] NDCB1: 0x44400000
[   11.554024] NDCB2: 0x00000000
[   11.554024] NDCB3: 0x00000000
[   11.572920] Bad eraseblock 273 at 0x000002220000
[   11.577619] nand: nand_do_read_oob: from = 0x02240000, len = 64
[   11.583797] marvell-nfc pxa3xx-nand: 
[   11.583797] NDCR:  0x9d079fff
[   11.583797] NDCB0: 0x000d3000
[   11.583797] NDCB1: 0x44800000
[   11.583797] NDCB2: 0x00000000
[   11.583797] NDCB3: 0x00000000
[   11.602698] Bad eraseblock 274 at 0x000002240000
[   11.607394] nand: nand_do_read_oob: from = 0x02260000, len = 64
[   11.613570] marvell-nfc pxa3xx-nand: 
[   11.613570] NDCR:  0x9d079fff
[   11.613570] NDCB0: 0x000d3000
[   11.613570] NDCB1: 0x44c00000
[   11.613570] NDCB2: 0x00000000
[   11.613570] NDCB3: 0x00000000
[   11.632467] Bad eraseblock 275 at 0x000002260000
[   11.637169] nand: nand_do_read_oob: from = 0x02280000, len = 64
[   11.643350] marvell-nfc pxa3xx-nand: 
[   11.643350] NDCR:  0x9d079fff
[   11.643350] NDCB0: 0x000d3000
[   11.643350] NDCB1: 0x45000000
[   11.643350] NDCB2: 0x00000000
[   11.643350] NDCB3: 0x00000000
[   11.662246] Bad eraseblock 276 at 0x000002280000
[   11.666944] nand: nand_do_read_oob: from = 0x022a0000, len = 64
[   11.673121] marvell-nfc pxa3xx-nand: 
[   11.673121] NDCR:  0x9d079fff
[   11.673121] NDCB0: 0x000d3000
[   11.673121] NDCB1: 0x45400000
[   11.673121] NDCB2: 0x00000000
[   11.673121] NDCB3: 0x00000000
[   11.692022] Bad eraseblock 277 at 0x0000022a0000
[   11.696719] nand: nand_do_read_oob: from = 0x022c0000, len = 64
[   11.702897] marvell-nfc pxa3xx-nand: 
[   11.702897] NDCR:  0x9d079fff
[   11.702897] NDCB0: 0x000d3000
[   11.702897] NDCB1: 0x45800000
[   11.702897] NDCB2: 0x00000000
[   11.702897] NDCB3: 0x00000000
[   11.721798] Bad eraseblock 278 at 0x0000022c0000
[   11.726494] nand: nand_do_read_oob: from = 0x022e0000, len = 64
[   11.732674] marvell-nfc pxa3xx-nand: 
[   11.732674] NDCR:  0x9d079fff
[   11.732674] NDCB0: 0x000d3000
[   11.732674] NDCB1: 0x45c00000
[   11.732674] NDCB2: 0x00000000
[   11.732674] NDCB3: 0x00000000
[   11.751568] Bad eraseblock 279 at 0x0000022e0000
[   11.756268] nand: nand_do_read_oob: from = 0x02300000, len = 64
[   11.762447] marvell-nfc pxa3xx-nand: 
[   11.762447] NDCR:  0x9d079fff
[   11.762447] NDCB0: 0x000d3000
[   11.762447] NDCB1: 0x46000000
[   11.762447] NDCB2: 0x00000000
[   11.762447] NDCB3: 0x00000000
[   11.781346] Bad eraseblock 280 at 0x000002300000
[   11.786041] nand: nand_do_read_oob: from = 0x02320000, len = 64
[   11.792220] marvell-nfc pxa3xx-nand: 
[   11.792220] NDCR:  0x9d079fff
[   11.792220] NDCB0: 0x000d3000
[   11.792220] NDCB1: 0x46400000
[   11.792220] NDCB2: 0x00000000
[   11.792220] NDCB3: 0x00000000
[   11.811110] Bad eraseblock 281 at 0x000002320000
[   11.815809] nand: nand_do_read_oob: from = 0x02340000, len = 64
[   11.821987] marvell-nfc pxa3xx-nand: 
[   11.821987] NDCR:  0x9d079fff
[   11.821987] NDCB0: 0x000d3000
[   11.821987] NDCB1: 0x46800000
[   11.821987] NDCB2: 0x00000000
[   11.821987] NDCB3: 0x00000000
[   11.840906] Bad eraseblock 282 at 0x000002340000
[   11.845602] nand: nand_do_read_oob: from = 0x02360000, len = 64
[   11.851778] marvell-nfc pxa3xx-nand: 
[   11.851778] NDCR:  0x9d079fff
[   11.851778] NDCB0: 0x000d3000
[   11.851778] NDCB1: 0x46c00000
[   11.851778] NDCB2: 0x00000000
[   11.851778] NDCB3: 0x00000000
[   11.870669] Bad eraseblock 283 at 0x000002360000
[   11.875367] nand: nand_do_read_oob: from = 0x02380000, len = 64
[   11.881544] marvell-nfc pxa3xx-nand: 
[   11.881544] NDCR:  0x9d079fff
[   11.881544] NDCB0: 0x000d3000
[   11.881544] NDCB1: 0x47000000
[   11.881544] NDCB2: 0x00000000
[   11.881544] NDCB3: 0x00000000
[   11.900435] Bad eraseblock 284 at 0x000002380000
[   11.905133] nand: nand_do_read_oob: from = 0x023a0000, len = 64
[   11.911311] marvell-nfc pxa3xx-nand: 
[   11.911311] NDCR:  0x9d079fff
[   11.911311] NDCB0: 0x000d3000
[   11.911311] NDCB1: 0x47400000
[   11.911311] NDCB2: 0x00000000
[   11.911311] NDCB3: 0x00000000
[   11.930211] Bad eraseblock 285 at 0x0000023a0000
[   11.934907] nand: nand_do_read_oob: from = 0x023c0000, len = 64
[   11.941085] marvell-nfc pxa3xx-nand: 
[   11.941085] NDCR:  0x9d079fff
[   11.941085] NDCB0: 0x000d3000
[   11.941085] NDCB1: 0x47800000
[   11.941085] NDCB2: 0x00000000
[   11.941085] NDCB3: 0x00000000
[   11.959983] Bad eraseblock 286 at 0x0000023c0000
[   11.964681] nand: nand_do_read_oob: from = 0x023e0000, len = 64
[   11.970859] marvell-nfc pxa3xx-nand: 
[   11.970859] NDCR:  0x9d079fff
[   11.970859] NDCB0: 0x000d3000
[   11.970859] NDCB1: 0x47c00000
[   11.970859] NDCB2: 0x00000000
[   11.970859] NDCB3: 0x00000000
[   11.989751] Bad eraseblock 287 at 0x0000023e0000
[   11.994449] nand: nand_do_read_oob: from = 0x02400000, len = 64
[   12.000627] marvell-nfc pxa3xx-nand: 
[   12.000627] NDCR:  0x9d079fff
[   12.000627] NDCB0: 0x000d3000
[   12.000627] NDCB1: 0x48000000
[   12.000627] NDCB2: 0x00000000
[   12.000627] NDCB3: 0x00000000
[   12.019526] Bad eraseblock 288 at 0x000002400000
[   12.024224] nand: nand_do_read_oob: from = 0x02420000, len = 64
[   12.030401] marvell-nfc pxa3xx-nand: 
[   12.030401] NDCR:  0x9d079fff
[   12.030401] NDCB0: 0x000d3000
[   12.030401] NDCB1: 0x48400000
[   12.030401] NDCB2: 0x00000000
[   12.030401] NDCB3: 0x00000000
[   12.049300] Bad eraseblock 289 at 0x000002420000
[   12.053998] nand: nand_do_read_oob: from = 0x02440000, len = 64
[   12.060175] marvell-nfc pxa3xx-nand: 
[   12.060175] NDCR:  0x9d079fff
[   12.060175] NDCB0: 0x000d3000
[   12.060175] NDCB1: 0x48800000
[   12.060175] NDCB2: 0x00000000
[   12.060175] NDCB3: 0x00000000
[   12.079067] Bad eraseblock 290 at 0x000002440000
[   12.083765] nand: nand_do_read_oob: from = 0x02460000, len = 64
[   12.090461] marvell-nfc pxa3xx-nand: 
[   12.090461] NDCR:  0x9d079fff
[   12.090461] NDCB0: 0x000d3000
[   12.090461] NDCB1: 0x48c00000
[   12.090461] NDCB2: 0x00000000
[   12.090461] NDCB3: 0x00000000
[   12.109442] Bad eraseblock 291 at 0x000002460000
[   12.114147] nand: nand_do_read_oob: from = 0x02480000, len = 64
[   12.120332] marvell-nfc pxa3xx-nand: 
[   12.120332] NDCR:  0x9d079fff
[   12.120332] NDCB0: 0x000d3000
[   12.120332] NDCB1: 0x49000000
[   12.120332] NDCB2: 0x00000000
[   12.120332] NDCB3: 0x00000000
[   12.139228] Bad eraseblock 292 at 0x000002480000
[   12.143925] nand: nand_do_read_oob: from = 0x024a0000, len = 64
[   12.150105] marvell-nfc pxa3xx-nand: 
[   12.150105] NDCR:  0x9d079fff
[   12.150105] NDCB0: 0x000d3000
[   12.150105] NDCB1: 0x49400000
[   12.150105] NDCB2: 0x00000000
[   12.150105] NDCB3: 0x00000000
[   12.169004] Bad eraseblock 293 at 0x0000024a0000
[   12.173701] nand: nand_do_read_oob: from = 0x024c0000, len = 64
[   12.179880] marvell-nfc pxa3xx-nand: 
[   12.179880] NDCR:  0x9d079fff
[   12.179880] NDCB0: 0x000d3000
[   12.179880] NDCB1: 0x49800000
[   12.179880] NDCB2: 0x00000000
[   12.179880] NDCB3: 0x00000000
[   12.198842] Bad eraseblock 294 at 0x0000024c0000
[   12.203547] nand: nand_do_read_oob: from = 0x024e0000, len = 64
[   12.209724] marvell-nfc pxa3xx-nand: 
[   12.209724] NDCR:  0x9d079fff
[   12.209724] NDCB0: 0x000d3000
[   12.209724] NDCB1: 0x49c00000
[   12.209724] NDCB2: 0x00000000
[   12.209724] NDCB3: 0x00000000
[   12.228610] Bad eraseblock 295 at 0x0000024e0000
[   12.233452] nand: nand_do_read_oob: from = 0x02500000, len = 64
[   12.239612] marvell-nfc pxa3xx-nand: 
[   12.239612] NDCR:  0x9d079fff
[   12.239612] NDCB0: 0x000d3000
[   12.239612] NDCB1: 0x4a000000
[   12.239612] NDCB2: 0x00000000
[   12.239612] NDCB3: 0x00000000
[   12.258498] Bad eraseblock 296 at 0x000002500000
[   12.263355] nand: nand_do_read_oob: from = 0x02520000, len = 64
[   12.269528] marvell-nfc pxa3xx-nand: 
[   12.269528] NDCR:  0x9d079fff
[   12.269528] NDCB0: 0x000d3000
[   12.269528] NDCB1: 0x4a400000
[   12.269528] NDCB2: 0x00000000
[   12.269528] NDCB3: 0x00000000
[   12.288410] Bad eraseblock 297 at 0x000002520000
[   12.293266] nand: nand_do_read_oob: from = 0x02540000, len = 64
[   12.299439] marvell-nfc pxa3xx-nand: 
[   12.299439] NDCR:  0x9d079fff
[   12.299439] NDCB0: 0x000d3000
[   12.299439] NDCB1: 0x4a800000
[   12.299439] NDCB2: 0x00000000
[   12.299439] NDCB3: 0x00000000
[   12.318322] Bad eraseblock 298 at 0x000002540000
[   12.323180] nand: nand_do_read_oob: from = 0x02560000, len = 64
[   12.329354] marvell-nfc pxa3xx-nand: 
[   12.329354] NDCR:  0x9d079fff
[   12.329354] NDCB0: 0x000d3000
[   12.329354] NDCB1: 0x4ac00000
[   12.329354] NDCB2: 0x00000000
[   12.329354] NDCB3: 0x00000000
[   12.348234] Bad eraseblock 299 at 0x000002560000
[   12.353093] nand: nand_do_read_oob: from = 0x02580000, len = 64
[   12.359268] marvell-nfc pxa3xx-nand: 
[   12.359268] NDCR:  0x9d079fff
[   12.359268] NDCB0: 0x000d3000
[   12.359268] NDCB1: 0x4b000000
[   12.359268] NDCB2: 0x00000000
[   12.359268] NDCB3: 0x00000000
[   12.378157] Bad eraseblock 300 at 0x000002580000
[   12.383014] nand: nand_do_read_oob: from = 0x025a0000, len = 64
[   12.389189] marvell-nfc pxa3xx-nand: 
[   12.389189] NDCR:  0x9d079fff
[   12.389189] NDCB0: 0x000d3000
[   12.389189] NDCB1: 0x4b400000
[   12.389189] NDCB2: 0x00000000
[   12.389189] NDCB3: 0x00000000
[   12.408093] Bad eraseblock 301 at 0x0000025a0000
[   12.412952] nand: nand_do_read_oob: from = 0x025c0000, len = 64
[   12.419127] marvell-nfc pxa3xx-nand: 
[   12.419127] NDCR:  0x9d079fff
[   12.419127] NDCB0: 0x000d3000
[   12.419127] NDCB1: 0x4b800000
[   12.419127] NDCB2: 0x00000000
[   12.419127] NDCB3: 0x00000000
[   12.438008] Bad eraseblock 302 at 0x0000025c0000
[   12.442864] nand: nand_do_read_oob: from = 0x025e0000, len = 64
[   12.449039] marvell-nfc pxa3xx-nand: 
[   12.449039] NDCR:  0x9d079fff
[   12.449039] NDCB0: 0x000d3000
[   12.449039] NDCB1: 0x4bc00000
[   12.449039] NDCB2: 0x00000000
[   12.449039] NDCB3: 0x00000000
[   12.467919] Bad eraseblock 303 at 0x0000025e0000
[   12.472777] nand: nand_do_read_oob: from = 0x02600000, len = 64
[   12.478952] marvell-nfc pxa3xx-nand: 
[   12.478952] NDCR:  0x9d079fff
[   12.478952] NDCB0: 0x000d3000
[   12.478952] NDCB1: 0x4c000000
[   12.478952] NDCB2: 0x00000000
[   12.478952] NDCB3: 0x00000000
[   12.497834] Bad eraseblock 304 at 0x000002600000
[   12.502690] nand: nand_do_read_oob: from = 0x02620000, len = 64
[   12.508864] marvell-nfc pxa3xx-nand: 
[   12.508864] NDCR:  0x9d079fff
[   12.508864] NDCB0: 0x000d3000
[   12.508864] NDCB1: 0x4c400000
[   12.508864] NDCB2: 0x00000000
[   12.508864] NDCB3: 0x00000000
[   12.527745] Bad eraseblock 305 at 0x000002620000
[   12.532601] nand: nand_do_read_oob: from = 0x02640000, len = 64
[   12.538626] marvell-nfc pxa3xx-nand: 
[   12.538626] NDCR:  0x9d079fff
[   12.538626] NDCB0: 0x000d3000
[   12.538626] NDCB1: 0x4c800000
[   12.538626] NDCB2: 0x00000000
[   12.538626] NDCB3: 0x00000000
[   12.557622] Bad eraseblock 306 at 0x000002640000
[   12.562479] nand: nand_do_read_oob: from = 0x02660000, len = 64
[   12.568505] marvell-nfc pxa3xx-nand: 
[   12.568505] NDCR:  0x9d079fff
[   12.568505] NDCB0: 0x000d3000
[   12.568505] NDCB1: 0x4cc00000
[   12.568505] NDCB2: 0x00000000
[   12.568505] NDCB3: 0x00000000
[   12.587389] Bad eraseblock 307 at 0x000002660000
[   12.592247] nand: nand_do_read_oob: from = 0x02680000, len = 64
[   12.598272] marvell-nfc pxa3xx-nand: 
[   12.598272] NDCR:  0x9d079fff
[   12.598272] NDCB0: 0x000d3000
[   12.598272] NDCB1: 0x4d000000
[   12.598272] NDCB2: 0x00000000
[   12.598272] NDCB3: 0x00000000
[   12.617155] Bad eraseblock 308 at 0x000002680000
[   12.622013] nand: nand_do_read_oob: from = 0x026a0000, len = 64
[   12.628038] marvell-nfc pxa3xx-nand: 
[   12.628038] NDCR:  0x9d079fff
[   12.628038] NDCB0: 0x000d3000
[   12.628038] NDCB1: 0x4d400000
[   12.628038] NDCB2: 0x00000000
[   12.628038] NDCB3: 0x00000000
[   12.646920] Bad eraseblock 309 at 0x0000026a0000
[   12.651782] nand: nand_do_read_oob: from = 0x026c0000, len = 64
[   12.657804] marvell-nfc pxa3xx-nand: 
[   12.657804] NDCR:  0x9d079fff
[   12.657804] NDCB0: 0x000d3000
[   12.657804] NDCB1: 0x4d800000
[   12.657804] NDCB2: 0x00000000
[   12.657804] NDCB3: 0x00000000
[   12.676689] Bad eraseblock 310 at 0x0000026c0000
[   12.681547] nand: nand_do_read_oob: from = 0x026e0000, len = 64
[   12.687570] marvell-nfc pxa3xx-nand: 
[   12.687570] NDCR:  0x9d079fff
[   12.687570] NDCB0: 0x000d3000
[   12.687570] NDCB1: 0x4dc00000
[   12.687570] NDCB2: 0x00000000
[   12.687570] NDCB3: 0x00000000
[   12.706453] Bad eraseblock 311 at 0x0000026e0000
[   12.711313] nand: nand_do_read_oob: from = 0x02700000, len = 64
[   12.717336] marvell-nfc pxa3xx-nand: 
[   12.717336] NDCR:  0x9d079fff
[   12.717336] NDCB0: 0x000d3000
[   12.717336] NDCB1: 0x4e000000
[   12.717336] NDCB2: 0x00000000
[   12.717336] NDCB3: 0x00000000
[   12.736219] Bad eraseblock 312 at 0x000002700000
[   12.741078] nand: nand_do_read_oob: from = 0x02720000, len = 64
[   12.747101] marvell-nfc pxa3xx-nand: 
[   12.747101] NDCR:  0x9d079fff
[   12.747101] NDCB0: 0x000d3000
[   12.747101] NDCB1: 0x4e400000
[   12.747101] NDCB2: 0x00000000
[   12.747101] NDCB3: 0x00000000
[   12.765985] Bad eraseblock 313 at 0x000002720000
[   12.770844] nand: nand_do_read_oob: from = 0x02740000, len = 64
[   12.776867] marvell-nfc pxa3xx-nand: 
[   12.776867] NDCR:  0x9d079fff
[   12.776867] NDCB0: 0x000d3000
[   12.776867] NDCB1: 0x4e800000
[   12.776867] NDCB2: 0x00000000
[   12.776867] NDCB3: 0x00000000
[   12.795751] Bad eraseblock 314 at 0x000002740000
[   12.800612] nand: nand_do_read_oob: from = 0x02760000, len = 64
[   12.806634] marvell-nfc pxa3xx-nand: 
[   12.806634] NDCR:  0x9d079fff
[   12.806634] NDCB0: 0x000d3000
[   12.806634] NDCB1: 0x4ec00000
[   12.806634] NDCB2: 0x00000000
[   12.806634] NDCB3: 0x00000000
[   12.825517] Bad eraseblock 315 at 0x000002760000
[   12.830377] nand: nand_do_read_oob: from = 0x02780000, len = 64
[   12.836399] marvell-nfc pxa3xx-nand: 
[   12.836399] NDCR:  0x9d079fff
[   12.836399] NDCB0: 0x000d3000
[   12.836399] NDCB1: 0x4f000000
[   12.836399] NDCB2: 0x00000000
[   12.836399] NDCB3: 0x00000000
[   12.855284] Bad eraseblock 316 at 0x000002780000
[   12.860143] nand: nand_do_read_oob: from = 0x027a0000, len = 64
[   12.866167] marvell-nfc pxa3xx-nand: 
[   12.866167] NDCR:  0x9d079fff
[   12.866167] NDCB0: 0x000d3000
[   12.866167] NDCB1: 0x4f400000
[   12.866167] NDCB2: 0x00000000
[   12.866167] NDCB3: 0x00000000
[   12.885052] Bad eraseblock 317 at 0x0000027a0000
[   12.889910] nand: nand_do_read_oob: from = 0x027c0000, len = 64
[   12.895931] marvell-nfc pxa3xx-nand: 
[   12.895931] NDCR:  0x9d079fff
[   12.895931] NDCB0: 0x000d3000
[   12.895931] NDCB1: 0x4f800000
[   12.895931] NDCB2: 0x00000000
[   12.895931] NDCB3: 0x00000000
[   12.914817] Bad eraseblock 318 at 0x0000027c0000
[   12.919674] nand: nand_do_read_oob: from = 0x027e0000, len = 64
[   12.925698] marvell-nfc pxa3xx-nand: 
[   12.925698] NDCR:  0x9d079fff
[   12.925698] NDCB0: 0x000d3000
[   12.925698] NDCB1: 0x4fc00000
[   12.925698] NDCB2: 0x00000000
[   12.925698] NDCB3: 0x00000000
[   12.944581] Bad eraseblock 319 at 0x0000027e0000
[   12.949443] nand: nand_do_read_oob: from = 0x02800000, len = 64
[   12.955465] marvell-nfc pxa3xx-nand: 
[   12.955465] NDCR:  0x9d079fff
[   12.955465] NDCB0: 0x000d3000
[   12.955465] NDCB1: 0x50000000
[   12.955465] NDCB2: 0x00000000
[   12.955465] NDCB3: 0x00000000
[   12.974349] Bad eraseblock 320 at 0x000002800000
[   12.979225] nand: nand_do_read_oob: from = 0x02820000, len = 64
[   12.985249] marvell-nfc pxa3xx-nand: 
[   12.985249] NDCR:  0x9d079fff
[   12.985249] NDCB0: 0x000d3000
[   12.985249] NDCB1: 0x50400000
[   12.985249] NDCB2: 0x00000000
[   12.985249] NDCB3: 0x00000000
[   13.004132] Bad eraseblock 321 at 0x000002820000
[   13.008999] nand: nand_do_read_oob: from = 0x02840000, len = 64
[   13.015023] marvell-nfc pxa3xx-nand: 
[   13.015023] NDCR:  0x9d079fff
[   13.015023] NDCB0: 0x000d3000
[   13.015023] NDCB1: 0x50800000
[   13.015023] NDCB2: 0x00000000
[   13.015023] NDCB3: 0x00000000
[   13.033943] nand: nand_do_read_oob: from = 0x02860000, len = 64
[   13.040143] marvell-nfc pxa3xx-nand: 
[   13.040143] NDCR:  0x9d079fff
[   13.040143] NDCB0: 0x000d3000
[   13.040143] NDCB1: 0x50c00000
[   13.040143] NDCB2: 0x00000000
[   13.040143] NDCB3: 0x00000000
[   13.059073] nand: nand_do_read_oob: from = 0x02880000, len = 64
[   13.065105] marvell-nfc pxa3xx-nand: 
[   13.065105] NDCR:  0x9d079fff
[   13.065105] NDCB0: 0x000d3000
[   13.065105] NDCB1: 0x51000000
[   13.065105] NDCB2: 0x00000000
[   13.065105] NDCB3: 0x00000000
[   13.084035] nand: nand_do_read_oob: from = 0x028a0000, len = 64
[   13.090243] marvell-nfc pxa3xx-nand: 
[   13.090243] NDCR:  0x9d079fff
[   13.090243] NDCB0: 0x000d3000
[   13.090243] NDCB1: 0x51400000
[   13.090243] NDCB2: 0x00000000
[   13.090243] NDCB3: 0x00000000
[   13.109171] nand: nand_do_read_oob: from = 0x028c0000, len = 64
[   13.115203] marvell-nfc pxa3xx-nand: 
[   13.115203] NDCR:  0x9d079fff
[   13.115203] NDCB0: 0x000d3000
[   13.115203] NDCB1: 0x51800000
[   13.115203] NDCB2: 0x00000000
[   13.115203] NDCB3: 0x00000000
[   13.134135] nand: nand_do_read_oob: from = 0x028e0000, len = 64
[   13.140342] marvell-nfc pxa3xx-nand: 
[   13.140342] NDCR:  0x9d079fff
[   13.140342] NDCB0: 0x000d3000
[   13.140342] NDCB1: 0x51c00000
[   13.140342] NDCB2: 0x00000000
[   13.140342] NDCB3: 0x00000000
[   13.159271] nand: nand_do_read_oob: from = 0x02900000, len = 64
[   13.165301] marvell-nfc pxa3xx-nand: 
[   13.165301] NDCR:  0x9d079fff
[   13.165301] NDCB0: 0x000d3000
[   13.165301] NDCB1: 0x52000000
[   13.165301] NDCB2: 0x00000000
[   13.165301] NDCB3: 0x00000000
[   13.184240] nand: nand_do_read_oob: from = 0x02920000, len = 64
[   13.190443] marvell-nfc pxa3xx-nand: 
[   13.190443] NDCR:  0x9d079fff
[   13.190443] NDCB0: 0x000d3000
[   13.190443] NDCB1: 0x52400000
[   13.190443] NDCB2: 0x00000000
[   13.190443] NDCB3: 0x00000000
[   13.209368] nand: nand_do_read_oob: from = 0x02940000, len = 64
[   13.215400] marvell-nfc pxa3xx-nand: 
[   13.215400] NDCR:  0x9d079fff
[   13.215400] NDCB0: 0x000d3000
[   13.215400] NDCB1: 0x52800000
[   13.215400] NDCB2: 0x00000000
[   13.215400] NDCB3: 0x00000000
[   13.234332] nand: nand_do_read_oob: from = 0x02960000, len = 64
[   13.240539] marvell-nfc pxa3xx-nand: 
[   13.240539] NDCR:  0x9d079fff
[   13.240539] NDCB0: 0x000d3000
[   13.240539] NDCB1: 0x52c00000
[   13.240539] NDCB2: 0x00000000
[   13.240539] NDCB3: 0x00000000
[   13.259465] nand: nand_do_read_oob: from = 0x02980000, len = 64
[   13.265498] marvell-nfc pxa3xx-nand: 
[   13.265498] NDCR:  0x9d079fff
[   13.265498] NDCB0: 0x000d3000
[   13.265498] NDCB1: 0x53000000
[   13.265498] NDCB2: 0x00000000
[   13.265498] NDCB3: 0x00000000
[   13.284434] nand: nand_do_read_oob: from = 0x029a0000, len = 64
[   13.290639] marvell-nfc pxa3xx-nand: 
[   13.290639] NDCR:  0x9d079fff
[   13.290639] NDCB0: 0x000d3000
[   13.290639] NDCB1: 0x53400000
[   13.290639] NDCB2: 0x00000000
[   13.290639] NDCB3: 0x00000000
[   13.309566] nand: nand_do_read_oob: from = 0x029c0000, len = 64
[   13.315596] marvell-nfc pxa3xx-nand: 
[   13.315596] NDCR:  0x9d079fff
[   13.315596] NDCB0: 0x000d3000
[   13.315596] NDCB1: 0x53800000
[   13.315596] NDCB2: 0x00000000
[   13.315596] NDCB3: 0x00000000
[   13.334532] nand: nand_do_read_oob: from = 0x029e0000, len = 64
[   13.340734] marvell-nfc pxa3xx-nand: 
[   13.340734] NDCR:  0x9d079fff
[   13.340734] NDCB0: 0x000d3000
[   13.340734] NDCB1: 0x53c00000
[   13.340734] NDCB2: 0x00000000
[   13.340734] NDCB3: 0x00000000
[   13.359662] nand: nand_do_read_oob: from = 0x02a00000, len = 64
[   13.365696] marvell-nfc pxa3xx-nand: 
[   13.365696] NDCR:  0x9d079fff
[   13.365696] NDCB0: 0x000d3000
[   13.365696] NDCB1: 0x54000000
[   13.365696] NDCB2: 0x00000000
[   13.365696] NDCB3: 0x00000000
[   13.384629] nand: nand_do_read_oob: from = 0x02a20000, len = 64
[   13.390833] marvell-nfc pxa3xx-nand: 
[   13.390833] NDCR:  0x9d079fff
[   13.390833] NDCB0: 0x000d3000
[   13.390833] NDCB1: 0x54400000
[   13.390833] NDCB2: 0x00000000
[   13.390833] NDCB3: 0x00000000
[   13.409766] nand: nand_do_read_oob: from = 0x02a40000, len = 64
[   13.415802] marvell-nfc pxa3xx-nand: 
[   13.415802] NDCR:  0x9d079fff
[   13.415802] NDCB0: 0x000d3000
[   13.415802] NDCB1: 0x54800000
[   13.415802] NDCB2: 0x00000000
[   13.415802] NDCB3: 0x00000000
[   13.434704] Bad eraseblock 338 at 0x000002a40000
[   13.439564] nand: nand_do_read_oob: from = 0x02a60000, len = 64
[   13.445586] marvell-nfc pxa3xx-nand: 
[   13.445586] NDCR:  0x9d079fff
[   13.445586] NDCB0: 0x000d3000
[   13.445586] NDCB1: 0x54c00000
[   13.445586] NDCB2: 0x00000000
[   13.445586] NDCB3: 0x00000000
[   13.464468] Bad eraseblock 339 at 0x000002a60000
[   13.469328] nand: nand_do_read_oob: from = 0x02a80000, len = 64
[   13.475351] marvell-nfc pxa3xx-nand: 
[   13.475351] NDCR:  0x9d079fff
[   13.475351] NDCB0: 0x000d3000
[   13.475351] NDCB1: 0x55000000
[   13.475351] NDCB2: 0x00000000
[   13.475351] NDCB3: 0x00000000
[   13.494267] nand: nand_do_read_oob: from = 0x02aa0000, len = 64
[   13.500473] marvell-nfc pxa3xx-nand: 
[   13.500473] NDCR:  0x9d079fff
[   13.500473] NDCB0: 0x000d3000
[   13.500473] NDCB1: 0x55400000
[   13.500473] NDCB2: 0x00000000
[   13.500473] NDCB3: 0x00000000
[   13.519403] nand: nand_do_read_oob: from = 0x02ac0000, len = 64
[   13.525432] marvell-nfc pxa3xx-nand: 
[   13.525432] NDCR:  0x9d079fff
[   13.525432] NDCB0: 0x000d3000
[   13.525432] NDCB1: 0x55800000
[   13.525432] NDCB2: 0x00000000
[   13.525432] NDCB3: 0x00000000
[   13.544366] nand: nand_do_read_oob: from = 0x02ae0000, len = 64
[   13.550575] marvell-nfc pxa3xx-nand: 
[   13.550575] NDCR:  0x9d079fff
[   13.550575] NDCB0: 0x000d3000
[   13.550575] NDCB1: 0x55c00000
[   13.550575] NDCB2: 0x00000000
[   13.550575] NDCB3: 0x00000000
[   13.569499] nand: nand_do_read_oob: from = 0x02b00000, len = 64
[   13.575532] marvell-nfc pxa3xx-nand: 
[   13.575532] NDCR:  0x9d079fff
[   13.575532] NDCB0: 0x000d3000
[   13.575532] NDCB1: 0x56000000
[   13.575532] NDCB2: 0x00000000
[   13.575532] NDCB3: 0x00000000
[   13.594464] nand: nand_do_read_oob: from = 0x02b20000, len = 64
[   13.600669] marvell-nfc pxa3xx-nand: 
[   13.600669] NDCR:  0x9d079fff
[   13.600669] NDCB0: 0x000d3000
[   13.600669] NDCB1: 0x56400000
[   13.600669] NDCB2: 0x00000000
[   13.600669] NDCB3: 0x00000000
[   13.619617] nand: nand_do_read_oob: from = 0x02b40000, len = 64
[   13.625647] marvell-nfc pxa3xx-nand: 
[   13.625647] NDCR:  0x9d079fff
[   13.625647] NDCB0: 0x000d3000
[   13.625647] NDCB1: 0x56800000
[   13.625647] NDCB2: 0x00000000
[   13.625647] NDCB3: 0x00000000
[   13.644583] nand: nand_do_read_oob: from = 0x02b60000, len = 64
[   13.650786] marvell-nfc pxa3xx-nand: 
[   13.650786] NDCR:  0x9d079fff
[   13.650786] NDCB0: 0x000d3000
[   13.650786] NDCB1: 0x56c00000
[   13.650786] NDCB2: 0x00000000
[   13.650786] NDCB3: 0x00000000
[   13.669715] nand: nand_do_read_oob: from = 0x02b80000, len = 64
[   13.675744] marvell-nfc pxa3xx-nand: 
[   13.675744] NDCR:  0x9d079fff
[   13.675744] NDCB0: 0x000d3000
[   13.675744] NDCB1: 0x57000000
[   13.675744] NDCB2: 0x00000000
[   13.675744] NDCB3: 0x00000000
[   13.694679] nand: nand_do_read_oob: from = 0x02ba0000, len = 64
[   13.700886] marvell-nfc pxa3xx-nand: 
[   13.700886] NDCR:  0x9d079fff
[   13.700886] NDCB0: 0x000d3000
[   13.700886] NDCB1: 0x57400000
[   13.700886] NDCB2: 0x00000000
[   13.700886] NDCB3: 0x00000000
[   13.719813] nand: nand_do_read_oob: from = 0x02bc0000, len = 64
[   13.725845] marvell-nfc pxa3xx-nand: 
[   13.725845] NDCR:  0x9d079fff
[   13.725845] NDCB0: 0x000d3000
[   13.725845] NDCB1: 0x57800000
[   13.725845] NDCB2: 0x00000000
[   13.725845] NDCB3: 0x00000000
[   13.744747] Bad eraseblock 350 at 0x000002bc0000
[   13.749607] nand: nand_do_read_oob: from = 0x02be0000, len = 64
[   13.755627] marvell-nfc pxa3xx-nand: 
[   13.755627] NDCR:  0x9d079fff
[   13.755627] NDCB0: 0x000d3000
[   13.755627] NDCB1: 0x57c00000
[   13.755627] NDCB2: 0x00000000
[   13.755627] NDCB3: 0x00000000
[   13.774541] nand: nand_do_read_oob: from = 0x02c00000, len = 64
[   13.780740] marvell-nfc pxa3xx-nand: 
[   13.780740] NDCR:  0x9d079fff
[   13.780740] NDCB0: 0x000d3000
[   13.780740] NDCB1: 0x58000000
[   13.780740] NDCB2: 0x00000000
[   13.780740] NDCB3: 0x00000000
[   13.799669] nand: nand_do_read_oob: from = 0x02c20000, len = 64
[   13.805700] marvell-nfc pxa3xx-nand: 
[   13.805700] NDCR:  0x9d079fff
[   13.805700] NDCB0: 0x000d3000
[   13.805700] NDCB1: 0x58400000
[   13.805700] NDCB2: 0x00000000
[   13.805700] NDCB3: 0x00000000
[   13.824633] nand: nand_do_read_oob: from = 0x02c40000, len = 64
[   13.830838] marvell-nfc pxa3xx-nand: 
[   13.830838] NDCR:  0x9d079fff
[   13.830838] NDCB0: 0x000d3000
[   13.830838] NDCB1: 0x58800000
[   13.830838] NDCB2: 0x00000000
[   13.830838] NDCB3: 0x00000000
[   13.849736] Bad eraseblock 354 at 0x000002c40000
[   13.854434] nand: nand_do_read_oob: from = 0x02c60000, len = 64
[   13.860612] marvell-nfc pxa3xx-nand: 
[   13.860612] NDCR:  0x9d079fff
[   13.860612] NDCB0: 0x000d3000
[   13.860612] NDCB1: 0x58c00000
[   13.860612] NDCB2: 0x00000000
[   13.860612] NDCB3: 0x00000000
[   13.879510] Bad eraseblock 355 at 0x000002c60000
[   13.884206] nand: nand_do_read_oob: from = 0x02c80000, len = 64
[   13.890386] marvell-nfc pxa3xx-nand: 
[   13.890386] NDCR:  0x9d079fff
[   13.890386] NDCB0: 0x000d3000
[   13.890386] NDCB1: 0x59000000
[   13.890386] NDCB2: 0x00000000
[   13.890386] NDCB3: 0x00000000
[   13.909286] Bad eraseblock 356 at 0x000002c80000
[   13.913982] nand: nand_do_read_oob: from = 0x02ca0000, len = 64
[   13.920160] marvell-nfc pxa3xx-nand: 
[   13.920160] NDCR:  0x9d079fff
[   13.920160] NDCB0: 0x000d3000
[   13.920160] NDCB1: 0x59400000
[   13.920160] NDCB2: 0x00000000
[   13.920160] NDCB3: 0x00000000
[   13.939059] Bad eraseblock 357 at 0x000002ca0000
[   13.943758] nand: nand_do_read_oob: from = 0x02cc0000, len = 64
[   13.949935] marvell-nfc pxa3xx-nand: 
[   13.949935] NDCR:  0x9d079fff
[   13.949935] NDCB0: 0x000d3000
[   13.949935] NDCB1: 0x59800000
[   13.949935] NDCB2: 0x00000000
[   13.949935] NDCB3: 0x00000000
[   13.968867] Bad eraseblock 358 at 0x000002cc0000
[   13.973569] nand: nand_do_read_oob: from = 0x02ce0000, len = 64
[   13.979741] marvell-nfc pxa3xx-nand: 
[   13.979741] NDCR:  0x9d079fff
[   13.979741] NDCB0: 0x000d3000
[   13.979741] NDCB1: 0x59c00000
[   13.979741] NDCB2: 0x00000000
[   13.979741] NDCB3: 0x00000000
[   13.998625] Bad eraseblock 359 at 0x000002ce0000
[   14.003465] nand: nand_do_read_oob: from = 0x02d00000, len = 64
[   14.009636] marvell-nfc pxa3xx-nand: 
[   14.009636] NDCR:  0x9d079fff
[   14.009636] NDCB0: 0x000d3000
[   14.009636] NDCB1: 0x5a000000
[   14.009636] NDCB2: 0x00000000
[   14.009636] NDCB3: 0x00000000
[   14.028522] Bad eraseblock 360 at 0x000002d00000
[   14.033379] nand: nand_do_read_oob: from = 0x02d20000, len = 64
[   14.039551] marvell-nfc pxa3xx-nand: 
[   14.039551] NDCR:  0x9d079fff
[   14.039551] NDCB0: 0x000d3000
[   14.039551] NDCB1: 0x5a400000
[   14.039551] NDCB2: 0x00000000
[   14.039551] NDCB3: 0x00000000
[   14.058430] Bad eraseblock 361 at 0x000002d20000
[   14.063289] nand: nand_do_read_oob: from = 0x02d40000, len = 64
[   14.069463] marvell-nfc pxa3xx-nand: 
[   14.069463] NDCR:  0x9d079fff
[   14.069463] NDCB0: 0x000d3000
[   14.069463] NDCB1: 0x5a800000
[   14.069463] NDCB2: 0x00000000
[   14.069463] NDCB3: 0x00000000
[   14.088345] Bad eraseblock 362 at 0x000002d40000
[   14.093533] nand: nand_do_read_oob: from = 0x02d60000, len = 64
[   14.099766] marvell-nfc pxa3xx-nand: 
[   14.099766] NDCR:  0x9d079fff
[   14.099766] NDCB0: 0x000d3000
[   14.099766] NDCB1: 0x5ac00000
[   14.099766] NDCB2: 0x00000000
[   14.099766] NDCB3: 0x00000000
[   14.118873] Bad eraseblock 363 at 0x000002d60000
[   14.123585] nand: nand_do_read_oob: from = 0x02d80000, len = 64
[   14.129771] marvell-nfc pxa3xx-nand: 
[   14.129771] NDCR:  0x9d079fff
[   14.129771] NDCB0: 0x000d3000
[   14.129771] NDCB1: 0x5b000000
[   14.129771] NDCB2: 0x00000000
[   14.129771] NDCB3: 0x00000000
[   14.148757] Bad eraseblock 364 at 0x000002d80000
[   14.153462] nand: nand_do_read_oob: from = 0x02da0000, len = 64
[   14.159630] marvell-nfc pxa3xx-nand: 
[   14.159630] NDCR:  0x9d079fff
[   14.159630] NDCB0: 0x000d3000
[   14.159630] NDCB1: 0x5b400000
[   14.159630] NDCB2: 0x00000000
[   14.159630] NDCB3: 0x00000000
[   14.178515] Bad eraseblock 365 at 0x000002da0000
[   14.183394] nand: nand_do_read_oob: from = 0x02dc0000, len = 64
[   14.189573] marvell-nfc pxa3xx-nand: 
[   14.189573] NDCR:  0x9d079fff
[   14.189573] NDCB0: 0x000d3000
[   14.189573] NDCB1: 0x5b800000
[   14.189573] NDCB2: 0x00000000
[   14.189573] NDCB3: 0x00000000
[   14.208459] Bad eraseblock 366 at 0x000002dc0000
[   14.213319] nand: nand_do_read_oob: from = 0x02de0000, len = 64
[   14.219491] marvell-nfc pxa3xx-nand: 
[   14.219491] NDCR:  0x9d079fff
[   14.219491] NDCB0: 0x000d3000
[   14.219491] NDCB1: 0x5bc00000
[   14.219491] NDCB2: 0x00000000
[   14.219491] NDCB3: 0x00000000
[   14.238369] Bad eraseblock 367 at 0x000002de0000
[   14.243221] nand: nand_do_read_oob: from = 0x02e00000, len = 64
[   14.249395] marvell-nfc pxa3xx-nand: 
[   14.249395] NDCR:  0x9d079fff
[   14.249395] NDCB0: 0x000d3000
[   14.249395] NDCB1: 0x5c000000
[   14.249395] NDCB2: 0x00000000
[   14.249395] NDCB3: 0x00000000
[   14.268278] Bad eraseblock 368 at 0x000002e00000
[   14.273135] nand: nand_do_read_oob: from = 0x02e20000, len = 64
[   14.279309] marvell-nfc pxa3xx-nand: 
[   14.279309] NDCR:  0x9d079fff
[   14.279309] NDCB0: 0x000d3000
[   14.279309] NDCB1: 0x5c400000
[   14.279309] NDCB2: 0x00000000
[   14.279309] NDCB3: 0x00000000
[   14.298188] Bad eraseblock 369 at 0x000002e20000
[   14.303049] nand: nand_do_read_oob: from = 0x02e40000, len = 64
[   14.309222] marvell-nfc pxa3xx-nand: 
[   14.309222] NDCR:  0x9d079fff
[   14.309222] NDCB0: 0x000d3000
[   14.309222] NDCB1: 0x5c800000
[   14.309222] NDCB2: 0x00000000
[   14.309222] NDCB3: 0x00000000
[   14.328099] Bad eraseblock 370 at 0x000002e40000
[   14.332952] nand: nand_do_read_oob: from = 0x02e60000, len = 64
[   14.339124] marvell-nfc pxa3xx-nand: 
[   14.339124] NDCR:  0x9d079fff
[   14.339124] NDCB0: 0x000d3000
[   14.339124] NDCB1: 0x5cc00000
[   14.339124] NDCB2: 0x00000000
[   14.339124] NDCB3: 0x00000000
[   14.358005] Bad eraseblock 371 at 0x000002e60000
[   14.362864] nand: nand_do_read_oob: from = 0x02e80000, len = 64
[   14.369038] marvell-nfc pxa3xx-nand: 
[   14.369038] NDCR:  0x9d079fff
[   14.369038] NDCB0: 0x000d3000
[   14.369038] NDCB1: 0x5d000000
[   14.369038] NDCB2: 0x00000000
[   14.369038] NDCB3: 0x00000000
[   14.387917] Bad eraseblock 372 at 0x000002e80000
[   14.392775] nand: nand_do_read_oob: from = 0x02ea0000, len = 64
[   14.398949] marvell-nfc pxa3xx-nand: 
[   14.398949] NDCR:  0x9d079fff
[   14.398949] NDCB0: 0x000d3000
[   14.398949] NDCB1: 0x5d400000
[   14.398949] NDCB2: 0x00000000
[   14.398949] NDCB3: 0x00000000
[   14.417829] Bad eraseblock 373 at 0x000002ea0000
[   14.422689] nand: nand_do_read_oob: from = 0x02ec0000, len = 64
[   14.428863] marvell-nfc pxa3xx-nand: 
[   14.428863] NDCR:  0x9d079fff
[   14.428863] NDCB0: 0x000d3000
[   14.428863] NDCB1: 0x5d800000
[   14.428863] NDCB2: 0x00000000
[   14.428863] NDCB3: 0x00000000
[   14.447745] Bad eraseblock 374 at 0x000002ec0000
[   14.452599] nand: nand_do_read_oob: from = 0x02ee0000, len = 64
[   14.458626] marvell-nfc pxa3xx-nand: 
[   14.458626] NDCR:  0x9d079fff
[   14.458626] NDCB0: 0x000d3000
[   14.458626] NDCB1: 0x5dc00000
[   14.458626] NDCB2: 0x00000000
[   14.458626] NDCB3: 0x00000000
[   14.477616] Bad eraseblock 375 at 0x000002ee0000
[   14.482471] nand: nand_do_read_oob: from = 0x02f00000, len = 64
[   14.488494] marvell-nfc pxa3xx-nand: 
[   14.488494] NDCR:  0x9d079fff
[   14.488494] NDCB0: 0x000d3000
[   14.488494] NDCB1: 0x5e000000
[   14.488494] NDCB2: 0x00000000
[   14.488494] NDCB3: 0x00000000
[   14.507377] Bad eraseblock 376 at 0x000002f00000
[   14.512238] nand: nand_do_read_oob: from = 0x02f20000, len = 64
[   14.518261] marvell-nfc pxa3xx-nand: 
[   14.518261] NDCR:  0x9d079fff
[   14.518261] NDCB0: 0x000d3000
[   14.518261] NDCB1: 0x5e400000
[   14.518261] NDCB2: 0x00000000
[   14.518261] NDCB3: 0x00000000
[   14.537141] Bad eraseblock 377 at 0x000002f20000
[   14.541995] nand: nand_do_read_oob: from = 0x02f40000, len = 64
[   14.548019] marvell-nfc pxa3xx-nand: 
[   14.548019] NDCR:  0x9d079fff
[   14.548019] NDCB0: 0x000d3000
[   14.548019] NDCB1: 0x5e800000
[   14.548019] NDCB2: 0x00000000
[   14.548019] NDCB3: 0x00000000
[   14.566900] Bad eraseblock 378 at 0x000002f40000
[   14.571753] nand: nand_do_read_oob: from = 0x02f60000, len = 64
[   14.577775] marvell-nfc pxa3xx-nand: 
[   14.577775] NDCR:  0x9d079fff
[   14.577775] NDCB0: 0x000d3000
[   14.577775] NDCB1: 0x5ec00000
[   14.577775] NDCB2: 0x00000000
[   14.577775] NDCB3: 0x00000000
[   14.596659] Bad eraseblock 379 at 0x000002f60000
[   14.601510] nand: nand_do_read_oob: from = 0x02f80000, len = 64
[   14.607534] marvell-nfc pxa3xx-nand: 
[   14.607534] NDCR:  0x9d079fff
[   14.607534] NDCB0: 0x000d3000
[   14.607534] NDCB1: 0x5f000000
[   14.607534] NDCB2: 0x00000000
[   14.607534] NDCB3: 0x00000000
[   14.626415] Bad eraseblock 380 at 0x000002f80000
[   14.631268] nand: nand_do_read_oob: from = 0x02fa0000, len = 64
[   14.637290] marvell-nfc pxa3xx-nand: 
[   14.637290] NDCR:  0x9d079fff
[   14.637290] NDCB0: 0x000d3000
[   14.637290] NDCB1: 0x5f400000
[   14.637290] NDCB2: 0x00000000
[   14.637290] NDCB3: 0x00000000
[   14.656171] Bad eraseblock 381 at 0x000002fa0000
[   14.661027] nand: nand_do_read_oob: from = 0x02fc0000, len = 64
[   14.667048] marvell-nfc pxa3xx-nand: 
[   14.667048] NDCR:  0x9d079fff
[   14.667048] NDCB0: 0x000d3000
[   14.667048] NDCB1: 0x5f800000
[   14.667048] NDCB2: 0x00000000
[   14.667048] NDCB3: 0x00000000
[   14.685931] Bad eraseblock 382 at 0x000002fc0000
[   14.690792] nand: nand_do_read_oob: from = 0x02fe0000, len = 64
[   14.696815] marvell-nfc pxa3xx-nand: 
[   14.696815] NDCR:  0x9d079fff
[   14.696815] NDCB0: 0x000d3000
[   14.696815] NDCB1: 0x5fc00000
[   14.696815] NDCB2: 0x00000000
[   14.696815] NDCB3: 0x00000000
[   14.715697] Bad eraseblock 383 at 0x000002fe0000
[   14.720575] nand: nand_do_read_oob: from = 0x03000000, len = 64
[   14.726598] marvell-nfc pxa3xx-nand: 
[   14.726598] NDCR:  0x9d079fff
[   14.726598] NDCB0: 0x000d3000
[   14.726598] NDCB1: 0x60000000
[   14.726598] NDCB2: 0x00000000
[   14.726598] NDCB3: 0x00000000
[   14.745487] Bad eraseblock 384 at 0x000003000000
[   14.750344] nand: nand_do_read_oob: from = 0x03020000, len = 64
[   14.756365] marvell-nfc pxa3xx-nand: 
[   14.756365] NDCR:  0x9d079fff
[   14.756365] NDCB0: 0x000d3000
[   14.756365] NDCB1: 0x60400000
[   14.756365] NDCB2: 0x00000000
[   14.756365] NDCB3: 0x00000000
[   14.775252] Bad eraseblock 385 at 0x000003020000
[   14.780107] nand: nand_do_read_oob: from = 0x03040000, len = 64
[   14.786131] marvell-nfc pxa3xx-nand: 
[   14.786131] NDCR:  0x9d079fff
[   14.786131] NDCB0: 0x000d3000
[   14.786131] NDCB1: 0x60800000
[   14.786131] NDCB2: 0x00000000
[   14.786131] NDCB3: 0x00000000
[   14.805015] Bad eraseblock 386 at 0x000003040000
[   14.809873] nand: nand_do_read_oob: from = 0x03060000, len = 64
[   14.815897] marvell-nfc pxa3xx-nand: 
[   14.815897] NDCR:  0x9d079fff
[   14.815897] NDCB0: 0x000d3000
[   14.815897] NDCB1: 0x60c00000
[   14.815897] NDCB2: 0x00000000
[   14.815897] NDCB3: 0x00000000
[   14.834782] Bad eraseblock 387 at 0x000003060000
[   14.839640] nand: nand_do_read_oob: from = 0x03080000, len = 64
[   14.845663] marvell-nfc pxa3xx-nand: 
[   14.845663] NDCR:  0x9d079fff
[   14.845663] NDCB0: 0x000d3000
[   14.845663] NDCB1: 0x61000000
[   14.845663] NDCB2: 0x00000000
[   14.845663] NDCB3: 0x00000000
[   14.864548] Bad eraseblock 388 at 0x000003080000
[   14.869407] nand: nand_do_read_oob: from = 0x030a0000, len = 64
[   14.875429] marvell-nfc pxa3xx-nand: 
[   14.875429] NDCR:  0x9d079fff
[   14.875429] NDCB0: 0x000d3000
[   14.875429] NDCB1: 0x61400000
[   14.875429] NDCB2: 0x00000000
[   14.875429] NDCB3: 0x00000000
[   14.894311] Bad eraseblock 389 at 0x0000030a0000
[   14.899163] nand: nand_do_read_oob: from = 0x030c0000, len = 64
[   14.905187] marvell-nfc pxa3xx-nand: 
[   14.905187] NDCR:  0x9d079fff
[   14.905187] NDCB0: 0x000d3000
[   14.905187] NDCB1: 0x61800000
[   14.905187] NDCB2: 0x00000000
[   14.905187] NDCB3: 0x00000000
[   14.924069] Bad eraseblock 390 at 0x0000030c0000
[   14.928930] nand: nand_do_read_oob: from = 0x030e0000, len = 64
[   14.934954] marvell-nfc pxa3xx-nand: 
[   14.934954] NDCR:  0x9d079fff
[   14.934954] NDCB0: 0x000d3000
[   14.934954] NDCB1: 0x61c00000
[   14.934954] NDCB2: 0x00000000
[   14.934954] NDCB3: 0x00000000
[   14.953835] Bad eraseblock 391 at 0x0000030e0000
[   14.958538] nand: nand_do_read_oob: from = 0x03100000, len = 64
[   14.964718] marvell-nfc pxa3xx-nand: 
[   14.964718] NDCR:  0x9d079fff
[   14.964718] NDCB0: 0x000d3000
[   14.964718] NDCB1: 0x62000000
[   14.964718] NDCB2: 0x00000000
[   14.964718] NDCB3: 0x00000000
[   14.983615] Bad eraseblock 392 at 0x000003100000
[   14.988312] nand: nand_do_read_oob: from = 0x03120000, len = 64
[   14.994491] marvell-nfc pxa3xx-nand: 
[   14.994491] NDCR:  0x9d079fff
[   14.994491] NDCB0: 0x000d3000
[   14.994491] NDCB1: 0x62400000
[   14.994491] NDCB2: 0x00000000
[   14.994491] NDCB3: 0x00000000
[   15.013402] Bad eraseblock 393 at 0x000003120000
[   15.018106] nand: nand_do_read_oob: from = 0x03140000, len = 64
[   15.024291] marvell-nfc pxa3xx-nand: 
[   15.024291] NDCR:  0x9d079fff
[   15.024291] NDCB0: 0x000d3000
[   15.024291] NDCB1: 0x62800000
[   15.024291] NDCB2: 0x00000000
[   15.024291] NDCB3: 0x00000000
[   15.043190] Bad eraseblock 394 at 0x000003140000
[   15.047888] nand: nand_do_read_oob: from = 0x03160000, len = 64
[   15.054068] marvell-nfc pxa3xx-nand: 
[   15.054068] NDCR:  0x9d079fff
[   15.054068] NDCB0: 0x000d3000
[   15.054068] NDCB1: 0x62c00000
[   15.054068] NDCB2: 0x00000000
[   15.054068] NDCB3: 0x00000000
[   15.072964] Bad eraseblock 395 at 0x000003160000
[   15.077661] nand: nand_do_read_oob: from = 0x03180000, len = 64
[   15.083840] marvell-nfc pxa3xx-nand: 
[   15.083840] NDCR:  0x9d079fff
[   15.083840] NDCB0: 0x000d3000
[   15.083840] NDCB1: 0x63000000
[   15.083840] NDCB2: 0x00000000
[   15.083840] NDCB3: 0x00000000
[   15.102738] Bad eraseblock 396 at 0x000003180000
[   15.107438] nand: nand_do_read_oob: from = 0x031a0000, len = 64
[   15.113614] marvell-nfc pxa3xx-nand: 
[   15.113614] NDCR:  0x9d079fff
[   15.113614] NDCB0: 0x000d3000
[   15.113614] NDCB1: 0x63400000
[   15.113614] NDCB2: 0x00000000
[   15.113614] NDCB3: 0x00000000
[   15.132513] Bad eraseblock 397 at 0x0000031a0000
[   15.137211] nand: nand_do_read_oob: from = 0x031c0000, len = 64
[   15.143391] marvell-nfc pxa3xx-nand: 
[   15.143391] NDCR:  0x9d079fff
[   15.143391] NDCB0: 0x000d3000
[   15.143391] NDCB1: 0x63800000
[   15.143391] NDCB2: 0x00000000
[   15.143391] NDCB3: 0x00000000
[   15.162287] Bad eraseblock 398 at 0x0000031c0000
[   15.166986] nand: nand_do_read_oob: from = 0x031e0000, len = 64
[   15.173164] marvell-nfc pxa3xx-nand: 
[   15.173164] NDCR:  0x9d079fff
[   15.173164] NDCB0: 0x000d3000
[   15.173164] NDCB1: 0x63c00000
[   15.173164] NDCB2: 0x00000000
[   15.173164] NDCB3: 0x00000000
[   15.192064] Bad eraseblock 399 at 0x0000031e0000
[   15.196761] nand: nand_do_read_oob: from = 0x03200000, len = 64
[   15.202939] marvell-nfc pxa3xx-nand: 
[   15.202939] NDCR:  0x9d079fff
[   15.202939] NDCB0: 0x000d3000
[   15.202939] NDCB1: 0x64000000
[   15.202939] NDCB2: 0x00000000
[   15.202939] NDCB3: 0x00000000
[   15.221831] Bad eraseblock 400 at 0x000003200000
[   15.226527] nand: nand_do_read_oob: from = 0x03220000, len = 64
[   15.232706] marvell-nfc pxa3xx-nand: 
[   15.232706] NDCR:  0x9d079fff
[   15.232706] NDCB0: 0x000d3000
[   15.232706] NDCB1: 0x64400000
[   15.232706] NDCB2: 0x00000000
[   15.232706] NDCB3: 0x00000000
[   15.251605] Bad eraseblock 401 at 0x000003220000
[   15.256301] nand: nand_do_read_oob: from = 0x03240000, len = 64
[   15.262479] marvell-nfc pxa3xx-nand: 
[   15.262479] NDCR:  0x9d079fff
[   15.262479] NDCB0: 0x000d3000
[   15.262479] NDCB1: 0x64800000
[   15.262479] NDCB2: 0x00000000
[   15.262479] NDCB3: 0x00000000
[   15.281371] Bad eraseblock 402 at 0x000003240000
[   15.286068] nand: nand_do_read_oob: from = 0x03260000, len = 64
[   15.292246] marvell-nfc pxa3xx-nand: 
[   15.292246] NDCR:  0x9d079fff
[   15.292246] NDCB0: 0x000d3000
[   15.292246] NDCB1: 0x64c00000
[   15.292246] NDCB2: 0x00000000
[   15.292246] NDCB3: 0x00000000
[   15.311177] nand: nand_do_read_oob: from = 0x03280000, len = 64
[   15.317209] marvell-nfc pxa3xx-nand: 
[   15.317209] NDCR:  0x9d079fff
[   15.317209] NDCB0: 0x000d3000
[   15.317209] NDCB1: 0x65000000
[   15.317209] NDCB2: 0x00000000
[   15.317209] NDCB3: 0x00000000
[   15.336142] nand: nand_do_read_oob: from = 0x032a0000, len = 64
[   15.342347] marvell-nfc pxa3xx-nand: 
[   15.342347] NDCR:  0x9d079fff
[   15.342347] NDCB0: 0x000d3000
[   15.342347] NDCB1: 0x65400000
[   15.342347] NDCB2: 0x00000000
[   15.342347] NDCB3: 0x00000000
[   15.361294] nand: nand_do_read_oob: from = 0x032c0000, len = 64
[   15.367324] marvell-nfc pxa3xx-nand: 
[   15.367324] NDCR:  0x9d079fff
[   15.367324] NDCB0: 0x000d3000
[   15.367324] NDCB1: 0x65800000
[   15.367324] NDCB2: 0x00000000
[   15.367324] NDCB3: 0x00000000
[   15.386260] nand: nand_do_read_oob: from = 0x032e0000, len = 64
[   15.392463] marvell-nfc pxa3xx-nand: 
[   15.392463] NDCR:  0x9d079fff
[   15.392463] NDCB0: 0x000d3000
[   15.392463] NDCB1: 0x65c00000
[   15.392463] NDCB2: 0x00000000
[   15.392463] NDCB3: 0x00000000
[   15.411391] nand: nand_do_read_oob: from = 0x03300000, len = 64
[   15.417424] marvell-nfc pxa3xx-nand: 
[   15.417424] NDCR:  0x9d079fff
[   15.417424] NDCB0: 0x000d3000
[   15.417424] NDCB1: 0x66000000
[   15.417424] NDCB2: 0x00000000
[   15.417424] NDCB3: 0x00000000
[   15.436353] nand: nand_do_read_oob: from = 0x03320000, len = 64
[   15.442555] marvell-nfc pxa3xx-nand: 
[   15.442555] NDCR:  0x9d079fff
[   15.442555] NDCB0: 0x000d3000
[   15.442555] NDCB1: 0x66400000
[   15.442555] NDCB2: 0x00000000
[   15.442555] NDCB3: 0x00000000
[   15.461482] nand: nand_do_read_oob: from = 0x03340000, len = 64
[   15.467512] marvell-nfc pxa3xx-nand: 
[   15.467512] NDCR:  0x9d079fff
[   15.467512] NDCB0: 0x000d3000
[   15.467512] NDCB1: 0x66800000
[   15.467512] NDCB2: 0x00000000
[   15.467512] NDCB3: 0x00000000
[   15.486447] nand: nand_do_read_oob: from = 0x03360000, len = 64
[   15.492651] marvell-nfc pxa3xx-nand: 
[   15.492651] NDCR:  0x9d079fff
[   15.492651] NDCB0: 0x000d3000
[   15.492651] NDCB1: 0x66c00000
[   15.492651] NDCB2: 0x00000000
[   15.492651] NDCB3: 0x00000000
[   15.511580] nand: nand_do_read_oob: from = 0x03380000, len = 64
[   15.517610] marvell-nfc pxa3xx-nand: 
[   15.517610] NDCR:  0x9d079fff
[   15.517610] NDCB0: 0x000d3000
[   15.517610] NDCB1: 0x67000000
[   15.517610] NDCB2: 0x00000000
[   15.517610] NDCB3: 0x00000000
[   15.536551] nand: nand_do_read_oob: from = 0x033a0000, len = 64
[   15.542750] marvell-nfc pxa3xx-nand: 
[   15.542750] NDCR:  0x9d079fff
[   15.542750] NDCB0: 0x000d3000
[   15.542750] NDCB1: 0x67400000
[   15.542750] NDCB2: 0x00000000
[   15.542750] NDCB3: 0x00000000
[   15.561678] nand: nand_do_read_oob: from = 0x033c0000, len = 64
[   15.567711] marvell-nfc pxa3xx-nand: 
[   15.567711] NDCR:  0x9d079fff
[   15.567711] NDCB0: 0x000d3000
[   15.567711] NDCB1: 0x67800000
[   15.567711] NDCB2: 0x00000000
[   15.567711] NDCB3: 0x00000000
[   15.586643] nand: nand_do_read_oob: from = 0x033e0000, len = 64
[   15.592851] marvell-nfc pxa3xx-nand: 
[   15.592851] NDCR:  0x9d079fff
[   15.592851] NDCB0: 0x000d3000
[   15.592851] NDCB1: 0x67c00000
[   15.592851] NDCB2: 0x00000000
[   15.592851] NDCB3: 0x00000000
[   15.611775] nand: nand_do_read_oob: from = 0x03400000, len = 64
[   15.617808] marvell-nfc pxa3xx-nand: 
[   15.617808] NDCR:  0x9d079fff
[   15.617808] NDCB0: 0x000d3000
[   15.617808] NDCB1: 0x68000000
[   15.617808] NDCB2: 0x00000000
[   15.617808] NDCB3: 0x00000000
[   15.636743] nand: nand_do_read_oob: from = 0x03420000, len = 64
[   15.642945] marvell-nfc pxa3xx-nand: 
[   15.642945] NDCR:  0x9d079fff
[   15.642945] NDCB0: 0x000d3000
[   15.642945] NDCB1: 0x68400000
[   15.642945] NDCB2: 0x00000000
[   15.642945] NDCB3: 0x00000000
[   15.661875] nand: nand_do_read_oob: from = 0x03440000, len = 64
[   15.667906] marvell-nfc pxa3xx-nand: 
[   15.667906] NDCR:  0x9d079fff
[   15.667906] NDCB0: 0x000d3000
[   15.667906] NDCB1: 0x68800000
[   15.667906] NDCB2: 0x00000000
[   15.667906] NDCB3: 0x00000000
[   15.686838] nand: nand_do_read_oob: from = 0x03460000, len = 64
[   15.693038] marvell-nfc pxa3xx-nand: 
[   15.693038] NDCR:  0x9d079fff
[   15.693038] NDCB0: 0x000d3000
[   15.693038] NDCB1: 0x68c00000
[   15.693038] NDCB2: 0x00000000
[   15.693038] NDCB3: 0x00000000
[   15.711963] nand: nand_do_read_oob: from = 0x03480000, len = 64
[   15.717998] marvell-nfc pxa3xx-nand: 
[   15.717998] NDCR:  0x9d079fff
[   15.717998] NDCB0: 0x000d3000
[   15.717998] NDCB1: 0x69000000
[   15.717998] NDCB2: 0x00000000
[   15.717998] NDCB3: 0x00000000
[   15.736929] nand: nand_do_read_oob: from = 0x034a0000, len = 64
[   15.743137] marvell-nfc pxa3xx-nand: 
[   15.743137] NDCR:  0x9d079fff
[   15.743137] NDCB0: 0x000d3000
[   15.743137] NDCB1: 0x69400000
[   15.743137] NDCB2: 0x00000000
[   15.743137] NDCB3: 0x00000000
[   15.762067] nand: nand_do_read_oob: from = 0x034c0000, len = 64
[   15.768095] marvell-nfc pxa3xx-nand: 
[   15.768095] NDCR:  0x9d079fff
[   15.768095] NDCB0: 0x000d3000
[   15.768095] NDCB1: 0x69800000
[   15.768095] NDCB2: 0x00000000
[   15.768095] NDCB3: 0x00000000
[   15.787028] nand: nand_do_read_oob: from = 0x034e0000, len = 64
[   15.793233] marvell-nfc pxa3xx-nand: 
[   15.793233] NDCR:  0x9d079fff
[   15.793233] NDCB0: 0x000d3000
[   15.793233] NDCB1: 0x69c00000
[   15.793233] NDCB2: 0x00000000
[   15.793233] NDCB3: 0x00000000
[   15.812162] nand: nand_do_read_oob: from = 0x03500000, len = 64
[   15.818194] marvell-nfc pxa3xx-nand: 
[   15.818194] NDCR:  0x9d079fff
[   15.818194] NDCB0: 0x000d3000
[   15.818194] NDCB1: 0x6a000000
[   15.818194] NDCB2: 0x00000000
[   15.818194] NDCB3: 0x00000000
[   15.837126] nand: nand_do_read_oob: from = 0x03520000, len = 64
[   15.843332] marvell-nfc pxa3xx-nand: 
[   15.843332] NDCR:  0x9d079fff
[   15.843332] NDCB0: 0x000d3000
[   15.843332] NDCB1: 0x6a400000
[   15.843332] NDCB2: 0x00000000
[   15.843332] NDCB3: 0x00000000
[   15.862261] nand: nand_do_read_oob: from = 0x03540000, len = 64
[   15.868293] marvell-nfc pxa3xx-nand: 
[   15.868293] NDCR:  0x9d079fff
[   15.868293] NDCB0: 0x000d3000
[   15.868293] NDCB1: 0x6a800000
[   15.868293] NDCB2: 0x00000000
[   15.868293] NDCB3: 0x00000000
[   15.887223] nand: nand_do_read_oob: from = 0x03560000, len = 64
[   15.893432] marvell-nfc pxa3xx-nand: 
[   15.893432] NDCR:  0x9d079fff
[   15.893432] NDCB0: 0x000d3000
[   15.893432] NDCB1: 0x6ac00000
[   15.893432] NDCB2: 0x00000000
[   15.893432] NDCB3: 0x00000000
[   15.912358] nand: nand_do_read_oob: from = 0x03580000, len = 64
[   15.918389] marvell-nfc pxa3xx-nand: 
[   15.918389] NDCR:  0x9d079fff
[   15.918389] NDCB0: 0x000d3000
[   15.918389] NDCB1: 0x6b000000
[   15.918389] NDCB2: 0x00000000
[   15.918389] NDCB3: 0x00000000
[   15.937323] nand: nand_do_read_oob: from = 0x035a0000, len = 64
[   15.943528] marvell-nfc pxa3xx-nand: 
[   15.943528] NDCR:  0x9d079fff
[   15.943528] NDCB0: 0x000d3000
[   15.943528] NDCB1: 0x6b400000
[   15.943528] NDCB2: 0x00000000
[   15.943528] NDCB3: 0x00000000
[   15.962458] nand: nand_do_read_oob: from = 0x035c0000, len = 64
[   15.968490] marvell-nfc pxa3xx-nand: 
[   15.968490] NDCR:  0x9d079fff
[   15.968490] NDCB0: 0x000d3000
[   15.968490] NDCB1: 0x6b800000
[   15.968490] NDCB2: 0x00000000
[   15.968490] NDCB3: 0x00000000
[   15.987421] nand: nand_do_read_oob: from = 0x035e0000, len = 64
[   15.993628] marvell-nfc pxa3xx-nand: 
[   15.993628] NDCR:  0x9d079fff
[   15.993628] NDCB0: 0x000d3000
[   15.993628] NDCB1: 0x6bc00000
[   15.993628] NDCB2: 0x00000000
[   15.993628] NDCB3: 0x00000000
[   16.012583] nand: nand_do_read_oob: from = 0x03600000, len = 64
[   16.018614] marvell-nfc pxa3xx-nand: 
[   16.018614] NDCR:  0x9d079fff
[   16.018614] NDCB0: 0x000d3000
[   16.018614] NDCB1: 0x6c000000
[   16.018614] NDCB2: 0x00000000
[   16.018614] NDCB3: 0x00000000
[   16.037664] nand: nand_do_read_oob: from = 0x03620000, len = 64
[   16.043862] marvell-nfc pxa3xx-nand: 
[   16.043862] NDCR:  0x9d079fff
[   16.043862] NDCB0: 0x000d3000
[   16.043862] NDCB1: 0x6c400000
[   16.043862] NDCB2: 0x00000000
[   16.043862] NDCB3: 0x00000000
[   16.062792] nand: nand_do_read_oob: from = 0x03640000, len = 64
[   16.068995] marvell-nfc pxa3xx-nand: 
[   16.068995] NDCR:  0x9d079fff
[   16.068995] NDCB0: 0x000d3000
[   16.068995] NDCB1: 0x6c800000
[   16.068995] NDCB2: 0x00000000
[   16.068995] NDCB3: 0x00000000
[   16.087911] nand: nand_do_read_oob: from = 0x03660000, len = 64
[   16.094597] marvell-nfc pxa3xx-nand: 
[   16.094597] NDCR:  0x9d079fff
[   16.094597] NDCB0: 0x000d3000
[   16.094597] NDCB1: 0x6cc00000
[   16.094597] NDCB2: 0x00000000
[   16.094597] NDCB3: 0x00000000
[   16.113619] nand: nand_do_read_oob: from = 0x03680000, len = 64
[   16.119819] marvell-nfc pxa3xx-nand: 
[   16.119819] NDCR:  0x9d079fff
[   16.119819] NDCB0: 0x000d3000
[   16.119819] NDCB1: 0x6d000000
[   16.119819] NDCB2: 0x00000000
[   16.119819] NDCB3: 0x00000000
[   16.138936] nand: nand_do_read_oob: from = 0x036a0000, len = 64
[   16.144980] marvell-nfc pxa3xx-nand: 
[   16.144980] NDCR:  0x9d079fff
[   16.144980] NDCB0: 0x000d3000
[   16.144980] NDCB1: 0x6d400000
[   16.144980] NDCB2: 0x00000000
[   16.144980] NDCB3: 0x00000000
[   16.163932] nand: nand_do_read_oob: from = 0x036c0000, len = 64
[   16.170140] marvell-nfc pxa3xx-nand: 
[   16.170140] NDCR:  0x9d079fff
[   16.170140] NDCB0: 0x000d3000
[   16.170140] NDCB1: 0x6d800000
[   16.170140] NDCB2: 0x00000000
[   16.170140] NDCB3: 0x00000000
[   16.189067] nand: nand_do_read_oob: from = 0x036e0000, len = 64
[   16.195099] marvell-nfc pxa3xx-nand: 
[   16.195099] NDCR:  0x9d079fff
[   16.195099] NDCB0: 0x000d3000
[   16.195099] NDCB1: 0x6dc00000
[   16.195099] NDCB2: 0x00000000
[   16.195099] NDCB3: 0x00000000
[   16.214034] nand: nand_do_read_oob: from = 0x03700000, len = 64
[   16.220239] marvell-nfc pxa3xx-nand: 
[   16.220239] NDCR:  0x9d079fff
[   16.220239] NDCB0: 0x000d3000
[   16.220239] NDCB1: 0x6e000000
[   16.220239] NDCB2: 0x00000000
[   16.220239] NDCB3: 0x00000000
[   16.239166] nand: nand_do_read_oob: from = 0x03720000, len = 64
[   16.245199] marvell-nfc pxa3xx-nand: 
[   16.245199] NDCR:  0x9d079fff
[   16.245199] NDCB0: 0x000d3000
[   16.245199] NDCB1: 0x6e400000
[   16.245199] NDCB2: 0x00000000
[   16.245199] NDCB3: 0x00000000
[   16.264131] nand: nand_do_read_oob: from = 0x03740000, len = 64
[   16.270338] marvell-nfc pxa3xx-nand: 
[   16.270338] NDCR:  0x9d079fff
[   16.270338] NDCB0: 0x000d3000
[   16.270338] NDCB1: 0x6e800000
[   16.270338] NDCB2: 0x00000000
[   16.270338] NDCB3: 0x00000000
[   16.289263] nand: nand_do_read_oob: from = 0x03760000, len = 64
[   16.295298] marvell-nfc pxa3xx-nand: 
[   16.295298] NDCR:  0x9d079fff
[   16.295298] NDCB0: 0x000d3000
[   16.295298] NDCB1: 0x6ec00000
[   16.295298] NDCB2: 0x00000000
[   16.295298] NDCB3: 0x00000000
[   16.314230] nand: nand_do_read_oob: from = 0x03780000, len = 64
[   16.320435] marvell-nfc pxa3xx-nand: 
[   16.320435] NDCR:  0x9d079fff
[   16.320435] NDCB0: 0x000d3000
[   16.320435] NDCB1: 0x6f000000
[   16.320435] NDCB2: 0x00000000
[   16.320435] NDCB3: 0x00000000
[   16.339368] nand: nand_do_read_oob: from = 0x037a0000, len = 64
[   16.345403] marvell-nfc pxa3xx-nand: 
[   16.345403] NDCR:  0x9d079fff
[   16.345403] NDCB0: 0x000d3000
[   16.345403] NDCB1: 0x6f400000
[   16.345403] NDCB2: 0x00000000
[   16.345403] NDCB3: 0x00000000
[   16.364339] nand: nand_do_read_oob: from = 0x037c0000, len = 64
[   16.370541] marvell-nfc pxa3xx-nand: 
[   16.370541] NDCR:  0x9d079fff
[   16.370541] NDCB0: 0x000d3000
[   16.370541] NDCB1: 0x6f800000
[   16.370541] NDCB2: 0x00000000
[   16.370541] NDCB3: 0x00000000
[   16.389471] nand: nand_do_read_oob: from = 0x037e0000, len = 64
[   16.395504] marvell-nfc pxa3xx-nand: 
[   16.395504] NDCR:  0x9d079fff
[   16.395504] NDCB0: 0x000d3000
[   16.395504] NDCB1: 0x6fc00000
[   16.395504] NDCB2: 0x00000000
[   16.395504] NDCB3: 0x00000000
[   16.414434] nand: nand_do_read_oob: from = 0x03800000, len = 64
[   16.420642] marvell-nfc pxa3xx-nand: 
[   16.420642] NDCR:  0x9d079fff
[   16.420642] NDCB0: 0x000d3000
[   16.420642] NDCB1: 0x70000000
[   16.420642] NDCB2: 0x00000000
[   16.420642] NDCB3: 0x00000000
[   16.439569] nand: nand_do_read_oob: from = 0x03820000, len = 64
[   16.445602] marvell-nfc pxa3xx-nand: 
[   16.445602] NDCR:  0x9d079fff
[   16.445602] NDCB0: 0x000d3000
[   16.445602] NDCB1: 0x70400000
[   16.445602] NDCB2: 0x00000000
[   16.445602] NDCB3: 0x00000000
[   16.464534] nand: nand_do_read_oob: from = 0x03840000, len = 64
[   16.470738] marvell-nfc pxa3xx-nand: 
[   16.470738] NDCR:  0x9d079fff
[   16.470738] NDCB0: 0x000d3000
[   16.470738] NDCB1: 0x70800000
[   16.470738] NDCB2: 0x00000000
[   16.470738] NDCB3: 0x00000000
[   16.489668] nand: nand_do_read_oob: from = 0x03860000, len = 64
[   16.495698] marvell-nfc pxa3xx-nand: 
[   16.495698] NDCR:  0x9d079fff
[   16.495698] NDCB0: 0x000d3000
[   16.495698] NDCB1: 0x70c00000
[   16.495698] NDCB2: 0x00000000
[   16.495698] NDCB3: 0x00000000
[   16.514633] nand: nand_do_read_oob: from = 0x03880000, len = 64
[   16.520836] marvell-nfc pxa3xx-nand: 
[   16.520836] NDCR:  0x9d079fff
[   16.520836] NDCB0: 0x000d3000
[   16.520836] NDCB1: 0x71000000
[   16.520836] NDCB2: 0x00000000
[   16.520836] NDCB3: 0x00000000
[   16.539765] nand: nand_do_read_oob: from = 0x038a0000, len = 64
[   16.545799] marvell-nfc pxa3xx-nand: 
[   16.545799] NDCR:  0x9d079fff
[   16.545799] NDCB0: 0x000d3000
[   16.545799] NDCB1: 0x71400000
[   16.545799] NDCB2: 0x00000000
[   16.545799] NDCB3: 0x00000000
[   16.564735] nand: nand_do_read_oob: from = 0x038c0000, len = 64
[   16.570937] marvell-nfc pxa3xx-nand: 
[   16.570937] NDCR:  0x9d079fff
[   16.570937] NDCB0: 0x000d3000
[   16.570937] NDCB1: 0x71800000
[   16.570937] NDCB2: 0x00000000
[   16.570937] NDCB3: 0x00000000
[   16.589863] nand: nand_do_read_oob: from = 0x038e0000, len = 64
[   16.595896] marvell-nfc pxa3xx-nand: 
[   16.595896] NDCR:  0x9d079fff
[   16.595896] NDCB0: 0x000d3000
[   16.595896] NDCB1: 0x71c00000
[   16.595896] NDCB2: 0x00000000
[   16.595896] NDCB3: 0x00000000
[   16.614851] nand: nand_do_read_oob: from = 0x03900000, len = 64
[   16.621051] marvell-nfc pxa3xx-nand: 
[   16.621051] NDCR:  0x9d079fff
[   16.621051] NDCB0: 0x000d3000
[   16.621051] NDCB1: 0x72000000
[   16.621051] NDCB2: 0x00000000
[   16.621051] NDCB3: 0x00000000
[   16.639979] nand: nand_do_read_oob: from = 0x03920000, len = 64
[   16.646011] marvell-nfc pxa3xx-nand: 
[   16.646011] NDCR:  0x9d079fff
[   16.646011] NDCB0: 0x000d3000
[   16.646011] NDCB1: 0x72400000
[   16.646011] NDCB2: 0x00000000
[   16.646011] NDCB3: 0x00000000
[   16.664947] nand: nand_do_read_oob: from = 0x03940000, len = 64
[   16.671151] marvell-nfc pxa3xx-nand: 
[   16.671151] NDCR:  0x9d079fff
[   16.671151] NDCB0: 0x000d3000
[   16.671151] NDCB1: 0x72800000
[   16.671151] NDCB2: 0x00000000
[   16.671151] NDCB3: 0x00000000
[   16.690079] nand: nand_do_read_oob: from = 0x03960000, len = 64
[   16.696110] marvell-nfc pxa3xx-nand: 
[   16.696110] NDCR:  0x9d079fff
[   16.696110] NDCB0: 0x000d3000
[   16.696110] NDCB1: 0x72c00000
[   16.696110] NDCB2: 0x00000000
[   16.696110] NDCB3: 0x00000000
[   16.715040] nand: nand_do_read_oob: from = 0x03980000, len = 64
[   16.721242] marvell-nfc pxa3xx-nand: 
[   16.721242] NDCR:  0x9d079fff
[   16.721242] NDCB0: 0x000d3000
[   16.721242] NDCB1: 0x73000000
[   16.721242] NDCB2: 0x00000000
[   16.721242] NDCB3: 0x00000000
[   16.740169] nand: nand_do_read_oob: from = 0x039a0000, len = 64
[   16.746199] marvell-nfc pxa3xx-nand: 
[   16.746199] NDCR:  0x9d079fff
[   16.746199] NDCB0: 0x000d3000
[   16.746199] NDCB1: 0x73400000
[   16.746199] NDCB2: 0x00000000
[   16.746199] NDCB3: 0x00000000
[   16.765132] nand: nand_do_read_oob: from = 0x039c0000, len = 64
[   16.771339] marvell-nfc pxa3xx-nand: 
[   16.771339] NDCR:  0x9d079fff
[   16.771339] NDCB0: 0x000d3000
[   16.771339] NDCB1: 0x73800000
[   16.771339] NDCB2: 0x00000000
[   16.771339] NDCB3: 0x00000000
[   16.790267] nand: nand_do_read_oob: from = 0x039e0000, len = 64
[   16.796298] marvell-nfc pxa3xx-nand: 
[   16.796298] NDCR:  0x9d079fff
[   16.796298] NDCB0: 0x000d3000
[   16.796298] NDCB1: 0x73c00000
[   16.796298] NDCB2: 0x00000000
[   16.796298] NDCB3: 0x00000000
[   16.815233] nand: nand_do_read_oob: from = 0x03a00000, len = 64
[   16.821436] marvell-nfc pxa3xx-nand: 
[   16.821436] NDCR:  0x9d079fff
[   16.821436] NDCB0: 0x000d3000
[   16.821436] NDCB1: 0x74000000
[   16.821436] NDCB2: 0x00000000
[   16.821436] NDCB3: 0x00000000
[   16.840365] nand: nand_do_read_oob: from = 0x03a20000, len = 64
[   16.846398] marvell-nfc pxa3xx-nand: 
[   16.846398] NDCR:  0x9d079fff
[   16.846398] NDCB0: 0x000d3000
[   16.846398] NDCB1: 0x74400000
[   16.846398] NDCB2: 0x00000000
[   16.846398] NDCB3: 0x00000000
[   16.865330] nand: nand_do_read_oob: from = 0x03a40000, len = 64
[   16.871536] marvell-nfc pxa3xx-nand: 
[   16.871536] NDCR:  0x9d079fff
[   16.871536] NDCB0: 0x000d3000
[   16.871536] NDCB1: 0x74800000
[   16.871536] NDCB2: 0x00000000
[   16.871536] NDCB3: 0x00000000
[   16.890461] nand: nand_do_read_oob: from = 0x03a60000, len = 64
[   16.896496] marvell-nfc pxa3xx-nand: 
[   16.896496] NDCR:  0x9d079fff
[   16.896496] NDCB0: 0x000d3000
[   16.896496] NDCB1: 0x74c00000
[   16.896496] NDCB2: 0x00000000
[   16.896496] NDCB3: 0x00000000
[   16.915426] nand: nand_do_read_oob: from = 0x03a80000, len = 64
[   16.921635] marvell-nfc pxa3xx-nand: 
[   16.921635] NDCR:  0x9d079fff
[   16.921635] NDCB0: 0x000d3000
[   16.921635] NDCB1: 0x75000000
[   16.921635] NDCB2: 0x00000000
[   16.921635] NDCB3: 0x00000000
[   16.940561] nand: nand_do_read_oob: from = 0x03aa0000, len = 64
[   16.946594] marvell-nfc pxa3xx-nand: 
[   16.946594] NDCR:  0x9d079fff
[   16.946594] NDCB0: 0x000d3000
[   16.946594] NDCB1: 0x75400000
[   16.946594] NDCB2: 0x00000000
[   16.946594] NDCB3: 0x00000000
[   16.965526] nand: nand_do_read_oob: from = 0x03ac0000, len = 64
[   16.971733] marvell-nfc pxa3xx-nand: 
[   16.971733] NDCR:  0x9d079fff
[   16.971733] NDCB0: 0x000d3000
[   16.971733] NDCB1: 0x75800000
[   16.971733] NDCB2: 0x00000000
[   16.971733] NDCB3: 0x00000000
[   16.990660] nand: nand_do_read_oob: from = 0x03ae0000, len = 64
[   16.996693] marvell-nfc pxa3xx-nand: 
[   16.996693] NDCR:  0x9d079fff
[   16.996693] NDCB0: 0x000d3000
[   16.996693] NDCB1: 0x75c00000
[   16.996693] NDCB2: 0x00000000
[   16.996693] NDCB3: 0x00000000
[   17.015635] nand: nand_do_read_oob: from = 0x03b00000, len = 64
[   17.021843] marvell-nfc pxa3xx-nand: 
[   17.021843] NDCR:  0x9d079fff
[   17.021843] NDCB0: 0x000d3000
[   17.021843] NDCB1: 0x76000000
[   17.021843] NDCB2: 0x00000000
[   17.021843] NDCB3: 0x00000000
[   17.040767] nand: nand_do_read_oob: from = 0x03b20000, len = 64
[   17.046800] marvell-nfc pxa3xx-nand: 
[   17.046800] NDCR:  0x9d079fff
[   17.046800] NDCB0: 0x000d3000
[   17.046800] NDCB1: 0x76400000
[   17.046800] NDCB2: 0x00000000
[   17.046800] NDCB3: 0x00000000
[   17.065733] nand: nand_do_read_oob: from = 0x03b40000, len = 64
[   17.071938] marvell-nfc pxa3xx-nand: 
[   17.071938] NDCR:  0x9d079fff
[   17.071938] NDCB0: 0x000d3000
[   17.071938] NDCB1: 0x76800000
[   17.071938] NDCB2: 0x00000000
[   17.071938] NDCB3: 0x00000000
[   17.090865] nand: nand_do_read_oob: from = 0x03b60000, len = 64
[   17.096897] marvell-nfc pxa3xx-nand: 
[   17.096897] NDCR:  0x9d079fff
[   17.096897] NDCB0: 0x000d3000
[   17.096897] NDCB1: 0x76c00000
[   17.096897] NDCB2: 0x00000000
[   17.096897] NDCB3: 0x00000000
[   17.115833] nand: nand_do_read_oob: from = 0x03b80000, len = 64
[   17.122035] marvell-nfc pxa3xx-nand: 
[   17.122035] NDCR:  0x9d079fff
[   17.122035] NDCB0: 0x000d3000
[   17.122035] NDCB1: 0x77000000
[   17.122035] NDCB2: 0x00000000
[   17.122035] NDCB3: 0x00000000
[   17.140965] nand: nand_do_read_oob: from = 0x03ba0000, len = 64
[   17.146995] marvell-nfc pxa3xx-nand: 
[   17.146995] NDCR:  0x9d079fff
[   17.146995] NDCB0: 0x000d3000
[   17.146995] NDCB1: 0x77400000
[   17.146995] NDCB2: 0x00000000
[   17.146995] NDCB3: 0x00000000
[   17.165931] nand: nand_do_read_oob: from = 0x03bc0000, len = 64
[   17.172135] marvell-nfc pxa3xx-nand: 
[   17.172135] NDCR:  0x9d079fff
[   17.172135] NDCB0: 0x000d3000
[   17.172135] NDCB1: 0x77800000
[   17.172135] NDCB2: 0x00000000
[   17.172135] NDCB3: 0x00000000
[   17.191063] nand: nand_do_read_oob: from = 0x03be0000, len = 64
[   17.197096] marvell-nfc pxa3xx-nand: 
[   17.197096] NDCR:  0x9d079fff
[   17.197096] NDCB0: 0x000d3000
[   17.197096] NDCB1: 0x77c00000
[   17.197096] NDCB2: 0x00000000
[   17.197096] NDCB3: 0x00000000
[   17.216028] nand: nand_do_read_oob: from = 0x03c00000, len = 64
[   17.222235] marvell-nfc pxa3xx-nand: 
[   17.222235] NDCR:  0x9d079fff
[   17.222235] NDCB0: 0x000d3000
[   17.222235] NDCB1: 0x78000000
[   17.222235] NDCB2: 0x00000000
[   17.222235] NDCB3: 0x00000000
[   17.241159] nand: nand_do_read_oob: from = 0x03c20000, len = 64
[   17.247193] marvell-nfc pxa3xx-nand: 
[   17.247193] NDCR:  0x9d079fff
[   17.247193] NDCB0: 0x000d3000
[   17.247193] NDCB1: 0x78400000
[   17.247193] NDCB2: 0x00000000
[   17.247193] NDCB3: 0x00000000
[   17.266142] nand: nand_do_read_oob: from = 0x03c40000, len = 64
[   17.272349] marvell-nfc pxa3xx-nand: 
[   17.272349] NDCR:  0x9d079fff
[   17.272349] NDCB0: 0x000d3000
[   17.272349] NDCB1: 0x78800000
[   17.272349] NDCB2: 0x00000000
[   17.272349] NDCB3: 0x00000000
[   17.291275] nand: nand_do_read_oob: from = 0x03c60000, len = 64
[   17.297308] marvell-nfc pxa3xx-nand: 
[   17.297308] NDCR:  0x9d079fff
[   17.297308] NDCB0: 0x000d3000
[   17.297308] NDCB1: 0x78c00000
[   17.297308] NDCB2: 0x00000000
[   17.297308] NDCB3: 0x00000000
[   17.316239] nand: nand_do_read_oob: from = 0x03c80000, len = 64
[   17.322439] marvell-nfc pxa3xx-nand: 
[   17.322439] NDCR:  0x9d079fff
[   17.322439] NDCB0: 0x000d3000
[   17.322439] NDCB1: 0x79000000
[   17.322439] NDCB2: 0x00000000
[   17.322439] NDCB3: 0x00000000
[   17.341366] nand: nand_do_read_oob: from = 0x03ca0000, len = 64
[   17.347400] marvell-nfc pxa3xx-nand: 
[   17.347400] NDCR:  0x9d079fff
[   17.347400] NDCB0: 0x000d3000
[   17.347400] NDCB1: 0x79400000
[   17.347400] NDCB2: 0x00000000
[   17.347400] NDCB3: 0x00000000
[   17.366333] nand: nand_do_read_oob: from = 0x03cc0000, len = 64
[   17.372538] marvell-nfc pxa3xx-nand: 
[   17.372538] NDCR:  0x9d079fff
[   17.372538] NDCB0: 0x000d3000
[   17.372538] NDCB1: 0x79800000
[   17.372538] NDCB2: 0x00000000
[   17.372538] NDCB3: 0x00000000
[   17.391466] nand: nand_do_read_oob: from = 0x03ce0000, len = 64
[   17.397496] marvell-nfc pxa3xx-nand: 
[   17.397496] NDCR:  0x9d079fff
[   17.397496] NDCB0: 0x000d3000
[   17.397496] NDCB1: 0x79c00000
[   17.397496] NDCB2: 0x00000000
[   17.397496] NDCB3: 0x00000000
[   17.416429] nand: nand_do_read_oob: from = 0x03d00000, len = 64
[   17.422635] marvell-nfc pxa3xx-nand: 
[   17.422635] NDCR:  0x9d079fff
[   17.422635] NDCB0: 0x000d3000
[   17.422635] NDCB1: 0x7a000000
[   17.422635] NDCB2: 0x00000000
[   17.422635] NDCB3: 0x00000000
[   17.441563] nand: nand_do_read_oob: from = 0x03d20000, len = 64
[   17.447596] marvell-nfc pxa3xx-nand: 
[   17.447596] NDCR:  0x9d079fff
[   17.447596] NDCB0: 0x000d3000
[   17.447596] NDCB1: 0x7a400000
[   17.447596] NDCB2: 0x00000000
[   17.447596] NDCB3: 0x00000000
[   17.466528] nand: nand_do_read_oob: from = 0x03d40000, len = 64
[   17.472736] marvell-nfc pxa3xx-nand: 
[   17.472736] NDCR:  0x9d079fff
[   17.472736] NDCB0: 0x000d3000
[   17.472736] NDCB1: 0x7a800000
[   17.472736] NDCB2: 0x00000000
[   17.472736] NDCB3: 0x00000000
[   17.491664] nand: nand_do_read_oob: from = 0x03d60000, len = 64
[   17.497695] marvell-nfc pxa3xx-nand: 
[   17.497695] NDCR:  0x9d079fff
[   17.497695] NDCB0: 0x000d3000
[   17.497695] NDCB1: 0x7ac00000
[   17.497695] NDCB2: 0x00000000
[   17.497695] NDCB3: 0x00000000
[   17.516626] nand: nand_do_read_oob: from = 0x03d80000, len = 64
[   17.522832] marvell-nfc pxa3xx-nand: 
[   17.522832] NDCR:  0x9d079fff
[   17.522832] NDCB0: 0x000d3000
[   17.522832] NDCB1: 0x7b000000
[   17.522832] NDCB2: 0x00000000
[   17.522832] NDCB3: 0x00000000
[   17.541762] nand: nand_do_read_oob: from = 0x03da0000, len = 64
[   17.547793] marvell-nfc pxa3xx-nand: 
[   17.547793] NDCR:  0x9d079fff
[   17.547793] NDCB0: 0x000d3000
[   17.547793] NDCB1: 0x7b400000
[   17.547793] NDCB2: 0x00000000
[   17.547793] NDCB3: 0x00000000
[   17.566726] nand: nand_do_read_oob: from = 0x03dc0000, len = 64
[   17.572931] marvell-nfc pxa3xx-nand: 
[   17.572931] NDCR:  0x9d079fff
[   17.572931] NDCB0: 0x000d3000
[   17.572931] NDCB1: 0x7b800000
[   17.572931] NDCB2: 0x00000000
[   17.572931] NDCB3: 0x00000000
[   17.591858] nand: nand_do_read_oob: from = 0x03de0000, len = 64
[   17.597892] marvell-nfc pxa3xx-nand: 
[   17.597892] NDCR:  0x9d079fff
[   17.597892] NDCB0: 0x000d3000
[   17.597892] NDCB1: 0x7bc00000
[   17.597892] NDCB2: 0x00000000
[   17.597892] NDCB3: 0x00000000
[   17.616823] nand: nand_do_read_oob: from = 0x03e00000, len = 64
[   17.623028] marvell-nfc pxa3xx-nand: 
[   17.623028] NDCR:  0x9d079fff
[   17.623028] NDCB0: 0x000d3000
[   17.623028] NDCB1: 0x7c000000
[   17.623028] NDCB2: 0x00000000
[   17.623028] NDCB3: 0x00000000
[   17.641958] nand: nand_do_read_oob: from = 0x03e20000, len = 64
[   17.647990] marvell-nfc pxa3xx-nand: 
[   17.647990] NDCR:  0x9d079fff
[   17.647990] NDCB0: 0x000d3000
[   17.647990] NDCB1: 0x7c400000
[   17.647990] NDCB2: 0x00000000
[   17.647990] NDCB3: 0x00000000
[   17.666921] nand: nand_do_read_oob: from = 0x03e40000, len = 64
[   17.673120] marvell-nfc pxa3xx-nand: 
[   17.673120] NDCR:  0x9d079fff
[   17.673120] NDCB0: 0x000d3000
[   17.673120] NDCB1: 0x7c800000
[   17.673120] NDCB2: 0x00000000
[   17.673120] NDCB3: 0x00000000
[   17.692046] nand: nand_do_read_oob: from = 0x03e60000, len = 64
[   17.698079] marvell-nfc pxa3xx-nand: 
[   17.698079] NDCR:  0x9d079fff
[   17.698079] NDCB0: 0x000d3000
[   17.698079] NDCB1: 0x7cc00000
[   17.698079] NDCB2: 0x00000000
[   17.698079] NDCB3: 0x00000000
[   17.717011] nand: nand_do_read_oob: from = 0x03e80000, len = 64
[   17.723220] marvell-nfc pxa3xx-nand: 
[   17.723220] NDCR:  0x9d079fff
[   17.723220] NDCB0: 0x000d3000
[   17.723220] NDCB1: 0x7d000000
[   17.723220] NDCB2: 0x00000000
[   17.723220] NDCB3: 0x00000000
[   17.742146] nand: nand_do_read_oob: from = 0x03ea0000, len = 64
[   17.748176] marvell-nfc pxa3xx-nand: 
[   17.748176] NDCR:  0x9d079fff
[   17.748176] NDCB0: 0x000d3000
[   17.748176] NDCB1: 0x7d400000
[   17.748176] NDCB2: 0x00000000
[   17.748176] NDCB3: 0x00000000
[   17.767108] nand: nand_do_read_oob: from = 0x03ec0000, len = 64
[   17.773307] marvell-nfc pxa3xx-nand: 
[   17.773307] NDCR:  0x9d079fff
[   17.773307] NDCB0: 0x000d3000
[   17.773307] NDCB1: 0x7d800000
[   17.773307] NDCB2: 0x00000000
[   17.773307] NDCB3: 0x00000000
[   17.792235] nand: nand_do_read_oob: from = 0x03ee0000, len = 64
[   17.798267] marvell-nfc pxa3xx-nand: 
[   17.798267] NDCR:  0x9d079fff
[   17.798267] NDCB0: 0x000d3000
[   17.798267] NDCB1: 0x7dc00000
[   17.798267] NDCB2: 0x00000000
[   17.798267] NDCB3: 0x00000000
[   17.817199] nand: nand_do_read_oob: from = 0x03f00000, len = 64
[   17.823398] marvell-nfc pxa3xx-nand: 
[   17.823398] NDCR:  0x9d079fff
[   17.823398] NDCB0: 0x000d3000
[   17.823398] NDCB1: 0x7e000000
[   17.823398] NDCB2: 0x00000000
[   17.823398] NDCB3: 0x00000000
[   17.842325] nand: nand_do_read_oob: from = 0x03f20000, len = 64
[   17.848357] marvell-nfc pxa3xx-nand: 
[   17.848357] NDCR:  0x9d079fff
[   17.848357] NDCB0: 0x000d3000
[   17.848357] NDCB1: 0x7e400000
[   17.848357] NDCB2: 0x00000000
[   17.848357] NDCB3: 0x00000000
[   17.867288] nand: nand_do_read_oob: from = 0x03f40000, len = 64
[   17.873487] marvell-nfc pxa3xx-nand: 
[   17.873487] NDCR:  0x9d079fff
[   17.873487] NDCB0: 0x000d3000
[   17.873487] NDCB1: 0x7e800000
[   17.873487] NDCB2: 0x00000000
[   17.873487] NDCB3: 0x00000000
[   17.892431] nand: nand_do_read_oob: from = 0x03f60000, len = 64
[   17.898464] marvell-nfc pxa3xx-nand: 
[   17.898464] NDCR:  0x9d079fff
[   17.898464] NDCB0: 0x000d3000
[   17.898464] NDCB1: 0x7ec00000
[   17.898464] NDCB2: 0x00000000
[   17.898464] NDCB3: 0x00000000
[   17.917396] nand: nand_do_read_oob: from = 0x03f80000, len = 64
[   17.923603] marvell-nfc pxa3xx-nand: 
[   17.923603] NDCR:  0x9d079fff
[   17.923603] NDCB0: 0x000d3000
[   17.923603] NDCB1: 0x7f000000
[   17.923603] NDCB2: 0x00000000
[   17.923603] NDCB3: 0x00000000
[   17.942535] nand: nand_do_read_oob: from = 0x03fa0000, len = 64
[   17.948572] marvell-nfc pxa3xx-nand: 
[   17.948572] NDCR:  0x9d079fff
[   17.948572] NDCB0: 0x000d3000
[   17.948572] NDCB1: 0x7f400000
[   17.948572] NDCB2: 0x00000000
[   17.948572] NDCB3: 0x00000000
[   17.967624] nand: nand_do_read_oob: from = 0x03fc0000, len = 64
[   17.973831] marvell-nfc pxa3xx-nand: 
[   17.973831] NDCR:  0x9d079fff
[   17.973831] NDCB0: 0x000d3000
[   17.973831] NDCB1: 0x7f800000
[   17.973831] NDCB2: 0x00000000
[   17.973831] NDCB3: 0x00000000
[   17.992757] nand: nand_do_read_oob: from = 0x03fe0000, len = 64
[   17.998961] marvell-nfc pxa3xx-nand: 
[   17.998961] NDCR:  0x9d079fff
[   17.998961] NDCB0: 0x000d3000
[   17.998961] NDCB1: 0x7fc00000
[   17.998961] NDCB2: 0x00000000
[   17.998961] NDCB3: 0x00000000
[   18.017891] nand: nand_do_read_oob: from = 0x04000000, len = 64
[   18.024093] marvell-nfc pxa3xx-nand: 
[   18.024093] NDCR:  0x9d079fff
[   18.024093] NDCB0: 0x000d3000
[   18.024093] NDCB1: 0x80000000
[   18.024093] NDCB2: 0x00000000
[   18.024093] NDCB3: 0x00000000
[   18.043020] nand: nand_do_read_oob: from = 0x04020000, len = 64
[   18.049223] marvell-nfc pxa3xx-nand: 
[   18.049223] NDCR:  0x9d079fff
[   18.049223] NDCB0: 0x000d3000
[   18.049223] NDCB1: 0x80400000
[   18.049223] NDCB2: 0x00000000
[   18.049223] NDCB3: 0x00000000
[   18.068142] nand: nand_do_read_oob: from = 0x04040000, len = 64
[   18.074345] marvell-nfc pxa3xx-nand: 
[   18.074345] NDCR:  0x9d079fff
[   18.074345] NDCB0: 0x000d3000
[   18.074345] NDCB1: 0x80800000
[   18.074345] NDCB2: 0x00000000
[   18.074345] NDCB3: 0x00000000
[   18.093622] nand: nand_do_read_oob: from = 0x04060000, len = 64
[   18.099858] marvell-nfc pxa3xx-nand: 
[   18.099858] NDCR:  0x9d079fff
[   18.099858] NDCB0: 0x000d3000
[   18.099858] NDCB1: 0x80c00000
[   18.099858] NDCB2: 0x00000000
[   18.099858] NDCB3: 0x00000000
[   18.118850] nand: nand_do_read_oob: from = 0x04080000, len = 64
[   18.124890] marvell-nfc pxa3xx-nand: 
[   18.124890] NDCR:  0x9d079fff
[   18.124890] NDCB0: 0x000d3000
[   18.124890] NDCB1: 0x81000000
[   18.124890] NDCB2: 0x00000000
[   18.124890] NDCB3: 0x00000000
[   18.143819] nand: nand_do_read_oob: from = 0x040a0000, len = 64
[   18.150025] marvell-nfc pxa3xx-nand: 
[   18.150025] NDCR:  0x9d079fff
[   18.150025] NDCB0: 0x000d3000
[   18.150025] NDCB1: 0x81400000
[   18.150025] NDCB2: 0x00000000
[   18.150025] NDCB3: 0x00000000
[   18.169138] nand: nand_do_read_oob: from = 0x040c0000, len = 64
[   18.175176] marvell-nfc pxa3xx-nand: 
[   18.175176] NDCR:  0x9d079fff
[   18.175176] NDCB0: 0x000d3000
[   18.175176] NDCB1: 0x81800000
[   18.175176] NDCB2: 0x00000000
[   18.175176] NDCB3: 0x00000000
[   18.194125] nand: nand_do_read_oob: from = 0x040e0000, len = 64
[   18.200329] marvell-nfc pxa3xx-nand: 
[   18.200329] NDCR:  0x9d079fff
[   18.200329] NDCB0: 0x000d3000
[   18.200329] NDCB1: 0x81c00000
[   18.200329] NDCB2: 0x00000000
[   18.200329] NDCB3: 0x00000000
[   18.219258] nand: nand_do_read_oob: from = 0x04100000, len = 64
[   18.225289] marvell-nfc pxa3xx-nand: 
[   18.225289] NDCR:  0x9d079fff
[   18.225289] NDCB0: 0x000d3000
[   18.225289] NDCB1: 0x82000000
[   18.225289] NDCB2: 0x00000000
[   18.225289] NDCB3: 0x00000000
[   18.244221] nand: nand_do_read_oob: from = 0x04120000, len = 64
[   18.250430] marvell-nfc pxa3xx-nand: 
[   18.250430] NDCR:  0x9d079fff
[   18.250430] NDCB0: 0x000d3000
[   18.250430] NDCB1: 0x82400000
[   18.250430] NDCB2: 0x00000000
[   18.250430] NDCB3: 0x00000000
[   18.269353] nand: nand_do_read_oob: from = 0x04140000, len = 64
[   18.275388] marvell-nfc pxa3xx-nand: 
[   18.275388] NDCR:  0x9d079fff
[   18.275388] NDCB0: 0x000d3000
[   18.275388] NDCB1: 0x82800000
[   18.275388] NDCB2: 0x00000000
[   18.275388] NDCB3: 0x00000000
[   18.294322] nand: nand_do_read_oob: from = 0x04160000, len = 64
[   18.300526] marvell-nfc pxa3xx-nand: 
[   18.300526] NDCR:  0x9d079fff
[   18.300526] NDCB0: 0x000d3000
[   18.300526] NDCB1: 0x82c00000
[   18.300526] NDCB2: 0x00000000
[   18.300526] NDCB3: 0x00000000
[   18.319453] nand: nand_do_read_oob: from = 0x04180000, len = 64
[   18.325486] marvell-nfc pxa3xx-nand: 
[   18.325486] NDCR:  0x9d079fff
[   18.325486] NDCB0: 0x000d3000
[   18.325486] NDCB1: 0x83000000
[   18.325486] NDCB2: 0x00000000
[   18.325486] NDCB3: 0x00000000
[   18.344419] nand: nand_do_read_oob: from = 0x041a0000, len = 64
[   18.350626] marvell-nfc pxa3xx-nand: 
[   18.350626] NDCR:  0x9d079fff
[   18.350626] NDCB0: 0x000d3000
[   18.350626] NDCB1: 0x83400000
[   18.350626] NDCB2: 0x00000000
[   18.350626] NDCB3: 0x00000000
[   18.369553] nand: nand_do_read_oob: from = 0x041c0000, len = 64
[   18.375583] marvell-nfc pxa3xx-nand: 
[   18.375583] NDCR:  0x9d079fff
[   18.375583] NDCB0: 0x000d3000
[   18.375583] NDCB1: 0x83800000
[   18.375583] NDCB2: 0x00000000
[   18.375583] NDCB3: 0x00000000
[   18.394516] nand: nand_do_read_oob: from = 0x041e0000, len = 64
[   18.400721] marvell-nfc pxa3xx-nand: 
[   18.400721] NDCR:  0x9d079fff
[   18.400721] NDCB0: 0x000d3000
[   18.400721] NDCB1: 0x83c00000
[   18.400721] NDCB2: 0x00000000
[   18.400721] NDCB3: 0x00000000
[   18.419652] nand: nand_do_read_oob: from = 0x04200000, len = 64
[   18.425684] marvell-nfc pxa3xx-nand: 
[   18.425684] NDCR:  0x9d079fff
[   18.425684] NDCB0: 0x000d3000
[   18.425684] NDCB1: 0x84000000
[   18.425684] NDCB2: 0x00000000
[   18.425684] NDCB3: 0x00000000
[   18.444614] nand: nand_do_read_oob: from = 0x04220000, len = 64
[   18.450822] marvell-nfc pxa3xx-nand: 
[   18.450822] NDCR:  0x9d079fff
[   18.450822] NDCB0: 0x000d3000
[   18.450822] NDCB1: 0x84400000
[   18.450822] NDCB2: 0x00000000
[   18.450822] NDCB3: 0x00000000
[   18.469750] nand: nand_do_read_oob: from = 0x04240000, len = 64
[   18.475780] marvell-nfc pxa3xx-nand: 
[   18.475780] NDCR:  0x9d079fff
[   18.475780] NDCB0: 0x000d3000
[   18.475780] NDCB1: 0x84800000
[   18.475780] NDCB2: 0x00000000
[   18.475780] NDCB3: 0x00000000
[   18.494735] nand: nand_do_read_oob: from = 0x04260000, len = 64
[   18.500935] marvell-nfc pxa3xx-nand: 
[   18.500935] NDCR:  0x9d079fff
[   18.500935] NDCB0: 0x000d3000
[   18.500935] NDCB1: 0x84c00000
[   18.500935] NDCB2: 0x00000000
[   18.500935] NDCB3: 0x00000000
[   18.519864] nand: nand_do_read_oob: from = 0x04280000, len = 64
[   18.525897] marvell-nfc pxa3xx-nand: 
[   18.525897] NDCR:  0x9d079fff
[   18.525897] NDCB0: 0x000d3000
[   18.525897] NDCB1: 0x85000000
[   18.525897] NDCB2: 0x00000000
[   18.525897] NDCB3: 0x00000000
[   18.544830] nand: nand_do_read_oob: from = 0x042a0000, len = 64
[   18.551034] marvell-nfc pxa3xx-nand: 
[   18.551034] NDCR:  0x9d079fff
[   18.551034] NDCB0: 0x000d3000
[   18.551034] NDCB1: 0x85400000
[   18.551034] NDCB2: 0x00000000
[   18.551034] NDCB3: 0x00000000
[   18.569963] nand: nand_do_read_oob: from = 0x042c0000, len = 64
[   18.575995] marvell-nfc pxa3xx-nand: 
[   18.575995] NDCR:  0x9d079fff
[   18.575995] NDCB0: 0x000d3000
[   18.575995] NDCB1: 0x85800000
[   18.575995] NDCB2: 0x00000000
[   18.575995] NDCB3: 0x00000000
[   18.594927] nand: nand_do_read_oob: from = 0x042e0000, len = 64
[   18.601124] marvell-nfc pxa3xx-nand: 
[   18.601124] NDCR:  0x9d079fff
[   18.601124] NDCB0: 0x000d3000
[   18.601124] NDCB1: 0x85c00000
[   18.601124] NDCB2: 0x00000000
[   18.601124] NDCB3: 0x00000000
[   18.620051] nand: nand_do_read_oob: from = 0x04300000, len = 64
[   18.626085] marvell-nfc pxa3xx-nand: 
[   18.626085] NDCR:  0x9d079fff
[   18.626085] NDCB0: 0x000d3000
[   18.626085] NDCB1: 0x86000000
[   18.626085] NDCB2: 0x00000000
[   18.626085] NDCB3: 0x00000000
[   18.645017] nand: nand_do_read_oob: from = 0x04320000, len = 64
[   18.651221] marvell-nfc pxa3xx-nand: 
[   18.651221] NDCR:  0x9d079fff
[   18.651221] NDCB0: 0x000d3000
[   18.651221] NDCB1: 0x86400000
[   18.651221] NDCB2: 0x00000000
[   18.651221] NDCB3: 0x00000000
[   18.670152] nand: nand_do_read_oob: from = 0x04340000, len = 64
[   18.676184] marvell-nfc pxa3xx-nand: 
[   18.676184] NDCR:  0x9d079fff
[   18.676184] NDCB0: 0x000d3000
[   18.676184] NDCB1: 0x86800000
[   18.676184] NDCB2: 0x00000000
[   18.676184] NDCB3: 0x00000000
[   18.695116] nand: nand_do_read_oob: from = 0x04360000, len = 64
[   18.701320] marvell-nfc pxa3xx-nand: 
[   18.701320] NDCR:  0x9d079fff
[   18.701320] NDCB0: 0x000d3000
[   18.701320] NDCB1: 0x86c00000
[   18.701320] NDCB2: 0x00000000
[   18.701320] NDCB3: 0x00000000
[   18.720253] nand: nand_do_read_oob: from = 0x04380000, len = 64
[   18.726282] marvell-nfc pxa3xx-nand: 
[   18.726282] NDCR:  0x9d079fff
[   18.726282] NDCB0: 0x000d3000
[   18.726282] NDCB1: 0x87000000
[   18.726282] NDCB2: 0x00000000
[   18.726282] NDCB3: 0x00000000
[   18.745218] nand: nand_do_read_oob: from = 0x043a0000, len = 64
[   18.751419] marvell-nfc pxa3xx-nand: 
[   18.751419] NDCR:  0x9d079fff
[   18.751419] NDCB0: 0x000d3000
[   18.751419] NDCB1: 0x87400000
[   18.751419] NDCB2: 0x00000000
[   18.751419] NDCB3: 0x00000000
[   18.770352] nand: nand_do_read_oob: from = 0x043c0000, len = 64
[   18.776381] marvell-nfc pxa3xx-nand: 
[   18.776381] NDCR:  0x9d079fff
[   18.776381] NDCB0: 0x000d3000
[   18.776381] NDCB1: 0x87800000
[   18.776381] NDCB2: 0x00000000
[   18.776381] NDCB3: 0x00000000
[   18.795312] nand: nand_do_read_oob: from = 0x043e0000, len = 64
[   18.801519] marvell-nfc pxa3xx-nand: 
[   18.801519] NDCR:  0x9d079fff
[   18.801519] NDCB0: 0x000d3000
[   18.801519] NDCB1: 0x87c00000
[   18.801519] NDCB2: 0x00000000
[   18.801519] NDCB3: 0x00000000
[   18.820449] nand: nand_do_read_oob: from = 0x04400000, len = 64
[   18.826479] marvell-nfc pxa3xx-nand: 
[   18.826479] NDCR:  0x9d079fff
[   18.826479] NDCB0: 0x000d3000
[   18.826479] NDCB1: 0x88000000
[   18.826479] NDCB2: 0x00000000
[   18.826479] NDCB3: 0x00000000
[   18.845411] nand: nand_do_read_oob: from = 0x04420000, len = 64
[   18.851615] marvell-nfc pxa3xx-nand: 
[   18.851615] NDCR:  0x9d079fff
[   18.851615] NDCB0: 0x000d3000
[   18.851615] NDCB1: 0x88400000
[   18.851615] NDCB2: 0x00000000
[   18.851615] NDCB3: 0x00000000
[   18.870547] nand: nand_do_read_oob: from = 0x04440000, len = 64
[   18.876578] marvell-nfc pxa3xx-nand: 
[   18.876578] NDCR:  0x9d079fff
[   18.876578] NDCB0: 0x000d3000
[   18.876578] NDCB1: 0x88800000
[   18.876578] NDCB2: 0x00000000
[   18.876578] NDCB3: 0x00000000
[   18.895510] nand: nand_do_read_oob: from = 0x04460000, len = 64
[   18.901716] marvell-nfc pxa3xx-nand: 
[   18.901716] NDCR:  0x9d079fff
[   18.901716] NDCB0: 0x000d3000
[   18.901716] NDCB1: 0x88c00000
[   18.901716] NDCB2: 0x00000000
[   18.901716] NDCB3: 0x00000000
[   18.920645] nand: nand_do_read_oob: from = 0x04480000, len = 64
[   18.926675] marvell-nfc pxa3xx-nand: 
[   18.926675] NDCR:  0x9d079fff
[   18.926675] NDCB0: 0x000d3000
[   18.926675] NDCB1: 0x89000000
[   18.926675] NDCB2: 0x00000000
[   18.926675] NDCB3: 0x00000000
[   18.945611] nand: nand_do_read_oob: from = 0x044a0000, len = 64
[   18.951814] marvell-nfc pxa3xx-nand: 
[   18.951814] NDCR:  0x9d079fff
[   18.951814] NDCB0: 0x000d3000
[   18.951814] NDCB1: 0x89400000
[   18.951814] NDCB2: 0x00000000
[   18.951814] NDCB3: 0x00000000
[   18.970742] nand: nand_do_read_oob: from = 0x044c0000, len = 64
[   18.976775] marvell-nfc pxa3xx-nand: 
[   18.976775] NDCR:  0x9d079fff
[   18.976775] NDCB0: 0x000d3000
[   18.976775] NDCB1: 0x89800000
[   18.976775] NDCB2: 0x00000000
[   18.976775] NDCB3: 0x00000000
[   18.995706] nand: nand_do_read_oob: from = 0x044e0000, len = 64
[   19.001914] marvell-nfc pxa3xx-nand: 
[   19.001914] NDCR:  0x9d079fff
[   19.001914] NDCB0: 0x000d3000
[   19.001914] NDCB1: 0x89c00000
[   19.001914] NDCB2: 0x00000000
[   19.001914] NDCB3: 0x00000000
[   19.020852] nand: nand_do_read_oob: from = 0x04500000, len = 64
[   19.026882] marvell-nfc pxa3xx-nand: 
[   19.026882] NDCR:  0x9d079fff
[   19.026882] NDCB0: 0x000d3000
[   19.026882] NDCB1: 0x8a000000
[   19.026882] NDCB2: 0x00000000
[   19.026882] NDCB3: 0x00000000
[   19.045816] nand: nand_do_read_oob: from = 0x04520000, len = 64
[   19.052021] marvell-nfc pxa3xx-nand: 
[   19.052021] NDCR:  0x9d079fff
[   19.052021] NDCB0: 0x000d3000
[   19.052021] NDCB1: 0x8a400000
[   19.052021] NDCB2: 0x00000000
[   19.052021] NDCB3: 0x00000000
[   19.070947] nand: nand_do_read_oob: from = 0x04540000, len = 64
[   19.076981] marvell-nfc pxa3xx-nand: 
[   19.076981] NDCR:  0x9d079fff
[   19.076981] NDCB0: 0x000d3000
[   19.076981] NDCB1: 0x8a800000
[   19.076981] NDCB2: 0x00000000
[   19.076981] NDCB3: 0x00000000
[   19.095913] nand: nand_do_read_oob: from = 0x04560000, len = 64
[   19.102117] marvell-nfc pxa3xx-nand: 
[   19.102117] NDCR:  0x9d079fff
[   19.102117] NDCB0: 0x000d3000
[   19.102117] NDCB1: 0x8ac00000
[   19.102117] NDCB2: 0x00000000
[   19.102117] NDCB3: 0x00000000
[   19.121062] nand: nand_do_read_oob: from = 0x04580000, len = 64
[   19.127097] marvell-nfc pxa3xx-nand: 
[   19.127097] NDCR:  0x9d079fff
[   19.127097] NDCB0: 0x000d3000
[   19.127097] NDCB1: 0x8b000000
[   19.127097] NDCB2: 0x00000000
[   19.127097] NDCB3: 0x00000000
[   19.146031] nand: nand_do_read_oob: from = 0x045a0000, len = 64
[   19.152232] marvell-nfc pxa3xx-nand: 
[   19.152232] NDCR:  0x9d079fff
[   19.152232] NDCB0: 0x000d3000
[   19.152232] NDCB1: 0x8b400000
[   19.152232] NDCB2: 0x00000000
[   19.152232] NDCB3: 0x00000000
[   19.171165] nand: nand_do_read_oob: from = 0x045c0000, len = 64
[   19.177195] marvell-nfc pxa3xx-nand: 
[   19.177195] NDCR:  0x9d079fff
[   19.177195] NDCB0: 0x000d3000
[   19.177195] NDCB1: 0x8b800000
[   19.177195] NDCB2: 0x00000000
[   19.177195] NDCB3: 0x00000000
[   19.196127] nand: nand_do_read_oob: from = 0x045e0000, len = 64
[   19.202330] marvell-nfc pxa3xx-nand: 
[   19.202330] NDCR:  0x9d079fff
[   19.202330] NDCB0: 0x000d3000
[   19.202330] NDCB1: 0x8bc00000
[   19.202330] NDCB2: 0x00000000
[   19.202330] NDCB3: 0x00000000
[   19.221261] nand: nand_do_read_oob: from = 0x04600000, len = 64
[   19.227293] marvell-nfc pxa3xx-nand: 
[   19.227293] NDCR:  0x9d079fff
[   19.227293] NDCB0: 0x000d3000
[   19.227293] NDCB1: 0x8c000000
[   19.227293] NDCB2: 0x00000000
[   19.227293] NDCB3: 0x00000000
[   19.246223] nand: nand_do_read_oob: from = 0x04620000, len = 64
[   19.252421] marvell-nfc pxa3xx-nand: 
[   19.252421] NDCR:  0x9d079fff
[   19.252421] NDCB0: 0x000d3000
[   19.252421] NDCB1: 0x8c400000
[   19.252421] NDCB2: 0x00000000
[   19.252421] NDCB3: 0x00000000
[   19.271348] nand: nand_do_read_oob: from = 0x04640000, len = 64
[   19.277383] marvell-nfc pxa3xx-nand: 
[   19.277383] NDCR:  0x9d079fff
[   19.277383] NDCB0: 0x000d3000
[   19.277383] NDCB1: 0x8c800000
[   19.277383] NDCB2: 0x00000000
[   19.277383] NDCB3: 0x00000000
[   19.296316] nand: nand_do_read_oob: from = 0x04660000, len = 64
[   19.302521] marvell-nfc pxa3xx-nand: 
[   19.302521] NDCR:  0x9d079fff
[   19.302521] NDCB0: 0x000d3000
[   19.302521] NDCB1: 0x8cc00000
[   19.302521] NDCB2: 0x00000000
[   19.302521] NDCB3: 0x00000000
[   19.321450] nand: nand_do_read_oob: from = 0x04680000, len = 64
[   19.327482] marvell-nfc pxa3xx-nand: 
[   19.327482] NDCR:  0x9d079fff
[   19.327482] NDCB0: 0x000d3000
[   19.327482] NDCB1: 0x8d000000
[   19.327482] NDCB2: 0x00000000
[   19.327482] NDCB3: 0x00000000
[   19.346415] nand: nand_do_read_oob: from = 0x046a0000, len = 64
[   19.352619] marvell-nfc pxa3xx-nand: 
[   19.352619] NDCR:  0x9d079fff
[   19.352619] NDCB0: 0x000d3000
[   19.352619] NDCB1: 0x8d400000
[   19.352619] NDCB2: 0x00000000
[   19.352619] NDCB3: 0x00000000
[   19.371548] nand: nand_do_read_oob: from = 0x046c0000, len = 64
[   19.377579] marvell-nfc pxa3xx-nand: 
[   19.377579] NDCR:  0x9d079fff
[   19.377579] NDCB0: 0x000d3000
[   19.377579] NDCB1: 0x8d800000
[   19.377579] NDCB2: 0x00000000
[   19.377579] NDCB3: 0x00000000
[   19.396512] nand: nand_do_read_oob: from = 0x046e0000, len = 64
[   19.402716] marvell-nfc pxa3xx-nand: 
[   19.402716] NDCR:  0x9d079fff
[   19.402716] NDCB0: 0x000d3000
[   19.402716] NDCB1: 0x8dc00000
[   19.402716] NDCB2: 0x00000000
[   19.402716] NDCB3: 0x00000000
[   19.421645] nand: nand_do_read_oob: from = 0x04700000, len = 64
[   19.427679] marvell-nfc pxa3xx-nand: 
[   19.427679] NDCR:  0x9d079fff
[   19.427679] NDCB0: 0x000d3000
[   19.427679] NDCB1: 0x8e000000
[   19.427679] NDCB2: 0x00000000
[   19.427679] NDCB3: 0x00000000
[   19.446611] nand: nand_do_read_oob: from = 0x04720000, len = 64
[   19.452815] marvell-nfc pxa3xx-nand: 
[   19.452815] NDCR:  0x9d079fff
[   19.452815] NDCB0: 0x000d3000
[   19.452815] NDCB1: 0x8e400000
[   19.452815] NDCB2: 0x00000000
[   19.452815] NDCB3: 0x00000000
[   19.471747] nand: nand_do_read_oob: from = 0x04740000, len = 64
[   19.477777] marvell-nfc pxa3xx-nand: 
[   19.477777] NDCR:  0x9d079fff
[   19.477777] NDCB0: 0x000d3000
[   19.477777] NDCB1: 0x8e800000
[   19.477777] NDCB2: 0x00000000
[   19.477777] NDCB3: 0x00000000
[   19.496711] nand: nand_do_read_oob: from = 0x04760000, len = 64
[   19.502915] marvell-nfc pxa3xx-nand: 
[   19.502915] NDCR:  0x9d079fff
[   19.502915] NDCB0: 0x000d3000
[   19.502915] NDCB1: 0x8ec00000
[   19.502915] NDCB2: 0x00000000
[   19.502915] NDCB3: 0x00000000
[   19.521847] nand: nand_do_read_oob: from = 0x04780000, len = 64
[   19.527875] marvell-nfc pxa3xx-nand: 
[   19.527875] NDCR:  0x9d079fff
[   19.527875] NDCB0: 0x000d3000
[   19.527875] NDCB1: 0x8f000000
[   19.527875] NDCB2: 0x00000000
[   19.527875] NDCB3: 0x00000000
[   19.546811] nand: nand_do_read_oob: from = 0x047a0000, len = 64
[   19.553012] marvell-nfc pxa3xx-nand: 
[   19.553012] NDCR:  0x9d079fff
[   19.553012] NDCB0: 0x000d3000
[   19.553012] NDCB1: 0x8f400000
[   19.553012] NDCB2: 0x00000000
[   19.553012] NDCB3: 0x00000000
[   19.571940] nand: nand_do_read_oob: from = 0x047c0000, len = 64
[   19.577974] marvell-nfc pxa3xx-nand: 
[   19.577974] NDCR:  0x9d079fff
[   19.577974] NDCB0: 0x000d3000
[   19.577974] NDCB1: 0x8f800000
[   19.577974] NDCB2: 0x00000000
[   19.577974] NDCB3: 0x00000000
[   19.596905] nand: nand_do_read_oob: from = 0x047e0000, len = 64
[   19.603111] marvell-nfc pxa3xx-nand: 
[   19.603111] NDCR:  0x9d079fff
[   19.603111] NDCB0: 0x000d3000
[   19.603111] NDCB1: 0x8fc00000
[   19.603111] NDCB2: 0x00000000
[   19.603111] NDCB3: 0x00000000
[   19.622041] nand: nand_do_read_oob: from = 0x04800000, len = 64
[   19.628071] marvell-nfc pxa3xx-nand: 
[   19.628071] NDCR:  0x9d079fff
[   19.628071] NDCB0: 0x000d3000
[   19.628071] NDCB1: 0x90000000
[   19.628071] NDCB2: 0x00000000
[   19.628071] NDCB3: 0x00000000
[   19.647004] nand: nand_do_read_oob: from = 0x04820000, len = 64
[   19.653208] marvell-nfc pxa3xx-nand: 
[   19.653208] NDCR:  0x9d079fff
[   19.653208] NDCB0: 0x000d3000
[   19.653208] NDCB1: 0x90400000
[   19.653208] NDCB2: 0x00000000
[   19.653208] NDCB3: 0x00000000
[   19.672139] nand: nand_do_read_oob: from = 0x04840000, len = 64
[   19.678169] marvell-nfc pxa3xx-nand: 
[   19.678169] NDCR:  0x9d079fff
[   19.678169] NDCB0: 0x000d3000
[   19.678169] NDCB1: 0x90800000
[   19.678169] NDCB2: 0x00000000
[   19.678169] NDCB3: 0x00000000
[   19.697104] nand: nand_do_read_oob: from = 0x04860000, len = 64
[   19.703307] marvell-nfc pxa3xx-nand: 
[   19.703307] NDCR:  0x9d079fff
[   19.703307] NDCB0: 0x000d3000
[   19.703307] NDCB1: 0x90c00000
[   19.703307] NDCB2: 0x00000000
[   19.703307] NDCB3: 0x00000000
[   19.722237] nand: nand_do_read_oob: from = 0x04880000, len = 64
[   19.728270] marvell-nfc pxa3xx-nand: 
[   19.728270] NDCR:  0x9d079fff
[   19.728270] NDCB0: 0x000d3000
[   19.728270] NDCB1: 0x91000000
[   19.728270] NDCB2: 0x00000000
[   19.728270] NDCB3: 0x00000000
[   19.747203] nand: nand_do_read_oob: from = 0x048a0000, len = 64
[   19.753406] marvell-nfc pxa3xx-nand: 
[   19.753406] NDCR:  0x9d079fff
[   19.753406] NDCB0: 0x000d3000
[   19.753406] NDCB1: 0x91400000
[   19.753406] NDCB2: 0x00000000
[   19.753406] NDCB3: 0x00000000
[   19.772354] nand: nand_do_read_oob: from = 0x048c0000, len = 64
[   19.778384] marvell-nfc pxa3xx-nand: 
[   19.778384] NDCR:  0x9d079fff
[   19.778384] NDCB0: 0x000d3000
[   19.778384] NDCB1: 0x91800000
[   19.778384] NDCB2: 0x00000000
[   19.778384] NDCB3: 0x00000000
[   19.797319] nand: nand_do_read_oob: from = 0x048e0000, len = 64
[   19.803522] marvell-nfc pxa3xx-nand: 
[   19.803522] NDCR:  0x9d079fff
[   19.803522] NDCB0: 0x000d3000
[   19.803522] NDCB1: 0x91c00000
[   19.803522] NDCB2: 0x00000000
[   19.803522] NDCB3: 0x00000000
[   19.822451] nand: nand_do_read_oob: from = 0x04900000, len = 64
[   19.828483] marvell-nfc pxa3xx-nand: 
[   19.828483] NDCR:  0x9d079fff
[   19.828483] NDCB0: 0x000d3000
[   19.828483] NDCB1: 0x92000000
[   19.828483] NDCB2: 0x00000000
[   19.828483] NDCB3: 0x00000000
[   19.847415] nand: nand_do_read_oob: from = 0x04920000, len = 64
[   19.853622] marvell-nfc pxa3xx-nand: 
[   19.853622] NDCR:  0x9d079fff
[   19.853622] NDCB0: 0x000d3000
[   19.853622] NDCB1: 0x92400000
[   19.853622] NDCB2: 0x00000000
[   19.853622] NDCB3: 0x00000000
[   19.872550] nand: nand_do_read_oob: from = 0x04940000, len = 64
[   19.878582] marvell-nfc pxa3xx-nand: 
[   19.878582] NDCR:  0x9d079fff
[   19.878582] NDCB0: 0x000d3000
[   19.878582] NDCB1: 0x92800000
[   19.878582] NDCB2: 0x00000000
[   19.878582] NDCB3: 0x00000000
[   19.897623] nand: nand_do_read_oob: from = 0x04960000, len = 64
[   19.903821] marvell-nfc pxa3xx-nand: 
[   19.903821] NDCR:  0x9d079fff
[   19.903821] NDCB0: 0x000d3000
[   19.903821] NDCB1: 0x92c00000
[   19.903821] NDCB2: 0x00000000
[   19.903821] NDCB3: 0x00000000
[   19.922750] nand: nand_do_read_oob: from = 0x04980000, len = 64
[   19.928953] marvell-nfc pxa3xx-nand: 
[   19.928953] NDCR:  0x9d079fff
[   19.928953] NDCB0: 0x000d3000
[   19.928953] NDCB1: 0x93000000
[   19.928953] NDCB2: 0x00000000
[   19.928953] NDCB3: 0x00000000
[   19.947873] nand: nand_do_read_oob: from = 0x049a0000, len = 64
[   19.954076] marvell-nfc pxa3xx-nand: 
[   19.954076] NDCR:  0x9d079fff
[   19.954076] NDCB0: 0x000d3000
[   19.954076] NDCB1: 0x93400000
[   19.954076] NDCB2: 0x00000000
[   19.954076] NDCB3: 0x00000000
[   19.973005] nand: nand_do_read_oob: from = 0x049c0000, len = 64
[   19.979207] marvell-nfc pxa3xx-nand: 
[   19.979207] NDCR:  0x9d079fff
[   19.979207] NDCB0: 0x000d3000
[   19.979207] NDCB1: 0x93800000
[   19.979207] NDCB2: 0x00000000
[   19.979207] NDCB3: 0x00000000
[   19.998127] nand: nand_do_read_oob: from = 0x049e0000, len = 64
[   20.004328] marvell-nfc pxa3xx-nand: 
[   20.004328] NDCR:  0x9d079fff
[   20.004328] NDCB0: 0x000d3000
[   20.004328] NDCB1: 0x93c00000
[   20.004328] NDCB2: 0x00000000
[   20.004328] NDCB3: 0x00000000
[   20.023259] nand: nand_do_read_oob: from = 0x04a00000, len = 64
[   20.029461] marvell-nfc pxa3xx-nand: 
[   20.029461] NDCR:  0x9d079fff
[   20.029461] NDCB0: 0x000d3000
[   20.029461] NDCB1: 0x94000000
[   20.029461] NDCB2: 0x00000000
[   20.029461] NDCB3: 0x00000000
[   20.048382] nand: nand_do_read_oob: from = 0x04a20000, len = 64
[   20.054584] marvell-nfc pxa3xx-nand: 
[   20.054584] NDCR:  0x9d079fff
[   20.054584] NDCB0: 0x000d3000
[   20.054584] NDCB1: 0x94400000
[   20.054584] NDCB2: 0x00000000
[   20.054584] NDCB3: 0x00000000
[   20.073513] nand: nand_do_read_oob: from = 0x04a40000, len = 64
[   20.079714] marvell-nfc pxa3xx-nand: 
[   20.079714] NDCR:  0x9d079fff
[   20.079714] NDCB0: 0x000d3000
[   20.079714] NDCB1: 0x94800000
[   20.079714] NDCB2: 0x00000000
[   20.079714] NDCB3: 0x00000000
[   20.099204] nand: nand_do_read_oob: from = 0x04a60000, len = 64
[   20.105249] marvell-nfc pxa3xx-nand: 
[   20.105249] NDCR:  0x9d079fff
[   20.105249] NDCB0: 0x000d3000
[   20.105249] NDCB1: 0x94c00000
[   20.105249] NDCB2: 0x00000000
[   20.105249] NDCB3: 0x00000000
[   20.124202] nand: nand_do_read_oob: from = 0x04a80000, len = 64
[   20.130406] marvell-nfc pxa3xx-nand: 
[   20.130406] NDCR:  0x9d079fff
[   20.130406] NDCB0: 0x000d3000
[   20.130406] NDCB1: 0x95000000
[   20.130406] NDCB2: 0x00000000
[   20.130406] NDCB3: 0x00000000
[   20.149339] nand: nand_do_read_oob: from = 0x04aa0000, len = 64
[   20.155367] marvell-nfc pxa3xx-nand: 
[   20.155367] NDCR:  0x9d079fff
[   20.155367] NDCB0: 0x000d3000
[   20.155367] NDCB1: 0x95400000
[   20.155367] NDCB2: 0x00000000
[   20.155367] NDCB3: 0x00000000
[   20.174300] nand: nand_do_read_oob: from = 0x04ac0000, len = 64
[   20.180506] marvell-nfc pxa3xx-nand: 
[   20.180506] NDCR:  0x9d079fff
[   20.180506] NDCB0: 0x000d3000
[   20.180506] NDCB1: 0x95800000
[   20.180506] NDCB2: 0x00000000
[   20.180506] NDCB3: 0x00000000
[   20.199435] nand: nand_do_read_oob: from = 0x04ae0000, len = 64
[   20.205466] marvell-nfc pxa3xx-nand: 
[   20.205466] NDCR:  0x9d079fff
[   20.205466] NDCB0: 0x000d3000
[   20.205466] NDCB1: 0x95c00000
[   20.205466] NDCB2: 0x00000000
[   20.205466] NDCB3: 0x00000000
[   20.224398] nand: nand_do_read_oob: from = 0x04b00000, len = 64
[   20.230595] marvell-nfc pxa3xx-nand: 
[   20.230595] NDCR:  0x9d079fff
[   20.230595] NDCB0: 0x000d3000
[   20.230595] NDCB1: 0x96000000
[   20.230595] NDCB2: 0x00000000
[   20.230595] NDCB3: 0x00000000
[   20.249526] nand: nand_do_read_oob: from = 0x04b20000, len = 64
[   20.255556] marvell-nfc pxa3xx-nand: 
[   20.255556] NDCR:  0x9d079fff
[   20.255556] NDCB0: 0x000d3000
[   20.255556] NDCB1: 0x96400000
[   20.255556] NDCB2: 0x00000000
[   20.255556] NDCB3: 0x00000000
[   20.274489] nand: nand_do_read_oob: from = 0x04b40000, len = 64
[   20.280694] marvell-nfc pxa3xx-nand: 
[   20.280694] NDCR:  0x9d079fff
[   20.280694] NDCB0: 0x000d3000
[   20.280694] NDCB1: 0x96800000
[   20.280694] NDCB2: 0x00000000
[   20.280694] NDCB3: 0x00000000
[   20.299624] nand: nand_do_read_oob: from = 0x04b60000, len = 64
[   20.305656] marvell-nfc pxa3xx-nand: 
[   20.305656] NDCR:  0x9d079fff
[   20.305656] NDCB0: 0x000d3000
[   20.305656] NDCB1: 0x96c00000
[   20.305656] NDCB2: 0x00000000
[   20.305656] NDCB3: 0x00000000
[   20.324591] nand: nand_do_read_oob: from = 0x04b80000, len = 64
[   20.330794] marvell-nfc pxa3xx-nand: 
[   20.330794] NDCR:  0x9d079fff
[   20.330794] NDCB0: 0x000d3000
[   20.330794] NDCB1: 0x97000000
[   20.330794] NDCB2: 0x00000000
[   20.330794] NDCB3: 0x00000000
[   20.349743] nand: nand_do_read_oob: from = 0x04ba0000, len = 64
[   20.355778] marvell-nfc pxa3xx-nand: 
[   20.355778] NDCR:  0x9d079fff
[   20.355778] NDCB0: 0x000d3000
[   20.355778] NDCB1: 0x97400000
[   20.355778] NDCB2: 0x00000000
[   20.355778] NDCB3: 0x00000000
[   20.374714] nand: nand_do_read_oob: from = 0x04bc0000, len = 64
[   20.380920] marvell-nfc pxa3xx-nand: 
[   20.380920] NDCR:  0x9d079fff
[   20.380920] NDCB0: 0x000d3000
[   20.380920] NDCB1: 0x97800000
[   20.380920] NDCB2: 0x00000000
[   20.380920] NDCB3: 0x00000000
[   20.399846] nand: nand_do_read_oob: from = 0x04be0000, len = 64
[   20.405878] marvell-nfc pxa3xx-nand: 
[   20.405878] NDCR:  0x9d079fff
[   20.405878] NDCB0: 0x000d3000
[   20.405878] NDCB1: 0x97c00000
[   20.405878] NDCB2: 0x00000000
[   20.405878] NDCB3: 0x00000000
[   20.424811] nand: nand_do_read_oob: from = 0x04c00000, len = 64
[   20.431017] marvell-nfc pxa3xx-nand: 
[   20.431017] NDCR:  0x9d079fff
[   20.431017] NDCB0: 0x000d3000
[   20.431017] NDCB1: 0x98000000
[   20.431017] NDCB2: 0x00000000
[   20.431017] NDCB3: 0x00000000
[   20.449946] nand: nand_do_read_oob: from = 0x04c20000, len = 64
[   20.455976] marvell-nfc pxa3xx-nand: 
[   20.455976] NDCR:  0x9d079fff
[   20.455976] NDCB0: 0x000d3000
[   20.455976] NDCB1: 0x98400000
[   20.455976] NDCB2: 0x00000000
[   20.455976] NDCB3: 0x00000000
[   20.474907] nand: nand_do_read_oob: from = 0x04c40000, len = 64
[   20.481105] marvell-nfc pxa3xx-nand: 
[   20.481105] NDCR:  0x9d079fff
[   20.481105] NDCB0: 0x000d3000
[   20.481105] NDCB1: 0x98800000
[   20.481105] NDCB2: 0x00000000
[   20.481105] NDCB3: 0x00000000
[   20.500035] nand: nand_do_read_oob: from = 0x04c60000, len = 64
[   20.506065] marvell-nfc pxa3xx-nand: 
[   20.506065] NDCR:  0x9d079fff
[   20.506065] NDCB0: 0x000d3000
[   20.506065] NDCB1: 0x98c00000
[   20.506065] NDCB2: 0x00000000
[   20.506065] NDCB3: 0x00000000
[   20.525001] nand: nand_do_read_oob: from = 0x04c80000, len = 64
[   20.531206] marvell-nfc pxa3xx-nand: 
[   20.531206] NDCR:  0x9d079fff
[   20.531206] NDCB0: 0x000d3000
[   20.531206] NDCB1: 0x99000000
[   20.531206] NDCB2: 0x00000000
[   20.531206] NDCB3: 0x00000000
[   20.550132] nand: nand_do_read_oob: from = 0x04ca0000, len = 64
[   20.556164] marvell-nfc pxa3xx-nand: 
[   20.556164] NDCR:  0x9d079fff
[   20.556164] NDCB0: 0x000d3000
[   20.556164] NDCB1: 0x99400000
[   20.556164] NDCB2: 0x00000000
[   20.556164] NDCB3: 0x00000000
[   20.575095] nand: nand_do_read_oob: from = 0x04cc0000, len = 64
[   20.581301] marvell-nfc pxa3xx-nand: 
[   20.581301] NDCR:  0x9d079fff
[   20.581301] NDCB0: 0x000d3000
[   20.581301] NDCB1: 0x99800000
[   20.581301] NDCB2: 0x00000000
[   20.581301] NDCB3: 0x00000000
[   20.600230] nand: nand_do_read_oob: from = 0x04ce0000, len = 64
[   20.606263] marvell-nfc pxa3xx-nand: 
[   20.606263] NDCR:  0x9d079fff
[   20.606263] NDCB0: 0x000d3000
[   20.606263] NDCB1: 0x99c00000
[   20.606263] NDCB2: 0x00000000
[   20.606263] NDCB3: 0x00000000
[   20.625194] nand: nand_do_read_oob: from = 0x04d00000, len = 64
[   20.631401] marvell-nfc pxa3xx-nand: 
[   20.631401] NDCR:  0x9d079fff
[   20.631401] NDCB0: 0x000d3000
[   20.631401] NDCB1: 0x9a000000
[   20.631401] NDCB2: 0x00000000
[   20.631401] NDCB3: 0x00000000
[   20.650328] nand: nand_do_read_oob: from = 0x04d20000, len = 64
[   20.656361] marvell-nfc pxa3xx-nand: 
[   20.656361] NDCR:  0x9d079fff
[   20.656361] NDCB0: 0x000d3000
[   20.656361] NDCB1: 0x9a400000
[   20.656361] NDCB2: 0x00000000
[   20.656361] NDCB3: 0x00000000
[   20.675294] nand: nand_do_read_oob: from = 0x04d40000, len = 64
[   20.681497] marvell-nfc pxa3xx-nand: 
[   20.681497] NDCR:  0x9d079fff
[   20.681497] NDCB0: 0x000d3000
[   20.681497] NDCB1: 0x9a800000
[   20.681497] NDCB2: 0x00000000
[   20.681497] NDCB3: 0x00000000
[   20.700426] nand: nand_do_read_oob: from = 0x04d60000, len = 64
[   20.706460] marvell-nfc pxa3xx-nand: 
[   20.706460] NDCR:  0x9d079fff
[   20.706460] NDCB0: 0x000d3000
[   20.706460] NDCB1: 0x9ac00000
[   20.706460] NDCB2: 0x00000000
[   20.706460] NDCB3: 0x00000000
[   20.725393] nand: nand_do_read_oob: from = 0x04d80000, len = 64
[   20.731598] marvell-nfc pxa3xx-nand: 
[   20.731598] NDCR:  0x9d079fff
[   20.731598] NDCB0: 0x000d3000
[   20.731598] NDCB1: 0x9b000000
[   20.731598] NDCB2: 0x00000000
[   20.731598] NDCB3: 0x00000000
[   20.750528] nand: nand_do_read_oob: from = 0x04da0000, len = 64
[   20.756559] marvell-nfc pxa3xx-nand: 
[   20.756559] NDCR:  0x9d079fff
[   20.756559] NDCB0: 0x000d3000
[   20.756559] NDCB1: 0x9b400000
[   20.756559] NDCB2: 0x00000000
[   20.756559] NDCB3: 0x00000000
[   20.775492] nand: nand_do_read_oob: from = 0x04dc0000, len = 64
[   20.781697] marvell-nfc pxa3xx-nand: 
[   20.781697] NDCR:  0x9d079fff
[   20.781697] NDCB0: 0x000d3000
[   20.781697] NDCB1: 0x9b800000
[   20.781697] NDCB2: 0x00000000
[   20.781697] NDCB3: 0x00000000
[   20.800624] nand: nand_do_read_oob: from = 0x04de0000, len = 64
[   20.806657] marvell-nfc pxa3xx-nand: 
[   20.806657] NDCR:  0x9d079fff
[   20.806657] NDCB0: 0x000d3000
[   20.806657] NDCB1: 0x9bc00000
[   20.806657] NDCB2: 0x00000000
[   20.806657] NDCB3: 0x00000000
[   20.825589] nand: nand_do_read_oob: from = 0x04e00000, len = 64
[   20.831793] marvell-nfc pxa3xx-nand: 
[   20.831793] NDCR:  0x9d079fff
[   20.831793] NDCB0: 0x000d3000
[   20.831793] NDCB1: 0x9c000000
[   20.831793] NDCB2: 0x00000000
[   20.831793] NDCB3: 0x00000000
[   20.850723] nand: nand_do_read_oob: from = 0x04e20000, len = 64
[   20.856756] marvell-nfc pxa3xx-nand: 
[   20.856756] NDCR:  0x9d079fff
[   20.856756] NDCB0: 0x000d3000
[   20.856756] NDCB1: 0x9c400000
[   20.856756] NDCB2: 0x00000000
[   20.856756] NDCB3: 0x00000000
[   20.875687] nand: nand_do_read_oob: from = 0x04e40000, len = 64
[   20.881891] marvell-nfc pxa3xx-nand: 
[   20.881891] NDCR:  0x9d079fff
[   20.881891] NDCB0: 0x000d3000
[   20.881891] NDCB1: 0x9c800000
[   20.881891] NDCB2: 0x00000000
[   20.881891] NDCB3: 0x00000000
[   20.900823] nand: nand_do_read_oob: from = 0x04e60000, len = 64
[   20.906854] marvell-nfc pxa3xx-nand: 
[   20.906854] NDCR:  0x9d079fff
[   20.906854] NDCB0: 0x000d3000
[   20.906854] NDCB1: 0x9cc00000
[   20.906854] NDCB2: 0x00000000
[   20.906854] NDCB3: 0x00000000
[   20.925784] nand: nand_do_read_oob: from = 0x04e80000, len = 64
[   20.931982] marvell-nfc pxa3xx-nand: 
[   20.931982] NDCR:  0x9d079fff
[   20.931982] NDCB0: 0x000d3000
[   20.931982] NDCB1: 0x9d000000
[   20.931982] NDCB2: 0x00000000
[   20.931982] NDCB3: 0x00000000
[   20.950911] nand: nand_do_read_oob: from = 0x04ea0000, len = 64
[   20.956944] marvell-nfc pxa3xx-nand: 
[   20.956944] NDCR:  0x9d079fff
[   20.956944] NDCB0: 0x000d3000
[   20.956944] NDCB1: 0x9d400000
[   20.956944] NDCB2: 0x00000000
[   20.956944] NDCB3: 0x00000000
[   20.975876] nand: nand_do_read_oob: from = 0x04ec0000, len = 64
[   20.982081] marvell-nfc pxa3xx-nand: 
[   20.982081] NDCR:  0x9d079fff
[   20.982081] NDCB0: 0x000d3000
[   20.982081] NDCB1: 0x9d800000
[   20.982081] NDCB2: 0x00000000
[   20.982081] NDCB3: 0x00000000
[   21.001026] nand: nand_do_read_oob: from = 0x04ee0000, len = 64
[   21.007059] marvell-nfc pxa3xx-nand: 
[   21.007059] NDCR:  0x9d079fff
[   21.007059] NDCB0: 0x000d3000
[   21.007059] NDCB1: 0x9dc00000
[   21.007059] NDCB2: 0x00000000
[   21.007059] NDCB3: 0x00000000
[   21.026003] nand: nand_do_read_oob: from = 0x04f00000, len = 64
[   21.032208] marvell-nfc pxa3xx-nand: 
[   21.032208] NDCR:  0x9d079fff
[   21.032208] NDCB0: 0x000d3000
[   21.032208] NDCB1: 0x9e000000
[   21.032208] NDCB2: 0x00000000
[   21.032208] NDCB3: 0x00000000
[   21.051135] nand: nand_do_read_oob: from = 0x04f20000, len = 64
[   21.057166] marvell-nfc pxa3xx-nand: 
[   21.057166] NDCR:  0x9d079fff
[   21.057166] NDCB0: 0x000d3000
[   21.057166] NDCB1: 0x9e400000
[   21.057166] NDCB2: 0x00000000
[   21.057166] NDCB3: 0x00000000
[   21.076100] nand: nand_do_read_oob: from = 0x04f40000, len = 64
[   21.082305] marvell-nfc pxa3xx-nand: 
[   21.082305] NDCR:  0x9d079fff
[   21.082305] NDCB0: 0x000d3000
[   21.082305] NDCB1: 0x9e800000
[   21.082305] NDCB2: 0x00000000
[   21.082305] NDCB3: 0x00000000
[   21.101232] nand: nand_do_read_oob: from = 0x04f60000, len = 64
[   21.107264] marvell-nfc pxa3xx-nand: 
[   21.107264] NDCR:  0x9d079fff
[   21.107264] NDCB0: 0x000d3000
[   21.107264] NDCB1: 0x9ec00000
[   21.107264] NDCB2: 0x00000000
[   21.107264] NDCB3: 0x00000000
[   21.126199] nand: nand_do_read_oob: from = 0x04f80000, len = 64
[   21.132404] marvell-nfc pxa3xx-nand: 
[   21.132404] NDCR:  0x9d079fff
[   21.132404] NDCB0: 0x000d3000
[   21.132404] NDCB1: 0x9f000000
[   21.132404] NDCB2: 0x00000000
[   21.132404] NDCB3: 0x00000000
[   21.151330] nand: nand_do_read_oob: from = 0x04fa0000, len = 64
[   21.157363] marvell-nfc pxa3xx-nand: 
[   21.157363] NDCR:  0x9d079fff
[   21.157363] NDCB0: 0x000d3000
[   21.157363] NDCB1: 0x9f400000
[   21.157363] NDCB2: 0x00000000
[   21.157363] NDCB3: 0x00000000
[   21.176296] nand: nand_do_read_oob: from = 0x04fc0000, len = 64
[   21.182504] marvell-nfc pxa3xx-nand: 
[   21.182504] NDCR:  0x9d079fff
[   21.182504] NDCB0: 0x000d3000
[   21.182504] NDCB1: 0x9f800000
[   21.182504] NDCB2: 0x00000000
[   21.182504] NDCB3: 0x00000000
[   21.201429] nand: nand_do_read_oob: from = 0x04fe0000, len = 64
[   21.207462] marvell-nfc pxa3xx-nand: 
[   21.207462] NDCR:  0x9d079fff
[   21.207462] NDCB0: 0x000d3000
[   21.207462] NDCB1: 0x9fc00000
[   21.207462] NDCB2: 0x00000000
[   21.207462] NDCB3: 0x00000000
[   21.226393] nand: nand_do_read_oob: from = 0x05000000, len = 64
[   21.232601] marvell-nfc pxa3xx-nand: 
[   21.232601] NDCR:  0x9d079fff
[   21.232601] NDCB0: 0x000d3000
[   21.232601] NDCB1: 0xa0000000
[   21.232601] NDCB2: 0x00000000
[   21.232601] NDCB3: 0x00000000
[   21.251528] nand: nand_do_read_oob: from = 0x05020000, len = 64
[   21.257559] marvell-nfc pxa3xx-nand: 
[   21.257559] NDCR:  0x9d079fff
[   21.257559] NDCB0: 0x000d3000
[   21.257559] NDCB1: 0xa0400000
[   21.257559] NDCB2: 0x00000000
[   21.257559] NDCB3: 0x00000000
[   21.276492] nand: nand_do_read_oob: from = 0x05040000, len = 64
[   21.282698] marvell-nfc pxa3xx-nand: 
[   21.282698] NDCR:  0x9d079fff
[   21.282698] NDCB0: 0x000d3000
[   21.282698] NDCB1: 0xa0800000
[   21.282698] NDCB2: 0x00000000
[   21.282698] NDCB3: 0x00000000
[   21.301627] nand: nand_do_read_oob: from = 0x05060000, len = 64
[   21.307657] marvell-nfc pxa3xx-nand: 
[   21.307657] NDCR:  0x9d079fff
[   21.307657] NDCB0: 0x000d3000
[   21.307657] NDCB1: 0xa0c00000
[   21.307657] NDCB2: 0x00000000
[   21.307657] NDCB3: 0x00000000
[   21.326591] nand: nand_do_read_oob: from = 0x05080000, len = 64
[   21.332799] marvell-nfc pxa3xx-nand: 
[   21.332799] NDCR:  0x9d079fff
[   21.332799] NDCB0: 0x000d3000
[   21.332799] NDCB1: 0xa1000000
[   21.332799] NDCB2: 0x00000000
[   21.332799] NDCB3: 0x00000000
[   21.351724] nand: nand_do_read_oob: from = 0x050a0000, len = 64
[   21.357757] marvell-nfc pxa3xx-nand: 
[   21.357757] NDCR:  0x9d079fff
[   21.357757] NDCB0: 0x000d3000
[   21.357757] NDCB1: 0xa1400000
[   21.357757] NDCB2: 0x00000000
[   21.357757] NDCB3: 0x00000000
[   21.376688] nand: nand_do_read_oob: from = 0x050c0000, len = 64
[   21.382895] marvell-nfc pxa3xx-nand: 
[   21.382895] NDCR:  0x9d079fff
[   21.382895] NDCB0: 0x000d3000
[   21.382895] NDCB1: 0xa1800000
[   21.382895] NDCB2: 0x00000000
[   21.382895] NDCB3: 0x00000000
[   21.401823] nand: nand_do_read_oob: from = 0x050e0000, len = 64
[   21.407856] marvell-nfc pxa3xx-nand: 
[   21.407856] NDCR:  0x9d079fff
[   21.407856] NDCB0: 0x000d3000
[   21.407856] NDCB1: 0xa1c00000
[   21.407856] NDCB2: 0x00000000
[   21.407856] NDCB3: 0x00000000
[   21.426787] nand: nand_do_read_oob: from = 0x05100000, len = 64
[   21.432994] marvell-nfc pxa3xx-nand: 
[   21.432994] NDCR:  0x9d079fff
[   21.432994] NDCB0: 0x000d3000
[   21.432994] NDCB1: 0xa2000000
[   21.432994] NDCB2: 0x00000000
[   21.432994] NDCB3: 0x00000000
[   21.451923] nand: nand_do_read_oob: from = 0x05120000, len = 64
[   21.457953] marvell-nfc pxa3xx-nand: 
[   21.457953] NDCR:  0x9d079fff
[   21.457953] NDCB0: 0x000d3000
[   21.457953] NDCB1: 0xa2400000
[   21.457953] NDCB2: 0x00000000
[   21.457953] NDCB3: 0x00000000
[   21.476885] nand: nand_do_read_oob: from = 0x05140000, len = 64
[   21.483093] marvell-nfc pxa3xx-nand: 
[   21.483093] NDCR:  0x9d079fff
[   21.483093] NDCB0: 0x000d3000
[   21.483093] NDCB1: 0xa2800000
[   21.483093] NDCB2: 0x00000000
[   21.483093] NDCB3: 0x00000000
[   21.502021] nand: nand_do_read_oob: from = 0x05160000, len = 64
[   21.508052] marvell-nfc pxa3xx-nand: 
[   21.508052] NDCR:  0x9d079fff
[   21.508052] NDCB0: 0x000d3000
[   21.508052] NDCB1: 0xa2c00000
[   21.508052] NDCB2: 0x00000000
[   21.508052] NDCB3: 0x00000000
[   21.526984] nand: nand_do_read_oob: from = 0x05180000, len = 64
[   21.533192] marvell-nfc pxa3xx-nand: 
[   21.533192] NDCR:  0x9d079fff
[   21.533192] NDCB0: 0x000d3000
[   21.533192] NDCB1: 0xa3000000
[   21.533192] NDCB2: 0x00000000
[   21.533192] NDCB3: 0x00000000
[   21.552119] nand: nand_do_read_oob: from = 0x051a0000, len = 64
[   21.558151] marvell-nfc pxa3xx-nand: 
[   21.558151] NDCR:  0x9d079fff
[   21.558151] NDCB0: 0x000d3000
[   21.558151] NDCB1: 0xa3400000
[   21.558151] NDCB2: 0x00000000
[   21.558151] NDCB3: 0x00000000
[   21.577083] nand: nand_do_read_oob: from = 0x051c0000, len = 64
[   21.583289] marvell-nfc pxa3xx-nand: 
[   21.583289] NDCR:  0x9d079fff
[   21.583289] NDCB0: 0x000d3000
[   21.583289] NDCB1: 0xa3800000
[   21.583289] NDCB2: 0x00000000
[   21.583289] NDCB3: 0x00000000
[   21.602219] nand: nand_do_read_oob: from = 0x051e0000, len = 64
[   21.608249] marvell-nfc pxa3xx-nand: 
[   21.608249] NDCR:  0x9d079fff
[   21.608249] NDCB0: 0x000d3000
[   21.608249] NDCB1: 0xa3c00000
[   21.608249] NDCB2: 0x00000000
[   21.608249] NDCB3: 0x00000000
[   21.627182] nand: nand_do_read_oob: from = 0x05200000, len = 64
[   21.633406] marvell-nfc pxa3xx-nand: 
[   21.633406] NDCR:  0x9d079fff
[   21.633406] NDCB0: 0x000d3000
[   21.633406] NDCB1: 0xa4000000
[   21.633406] NDCB2: 0x00000000
[   21.633406] NDCB3: 0x00000000
[   21.652336] nand: nand_do_read_oob: from = 0x05220000, len = 64
[   21.658364] marvell-nfc pxa3xx-nand: 
[   21.658364] NDCR:  0x9d079fff
[   21.658364] NDCB0: 0x000d3000
[   21.658364] NDCB1: 0xa4400000
[   21.658364] NDCB2: 0x00000000
[   21.658364] NDCB3: 0x00000000
[   21.677298] nand: nand_do_read_oob: from = 0x05240000, len = 64
[   21.683503] marvell-nfc pxa3xx-nand: 
[   21.683503] NDCR:  0x9d079fff
[   21.683503] NDCB0: 0x000d3000
[   21.683503] NDCB1: 0xa4800000
[   21.683503] NDCB2: 0x00000000
[   21.683503] NDCB3: 0x00000000
[   21.702432] nand: nand_do_read_oob: from = 0x05260000, len = 64
[   21.708462] marvell-nfc pxa3xx-nand: 
[   21.708462] NDCR:  0x9d079fff
[   21.708462] NDCB0: 0x000d3000
[   21.708462] NDCB1: 0xa4c00000
[   21.708462] NDCB2: 0x00000000
[   21.708462] NDCB3: 0x00000000
[   21.727395] nand: nand_do_read_oob: from = 0x05280000, len = 64
[   21.733601] marvell-nfc pxa3xx-nand: 
[   21.733601] NDCR:  0x9d079fff
[   21.733601] NDCB0: 0x000d3000
[   21.733601] NDCB1: 0xa5000000
[   21.733601] NDCB2: 0x00000000
[   21.733601] NDCB3: 0x00000000
[   21.752532] nand: nand_do_read_oob: from = 0x052a0000, len = 64
[   21.758561] marvell-nfc pxa3xx-nand: 
[   21.758561] NDCR:  0x9d079fff
[   21.758561] NDCB0: 0x000d3000
[   21.758561] NDCB1: 0xa5400000
[   21.758561] NDCB2: 0x00000000
[   21.758561] NDCB3: 0x00000000
[   21.777495] nand: nand_do_read_oob: from = 0x052c0000, len = 64
[   21.783700] marvell-nfc pxa3xx-nand: 
[   21.783700] NDCR:  0x9d079fff
[   21.783700] NDCB0: 0x000d3000
[   21.783700] NDCB1: 0xa5800000
[   21.783700] NDCB2: 0x00000000
[   21.783700] NDCB3: 0x00000000
[   21.802630] nand: nand_do_read_oob: from = 0x052e0000, len = 64
[   21.808831] marvell-nfc pxa3xx-nand: 
[   21.808831] NDCR:  0x9d079fff
[   21.808831] NDCB0: 0x000d3000
[   21.808831] NDCB1: 0xa5c00000
[   21.808831] NDCB2: 0x00000000
[   21.808831] NDCB3: 0x00000000
[   21.827742] nand: nand_do_read_oob: from = 0x05300000, len = 64
[   21.833943] marvell-nfc pxa3xx-nand: 
[   21.833943] NDCR:  0x9d079fff
[   21.833943] NDCB0: 0x000d3000
[   21.833943] NDCB1: 0xa6000000
[   21.833943] NDCB2: 0x00000000
[   21.833943] NDCB3: 0x00000000
[   21.852875] nand: nand_do_read_oob: from = 0x05320000, len = 64
[   21.859075] marvell-nfc pxa3xx-nand: 
[   21.859075] NDCR:  0x9d079fff
[   21.859075] NDCB0: 0x000d3000
[   21.859075] NDCB1: 0xa6400000
[   21.859075] NDCB2: 0x00000000
[   21.859075] NDCB3: 0x00000000
[   21.877997] nand: nand_do_read_oob: from = 0x05340000, len = 64
[   21.884198] marvell-nfc pxa3xx-nand: 
[   21.884198] NDCR:  0x9d079fff
[   21.884198] NDCB0: 0x000d3000
[   21.884198] NDCB1: 0xa6800000
[   21.884198] NDCB2: 0x00000000
[   21.884198] NDCB3: 0x00000000
[   21.903130] nand: nand_do_read_oob: from = 0x05360000, len = 64
[   21.909328] marvell-nfc pxa3xx-nand: 
[   21.909328] NDCR:  0x9d079fff
[   21.909328] NDCB0: 0x000d3000
[   21.909328] NDCB1: 0xa6c00000
[   21.909328] NDCB2: 0x00000000
[   21.909328] NDCB3: 0x00000000
[   21.928250] nand: nand_do_read_oob: from = 0x05380000, len = 64
[   21.934453] marvell-nfc pxa3xx-nand: 
[   21.934453] NDCR:  0x9d079fff
[   21.934453] NDCB0: 0x000d3000
[   21.934453] NDCB1: 0xa7000000
[   21.934453] NDCB2: 0x00000000
[   21.934453] NDCB3: 0x00000000
[   21.953384] nand: nand_do_read_oob: from = 0x053a0000, len = 64
[   21.959583] marvell-nfc pxa3xx-nand: 
[   21.959583] NDCR:  0x9d079fff
[   21.959583] NDCB0: 0x000d3000
[   21.959583] NDCB1: 0xa7400000
[   21.959583] NDCB2: 0x00000000
[   21.959583] NDCB3: 0x00000000
[   21.978503] nand: nand_do_read_oob: from = 0x053c0000, len = 64
[   21.984706] marvell-nfc pxa3xx-nand: 
[   21.984706] NDCR:  0x9d079fff
[   21.984706] NDCB0: 0x000d3000
[   21.984706] NDCB1: 0xa7800000
[   21.984706] NDCB2: 0x00000000
[   21.984706] NDCB3: 0x00000000
[   22.003635] nand: nand_do_read_oob: from = 0x053e0000, len = 64
[   22.009842] marvell-nfc pxa3xx-nand: 
[   22.009842] NDCR:  0x9d079fff
[   22.009842] NDCB0: 0x000d3000
[   22.009842] NDCB1: 0xa7c00000
[   22.009842] NDCB2: 0x00000000
[   22.009842] NDCB3: 0x00000000
[   22.028841] nand: nand_do_read_oob: from = 0x05400000, len = 64
[   22.034878] marvell-nfc pxa3xx-nand: 
[   22.034878] NDCR:  0x9d079fff
[   22.034878] NDCB0: 0x000d3000
[   22.034878] NDCB1: 0xa8000000
[   22.034878] NDCB2: 0x00000000
[   22.034878] NDCB3: 0x00000000
[   22.053811] nand: nand_do_read_oob: from = 0x05420000, len = 64
[   22.060013] marvell-nfc pxa3xx-nand: 
[   22.060013] NDCR:  0x9d079fff
[   22.060013] NDCB0: 0x000d3000
[   22.060013] NDCB1: 0xa8400000
[   22.060013] NDCB2: 0x00000000
[   22.060013] NDCB3: 0x00000000
[   22.079132] nand: nand_do_read_oob: from = 0x05440000, len = 64
[   22.085172] marvell-nfc pxa3xx-nand: 
[   22.085172] NDCR:  0x9d079fff
[   22.085172] NDCB0: 0x000d3000
[   22.085172] NDCB1: 0xa8800000
[   22.085172] NDCB2: 0x00000000
[   22.085172] NDCB3: 0x00000000
[   22.104450] nand: nand_do_read_oob: from = 0x05460000, len = 64
[   22.110686] marvell-nfc pxa3xx-nand: 
[   22.110686] NDCR:  0x9d079fff
[   22.110686] NDCB0: 0x000d3000
[   22.110686] NDCB1: 0xa8c00000
[   22.110686] NDCB2: 0x00000000
[   22.110686] NDCB3: 0x00000000
[   22.129626] nand: nand_do_read_oob: from = 0x05480000, len = 64
[   22.135656] marvell-nfc pxa3xx-nand: 
[   22.135656] NDCR:  0x9d079fff
[   22.135656] NDCB0: 0x000d3000
[   22.135656] NDCB1: 0xa9000000
[   22.135656] NDCB2: 0x00000000
[   22.135656] NDCB3: 0x00000000
[   22.154590] nand: nand_do_read_oob: from = 0x054a0000, len = 64
[   22.160794] marvell-nfc pxa3xx-nand: 
[   22.160794] NDCR:  0x9d079fff
[   22.160794] NDCB0: 0x000d3000
[   22.160794] NDCB1: 0xa9400000
[   22.160794] NDCB2: 0x00000000
[   22.160794] NDCB3: 0x00000000
[   22.179727] nand: nand_do_read_oob: from = 0x054c0000, len = 64
[   22.185755] marvell-nfc pxa3xx-nand: 
[   22.185755] NDCR:  0x9d079fff
[   22.185755] NDCB0: 0x000d3000
[   22.185755] NDCB1: 0xa9800000
[   22.185755] NDCB2: 0x00000000
[   22.185755] NDCB3: 0x00000000
[   22.204688] nand: nand_do_read_oob: from = 0x054e0000, len = 64
[   22.210917] marvell-nfc pxa3xx-nand: 
[   22.210917] NDCR:  0x9d079fff
[   22.210917] NDCB0: 0x000d3000
[   22.210917] NDCB1: 0xa9c00000
[   22.210917] NDCB2: 0x00000000
[   22.210917] NDCB3: 0x00000000
[   22.229850] nand: nand_do_read_oob: from = 0x05500000, len = 64
[   22.235880] marvell-nfc pxa3xx-nand: 
[   22.235880] NDCR:  0x9d079fff
[   22.235880] NDCB0: 0x000d3000
[   22.235880] NDCB1: 0xaa000000
[   22.235880] NDCB2: 0x00000000
[   22.235880] NDCB3: 0x00000000
[   22.254813] nand: nand_do_read_oob: from = 0x05520000, len = 64
[   22.261019] marvell-nfc pxa3xx-nand: 
[   22.261019] NDCR:  0x9d079fff
[   22.261019] NDCB0: 0x000d3000
[   22.261019] NDCB1: 0xaa400000
[   22.261019] NDCB2: 0x00000000
[   22.261019] NDCB3: 0x00000000
[   22.279948] nand: nand_do_read_oob: from = 0x05540000, len = 64
[   22.285978] marvell-nfc pxa3xx-nand: 
[   22.285978] NDCR:  0x9d079fff
[   22.285978] NDCB0: 0x000d3000
[   22.285978] NDCB1: 0xaa800000
[   22.285978] NDCB2: 0x00000000
[   22.285978] NDCB3: 0x00000000
[   22.304912] nand: nand_do_read_oob: from = 0x05560000, len = 64
[   22.311116] marvell-nfc pxa3xx-nand: 
[   22.311116] NDCR:  0x9d079fff
[   22.311116] NDCB0: 0x000d3000
[   22.311116] NDCB1: 0xaac00000
[   22.311116] NDCB2: 0x00000000
[   22.311116] NDCB3: 0x00000000
[   22.330047] nand: nand_do_read_oob: from = 0x05580000, len = 64
[   22.336076] marvell-nfc pxa3xx-nand: 
[   22.336076] NDCR:  0x9d079fff
[   22.336076] NDCB0: 0x000d3000
[   22.336076] NDCB1: 0xab000000
[   22.336076] NDCB2: 0x00000000
[   22.336076] NDCB3: 0x00000000
[   22.355012] nand: nand_do_read_oob: from = 0x055a0000, len = 64
[   22.361214] marvell-nfc pxa3xx-nand: 
[   22.361214] NDCR:  0x9d079fff
[   22.361214] NDCB0: 0x000d3000
[   22.361214] NDCB1: 0xab400000
[   22.361214] NDCB2: 0x00000000
[   22.361214] NDCB3: 0x00000000
[   22.380143] nand: nand_do_read_oob: from = 0x055c0000, len = 64
[   22.386175] marvell-nfc pxa3xx-nand: 
[   22.386175] NDCR:  0x9d079fff
[   22.386175] NDCB0: 0x000d3000
[   22.386175] NDCB1: 0xab800000
[   22.386175] NDCB2: 0x00000000
[   22.386175] NDCB3: 0x00000000
[   22.405106] nand: nand_do_read_oob: from = 0x055e0000, len = 64
[   22.411303] marvell-nfc pxa3xx-nand: 
[   22.411303] NDCR:  0x9d079fff
[   22.411303] NDCB0: 0x000d3000
[   22.411303] NDCB1: 0xabc00000
[   22.411303] NDCB2: 0x00000000
[   22.411303] NDCB3: 0x00000000
[   22.430224] nand: nand_do_read_oob: from = 0x05600000, len = 64
[   22.436256] marvell-nfc pxa3xx-nand: 
[   22.436256] NDCR:  0x9d079fff
[   22.436256] NDCB0: 0x000d3000
[   22.436256] NDCB1: 0xac000000
[   22.436256] NDCB2: 0x00000000
[   22.436256] NDCB3: 0x00000000
[   22.455189] nand: nand_do_read_oob: from = 0x05620000, len = 64
[   22.461395] marvell-nfc pxa3xx-nand: 
[   22.461395] NDCR:  0x9d079fff
[   22.461395] NDCB0: 0x000d3000
[   22.461395] NDCB1: 0xac400000
[   22.461395] NDCB2: 0x00000000
[   22.461395] NDCB3: 0x00000000
[   22.480324] nand: nand_do_read_oob: from = 0x05640000, len = 64
[   22.486355] marvell-nfc pxa3xx-nand: 
[   22.486355] NDCR:  0x9d079fff
[   22.486355] NDCB0: 0x000d3000
[   22.486355] NDCB1: 0xac800000
[   22.486355] NDCB2: 0x00000000
[   22.486355] NDCB3: 0x00000000
[   22.505288] nand: nand_do_read_oob: from = 0x05660000, len = 64
[   22.511493] marvell-nfc pxa3xx-nand: 
[   22.511493] NDCR:  0x9d079fff
[   22.511493] NDCB0: 0x000d3000
[   22.511493] NDCB1: 0xacc00000
[   22.511493] NDCB2: 0x00000000
[   22.511493] NDCB3: 0x00000000
[   22.530421] nand: nand_do_read_oob: from = 0x05680000, len = 64
[   22.536453] marvell-nfc pxa3xx-nand: 
[   22.536453] NDCR:  0x9d079fff
[   22.536453] NDCB0: 0x000d3000
[   22.536453] NDCB1: 0xad000000
[   22.536453] NDCB2: 0x00000000
[   22.536453] NDCB3: 0x00000000
[   22.555387] nand: nand_do_read_oob: from = 0x056a0000, len = 64
[   22.561591] marvell-nfc pxa3xx-nand: 
[   22.561591] NDCR:  0x9d079fff
[   22.561591] NDCB0: 0x000d3000
[   22.561591] NDCB1: 0xad400000
[   22.561591] NDCB2: 0x00000000
[   22.561591] NDCB3: 0x00000000
[   22.580520] nand: nand_do_read_oob: from = 0x056c0000, len = 64
[   22.586552] marvell-nfc pxa3xx-nand: 
[   22.586552] NDCR:  0x9d079fff
[   22.586552] NDCB0: 0x000d3000
[   22.586552] NDCB1: 0xad800000
[   22.586552] NDCB2: 0x00000000
[   22.586552] NDCB3: 0x00000000
[   22.605486] nand: nand_do_read_oob: from = 0x056e0000, len = 64
[   22.611689] marvell-nfc pxa3xx-nand: 
[   22.611689] NDCR:  0x9d079fff
[   22.611689] NDCB0: 0x000d3000
[   22.611689] NDCB1: 0xadc00000
[   22.611689] NDCB2: 0x00000000
[   22.611689] NDCB3: 0x00000000
[   22.630620] nand: nand_do_read_oob: from = 0x05700000, len = 64
[   22.636650] marvell-nfc pxa3xx-nand: 
[   22.636650] NDCR:  0x9d079fff
[   22.636650] NDCB0: 0x000d3000
[   22.636650] NDCB1: 0xae000000
[   22.636650] NDCB2: 0x00000000
[   22.636650] NDCB3: 0x00000000
[   22.655583] nand: nand_do_read_oob: from = 0x05720000, len = 64
[   22.661789] marvell-nfc pxa3xx-nand: 
[   22.661789] NDCR:  0x9d079fff
[   22.661789] NDCB0: 0x000d3000
[   22.661789] NDCB1: 0xae400000
[   22.661789] NDCB2: 0x00000000
[   22.661789] NDCB3: 0x00000000
[   22.680718] nand: nand_do_read_oob: from = 0x05740000, len = 64
[   22.686748] marvell-nfc pxa3xx-nand: 
[   22.686748] NDCR:  0x9d079fff
[   22.686748] NDCB0: 0x000d3000
[   22.686748] NDCB1: 0xae800000
[   22.686748] NDCB2: 0x00000000
[   22.686748] NDCB3: 0x00000000
[   22.705687] nand: nand_do_read_oob: from = 0x05760000, len = 64
[   22.711887] marvell-nfc pxa3xx-nand: 
[   22.711887] NDCR:  0x9d079fff
[   22.711887] NDCB0: 0x000d3000
[   22.711887] NDCB1: 0xaec00000
[   22.711887] NDCB2: 0x00000000
[   22.711887] NDCB3: 0x00000000
[   22.730816] nand: nand_do_read_oob: from = 0x05780000, len = 64
[   22.736846] marvell-nfc pxa3xx-nand: 
[   22.736846] NDCR:  0x9d079fff
[   22.736846] NDCB0: 0x000d3000
[   22.736846] NDCB1: 0xaf000000
[   22.736846] NDCB2: 0x00000000
[   22.736846] NDCB3: 0x00000000
[   22.755779] nand: nand_do_read_oob: from = 0x057a0000, len = 64
[   22.761985] marvell-nfc pxa3xx-nand: 
[   22.761985] NDCR:  0x9d079fff
[   22.761985] NDCB0: 0x000d3000
[   22.761985] NDCB1: 0xaf400000
[   22.761985] NDCB2: 0x00000000
[   22.761985] NDCB3: 0x00000000
[   22.780915] nand: nand_do_read_oob: from = 0x057c0000, len = 64
[   22.786945] marvell-nfc pxa3xx-nand: 
[   22.786945] NDCR:  0x9d079fff
[   22.786945] NDCB0: 0x000d3000
[   22.786945] NDCB1: 0xaf800000
[   22.786945] NDCB2: 0x00000000
[   22.786945] NDCB3: 0x00000000
[   22.805881] nand: nand_do_read_oob: from = 0x057e0000, len = 64
[   22.812084] marvell-nfc pxa3xx-nand: 
[   22.812084] NDCR:  0x9d079fff
[   22.812084] NDCB0: 0x000d3000
[   22.812084] NDCB1: 0xafc00000
[   22.812084] NDCB2: 0x00000000
[   22.812084] NDCB3: 0x00000000
[   22.831015] nand: nand_do_read_oob: from = 0x05800000, len = 64
[   22.837043] marvell-nfc pxa3xx-nand: 
[   22.837043] NDCR:  0x9d079fff
[   22.837043] NDCB0: 0x000d3000
[   22.837043] NDCB1: 0xb0000000
[   22.837043] NDCB2: 0x00000000
[   22.837043] NDCB3: 0x00000000
[   22.855995] nand: nand_do_read_oob: from = 0x05820000, len = 64
[   22.862200] marvell-nfc pxa3xx-nand: 
[   22.862200] NDCR:  0x9d079fff
[   22.862200] NDCB0: 0x000d3000
[   22.862200] NDCB1: 0xb0400000
[   22.862200] NDCB2: 0x00000000
[   22.862200] NDCB3: 0x00000000
[   22.881131] nand: nand_do_read_oob: from = 0x05840000, len = 64
[   22.887159] marvell-nfc pxa3xx-nand: 
[   22.887159] NDCR:  0x9d079fff
[   22.887159] NDCB0: 0x000d3000
[   22.887159] NDCB1: 0xb0800000
[   22.887159] NDCB2: 0x00000000
[   22.887159] NDCB3: 0x00000000
[   22.906094] nand: nand_do_read_oob: from = 0x05860000, len = 64
[   22.912298] marvell-nfc pxa3xx-nand: 
[   22.912298] NDCR:  0x9d079fff
[   22.912298] NDCB0: 0x000d3000
[   22.912298] NDCB1: 0xb0c00000
[   22.912298] NDCB2: 0x00000000
[   22.912298] NDCB3: 0x00000000
[   22.931228] nand: nand_do_read_oob: from = 0x05880000, len = 64
[   22.937259] marvell-nfc pxa3xx-nand: 
[   22.937259] NDCR:  0x9d079fff
[   22.937259] NDCB0: 0x000d3000
[   22.937259] NDCB1: 0xb1000000
[   22.937259] NDCB2: 0x00000000
[   22.937259] NDCB3: 0x00000000
[   22.956190] nand: nand_do_read_oob: from = 0x058a0000, len = 64
[   22.962397] marvell-nfc pxa3xx-nand: 
[   22.962397] NDCR:  0x9d079fff
[   22.962397] NDCB0: 0x000d3000
[   22.962397] NDCB1: 0xb1400000
[   22.962397] NDCB2: 0x00000000
[   22.962397] NDCB3: 0x00000000
[   22.981325] nand: nand_do_read_oob: from = 0x058c0000, len = 64
[   22.987356] marvell-nfc pxa3xx-nand: 
[   22.987356] NDCR:  0x9d079fff
[   22.987356] NDCB0: 0x000d3000
[   22.987356] NDCB1: 0xb1800000
[   22.987356] NDCB2: 0x00000000
[   22.987356] NDCB3: 0x00000000
[   23.006291] nand: nand_do_read_oob: from = 0x058e0000, len = 64
[   23.012504] marvell-nfc pxa3xx-nand: 
[   23.012504] NDCR:  0x9d079fff
[   23.012504] NDCB0: 0x000d3000
[   23.012504] NDCB1: 0xb1c00000
[   23.012504] NDCB2: 0x00000000
[   23.012504] NDCB3: 0x00000000
[   23.031434] nand: nand_do_read_oob: from = 0x05900000, len = 64
[   23.037464] marvell-nfc pxa3xx-nand: 
[   23.037464] NDCR:  0x9d079fff
[   23.037464] NDCB0: 0x000d3000
[   23.037464] NDCB1: 0xb2000000
[   23.037464] NDCB2: 0x00000000
[   23.037464] NDCB3: 0x00000000
[   23.056397] nand: nand_do_read_oob: from = 0x05920000, len = 64
[   23.062602] marvell-nfc pxa3xx-nand: 
[   23.062602] NDCR:  0x9d079fff
[   23.062602] NDCB0: 0x000d3000
[   23.062602] NDCB1: 0xb2400000
[   23.062602] NDCB2: 0x00000000
[   23.062602] NDCB3: 0x00000000
[   23.081530] nand: nand_do_read_oob: from = 0x05940000, len = 64
[   23.087563] marvell-nfc pxa3xx-nand: 
[   23.087563] NDCR:  0x9d079fff
[   23.087563] NDCB0: 0x000d3000
[   23.087563] NDCB1: 0xb2800000
[   23.087563] NDCB2: 0x00000000
[   23.087563] NDCB3: 0x00000000
[   23.106495] nand: nand_do_read_oob: from = 0x05960000, len = 64
[   23.112698] marvell-nfc pxa3xx-nand: 
[   23.112698] NDCR:  0x9d079fff
[   23.112698] NDCB0: 0x000d3000
[   23.112698] NDCB1: 0xb2c00000
[   23.112698] NDCB2: 0x00000000
[   23.112698] NDCB3: 0x00000000
[   23.131629] nand: nand_do_read_oob: from = 0x05980000, len = 64
[   23.137661] marvell-nfc pxa3xx-nand: 
[   23.137661] NDCR:  0x9d079fff
[   23.137661] NDCB0: 0x000d3000
[   23.137661] NDCB1: 0xb3000000
[   23.137661] NDCB2: 0x00000000
[   23.137661] NDCB3: 0x00000000
[   23.156593] nand: nand_do_read_oob: from = 0x059a0000, len = 64
[   23.162801] marvell-nfc pxa3xx-nand: 
[   23.162801] NDCR:  0x9d079fff
[   23.162801] NDCB0: 0x000d3000
[   23.162801] NDCB1: 0xb3400000
[   23.162801] NDCB2: 0x00000000
[   23.162801] NDCB3: 0x00000000
[   23.181727] nand: nand_do_read_oob: from = 0x059c0000, len = 64
[   23.187758] marvell-nfc pxa3xx-nand: 
[   23.187758] NDCR:  0x9d079fff
[   23.187758] NDCB0: 0x000d3000
[   23.187758] NDCB1: 0xb3800000
[   23.187758] NDCB2: 0x00000000
[   23.187758] NDCB3: 0x00000000
[   23.206692] nand: nand_do_read_oob: from = 0x059e0000, len = 64
[   23.212897] marvell-nfc pxa3xx-nand: 
[   23.212897] NDCR:  0x9d079fff
[   23.212897] NDCB0: 0x000d3000
[   23.212897] NDCB1: 0xb3c00000
[   23.212897] NDCB2: 0x00000000
[   23.212897] NDCB3: 0x00000000
[   23.231825] nand: nand_do_read_oob: from = 0x05a00000, len = 64
[   23.237859] marvell-nfc pxa3xx-nand: 
[   23.237859] NDCR:  0x9d079fff
[   23.237859] NDCB0: 0x000d3000
[   23.237859] NDCB1: 0xb4000000
[   23.237859] NDCB2: 0x00000000
[   23.237859] NDCB3: 0x00000000
[   23.256787] nand: nand_do_read_oob: from = 0x05a20000, len = 64
[   23.262986] marvell-nfc pxa3xx-nand: 
[   23.262986] NDCR:  0x9d079fff
[   23.262986] NDCB0: 0x000d3000
[   23.262986] NDCB1: 0xb4400000
[   23.262986] NDCB2: 0x00000000
[   23.262986] NDCB3: 0x00000000
[   23.281915] nand: nand_do_read_oob: from = 0x05a40000, len = 64
[   23.287948] marvell-nfc pxa3xx-nand: 
[   23.287948] NDCR:  0x9d079fff
[   23.287948] NDCB0: 0x000d3000
[   23.287948] NDCB1: 0xb4800000
[   23.287948] NDCB2: 0x00000000
[   23.287948] NDCB3: 0x00000000
[   23.306880] nand: nand_do_read_oob: from = 0x05a60000, len = 64
[   23.313086] marvell-nfc pxa3xx-nand: 
[   23.313086] NDCR:  0x9d079fff
[   23.313086] NDCB0: 0x000d3000
[   23.313086] NDCB1: 0xb4c00000
[   23.313086] NDCB2: 0x00000000
[   23.313086] NDCB3: 0x00000000
[   23.332015] nand: nand_do_read_oob: from = 0x05a80000, len = 64
[   23.338046] marvell-nfc pxa3xx-nand: 
[   23.338046] NDCR:  0x9d079fff
[   23.338046] NDCB0: 0x000d3000
[   23.338046] NDCB1: 0xb5000000
[   23.338046] NDCB2: 0x00000000
[   23.338046] NDCB3: 0x00000000
[   23.356978] nand: nand_do_read_oob: from = 0x05aa0000, len = 64
[   23.363184] marvell-nfc pxa3xx-nand: 
[   23.363184] NDCR:  0x9d079fff
[   23.363184] NDCB0: 0x000d3000
[   23.363184] NDCB1: 0xb5400000
[   23.363184] NDCB2: 0x00000000
[   23.363184] NDCB3: 0x00000000
[   23.382113] nand: nand_do_read_oob: from = 0x05ac0000, len = 64
[   23.388145] marvell-nfc pxa3xx-nand: 
[   23.388145] NDCR:  0x9d079fff
[   23.388145] NDCB0: 0x000d3000
[   23.388145] NDCB1: 0xb5800000
[   23.388145] NDCB2: 0x00000000
[   23.388145] NDCB3: 0x00000000
[   23.407075] nand: nand_do_read_oob: from = 0x05ae0000, len = 64
[   23.413274] marvell-nfc pxa3xx-nand: 
[   23.413274] NDCR:  0x9d079fff
[   23.413274] NDCB0: 0x000d3000
[   23.413274] NDCB1: 0xb5c00000
[   23.413274] NDCB2: 0x00000000
[   23.413274] NDCB3: 0x00000000
[   23.432201] nand: nand_do_read_oob: from = 0x05b00000, len = 64
[   23.438234] marvell-nfc pxa3xx-nand: 
[   23.438234] NDCR:  0x9d079fff
[   23.438234] NDCB0: 0x000d3000
[   23.438234] NDCB1: 0xb6000000
[   23.438234] NDCB2: 0x00000000
[   23.438234] NDCB3: 0x00000000
[   23.457167] nand: nand_do_read_oob: from = 0x05b20000, len = 64
[   23.463372] marvell-nfc pxa3xx-nand: 
[   23.463372] NDCR:  0x9d079fff
[   23.463372] NDCB0: 0x000d3000
[   23.463372] NDCB1: 0xb6400000
[   23.463372] NDCB2: 0x00000000
[   23.463372] NDCB3: 0x00000000
[   23.482301] nand: nand_do_read_oob: from = 0x05b40000, len = 64
[   23.488332] marvell-nfc pxa3xx-nand: 
[   23.488332] NDCR:  0x9d079fff
[   23.488332] NDCB0: 0x000d3000
[   23.488332] NDCB1: 0xb6800000
[   23.488332] NDCB2: 0x00000000
[   23.488332] NDCB3: 0x00000000
[   23.507285] nand: nand_do_read_oob: from = 0x05b60000, len = 64
[   23.513489] marvell-nfc pxa3xx-nand: 
[   23.513489] NDCR:  0x9d079fff
[   23.513489] NDCB0: 0x000d3000
[   23.513489] NDCB1: 0xb6c00000
[   23.513489] NDCB2: 0x00000000
[   23.513489] NDCB3: 0x00000000
[   23.532416] nand: nand_do_read_oob: from = 0x05b80000, len = 64
[   23.538449] marvell-nfc pxa3xx-nand: 
[   23.538449] NDCR:  0x9d079fff
[   23.538449] NDCB0: 0x000d3000
[   23.538449] NDCB1: 0xb7000000
[   23.538449] NDCB2: 0x00000000
[   23.538449] NDCB3: 0x00000000
[   23.557381] nand: nand_do_read_oob: from = 0x05ba0000, len = 64
[   23.563587] marvell-nfc pxa3xx-nand: 
[   23.563587] NDCR:  0x9d079fff
[   23.563587] NDCB0: 0x000d3000
[   23.563587] NDCB1: 0xb7400000
[   23.563587] NDCB2: 0x00000000
[   23.563587] NDCB3: 0x00000000
[   23.582513] nand: nand_do_read_oob: from = 0x05bc0000, len = 64
[   23.588548] marvell-nfc pxa3xx-nand: 
[   23.588548] NDCR:  0x9d079fff
[   23.588548] NDCB0: 0x000d3000
[   23.588548] NDCB1: 0xb7800000
[   23.588548] NDCB2: 0x00000000
[   23.588548] NDCB3: 0x00000000
[   23.607479] nand: nand_do_read_oob: from = 0x05be0000, len = 64
[   23.613687] marvell-nfc pxa3xx-nand: 
[   23.613687] NDCR:  0x9d079fff
[   23.613687] NDCB0: 0x000d3000
[   23.613687] NDCB1: 0xb7c00000
[   23.613687] NDCB2: 0x00000000
[   23.613687] NDCB3: 0x00000000
[   23.632614] nand: nand_do_read_oob: from = 0x05c00000, len = 64
[   23.638819] marvell-nfc pxa3xx-nand: 
[   23.638819] NDCR:  0x9d079fff
[   23.638819] NDCB0: 0x000d3000
[   23.638819] NDCB1: 0xb8000000
[   23.638819] NDCB2: 0x00000000
[   23.638819] NDCB3: 0x00000000
[   23.657722] nand: nand_do_read_oob: from = 0x05c20000, len = 64
[   23.663920] marvell-nfc pxa3xx-nand: 
[   23.663920] NDCR:  0x9d079fff
[   23.663920] NDCB0: 0x000d3000
[   23.663920] NDCB1: 0xb8400000
[   23.663920] NDCB2: 0x00000000
[   23.663920] NDCB3: 0x00000000
[   23.682847] nand: nand_do_read_oob: from = 0x05c40000, len = 64
[   23.689054] marvell-nfc pxa3xx-nand: 
[   23.689054] NDCR:  0x9d079fff
[   23.689054] NDCB0: 0x000d3000
[   23.689054] NDCB1: 0xb8800000
[   23.689054] NDCB2: 0x00000000
[   23.689054] NDCB3: 0x00000000
[   23.707971] nand: nand_do_read_oob: from = 0x05c60000, len = 64
[   23.714176] marvell-nfc pxa3xx-nand: 
[   23.714176] NDCR:  0x9d079fff
[   23.714176] NDCB0: 0x000d3000
[   23.714176] NDCB1: 0xb8c00000
[   23.714176] NDCB2: 0x00000000
[   23.714176] NDCB3: 0x00000000
[   23.733103] nand: nand_do_read_oob: from = 0x05c80000, len = 64
[   23.739307] marvell-nfc pxa3xx-nand: 
[   23.739307] NDCR:  0x9d079fff
[   23.739307] NDCB0: 0x000d3000
[   23.739307] NDCB1: 0xb9000000
[   23.739307] NDCB2: 0x00000000
[   23.739307] NDCB3: 0x00000000
[   23.758224] nand: nand_do_read_oob: from = 0x05ca0000, len = 64
[   23.764430] marvell-nfc pxa3xx-nand: 
[   23.764430] NDCR:  0x9d079fff
[   23.764430] NDCB0: 0x000d3000
[   23.764430] NDCB1: 0xb9400000
[   23.764430] NDCB2: 0x00000000
[   23.764430] NDCB3: 0x00000000
[   23.783358] nand: nand_do_read_oob: from = 0x05cc0000, len = 64
[   23.789559] marvell-nfc pxa3xx-nand: 
[   23.789559] NDCR:  0x9d079fff
[   23.789559] NDCB0: 0x000d3000
[   23.789559] NDCB1: 0xb9800000
[   23.789559] NDCB2: 0x00000000
[   23.789559] NDCB3: 0x00000000
[   23.808477] nand: nand_do_read_oob: from = 0x05ce0000, len = 64
[   23.814682] marvell-nfc pxa3xx-nand: 
[   23.814682] NDCR:  0x9d079fff
[   23.814682] NDCB0: 0x000d3000
[   23.814682] NDCB1: 0xb9c00000
[   23.814682] NDCB2: 0x00000000
[   23.814682] NDCB3: 0x00000000
[   23.833610] nand: nand_do_read_oob: from = 0x05d00000, len = 64
[   23.839813] marvell-nfc pxa3xx-nand: 
[   23.839813] NDCR:  0x9d079fff
[   23.839813] NDCB0: 0x000d3000
[   23.839813] NDCB1: 0xba000000
[   23.839813] NDCB2: 0x00000000
[   23.839813] NDCB3: 0x00000000
[   23.858935] nand: nand_do_read_oob: from = 0x05d20000, len = 64
[   23.864979] marvell-nfc pxa3xx-nand: 
[   23.864979] NDCR:  0x9d079fff
[   23.864979] NDCB0: 0x000d3000
[   23.864979] NDCB1: 0xba400000
[   23.864979] NDCB2: 0x00000000
[   23.864979] NDCB3: 0x00000000
[   23.883928] nand: nand_do_read_oob: from = 0x05d40000, len = 64
[   23.890127] marvell-nfc pxa3xx-nand: 
[   23.890127] NDCR:  0x9d079fff
[   23.890127] NDCB0: 0x000d3000
[   23.890127] NDCB1: 0xba800000
[   23.890127] NDCB2: 0x00000000
[   23.890127] NDCB3: 0x00000000
[   23.909053] nand: nand_do_read_oob: from = 0x05d60000, len = 64
[   23.915087] marvell-nfc pxa3xx-nand: 
[   23.915087] NDCR:  0x9d079fff
[   23.915087] NDCB0: 0x000d3000
[   23.915087] NDCB1: 0xbac00000
[   23.915087] NDCB2: 0x00000000
[   23.915087] NDCB3: 0x00000000
[   23.934020] nand: nand_do_read_oob: from = 0x05d80000, len = 64
[   23.940224] marvell-nfc pxa3xx-nand: 
[   23.940224] NDCR:  0x9d079fff
[   23.940224] NDCB0: 0x000d3000
[   23.940224] NDCB1: 0xbb000000
[   23.940224] NDCB2: 0x00000000
[   23.940224] NDCB3: 0x00000000
[   23.959150] nand: nand_do_read_oob: from = 0x05da0000, len = 64
[   23.965186] marvell-nfc pxa3xx-nand: 
[   23.965186] NDCR:  0x9d079fff
[   23.965186] NDCB0: 0x000d3000
[   23.965186] NDCB1: 0xbb400000
[   23.965186] NDCB2: 0x00000000
[   23.965186] NDCB3: 0x00000000
[   23.984117] nand: nand_do_read_oob: from = 0x05dc0000, len = 64
[   23.990323] marvell-nfc pxa3xx-nand: 
[   23.990323] NDCR:  0x9d079fff
[   23.990323] NDCB0: 0x000d3000
[   23.990323] NDCB1: 0xbb800000
[   23.990323] NDCB2: 0x00000000
[   23.990323] NDCB3: 0x00000000
[   24.009262] nand: nand_do_read_oob: from = 0x05de0000, len = 64
[   24.015293] marvell-nfc pxa3xx-nand: 
[   24.015293] NDCR:  0x9d079fff
[   24.015293] NDCB0: 0x000d3000
[   24.015293] NDCB1: 0xbbc00000
[   24.015293] NDCB2: 0x00000000
[   24.015293] NDCB3: 0x00000000
[   24.034223] nand: nand_do_read_oob: from = 0x05e00000, len = 64
[   24.040423] marvell-nfc pxa3xx-nand: 
[   24.040423] NDCR:  0x9d079fff
[   24.040423] NDCB0: 0x000d3000
[   24.040423] NDCB1: 0xbc000000
[   24.040423] NDCB2: 0x00000000
[   24.040423] NDCB3: 0x00000000
[   24.059348] nand: nand_do_read_oob: from = 0x05e20000, len = 64
[   24.065383] marvell-nfc pxa3xx-nand: 
[   24.065383] NDCR:  0x9d079fff
[   24.065383] NDCB0: 0x000d3000
[   24.065383] NDCB1: 0xbc400000
[   24.065383] NDCB2: 0x00000000
[   24.065383] NDCB3: 0x00000000
[   24.084334] nand: nand_do_read_oob: from = 0x05e40000, len = 64
[   24.090926] marvell-nfc pxa3xx-nand: 
[   24.090926] NDCR:  0x9d079fff
[   24.090926] NDCB0: 0x000d3000
[   24.090926] NDCB1: 0xbc800000
[   24.090926] NDCB2: 0x00000000
[   24.090926] NDCB3: 0x00000000
[   24.109932] nand: nand_do_read_oob: from = 0x05e60000, len = 64
[   24.115963] marvell-nfc pxa3xx-nand: 
[   24.115963] NDCR:  0x9d079fff
[   24.115963] NDCB0: 0x000d3000
[   24.115963] NDCB1: 0xbcc00000
[   24.115963] NDCB2: 0x00000000
[   24.115963] NDCB3: 0x00000000
[   24.134899] nand: nand_do_read_oob: from = 0x05e80000, len = 64
[   24.141102] marvell-nfc pxa3xx-nand: 
[   24.141102] NDCR:  0x9d079fff
[   24.141102] NDCB0: 0x000d3000
[   24.141102] NDCB1: 0xbd000000
[   24.141102] NDCB2: 0x00000000
[   24.141102] NDCB3: 0x00000000
[   24.160031] nand: nand_do_read_oob: from = 0x05ea0000, len = 64
[   24.166062] marvell-nfc pxa3xx-nand: 
[   24.166062] NDCR:  0x9d079fff
[   24.166062] NDCB0: 0x000d3000
[   24.166062] NDCB1: 0xbd400000
[   24.166062] NDCB2: 0x00000000
[   24.166062] NDCB3: 0x00000000
[   24.184995] nand: nand_do_read_oob: from = 0x05ec0000, len = 64
[   24.191201] marvell-nfc pxa3xx-nand: 
[   24.191201] NDCR:  0x9d079fff
[   24.191201] NDCB0: 0x000d3000
[   24.191201] NDCB1: 0xbd800000
[   24.191201] NDCB2: 0x00000000
[   24.191201] NDCB3: 0x00000000
[   24.210128] nand: nand_do_read_oob: from = 0x05ee0000, len = 64
[   24.216161] marvell-nfc pxa3xx-nand: 
[   24.216161] NDCR:  0x9d079fff
[   24.216161] NDCB0: 0x000d3000
[   24.216161] NDCB1: 0xbdc00000
[   24.216161] NDCB2: 0x00000000
[   24.216161] NDCB3: 0x00000000
[   24.235092] nand: nand_do_read_oob: from = 0x05f00000, len = 64
[   24.241301] marvell-nfc pxa3xx-nand: 
[   24.241301] NDCR:  0x9d079fff
[   24.241301] NDCB0: 0x000d3000
[   24.241301] NDCB1: 0xbe000000
[   24.241301] NDCB2: 0x00000000
[   24.241301] NDCB3: 0x00000000
[   24.260227] nand: nand_do_read_oob: from = 0x05f20000, len = 64
[   24.266259] marvell-nfc pxa3xx-nand: 
[   24.266259] NDCR:  0x9d079fff
[   24.266259] NDCB0: 0x000d3000
[   24.266259] NDCB1: 0xbe400000
[   24.266259] NDCB2: 0x00000000
[   24.266259] NDCB3: 0x00000000
[   24.285192] nand: nand_do_read_oob: from = 0x05f40000, len = 64
[   24.291397] marvell-nfc pxa3xx-nand: 
[   24.291397] NDCR:  0x9d079fff
[   24.291397] NDCB0: 0x000d3000
[   24.291397] NDCB1: 0xbe800000
[   24.291397] NDCB2: 0x00000000
[   24.291397] NDCB3: 0x00000000
[   24.310331] nand: nand_do_read_oob: from = 0x05f60000, len = 64
[   24.316365] marvell-nfc pxa3xx-nand: 
[   24.316365] NDCR:  0x9d079fff
[   24.316365] NDCB0: 0x000d3000
[   24.316365] NDCB1: 0xbec00000
[   24.316365] NDCB2: 0x00000000
[   24.316365] NDCB3: 0x00000000
[   24.335304] nand: nand_do_read_oob: from = 0x05f80000, len = 64
[   24.341505] marvell-nfc pxa3xx-nand: 
[   24.341505] NDCR:  0x9d079fff
[   24.341505] NDCB0: 0x000d3000
[   24.341505] NDCB1: 0xbf000000
[   24.341505] NDCB2: 0x00000000
[   24.341505] NDCB3: 0x00000000
[   24.360432] nand: nand_do_read_oob: from = 0x05fa0000, len = 64
[   24.366466] marvell-nfc pxa3xx-nand: 
[   24.366466] NDCR:  0x9d079fff
[   24.366466] NDCB0: 0x000d3000
[   24.366466] NDCB1: 0xbf400000
[   24.366466] NDCB2: 0x00000000
[   24.366466] NDCB3: 0x00000000
[   24.385399] nand: nand_do_read_oob: from = 0x05fc0000, len = 64
[   24.391604] marvell-nfc pxa3xx-nand: 
[   24.391604] NDCR:  0x9d079fff
[   24.391604] NDCB0: 0x000d3000
[   24.391604] NDCB1: 0xbf800000
[   24.391604] NDCB2: 0x00000000
[   24.391604] NDCB3: 0x00000000
[   24.410533] nand: nand_do_read_oob: from = 0x05fe0000, len = 64
[   24.416563] marvell-nfc pxa3xx-nand: 
[   24.416563] NDCR:  0x9d079fff
[   24.416563] NDCB0: 0x000d3000
[   24.416563] NDCB1: 0xbfc00000
[   24.416563] NDCB2: 0x00000000
[   24.416563] NDCB3: 0x00000000
[   24.435496] nand: nand_do_read_oob: from = 0x06000000, len = 64
[   24.441701] marvell-nfc pxa3xx-nand: 
[   24.441701] NDCR:  0x9d079fff
[   24.441701] NDCB0: 0x000d3000
[   24.441701] NDCB1: 0xc0000000
[   24.441701] NDCB2: 0x00000000
[   24.441701] NDCB3: 0x00000000
[   24.460628] nand: nand_do_read_oob: from = 0x06020000, len = 64
[   24.466661] marvell-nfc pxa3xx-nand: 
[   24.466661] NDCR:  0x9d079fff
[   24.466661] NDCB0: 0x000d3000
[   24.466661] NDCB1: 0xc0400000
[   24.466661] NDCB2: 0x00000000
[   24.466661] NDCB3: 0x00000000
[   24.485592] nand: nand_do_read_oob: from = 0x06040000, len = 64
[   24.491792] marvell-nfc pxa3xx-nand: 
[   24.491792] NDCR:  0x9d079fff
[   24.491792] NDCB0: 0x000d3000
[   24.491792] NDCB1: 0xc0800000
[   24.491792] NDCB2: 0x00000000
[   24.491792] NDCB3: 0x00000000
[   24.510721] nand: nand_do_read_oob: from = 0x06060000, len = 64
[   24.516751] marvell-nfc pxa3xx-nand: 
[   24.516751] NDCR:  0x9d079fff
[   24.516751] NDCB0: 0x000d3000
[   24.516751] NDCB1: 0xc0c00000
[   24.516751] NDCB2: 0x00000000
[   24.516751] NDCB3: 0x00000000
[   24.535687] nand: nand_do_read_oob: from = 0x06080000, len = 64
[   24.541891] marvell-nfc pxa3xx-nand: 
[   24.541891] NDCR:  0x9d079fff
[   24.541891] NDCB0: 0x000d3000
[   24.541891] NDCB1: 0xc1000000
[   24.541891] NDCB2: 0x00000000
[   24.541891] NDCB3: 0x00000000
[   24.560820] nand: nand_do_read_oob: from = 0x060a0000, len = 64
[   24.566849] marvell-nfc pxa3xx-nand: 
[   24.566849] NDCR:  0x9d079fff
[   24.566849] NDCB0: 0x000d3000
[   24.566849] NDCB1: 0xc1400000
[   24.566849] NDCB2: 0x00000000
[   24.566849] NDCB3: 0x00000000
[   24.585782] nand: nand_do_read_oob: from = 0x060c0000, len = 64
[   24.591989] marvell-nfc pxa3xx-nand: 
[   24.591989] NDCR:  0x9d079fff
[   24.591989] NDCB0: 0x000d3000
[   24.591989] NDCB1: 0xc1800000
[   24.591989] NDCB2: 0x00000000
[   24.591989] NDCB3: 0x00000000
[   24.610918] nand: nand_do_read_oob: from = 0x060e0000, len = 64
[   24.616951] marvell-nfc pxa3xx-nand: 
[   24.616951] NDCR:  0x9d079fff
[   24.616951] NDCB0: 0x000d3000
[   24.616951] NDCB1: 0xc1c00000
[   24.616951] NDCB2: 0x00000000
[   24.616951] NDCB3: 0x00000000
[   24.635888] nand: nand_do_read_oob: from = 0x06100000, len = 64
[   24.642096] marvell-nfc pxa3xx-nand: 
[   24.642096] NDCR:  0x9d079fff
[   24.642096] NDCB0: 0x000d3000
[   24.642096] NDCB1: 0xc2000000
[   24.642096] NDCB2: 0x00000000
[   24.642096] NDCB3: 0x00000000
[   24.661026] nand: nand_do_read_oob: from = 0x06120000, len = 64
[   24.667054] marvell-nfc pxa3xx-nand: 
[   24.667054] NDCR:  0x9d079fff
[   24.667054] NDCB0: 0x000d3000
[   24.667054] NDCB1: 0xc2400000
[   24.667054] NDCB2: 0x00000000
[   24.667054] NDCB3: 0x00000000
[   24.685988] nand: nand_do_read_oob: from = 0x06140000, len = 64
[   24.692192] marvell-nfc pxa3xx-nand: 
[   24.692192] NDCR:  0x9d079fff
[   24.692192] NDCB0: 0x000d3000
[   24.692192] NDCB1: 0xc2800000
[   24.692192] NDCB2: 0x00000000
[   24.692192] NDCB3: 0x00000000
[   24.711122] nand: nand_do_read_oob: from = 0x06160000, len = 64
[   24.717153] marvell-nfc pxa3xx-nand: 
[   24.717153] NDCR:  0x9d079fff
[   24.717153] NDCB0: 0x000d3000
[   24.717153] NDCB1: 0xc2c00000
[   24.717153] NDCB2: 0x00000000
[   24.717153] NDCB3: 0x00000000
[   24.736108] nand: nand_do_read_oob: from = 0x06180000, len = 64
[   24.742309] marvell-nfc pxa3xx-nand: 
[   24.742309] NDCR:  0x9d079fff
[   24.742309] NDCB0: 0x000d3000
[   24.742309] NDCB1: 0xc3000000
[   24.742309] NDCB2: 0x00000000
[   24.742309] NDCB3: 0x00000000
[   24.761239] nand: nand_do_read_oob: from = 0x061a0000, len = 64
[   24.767270] marvell-nfc pxa3xx-nand: 
[   24.767270] NDCR:  0x9d079fff
[   24.767270] NDCB0: 0x000d3000
[   24.767270] NDCB1: 0xc3400000
[   24.767270] NDCB2: 0x00000000
[   24.767270] NDCB3: 0x00000000
[   24.786202] nand: nand_do_read_oob: from = 0x061c0000, len = 64
[   24.792407] marvell-nfc pxa3xx-nand: 
[   24.792407] NDCR:  0x9d079fff
[   24.792407] NDCB0: 0x000d3000
[   24.792407] NDCB1: 0xc3800000
[   24.792407] NDCB2: 0x00000000
[   24.792407] NDCB3: 0x00000000
[   24.811339] nand: nand_do_read_oob: from = 0x061e0000, len = 64
[   24.817367] marvell-nfc pxa3xx-nand: 
[   24.817367] NDCR:  0x9d079fff
[   24.817367] NDCB0: 0x000d3000
[   24.817367] NDCB1: 0xc3c00000
[   24.817367] NDCB2: 0x00000000
[   24.817367] NDCB3: 0x00000000
[   24.836302] nand: nand_do_read_oob: from = 0x06200000, len = 64
[   24.842506] marvell-nfc pxa3xx-nand: 
[   24.842506] NDCR:  0x9d079fff
[   24.842506] NDCB0: 0x000d3000
[   24.842506] NDCB1: 0xc4000000
[   24.842506] NDCB2: 0x00000000
[   24.842506] NDCB3: 0x00000000
[   24.861437] nand: nand_do_read_oob: from = 0x06220000, len = 64
[   24.867467] marvell-nfc pxa3xx-nand: 
[   24.867467] NDCR:  0x9d079fff
[   24.867467] NDCB0: 0x000d3000
[   24.867467] NDCB1: 0xc4400000
[   24.867467] NDCB2: 0x00000000
[   24.867467] NDCB3: 0x00000000
[   24.886399] nand: nand_do_read_oob: from = 0x06240000, len = 64
[   24.892604] marvell-nfc pxa3xx-nand: 
[   24.892604] NDCR:  0x9d079fff
[   24.892604] NDCB0: 0x000d3000
[   24.892604] NDCB1: 0xc4800000
[   24.892604] NDCB2: 0x00000000
[   24.892604] NDCB3: 0x00000000
[   24.911533] nand: nand_do_read_oob: from = 0x06260000, len = 64
[   24.917564] marvell-nfc pxa3xx-nand: 
[   24.917564] NDCR:  0x9d079fff
[   24.917564] NDCB0: 0x000d3000
[   24.917564] NDCB1: 0xc4c00000
[   24.917564] NDCB2: 0x00000000
[   24.917564] NDCB3: 0x00000000
[   24.936498] nand: nand_do_read_oob: from = 0x06280000, len = 64
[   24.942701] marvell-nfc pxa3xx-nand: 
[   24.942701] NDCR:  0x9d079fff
[   24.942701] NDCB0: 0x000d3000
[   24.942701] NDCB1: 0xc5000000
[   24.942701] NDCB2: 0x00000000
[   24.942701] NDCB3: 0x00000000
[   24.961631] nand: nand_do_read_oob: from = 0x062a0000, len = 64
[   24.967664] marvell-nfc pxa3xx-nand: 
[   24.967664] NDCR:  0x9d079fff
[   24.967664] NDCB0: 0x000d3000
[   24.967664] NDCB1: 0xc5400000
[   24.967664] NDCB2: 0x00000000
[   24.967664] NDCB3: 0x00000000
[   24.986598] nand: nand_do_read_oob: from = 0x062c0000, len = 64
[   24.992800] marvell-nfc pxa3xx-nand: 
[   24.992800] NDCR:  0x9d079fff
[   24.992800] NDCB0: 0x000d3000
[   24.992800] NDCB1: 0xc5800000
[   24.992800] NDCB2: 0x00000000
[   24.992800] NDCB3: 0x00000000
[   25.011742] nand: nand_do_read_oob: from = 0x062e0000, len = 64
[   25.017771] marvell-nfc pxa3xx-nand: 
[   25.017771] NDCR:  0x9d079fff
[   25.017771] NDCB0: 0x000d3000
[   25.017771] NDCB1: 0xc5c00000
[   25.017771] NDCB2: 0x00000000
[   25.017771] NDCB3: 0x00000000
[   25.036704] nand: nand_do_read_oob: from = 0x06300000, len = 64
[   25.042909] marvell-nfc pxa3xx-nand: 
[   25.042909] NDCR:  0x9d079fff
[   25.042909] NDCB0: 0x000d3000
[   25.042909] NDCB1: 0xc6000000
[   25.042909] NDCB2: 0x00000000
[   25.042909] NDCB3: 0x00000000
[   25.061840] nand: nand_do_read_oob: from = 0x06320000, len = 64
[   25.067868] marvell-nfc pxa3xx-nand: 
[   25.067868] NDCR:  0x9d079fff
[   25.067868] NDCB0: 0x000d3000
[   25.067868] NDCB1: 0xc6400000
[   25.067868] NDCB2: 0x00000000
[   25.067868] NDCB3: 0x00000000
[   25.086807] nand: nand_do_read_oob: from = 0x06340000, len = 64
[   25.093007] marvell-nfc pxa3xx-nand: 
[   25.093007] NDCR:  0x9d079fff
[   25.093007] NDCB0: 0x000d3000
[   25.093007] NDCB1: 0xc6800000
[   25.093007] NDCB2: 0x00000000
[   25.093007] NDCB3: 0x00000000
[   25.111938] nand: nand_do_read_oob: from = 0x06360000, len = 64
[   25.117967] marvell-nfc pxa3xx-nand: 
[   25.117967] NDCR:  0x9d079fff
[   25.117967] NDCB0: 0x000d3000
[   25.117967] NDCB1: 0xc6c00000
[   25.117967] NDCB2: 0x00000000
[   25.117967] NDCB3: 0x00000000
[   25.136901] nand: nand_do_read_oob: from = 0x06380000, len = 64
[   25.143106] marvell-nfc pxa3xx-nand: 
[   25.143106] NDCR:  0x9d079fff
[   25.143106] NDCB0: 0x000d3000
[   25.143106] NDCB1: 0xc7000000
[   25.143106] NDCB2: 0x00000000
[   25.143106] NDCB3: 0x00000000
[   25.162036] nand: nand_do_read_oob: from = 0x063a0000, len = 64
[   25.168067] marvell-nfc pxa3xx-nand: 
[   25.168067] NDCR:  0x9d079fff
[   25.168067] NDCB0: 0x000d3000
[   25.168067] NDCB1: 0xc7400000
[   25.168067] NDCB2: 0x00000000
[   25.168067] NDCB3: 0x00000000
[   25.187002] nand: nand_do_read_oob: from = 0x063c0000, len = 64
[   25.193203] marvell-nfc pxa3xx-nand: 
[   25.193203] NDCR:  0x9d079fff
[   25.193203] NDCB0: 0x000d3000
[   25.193203] NDCB1: 0xc7800000
[   25.193203] NDCB2: 0x00000000
[   25.193203] NDCB3: 0x00000000
[   25.212134] nand: nand_do_read_oob: from = 0x063e0000, len = 64
[   25.218164] marvell-nfc pxa3xx-nand: 
[   25.218164] NDCR:  0x9d079fff
[   25.218164] NDCB0: 0x000d3000
[   25.218164] NDCB1: 0xc7c00000
[   25.218164] NDCB2: 0x00000000
[   25.218164] NDCB3: 0x00000000
[   25.237097] nand: nand_do_read_oob: from = 0x06400000, len = 64
[   25.243303] marvell-nfc pxa3xx-nand: 
[   25.243303] NDCR:  0x9d079fff
[   25.243303] NDCB0: 0x000d3000
[   25.243303] NDCB1: 0xc8000000
[   25.243303] NDCB2: 0x00000000
[   25.243303] NDCB3: 0x00000000
[   25.262230] nand: nand_do_read_oob: from = 0x06420000, len = 64
[   25.268262] marvell-nfc pxa3xx-nand: 
[   25.268262] NDCR:  0x9d079fff
[   25.268262] NDCB0: 0x000d3000
[   25.268262] NDCB1: 0xc8400000
[   25.268262] NDCB2: 0x00000000
[   25.268262] NDCB3: 0x00000000
[   25.287196] nand: nand_do_read_oob: from = 0x06440000, len = 64
[   25.293401] marvell-nfc pxa3xx-nand: 
[   25.293401] NDCR:  0x9d079fff
[   25.293401] NDCB0: 0x000d3000
[   25.293401] NDCB1: 0xc8800000
[   25.293401] NDCB2: 0x00000000
[   25.293401] NDCB3: 0x00000000
[   25.312330] nand: nand_do_read_oob: from = 0x06460000, len = 64
[   25.318361] marvell-nfc pxa3xx-nand: 
[   25.318361] NDCR:  0x9d079fff
[   25.318361] NDCB0: 0x000d3000
[   25.318361] NDCB1: 0xc8c00000
[   25.318361] NDCB2: 0x00000000
[   25.318361] NDCB3: 0x00000000
[   25.337293] nand: nand_do_read_oob: from = 0x06480000, len = 64
[   25.343499] marvell-nfc pxa3xx-nand: 
[   25.343499] NDCR:  0x9d079fff
[   25.343499] NDCB0: 0x000d3000
[   25.343499] NDCB1: 0xc9000000
[   25.343499] NDCB2: 0x00000000
[   25.343499] NDCB3: 0x00000000
[   25.362446] nand: nand_do_read_oob: from = 0x064a0000, len = 64
[   25.368478] marvell-nfc pxa3xx-nand: 
[   25.368478] NDCR:  0x9d079fff
[   25.368478] NDCB0: 0x000d3000
[   25.368478] NDCB1: 0xc9400000
[   25.368478] NDCB2: 0x00000000
[   25.368478] NDCB3: 0x00000000
[   25.387413] nand: nand_do_read_oob: from = 0x064c0000, len = 64
[   25.393617] marvell-nfc pxa3xx-nand: 
[   25.393617] NDCR:  0x9d079fff
[   25.393617] NDCB0: 0x000d3000
[   25.393617] NDCB1: 0xc9800000
[   25.393617] NDCB2: 0x00000000
[   25.393617] NDCB3: 0x00000000
[   25.412545] nand: nand_do_read_oob: from = 0x064e0000, len = 64
[   25.418575] marvell-nfc pxa3xx-nand: 
[   25.418575] NDCR:  0x9d079fff
[   25.418575] NDCB0: 0x000d3000
[   25.418575] NDCB1: 0xc9c00000
[   25.418575] NDCB2: 0x00000000
[   25.418575] NDCB3: 0x00000000
[   25.437618] nand: nand_do_read_oob: from = 0x06500000, len = 64
[   25.443823] marvell-nfc pxa3xx-nand: 
[   25.443823] NDCR:  0x9d079fff
[   25.443823] NDCB0: 0x000d3000
[   25.443823] NDCB1: 0xca000000
[   25.443823] NDCB2: 0x00000000
[   25.443823] NDCB3: 0x00000000
[   25.462756] nand: nand_do_read_oob: from = 0x06520000, len = 64
[   25.468956] marvell-nfc pxa3xx-nand: 
[   25.468956] NDCR:  0x9d079fff
[   25.468956] NDCB0: 0x000d3000
[   25.468956] NDCB1: 0xca400000
[   25.468956] NDCB2: 0x00000000
[   25.468956] NDCB3: 0x00000000
[   25.487878] nand: nand_do_read_oob: from = 0x06540000, len = 64
[   25.494080] marvell-nfc pxa3xx-nand: 
[   25.494080] NDCR:  0x9d079fff
[   25.494080] NDCB0: 0x000d3000
[   25.494080] NDCB1: 0xca800000
[   25.494080] NDCB2: 0x00000000
[   25.494080] NDCB3: 0x00000000
[   25.513008] nand: nand_do_read_oob: from = 0x06560000, len = 64
[   25.519209] marvell-nfc pxa3xx-nand: 
[   25.519209] NDCR:  0x9d079fff
[   25.519209] NDCB0: 0x000d3000
[   25.519209] NDCB1: 0xcac00000
[   25.519209] NDCB2: 0x00000000
[   25.519209] NDCB3: 0x00000000
[   25.538130] nand: nand_do_read_oob: from = 0x06580000, len = 64
[   25.544332] marvell-nfc pxa3xx-nand: 
[   25.544332] NDCR:  0x9d079fff
[   25.544332] NDCB0: 0x000d3000
[   25.544332] NDCB1: 0xcb000000
[   25.544332] NDCB2: 0x00000000
[   25.544332] NDCB3: 0x00000000
[   25.563262] nand: nand_do_read_oob: from = 0x065a0000, len = 64
[   25.569461] marvell-nfc pxa3xx-nand: 
[   25.569461] NDCR:  0x9d079fff
[   25.569461] NDCB0: 0x000d3000
[   25.569461] NDCB1: 0xcb400000
[   25.569461] NDCB2: 0x00000000
[   25.569461] NDCB3: 0x00000000
[   25.588383] nand: nand_do_read_oob: from = 0x065c0000, len = 64
[   25.594587] marvell-nfc pxa3xx-nand: 
[   25.594587] NDCR:  0x9d079fff
[   25.594587] NDCB0: 0x000d3000
[   25.594587] NDCB1: 0xcb800000
[   25.594587] NDCB2: 0x00000000
[   25.594587] NDCB3: 0x00000000
[   25.613516] nand: nand_do_read_oob: from = 0x065e0000, len = 64
[   25.619718] marvell-nfc pxa3xx-nand: 
[   25.619718] NDCR:  0x9d079fff
[   25.619718] NDCB0: 0x000d3000
[   25.619718] NDCB1: 0xcbc00000
[   25.619718] NDCB2: 0x00000000
[   25.619718] NDCB3: 0x00000000
[   25.638638] nand: nand_do_read_oob: from = 0x06600000, len = 64
[   25.644824] marvell-nfc pxa3xx-nand: 
[   25.644824] NDCR:  0x9d079fff
[   25.644824] NDCB0: 0x000d3000
[   25.644824] NDCB1: 0xcc000000
[   25.644824] NDCB2: 0x00000000
[   25.644824] NDCB3: 0x00000000
[   25.663739] nand: nand_do_read_oob: from = 0x06620000, len = 64
[   25.669943] marvell-nfc pxa3xx-nand: 
[   25.669943] NDCR:  0x9d079fff
[   25.669943] NDCB0: 0x000d3000
[   25.669943] NDCB1: 0xcc400000
[   25.669943] NDCB2: 0x00000000
[   25.669943] NDCB3: 0x00000000
[   25.688899] nand: nand_do_read_oob: from = 0x06640000, len = 64
[   25.694935] marvell-nfc pxa3xx-nand: 
[   25.694935] NDCR:  0x9d079fff
[   25.694935] NDCB0: 0x000d3000
[   25.694935] NDCB1: 0xcc800000
[   25.694935] NDCB2: 0x00000000
[   25.694935] NDCB3: 0x00000000
[   25.713873] nand: nand_do_read_oob: from = 0x06660000, len = 64
[   25.720078] marvell-nfc pxa3xx-nand: 
[   25.720078] NDCR:  0x9d079fff
[   25.720078] NDCB0: 0x000d3000
[   25.720078] NDCB1: 0xccc00000
[   25.720078] NDCB2: 0x00000000
[   25.720078] NDCB3: 0x00000000
[   25.739046] nand: nand_do_read_oob: from = 0x06680000, len = 64
[   25.745080] marvell-nfc pxa3xx-nand: 
[   25.745080] NDCR:  0x9d079fff
[   25.745080] NDCB0: 0x000d3000
[   25.745080] NDCB1: 0xcd000000
[   25.745080] NDCB2: 0x00000000
[   25.745080] NDCB3: 0x00000000
[   25.764014] nand: nand_do_read_oob: from = 0x066a0000, len = 64
[   25.770220] marvell-nfc pxa3xx-nand: 
[   25.770220] NDCR:  0x9d079fff
[   25.770220] NDCB0: 0x000d3000
[   25.770220] NDCB1: 0xcd400000
[   25.770220] NDCB2: 0x00000000
[   25.770220] NDCB3: 0x00000000
[   25.789144] nand: nand_do_read_oob: from = 0x066c0000, len = 64
[   25.795180] marvell-nfc pxa3xx-nand: 
[   25.795180] NDCR:  0x9d079fff
[   25.795180] NDCB0: 0x000d3000
[   25.795180] NDCB1: 0xcd800000
[   25.795180] NDCB2: 0x00000000
[   25.795180] NDCB3: 0x00000000
[   25.814114] nand: nand_do_read_oob: from = 0x066e0000, len = 64
[   25.820318] marvell-nfc pxa3xx-nand: 
[   25.820318] NDCR:  0x9d079fff
[   25.820318] NDCB0: 0x000d3000
[   25.820318] NDCB1: 0xcdc00000
[   25.820318] NDCB2: 0x00000000
[   25.820318] NDCB3: 0x00000000
[   25.839247] nand: nand_do_read_oob: from = 0x06700000, len = 64
[   25.845278] marvell-nfc pxa3xx-nand: 
[   25.845278] NDCR:  0x9d079fff
[   25.845278] NDCB0: 0x000d3000
[   25.845278] NDCB1: 0xce000000
[   25.845278] NDCB2: 0x00000000
[   25.845278] NDCB3: 0x00000000
[   25.864211] nand: nand_do_read_oob: from = 0x06720000, len = 64
[   25.870419] marvell-nfc pxa3xx-nand: 
[   25.870419] NDCR:  0x9d079fff
[   25.870419] NDCB0: 0x000d3000
[   25.870419] NDCB1: 0xce400000
[   25.870419] NDCB2: 0x00000000
[   25.870419] NDCB3: 0x00000000
[   25.889351] nand: nand_do_read_oob: from = 0x06740000, len = 64
[   25.895386] marvell-nfc pxa3xx-nand: 
[   25.895386] NDCR:  0x9d079fff
[   25.895386] NDCB0: 0x000d3000
[   25.895386] NDCB1: 0xce800000
[   25.895386] NDCB2: 0x00000000
[   25.895386] NDCB3: 0x00000000
[   25.914320] nand: nand_do_read_oob: from = 0x06760000, len = 64
[   25.920524] marvell-nfc pxa3xx-nand: 
[   25.920524] NDCR:  0x9d079fff
[   25.920524] NDCB0: 0x000d3000
[   25.920524] NDCB1: 0xcec00000
[   25.920524] NDCB2: 0x00000000
[   25.920524] NDCB3: 0x00000000
[   25.939469] nand: nand_do_read_oob: from = 0x06780000, len = 64
[   25.945500] marvell-nfc pxa3xx-nand: 
[   25.945500] NDCR:  0x9d079fff
[   25.945500] NDCB0: 0x000d3000
[   25.945500] NDCB1: 0xcf000000
[   25.945500] NDCB2: 0x00000000
[   25.945500] NDCB3: 0x00000000
[   25.964434] nand: nand_do_read_oob: from = 0x067a0000, len = 64
[   25.970641] marvell-nfc pxa3xx-nand: 
[   25.970641] NDCR:  0x9d079fff
[   25.970641] NDCB0: 0x000d3000
[   25.970641] NDCB1: 0xcf400000
[   25.970641] NDCB2: 0x00000000
[   25.970641] NDCB3: 0x00000000
[   25.989570] nand: nand_do_read_oob: from = 0x067c0000, len = 64
[   25.995599] marvell-nfc pxa3xx-nand: 
[   25.995599] NDCR:  0x9d079fff
[   25.995599] NDCB0: 0x000d3000
[   25.995599] NDCB1: 0xcf800000
[   25.995599] NDCB2: 0x00000000
[   25.995599] NDCB3: 0x00000000
[   26.014541] nand: nand_do_read_oob: from = 0x067e0000, len = 64
[   26.020747] marvell-nfc pxa3xx-nand: 
[   26.020747] NDCR:  0x9d079fff
[   26.020747] NDCB0: 0x000d3000
[   26.020747] NDCB1: 0xcfc00000
[   26.020747] NDCB2: 0x00000000
[   26.020747] NDCB3: 0x00000000
[   26.039677] nand: nand_do_read_oob: from = 0x06800000, len = 64
[   26.045706] marvell-nfc pxa3xx-nand: 
[   26.045706] NDCR:  0x9d079fff
[   26.045706] NDCB0: 0x000d3000
[   26.045706] NDCB1: 0xd0000000
[   26.045706] NDCB2: 0x00000000
[   26.045706] NDCB3: 0x00000000
[   26.064637] nand: nand_do_read_oob: from = 0x06820000, len = 64
[   26.070836] marvell-nfc pxa3xx-nand: 
[   26.070836] NDCR:  0x9d079fff
[   26.070836] NDCB0: 0x000d3000
[   26.070836] NDCB1: 0xd0400000
[   26.070836] NDCB2: 0x00000000
[   26.070836] NDCB3: 0x00000000
[   26.090106] nand: nand_do_read_oob: from = 0x06840000, len = 64
[   26.096145] marvell-nfc pxa3xx-nand: 
[   26.096145] NDCR:  0x9d079fff
[   26.096145] NDCB0: 0x000d3000
[   26.096145] NDCB1: 0xd0800000
[   26.096145] NDCB2: 0x00000000
[   26.096145] NDCB3: 0x00000000
[   26.115109] nand: nand_do_read_oob: from = 0x06860000, len = 64
[   26.121313] marvell-nfc pxa3xx-nand: 
[   26.121313] NDCR:  0x9d079fff
[   26.121313] NDCB0: 0x000d3000
[   26.121313] NDCB1: 0xd0c00000
[   26.121313] NDCB2: 0x00000000
[   26.121313] NDCB3: 0x00000000
[   26.140243] nand: nand_do_read_oob: from = 0x06880000, len = 64
[   26.146272] marvell-nfc pxa3xx-nand: 
[   26.146272] NDCR:  0x9d079fff
[   26.146272] NDCB0: 0x000d3000
[   26.146272] NDCB1: 0xd1000000
[   26.146272] NDCB2: 0x00000000
[   26.146272] NDCB3: 0x00000000
[   26.165208] nand: nand_do_read_oob: from = 0x068a0000, len = 64
[   26.171411] marvell-nfc pxa3xx-nand: 
[   26.171411] NDCR:  0x9d079fff
[   26.171411] NDCB0: 0x000d3000
[   26.171411] NDCB1: 0xd1400000
[   26.171411] NDCB2: 0x00000000
[   26.171411] NDCB3: 0x00000000
[   26.190341] nand: nand_do_read_oob: from = 0x068c0000, len = 64
[   26.196372] marvell-nfc pxa3xx-nand: 
[   26.196372] NDCR:  0x9d079fff
[   26.196372] NDCB0: 0x000d3000
[   26.196372] NDCB1: 0xd1800000
[   26.196372] NDCB2: 0x00000000
[   26.196372] NDCB3: 0x00000000
[   26.215306] nand: nand_do_read_oob: from = 0x068e0000, len = 64
[   26.221511] marvell-nfc pxa3xx-nand: 
[   26.221511] NDCR:  0x9d079fff
[   26.221511] NDCB0: 0x000d3000
[   26.221511] NDCB1: 0xd1c00000
[   26.221511] NDCB2: 0x00000000
[   26.221511] NDCB3: 0x00000000
[   26.240439] nand: nand_do_read_oob: from = 0x06900000, len = 64
[   26.246471] marvell-nfc pxa3xx-nand: 
[   26.246471] NDCR:  0x9d079fff
[   26.246471] NDCB0: 0x000d3000
[   26.246471] NDCB1: 0xd2000000
[   26.246471] NDCB2: 0x00000000
[   26.246471] NDCB3: 0x00000000
[   26.265403] nand: nand_do_read_oob: from = 0x06920000, len = 64
[   26.271608] marvell-nfc pxa3xx-nand: 
[   26.271608] NDCR:  0x9d079fff
[   26.271608] NDCB0: 0x000d3000
[   26.271608] NDCB1: 0xd2400000
[   26.271608] NDCB2: 0x00000000
[   26.271608] NDCB3: 0x00000000
[   26.290538] nand: nand_do_read_oob: from = 0x06940000, len = 64
[   26.296569] marvell-nfc pxa3xx-nand: 
[   26.296569] NDCR:  0x9d079fff
[   26.296569] NDCB0: 0x000d3000
[   26.296569] NDCB1: 0xd2800000
[   26.296569] NDCB2: 0x00000000
[   26.296569] NDCB3: 0x00000000
[   26.315502] nand: nand_do_read_oob: from = 0x06960000, len = 64
[   26.321707] marvell-nfc pxa3xx-nand: 
[   26.321707] NDCR:  0x9d079fff
[   26.321707] NDCB0: 0x000d3000
[   26.321707] NDCB1: 0xd2c00000
[   26.321707] NDCB2: 0x00000000
[   26.321707] NDCB3: 0x00000000
[   26.340635] nand: nand_do_read_oob: from = 0x06980000, len = 64
[   26.346669] marvell-nfc pxa3xx-nand: 
[   26.346669] NDCR:  0x9d079fff
[   26.346669] NDCB0: 0x000d3000
[   26.346669] NDCB1: 0xd3000000
[   26.346669] NDCB2: 0x00000000
[   26.346669] NDCB3: 0x00000000
[   26.365601] nand: nand_do_read_oob: from = 0x069a0000, len = 64
[   26.371806] marvell-nfc pxa3xx-nand: 
[   26.371806] NDCR:  0x9d079fff
[   26.371806] NDCB0: 0x000d3000
[   26.371806] NDCB1: 0xd3400000
[   26.371806] NDCB2: 0x00000000
[   26.371806] NDCB3: 0x00000000
[   26.390734] nand: nand_do_read_oob: from = 0x069c0000, len = 64
[   26.396767] marvell-nfc pxa3xx-nand: 
[   26.396767] NDCR:  0x9d079fff
[   26.396767] NDCB0: 0x000d3000
[   26.396767] NDCB1: 0xd3800000
[   26.396767] NDCB2: 0x00000000
[   26.396767] NDCB3: 0x00000000
[   26.415698] nand: nand_do_read_oob: from = 0x069e0000, len = 64
[   26.421904] marvell-nfc pxa3xx-nand: 
[   26.421904] NDCR:  0x9d079fff
[   26.421904] NDCB0: 0x000d3000
[   26.421904] NDCB1: 0xd3c00000
[   26.421904] NDCB2: 0x00000000
[   26.421904] NDCB3: 0x00000000
[   26.440832] nand: nand_do_read_oob: from = 0x06a00000, len = 64
[   26.446863] marvell-nfc pxa3xx-nand: 
[   26.446863] NDCR:  0x9d079fff
[   26.446863] NDCB0: 0x000d3000
[   26.446863] NDCB1: 0xd4000000
[   26.446863] NDCB2: 0x00000000
[   26.446863] NDCB3: 0x00000000
[   26.465798] nand: nand_do_read_oob: from = 0x06a20000, len = 64
[   26.472002] marvell-nfc pxa3xx-nand: 
[   26.472002] NDCR:  0x9d079fff
[   26.472002] NDCB0: 0x000d3000
[   26.472002] NDCB1: 0xd4400000
[   26.472002] NDCB2: 0x00000000
[   26.472002] NDCB3: 0x00000000
[   26.490930] nand: nand_do_read_oob: from = 0x06a40000, len = 64
[   26.496963] marvell-nfc pxa3xx-nand: 
[   26.496963] NDCR:  0x9d079fff
[   26.496963] NDCB0: 0x000d3000
[   26.496963] NDCB1: 0xd4800000
[   26.496963] NDCB2: 0x00000000
[   26.496963] NDCB3: 0x00000000
[   26.515894] nand: nand_do_read_oob: from = 0x06a60000, len = 64
[   26.522092] marvell-nfc pxa3xx-nand: 
[   26.522092] NDCR:  0x9d079fff
[   26.522092] NDCB0: 0x000d3000
[   26.522092] NDCB1: 0xd4c00000
[   26.522092] NDCB2: 0x00000000
[   26.522092] NDCB3: 0x00000000
[   26.541022] nand: nand_do_read_oob: from = 0x06a80000, len = 64
[   26.547052] marvell-nfc pxa3xx-nand: 
[   26.547052] NDCR:  0x9d079fff
[   26.547052] NDCB0: 0x000d3000
[   26.547052] NDCB1: 0xd5000000
[   26.547052] NDCB2: 0x00000000
[   26.547052] NDCB3: 0x00000000
[   26.565986] nand: nand_do_read_oob: from = 0x06aa0000, len = 64
[   26.572194] marvell-nfc pxa3xx-nand: 
[   26.572194] NDCR:  0x9d079fff
[   26.572194] NDCB0: 0x000d3000
[   26.572194] NDCB1: 0xd5400000
[   26.572194] NDCB2: 0x00000000
[   26.572194] NDCB3: 0x00000000
[   26.591141] nand: nand_do_read_oob: from = 0x06ac0000, len = 64
[   26.597178] marvell-nfc pxa3xx-nand: 
[   26.597178] NDCR:  0x9d079fff
[   26.597178] NDCB0: 0x000d3000
[   26.597178] NDCB1: 0xd5800000
[   26.597178] NDCB2: 0x00000000
[   26.597178] NDCB3: 0x00000000
[   26.616109] nand: nand_do_read_oob: from = 0x06ae0000, len = 64
[   26.622316] marvell-nfc pxa3xx-nand: 
[   26.622316] NDCR:  0x9d079fff
[   26.622316] NDCB0: 0x000d3000
[   26.622316] NDCB1: 0xd5c00000
[   26.622316] NDCB2: 0x00000000
[   26.622316] NDCB3: 0x00000000
[   26.641244] nand: nand_do_read_oob: from = 0x06b00000, len = 64
[   26.647276] marvell-nfc pxa3xx-nand: 
[   26.647276] NDCR:  0x9d079fff
[   26.647276] NDCB0: 0x000d3000
[   26.647276] NDCB1: 0xd6000000
[   26.647276] NDCB2: 0x00000000
[   26.647276] NDCB3: 0x00000000
[   26.666208] nand: nand_do_read_oob: from = 0x06b20000, len = 64
[   26.672412] marvell-nfc pxa3xx-nand: 
[   26.672412] NDCR:  0x9d079fff
[   26.672412] NDCB0: 0x000d3000
[   26.672412] NDCB1: 0xd6400000
[   26.672412] NDCB2: 0x00000000
[   26.672412] NDCB3: 0x00000000
[   26.691343] nand: nand_do_read_oob: from = 0x06b40000, len = 64
[   26.697375] marvell-nfc pxa3xx-nand: 
[   26.697375] NDCR:  0x9d079fff
[   26.697375] NDCB0: 0x000d3000
[   26.697375] NDCB1: 0xd6800000
[   26.697375] NDCB2: 0x00000000
[   26.697375] NDCB3: 0x00000000
[   26.716310] nand: nand_do_read_oob: from = 0x06b60000, len = 64
[   26.722513] marvell-nfc pxa3xx-nand: 
[   26.722513] NDCR:  0x9d079fff
[   26.722513] NDCB0: 0x000d3000
[   26.722513] NDCB1: 0xd6c00000
[   26.722513] NDCB2: 0x00000000
[   26.722513] NDCB3: 0x00000000
[   26.741440] nand: nand_do_read_oob: from = 0x06b80000, len = 64
[   26.747474] marvell-nfc pxa3xx-nand: 
[   26.747474] NDCR:  0x9d079fff
[   26.747474] NDCB0: 0x000d3000
[   26.747474] NDCB1: 0xd7000000
[   26.747474] NDCB2: 0x00000000
[   26.747474] NDCB3: 0x00000000
[   26.766408] nand: nand_do_read_oob: from = 0x06ba0000, len = 64
[   26.772613] marvell-nfc pxa3xx-nand: 
[   26.772613] NDCR:  0x9d079fff
[   26.772613] NDCB0: 0x000d3000
[   26.772613] NDCB1: 0xd7400000
[   26.772613] NDCB2: 0x00000000
[   26.772613] NDCB3: 0x00000000
[   26.791540] nand: nand_do_read_oob: from = 0x06bc0000, len = 64
[   26.797571] marvell-nfc pxa3xx-nand: 
[   26.797571] NDCR:  0x9d079fff
[   26.797571] NDCB0: 0x000d3000
[   26.797571] NDCB1: 0xd7800000
[   26.797571] NDCB2: 0x00000000
[   26.797571] NDCB3: 0x00000000
[   26.816504] nand: nand_do_read_oob: from = 0x06be0000, len = 64
[   26.822709] marvell-nfc pxa3xx-nand: 
[   26.822709] NDCR:  0x9d079fff
[   26.822709] NDCB0: 0x000d3000
[   26.822709] NDCB1: 0xd7c00000
[   26.822709] NDCB2: 0x00000000
[   26.822709] NDCB3: 0x00000000
[   26.841637] nand: nand_do_read_oob: from = 0x06c00000, len = 64
[   26.847670] marvell-nfc pxa3xx-nand: 
[   26.847670] NDCR:  0x9d079fff
[   26.847670] NDCB0: 0x000d3000
[   26.847670] NDCB1: 0xd8000000
[   26.847670] NDCB2: 0x00000000
[   26.847670] NDCB3: 0x00000000
[   26.866601] nand: nand_do_read_oob: from = 0x06c20000, len = 64
[   26.872810] marvell-nfc pxa3xx-nand: 
[   26.872810] NDCR:  0x9d079fff
[   26.872810] NDCB0: 0x000d3000
[   26.872810] NDCB1: 0xd8400000
[   26.872810] NDCB2: 0x00000000
[   26.872810] NDCB3: 0x00000000
[   26.891738] nand: nand_do_read_oob: from = 0x06c40000, len = 64
[   26.897767] marvell-nfc pxa3xx-nand: 
[   26.897767] NDCR:  0x9d079fff
[   26.897767] NDCB0: 0x000d3000
[   26.897767] NDCB1: 0xd8800000
[   26.897767] NDCB2: 0x00000000
[   26.897767] NDCB3: 0x00000000
[   26.916703] nand: nand_do_read_oob: from = 0x06c60000, len = 64
[   26.922905] marvell-nfc pxa3xx-nand: 
[   26.922905] NDCR:  0x9d079fff
[   26.922905] NDCB0: 0x000d3000
[   26.922905] NDCB1: 0xd8c00000
[   26.922905] NDCB2: 0x00000000
[   26.922905] NDCB3: 0x00000000
[   26.941834] nand: nand_do_read_oob: from = 0x06c80000, len = 64
[   26.947867] marvell-nfc pxa3xx-nand: 
[   26.947867] NDCR:  0x9d079fff
[   26.947867] NDCB0: 0x000d3000
[   26.947867] NDCB1: 0xd9000000
[   26.947867] NDCB2: 0x00000000
[   26.947867] NDCB3: 0x00000000
[   26.966798] nand: nand_do_read_oob: from = 0x06ca0000, len = 64
[   26.973006] marvell-nfc pxa3xx-nand: 
[   26.973006] NDCR:  0x9d079fff
[   26.973006] NDCB0: 0x000d3000
[   26.973006] NDCB1: 0xd9400000
[   26.973006] NDCB2: 0x00000000
[   26.973006] NDCB3: 0x00000000
[   26.991934] nand: nand_do_read_oob: from = 0x06cc0000, len = 64
[   26.997965] marvell-nfc pxa3xx-nand: 
[   26.997965] NDCR:  0x9d079fff
[   26.997965] NDCB0: 0x000d3000
[   26.997965] NDCB1: 0xd9800000
[   26.997965] NDCB2: 0x00000000
[   26.997965] NDCB3: 0x00000000
[   27.016907] nand: nand_do_read_oob: from = 0x06ce0000, len = 64
[   27.023114] marvell-nfc pxa3xx-nand: 
[   27.023114] NDCR:  0x9d079fff
[   27.023114] NDCB0: 0x000d3000
[   27.023114] NDCB1: 0xd9c00000
[   27.023114] NDCB2: 0x00000000
[   27.023114] NDCB3: 0x00000000
[   27.042039] nand: nand_do_read_oob: from = 0x06d00000, len = 64
[   27.048071] marvell-nfc pxa3xx-nand: 
[   27.048071] NDCR:  0x9d079fff
[   27.048071] NDCB0: 0x000d3000
[   27.048071] NDCB1: 0xda000000
[   27.048071] NDCB2: 0x00000000
[   27.048071] NDCB3: 0x00000000
[   27.067005] nand: nand_do_read_oob: from = 0x06d20000, len = 64
[   27.073211] marvell-nfc pxa3xx-nand: 
[   27.073211] NDCR:  0x9d079fff
[   27.073211] NDCB0: 0x000d3000
[   27.073211] NDCB1: 0xda400000
[   27.073211] NDCB2: 0x00000000
[   27.073211] NDCB3: 0x00000000
[   27.092136] nand: nand_do_read_oob: from = 0x06d40000, len = 64
[   27.098171] marvell-nfc pxa3xx-nand: 
[   27.098171] NDCR:  0x9d079fff
[   27.098171] NDCB0: 0x000d3000
[   27.098171] NDCB1: 0xda800000
[   27.098171] NDCB2: 0x00000000
[   27.098171] NDCB3: 0x00000000
[   27.117101] nand: nand_do_read_oob: from = 0x06d60000, len = 64
[   27.123300] marvell-nfc pxa3xx-nand: 
[   27.123300] NDCR:  0x9d079fff
[   27.123300] NDCB0: 0x000d3000
[   27.123300] NDCB1: 0xdac00000
[   27.123300] NDCB2: 0x00000000
[   27.123300] NDCB3: 0x00000000
[   27.142227] nand: nand_do_read_oob: from = 0x06d80000, len = 64
[   27.148260] marvell-nfc pxa3xx-nand: 
[   27.148260] NDCR:  0x9d079fff
[   27.148260] NDCB0: 0x000d3000
[   27.148260] NDCB1: 0xdb000000
[   27.148260] NDCB2: 0x00000000
[   27.148260] NDCB3: 0x00000000
[   27.167192] nand: nand_do_read_oob: from = 0x06da0000, len = 64
[   27.173398] marvell-nfc pxa3xx-nand: 
[   27.173398] NDCR:  0x9d079fff
[   27.173398] NDCB0: 0x000d3000
[   27.173398] NDCB1: 0xdb400000
[   27.173398] NDCB2: 0x00000000
[   27.173398] NDCB3: 0x00000000
[   27.192326] nand: nand_do_read_oob: from = 0x06dc0000, len = 64
[   27.198359] marvell-nfc pxa3xx-nand: 
[   27.198359] NDCR:  0x9d079fff
[   27.198359] NDCB0: 0x000d3000
[   27.198359] NDCB1: 0xdb800000
[   27.198359] NDCB2: 0x00000000
[   27.198359] NDCB3: 0x00000000
[   27.217290] nand: nand_do_read_oob: from = 0x06de0000, len = 64
[   27.223517] marvell-nfc pxa3xx-nand: 
[   27.223517] NDCR:  0x9d079fff
[   27.223517] NDCB0: 0x000d3000
[   27.223517] NDCB1: 0xdbc00000
[   27.223517] NDCB2: 0x00000000
[   27.223517] NDCB3: 0x00000000
[   27.242446] nand: nand_do_read_oob: from = 0x06e00000, len = 64
[   27.248475] marvell-nfc pxa3xx-nand: 
[   27.248475] NDCR:  0x9d079fff
[   27.248475] NDCB0: 0x000d3000
[   27.248475] NDCB1: 0xdc000000
[   27.248475] NDCB2: 0x00000000
[   27.248475] NDCB3: 0x00000000
[   27.267405] nand: nand_do_read_oob: from = 0x06e20000, len = 64
[   27.273605] marvell-nfc pxa3xx-nand: 
[   27.273605] NDCR:  0x9d079fff
[   27.273605] NDCB0: 0x000d3000
[   27.273605] NDCB1: 0xdc400000
[   27.273605] NDCB2: 0x00000000
[   27.273605] NDCB3: 0x00000000
[   27.292532] nand: nand_do_read_oob: from = 0x06e40000, len = 64
[   27.298563] marvell-nfc pxa3xx-nand: 
[   27.298563] NDCR:  0x9d079fff
[   27.298563] NDCB0: 0x000d3000
[   27.298563] NDCB1: 0xdc800000
[   27.298563] NDCB2: 0x00000000
[   27.298563] NDCB3: 0x00000000
[   27.317497] nand: nand_do_read_oob: from = 0x06e60000, len = 64
[   27.323702] marvell-nfc pxa3xx-nand: 
[   27.323702] NDCR:  0x9d079fff
[   27.323702] NDCB0: 0x000d3000
[   27.323702] NDCB1: 0xdcc00000
[   27.323702] NDCB2: 0x00000000
[   27.323702] NDCB3: 0x00000000
[   27.342630] nand: nand_do_read_oob: from = 0x06e80000, len = 64
[   27.348836] marvell-nfc pxa3xx-nand: 
[   27.348836] NDCR:  0x9d079fff
[   27.348836] NDCB0: 0x000d3000
[   27.348836] NDCB1: 0xdd000000
[   27.348836] NDCB2: 0x00000000
[   27.348836] NDCB3: 0x00000000
[   27.367746] nand: nand_do_read_oob: from = 0x06ea0000, len = 64
[   27.373948] marvell-nfc pxa3xx-nand: 
[   27.373948] NDCR:  0x9d079fff
[   27.373948] NDCB0: 0x000d3000
[   27.373948] NDCB1: 0xdd400000
[   27.373948] NDCB2: 0x00000000
[   27.373948] NDCB3: 0x00000000
[   27.392877] nand: nand_do_read_oob: from = 0x06ec0000, len = 64
[   27.399076] marvell-nfc pxa3xx-nand: 
[   27.399076] NDCR:  0x9d079fff
[   27.399076] NDCB0: 0x000d3000
[   27.399076] NDCB1: 0xdd800000
[   27.399076] NDCB2: 0x00000000
[   27.399076] NDCB3: 0x00000000
[   27.417998] nand: nand_do_read_oob: from = 0x06ee0000, len = 64
[   27.424199] marvell-nfc pxa3xx-nand: 
[   27.424199] NDCR:  0x9d079fff
[   27.424199] NDCB0: 0x000d3000
[   27.424199] NDCB1: 0xddc00000
[   27.424199] NDCB2: 0x00000000
[   27.424199] NDCB3: 0x00000000
[   27.443130] nand: nand_do_read_oob: from = 0x06f00000, len = 64
[   27.449332] marvell-nfc pxa3xx-nand: 
[   27.449332] NDCR:  0x9d079fff
[   27.449332] NDCB0: 0x000d3000
[   27.449332] NDCB1: 0xde000000
[   27.449332] NDCB2: 0x00000000
[   27.449332] NDCB3: 0x00000000
[   27.468253] nand: nand_do_read_oob: from = 0x06f20000, len = 64
[   27.474454] marvell-nfc pxa3xx-nand: 
[   27.474454] NDCR:  0x9d079fff
[   27.474454] NDCB0: 0x000d3000
[   27.474454] NDCB1: 0xde400000
[   27.474454] NDCB2: 0x00000000
[   27.474454] NDCB3: 0x00000000
[   27.493384] nand: nand_do_read_oob: from = 0x06f40000, len = 64
[   27.499585] marvell-nfc pxa3xx-nand: 
[   27.499585] NDCR:  0x9d079fff
[   27.499585] NDCB0: 0x000d3000
[   27.499585] NDCB1: 0xde800000
[   27.499585] NDCB2: 0x00000000
[   27.499585] NDCB3: 0x00000000
[   27.518504] nand: nand_do_read_oob: from = 0x06f60000, len = 64
[   27.524707] marvell-nfc pxa3xx-nand: 
[   27.524707] NDCR:  0x9d079fff
[   27.524707] NDCB0: 0x000d3000
[   27.524707] NDCB1: 0xdec00000
[   27.524707] NDCB2: 0x00000000
[   27.524707] NDCB3: 0x00000000
[   27.543638] nand: nand_do_read_oob: from = 0x06f80000, len = 64
[   27.549837] marvell-nfc pxa3xx-nand: 
[   27.549837] NDCR:  0x9d079fff
[   27.549837] NDCB0: 0x000d3000
[   27.549837] NDCB1: 0xdf000000
[   27.549837] NDCB2: 0x00000000
[   27.549837] NDCB3: 0x00000000
[   27.568841] nand: nand_do_read_oob: from = 0x06fa0000, len = 64
[   27.574880] marvell-nfc pxa3xx-nand: 
[   27.574880] NDCR:  0x9d079fff
[   27.574880] NDCB0: 0x000d3000
[   27.574880] NDCB1: 0xdf400000
[   27.574880] NDCB2: 0x00000000
[   27.574880] NDCB3: 0x00000000
[   27.593809] nand: nand_do_read_oob: from = 0x06fc0000, len = 64
[   27.600018] marvell-nfc pxa3xx-nand: 
[   27.600018] NDCR:  0x9d079fff
[   27.600018] NDCB0: 0x000d3000
[   27.600018] NDCB1: 0xdf800000
[   27.600018] NDCB2: 0x00000000
[   27.600018] NDCB3: 0x00000000
[   27.619130] nand: nand_do_read_oob: from = 0x06fe0000, len = 64
[   27.625167] marvell-nfc pxa3xx-nand: 
[   27.625167] NDCR:  0x9d079fff
[   27.625167] NDCB0: 0x000d3000
[   27.625167] NDCB1: 0xdfc00000
[   27.625167] NDCB2: 0x00000000
[   27.625167] NDCB3: 0x00000000
[   27.644107] nand: nand_do_read_oob: from = 0x07000000, len = 64
[   27.650314] marvell-nfc pxa3xx-nand: 
[   27.650314] NDCR:  0x9d079fff
[   27.650314] NDCB0: 0x000d3000
[   27.650314] NDCB1: 0xe0000000
[   27.650314] NDCB2: 0x00000000
[   27.650314] NDCB3: 0x00000000
[   27.669240] nand: nand_do_read_oob: from = 0x07020000, len = 64
[   27.675272] marvell-nfc pxa3xx-nand: 
[   27.675272] NDCR:  0x9d079fff
[   27.675272] NDCB0: 0x000d3000
[   27.675272] NDCB1: 0xe0400000
[   27.675272] NDCB2: 0x00000000
[   27.675272] NDCB3: 0x00000000
[   27.694205] nand: nand_do_read_oob: from = 0x07040000, len = 64
[   27.700411] marvell-nfc pxa3xx-nand: 
[   27.700411] NDCR:  0x9d079fff
[   27.700411] NDCB0: 0x000d3000
[   27.700411] NDCB1: 0xe0800000
[   27.700411] NDCB2: 0x00000000
[   27.700411] NDCB3: 0x00000000
[   27.719337] nand: nand_do_read_oob: from = 0x07060000, len = 64
[   27.725370] marvell-nfc pxa3xx-nand: 
[   27.725370] NDCR:  0x9d079fff
[   27.725370] NDCB0: 0x000d3000
[   27.725370] NDCB1: 0xe0c00000
[   27.725370] NDCB2: 0x00000000
[   27.725370] NDCB3: 0x00000000
[   27.744301] nand: nand_do_read_oob: from = 0x07080000, len = 64
[   27.750500] marvell-nfc pxa3xx-nand: 
[   27.750500] NDCR:  0x9d079fff
[   27.750500] NDCB0: 0x000d3000
[   27.750500] NDCB1: 0xe1000000
[   27.750500] NDCB2: 0x00000000
[   27.750500] NDCB3: 0x00000000
[   27.769428] nand: nand_do_read_oob: from = 0x070a0000, len = 64
[   27.775460] marvell-nfc pxa3xx-nand: 
[   27.775460] NDCR:  0x9d079fff
[   27.775460] NDCB0: 0x000d3000
[   27.775460] NDCB1: 0xe1400000
[   27.775460] NDCB2: 0x00000000
[   27.775460] NDCB3: 0x00000000
[   27.794390] nand: nand_do_read_oob: from = 0x070c0000, len = 64
[   27.800612] marvell-nfc pxa3xx-nand: 
[   27.800612] NDCR:  0x9d079fff
[   27.800612] NDCB0: 0x000d3000
[   27.800612] NDCB1: 0xe1800000
[   27.800612] NDCB2: 0x00000000
[   27.800612] NDCB3: 0x00000000
[   27.819547] nand: nand_do_read_oob: from = 0x070e0000, len = 64
[   27.825576] marvell-nfc pxa3xx-nand: 
[   27.825576] NDCR:  0x9d079fff
[   27.825576] NDCB0: 0x000d3000
[   27.825576] NDCB1: 0xe1c00000
[   27.825576] NDCB2: 0x00000000
[   27.825576] NDCB3: 0x00000000
[   27.844508] nand: nand_do_read_oob: from = 0x07100000, len = 64
[   27.850714] marvell-nfc pxa3xx-nand: 
[   27.850714] NDCR:  0x9d079fff
[   27.850714] NDCB0: 0x000d3000
[   27.850714] NDCB1: 0xe2000000
[   27.850714] NDCB2: 0x00000000
[   27.850714] NDCB3: 0x00000000
[   27.869641] nand: nand_do_read_oob: from = 0x07120000, len = 64
[   27.875675] marvell-nfc pxa3xx-nand: 
[   27.875675] NDCR:  0x9d079fff
[   27.875675] NDCB0: 0x000d3000
[   27.875675] NDCB1: 0xe2400000
[   27.875675] NDCB2: 0x00000000
[   27.875675] NDCB3: 0x00000000
[   27.894604] nand: nand_do_read_oob: from = 0x07140000, len = 64
[   27.900803] marvell-nfc pxa3xx-nand: 
[   27.900803] NDCR:  0x9d079fff
[   27.900803] NDCB0: 0x000d3000
[   27.900803] NDCB1: 0xe2800000
[   27.900803] NDCB2: 0x00000000
[   27.900803] NDCB3: 0x00000000
[   27.919734] nand: nand_do_read_oob: from = 0x07160000, len = 64
[   27.925764] marvell-nfc pxa3xx-nand: 
[   27.925764] NDCR:  0x9d079fff
[   27.925764] NDCB0: 0x000d3000
[   27.925764] NDCB1: 0xe2c00000
[   27.925764] NDCB2: 0x00000000
[   27.925764] NDCB3: 0x00000000
[   27.944696] nand: nand_do_read_oob: from = 0x07180000, len = 64
[   27.950902] marvell-nfc pxa3xx-nand: 
[   27.950902] NDCR:  0x9d079fff
[   27.950902] NDCB0: 0x000d3000
[   27.950902] NDCB1: 0xe3000000
[   27.950902] NDCB2: 0x00000000
[   27.950902] NDCB3: 0x00000000
[   27.969831] nand: nand_do_read_oob: from = 0x071a0000, len = 64
[   27.975860] marvell-nfc pxa3xx-nand: 
[   27.975860] NDCR:  0x9d079fff
[   27.975860] NDCB0: 0x000d3000
[   27.975860] NDCB1: 0xe3400000
[   27.975860] NDCB2: 0x00000000
[   27.975860] NDCB3: 0x00000000
[   27.994796] nand: nand_do_read_oob: from = 0x071c0000, len = 64
[   28.000998] marvell-nfc pxa3xx-nand: 
[   28.000998] NDCR:  0x9d079fff
[   28.000998] NDCB0: 0x000d3000
[   28.000998] NDCB1: 0xe3800000
[   28.000998] NDCB2: 0x00000000
[   28.000998] NDCB3: 0x00000000
[   28.019940] nand: nand_do_read_oob: from = 0x071e0000, len = 64
[   28.025971] marvell-nfc pxa3xx-nand: 
[   28.025971] NDCR:  0x9d079fff
[   28.025971] NDCB0: 0x000d3000
[   28.025971] NDCB1: 0xe3c00000
[   28.025971] NDCB2: 0x00000000
[   28.025971] NDCB3: 0x00000000
[   28.044903] nand: nand_do_read_oob: from = 0x07200000, len = 64
[   28.051109] marvell-nfc pxa3xx-nand: 
[   28.051109] NDCR:  0x9d079fff
[   28.051109] NDCB0: 0x000d3000
[   28.051109] NDCB1: 0xe4000000
[   28.051109] NDCB2: 0x00000000
[   28.051109] NDCB3: 0x00000000
[   28.070037] nand: nand_do_read_oob: from = 0x07220000, len = 64
[   28.076068] marvell-nfc pxa3xx-nand: 
[   28.076068] NDCR:  0x9d079fff
[   28.076068] NDCB0: 0x000d3000
[   28.076068] NDCB1: 0xe4400000
[   28.076068] NDCB2: 0x00000000
[   28.076068] NDCB3: 0x00000000
[   28.095434] nand: nand_do_read_oob: from = 0x07240000, len = 64
[   28.101671] marvell-nfc pxa3xx-nand: 
[   28.101671] NDCR:  0x9d079fff
[   28.101671] NDCB0: 0x000d3000
[   28.101671] NDCB1: 0xe4800000
[   28.101671] NDCB2: 0x00000000
[   28.101671] NDCB3: 0x00000000
[   28.120611] nand: nand_do_read_oob: from = 0x07260000, len = 64
[   28.126640] marvell-nfc pxa3xx-nand: 
[   28.126640] NDCR:  0x9d079fff
[   28.126640] NDCB0: 0x000d3000
[   28.126640] NDCB1: 0xe4c00000
[   28.126640] NDCB2: 0x00000000
[   28.126640] NDCB3: 0x00000000
[   28.145571] nand: nand_do_read_oob: from = 0x07280000, len = 64
[   28.151769] marvell-nfc pxa3xx-nand: 
[   28.151769] NDCR:  0x9d079fff
[   28.151769] NDCB0: 0x000d3000
[   28.151769] NDCB1: 0xe5000000
[   28.151769] NDCB2: 0x00000000
[   28.151769] NDCB3: 0x00000000
[   28.170698] nand: nand_do_read_oob: from = 0x072a0000, len = 64
[   28.176731] marvell-nfc pxa3xx-nand: 
[   28.176731] NDCR:  0x9d079fff
[   28.176731] NDCB0: 0x000d3000
[   28.176731] NDCB1: 0xe5400000
[   28.176731] NDCB2: 0x00000000
[   28.176731] NDCB3: 0x00000000
[   28.195663] nand: nand_do_read_oob: from = 0x072c0000, len = 64
[   28.201868] marvell-nfc pxa3xx-nand: 
[   28.201868] NDCR:  0x9d079fff
[   28.201868] NDCB0: 0x000d3000
[   28.201868] NDCB1: 0xe5800000
[   28.201868] NDCB2: 0x00000000
[   28.201868] NDCB3: 0x00000000
[   28.220798] nand: nand_do_read_oob: from = 0x072e0000, len = 64
[   28.226829] marvell-nfc pxa3xx-nand: 
[   28.226829] NDCR:  0x9d079fff
[   28.226829] NDCB0: 0x000d3000
[   28.226829] NDCB1: 0xe5c00000
[   28.226829] NDCB2: 0x00000000
[   28.226829] NDCB3: 0x00000000
[   28.245763] nand: nand_do_read_oob: from = 0x07300000, len = 64
[   28.251966] marvell-nfc pxa3xx-nand: 
[   28.251966] NDCR:  0x9d079fff
[   28.251966] NDCB0: 0x000d3000
[   28.251966] NDCB1: 0xe6000000
[   28.251966] NDCB2: 0x00000000
[   28.251966] NDCB3: 0x00000000
[   28.270902] nand: nand_do_read_oob: from = 0x07320000, len = 64
[   28.276935] marvell-nfc pxa3xx-nand: 
[   28.276935] NDCR:  0x9d079fff
[   28.276935] NDCB0: 0x000d3000
[   28.276935] NDCB1: 0xe6400000
[   28.276935] NDCB2: 0x00000000
[   28.276935] NDCB3: 0x00000000
[   28.295873] nand: nand_do_read_oob: from = 0x07340000, len = 64
[   28.302075] marvell-nfc pxa3xx-nand: 
[   28.302075] NDCR:  0x9d079fff
[   28.302075] NDCB0: 0x000d3000
[   28.302075] NDCB1: 0xe6800000
[   28.302075] NDCB2: 0x00000000
[   28.302075] NDCB3: 0x00000000
[   28.321004] nand: nand_do_read_oob: from = 0x07360000, len = 64
[   28.327035] marvell-nfc pxa3xx-nand: 
[   28.327035] NDCR:  0x9d079fff
[   28.327035] NDCB0: 0x000d3000
[   28.327035] NDCB1: 0xe6c00000
[   28.327035] NDCB2: 0x00000000
[   28.327035] NDCB3: 0x00000000
[   28.345967] nand: nand_do_read_oob: from = 0x07380000, len = 64
[   28.352174] marvell-nfc pxa3xx-nand: 
[   28.352174] NDCR:  0x9d079fff
[   28.352174] NDCB0: 0x000d3000
[   28.352174] NDCB1: 0xe7000000
[   28.352174] NDCB2: 0x00000000
[   28.352174] NDCB3: 0x00000000
[   28.371103] nand: nand_do_read_oob: from = 0x073a0000, len = 64
[   28.377134] marvell-nfc pxa3xx-nand: 
[   28.377134] NDCR:  0x9d079fff
[   28.377134] NDCB0: 0x000d3000
[   28.377134] NDCB1: 0xe7400000
[   28.377134] NDCB2: 0x00000000
[   28.377134] NDCB3: 0x00000000
[   28.396067] nand: nand_do_read_oob: from = 0x073c0000, len = 64
[   28.402271] marvell-nfc pxa3xx-nand: 
[   28.402271] NDCR:  0x9d079fff
[   28.402271] NDCB0: 0x000d3000
[   28.402271] NDCB1: 0xe7800000
[   28.402271] NDCB2: 0x00000000
[   28.402271] NDCB3: 0x00000000
[   28.421201] nand: nand_do_read_oob: from = 0x073e0000, len = 64
[   28.427231] marvell-nfc pxa3xx-nand: 
[   28.427231] NDCR:  0x9d079fff
[   28.427231] NDCB0: 0x000d3000
[   28.427231] NDCB1: 0xe7c00000
[   28.427231] NDCB2: 0x00000000
[   28.427231] NDCB3: 0x00000000
[   28.446189] nand: nand_do_read_oob: from = 0x07400000, len = 64
[   28.452395] marvell-nfc pxa3xx-nand: 
[   28.452395] NDCR:  0x9d079fff
[   28.452395] NDCB0: 0x000d3000
[   28.452395] NDCB1: 0xe8000000
[   28.452395] NDCB2: 0x00000000
[   28.452395] NDCB3: 0x00000000
[   28.471327] nand: nand_do_read_oob: from = 0x07420000, len = 64
[   28.477365] marvell-nfc pxa3xx-nand: 
[   28.477365] NDCR:  0x9d079fff
[   28.477365] NDCB0: 0x000d3000
[   28.477365] NDCB1: 0xe8400000
[   28.477365] NDCB2: 0x00000000
[   28.477365] NDCB3: 0x00000000
[   28.496300] nand: nand_do_read_oob: from = 0x07440000, len = 64
[   28.502502] marvell-nfc pxa3xx-nand: 
[   28.502502] NDCR:  0x9d079fff
[   28.502502] NDCB0: 0x000d3000
[   28.502502] NDCB1: 0xe8800000
[   28.502502] NDCB2: 0x00000000
[   28.502502] NDCB3: 0x00000000
[   28.521431] nand: nand_do_read_oob: from = 0x07460000, len = 64
[   28.527463] marvell-nfc pxa3xx-nand: 
[   28.527463] NDCR:  0x9d079fff
[   28.527463] NDCB0: 0x000d3000
[   28.527463] NDCB1: 0xe8c00000
[   28.527463] NDCB2: 0x00000000
[   28.527463] NDCB3: 0x00000000
[   28.546395] nand: nand_do_read_oob: from = 0x07480000, len = 64
[   28.552599] marvell-nfc pxa3xx-nand: 
[   28.552599] NDCR:  0x9d079fff
[   28.552599] NDCB0: 0x000d3000
[   28.552599] NDCB1: 0xe9000000
[   28.552599] NDCB2: 0x00000000
[   28.552599] NDCB3: 0x00000000
[   28.571530] nand: nand_do_read_oob: from = 0x074a0000, len = 64
[   28.577562] marvell-nfc pxa3xx-nand: 
[   28.577562] NDCR:  0x9d079fff
[   28.577562] NDCB0: 0x000d3000
[   28.577562] NDCB1: 0xe9400000
[   28.577562] NDCB2: 0x00000000
[   28.577562] NDCB3: 0x00000000
[   28.596495] nand: nand_do_read_oob: from = 0x074c0000, len = 64
[   28.602698] marvell-nfc pxa3xx-nand: 
[   28.602698] NDCR:  0x9d079fff
[   28.602698] NDCB0: 0x000d3000
[   28.602698] NDCB1: 0xe9800000
[   28.602698] NDCB2: 0x00000000
[   28.602698] NDCB3: 0x00000000
[   28.621629] nand: nand_do_read_oob: from = 0x074e0000, len = 64
[   28.627660] marvell-nfc pxa3xx-nand: 
[   28.627660] NDCR:  0x9d079fff
[   28.627660] NDCB0: 0x000d3000
[   28.627660] NDCB1: 0xe9c00000
[   28.627660] NDCB2: 0x00000000
[   28.627660] NDCB3: 0x00000000
[   28.646593] nand: nand_do_read_oob: from = 0x07500000, len = 64
[   28.652797] marvell-nfc pxa3xx-nand: 
[   28.652797] NDCR:  0x9d079fff
[   28.652797] NDCB0: 0x000d3000
[   28.652797] NDCB1: 0xea000000
[   28.652797] NDCB2: 0x00000000
[   28.652797] NDCB3: 0x00000000
[   28.671727] nand: nand_do_read_oob: from = 0x07520000, len = 64
[   28.677758] marvell-nfc pxa3xx-nand: 
[   28.677758] NDCR:  0x9d079fff
[   28.677758] NDCB0: 0x000d3000
[   28.677758] NDCB1: 0xea400000
[   28.677758] NDCB2: 0x00000000
[   28.677758] NDCB3: 0x00000000
[   28.696690] nand: nand_do_read_oob: from = 0x07540000, len = 64
[   28.702896] marvell-nfc pxa3xx-nand: 
[   28.702896] NDCR:  0x9d079fff
[   28.702896] NDCB0: 0x000d3000
[   28.702896] NDCB1: 0xea800000
[   28.702896] NDCB2: 0x00000000
[   28.702896] NDCB3: 0x00000000
[   28.721826] nand: nand_do_read_oob: from = 0x07560000, len = 64
[   28.727857] marvell-nfc pxa3xx-nand: 
[   28.727857] NDCR:  0x9d079fff
[   28.727857] NDCB0: 0x000d3000
[   28.727857] NDCB1: 0xeac00000
[   28.727857] NDCB2: 0x00000000
[   28.727857] NDCB3: 0x00000000
[   28.746788] nand: nand_do_read_oob: from = 0x07580000, len = 64
[   28.752993] marvell-nfc pxa3xx-nand: 
[   28.752993] NDCR:  0x9d079fff
[   28.752993] NDCB0: 0x000d3000
[   28.752993] NDCB1: 0xeb000000
[   28.752993] NDCB2: 0x00000000
[   28.752993] NDCB3: 0x00000000
[   28.771924] nand: nand_do_read_oob: from = 0x075a0000, len = 64
[   28.777955] marvell-nfc pxa3xx-nand: 
[   28.777955] NDCR:  0x9d079fff
[   28.777955] NDCB0: 0x000d3000
[   28.777955] NDCB1: 0xeb400000
[   28.777955] NDCB2: 0x00000000
[   28.777955] NDCB3: 0x00000000
[   28.796887] nand: nand_do_read_oob: from = 0x075c0000, len = 64
[   28.803092] marvell-nfc pxa3xx-nand: 
[   28.803092] NDCR:  0x9d079fff
[   28.803092] NDCB0: 0x000d3000
[   28.803092] NDCB1: 0xeb800000
[   28.803092] NDCB2: 0x00000000
[   28.803092] NDCB3: 0x00000000
[   28.822020] nand: nand_do_read_oob: from = 0x075e0000, len = 64
[   28.828053] marvell-nfc pxa3xx-nand: 
[   28.828053] NDCR:  0x9d079fff
[   28.828053] NDCB0: 0x000d3000
[   28.828053] NDCB1: 0xebc00000
[   28.828053] NDCB2: 0x00000000
[   28.828053] NDCB3: 0x00000000
[   28.846987] nand: nand_do_read_oob: from = 0x07600000, len = 64
[   28.853193] marvell-nfc pxa3xx-nand: 
[   28.853193] NDCR:  0x9d079fff
[   28.853193] NDCB0: 0x000d3000
[   28.853193] NDCB1: 0xec000000
[   28.853193] NDCB2: 0x00000000
[   28.853193] NDCB3: 0x00000000
[   28.872122] nand: nand_do_read_oob: from = 0x07620000, len = 64
[   28.878151] marvell-nfc pxa3xx-nand: 
[   28.878151] NDCR:  0x9d079fff
[   28.878151] NDCB0: 0x000d3000
[   28.878151] NDCB1: 0xec400000
[   28.878151] NDCB2: 0x00000000
[   28.878151] NDCB3: 0x00000000
[   28.897086] nand: nand_do_read_oob: from = 0x07640000, len = 64
[   28.903291] marvell-nfc pxa3xx-nand: 
[   28.903291] NDCR:  0x9d079fff
[   28.903291] NDCB0: 0x000d3000
[   28.903291] NDCB1: 0xec800000
[   28.903291] NDCB2: 0x00000000
[   28.903291] NDCB3: 0x00000000
[   28.922220] nand: nand_do_read_oob: from = 0x07660000, len = 64
[   28.928250] marvell-nfc pxa3xx-nand: 
[   28.928250] NDCR:  0x9d079fff
[   28.928250] NDCB0: 0x000d3000
[   28.928250] NDCB1: 0xecc00000
[   28.928250] NDCB2: 0x00000000
[   28.928250] NDCB3: 0x00000000
[   28.947184] nand: nand_do_read_oob: from = 0x07680000, len = 64
[   28.953390] marvell-nfc pxa3xx-nand: 
[   28.953390] NDCR:  0x9d079fff
[   28.953390] NDCB0: 0x000d3000
[   28.953390] NDCB1: 0xed000000
[   28.953390] NDCB2: 0x00000000
[   28.953390] NDCB3: 0x00000000
[   28.972318] nand: nand_do_read_oob: from = 0x076a0000, len = 64
[   28.978348] marvell-nfc pxa3xx-nand: 
[   28.978348] NDCR:  0x9d079fff
[   28.978348] NDCB0: 0x000d3000
[   28.978348] NDCB1: 0xed400000
[   28.978348] NDCB2: 0x00000000
[   28.978348] NDCB3: 0x00000000
[   28.997279] nand: nand_do_read_oob: from = 0x076c0000, len = 64
[   29.003476] marvell-nfc pxa3xx-nand: 
[   29.003476] NDCR:  0x9d079fff
[   29.003476] NDCB0: 0x000d3000
[   29.003476] NDCB1: 0xed800000
[   29.003476] NDCB2: 0x00000000
[   29.003476] NDCB3: 0x00000000
[   29.022420] nand: nand_do_read_oob: from = 0x076e0000, len = 64
[   29.028448] marvell-nfc pxa3xx-nand: 
[   29.028448] NDCR:  0x9d079fff
[   29.028448] NDCB0: 0x000d3000
[   29.028448] NDCB1: 0xedc00000
[   29.028448] NDCB2: 0x00000000
[   29.028448] NDCB3: 0x00000000
[   29.047381] nand: nand_do_read_oob: from = 0x07700000, len = 64
[   29.053585] marvell-nfc pxa3xx-nand: 
[   29.053585] NDCR:  0x9d079fff
[   29.053585] NDCB0: 0x000d3000
[   29.053585] NDCB1: 0xee000000
[   29.053585] NDCB2: 0x00000000
[   29.053585] NDCB3: 0x00000000
[   29.072517] nand: nand_do_read_oob: from = 0x07720000, len = 64
[   29.078545] marvell-nfc pxa3xx-nand: 
[   29.078545] NDCR:  0x9d079fff
[   29.078545] NDCB0: 0x000d3000
[   29.078545] NDCB1: 0xee400000
[   29.078545] NDCB2: 0x00000000
[   29.078545] NDCB3: 0x00000000
[   29.097499] nand: nand_do_read_oob: from = 0x07740000, len = 64
[   29.103703] marvell-nfc pxa3xx-nand: 
[   29.103703] NDCR:  0x9d079fff
[   29.103703] NDCB0: 0x000d3000
[   29.103703] NDCB1: 0xee800000
[   29.103703] NDCB2: 0x00000000
[   29.103703] NDCB3: 0x00000000
[   29.122630] nand: nand_do_read_oob: from = 0x07760000, len = 64
[   29.128834] marvell-nfc pxa3xx-nand: 
[   29.128834] NDCR:  0x9d079fff
[   29.128834] NDCB0: 0x000d3000
[   29.128834] NDCB1: 0xeec00000
[   29.128834] NDCB2: 0x00000000
[   29.128834] NDCB3: 0x00000000
[   29.147744] nand: nand_do_read_oob: from = 0x07780000, len = 64
[   29.153944] marvell-nfc pxa3xx-nand: 
[   29.153944] NDCR:  0x9d079fff
[   29.153944] NDCB0: 0x000d3000
[   29.153944] NDCB1: 0xef000000
[   29.153944] NDCB2: 0x00000000
[   29.153944] NDCB3: 0x00000000
[   29.172876] nand: nand_do_read_oob: from = 0x077a0000, len = 64
[   29.179077] marvell-nfc pxa3xx-nand: 
[   29.179077] NDCR:  0x9d079fff
[   29.179077] NDCB0: 0x000d3000
[   29.179077] NDCB1: 0xef400000
[   29.179077] NDCB2: 0x00000000
[   29.179077] NDCB3: 0x00000000
[   29.197999] nand: nand_do_read_oob: from = 0x077c0000, len = 64
[   29.204198] marvell-nfc pxa3xx-nand: 
[   29.204198] NDCR:  0x9d079fff
[   29.204198] NDCB0: 0x000d3000
[   29.204198] NDCB1: 0xef800000
[   29.204198] NDCB2: 0x00000000
[   29.204198] NDCB3: 0x00000000
[   29.223128] nand: nand_do_read_oob: from = 0x077e0000, len = 64
[   29.229328] marvell-nfc pxa3xx-nand: 
[   29.229328] NDCR:  0x9d079fff
[   29.229328] NDCB0: 0x000d3000
[   29.229328] NDCB1: 0xefc00000
[   29.229328] NDCB2: 0x00000000
[   29.229328] NDCB3: 0x00000000
[   29.248252] nand: nand_do_read_oob: from = 0x07800000, len = 64
[   29.254452] marvell-nfc pxa3xx-nand: 
[   29.254452] NDCR:  0x9d079fff
[   29.254452] NDCB0: 0x000d3000
[   29.254452] NDCB1: 0xf0000000
[   29.254452] NDCB2: 0x00000000
[   29.254452] NDCB3: 0x00000000
[   29.273384] nand: nand_do_read_oob: from = 0x07820000, len = 64
[   29.279582] marvell-nfc pxa3xx-nand: 
[   29.279582] NDCR:  0x9d079fff
[   29.279582] NDCB0: 0x000d3000
[   29.279582] NDCB1: 0xf0400000
[   29.279582] NDCB2: 0x00000000
[   29.279582] NDCB3: 0x00000000
[   29.298824] nand: nand_do_read_oob: from = 0x07840000, len = 64
[   29.304868] marvell-nfc pxa3xx-nand: 
[   29.304868] NDCR:  0x9d079fff
[   29.304868] NDCB0: 0x000d3000
[   29.304868] NDCB1: 0xf0800000
[   29.304868] NDCB2: 0x00000000
[   29.304868] NDCB3: 0x00000000
[   29.323796] nand: nand_do_read_oob: from = 0x07860000, len = 64
[   29.330003] marvell-nfc pxa3xx-nand: 
[   29.330003] NDCR:  0x9d079fff
[   29.330003] NDCB0: 0x000d3000
[   29.330003] NDCB1: 0xf0c00000
[   29.330003] NDCB2: 0x00000000
[   29.330003] NDCB3: 0x00000000
[   29.348991] nand: nand_do_read_oob: from = 0x07880000, len = 64
[   29.355023] marvell-nfc pxa3xx-nand: 
[   29.355023] NDCR:  0x9d079fff
[   29.355023] NDCB0: 0x000d3000
[   29.355023] NDCB1: 0xf1000000
[   29.355023] NDCB2: 0x00000000
[   29.355023] NDCB3: 0x00000000
[   29.373955] nand: nand_do_read_oob: from = 0x078a0000, len = 64
[   29.380161] marvell-nfc pxa3xx-nand: 
[   29.380161] NDCR:  0x9d079fff
[   29.380161] NDCB0: 0x000d3000
[   29.380161] NDCB1: 0xf1400000
[   29.380161] NDCB2: 0x00000000
[   29.380161] NDCB3: 0x00000000
[   29.399089] nand: nand_do_read_oob: from = 0x078c0000, len = 64
[   29.405120] marvell-nfc pxa3xx-nand: 
[   29.405120] NDCR:  0x9d079fff
[   29.405120] NDCB0: 0x000d3000
[   29.405120] NDCB1: 0xf1800000
[   29.405120] NDCB2: 0x00000000
[   29.405120] NDCB3: 0x00000000
[   29.424052] nand: nand_do_read_oob: from = 0x078e0000, len = 64
[   29.430260] marvell-nfc pxa3xx-nand: 
[   29.430260] NDCR:  0x9d079fff
[   29.430260] NDCB0: 0x000d3000
[   29.430260] NDCB1: 0xf1c00000
[   29.430260] NDCB2: 0x00000000
[   29.430260] NDCB3: 0x00000000
[   29.449188] nand: nand_do_read_oob: from = 0x07900000, len = 64
[   29.455218] marvell-nfc pxa3xx-nand: 
[   29.455218] NDCR:  0x9d079fff
[   29.455218] NDCB0: 0x000d3000
[   29.455218] NDCB1: 0xf2000000
[   29.455218] NDCB2: 0x00000000
[   29.455218] NDCB3: 0x00000000
[   29.474151] nand: nand_do_read_oob: from = 0x07920000, len = 64
[   29.480357] marvell-nfc pxa3xx-nand: 
[   29.480357] NDCR:  0x9d079fff
[   29.480357] NDCB0: 0x000d3000
[   29.480357] NDCB1: 0xf2400000
[   29.480357] NDCB2: 0x00000000
[   29.480357] NDCB3: 0x00000000
[   29.499286] nand: nand_do_read_oob: from = 0x07940000, len = 64
[   29.505317] marvell-nfc pxa3xx-nand: 
[   29.505317] NDCR:  0x9d079fff
[   29.505317] NDCB0: 0x000d3000
[   29.505317] NDCB1: 0xf2800000
[   29.505317] NDCB2: 0x00000000
[   29.505317] NDCB3: 0x00000000
[   29.524250] nand: nand_do_read_oob: from = 0x07960000, len = 64
[   29.530454] marvell-nfc pxa3xx-nand: 
[   29.530454] NDCR:  0x9d079fff
[   29.530454] NDCB0: 0x000d3000
[   29.530454] NDCB1: 0xf2c00000
[   29.530454] NDCB2: 0x00000000
[   29.530454] NDCB3: 0x00000000
[   29.549385] nand: nand_do_read_oob: from = 0x07980000, len = 64
[   29.555416] marvell-nfc pxa3xx-nand: 
[   29.555416] NDCR:  0x9d079fff
[   29.555416] NDCB0: 0x000d3000
[   29.555416] NDCB1: 0xf3000000
[   29.555416] NDCB2: 0x00000000
[   29.555416] NDCB3: 0x00000000
[   29.574347] nand: nand_do_read_oob: from = 0x079a0000, len = 64
[   29.580546] marvell-nfc pxa3xx-nand: 
[   29.580546] NDCR:  0x9d079fff
[   29.580546] NDCB0: 0x000d3000
[   29.580546] NDCB1: 0xf3400000
[   29.580546] NDCB2: 0x00000000
[   29.580546] NDCB3: 0x00000000
[   29.599474] nand: nand_do_read_oob: from = 0x079c0000, len = 64
[   29.605507] marvell-nfc pxa3xx-nand: 
[   29.605507] NDCR:  0x9d079fff
[   29.605507] NDCB0: 0x000d3000
[   29.605507] NDCB1: 0xf3800000
[   29.605507] NDCB2: 0x00000000
[   29.605507] NDCB3: 0x00000000
[   29.624438] nand: nand_do_read_oob: from = 0x079e0000, len = 64
[   29.630643] marvell-nfc pxa3xx-nand: 
[   29.630643] NDCR:  0x9d079fff
[   29.630643] NDCB0: 0x000d3000
[   29.630643] NDCB1: 0xf3c00000
[   29.630643] NDCB2: 0x00000000
[   29.630643] NDCB3: 0x00000000
[   29.649573] nand: nand_do_read_oob: from = 0x07a00000, len = 64
[   29.655605] marvell-nfc pxa3xx-nand: 
[   29.655605] NDCR:  0x9d079fff
[   29.655605] NDCB0: 0x000d3000
[   29.655605] NDCB1: 0xf4000000
[   29.655605] NDCB2: 0x00000000
[   29.655605] NDCB3: 0x00000000
[   29.674557] nand: nand_do_read_oob: from = 0x07a20000, len = 64
[   29.680759] marvell-nfc pxa3xx-nand: 
[   29.680759] NDCR:  0x9d079fff
[   29.680759] NDCB0: 0x000d3000
[   29.680759] NDCB1: 0xf4400000
[   29.680759] NDCB2: 0x00000000
[   29.680759] NDCB3: 0x00000000
[   29.699688] nand: nand_do_read_oob: from = 0x07a40000, len = 64
[   29.705720] marvell-nfc pxa3xx-nand: 
[   29.705720] NDCR:  0x9d079fff
[   29.705720] NDCB0: 0x000d3000
[   29.705720] NDCB1: 0xf4800000
[   29.705720] NDCB2: 0x00000000
[   29.705720] NDCB3: 0x00000000
[   29.724651] nand: nand_do_read_oob: from = 0x07a60000, len = 64
[   29.730851] marvell-nfc pxa3xx-nand: 
[   29.730851] NDCR:  0x9d079fff
[   29.730851] NDCB0: 0x000d3000
[   29.730851] NDCB1: 0xf4c00000
[   29.730851] NDCB2: 0x00000000
[   29.730851] NDCB3: 0x00000000
[   29.749779] nand: nand_do_read_oob: from = 0x07a80000, len = 64
[   29.755808] marvell-nfc pxa3xx-nand: 
[   29.755808] NDCR:  0x9d079fff
[   29.755808] NDCB0: 0x000d3000
[   29.755808] NDCB1: 0xf5000000
[   29.755808] NDCB2: 0x00000000
[   29.755808] NDCB3: 0x00000000
[   29.774743] nand: nand_do_read_oob: from = 0x07aa0000, len = 64
[   29.780949] marvell-nfc pxa3xx-nand: 
[   29.780949] NDCR:  0x9d079fff
[   29.780949] NDCB0: 0x000d3000
[   29.780949] NDCB1: 0xf5400000
[   29.780949] NDCB2: 0x00000000
[   29.780949] NDCB3: 0x00000000
[   29.799876] nand: nand_do_read_oob: from = 0x07ac0000, len = 64
[   29.805909] marvell-nfc pxa3xx-nand: 
[   29.805909] NDCR:  0x9d079fff
[   29.805909] NDCB0: 0x000d3000
[   29.805909] NDCB1: 0xf5800000
[   29.805909] NDCB2: 0x00000000
[   29.805909] NDCB3: 0x00000000
[   29.824842] nand: nand_do_read_oob: from = 0x07ae0000, len = 64
[   29.831048] marvell-nfc pxa3xx-nand: 
[   29.831048] NDCR:  0x9d079fff
[   29.831048] NDCB0: 0x000d3000
[   29.831048] NDCB1: 0xf5c00000
[   29.831048] NDCB2: 0x00000000
[   29.831048] NDCB3: 0x00000000
[   29.849975] nand: nand_do_read_oob: from = 0x07b00000, len = 64
[   29.856007] marvell-nfc pxa3xx-nand: 
[   29.856007] NDCR:  0x9d079fff
[   29.856007] NDCB0: 0x000d3000
[   29.856007] NDCB1: 0xf6000000
[   29.856007] NDCB2: 0x00000000
[   29.856007] NDCB3: 0x00000000
[   29.874944] nand: nand_do_read_oob: from = 0x07b20000, len = 64
[   29.881147] marvell-nfc pxa3xx-nand: 
[   29.881147] NDCR:  0x9d079fff
[   29.881147] NDCB0: 0x000d3000
[   29.881147] NDCB1: 0xf6400000
[   29.881147] NDCB2: 0x00000000
[   29.881147] NDCB3: 0x00000000
[   29.900075] nand: nand_do_read_oob: from = 0x07b40000, len = 64
[   29.906105] marvell-nfc pxa3xx-nand: 
[   29.906105] NDCR:  0x9d079fff
[   29.906105] NDCB0: 0x000d3000
[   29.906105] NDCB1: 0xf6800000
[   29.906105] NDCB2: 0x00000000
[   29.906105] NDCB3: 0x00000000
[   29.925038] nand: nand_do_read_oob: from = 0x07b60000, len = 64
[   29.931245] marvell-nfc pxa3xx-nand: 
[   29.931245] NDCR:  0x9d079fff
[   29.931245] NDCB0: 0x000d3000
[   29.931245] NDCB1: 0xf6c00000
[   29.931245] NDCB2: 0x00000000
[   29.931245] NDCB3: 0x00000000
[   29.950173] nand: nand_do_read_oob: from = 0x07b80000, len = 64
[   29.956205] marvell-nfc pxa3xx-nand: 
[   29.956205] NDCR:  0x9d079fff
[   29.956205] NDCB0: 0x000d3000
[   29.956205] NDCB1: 0xf7000000
[   29.956205] NDCB2: 0x00000000
[   29.956205] NDCB3: 0x00000000
[   29.975136] nand: nand_do_read_oob: from = 0x07ba0000, len = 64
[   29.981341] marvell-nfc pxa3xx-nand: 
[   29.981341] NDCR:  0x9d079fff
[   29.981341] NDCB0: 0x000d3000
[   29.981341] NDCB1: 0xf7400000
[   29.981341] NDCB2: 0x00000000
[   29.981341] NDCB3: 0x00000000
[   30.000271] nand: nand_do_read_oob: from = 0x07bc0000, len = 64
[   30.006303] marvell-nfc pxa3xx-nand: 
[   30.006303] NDCR:  0x9d079fff
[   30.006303] NDCB0: 0x000d3000
[   30.006303] NDCB1: 0xf7800000
[   30.006303] NDCB2: 0x00000000
[   30.006303] NDCB3: 0x00000000
[   30.025242] nand: nand_do_read_oob: from = 0x07be0000, len = 64
[   30.031450] marvell-nfc pxa3xx-nand: 
[   30.031450] NDCR:  0x9d079fff
[   30.031450] NDCB0: 0x000d3000
[   30.031450] NDCB1: 0xf7c00000
[   30.031450] NDCB2: 0x00000000
[   30.031450] NDCB3: 0x00000000
[   30.050378] nand: nand_do_read_oob: from = 0x07c00000, len = 64
[   30.056409] marvell-nfc pxa3xx-nand: 
[   30.056409] NDCR:  0x9d079fff
[   30.056409] NDCB0: 0x000d3000
[   30.056409] NDCB1: 0xf8000000
[   30.056409] NDCB2: 0x00000000
[   30.056409] NDCB3: 0x00000000
[   30.075347] nand: nand_do_read_oob: from = 0x07c20000, len = 64
[   30.081549] marvell-nfc pxa3xx-nand: 
[   30.081549] NDCR:  0x9d079fff
[   30.081549] NDCB0: 0x000d3000
[   30.081549] NDCB1: 0xf8400000
[   30.081549] NDCB2: 0x00000000
[   30.081549] NDCB3: 0x00000000
[   30.100810] nand: nand_do_read_oob: from = 0x07c40000, len = 64
[   30.106850] marvell-nfc pxa3xx-nand: 
[   30.106850] NDCR:  0x9d079fff
[   30.106850] NDCB0: 0x000d3000
[   30.106850] NDCB1: 0xf8800000
[   30.106850] NDCB2: 0x00000000
[   30.106850] NDCB3: 0x00000000
[   30.125809] nand: nand_do_read_oob: from = 0x07c60000, len = 64
[   30.132009] marvell-nfc pxa3xx-nand: 
[   30.132009] NDCR:  0x9d079fff
[   30.132009] NDCB0: 0x000d3000
[   30.132009] NDCB1: 0xf8c00000
[   30.132009] NDCB2: 0x00000000
[   30.132009] NDCB3: 0x00000000
[   30.150936] nand: nand_do_read_oob: from = 0x07c80000, len = 64
[   30.156969] marvell-nfc pxa3xx-nand: 
[   30.156969] NDCR:  0x9d079fff
[   30.156969] NDCB0: 0x000d3000
[   30.156969] NDCB1: 0xf9000000
[   30.156969] NDCB2: 0x00000000
[   30.156969] NDCB3: 0x00000000
[   30.175903] nand: nand_do_read_oob: from = 0x07ca0000, len = 64
[   30.182106] marvell-nfc pxa3xx-nand: 
[   30.182106] NDCR:  0x9d079fff
[   30.182106] NDCB0: 0x000d3000
[   30.182106] NDCB1: 0xf9400000
[   30.182106] NDCB2: 0x00000000
[   30.182106] NDCB3: 0x00000000
[   30.201034] nand: nand_do_read_oob: from = 0x07cc0000, len = 64
[   30.207066] marvell-nfc pxa3xx-nand: 
[   30.207066] NDCR:  0x9d079fff
[   30.207066] NDCB0: 0x000d3000
[   30.207066] NDCB1: 0xf9800000
[   30.207066] NDCB2: 0x00000000
[   30.207066] NDCB3: 0x00000000
[   30.225997] nand: nand_do_read_oob: from = 0x07ce0000, len = 64
[   30.232197] marvell-nfc pxa3xx-nand: 
[   30.232197] NDCR:  0x9d079fff
[   30.232197] NDCB0: 0x000d3000
[   30.232197] NDCB1: 0xf9c00000
[   30.232197] NDCB2: 0x00000000
[   30.232197] NDCB3: 0x00000000
[   30.251124] nand: nand_do_read_oob: from = 0x07d00000, len = 64
[   30.257156] marvell-nfc pxa3xx-nand: 
[   30.257156] NDCR:  0x9d079fff
[   30.257156] NDCB0: 0x000d3000
[   30.257156] NDCB1: 0xfa000000
[   30.257156] NDCB2: 0x00000000
[   30.257156] NDCB3: 0x00000000
[   30.276087] nand: nand_do_read_oob: from = 0x07d20000, len = 64
[   30.282295] marvell-nfc pxa3xx-nand: 
[   30.282295] NDCR:  0x9d079fff
[   30.282295] NDCB0: 0x000d3000
[   30.282295] NDCB1: 0xfa400000
[   30.282295] NDCB2: 0x00000000
[   30.282295] NDCB3: 0x00000000
[   30.301223] nand: nand_do_read_oob: from = 0x07d40000, len = 64
[   30.307254] marvell-nfc pxa3xx-nand: 
[   30.307254] NDCR:  0x9d079fff
[   30.307254] NDCB0: 0x000d3000
[   30.307254] NDCB1: 0xfa800000
[   30.307254] NDCB2: 0x00000000
[   30.307254] NDCB3: 0x00000000
[   30.326208] nand: nand_do_read_oob: from = 0x07d60000, len = 64
[   30.332412] marvell-nfc pxa3xx-nand: 
[   30.332412] NDCR:  0x9d079fff
[   30.332412] NDCB0: 0x000d3000
[   30.332412] NDCB1: 0xfac00000
[   30.332412] NDCB2: 0x00000000
[   30.332412] NDCB3: 0x00000000
[   30.351339] nand: nand_do_read_oob: from = 0x07d80000, len = 64
[   30.357370] marvell-nfc pxa3xx-nand: 
[   30.357370] NDCR:  0x9d079fff
[   30.357370] NDCB0: 0x000d3000
[   30.357370] NDCB1: 0xfb000000
[   30.357370] NDCB2: 0x00000000
[   30.357370] NDCB3: 0x00000000
[   30.376303] nand: nand_do_read_oob: from = 0x07da0000, len = 64
[   30.382509] marvell-nfc pxa3xx-nand: 
[   30.382509] NDCR:  0x9d079fff
[   30.382509] NDCB0: 0x000d3000
[   30.382509] NDCB1: 0xfb400000
[   30.382509] NDCB2: 0x00000000
[   30.382509] NDCB3: 0x00000000
[   30.401437] nand: nand_do_read_oob: from = 0x07dc0000, len = 64
[   30.407468] marvell-nfc pxa3xx-nand: 
[   30.407468] NDCR:  0x9d079fff
[   30.407468] NDCB0: 0x000d3000
[   30.407468] NDCB1: 0xfb800000
[   30.407468] NDCB2: 0x00000000
[   30.407468] NDCB3: 0x00000000
[   30.426400] nand: nand_do_read_oob: from = 0x07de0000, len = 64
[   30.432608] marvell-nfc pxa3xx-nand: 
[   30.432608] NDCR:  0x9d079fff
[   30.432608] NDCB0: 0x000d3000
[   30.432608] NDCB1: 0xfbc00000
[   30.432608] NDCB2: 0x00000000
[   30.432608] NDCB3: 0x00000000
[   30.451537] nand: nand_do_read_oob: from = 0x07e00000, len = 64
[   30.457568] marvell-nfc pxa3xx-nand: 
[   30.457568] NDCR:  0x9d079fff
[   30.457568] NDCB0: 0x000d3000
[   30.457568] NDCB1: 0xfc000000
[   30.457568] NDCB2: 0x00000000
[   30.457568] NDCB3: 0x00000000
[   30.476498] nand: nand_do_read_oob: from = 0x07e20000, len = 64
[   30.482695] marvell-nfc pxa3xx-nand: 
[   30.482695] NDCR:  0x9d079fff
[   30.482695] NDCB0: 0x000d3000
[   30.482695] NDCB1: 0xfc400000
[   30.482695] NDCB2: 0x00000000
[   30.482695] NDCB3: 0x00000000
[   30.501625] nand: nand_do_read_oob: from = 0x07e40000, len = 64
[   30.507657] marvell-nfc pxa3xx-nand: 
[   30.507657] NDCR:  0x9d079fff
[   30.507657] NDCB0: 0x000d3000
[   30.507657] NDCB1: 0xfc800000
[   30.507657] NDCB2: 0x00000000
[   30.507657] NDCB3: 0x00000000
[   30.526589] nand: nand_do_read_oob: from = 0x07e60000, len = 64
[   30.532794] marvell-nfc pxa3xx-nand: 
[   30.532794] NDCR:  0x9d079fff
[   30.532794] NDCB0: 0x000d3000
[   30.532794] NDCB1: 0xfcc00000
[   30.532794] NDCB2: 0x00000000
[   30.532794] NDCB3: 0x00000000
[   30.551723] nand: nand_do_read_oob: from = 0x07e80000, len = 64
[   30.557755] marvell-nfc pxa3xx-nand: 
[   30.557755] NDCR:  0x9d079fff
[   30.557755] NDCB0: 0x000d3000
[   30.557755] NDCB1: 0xfd000000
[   30.557755] NDCB2: 0x00000000
[   30.557755] NDCB3: 0x00000000
[   30.576689] nand: nand_do_read_oob: from = 0x07ea0000, len = 64
[   30.582895] marvell-nfc pxa3xx-nand: 
[   30.582895] NDCR:  0x9d079fff
[   30.582895] NDCB0: 0x000d3000
[   30.582895] NDCB1: 0xfd400000
[   30.582895] NDCB2: 0x00000000
[   30.582895] NDCB3: 0x00000000
[   30.601822] nand: nand_do_read_oob: from = 0x07ec0000, len = 64
[   30.607855] marvell-nfc pxa3xx-nand: 
[   30.607855] NDCR:  0x9d079fff
[   30.607855] NDCB0: 0x000d3000
[   30.607855] NDCB1: 0xfd800000
[   30.607855] NDCB2: 0x00000000
[   30.607855] NDCB3: 0x00000000
[   30.626788] nand: nand_do_read_oob: from = 0x07ee0000, len = 64
[   30.632994] marvell-nfc pxa3xx-nand: 
[   30.632994] NDCR:  0x9d079fff
[   30.632994] NDCB0: 0x000d3000
[   30.632994] NDCB1: 0xfdc00000
[   30.632994] NDCB2: 0x00000000
[   30.632994] NDCB3: 0x00000000
[   30.651920] nand: nand_do_read_oob: from = 0x07f00000, len = 64
[   30.657953] marvell-nfc pxa3xx-nand: 
[   30.657953] NDCR:  0x9d079fff
[   30.657953] NDCB0: 0x000d3000
[   30.657953] NDCB1: 0xfe000000
[   30.657953] NDCB2: 0x00000000
[   30.657953] NDCB3: 0x00000000
[   30.676890] nand: nand_do_read_oob: from = 0x07f20000, len = 64
[   30.683091] marvell-nfc pxa3xx-nand: 
[   30.683091] NDCR:  0x9d079fff
[   30.683091] NDCB0: 0x000d3000
[   30.683091] NDCB1: 0xfe400000
[   30.683091] NDCB2: 0x00000000
[   30.683091] NDCB3: 0x00000000
[   30.702019] nand: nand_do_read_oob: from = 0x07f40000, len = 64
[   30.708052] marvell-nfc pxa3xx-nand: 
[   30.708052] NDCR:  0x9d079fff
[   30.708052] NDCB0: 0x000d3000
[   30.708052] NDCB1: 0xfe800000
[   30.708052] NDCB2: 0x00000000
[   30.708052] NDCB3: 0x00000000
[   30.726984] nand: nand_do_read_oob: from = 0x07f60000, len = 64
[   30.733194] marvell-nfc pxa3xx-nand: 
[   30.733194] NDCR:  0x9d079fff
[   30.733194] NDCB0: 0x000d3000
[   30.733194] NDCB1: 0xfec00000
[   30.733194] NDCB2: 0x00000000
[   30.733194] NDCB3: 0x00000000
[   30.752117] nand: nand_do_read_oob: from = 0x07f80000, len = 64
[   30.758150] marvell-nfc pxa3xx-nand: 
[   30.758150] NDCR:  0x9d079fff
[   30.758150] NDCB0: 0x000d3000
[   30.758150] NDCB1: 0xff000000
[   30.758150] NDCB2: 0x00000000
[   30.758150] NDCB3: 0x00000000
[   30.777082] nand: nand_do_read_oob: from = 0x07fa0000, len = 64
[   30.783289] marvell-nfc pxa3xx-nand: 
[   30.783289] NDCR:  0x9d079fff
[   30.783289] NDCB0: 0x000d3000
[   30.783289] NDCB1: 0xff400000
[   30.783289] NDCB2: 0x00000000
[   30.783289] NDCB3: 0x00000000
[   30.802215] nand: nand_do_read_oob: from = 0x07fc0000, len = 64
[   30.808248] marvell-nfc pxa3xx-nand: 
[   30.808248] NDCR:  0x9d079fff
[   30.808248] NDCB0: 0x000d3000
[   30.808248] NDCB1: 0xff800000
[   30.808248] NDCB2: 0x00000000
[   30.808248] NDCB3: 0x00000000
[   30.827180] nand: nand_do_read_oob: from = 0x07fe0000, len = 64
[   30.833387] marvell-nfc pxa3xx-nand: 
[   30.833387] NDCR:  0x9d079fff
[   30.833387] NDCB0: 0x000d3000
[   30.833387] NDCB1: 0xffc00000
[   30.833387] NDCB2: 0x00000000
[   30.833387] NDCB3: 0x00000000
[   30.852314] nand: nand_do_read_oob: from = 0x08000000, len = 64
[   30.858343] marvell-nfc pxa3xx-nand: 
[   30.858343] NDCR:  0x9d079fff
[   30.858343] NDCB0: 0x000d3000
[   30.858343] NDCB1: 0x00000000
[   30.858343] NDCB2: 0x00000001
[   30.858343] NDCB3: 0x00000000
[   30.877280] nand: nand_do_read_oob: from = 0x08020000, len = 64
[   30.883486] marvell-nfc pxa3xx-nand: 
[   30.883486] NDCR:  0x9d079fff
[   30.883486] NDCB0: 0x000d3000
[   30.883486] NDCB1: 0x00400000
[   30.883486] NDCB2: 0x00000001
[   30.883486] NDCB3: 0x00000000
[   30.902417] nand: nand_do_read_oob: from = 0x08040000, len = 64
[   30.908445] marvell-nfc pxa3xx-nand: 
[   30.908445] NDCR:  0x9d079fff
[   30.908445] NDCB0: 0x000d3000
[   30.908445] NDCB1: 0x00800000
[   30.908445] NDCB2: 0x00000001
[   30.908445] NDCB3: 0x00000000
[   30.927379] nand: nand_do_read_oob: from = 0x08060000, len = 64
[   30.933580] marvell-nfc pxa3xx-nand: 
[   30.933580] NDCR:  0x9d079fff
[   30.933580] NDCB0: 0x000d3000
[   30.933580] NDCB1: 0x00c00000
[   30.933580] NDCB2: 0x00000001
[   30.933580] NDCB3: 0x00000000
[   30.952528] nand: nand_do_read_oob: from = 0x08080000, len = 64
[   30.958561] marvell-nfc pxa3xx-nand: 
[   30.958561] NDCR:  0x9d079fff
[   30.958561] NDCB0: 0x000d3000
[   30.958561] NDCB1: 0x01000000
[   30.958561] NDCB2: 0x00000001
[   30.958561] NDCB3: 0x00000000
[   30.977494] nand: nand_do_read_oob: from = 0x080a0000, len = 64
[   30.983701] marvell-nfc pxa3xx-nand: 
[   30.983701] NDCR:  0x9d079fff
[   30.983701] NDCB0: 0x000d3000
[   30.983701] NDCB1: 0x01400000
[   30.983701] NDCB2: 0x00000001
[   30.983701] NDCB3: 0x00000000
[   31.002627] nand: nand_do_read_oob: from = 0x080c0000, len = 64
[   31.008841] marvell-nfc pxa3xx-nand: 
[   31.008841] NDCR:  0x9d079fff
[   31.008841] NDCB0: 0x000d3000
[   31.008841] NDCB1: 0x01800000
[   31.008841] NDCB2: 0x00000001
[   31.008841] NDCB3: 0x00000000
[   31.027751] nand: nand_do_read_oob: from = 0x080e0000, len = 64
[   31.033952] marvell-nfc pxa3xx-nand: 
[   31.033952] NDCR:  0x9d079fff
[   31.033952] NDCB0: 0x000d3000
[   31.033952] NDCB1: 0x01c00000
[   31.033952] NDCB2: 0x00000001
[   31.033952] NDCB3: 0x00000000
[   31.052881] nand: nand_do_read_oob: from = 0x08100000, len = 64
[   31.059081] marvell-nfc pxa3xx-nand: 
[   31.059081] NDCR:  0x9d079fff
[   31.059081] NDCB0: 0x000d3000
[   31.059081] NDCB1: 0x02000000
[   31.059081] NDCB2: 0x00000001
[   31.059081] NDCB3: 0x00000000
[   31.078003] nand: nand_do_read_oob: from = 0x08120000, len = 64
[   31.084204] marvell-nfc pxa3xx-nand: 
[   31.084204] NDCR:  0x9d079fff
[   31.084204] NDCB0: 0x000d3000
[   31.084204] NDCB1: 0x02400000
[   31.084204] NDCB2: 0x00000001
[   31.084204] NDCB3: 0x00000000
[   31.103138] nand: nand_do_read_oob: from = 0x08140000, len = 64
[   31.109336] marvell-nfc pxa3xx-nand: 
[   31.109336] NDCR:  0x9d079fff
[   31.109336] NDCB0: 0x000d3000
[   31.109336] NDCB1: 0x02800000
[   31.109336] NDCB2: 0x00000001
[   31.109336] NDCB3: 0x00000000
[   31.128257] nand: nand_do_read_oob: from = 0x08160000, len = 64
[   31.134456] marvell-nfc pxa3xx-nand: 
[   31.134456] NDCR:  0x9d079fff
[   31.134456] NDCB0: 0x000d3000
[   31.134456] NDCB1: 0x02c00000
[   31.134456] NDCB2: 0x00000001
[   31.134456] NDCB3: 0x00000000
[   31.153388] nand: nand_do_read_oob: from = 0x08180000, len = 64
[   31.159590] marvell-nfc pxa3xx-nand: 
[   31.159590] NDCR:  0x9d079fff
[   31.159590] NDCB0: 0x000d3000
[   31.159590] NDCB1: 0x03000000
[   31.159590] NDCB2: 0x00000001
[   31.159590] NDCB3: 0x00000000
[   31.178511] nand: nand_do_read_oob: from = 0x081a0000, len = 64
[   31.184711] marvell-nfc pxa3xx-nand: 
[   31.184711] NDCR:  0x9d079fff
[   31.184711] NDCB0: 0x000d3000
[   31.184711] NDCB1: 0x03400000
[   31.184711] NDCB2: 0x00000001
[   31.184711] NDCB3: 0x00000000
[   31.203642] nand: nand_do_read_oob: from = 0x081c0000, len = 64
[   31.210027] marvell-nfc pxa3xx-nand: 
[   31.210027] NDCR:  0x9d079fff
[   31.210027] NDCB0: 0x000d3000
[   31.210027] NDCB1: 0x03800000
[   31.210027] NDCB2: 0x00000001
[   31.210027] NDCB3: 0x00000000
[   31.229051] nand: nand_do_read_oob: from = 0x081e0000, len = 64
[   31.235077] marvell-nfc pxa3xx-nand: 
[   31.235077] NDCR:  0x9d079fff
[   31.235077] NDCB0: 0x000d3000
[   31.235077] NDCB1: 0x03c00000
[   31.235077] NDCB2: 0x00000001
[   31.235077] NDCB3: 0x00000000
[   31.254015] nand: nand_do_read_oob: from = 0x08200000, len = 64
[   31.260215] marvell-nfc pxa3xx-nand: 
[   31.260215] NDCR:  0x9d079fff
[   31.260215] NDCB0: 0x000d3000
[   31.260215] NDCB1: 0x04000000
[   31.260215] NDCB2: 0x00000001
[   31.260215] NDCB3: 0x00000000
[   31.279136] nand: nand_do_read_oob: from = 0x08220000, len = 64
[   31.285169] marvell-nfc pxa3xx-nand: 
[   31.285169] NDCR:  0x9d079fff
[   31.285169] NDCB0: 0x000d3000
[   31.285169] NDCB1: 0x04400000
[   31.285169] NDCB2: 0x00000001
[   31.285169] NDCB3: 0x00000000
[   31.304103] nand: nand_do_read_oob: from = 0x08240000, len = 64
[   31.310308] marvell-nfc pxa3xx-nand: 
[   31.310308] NDCR:  0x9d079fff
[   31.310308] NDCB0: 0x000d3000
[   31.310308] NDCB1: 0x04800000
[   31.310308] NDCB2: 0x00000001
[   31.310308] NDCB3: 0x00000000
[   31.329239] nand: nand_do_read_oob: from = 0x08260000, len = 64
[   31.335267] marvell-nfc pxa3xx-nand: 
[   31.335267] NDCR:  0x9d079fff
[   31.335267] NDCB0: 0x000d3000
[   31.335267] NDCB1: 0x04c00000
[   31.335267] NDCB2: 0x00000001
[   31.335267] NDCB3: 0x00000000
[   31.354200] nand: nand_do_read_oob: from = 0x08280000, len = 64
[   31.360406] marvell-nfc pxa3xx-nand: 
[   31.360406] NDCR:  0x9d079fff
[   31.360406] NDCB0: 0x000d3000
[   31.360406] NDCB1: 0x05000000
[   31.360406] NDCB2: 0x00000001
[   31.360406] NDCB3: 0x00000000
[   31.379335] nand: nand_do_read_oob: from = 0x082a0000, len = 64
[   31.385365] marvell-nfc pxa3xx-nand: 
[   31.385365] NDCR:  0x9d079fff
[   31.385365] NDCB0: 0x000d3000
[   31.385365] NDCB1: 0x05400000
[   31.385365] NDCB2: 0x00000001
[   31.385365] NDCB3: 0x00000000
[   31.404300] nand: nand_do_read_oob: from = 0x082c0000, len = 64
[   31.410506] marvell-nfc pxa3xx-nand: 
[   31.410506] NDCR:  0x9d079fff
[   31.410506] NDCB0: 0x000d3000
[   31.410506] NDCB1: 0x05800000
[   31.410506] NDCB2: 0x00000001
[   31.410506] NDCB3: 0x00000000
[   31.429434] nand: nand_do_read_oob: from = 0x082e0000, len = 64
[   31.435464] marvell-nfc pxa3xx-nand: 
[   31.435464] NDCR:  0x9d079fff
[   31.435464] NDCB0: 0x000d3000
[   31.435464] NDCB1: 0x05c00000
[   31.435464] NDCB2: 0x00000001
[   31.435464] NDCB3: 0x00000000
[   31.454406] nand: nand_do_read_oob: from = 0x08300000, len = 64
[   31.460611] marvell-nfc pxa3xx-nand: 
[   31.460611] NDCR:  0x9d079fff
[   31.460611] NDCB0: 0x000d3000
[   31.460611] NDCB1: 0x06000000
[   31.460611] NDCB2: 0x00000001
[   31.460611] NDCB3: 0x00000000
[   31.479540] nand: nand_do_read_oob: from = 0x08320000, len = 64
[   31.485571] marvell-nfc pxa3xx-nand: 
[   31.485571] NDCR:  0x9d079fff
[   31.485571] NDCB0: 0x000d3000
[   31.485571] NDCB1: 0x06400000
[   31.485571] NDCB2: 0x00000001
[   31.485571] NDCB3: 0x00000000
[   31.504506] nand: nand_do_read_oob: from = 0x08340000, len = 64
[   31.510709] marvell-nfc pxa3xx-nand: 
[   31.510709] NDCR:  0x9d079fff
[   31.510709] NDCB0: 0x000d3000
[   31.510709] NDCB1: 0x06800000
[   31.510709] NDCB2: 0x00000001
[   31.510709] NDCB3: 0x00000000
[   31.529640] nand: nand_do_read_oob: from = 0x08360000, len = 64
[   31.535669] marvell-nfc pxa3xx-nand: 
[   31.535669] NDCR:  0x9d079fff
[   31.535669] NDCB0: 0x000d3000
[   31.535669] NDCB1: 0x06c00000
[   31.535669] NDCB2: 0x00000001
[   31.535669] NDCB3: 0x00000000
[   31.554628] nand: nand_do_read_oob: from = 0x08380000, len = 64
[   31.560835] marvell-nfc pxa3xx-nand: 
[   31.560835] NDCR:  0x9d079fff
[   31.560835] NDCB0: 0x000d3000
[   31.560835] NDCB1: 0x07000000
[   31.560835] NDCB2: 0x00000001
[   31.560835] NDCB3: 0x00000000
[   31.579763] nand: nand_do_read_oob: from = 0x083a0000, len = 64
[   31.585793] marvell-nfc pxa3xx-nand: 
[   31.585793] NDCR:  0x9d079fff
[   31.585793] NDCB0: 0x000d3000
[   31.585793] NDCB1: 0x07400000
[   31.585793] NDCB2: 0x00000001
[   31.585793] NDCB3: 0x00000000
[   31.604727] nand: nand_do_read_oob: from = 0x083c0000, len = 64
[   31.610934] marvell-nfc pxa3xx-nand: 
[   31.610934] NDCR:  0x9d079fff
[   31.610934] NDCB0: 0x000d3000
[   31.610934] NDCB1: 0x07800000
[   31.610934] NDCB2: 0x00000001
[   31.610934] NDCB3: 0x00000000
[   31.629862] nand: nand_do_read_oob: from = 0x083e0000, len = 64
[   31.635893] marvell-nfc pxa3xx-nand: 
[   31.635893] NDCR:  0x9d079fff
[   31.635893] NDCB0: 0x000d3000
[   31.635893] NDCB1: 0x07c00000
[   31.635893] NDCB2: 0x00000001
[   31.635893] NDCB3: 0x00000000
[   31.654828] nand: nand_do_read_oob: from = 0x08400000, len = 64
[   31.661031] marvell-nfc pxa3xx-nand: 
[   31.661031] NDCR:  0x9d079fff
[   31.661031] NDCB0: 0x000d3000
[   31.661031] NDCB1: 0x08000000
[   31.661031] NDCB2: 0x00000001
[   31.661031] NDCB3: 0x00000000
[   31.679962] nand: nand_do_read_oob: from = 0x08420000, len = 64
[   31.685992] marvell-nfc pxa3xx-nand: 
[   31.685992] NDCR:  0x9d079fff
[   31.685992] NDCB0: 0x000d3000
[   31.685992] NDCB1: 0x08400000
[   31.685992] NDCB2: 0x00000001
[   31.685992] NDCB3: 0x00000000
[   31.704925] nand: nand_do_read_oob: from = 0x08440000, len = 64
[   31.711130] marvell-nfc pxa3xx-nand: 
[   31.711130] NDCR:  0x9d079fff
[   31.711130] NDCB0: 0x000d3000
[   31.711130] NDCB1: 0x08800000
[   31.711130] NDCB2: 0x00000001
[   31.711130] NDCB3: 0x00000000
[   31.730058] nand: nand_do_read_oob: from = 0x08460000, len = 64
[   31.736090] marvell-nfc pxa3xx-nand: 
[   31.736090] NDCR:  0x9d079fff
[   31.736090] NDCB0: 0x000d3000
[   31.736090] NDCB1: 0x08c00000
[   31.736090] NDCB2: 0x00000001
[   31.736090] NDCB3: 0x00000000
[   31.755025] nand: nand_do_read_oob: from = 0x08480000, len = 64
[   31.761229] marvell-nfc pxa3xx-nand: 
[   31.761229] NDCR:  0x9d079fff
[   31.761229] NDCB0: 0x000d3000
[   31.761229] NDCB1: 0x09000000
[   31.761229] NDCB2: 0x00000001
[   31.761229] NDCB3: 0x00000000
[   31.780159] nand: nand_do_read_oob: from = 0x084a0000, len = 64
[   31.786189] marvell-nfc pxa3xx-nand: 
[   31.786189] NDCR:  0x9d079fff
[   31.786189] NDCB0: 0x000d3000
[   31.786189] NDCB1: 0x09400000
[   31.786189] NDCB2: 0x00000001
[   31.786189] NDCB3: 0x00000000
[   31.805120] nand: nand_do_read_oob: from = 0x084c0000, len = 64
[   31.811325] marvell-nfc pxa3xx-nand: 
[   31.811325] NDCR:  0x9d079fff
[   31.811325] NDCB0: 0x000d3000
[   31.811325] NDCB1: 0x09800000
[   31.811325] NDCB2: 0x00000001
[   31.811325] NDCB3: 0x00000000
[   31.830258] nand: nand_do_read_oob: from = 0x084e0000, len = 64
[   31.836287] marvell-nfc pxa3xx-nand: 
[   31.836287] NDCR:  0x9d079fff
[   31.836287] NDCB0: 0x000d3000
[   31.836287] NDCB1: 0x09c00000
[   31.836287] NDCB2: 0x00000001
[   31.836287] NDCB3: 0x00000000
[   31.855221] nand: nand_do_read_oob: from = 0x08500000, len = 64
[   31.861425] marvell-nfc pxa3xx-nand: 
[   31.861425] NDCR:  0x9d079fff
[   31.861425] NDCB0: 0x000d3000
[   31.861425] NDCB1: 0x0a000000
[   31.861425] NDCB2: 0x00000001
[   31.861425] NDCB3: 0x00000000
[   31.880356] nand: nand_do_read_oob: from = 0x08520000, len = 64
[   31.886384] marvell-nfc pxa3xx-nand: 
[   31.886384] NDCR:  0x9d079fff
[   31.886384] NDCB0: 0x000d3000
[   31.886384] NDCB1: 0x0a400000
[   31.886384] NDCB2: 0x00000001
[   31.886384] NDCB3: 0x00000000
[   31.905319] nand: nand_do_read_oob: from = 0x08540000, len = 64
[   31.911523] marvell-nfc pxa3xx-nand: 
[   31.911523] NDCR:  0x9d079fff
[   31.911523] NDCB0: 0x000d3000
[   31.911523] NDCB1: 0x0a800000
[   31.911523] NDCB2: 0x00000001
[   31.911523] NDCB3: 0x00000000
[   31.930451] nand: nand_do_read_oob: from = 0x08560000, len = 64
[   31.936483] marvell-nfc pxa3xx-nand: 
[   31.936483] NDCR:  0x9d079fff
[   31.936483] NDCB0: 0x000d3000
[   31.936483] NDCB1: 0x0ac00000
[   31.936483] NDCB2: 0x00000001
[   31.936483] NDCB3: 0x00000000
[   31.955416] nand: nand_do_read_oob: from = 0x08580000, len = 64
[   31.961620] marvell-nfc pxa3xx-nand: 
[   31.961620] NDCR:  0x9d079fff
[   31.961620] NDCB0: 0x000d3000
[   31.961620] NDCB1: 0x0b000000
[   31.961620] NDCB2: 0x00000001
[   31.961620] NDCB3: 0x00000000
[   31.980541] nand: nand_do_read_oob: from = 0x085a0000, len = 64
[   31.986575] marvell-nfc pxa3xx-nand: 
[   31.986575] NDCR:  0x9d079fff
[   31.986575] NDCB0: 0x000d3000
[   31.986575] NDCB1: 0x0b400000
[   31.986575] NDCB2: 0x00000001
[   31.986575] NDCB3: 0x00000000
[   32.005507] nand: nand_do_read_oob: from = 0x085c0000, len = 64
[   32.011723] marvell-nfc pxa3xx-nand: 
[   32.011723] NDCR:  0x9d079fff
[   32.011723] NDCB0: 0x000d3000
[   32.011723] NDCB1: 0x0b800000
[   32.011723] NDCB2: 0x00000001
[   32.011723] NDCB3: 0x00000000
[   32.030652] nand: nand_do_read_oob: from = 0x085e0000, len = 64
[   32.036680] marvell-nfc pxa3xx-nand: 
[   32.036680] NDCR:  0x9d079fff
[   32.036680] NDCB0: 0x000d3000
[   32.036680] NDCB1: 0x0bc00000
[   32.036680] NDCB2: 0x00000001
[   32.036680] NDCB3: 0x00000000
[   32.055615] nand: nand_do_read_oob: from = 0x08600000, len = 64
[   32.061819] marvell-nfc pxa3xx-nand: 
[   32.061819] NDCR:  0x9d079fff
[   32.061819] NDCB0: 0x000d3000
[   32.061819] NDCB1: 0x0c000000
[   32.061819] NDCB2: 0x00000001
[   32.061819] NDCB3: 0x00000000
[   32.080747] nand: nand_do_read_oob: from = 0x08620000, len = 64
[   32.086778] marvell-nfc pxa3xx-nand: 
[   32.086778] NDCR:  0x9d079fff
[   32.086778] NDCB0: 0x000d3000
[   32.086778] NDCB1: 0x0c400000
[   32.086778] NDCB2: 0x00000001
[   32.086778] NDCB3: 0x00000000
[   32.106146] nand: nand_do_read_oob: from = 0x08640000, len = 64
[   32.112385] marvell-nfc pxa3xx-nand: 
[   32.112385] NDCR:  0x9d079fff
[   32.112385] NDCB0: 0x000d3000
[   32.112385] NDCB1: 0x0c800000
[   32.112385] NDCB2: 0x00000001
[   32.112385] NDCB3: 0x00000000
[   32.131320] nand: nand_do_read_oob: from = 0x08660000, len = 64
[   32.137351] marvell-nfc pxa3xx-nand: 
[   32.137351] NDCR:  0x9d079fff
[   32.137351] NDCB0: 0x000d3000
[   32.137351] NDCB1: 0x0cc00000
[   32.137351] NDCB2: 0x00000001
[   32.137351] NDCB3: 0x00000000
[   32.156286] nand: nand_do_read_oob: from = 0x08680000, len = 64
[   32.162490] marvell-nfc pxa3xx-nand: 
[   32.162490] NDCR:  0x9d079fff
[   32.162490] NDCB0: 0x000d3000
[   32.162490] NDCB1: 0x0d000000
[   32.162490] NDCB2: 0x00000001
[   32.162490] NDCB3: 0x00000000
[   32.181420] nand: nand_do_read_oob: from = 0x086a0000, len = 64
[   32.187450] marvell-nfc pxa3xx-nand: 
[   32.187450] NDCR:  0x9d079fff
[   32.187450] NDCB0: 0x000d3000
[   32.187450] NDCB1: 0x0d400000
[   32.187450] NDCB2: 0x00000001
[   32.187450] NDCB3: 0x00000000
[   32.206405] nand: nand_do_read_oob: from = 0x086c0000, len = 64
[   32.212607] marvell-nfc pxa3xx-nand: 
[   32.212607] NDCR:  0x9d079fff
[   32.212607] NDCB0: 0x000d3000
[   32.212607] NDCB1: 0x0d800000
[   32.212607] NDCB2: 0x00000001
[   32.212607] NDCB3: 0x00000000
[   32.231534] nand: nand_do_read_oob: from = 0x086e0000, len = 64
[   32.237566] marvell-nfc pxa3xx-nand: 
[   32.237566] NDCR:  0x9d079fff
[   32.237566] NDCB0: 0x000d3000
[   32.237566] NDCB1: 0x0dc00000
[   32.237566] NDCB2: 0x00000001
[   32.237566] NDCB3: 0x00000000
[   32.256503] nand: nand_do_read_oob: from = 0x08700000, len = 64
[   32.262705] marvell-nfc pxa3xx-nand: 
[   32.262705] NDCR:  0x9d079fff
[   32.262705] NDCB0: 0x000d3000
[   32.262705] NDCB1: 0x0e000000
[   32.262705] NDCB2: 0x00000001
[   32.262705] NDCB3: 0x00000000
[   32.281635] nand: nand_do_read_oob: from = 0x08720000, len = 64
[   32.287665] marvell-nfc pxa3xx-nand: 
[   32.287665] NDCR:  0x9d079fff
[   32.287665] NDCB0: 0x000d3000
[   32.287665] NDCB1: 0x0e400000
[   32.287665] NDCB2: 0x00000001
[   32.287665] NDCB3: 0x00000000
[   32.306597] nand: nand_do_read_oob: from = 0x08740000, len = 64
[   32.312804] marvell-nfc pxa3xx-nand: 
[   32.312804] NDCR:  0x9d079fff
[   32.312804] NDCB0: 0x000d3000
[   32.312804] NDCB1: 0x0e800000
[   32.312804] NDCB2: 0x00000001
[   32.312804] NDCB3: 0x00000000
[   32.331734] nand: nand_do_read_oob: from = 0x08760000, len = 64
[   32.337762] marvell-nfc pxa3xx-nand: 
[   32.337762] NDCR:  0x9d079fff
[   32.337762] NDCB0: 0x000d3000
[   32.337762] NDCB1: 0x0ec00000
[   32.337762] NDCB2: 0x00000001
[   32.337762] NDCB3: 0x00000000
[   32.356700] nand: nand_do_read_oob: from = 0x08780000, len = 64
[   32.362900] marvell-nfc pxa3xx-nand: 
[   32.362900] NDCR:  0x9d079fff
[   32.362900] NDCB0: 0x000d3000
[   32.362900] NDCB1: 0x0f000000
[   32.362900] NDCB2: 0x00000001
[   32.362900] NDCB3: 0x00000000
[   32.381831] nand: nand_do_read_oob: from = 0x087a0000, len = 64
[   32.387860] marvell-nfc pxa3xx-nand: 
[   32.387860] NDCR:  0x9d079fff
[   32.387860] NDCB0: 0x000d3000
[   32.387860] NDCB1: 0x0f400000
[   32.387860] NDCB2: 0x00000001
[   32.387860] NDCB3: 0x00000000
[   32.406794] nand: nand_do_read_oob: from = 0x087c0000, len = 64
[   32.412999] marvell-nfc pxa3xx-nand: 
[   32.412999] NDCR:  0x9d079fff
[   32.412999] NDCB0: 0x000d3000
[   32.412999] NDCB1: 0x0f800000
[   32.412999] NDCB2: 0x00000001
[   32.412999] NDCB3: 0x00000000
[   32.431929] nand: nand_do_read_oob: from = 0x087e0000, len = 64
[   32.437959] marvell-nfc pxa3xx-nand: 
[   32.437959] NDCR:  0x9d079fff
[   32.437959] NDCB0: 0x000d3000
[   32.437959] NDCB1: 0x0fc00000
[   32.437959] NDCB2: 0x00000001
[   32.437959] NDCB3: 0x00000000
[   32.456892] nand: nand_do_read_oob: from = 0x08800000, len = 64
[   32.463097] marvell-nfc pxa3xx-nand: 
[   32.463097] NDCR:  0x9d079fff
[   32.463097] NDCB0: 0x000d3000
[   32.463097] NDCB1: 0x10000000
[   32.463097] NDCB2: 0x00000001
[   32.463097] NDCB3: 0x00000000
[   32.482027] nand: nand_do_read_oob: from = 0x08820000, len = 64
[   32.488057] marvell-nfc pxa3xx-nand: 
[   32.488057] NDCR:  0x9d079fff
[   32.488057] NDCB0: 0x000d3000
[   32.488057] NDCB1: 0x10400000
[   32.488057] NDCB2: 0x00000001
[   32.488057] NDCB3: 0x00000000
[   32.506990] nand: nand_do_read_oob: from = 0x08840000, len = 64
[   32.513196] marvell-nfc pxa3xx-nand: 
[   32.513196] NDCR:  0x9d079fff
[   32.513196] NDCB0: 0x000d3000
[   32.513196] NDCB1: 0x10800000
[   32.513196] NDCB2: 0x00000001
[   32.513196] NDCB3: 0x00000000
[   32.532126] nand: nand_do_read_oob: from = 0x08860000, len = 64
[   32.538157] marvell-nfc pxa3xx-nand: 
[   32.538157] NDCR:  0x9d079fff
[   32.538157] NDCB0: 0x000d3000
[   32.538157] NDCB1: 0x10c00000
[   32.538157] NDCB2: 0x00000001
[   32.538157] NDCB3: 0x00000000
[   32.557089] nand: nand_do_read_oob: from = 0x08880000, len = 64
[   32.563296] marvell-nfc pxa3xx-nand: 
[   32.563296] NDCR:  0x9d079fff
[   32.563296] NDCB0: 0x000d3000
[   32.563296] NDCB1: 0x11000000
[   32.563296] NDCB2: 0x00000001
[   32.563296] NDCB3: 0x00000000
[   32.582223] nand: nand_do_read_oob: from = 0x088a0000, len = 64
[   32.588256] marvell-nfc pxa3xx-nand: 
[   32.588256] NDCR:  0x9d079fff
[   32.588256] NDCB0: 0x000d3000
[   32.588256] NDCB1: 0x11400000
[   32.588256] NDCB2: 0x00000001
[   32.588256] NDCB3: 0x00000000
[   32.607188] nand: nand_do_read_oob: from = 0x088c0000, len = 64
[   32.613393] marvell-nfc pxa3xx-nand: 
[   32.613393] NDCR:  0x9d079fff
[   32.613393] NDCB0: 0x000d3000
[   32.613393] NDCB1: 0x11800000
[   32.613393] NDCB2: 0x00000001
[   32.613393] NDCB3: 0x00000000
[   32.632322] nand: nand_do_read_oob: from = 0x088e0000, len = 64
[   32.638353] marvell-nfc pxa3xx-nand: 
[   32.638353] NDCR:  0x9d079fff
[   32.638353] NDCB0: 0x000d3000
[   32.638353] NDCB1: 0x11c00000
[   32.638353] NDCB2: 0x00000001
[   32.638353] NDCB3: 0x00000000
[   32.657286] nand: nand_do_read_oob: from = 0x08900000, len = 64
[   32.663491] marvell-nfc pxa3xx-nand: 
[   32.663491] NDCR:  0x9d079fff
[   32.663491] NDCB0: 0x000d3000
[   32.663491] NDCB1: 0x12000000
[   32.663491] NDCB2: 0x00000001
[   32.663491] NDCB3: 0x00000000
[   32.682418] nand: nand_do_read_oob: from = 0x08920000, len = 64
[   32.688451] marvell-nfc pxa3xx-nand: 
[   32.688451] NDCR:  0x9d079fff
[   32.688451] NDCB0: 0x000d3000
[   32.688451] NDCB1: 0x12400000
[   32.688451] NDCB2: 0x00000001
[   32.688451] NDCB3: 0x00000000
[   32.707383] nand: nand_do_read_oob: from = 0x08940000, len = 64
[   32.713581] marvell-nfc pxa3xx-nand: 
[   32.713581] NDCR:  0x9d079fff
[   32.713581] NDCB0: 0x000d3000
[   32.713581] NDCB1: 0x12800000
[   32.713581] NDCB2: 0x00000001
[   32.713581] NDCB3: 0x00000000
[   32.732510] nand: nand_do_read_oob: from = 0x08960000, len = 64
[   32.738543] marvell-nfc pxa3xx-nand: 
[   32.738543] NDCR:  0x9d079fff
[   32.738543] NDCB0: 0x000d3000
[   32.738543] NDCB1: 0x12c00000
[   32.738543] NDCB2: 0x00000001
[   32.738543] NDCB3: 0x00000000
[   32.757474] nand: nand_do_read_oob: from = 0x08980000, len = 64
[   32.763681] marvell-nfc pxa3xx-nand: 
[   32.763681] NDCR:  0x9d079fff
[   32.763681] NDCB0: 0x000d3000
[   32.763681] NDCB1: 0x13000000
[   32.763681] NDCB2: 0x00000001
[   32.763681] NDCB3: 0x00000000
[   32.782609] nand: nand_do_read_oob: from = 0x089a0000, len = 64
[   32.788814] marvell-nfc pxa3xx-nand: 
[   32.788814] NDCR:  0x9d079fff
[   32.788814] NDCB0: 0x000d3000
[   32.788814] NDCB1: 0x13400000
[   32.788814] NDCB2: 0x00000001
[   32.788814] NDCB3: 0x00000000
[   32.807719] nand: nand_do_read_oob: from = 0x089c0000, len = 64
[   32.813926] marvell-nfc pxa3xx-nand: 
[   32.813926] NDCR:  0x9d079fff
[   32.813926] NDCB0: 0x000d3000
[   32.813926] NDCB1: 0x13800000
[   32.813926] NDCB2: 0x00000001
[   32.813926] NDCB3: 0x00000000
[   32.832870] nand: nand_do_read_oob: from = 0x089e0000, len = 64
[   32.839074] marvell-nfc pxa3xx-nand: 
[   32.839074] NDCR:  0x9d079fff
[   32.839074] NDCB0: 0x000d3000
[   32.839074] NDCB1: 0x13c00000
[   32.839074] NDCB2: 0x00000001
[   32.839074] NDCB3: 0x00000000
[   32.857994] nand: nand_do_read_oob: from = 0x08a00000, len = 64
[   32.864195] marvell-nfc pxa3xx-nand: 
[   32.864195] NDCR:  0x9d079fff
[   32.864195] NDCB0: 0x000d3000
[   32.864195] NDCB1: 0x14000000
[   32.864195] NDCB2: 0x00000001
[   32.864195] NDCB3: 0x00000000
[   32.883123] nand: nand_do_read_oob: from = 0x08a20000, len = 64
[   32.889325] marvell-nfc pxa3xx-nand: 
[   32.889325] NDCR:  0x9d079fff
[   32.889325] NDCB0: 0x000d3000
[   32.889325] NDCB1: 0x14400000
[   32.889325] NDCB2: 0x00000001
[   32.889325] NDCB3: 0x00000000
[   32.908245] nand: nand_do_read_oob: from = 0x08a40000, len = 64
[   32.914448] marvell-nfc pxa3xx-nand: 
[   32.914448] NDCR:  0x9d079fff
[   32.914448] NDCB0: 0x000d3000
[   32.914448] NDCB1: 0x14800000
[   32.914448] NDCB2: 0x00000001
[   32.914448] NDCB3: 0x00000000
[   32.933376] nand: nand_do_read_oob: from = 0x08a60000, len = 64
[   32.939580] marvell-nfc pxa3xx-nand: 
[   32.939580] NDCR:  0x9d079fff
[   32.939580] NDCB0: 0x000d3000
[   32.939580] NDCB1: 0x14c00000
[   32.939580] NDCB2: 0x00000001
[   32.939580] NDCB3: 0x00000000
[   32.958499] nand: nand_do_read_oob: from = 0x08a80000, len = 64
[   32.964701] marvell-nfc pxa3xx-nand: 
[   32.964701] NDCR:  0x9d079fff
[   32.964701] NDCB0: 0x000d3000
[   32.964701] NDCB1: 0x15000000
[   32.964701] NDCB2: 0x00000001
[   32.964701] NDCB3: 0x00000000
[   32.983631] nand: nand_do_read_oob: from = 0x08aa0000, len = 64
[   32.989833] marvell-nfc pxa3xx-nand: 
[   32.989833] NDCR:  0x9d079fff
[   32.989833] NDCB0: 0x000d3000
[   32.989833] NDCB1: 0x15400000
[   32.989833] NDCB2: 0x00000001
[   32.989833] NDCB3: 0x00000000
[   33.008852] nand: nand_do_read_oob: from = 0x08ac0000, len = 64
[   33.014885] marvell-nfc pxa3xx-nand: 
[   33.014885] NDCR:  0x9d079fff
[   33.014885] NDCB0: 0x000d3000
[   33.014885] NDCB1: 0x15800000
[   33.014885] NDCB2: 0x00000001
[   33.014885] NDCB3: 0x00000000
[   33.033814] nand: nand_do_read_oob: from = 0x08ae0000, len = 64
[   33.040021] marvell-nfc pxa3xx-nand: 
[   33.040021] NDCR:  0x9d079fff
[   33.040021] NDCB0: 0x000d3000
[   33.040021] NDCB1: 0x15c00000
[   33.040021] NDCB2: 0x00000001
[   33.040021] NDCB3: 0x00000000
[   33.059139] nand: nand_do_read_oob: from = 0x08b00000, len = 64
[   33.065180] marvell-nfc pxa3xx-nand: 
[   33.065180] NDCR:  0x9d079fff
[   33.065180] NDCB0: 0x000d3000
[   33.065180] NDCB1: 0x16000000
[   33.065180] NDCB2: 0x00000001
[   33.065180] NDCB3: 0x00000000
[   33.084130] nand: nand_do_read_oob: from = 0x08b20000, len = 64
[   33.090334] marvell-nfc pxa3xx-nand: 
[   33.090334] NDCR:  0x9d079fff
[   33.090334] NDCB0: 0x000d3000
[   33.090334] NDCB1: 0x16400000
[   33.090334] NDCB2: 0x00000001
[   33.090334] NDCB3: 0x00000000
[   33.109260] nand: nand_do_read_oob: from = 0x08b40000, len = 64
[   33.115293] marvell-nfc pxa3xx-nand: 
[   33.115293] NDCR:  0x9d079fff
[   33.115293] NDCB0: 0x000d3000
[   33.115293] NDCB1: 0x16800000
[   33.115293] NDCB2: 0x00000001
[   33.115293] NDCB3: 0x00000000
[   33.134226] nand: nand_do_read_oob: from = 0x08b60000, len = 64
[   33.140431] marvell-nfc pxa3xx-nand: 
[   33.140431] NDCR:  0x9d079fff
[   33.140431] NDCB0: 0x000d3000
[   33.140431] NDCB1: 0x16c00000
[   33.140431] NDCB2: 0x00000001
[   33.140431] NDCB3: 0x00000000
[   33.159357] nand: nand_do_read_oob: from = 0x08b80000, len = 64
[   33.165393] marvell-nfc pxa3xx-nand: 
[   33.165393] NDCR:  0x9d079fff
[   33.165393] NDCB0: 0x000d3000
[   33.165393] NDCB1: 0x17000000
[   33.165393] NDCB2: 0x00000001
[   33.165393] NDCB3: 0x00000000
[   33.184323] nand: nand_do_read_oob: from = 0x08ba0000, len = 64
[   33.190529] marvell-nfc pxa3xx-nand: 
[   33.190529] NDCR:  0x9d079fff
[   33.190529] NDCB0: 0x000d3000
[   33.190529] NDCB1: 0x17400000
[   33.190529] NDCB2: 0x00000001
[   33.190529] NDCB3: 0x00000000
[   33.209457] nand: nand_do_read_oob: from = 0x08bc0000, len = 64
[   33.215489] marvell-nfc pxa3xx-nand: 
[   33.215489] NDCR:  0x9d079fff
[   33.215489] NDCB0: 0x000d3000
[   33.215489] NDCB1: 0x17800000
[   33.215489] NDCB2: 0x00000001
[   33.215489] NDCB3: 0x00000000
[   33.234423] nand: nand_do_read_oob: from = 0x08be0000, len = 64
[   33.240628] marvell-nfc pxa3xx-nand: 
[   33.240628] NDCR:  0x9d079fff
[   33.240628] NDCB0: 0x000d3000
[   33.240628] NDCB1: 0x17c00000
[   33.240628] NDCB2: 0x00000001
[   33.240628] NDCB3: 0x00000000
[   33.259556] nand: nand_do_read_oob: from = 0x08c00000, len = 64
[   33.265587] marvell-nfc pxa3xx-nand: 
[   33.265587] NDCR:  0x9d079fff
[   33.265587] NDCB0: 0x000d3000
[   33.265587] NDCB1: 0x18000000
[   33.265587] NDCB2: 0x00000001
[   33.265587] NDCB3: 0x00000000
[   33.284521] nand: nand_do_read_oob: from = 0x08c20000, len = 64
[   33.290727] marvell-nfc pxa3xx-nand: 
[   33.290727] NDCR:  0x9d079fff
[   33.290727] NDCB0: 0x000d3000
[   33.290727] NDCB1: 0x18400000
[   33.290727] NDCB2: 0x00000001
[   33.290727] NDCB3: 0x00000000
[   33.309653] nand: nand_do_read_oob: from = 0x08c40000, len = 64
[   33.315686] marvell-nfc pxa3xx-nand: 
[   33.315686] NDCR:  0x9d079fff
[   33.315686] NDCB0: 0x000d3000
[   33.315686] NDCB1: 0x18800000
[   33.315686] NDCB2: 0x00000001
[   33.315686] NDCB3: 0x00000000
[   33.334618] nand: nand_do_read_oob: from = 0x08c60000, len = 64
[   33.340825] marvell-nfc pxa3xx-nand: 
[   33.340825] NDCR:  0x9d079fff
[   33.340825] NDCB0: 0x000d3000
[   33.340825] NDCB1: 0x18c00000
[   33.340825] NDCB2: 0x00000001
[   33.340825] NDCB3: 0x00000000
[   33.359752] nand: nand_do_read_oob: from = 0x08c80000, len = 64
[   33.365785] marvell-nfc pxa3xx-nand: 
[   33.365785] NDCR:  0x9d079fff
[   33.365785] NDCB0: 0x000d3000
[   33.365785] NDCB1: 0x19000000
[   33.365785] NDCB2: 0x00000001
[   33.365785] NDCB3: 0x00000000
[   33.384714] nand: nand_do_read_oob: from = 0x08ca0000, len = 64
[   33.390914] marvell-nfc pxa3xx-nand: 
[   33.390914] NDCR:  0x9d079fff
[   33.390914] NDCB0: 0x000d3000
[   33.390914] NDCB1: 0x19400000
[   33.390914] NDCB2: 0x00000001
[   33.390914] NDCB3: 0x00000000
[   33.409864] nand: nand_do_read_oob: from = 0x08cc0000, len = 64
[   33.415892] marvell-nfc pxa3xx-nand: 
[   33.415892] NDCR:  0x9d079fff
[   33.415892] NDCB0: 0x000d3000
[   33.415892] NDCB1: 0x19800000
[   33.415892] NDCB2: 0x00000001
[   33.415892] NDCB3: 0x00000000
[   33.434822] nand: nand_do_read_oob: from = 0x08ce0000, len = 64
[   33.441022] marvell-nfc pxa3xx-nand: 
[   33.441022] NDCR:  0x9d079fff
[   33.441022] NDCB0: 0x000d3000
[   33.441022] NDCB1: 0x19c00000
[   33.441022] NDCB2: 0x00000001
[   33.441022] NDCB3: 0x00000000
[   33.459949] nand: nand_do_read_oob: from = 0x08d00000, len = 64
[   33.465981] marvell-nfc pxa3xx-nand: 
[   33.465981] NDCR:  0x9d079fff
[   33.465981] NDCB0: 0x000d3000
[   33.465981] NDCB1: 0x1a000000
[   33.465981] NDCB2: 0x00000001
[   33.465981] NDCB3: 0x00000000
[   33.484914] nand: nand_do_read_oob: from = 0x08d20000, len = 64
[   33.491119] marvell-nfc pxa3xx-nand: 
[   33.491119] NDCR:  0x9d079fff
[   33.491119] NDCB0: 0x000d3000
[   33.491119] NDCB1: 0x1a400000
[   33.491119] NDCB2: 0x00000001
[   33.491119] NDCB3: 0x00000000
[   33.510047] nand: nand_do_read_oob: from = 0x08d40000, len = 64
[   33.516081] marvell-nfc pxa3xx-nand: 
[   33.516081] NDCR:  0x9d079fff
[   33.516081] NDCB0: 0x000d3000
[   33.516081] NDCB1: 0x1a800000
[   33.516081] NDCB2: 0x00000001
[   33.516081] NDCB3: 0x00000000
[   33.535011] nand: nand_do_read_oob: from = 0x08d60000, len = 64
[   33.541219] marvell-nfc pxa3xx-nand: 
[   33.541219] NDCR:  0x9d079fff
[   33.541219] NDCB0: 0x000d3000
[   33.541219] NDCB1: 0x1ac00000
[   33.541219] NDCB2: 0x00000001
[   33.541219] NDCB3: 0x00000000
[   33.560144] nand: nand_do_read_oob: from = 0x08d80000, len = 64
[   33.566179] marvell-nfc pxa3xx-nand: 
[   33.566179] NDCR:  0x9d079fff
[   33.566179] NDCB0: 0x000d3000
[   33.566179] NDCB1: 0x1b000000
[   33.566179] NDCB2: 0x00000001
[   33.566179] NDCB3: 0x00000000
[   33.585109] nand: nand_do_read_oob: from = 0x08da0000, len = 64
[   33.591310] marvell-nfc pxa3xx-nand: 
[   33.591310] NDCR:  0x9d079fff
[   33.591310] NDCB0: 0x000d3000
[   33.591310] NDCB1: 0x1b400000
[   33.591310] NDCB2: 0x00000001
[   33.591310] NDCB3: 0x00000000
[   33.610236] nand: nand_do_read_oob: from = 0x08dc0000, len = 64
[   33.616269] marvell-nfc pxa3xx-nand: 
[   33.616269] NDCR:  0x9d079fff
[   33.616269] NDCB0: 0x000d3000
[   33.616269] NDCB1: 0x1b800000
[   33.616269] NDCB2: 0x00000001
[   33.616269] NDCB3: 0x00000000
[   33.635198] nand: nand_do_read_oob: from = 0x08de0000, len = 64
[   33.641395] marvell-nfc pxa3xx-nand: 
[   33.641395] NDCR:  0x9d079fff
[   33.641395] NDCB0: 0x000d3000
[   33.641395] NDCB1: 0x1bc00000
[   33.641395] NDCB2: 0x00000001
[   33.641395] NDCB3: 0x00000000
[   33.660317] nand: nand_do_read_oob: from = 0x08e00000, len = 64
[   33.666350] marvell-nfc pxa3xx-nand: 
[   33.666350] NDCR:  0x9d079fff
[   33.666350] NDCB0: 0x000d3000
[   33.666350] NDCB1: 0x1c000000
[   33.666350] NDCB2: 0x00000001
[   33.666350] NDCB3: 0x00000000
[   33.685280] nand: nand_do_read_oob: from = 0x08e20000, len = 64
[   33.691480] marvell-nfc pxa3xx-nand: 
[   33.691480] NDCR:  0x9d079fff
[   33.691480] NDCB0: 0x000d3000
[   33.691480] NDCB1: 0x1c400000
[   33.691480] NDCB2: 0x00000001
[   33.691480] NDCB3: 0x00000000
[   33.710406] nand: nand_do_read_oob: from = 0x08e40000, len = 64
[   33.716441] marvell-nfc pxa3xx-nand: 
[   33.716441] NDCR:  0x9d079fff
[   33.716441] NDCB0: 0x000d3000
[   33.716441] NDCB1: 0x1c800000
[   33.716441] NDCB2: 0x00000001
[   33.716441] NDCB3: 0x00000000
[   33.735371] nand: nand_do_read_oob: from = 0x08e60000, len = 64
[   33.741567] marvell-nfc pxa3xx-nand: 
[   33.741567] NDCR:  0x9d079fff
[   33.741567] NDCB0: 0x000d3000
[   33.741567] NDCB1: 0x1cc00000
[   33.741567] NDCB2: 0x00000001
[   33.741567] NDCB3: 0x00000000
[   33.760498] nand: nand_do_read_oob: from = 0x08e80000, len = 64
[   33.766528] marvell-nfc pxa3xx-nand: 
[   33.766528] NDCR:  0x9d079fff
[   33.766528] NDCB0: 0x000d3000
[   33.766528] NDCB1: 0x1d000000
[   33.766528] NDCB2: 0x00000001
[   33.766528] NDCB3: 0x00000000
[   33.785461] nand: nand_do_read_oob: from = 0x08ea0000, len = 64
[   33.791669] marvell-nfc pxa3xx-nand: 
[   33.791669] NDCR:  0x9d079fff
[   33.791669] NDCB0: 0x000d3000
[   33.791669] NDCB1: 0x1d400000
[   33.791669] NDCB2: 0x00000001
[   33.791669] NDCB3: 0x00000000
[   33.810595] nand: nand_do_read_oob: from = 0x08ec0000, len = 64
[   33.816628] marvell-nfc pxa3xx-nand: 
[   33.816628] NDCR:  0x9d079fff
[   33.816628] NDCB0: 0x000d3000
[   33.816628] NDCB1: 0x1d800000
[   33.816628] NDCB2: 0x00000001
[   33.816628] NDCB3: 0x00000000
[   33.835559] nand: nand_do_read_oob: from = 0x08ee0000, len = 64
[   33.841767] marvell-nfc pxa3xx-nand: 
[   33.841767] NDCR:  0x9d079fff
[   33.841767] NDCB0: 0x000d3000
[   33.841767] NDCB1: 0x1dc00000
[   33.841767] NDCB2: 0x00000001
[   33.841767] NDCB3: 0x00000000
[   33.860697] nand: nand_do_read_oob: from = 0x08f00000, len = 64
[   33.866727] marvell-nfc pxa3xx-nand: 
[   33.866727] NDCR:  0x9d079fff
[   33.866727] NDCB0: 0x000d3000
[   33.866727] NDCB1: 0x1e000000
[   33.866727] NDCB2: 0x00000001
[   33.866727] NDCB3: 0x00000000
[   33.885660] nand: nand_do_read_oob: from = 0x08f20000, len = 64
[   33.891866] marvell-nfc pxa3xx-nand: 
[   33.891866] NDCR:  0x9d079fff
[   33.891866] NDCB0: 0x000d3000
[   33.891866] NDCB1: 0x1e400000
[   33.891866] NDCB2: 0x00000001
[   33.891866] NDCB3: 0x00000000
[   33.910793] nand: nand_do_read_oob: from = 0x08f40000, len = 64
[   33.916827] marvell-nfc pxa3xx-nand: 
[   33.916827] NDCR:  0x9d079fff
[   33.916827] NDCB0: 0x000d3000
[   33.916827] NDCB1: 0x1e800000
[   33.916827] NDCB2: 0x00000001
[   33.916827] NDCB3: 0x00000000
[   33.935755] nand: nand_do_read_oob: from = 0x08f60000, len = 64
[   33.941955] marvell-nfc pxa3xx-nand: 
[   33.941955] NDCR:  0x9d079fff
[   33.941955] NDCB0: 0x000d3000
[   33.941955] NDCB1: 0x1ec00000
[   33.941955] NDCB2: 0x00000001
[   33.941955] NDCB3: 0x00000000
[   33.960883] nand: nand_do_read_oob: from = 0x08f80000, len = 64
[   33.966914] marvell-nfc pxa3xx-nand: 
[   33.966914] NDCR:  0x9d079fff
[   33.966914] NDCB0: 0x000d3000
[   33.966914] NDCB1: 0x1f000000
[   33.966914] NDCB2: 0x00000001
[   33.966914] NDCB3: 0x00000000
[   33.985845] nand: nand_do_read_oob: from = 0x08fa0000, len = 64
[   33.992043] marvell-nfc pxa3xx-nand: 
[   33.992043] NDCR:  0x9d079fff
[   33.992043] NDCB0: 0x000d3000
[   33.992043] NDCB1: 0x1f400000
[   33.992043] NDCB2: 0x00000001
[   33.992043] NDCB3: 0x00000000
[   34.010983] nand: nand_do_read_oob: from = 0x08fc0000, len = 64
[   34.017014] marvell-nfc pxa3xx-nand: 
[   34.017014] NDCR:  0x9d079fff
[   34.017014] NDCB0: 0x000d3000
[   34.017014] NDCB1: 0x1f800000
[   34.017014] NDCB2: 0x00000001
[   34.017014] NDCB3: 0x00000000
[   34.035945] nand: nand_do_read_oob: from = 0x08fe0000, len = 64
[   34.042153] marvell-nfc pxa3xx-nand: 
[   34.042153] NDCR:  0x9d079fff
[   34.042153] NDCB0: 0x000d3000
[   34.042153] NDCB1: 0x1fc00000
[   34.042153] NDCB2: 0x00000001
[   34.042153] NDCB3: 0x00000000
[   34.061101] nand: nand_do_read_oob: from = 0x09000000, len = 64
[   34.067138] marvell-nfc pxa3xx-nand: 
[   34.067138] NDCR:  0x9d079fff
[   34.067138] NDCB0: 0x000d3000
[   34.067138] NDCB1: 0x20000000
[   34.067138] NDCB2: 0x00000001
[   34.067138] NDCB3: 0x00000000
[   34.086073] nand: nand_do_read_oob: from = 0x09020000, len = 64
[   34.092563] marvell-nfc pxa3xx-nand: 
[   34.092563] NDCR:  0x9d079fff
[   34.092563] NDCB0: 0x000d3000
[   34.092563] NDCB1: 0x20400000
[   34.092563] NDCB2: 0x00000001
[   34.092563] NDCB3: 0x00000000
[   34.111561] nand: nand_do_read_oob: from = 0x09040000, len = 64
[   34.117591] marvell-nfc pxa3xx-nand: 
[   34.117591] NDCR:  0x9d079fff
[   34.117591] NDCB0: 0x000d3000
[   34.117591] NDCB1: 0x20800000
[   34.117591] NDCB2: 0x00000001
[   34.117591] NDCB3: 0x00000000
[   34.136523] nand: nand_do_read_oob: from = 0x09060000, len = 64
[   34.142727] marvell-nfc pxa3xx-nand: 
[   34.142727] NDCR:  0x9d079fff
[   34.142727] NDCB0: 0x000d3000
[   34.142727] NDCB1: 0x20c00000
[   34.142727] NDCB2: 0x00000001
[   34.142727] NDCB3: 0x00000000
[   34.161657] nand: nand_do_read_oob: from = 0x09080000, len = 64
[   34.167691] marvell-nfc pxa3xx-nand: 
[   34.167691] NDCR:  0x9d079fff
[   34.167691] NDCB0: 0x000d3000
[   34.167691] NDCB1: 0x21000000
[   34.167691] NDCB2: 0x00000001
[   34.167691] NDCB3: 0x00000000
[   34.186632] nand: nand_do_read_oob: from = 0x090a0000, len = 64
[   34.192836] marvell-nfc pxa3xx-nand: 
[   34.192836] NDCR:  0x9d079fff
[   34.192836] NDCB0: 0x000d3000
[   34.192836] NDCB1: 0x21400000
[   34.192836] NDCB2: 0x00000001
[   34.192836] NDCB3: 0x00000000
[   34.211766] nand: nand_do_read_oob: from = 0x090c0000, len = 64
[   34.217794] marvell-nfc pxa3xx-nand: 
[   34.217794] NDCR:  0x9d079fff
[   34.217794] NDCB0: 0x000d3000
[   34.217794] NDCB1: 0x21800000
[   34.217794] NDCB2: 0x00000001
[   34.217794] NDCB3: 0x00000000
[   34.236728] nand: nand_do_read_oob: from = 0x090e0000, len = 64
[   34.242933] marvell-nfc pxa3xx-nand: 
[   34.242933] NDCR:  0x9d079fff
[   34.242933] NDCB0: 0x000d3000
[   34.242933] NDCB1: 0x21c00000
[   34.242933] NDCB2: 0x00000001
[   34.242933] NDCB3: 0x00000000
[   34.261864] nand: nand_do_read_oob: from = 0x09100000, len = 64
[   34.267892] marvell-nfc pxa3xx-nand: 
[   34.267892] NDCR:  0x9d079fff
[   34.267892] NDCB0: 0x000d3000
[   34.267892] NDCB1: 0x22000000
[   34.267892] NDCB2: 0x00000001
[   34.267892] NDCB3: 0x00000000
[   34.286828] nand: nand_do_read_oob: from = 0x09120000, len = 64
[   34.293031] marvell-nfc pxa3xx-nand: 
[   34.293031] NDCR:  0x9d079fff
[   34.293031] NDCB0: 0x000d3000
[   34.293031] NDCB1: 0x22400000
[   34.293031] NDCB2: 0x00000001
[   34.293031] NDCB3: 0x00000000
[   34.311960] nand: nand_do_read_oob: from = 0x09140000, len = 64
[   34.317992] marvell-nfc pxa3xx-nand: 
[   34.317992] NDCR:  0x9d079fff
[   34.317992] NDCB0: 0x000d3000
[   34.317992] NDCB1: 0x22800000
[   34.317992] NDCB2: 0x00000001
[   34.317992] NDCB3: 0x00000000
[   34.336926] nand: nand_do_read_oob: from = 0x09160000, len = 64
[   34.343129] marvell-nfc pxa3xx-nand: 
[   34.343129] NDCR:  0x9d079fff
[   34.343129] NDCB0: 0x000d3000
[   34.343129] NDCB1: 0x22c00000
[   34.343129] NDCB2: 0x00000001
[   34.343129] NDCB3: 0x00000000
[   34.362057] nand: nand_do_read_oob: from = 0x09180000, len = 64
[   34.368089] marvell-nfc pxa3xx-nand: 
[   34.368089] NDCR:  0x9d079fff
[   34.368089] NDCB0: 0x000d3000
[   34.368089] NDCB1: 0x23000000
[   34.368089] NDCB2: 0x00000001
[   34.368089] NDCB3: 0x00000000
[   34.387023] nand: nand_do_read_oob: from = 0x091a0000, len = 64
[   34.393227] marvell-nfc pxa3xx-nand: 
[   34.393227] NDCR:  0x9d079fff
[   34.393227] NDCB0: 0x000d3000
[   34.393227] NDCB1: 0x23400000
[   34.393227] NDCB2: 0x00000001
[   34.393227] NDCB3: 0x00000000
[   34.412160] nand: nand_do_read_oob: from = 0x091c0000, len = 64
[   34.418187] marvell-nfc pxa3xx-nand: 
[   34.418187] NDCR:  0x9d079fff
[   34.418187] NDCB0: 0x000d3000
[   34.418187] NDCB1: 0x23800000
[   34.418187] NDCB2: 0x00000001
[   34.418187] NDCB3: 0x00000000
[   34.437121] nand: nand_do_read_oob: from = 0x091e0000, len = 64
[   34.443326] marvell-nfc pxa3xx-nand: 
[   34.443326] NDCR:  0x9d079fff
[   34.443326] NDCB0: 0x000d3000
[   34.443326] NDCB1: 0x23c00000
[   34.443326] NDCB2: 0x00000001
[   34.443326] NDCB3: 0x00000000
[   34.462258] nand: nand_do_read_oob: from = 0x09200000, len = 64
[   34.468286] marvell-nfc pxa3xx-nand: 
[   34.468286] NDCR:  0x9d079fff
[   34.468286] NDCB0: 0x000d3000
[   34.468286] NDCB1: 0x24000000
[   34.468286] NDCB2: 0x00000001
[   34.468286] NDCB3: 0x00000000
[   34.487219] nand: nand_do_read_oob: from = 0x09220000, len = 64
[   34.493425] marvell-nfc pxa3xx-nand: 
[   34.493425] NDCR:  0x9d079fff
[   34.493425] NDCB0: 0x000d3000
[   34.493425] NDCB1: 0x24400000
[   34.493425] NDCB2: 0x00000001
[   34.493425] NDCB3: 0x00000000
[   34.512356] nand: nand_do_read_oob: from = 0x09240000, len = 64
[   34.518384] marvell-nfc pxa3xx-nand: 
[   34.518384] NDCR:  0x9d079fff
[   34.518384] NDCB0: 0x000d3000
[   34.518384] NDCB1: 0x24800000
[   34.518384] NDCB2: 0x00000001
[   34.518384] NDCB3: 0x00000000
[   34.537317] nand: nand_do_read_oob: from = 0x09260000, len = 64
[   34.543522] marvell-nfc pxa3xx-nand: 
[   34.543522] NDCR:  0x9d079fff
[   34.543522] NDCB0: 0x000d3000
[   34.543522] NDCB1: 0x24c00000
[   34.543522] NDCB2: 0x00000001
[   34.543522] NDCB3: 0x00000000
[   34.562454] nand: nand_do_read_oob: from = 0x09280000, len = 64
[   34.568484] marvell-nfc pxa3xx-nand: 
[   34.568484] NDCR:  0x9d079fff
[   34.568484] NDCB0: 0x000d3000
[   34.568484] NDCB1: 0x25000000
[   34.568484] NDCB2: 0x00000001
[   34.568484] NDCB3: 0x00000000
[   34.587416] nand: nand_do_read_oob: from = 0x092a0000, len = 64
[   34.593623] marvell-nfc pxa3xx-nand: 
[   34.593623] NDCR:  0x9d079fff
[   34.593623] NDCB0: 0x000d3000
[   34.593623] NDCB1: 0x25400000
[   34.593623] NDCB2: 0x00000001
[   34.593623] NDCB3: 0x00000000
[   34.612553] nand: nand_do_read_oob: from = 0x092c0000, len = 64
[   34.618581] marvell-nfc pxa3xx-nand: 
[   34.618581] NDCR:  0x9d079fff
[   34.618581] NDCB0: 0x000d3000
[   34.618581] NDCB1: 0x25800000
[   34.618581] NDCB2: 0x00000001
[   34.618581] NDCB3: 0x00000000
[   34.637625] nand: nand_do_read_oob: from = 0x092e0000, len = 64
[   34.643833] marvell-nfc pxa3xx-nand: 
[   34.643833] NDCR:  0x9d079fff
[   34.643833] NDCB0: 0x000d3000
[   34.643833] NDCB1: 0x25c00000
[   34.643833] NDCB2: 0x00000001
[   34.643833] NDCB3: 0x00000000
[   34.662763] nand: nand_do_read_oob: from = 0x09300000, len = 64
[   34.668963] marvell-nfc pxa3xx-nand: 
[   34.668963] NDCR:  0x9d079fff
[   34.668963] NDCB0: 0x000d3000
[   34.668963] NDCB1: 0x26000000
[   34.668963] NDCB2: 0x00000001
[   34.668963] NDCB3: 0x00000000
[   34.687904] nand: nand_do_read_oob: from = 0x09320000, len = 64
[   34.694104] marvell-nfc pxa3xx-nand: 
[   34.694104] NDCR:  0x9d079fff
[   34.694104] NDCB0: 0x000d3000
[   34.694104] NDCB1: 0x26400000
[   34.694104] NDCB2: 0x00000001
[   34.694104] NDCB3: 0x00000000
[   34.713035] nand: nand_do_read_oob: from = 0x09340000, len = 64
[   34.719235] marvell-nfc pxa3xx-nand: 
[   34.719235] NDCR:  0x9d079fff
[   34.719235] NDCB0: 0x000d3000
[   34.719235] NDCB1: 0x26800000
[   34.719235] NDCB2: 0x00000001
[   34.719235] NDCB3: 0x00000000
[   34.738155] nand: nand_do_read_oob: from = 0x09360000, len = 64
[   34.744356] marvell-nfc pxa3xx-nand: 
[   34.744356] NDCR:  0x9d079fff
[   34.744356] NDCB0: 0x000d3000
[   34.744356] NDCB1: 0x26c00000
[   34.744356] NDCB2: 0x00000001
[   34.744356] NDCB3: 0x00000000
[   34.763288] nand: nand_do_read_oob: from = 0x09380000, len = 64
[   34.769488] marvell-nfc pxa3xx-nand: 
[   34.769488] NDCR:  0x9d079fff
[   34.769488] NDCB0: 0x000d3000
[   34.769488] NDCB1: 0x27000000
[   34.769488] NDCB2: 0x00000001
[   34.769488] NDCB3: 0x00000000
[   34.788408] nand: nand_do_read_oob: from = 0x093a0000, len = 64
[   34.794608] marvell-nfc pxa3xx-nand: 
[   34.794608] NDCR:  0x9d079fff
[   34.794608] NDCB0: 0x000d3000
[   34.794608] NDCB1: 0x27400000
[   34.794608] NDCB2: 0x00000001
[   34.794608] NDCB3: 0x00000000
[   34.813541] nand: nand_do_read_oob: from = 0x093c0000, len = 64
[   34.819740] marvell-nfc pxa3xx-nand: 
[   34.819740] NDCR:  0x9d079fff
[   34.819740] NDCB0: 0x000d3000
[   34.819740] NDCB1: 0x27800000
[   34.819740] NDCB2: 0x00000001
[   34.819740] NDCB3: 0x00000000
[   34.838761] nand: nand_do_read_oob: from = 0x093e0000, len = 64
[   34.844800] marvell-nfc pxa3xx-nand: 
[   34.844800] NDCR:  0x9d079fff
[   34.844800] NDCB0: 0x000d3000
[   34.844800] NDCB1: 0x27c00000
[   34.844800] NDCB2: 0x00000001
[   34.844800] NDCB3: 0x00000000
[   34.863716] nand: nand_do_read_oob: from = 0x09400000, len = 64
[   34.869919] marvell-nfc pxa3xx-nand: 
[   34.869919] NDCR:  0x9d079fff
[   34.869919] NDCB0: 0x000d3000
[   34.869919] NDCB1: 0x28000000
[   34.869919] NDCB2: 0x00000001
[   34.869919] NDCB3: 0x00000000
[   34.888900] nand: nand_do_read_oob: from = 0x09420000, len = 64
[   34.894933] marvell-nfc pxa3xx-nand: 
[   34.894933] NDCR:  0x9d079fff
[   34.894933] NDCB0: 0x000d3000
[   34.894933] NDCB1: 0x28400000
[   34.894933] NDCB2: 0x00000001
[   34.894933] NDCB3: 0x00000000
[   34.913873] nand: nand_do_read_oob: from = 0x09440000, len = 64
[   34.920075] marvell-nfc pxa3xx-nand: 
[   34.920075] NDCR:  0x9d079fff
[   34.920075] NDCB0: 0x000d3000
[   34.920075] NDCB1: 0x28800000
[   34.920075] NDCB2: 0x00000001
[   34.920075] NDCB3: 0x00000000
[   34.939043] nand: nand_do_read_oob: from = 0x09460000, len = 64
[   34.945071] marvell-nfc pxa3xx-nand: 
[   34.945071] NDCR:  0x9d079fff
[   34.945071] NDCB0: 0x000d3000
[   34.945071] NDCB1: 0x28c00000
[   34.945071] NDCB2: 0x00000001
[   34.945071] NDCB3: 0x00000000
[   34.964004] nand: nand_do_read_oob: from = 0x09480000, len = 64
[   34.970209] marvell-nfc pxa3xx-nand: 
[   34.970209] NDCR:  0x9d079fff
[   34.970209] NDCB0: 0x000d3000
[   34.970209] NDCB1: 0x29000000
[   34.970209] NDCB2: 0x00000001
[   34.970209] NDCB3: 0x00000000
[   34.989138] nand: nand_do_read_oob: from = 0x094a0000, len = 64
[   34.995170] marvell-nfc pxa3xx-nand: 
[   34.995170] NDCR:  0x9d079fff
[   34.995170] NDCB0: 0x000d3000
[   34.995170] NDCB1: 0x29400000
[   34.995170] NDCB2: 0x00000001
[   34.995170] NDCB3: 0x00000000
[   35.014111] nand: nand_do_read_oob: from = 0x094c0000, len = 64
[   35.020319] marvell-nfc pxa3xx-nand: 
[   35.020319] NDCR:  0x9d079fff
[   35.020319] NDCB0: 0x000d3000
[   35.020319] NDCB1: 0x29800000
[   35.020319] NDCB2: 0x00000001
[   35.020319] NDCB3: 0x00000000
[   35.039246] nand: nand_do_read_oob: from = 0x094e0000, len = 64
[   35.045275] marvell-nfc pxa3xx-nand: 
[   35.045275] NDCR:  0x9d079fff
[   35.045275] NDCB0: 0x000d3000
[   35.045275] NDCB1: 0x29c00000
[   35.045275] NDCB2: 0x00000001
[   35.045275] NDCB3: 0x00000000
[   35.064210] nand: nand_do_read_oob: from = 0x09500000, len = 64
[   35.070415] marvell-nfc pxa3xx-nand: 
[   35.070415] NDCR:  0x9d079fff
[   35.070415] NDCB0: 0x000d3000
[   35.070415] NDCB1: 0x2a000000
[   35.070415] NDCB2: 0x00000001
[   35.070415] NDCB3: 0x00000000
[   35.089346] nand: nand_do_read_oob: from = 0x09520000, len = 64
[   35.095375] marvell-nfc pxa3xx-nand: 
[   35.095375] NDCR:  0x9d079fff
[   35.095375] NDCB0: 0x000d3000
[   35.095375] NDCB1: 0x2a400000
[   35.095375] NDCB2: 0x00000001
[   35.095375] NDCB3: 0x00000000
[   35.114308] nand: nand_do_read_oob: from = 0x09540000, len = 64
[   35.120514] marvell-nfc pxa3xx-nand: 
[   35.120514] NDCR:  0x9d079fff
[   35.120514] NDCB0: 0x000d3000
[   35.120514] NDCB1: 0x2a800000
[   35.120514] NDCB2: 0x00000001
[   35.120514] NDCB3: 0x00000000
[   35.139442] nand: nand_do_read_oob: from = 0x09560000, len = 64
[   35.145473] marvell-nfc pxa3xx-nand: 
[   35.145473] NDCR:  0x9d079fff
[   35.145473] NDCB0: 0x000d3000
[   35.145473] NDCB1: 0x2ac00000
[   35.145473] NDCB2: 0x00000001
[   35.145473] NDCB3: 0x00000000
[   35.164408] nand: nand_do_read_oob: from = 0x09580000, len = 64
[   35.170614] marvell-nfc pxa3xx-nand: 
[   35.170614] NDCR:  0x9d079fff
[   35.170614] NDCB0: 0x000d3000
[   35.170614] NDCB1: 0x2b000000
[   35.170614] NDCB2: 0x00000001
[   35.170614] NDCB3: 0x00000000
[   35.189544] nand: nand_do_read_oob: from = 0x095a0000, len = 64
[   35.195571] marvell-nfc pxa3xx-nand: 
[   35.195571] NDCR:  0x9d079fff
[   35.195571] NDCB0: 0x000d3000
[   35.195571] NDCB1: 0x2b400000
[   35.195571] NDCB2: 0x00000001
[   35.195571] NDCB3: 0x00000000
[   35.214506] nand: nand_do_read_oob: from = 0x095c0000, len = 64
[   35.220710] marvell-nfc pxa3xx-nand: 
[   35.220710] NDCR:  0x9d079fff
[   35.220710] NDCB0: 0x000d3000
[   35.220710] NDCB1: 0x2b800000
[   35.220710] NDCB2: 0x00000001
[   35.220710] NDCB3: 0x00000000
[   35.239640] nand: nand_do_read_oob: from = 0x095e0000, len = 64
[   35.245669] marvell-nfc pxa3xx-nand: 
[   35.245669] NDCR:  0x9d079fff
[   35.245669] NDCB0: 0x000d3000
[   35.245669] NDCB1: 0x2bc00000
[   35.245669] NDCB2: 0x00000001
[   35.245669] NDCB3: 0x00000000
[   35.264602] nand: nand_do_read_oob: from = 0x09600000, len = 64
[   35.270820] marvell-nfc pxa3xx-nand: 
[   35.270820] NDCR:  0x9d079fff
[   35.270820] NDCB0: 0x000d3000
[   35.270820] NDCB1: 0x2c000000
[   35.270820] NDCB2: 0x00000001
[   35.270820] NDCB3: 0x00000000
[   35.289750] nand: nand_do_read_oob: from = 0x09620000, len = 64
[   35.295777] marvell-nfc pxa3xx-nand: 
[   35.295777] NDCR:  0x9d079fff
[   35.295777] NDCB0: 0x000d3000
[   35.295777] NDCB1: 0x2c400000
[   35.295777] NDCB2: 0x00000001
[   35.295777] NDCB3: 0x00000000
[   35.314712] nand: nand_do_read_oob: from = 0x09640000, len = 64
[   35.320915] marvell-nfc pxa3xx-nand: 
[   35.320915] NDCR:  0x9d079fff
[   35.320915] NDCB0: 0x000d3000
[   35.320915] NDCB1: 0x2c800000
[   35.320915] NDCB2: 0x00000001
[   35.320915] NDCB3: 0x00000000
[   35.339848] nand: nand_do_read_oob: from = 0x09660000, len = 64
[   35.345875] marvell-nfc pxa3xx-nand: 
[   35.345875] NDCR:  0x9d079fff
[   35.345875] NDCB0: 0x000d3000
[   35.345875] NDCB1: 0x2cc00000
[   35.345875] NDCB2: 0x00000001
[   35.345875] NDCB3: 0x00000000
[   35.364810] nand: nand_do_read_oob: from = 0x09680000, len = 64
[   35.371014] marvell-nfc pxa3xx-nand: 
[   35.371014] NDCR:  0x9d079fff
[   35.371014] NDCB0: 0x000d3000
[   35.371014] NDCB1: 0x2d000000
[   35.371014] NDCB2: 0x00000001
[   35.371014] NDCB3: 0x00000000
[   35.389943] nand: nand_do_read_oob: from = 0x096a0000, len = 64
[   35.395975] marvell-nfc pxa3xx-nand: 
[   35.395975] NDCR:  0x9d079fff
[   35.395975] NDCB0: 0x000d3000
[   35.395975] NDCB1: 0x2d400000
[   35.395975] NDCB2: 0x00000001
[   35.395975] NDCB3: 0x00000000
[   35.414909] nand: nand_do_read_oob: from = 0x096c0000, len = 64
[   35.421113] marvell-nfc pxa3xx-nand: 
[   35.421113] NDCR:  0x9d079fff
[   35.421113] NDCB0: 0x000d3000
[   35.421113] NDCB1: 0x2d800000
[   35.421113] NDCB2: 0x00000001
[   35.421113] NDCB3: 0x00000000
[   35.440046] nand: nand_do_read_oob: from = 0x096e0000, len = 64
[   35.446080] marvell-nfc pxa3xx-nand: 
[   35.446080] NDCR:  0x9d079fff
[   35.446080] NDCB0: 0x000d3000
[   35.446080] NDCB1: 0x2dc00000
[   35.446080] NDCB2: 0x00000001
[   35.446080] NDCB3: 0x00000000
[   35.465018] nand: nand_do_read_oob: from = 0x09700000, len = 64
[   35.471220] marvell-nfc pxa3xx-nand: 
[   35.471220] NDCR:  0x9d079fff
[   35.471220] NDCB0: 0x000d3000
[   35.471220] NDCB1: 0x2e000000
[   35.471220] NDCB2: 0x00000001
[   35.471220] NDCB3: 0x00000000
[   35.490151] nand: nand_do_read_oob: from = 0x09720000, len = 64
[   35.496179] marvell-nfc pxa3xx-nand: 
[   35.496179] NDCR:  0x9d079fff
[   35.496179] NDCB0: 0x000d3000
[   35.496179] NDCB1: 0x2e400000
[   35.496179] NDCB2: 0x00000001
[   35.496179] NDCB3: 0x00000000
[   35.515111] nand: nand_do_read_oob: from = 0x09740000, len = 64
[   35.521320] marvell-nfc pxa3xx-nand: 
[   35.521320] NDCR:  0x9d079fff
[   35.521320] NDCB0: 0x000d3000
[   35.521320] NDCB1: 0x2e800000
[   35.521320] NDCB2: 0x00000001
[   35.521320] NDCB3: 0x00000000
[   35.540249] nand: nand_do_read_oob: from = 0x09760000, len = 64
[   35.546277] marvell-nfc pxa3xx-nand: 
[   35.546277] NDCR:  0x9d079fff
[   35.546277] NDCB0: 0x000d3000
[   35.546277] NDCB1: 0x2ec00000
[   35.546277] NDCB2: 0x00000001
[   35.546277] NDCB3: 0x00000000
[   35.565211] nand: nand_do_read_oob: from = 0x09780000, len = 64
[   35.571416] marvell-nfc pxa3xx-nand: 
[   35.571416] NDCR:  0x9d079fff
[   35.571416] NDCB0: 0x000d3000
[   35.571416] NDCB1: 0x2f000000
[   35.571416] NDCB2: 0x00000001
[   35.571416] NDCB3: 0x00000000
[   35.590347] nand: nand_do_read_oob: from = 0x097a0000, len = 64
[   35.596376] marvell-nfc pxa3xx-nand: 
[   35.596376] NDCR:  0x9d079fff
[   35.596376] NDCB0: 0x000d3000
[   35.596376] NDCB1: 0x2f400000
[   35.596376] NDCB2: 0x00000001
[   35.596376] NDCB3: 0x00000000
[   35.615311] nand: nand_do_read_oob: from = 0x097c0000, len = 64
[   35.621514] marvell-nfc pxa3xx-nand: 
[   35.621514] NDCR:  0x9d079fff
[   35.621514] NDCB0: 0x000d3000
[   35.621514] NDCB1: 0x2f800000
[   35.621514] NDCB2: 0x00000001
[   35.621514] NDCB3: 0x00000000
[   35.640446] nand: nand_do_read_oob: from = 0x097e0000, len = 64
[   35.646475] marvell-nfc pxa3xx-nand: 
[   35.646475] NDCR:  0x9d079fff
[   35.646475] NDCB0: 0x000d3000
[   35.646475] NDCB1: 0x2fc00000
[   35.646475] NDCB2: 0x00000001
[   35.646475] NDCB3: 0x00000000
[   35.665411] nand: nand_do_read_oob: from = 0x09800000, len = 64
[   35.671612] marvell-nfc pxa3xx-nand: 
[   35.671612] NDCR:  0x9d079fff
[   35.671612] NDCB0: 0x000d3000
[   35.671612] NDCB1: 0x30000000
[   35.671612] NDCB2: 0x00000001
[   35.671612] NDCB3: 0x00000000
[   35.690545] nand: nand_do_read_oob: from = 0x09820000, len = 64
[   35.696573] marvell-nfc pxa3xx-nand: 
[   35.696573] NDCR:  0x9d079fff
[   35.696573] NDCB0: 0x000d3000
[   35.696573] NDCB1: 0x30400000
[   35.696573] NDCB2: 0x00000001
[   35.696573] NDCB3: 0x00000000
[   35.715507] nand: nand_do_read_oob: from = 0x09840000, len = 64
[   35.721712] marvell-nfc pxa3xx-nand: 
[   35.721712] NDCR:  0x9d079fff
[   35.721712] NDCB0: 0x000d3000
[   35.721712] NDCB1: 0x30800000
[   35.721712] NDCB2: 0x00000001
[   35.721712] NDCB3: 0x00000000
[   35.740641] nand: nand_do_read_oob: from = 0x09860000, len = 64
[   35.746673] marvell-nfc pxa3xx-nand: 
[   35.746673] NDCR:  0x9d079fff
[   35.746673] NDCB0: 0x000d3000
[   35.746673] NDCB1: 0x30c00000
[   35.746673] NDCB2: 0x00000001
[   35.746673] NDCB3: 0x00000000
[   35.765607] nand: nand_do_read_oob: from = 0x09880000, len = 64
[   35.771811] marvell-nfc pxa3xx-nand: 
[   35.771811] NDCR:  0x9d079fff
[   35.771811] NDCB0: 0x000d3000
[   35.771811] NDCB1: 0x31000000
[   35.771811] NDCB2: 0x00000001
[   35.771811] NDCB3: 0x00000000
[   35.790740] nand: nand_do_read_oob: from = 0x098a0000, len = 64
[   35.796771] marvell-nfc pxa3xx-nand: 
[   35.796771] NDCR:  0x9d079fff
[   35.796771] NDCB0: 0x000d3000
[   35.796771] NDCB1: 0x31400000
[   35.796771] NDCB2: 0x00000001
[   35.796771] NDCB3: 0x00000000
[   35.815706] nand: nand_do_read_oob: from = 0x098c0000, len = 64
[   35.821908] marvell-nfc pxa3xx-nand: 
[   35.821908] NDCR:  0x9d079fff
[   35.821908] NDCB0: 0x000d3000
[   35.821908] NDCB1: 0x31800000
[   35.821908] NDCB2: 0x00000001
[   35.821908] NDCB3: 0x00000000
[   35.840839] nand: nand_do_read_oob: from = 0x098e0000, len = 64
[   35.846869] marvell-nfc pxa3xx-nand: 
[   35.846869] NDCR:  0x9d079fff
[   35.846869] NDCB0: 0x000d3000
[   35.846869] NDCB1: 0x31c00000
[   35.846869] NDCB2: 0x00000001
[   35.846869] NDCB3: 0x00000000
[   35.865801] nand: nand_do_read_oob: from = 0x09900000, len = 64
[   35.872006] marvell-nfc pxa3xx-nand: 
[   35.872006] NDCR:  0x9d079fff
[   35.872006] NDCB0: 0x000d3000
[   35.872006] NDCB1: 0x32000000
[   35.872006] NDCB2: 0x00000001
[   35.872006] NDCB3: 0x00000000
[   35.890935] nand: nand_do_read_oob: from = 0x09920000, len = 64
[   35.896967] marvell-nfc pxa3xx-nand: 
[   35.896967] NDCR:  0x9d079fff
[   35.896967] NDCB0: 0x000d3000
[   35.896967] NDCB1: 0x32400000
[   35.896967] NDCB2: 0x00000001
[   35.896967] NDCB3: 0x00000000
[   35.915916] nand: nand_do_read_oob: from = 0x09940000, len = 64
[   35.922125] marvell-nfc pxa3xx-nand: 
[   35.922125] NDCR:  0x9d079fff
[   35.922125] NDCB0: 0x000d3000
[   35.922125] NDCB1: 0x32800000
[   35.922125] NDCB2: 0x00000001
[   35.922125] NDCB3: 0x00000000
[   35.941052] nand: nand_do_read_oob: from = 0x09960000, len = 64
[   35.947084] marvell-nfc pxa3xx-nand: 
[   35.947084] NDCR:  0x9d079fff
[   35.947084] NDCB0: 0x000d3000
[   35.947084] NDCB1: 0x32c00000
[   35.947084] NDCB2: 0x00000001
[   35.947084] NDCB3: 0x00000000
[   35.966015] nand: nand_do_read_oob: from = 0x09980000, len = 64
[   35.972215] marvell-nfc pxa3xx-nand: 
[   35.972215] NDCR:  0x9d079fff
[   35.972215] NDCB0: 0x000d3000
[   35.972215] NDCB1: 0x33000000
[   35.972215] NDCB2: 0x00000001
[   35.972215] NDCB3: 0x00000000
[   35.991142] nand: nand_do_read_oob: from = 0x099a0000, len = 64
[   35.997172] marvell-nfc pxa3xx-nand: 
[   35.997172] NDCR:  0x9d079fff
[   35.997172] NDCB0: 0x000d3000
[   35.997172] NDCB1: 0x33400000
[   35.997172] NDCB2: 0x00000001
[   35.997172] NDCB3: 0x00000000
[   36.016114] nand: nand_do_read_oob: from = 0x099c0000, len = 64
[   36.022320] marvell-nfc pxa3xx-nand: 
[   36.022320] NDCR:  0x9d079fff
[   36.022320] NDCB0: 0x000d3000
[   36.022320] NDCB1: 0x33800000
[   36.022320] NDCB2: 0x00000001
[   36.022320] NDCB3: 0x00000000
[   36.041247] nand: nand_do_read_oob: from = 0x099e0000, len = 64
[   36.047280] marvell-nfc pxa3xx-nand: 
[   36.047280] NDCR:  0x9d079fff
[   36.047280] NDCB0: 0x000d3000
[   36.047280] NDCB1: 0x33c00000
[   36.047280] NDCB2: 0x00000001
[   36.047280] NDCB3: 0x00000000
[   36.066215] nand: nand_do_read_oob: from = 0x09a00000, len = 64
[   36.072419] marvell-nfc pxa3xx-nand: 
[   36.072419] NDCR:  0x9d079fff
[   36.072419] NDCB0: 0x000d3000
[   36.072419] NDCB1: 0x34000000
[   36.072419] NDCB2: 0x00000001
[   36.072419] NDCB3: 0x00000000
[   36.091682] nand: nand_do_read_oob: from = 0x09a20000, len = 64
[   36.097730] marvell-nfc pxa3xx-nand: 
[   36.097730] NDCR:  0x9d079fff
[   36.097730] NDCB0: 0x000d3000
[   36.097730] NDCB1: 0x34400000
[   36.097730] NDCB2: 0x00000001
[   36.097730] NDCB3: 0x00000000
[   36.116690] nand: nand_do_read_oob: from = 0x09a40000, len = 64
[   36.122887] marvell-nfc pxa3xx-nand: 
[   36.122887] NDCR:  0x9d079fff
[   36.122887] NDCB0: 0x000d3000
[   36.122887] NDCB1: 0x34800000
[   36.122887] NDCB2: 0x00000001
[   36.122887] NDCB3: 0x00000000
[   36.141817] nand: nand_do_read_oob: from = 0x09a60000, len = 64
[   36.147849] marvell-nfc pxa3xx-nand: 
[   36.147849] NDCR:  0x9d079fff
[   36.147849] NDCB0: 0x000d3000
[   36.147849] NDCB1: 0x34c00000
[   36.147849] NDCB2: 0x00000001
[   36.147849] NDCB3: 0x00000000
[   36.166783] nand: nand_do_read_oob: from = 0x09a80000, len = 64
[   36.172987] marvell-nfc pxa3xx-nand: 
[   36.172987] NDCR:  0x9d079fff
[   36.172987] NDCB0: 0x000d3000
[   36.172987] NDCB1: 0x35000000
[   36.172987] NDCB2: 0x00000001
[   36.172987] NDCB3: 0x00000000
[   36.191915] nand: nand_do_read_oob: from = 0x09aa0000, len = 64
[   36.197947] marvell-nfc pxa3xx-nand: 
[   36.197947] NDCR:  0x9d079fff
[   36.197947] NDCB0: 0x000d3000
[   36.197947] NDCB1: 0x35400000
[   36.197947] NDCB2: 0x00000001
[   36.197947] NDCB3: 0x00000000
[   36.216879] nand: nand_do_read_oob: from = 0x09ac0000, len = 64
[   36.223085] marvell-nfc pxa3xx-nand: 
[   36.223085] NDCR:  0x9d079fff
[   36.223085] NDCB0: 0x000d3000
[   36.223085] NDCB1: 0x35800000
[   36.223085] NDCB2: 0x00000001
[   36.223085] NDCB3: 0x00000000
[   36.242014] nand: nand_do_read_oob: from = 0x09ae0000, len = 64
[   36.248045] marvell-nfc pxa3xx-nand: 
[   36.248045] NDCR:  0x9d079fff
[   36.248045] NDCB0: 0x000d3000
[   36.248045] NDCB1: 0x35c00000
[   36.248045] NDCB2: 0x00000001
[   36.248045] NDCB3: 0x00000000
[   36.266980] nand: nand_do_read_oob: from = 0x09b00000, len = 64
[   36.273183] marvell-nfc pxa3xx-nand: 
[   36.273183] NDCR:  0x9d079fff
[   36.273183] NDCB0: 0x000d3000
[   36.273183] NDCB1: 0x36000000
[   36.273183] NDCB2: 0x00000001
[   36.273183] NDCB3: 0x00000000
[   36.292111] nand: nand_do_read_oob: from = 0x09b20000, len = 64
[   36.298145] marvell-nfc pxa3xx-nand: 
[   36.298145] NDCR:  0x9d079fff
[   36.298145] NDCB0: 0x000d3000
[   36.298145] NDCB1: 0x36400000
[   36.298145] NDCB2: 0x00000001
[   36.298145] NDCB3: 0x00000000
[   36.317079] nand: nand_do_read_oob: from = 0x09b40000, len = 64
[   36.323283] marvell-nfc pxa3xx-nand: 
[   36.323283] NDCR:  0x9d079fff
[   36.323283] NDCB0: 0x000d3000
[   36.323283] NDCB1: 0x36800000
[   36.323283] NDCB2: 0x00000001
[   36.323283] NDCB3: 0x00000000
[   36.342211] nand: nand_do_read_oob: from = 0x09b60000, len = 64
[   36.348241] marvell-nfc pxa3xx-nand: 
[   36.348241] NDCR:  0x9d079fff
[   36.348241] NDCB0: 0x000d3000
[   36.348241] NDCB1: 0x36c00000
[   36.348241] NDCB2: 0x00000001
[   36.348241] NDCB3: 0x00000000
[   36.367173] nand: nand_do_read_oob: from = 0x09b80000, len = 64
[   36.373371] marvell-nfc pxa3xx-nand: 
[   36.373371] NDCR:  0x9d079fff
[   36.373371] NDCB0: 0x000d3000
[   36.373371] NDCB1: 0x37000000
[   36.373371] NDCB2: 0x00000001
[   36.373371] NDCB3: 0x00000000
[   36.392299] nand: nand_do_read_oob: from = 0x09ba0000, len = 64
[   36.398332] marvell-nfc pxa3xx-nand: 
[   36.398332] NDCR:  0x9d079fff
[   36.398332] NDCB0: 0x000d3000
[   36.398332] NDCB1: 0x37400000
[   36.398332] NDCB2: 0x00000001
[   36.398332] NDCB3: 0x00000000
[   36.417264] nand: nand_do_read_oob: from = 0x09bc0000, len = 64
[   36.423471] marvell-nfc pxa3xx-nand: 
[   36.423471] NDCR:  0x9d079fff
[   36.423471] NDCB0: 0x000d3000
[   36.423471] NDCB1: 0x37800000
[   36.423471] NDCB2: 0x00000001
[   36.423471] NDCB3: 0x00000000
[   36.442400] nand: nand_do_read_oob: from = 0x09be0000, len = 64
[   36.448429] marvell-nfc pxa3xx-nand: 
[   36.448429] NDCR:  0x9d079fff
[   36.448429] NDCB0: 0x000d3000
[   36.448429] NDCB1: 0x37c00000
[   36.448429] NDCB2: 0x00000001
[   36.448429] NDCB3: 0x00000000
[   36.467366] nand: nand_do_read_oob: from = 0x09c00000, len = 64
[   36.473569] marvell-nfc pxa3xx-nand: 
[   36.473569] NDCR:  0x9d079fff
[   36.473569] NDCB0: 0x000d3000
[   36.473569] NDCB1: 0x38000000
[   36.473569] NDCB2: 0x00000001
[   36.473569] NDCB3: 0x00000000
[   36.492498] nand: nand_do_read_oob: from = 0x09c20000, len = 64
[   36.498529] marvell-nfc pxa3xx-nand: 
[   36.498529] NDCR:  0x9d079fff
[   36.498529] NDCB0: 0x000d3000
[   36.498529] NDCB1: 0x38400000
[   36.498529] NDCB2: 0x00000001
[   36.498529] NDCB3: 0x00000000
[   36.517459] nand: nand_do_read_oob: from = 0x09c40000, len = 64
[   36.523659] marvell-nfc pxa3xx-nand: 
[   36.523659] NDCR:  0x9d079fff
[   36.523659] NDCB0: 0x000d3000
[   36.523659] NDCB1: 0x38800000
[   36.523659] NDCB2: 0x00000001
[   36.523659] NDCB3: 0x00000000
[   36.542587] nand: nand_do_read_oob: from = 0x09c60000, len = 64
[   36.548618] marvell-nfc pxa3xx-nand: 
[   36.548618] NDCR:  0x9d079fff
[   36.548618] NDCB0: 0x000d3000
[   36.548618] NDCB1: 0x38c00000
[   36.548618] NDCB2: 0x00000001
[   36.548618] NDCB3: 0x00000000
[   36.567690] nand: nand_do_read_oob: from = 0x09c80000, len = 64
[   36.573895] marvell-nfc pxa3xx-nand: 
[   36.573895] NDCR:  0x9d079fff
[   36.573895] NDCB0: 0x000d3000
[   36.573895] NDCB1: 0x39000000
[   36.573895] NDCB2: 0x00000001
[   36.573895] NDCB3: 0x00000000
[   36.592823] nand: nand_do_read_oob: from = 0x09ca0000, len = 64
[   36.599025] marvell-nfc pxa3xx-nand: 
[   36.599025] NDCR:  0x9d079fff
[   36.599025] NDCB0: 0x000d3000
[   36.599025] NDCB1: 0x39400000
[   36.599025] NDCB2: 0x00000001
[   36.599025] NDCB3: 0x00000000
[   36.617945] nand: nand_do_read_oob: from = 0x09cc0000, len = 64
[   36.624147] marvell-nfc pxa3xx-nand: 
[   36.624147] NDCR:  0x9d079fff
[   36.624147] NDCB0: 0x000d3000
[   36.624147] NDCB1: 0x39800000
[   36.624147] NDCB2: 0x00000001
[   36.624147] NDCB3: 0x00000000
[   36.643076] nand: nand_do_read_oob: from = 0x09ce0000, len = 64
[   36.649278] marvell-nfc pxa3xx-nand: 
[   36.649278] NDCR:  0x9d079fff
[   36.649278] NDCB0: 0x000d3000
[   36.649278] NDCB1: 0x39c00000
[   36.649278] NDCB2: 0x00000001
[   36.649278] NDCB3: 0x00000000
[   36.668199] nand: nand_do_read_oob: from = 0x09d00000, len = 64
[   36.674401] marvell-nfc pxa3xx-nand: 
[   36.674401] NDCR:  0x9d079fff
[   36.674401] NDCB0: 0x000d3000
[   36.674401] NDCB1: 0x3a000000
[   36.674401] NDCB2: 0x00000001
[   36.674401] NDCB3: 0x00000000
[   36.693332] nand: nand_do_read_oob: from = 0x09d20000, len = 64
[   36.699531] marvell-nfc pxa3xx-nand: 
[   36.699531] NDCR:  0x9d079fff
[   36.699531] NDCB0: 0x000d3000
[   36.699531] NDCB1: 0x3a400000
[   36.699531] NDCB2: 0x00000001
[   36.699531] NDCB3: 0x00000000
[   36.718454] nand: nand_do_read_oob: from = 0x09d40000, len = 64
[   36.724654] marvell-nfc pxa3xx-nand: 
[   36.724654] NDCR:  0x9d079fff
[   36.724654] NDCB0: 0x000d3000
[   36.724654] NDCB1: 0x3a800000
[   36.724654] NDCB2: 0x00000001
[   36.724654] NDCB3: 0x00000000
[   36.743583] nand: nand_do_read_oob: from = 0x09d60000, len = 64
[   36.749786] marvell-nfc pxa3xx-nand: 
[   36.749786] NDCR:  0x9d079fff
[   36.749786] NDCB0: 0x000d3000
[   36.749786] NDCB1: 0x3ac00000
[   36.749786] NDCB2: 0x00000001
[   36.749786] NDCB3: 0x00000000
[   36.768912] nand: nand_do_read_oob: from = 0x09d80000, len = 64
[   36.774959] marvell-nfc pxa3xx-nand: 
[   36.774959] NDCR:  0x9d079fff
[   36.774959] NDCB0: 0x000d3000
[   36.774959] NDCB1: 0x3b000000
[   36.774959] NDCB2: 0x00000001
[   36.774959] NDCB3: 0x00000000
[   36.793907] nand: nand_do_read_oob: from = 0x09da0000, len = 64
[   36.800109] marvell-nfc pxa3xx-nand: 
[   36.800109] NDCR:  0x9d079fff
[   36.800109] NDCB0: 0x000d3000
[   36.800109] NDCB1: 0x3b400000
[   36.800109] NDCB2: 0x00000001
[   36.800109] NDCB3: 0x00000000
[   36.819035] nand: nand_do_read_oob: from = 0x09dc0000, len = 64
[   36.825070] marvell-nfc pxa3xx-nand: 
[   36.825070] NDCR:  0x9d079fff
[   36.825070] NDCB0: 0x000d3000
[   36.825070] NDCB1: 0x3b800000
[   36.825070] NDCB2: 0x00000001
[   36.825070] NDCB3: 0x00000000
[   36.844002] nand: nand_do_read_oob: from = 0x09de0000, len = 64
[   36.850208] marvell-nfc pxa3xx-nand: 
[   36.850208] NDCR:  0x9d079fff
[   36.850208] NDCB0: 0x000d3000
[   36.850208] NDCB1: 0x3bc00000
[   36.850208] NDCB2: 0x00000001
[   36.850208] NDCB3: 0x00000000
[   36.869133] nand: nand_do_read_oob: from = 0x09e00000, len = 64
[   36.875168] marvell-nfc pxa3xx-nand: 
[   36.875168] NDCR:  0x9d079fff
[   36.875168] NDCB0: 0x000d3000
[   36.875168] NDCB1: 0x3c000000
[   36.875168] NDCB2: 0x00000001
[   36.875168] NDCB3: 0x00000000
[   36.894099] nand: nand_do_read_oob: from = 0x09e20000, len = 64
[   36.900295] marvell-nfc pxa3xx-nand: 
[   36.900295] NDCR:  0x9d079fff
[   36.900295] NDCB0: 0x000d3000
[   36.900295] NDCB1: 0x3c400000
[   36.900295] NDCB2: 0x00000001
[   36.900295] NDCB3: 0x00000000
[   36.919223] nand: nand_do_read_oob: from = 0x09e40000, len = 64
[   36.925258] marvell-nfc pxa3xx-nand: 
[   36.925258] NDCR:  0x9d079fff
[   36.925258] NDCB0: 0x000d3000
[   36.925258] NDCB1: 0x3c800000
[   36.925258] NDCB2: 0x00000001
[   36.925258] NDCB3: 0x00000000
[   36.944188] nand: nand_do_read_oob: from = 0x09e60000, len = 64
[   36.950386] marvell-nfc pxa3xx-nand: 
[   36.950386] NDCR:  0x9d079fff
[   36.950386] NDCB0: 0x000d3000
[   36.950386] NDCB1: 0x3cc00000
[   36.950386] NDCB2: 0x00000001
[   36.950386] NDCB3: 0x00000000
[   36.969314] nand: nand_do_read_oob: from = 0x09e80000, len = 64
[   36.975347] marvell-nfc pxa3xx-nand: 
[   36.975347] NDCR:  0x9d079fff
[   36.975347] NDCB0: 0x000d3000
[   36.975347] NDCB1: 0x3d000000
[   36.975347] NDCB2: 0x00000001
[   36.975347] NDCB3: 0x00000000
[   36.994281] nand: nand_do_read_oob: from = 0x09ea0000, len = 64
[   37.000486] marvell-nfc pxa3xx-nand: 
[   37.000486] NDCR:  0x9d079fff
[   37.000486] NDCB0: 0x000d3000
[   37.000486] NDCB1: 0x3d400000
[   37.000486] NDCB2: 0x00000001
[   37.000486] NDCB3: 0x00000000
[   37.019428] nand: nand_do_read_oob: from = 0x09ec0000, len = 64
[   37.025464] marvell-nfc pxa3xx-nand: 
[   37.025464] NDCR:  0x9d079fff
[   37.025464] NDCB0: 0x000d3000
[   37.025464] NDCB1: 0x3d800000
[   37.025464] NDCB2: 0x00000001
[   37.025464] NDCB3: 0x00000000
[   37.044401] nand: nand_do_read_oob: from = 0x09ee0000, len = 64
[   37.050603] marvell-nfc pxa3xx-nand: 
[   37.050603] NDCR:  0x9d079fff
[   37.050603] NDCB0: 0x000d3000
[   37.050603] NDCB1: 0x3dc00000
[   37.050603] NDCB2: 0x00000001
[   37.050603] NDCB3: 0x00000000
[   37.069528] nand: nand_do_read_oob: from = 0x09f00000, len = 64
[   37.075561] marvell-nfc pxa3xx-nand: 
[   37.075561] NDCR:  0x9d079fff
[   37.075561] NDCB0: 0x000d3000
[   37.075561] NDCB1: 0x3e000000
[   37.075561] NDCB2: 0x00000001
[   37.075561] NDCB3: 0x00000000
[   37.094492] nand: nand_do_read_oob: from = 0x09f20000, len = 64
[   37.100701] marvell-nfc pxa3xx-nand: 
[   37.100701] NDCR:  0x9d079fff
[   37.100701] NDCB0: 0x000d3000
[   37.100701] NDCB1: 0x3e400000
[   37.100701] NDCB2: 0x00000001
[   37.100701] NDCB3: 0x00000000
[   37.119627] nand: nand_do_read_oob: from = 0x09f40000, len = 64
[   37.125661] marvell-nfc pxa3xx-nand: 
[   37.125661] NDCR:  0x9d079fff
[   37.125661] NDCB0: 0x000d3000
[   37.125661] NDCB1: 0x3e800000
[   37.125661] NDCB2: 0x00000001
[   37.125661] NDCB3: 0x00000000
[   37.144615] nand: nand_do_read_oob: from = 0x09f60000, len = 64
[   37.150818] marvell-nfc pxa3xx-nand: 
[   37.150818] NDCR:  0x9d079fff
[   37.150818] NDCB0: 0x000d3000
[   37.150818] NDCB1: 0x3ec00000
[   37.150818] NDCB2: 0x00000001
[   37.150818] NDCB3: 0x00000000
[   37.169746] nand: nand_do_read_oob: from = 0x09f80000, len = 64
[   37.175775] marvell-nfc pxa3xx-nand: 
[   37.175775] NDCR:  0x9d079fff
[   37.175775] NDCB0: 0x000d3000
[   37.175775] NDCB1: 0x3f000000
[   37.175775] NDCB2: 0x00000001
[   37.175775] NDCB3: 0x00000000
[   37.194708] nand: nand_do_read_oob: from = 0x09fa0000, len = 64
[   37.200914] marvell-nfc pxa3xx-nand: 
[   37.200914] NDCR:  0x9d079fff
[   37.200914] NDCB0: 0x000d3000
[   37.200914] NDCB1: 0x3f400000
[   37.200914] NDCB2: 0x00000001
[   37.200914] NDCB3: 0x00000000
[   37.219841] nand: nand_do_read_oob: from = 0x09fc0000, len = 64
[   37.225873] marvell-nfc pxa3xx-nand: 
[   37.225873] NDCR:  0x9d079fff
[   37.225873] NDCB0: 0x000d3000
[   37.225873] NDCB1: 0x3f800000
[   37.225873] NDCB2: 0x00000001
[   37.225873] NDCB3: 0x00000000
[   37.244805] nand: nand_do_read_oob: from = 0x09fe0000, len = 64
[   37.251015] marvell-nfc pxa3xx-nand: 
[   37.251015] NDCR:  0x9d079fff
[   37.251015] NDCB0: 0x000d3000
[   37.251015] NDCB1: 0x3fc00000
[   37.251015] NDCB2: 0x00000001
[   37.251015] NDCB3: 0x00000000
[   37.269942] nand: nand_do_read_oob: from = 0x0a000000, len = 64
[   37.275972] marvell-nfc pxa3xx-nand: 
[   37.275972] NDCR:  0x9d079fff
[   37.275972] NDCB0: 0x000d3000
[   37.275972] NDCB1: 0x40000000
[   37.275972] NDCB2: 0x00000001
[   37.275972] NDCB3: 0x00000000
[   37.294904] nand: nand_do_read_oob: from = 0x0a020000, len = 64
[   37.301112] marvell-nfc pxa3xx-nand: 
[   37.301112] NDCR:  0x9d079fff
[   37.301112] NDCB0: 0x000d3000
[   37.301112] NDCB1: 0x40400000
[   37.301112] NDCB2: 0x00000001
[   37.301112] NDCB3: 0x00000000
[   37.320038] nand: nand_do_read_oob: from = 0x0a040000, len = 64
[   37.326070] marvell-nfc pxa3xx-nand: 
[   37.326070] NDCR:  0x9d079fff
[   37.326070] NDCB0: 0x000d3000
[   37.326070] NDCB1: 0x40800000
[   37.326070] NDCB2: 0x00000001
[   37.326070] NDCB3: 0x00000000
[   37.345001] nand: nand_do_read_oob: from = 0x0a060000, len = 64
[   37.351202] marvell-nfc pxa3xx-nand: 
[   37.351202] NDCR:  0x9d079fff
[   37.351202] NDCB0: 0x000d3000
[   37.351202] NDCB1: 0x40c00000
[   37.351202] NDCB2: 0x00000001
[   37.351202] NDCB3: 0x00000000
[   37.370131] nand: nand_do_read_oob: from = 0x0a080000, len = 64
[   37.376160] marvell-nfc pxa3xx-nand: 
[   37.376160] NDCR:  0x9d079fff
[   37.376160] NDCB0: 0x000d3000
[   37.376160] NDCB1: 0x41000000
[   37.376160] NDCB2: 0x00000001
[   37.376160] NDCB3: 0x00000000
[   37.395091] nand: nand_do_read_oob: from = 0x0a0a0000, len = 64
[   37.401299] marvell-nfc pxa3xx-nand: 
[   37.401299] NDCR:  0x9d079fff
[   37.401299] NDCB0: 0x000d3000
[   37.401299] NDCB1: 0x41400000
[   37.401299] NDCB2: 0x00000001
[   37.401299] NDCB3: 0x00000000
[   37.420226] nand: nand_do_read_oob: from = 0x0a0c0000, len = 64
[   37.426258] marvell-nfc pxa3xx-nand: 
[   37.426258] NDCR:  0x9d079fff
[   37.426258] NDCB0: 0x000d3000
[   37.426258] NDCB1: 0x41800000
[   37.426258] NDCB2: 0x00000001
[   37.426258] NDCB3: 0x00000000
[   37.445191] nand: nand_do_read_oob: from = 0x0a0e0000, len = 64
[   37.451388] marvell-nfc pxa3xx-nand: 
[   37.451388] NDCR:  0x9d079fff
[   37.451388] NDCB0: 0x000d3000
[   37.451388] NDCB1: 0x41c00000
[   37.451388] NDCB2: 0x00000001
[   37.451388] NDCB3: 0x00000000
[   37.470319] nand: nand_do_read_oob: from = 0x0a100000, len = 64
[   37.476349] marvell-nfc pxa3xx-nand: 
[   37.476349] NDCR:  0x9d079fff
[   37.476349] NDCB0: 0x000d3000
[   37.476349] NDCB1: 0x42000000
[   37.476349] NDCB2: 0x00000001
[   37.476349] NDCB3: 0x00000000
[   37.495281] nand: nand_do_read_oob: from = 0x0a120000, len = 64
[   37.501487] marvell-nfc pxa3xx-nand: 
[   37.501487] NDCR:  0x9d079fff
[   37.501487] NDCB0: 0x000d3000
[   37.501487] NDCB1: 0x42400000
[   37.501487] NDCB2: 0x00000001
[   37.501487] NDCB3: 0x00000000
[   37.520417] nand: nand_do_read_oob: from = 0x0a140000, len = 64
[   37.526448] marvell-nfc pxa3xx-nand: 
[   37.526448] NDCR:  0x9d079fff
[   37.526448] NDCB0: 0x000d3000
[   37.526448] NDCB1: 0x42800000
[   37.526448] NDCB2: 0x00000001
[   37.526448] NDCB3: 0x00000000
[   37.545379] nand: nand_do_read_oob: from = 0x0a160000, len = 64
[   37.551584] marvell-nfc pxa3xx-nand: 
[   37.551584] NDCR:  0x9d079fff
[   37.551584] NDCB0: 0x000d3000
[   37.551584] NDCB1: 0x42c00000
[   37.551584] NDCB2: 0x00000001
[   37.551584] NDCB3: 0x00000000
[   37.570514] nand: nand_do_read_oob: from = 0x0a180000, len = 64
[   37.576546] marvell-nfc pxa3xx-nand: 
[   37.576546] NDCR:  0x9d079fff
[   37.576546] NDCB0: 0x000d3000
[   37.576546] NDCB1: 0x43000000
[   37.576546] NDCB2: 0x00000001
[   37.576546] NDCB3: 0x00000000
[   37.595477] nand: nand_do_read_oob: from = 0x0a1a0000, len = 64
[   37.601676] marvell-nfc pxa3xx-nand: 
[   37.601676] NDCR:  0x9d079fff
[   37.601676] NDCB0: 0x000d3000
[   37.601676] NDCB1: 0x43400000
[   37.601676] NDCB2: 0x00000001
[   37.601676] NDCB3: 0x00000000
[   37.620605] nand: nand_do_read_oob: from = 0x0a1c0000, len = 64
[   37.626635] marvell-nfc pxa3xx-nand: 
[   37.626635] NDCR:  0x9d079fff
[   37.626635] NDCB0: 0x000d3000
[   37.626635] NDCB1: 0x43800000
[   37.626635] NDCB2: 0x00000001
[   37.626635] NDCB3: 0x00000000
[   37.645567] nand: nand_do_read_oob: from = 0x0a1e0000, len = 64
[   37.651764] marvell-nfc pxa3xx-nand: 
[   37.651764] NDCR:  0x9d079fff
[   37.651764] NDCB0: 0x000d3000
[   37.651764] NDCB1: 0x43c00000
[   37.651764] NDCB2: 0x00000001
[   37.651764] NDCB3: 0x00000000
[   37.670692] nand: nand_do_read_oob: from = 0x0a200000, len = 64
[   37.676724] marvell-nfc pxa3xx-nand: 
[   37.676724] NDCR:  0x9d079fff
[   37.676724] NDCB0: 0x000d3000
[   37.676724] NDCB1: 0x44000000
[   37.676724] NDCB2: 0x00000001
[   37.676724] NDCB3: 0x00000000
[   37.695659] nand: nand_do_read_oob: from = 0x0a220000, len = 64
[   37.701863] marvell-nfc pxa3xx-nand: 
[   37.701863] NDCR:  0x9d079fff
[   37.701863] NDCB0: 0x000d3000
[   37.701863] NDCB1: 0x44400000
[   37.701863] NDCB2: 0x00000001
[   37.701863] NDCB3: 0x00000000
[   37.720792] nand: nand_do_read_oob: from = 0x0a240000, len = 64
[   37.726824] marvell-nfc pxa3xx-nand: 
[   37.726824] NDCR:  0x9d079fff
[   37.726824] NDCB0: 0x000d3000
[   37.726824] NDCB1: 0x44800000
[   37.726824] NDCB2: 0x00000001
[   37.726824] NDCB3: 0x00000000
[   37.745757] nand: nand_do_read_oob: from = 0x0a260000, len = 64
[   37.751963] marvell-nfc pxa3xx-nand: 
[   37.751963] NDCR:  0x9d079fff
[   37.751963] NDCB0: 0x000d3000
[   37.751963] NDCB1: 0x44c00000
[   37.751963] NDCB2: 0x00000001
[   37.751963] NDCB3: 0x00000000
[   37.770891] nand: nand_do_read_oob: from = 0x0a280000, len = 64
[   37.776922] marvell-nfc pxa3xx-nand: 
[   37.776922] NDCR:  0x9d079fff
[   37.776922] NDCB0: 0x000d3000
[   37.776922] NDCB1: 0x45000000
[   37.776922] NDCB2: 0x00000001
[   37.776922] NDCB3: 0x00000000
[   37.795872] nand: nand_do_read_oob: from = 0x0a2a0000, len = 64
[   37.802078] marvell-nfc pxa3xx-nand: 
[   37.802078] NDCR:  0x9d079fff
[   37.802078] NDCB0: 0x000d3000
[   37.802078] NDCB1: 0x45400000
[   37.802078] NDCB2: 0x00000001
[   37.802078] NDCB3: 0x00000000
[   37.821010] nand: nand_do_read_oob: from = 0x0a2c0000, len = 64
[   37.827038] marvell-nfc pxa3xx-nand: 
[   37.827038] NDCR:  0x9d079fff
[   37.827038] NDCB0: 0x000d3000
[   37.827038] NDCB1: 0x45800000
[   37.827038] NDCB2: 0x00000001
[   37.827038] NDCB3: 0x00000000
[   37.845971] nand: nand_do_read_oob: from = 0x0a2e0000, len = 64
[   37.852176] marvell-nfc pxa3xx-nand: 
[   37.852176] NDCR:  0x9d079fff
[   37.852176] NDCB0: 0x000d3000
[   37.852176] NDCB1: 0x45c00000
[   37.852176] NDCB2: 0x00000001
[   37.852176] NDCB3: 0x00000000
[   37.871105] nand: nand_do_read_oob: from = 0x0a300000, len = 64
[   37.877136] marvell-nfc pxa3xx-nand: 
[   37.877136] NDCR:  0x9d079fff
[   37.877136] NDCB0: 0x000d3000
[   37.877136] NDCB1: 0x46000000
[   37.877136] NDCB2: 0x00000001
[   37.877136] NDCB3: 0x00000000
[   37.896069] nand: nand_do_read_oob: from = 0x0a320000, len = 64
[   37.902275] marvell-nfc pxa3xx-nand: 
[   37.902275] NDCR:  0x9d079fff
[   37.902275] NDCB0: 0x000d3000
[   37.902275] NDCB1: 0x46400000
[   37.902275] NDCB2: 0x00000001
[   37.902275] NDCB3: 0x00000000
[   37.921202] nand: nand_do_read_oob: from = 0x0a340000, len = 64
[   37.927235] marvell-nfc pxa3xx-nand: 
[   37.927235] NDCR:  0x9d079fff
[   37.927235] NDCB0: 0x000d3000
[   37.927235] NDCB1: 0x46800000
[   37.927235] NDCB2: 0x00000001
[   37.927235] NDCB3: 0x00000000
[   37.946167] nand: nand_do_read_oob: from = 0x0a360000, len = 64
[   37.952371] marvell-nfc pxa3xx-nand: 
[   37.952371] NDCR:  0x9d079fff
[   37.952371] NDCB0: 0x000d3000
[   37.952371] NDCB1: 0x46c00000
[   37.952371] NDCB2: 0x00000001
[   37.952371] NDCB3: 0x00000000
[   37.971303] nand: nand_do_read_oob: from = 0x0a380000, len = 64
[   37.977334] marvell-nfc pxa3xx-nand: 
[   37.977334] NDCR:  0x9d079fff
[   37.977334] NDCB0: 0x000d3000
[   37.977334] NDCB1: 0x47000000
[   37.977334] NDCB2: 0x00000001
[   37.977334] NDCB3: 0x00000000
[   37.996265] nand: nand_do_read_oob: from = 0x0a3a0000, len = 64
[   38.002463] marvell-nfc pxa3xx-nand: 
[   38.002463] NDCR:  0x9d079fff
[   38.002463] NDCB0: 0x000d3000
[   38.002463] NDCB1: 0x47400000
[   38.002463] NDCB2: 0x00000001
[   38.002463] NDCB3: 0x00000000
[   38.021403] nand: nand_do_read_oob: from = 0x0a3c0000, len = 64
[   38.027442] marvell-nfc pxa3xx-nand: 
[   38.027442] NDCR:  0x9d079fff
[   38.027442] NDCB0: 0x000d3000
[   38.027442] NDCB1: 0x47800000
[   38.027442] NDCB2: 0x00000001
[   38.027442] NDCB3: 0x00000000
[   38.046374] nand: nand_do_read_oob: from = 0x0a3e0000, len = 64
[   38.052579] marvell-nfc pxa3xx-nand: 
[   38.052579] NDCR:  0x9d079fff
[   38.052579] NDCB0: 0x000d3000
[   38.052579] NDCB1: 0x47c00000
[   38.052579] NDCB2: 0x00000001
[   38.052579] NDCB3: 0x00000000
[   38.071508] nand: nand_do_read_oob: from = 0x0a400000, len = 64
[   38.077538] marvell-nfc pxa3xx-nand: 
[   38.077538] NDCR:  0x9d079fff
[   38.077538] NDCB0: 0x000d3000
[   38.077538] NDCB1: 0x48000000
[   38.077538] NDCB2: 0x00000001
[   38.077538] NDCB3: 0x00000000
[   38.096902] nand: nand_do_read_oob: from = 0x0a420000, len = 64
[   38.103144] marvell-nfc pxa3xx-nand: 
[   38.103144] NDCR:  0x9d079fff
[   38.103144] NDCB0: 0x000d3000
[   38.103144] NDCB1: 0x48400000
[   38.103144] NDCB2: 0x00000001
[   38.103144] NDCB3: 0x00000000
[   38.122080] nand: nand_do_read_oob: from = 0x0a440000, len = 64
[   38.128111] marvell-nfc pxa3xx-nand: 
[   38.128111] NDCR:  0x9d079fff
[   38.128111] NDCB0: 0x000d3000
[   38.128111] NDCB1: 0x48800000
[   38.128111] NDCB2: 0x00000001
[   38.128111] NDCB3: 0x00000000
[   38.147043] nand: nand_do_read_oob: from = 0x0a460000, len = 64
[   38.153250] marvell-nfc pxa3xx-nand: 
[   38.153250] NDCR:  0x9d079fff
[   38.153250] NDCB0: 0x000d3000
[   38.153250] NDCB1: 0x48c00000
[   38.153250] NDCB2: 0x00000001
[   38.153250] NDCB3: 0x00000000
[   38.172179] nand: nand_do_read_oob: from = 0x0a480000, len = 64
[   38.178209] marvell-nfc pxa3xx-nand: 
[   38.178209] NDCR:  0x9d079fff
[   38.178209] NDCB0: 0x000d3000
[   38.178209] NDCB1: 0x49000000
[   38.178209] NDCB2: 0x00000001
[   38.178209] NDCB3: 0x00000000
[   38.197142] nand: nand_do_read_oob: from = 0x0a4a0000, len = 64
[   38.203349] marvell-nfc pxa3xx-nand: 
[   38.203349] NDCR:  0x9d079fff
[   38.203349] NDCB0: 0x000d3000
[   38.203349] NDCB1: 0x49400000
[   38.203349] NDCB2: 0x00000001
[   38.203349] NDCB3: 0x00000000
[   38.222277] nand: nand_do_read_oob: from = 0x0a4c0000, len = 64
[   38.228307] marvell-nfc pxa3xx-nand: 
[   38.228307] NDCR:  0x9d079fff
[   38.228307] NDCB0: 0x000d3000
[   38.228307] NDCB1: 0x49800000
[   38.228307] NDCB2: 0x00000001
[   38.228307] NDCB3: 0x00000000
[   38.247241] nand: nand_do_read_oob: from = 0x0a4e0000, len = 64
[   38.253447] marvell-nfc pxa3xx-nand: 
[   38.253447] NDCR:  0x9d079fff
[   38.253447] NDCB0: 0x000d3000
[   38.253447] NDCB1: 0x49c00000
[   38.253447] NDCB2: 0x00000001
[   38.253447] NDCB3: 0x00000000
[   38.272377] nand: nand_do_read_oob: from = 0x0a500000, len = 64
[   38.278406] marvell-nfc pxa3xx-nand: 
[   38.278406] NDCR:  0x9d079fff
[   38.278406] NDCB0: 0x000d3000
[   38.278406] NDCB1: 0x4a000000
[   38.278406] NDCB2: 0x00000001
[   38.278406] NDCB3: 0x00000000
[   38.297339] nand: nand_do_read_oob: from = 0x0a520000, len = 64
[   38.303545] marvell-nfc pxa3xx-nand: 
[   38.303545] NDCR:  0x9d079fff
[   38.303545] NDCB0: 0x000d3000
[   38.303545] NDCB1: 0x4a400000
[   38.303545] NDCB2: 0x00000001
[   38.303545] NDCB3: 0x00000000
[   38.322475] nand: nand_do_read_oob: from = 0x0a540000, len = 64
[   38.328505] marvell-nfc pxa3xx-nand: 
[   38.328505] NDCR:  0x9d079fff
[   38.328505] NDCB0: 0x000d3000
[   38.328505] NDCB1: 0x4a800000
[   38.328505] NDCB2: 0x00000001
[   38.328505] NDCB3: 0x00000000
[   38.347438] nand: nand_do_read_oob: from = 0x0a560000, len = 64
[   38.353645] marvell-nfc pxa3xx-nand: 
[   38.353645] NDCR:  0x9d079fff
[   38.353645] NDCB0: 0x000d3000
[   38.353645] NDCB1: 0x4ac00000
[   38.353645] NDCB2: 0x00000001
[   38.353645] NDCB3: 0x00000000
[   38.372572] nand: nand_do_read_oob: from = 0x0a580000, len = 64
[   38.378603] marvell-nfc pxa3xx-nand: 
[   38.378603] NDCR:  0x9d079fff
[   38.378603] NDCB0: 0x000d3000
[   38.378603] NDCB1: 0x4b000000
[   38.378603] NDCB2: 0x00000001
[   38.378603] NDCB3: 0x00000000
[   38.397645] nand: nand_do_read_oob: from = 0x0a5a0000, len = 64
[   38.403844] marvell-nfc pxa3xx-nand: 
[   38.403844] NDCR:  0x9d079fff
[   38.403844] NDCB0: 0x000d3000
[   38.403844] NDCB1: 0x4b400000
[   38.403844] NDCB2: 0x00000001
[   38.403844] NDCB3: 0x00000000
[   38.422795] nand: nand_do_read_oob: from = 0x0a5c0000, len = 64
[   38.429001] marvell-nfc pxa3xx-nand: 
[   38.429001] NDCR:  0x9d079fff
[   38.429001] NDCB0: 0x000d3000
[   38.429001] NDCB1: 0x4b800000
[   38.429001] NDCB2: 0x00000001
[   38.429001] NDCB3: 0x00000000
[   38.447922] nand: nand_do_read_oob: from = 0x0a5e0000, len = 64
[   38.454123] marvell-nfc pxa3xx-nand: 
[   38.454123] NDCR:  0x9d079fff
[   38.454123] NDCB0: 0x000d3000
[   38.454123] NDCB1: 0x4bc00000
[   38.454123] NDCB2: 0x00000001
[   38.454123] NDCB3: 0x00000000
[   38.473053] nand: nand_do_read_oob: from = 0x0a600000, len = 64
[   38.479255] marvell-nfc pxa3xx-nand: 
[   38.479255] NDCR:  0x9d079fff
[   38.479255] NDCB0: 0x000d3000
[   38.479255] NDCB1: 0x4c000000
[   38.479255] NDCB2: 0x00000001
[   38.479255] NDCB3: 0x00000000
[   38.498176] nand: nand_do_read_oob: from = 0x0a620000, len = 64
[   38.504375] marvell-nfc pxa3xx-nand: 
[   38.504375] NDCR:  0x9d079fff
[   38.504375] NDCB0: 0x000d3000
[   38.504375] NDCB1: 0x4c400000
[   38.504375] NDCB2: 0x00000001
[   38.504375] NDCB3: 0x00000000
[   38.523300] nand: nand_do_read_oob: from = 0x0a640000, len = 64
[   38.529501] marvell-nfc pxa3xx-nand: 
[   38.529501] NDCR:  0x9d079fff
[   38.529501] NDCB0: 0x000d3000
[   38.529501] NDCB1: 0x4c800000
[   38.529501] NDCB2: 0x00000001
[   38.529501] NDCB3: 0x00000000
[   38.548419] nand: nand_do_read_oob: from = 0x0a660000, len = 64
[   38.554621] marvell-nfc pxa3xx-nand: 
[   38.554621] NDCR:  0x9d079fff
[   38.554621] NDCB0: 0x000d3000
[   38.554621] NDCB1: 0x4cc00000
[   38.554621] NDCB2: 0x00000001
[   38.554621] NDCB3: 0x00000000
[   38.573555] nand: nand_do_read_oob: from = 0x0a680000, len = 64
[   38.579753] marvell-nfc pxa3xx-nand: 
[   38.579753] NDCR:  0x9d079fff
[   38.579753] NDCB0: 0x000d3000
[   38.579753] NDCB1: 0x4d000000
[   38.579753] NDCB2: 0x00000001
[   38.579753] NDCB3: 0x00000000
[   38.598772] nand: nand_do_read_oob: from = 0x0a6a0000, len = 64
[   38.604805] marvell-nfc pxa3xx-nand: 
[   38.604805] NDCR:  0x9d079fff
[   38.604805] NDCB0: 0x000d3000
[   38.604805] NDCB1: 0x4d400000
[   38.604805] NDCB2: 0x00000001
[   38.604805] NDCB3: 0x00000000
[   38.623728] nand: nand_do_read_oob: from = 0x0a6c0000, len = 64
[   38.629930] marvell-nfc pxa3xx-nand: 
[   38.629930] NDCR:  0x9d079fff
[   38.629930] NDCB0: 0x000d3000
[   38.629930] NDCB1: 0x4d800000
[   38.629930] NDCB2: 0x00000001
[   38.629930] NDCB3: 0x00000000
[   38.648899] nand: nand_do_read_oob: from = 0x0a6e0000, len = 64
[   38.654937] marvell-nfc pxa3xx-nand: 
[   38.654937] NDCR:  0x9d079fff
[   38.654937] NDCB0: 0x000d3000
[   38.654937] NDCB1: 0x4dc00000
[   38.654937] NDCB2: 0x00000001
[   38.654937] NDCB3: 0x00000000
[   38.673877] nand: nand_do_read_oob: from = 0x0a700000, len = 64
[   38.680080] marvell-nfc pxa3xx-nand: 
[   38.680080] NDCR:  0x9d079fff
[   38.680080] NDCB0: 0x000d3000
[   38.680080] NDCB1: 0x4e000000
[   38.680080] NDCB2: 0x00000001
[   38.680080] NDCB3: 0x00000000
[   38.699048] nand: nand_do_read_oob: from = 0x0a720000, len = 64
[   38.705084] marvell-nfc pxa3xx-nand: 
[   38.705084] NDCR:  0x9d079fff
[   38.705084] NDCB0: 0x000d3000
[   38.705084] NDCB1: 0x4e400000
[   38.705084] NDCB2: 0x00000001
[   38.705084] NDCB3: 0x00000000
[   38.724019] nand: nand_do_read_oob: from = 0x0a740000, len = 64
[   38.730222] marvell-nfc pxa3xx-nand: 
[   38.730222] NDCR:  0x9d079fff
[   38.730222] NDCB0: 0x000d3000
[   38.730222] NDCB1: 0x4e800000
[   38.730222] NDCB2: 0x00000001
[   38.730222] NDCB3: 0x00000000
[   38.749149] nand: nand_do_read_oob: from = 0x0a760000, len = 64
[   38.755183] marvell-nfc pxa3xx-nand: 
[   38.755183] NDCR:  0x9d079fff
[   38.755183] NDCB0: 0x000d3000
[   38.755183] NDCB1: 0x4ec00000
[   38.755183] NDCB2: 0x00000001
[   38.755183] NDCB3: 0x00000000
[   38.774115] nand: nand_do_read_oob: from = 0x0a780000, len = 64
[   38.780322] marvell-nfc pxa3xx-nand: 
[   38.780322] NDCR:  0x9d079fff
[   38.780322] NDCB0: 0x000d3000
[   38.780322] NDCB1: 0x4f000000
[   38.780322] NDCB2: 0x00000001
[   38.780322] NDCB3: 0x00000000
[   38.799251] nand: nand_do_read_oob: from = 0x0a7a0000, len = 64
[   38.805280] marvell-nfc pxa3xx-nand: 
[   38.805280] NDCR:  0x9d079fff
[   38.805280] NDCB0: 0x000d3000
[   38.805280] NDCB1: 0x4f400000
[   38.805280] NDCB2: 0x00000001
[   38.805280] NDCB3: 0x00000000
[   38.824215] nand: nand_do_read_oob: from = 0x0a7c0000, len = 64
[   38.830420] marvell-nfc pxa3xx-nand: 
[   38.830420] NDCR:  0x9d079fff
[   38.830420] NDCB0: 0x000d3000
[   38.830420] NDCB1: 0x4f800000
[   38.830420] NDCB2: 0x00000001
[   38.830420] NDCB3: 0x00000000
[   38.849349] nand: nand_do_read_oob: from = 0x0a7e0000, len = 64
[   38.855378] marvell-nfc pxa3xx-nand: 
[   38.855378] NDCR:  0x9d079fff
[   38.855378] NDCB0: 0x000d3000
[   38.855378] NDCB1: 0x4fc00000
[   38.855378] NDCB2: 0x00000001
[   38.855378] NDCB3: 0x00000000
[   38.874311] nand: nand_do_read_oob: from = 0x0a800000, len = 64
[   38.880517] marvell-nfc pxa3xx-nand: 
[   38.880517] NDCR:  0x9d079fff
[   38.880517] NDCB0: 0x000d3000
[   38.880517] NDCB1: 0x50000000
[   38.880517] NDCB2: 0x00000001
[   38.880517] NDCB3: 0x00000000
[   38.899447] nand: nand_do_read_oob: from = 0x0a820000, len = 64
[   38.905478] marvell-nfc pxa3xx-nand: 
[   38.905478] NDCR:  0x9d079fff
[   38.905478] NDCB0: 0x000d3000
[   38.905478] NDCB1: 0x50400000
[   38.905478] NDCB2: 0x00000001
[   38.905478] NDCB3: 0x00000000
[   38.924410] nand: nand_do_read_oob: from = 0x0a840000, len = 64
[   38.930616] marvell-nfc pxa3xx-nand: 
[   38.930616] NDCR:  0x9d079fff
[   38.930616] NDCB0: 0x000d3000
[   38.930616] NDCB1: 0x50800000
[   38.930616] NDCB2: 0x00000001
[   38.930616] NDCB3: 0x00000000
[   38.949543] nand: nand_do_read_oob: from = 0x0a860000, len = 64
[   38.955576] marvell-nfc pxa3xx-nand: 
[   38.955576] NDCR:  0x9d079fff
[   38.955576] NDCB0: 0x000d3000
[   38.955576] NDCB1: 0x50c00000
[   38.955576] NDCB2: 0x00000001
[   38.955576] NDCB3: 0x00000000
[   38.974508] nand: nand_do_read_oob: from = 0x0a880000, len = 64
[   38.980714] marvell-nfc pxa3xx-nand: 
[   38.980714] NDCR:  0x9d079fff
[   38.980714] NDCB0: 0x000d3000
[   38.980714] NDCB1: 0x51000000
[   38.980714] NDCB2: 0x00000001
[   38.980714] NDCB3: 0x00000000
[   38.999659] nand: nand_do_read_oob: from = 0x0a8a0000, len = 64
[   39.005692] marvell-nfc pxa3xx-nand: 
[   39.005692] NDCR:  0x9d079fff
[   39.005692] NDCB0: 0x000d3000
[   39.005692] NDCB1: 0x51400000
[   39.005692] NDCB2: 0x00000001
[   39.005692] NDCB3: 0x00000000
[   39.024633] nand: nand_do_read_oob: from = 0x0a8c0000, len = 64
[   39.030840] marvell-nfc pxa3xx-nand: 
[   39.030840] NDCR:  0x9d079fff
[   39.030840] NDCB0: 0x000d3000
[   39.030840] NDCB1: 0x51800000
[   39.030840] NDCB2: 0x00000001
[   39.030840] NDCB3: 0x00000000
[   39.049768] nand: nand_do_read_oob: from = 0x0a8e0000, len = 64
[   39.055799] marvell-nfc pxa3xx-nand: 
[   39.055799] NDCR:  0x9d079fff
[   39.055799] NDCB0: 0x000d3000
[   39.055799] NDCB1: 0x51c00000
[   39.055799] NDCB2: 0x00000001
[   39.055799] NDCB3: 0x00000000
[   39.074734] nand: nand_do_read_oob: from = 0x0a900000, len = 64
[   39.080938] marvell-nfc pxa3xx-nand: 
[   39.080938] NDCR:  0x9d079fff
[   39.080938] NDCB0: 0x000d3000
[   39.080938] NDCB1: 0x52000000
[   39.080938] NDCB2: 0x00000001
[   39.080938] NDCB3: 0x00000000
[   39.099865] nand: nand_do_read_oob: from = 0x0a920000, len = 64
[   39.105898] marvell-nfc pxa3xx-nand: 
[   39.105898] NDCR:  0x9d079fff
[   39.105898] NDCB0: 0x000d3000
[   39.105898] NDCB1: 0x52400000
[   39.105898] NDCB2: 0x00000001
[   39.105898] NDCB3: 0x00000000
[   39.124831] nand: nand_do_read_oob: from = 0x0a940000, len = 64
[   39.131037] marvell-nfc pxa3xx-nand: 
[   39.131037] NDCR:  0x9d079fff
[   39.131037] NDCB0: 0x000d3000
[   39.131037] NDCB1: 0x52800000
[   39.131037] NDCB2: 0x00000001
[   39.131037] NDCB3: 0x00000000
[   39.149964] nand: nand_do_read_oob: from = 0x0a960000, len = 64
[   39.155996] marvell-nfc pxa3xx-nand: 
[   39.155996] NDCR:  0x9d079fff
[   39.155996] NDCB0: 0x000d3000
[   39.155996] NDCB1: 0x52c00000
[   39.155996] NDCB2: 0x00000001
[   39.155996] NDCB3: 0x00000000
[   39.174928] nand: nand_do_read_oob: from = 0x0a980000, len = 64
[   39.181134] marvell-nfc pxa3xx-nand: 
[   39.181134] NDCR:  0x9d079fff
[   39.181134] NDCB0: 0x000d3000
[   39.181134] NDCB1: 0x53000000
[   39.181134] NDCB2: 0x00000001
[   39.181134] NDCB3: 0x00000000
[   39.200063] nand: nand_do_read_oob: from = 0x0a9a0000, len = 64
[   39.206094] marvell-nfc pxa3xx-nand: 
[   39.206094] NDCR:  0x9d079fff
[   39.206094] NDCB0: 0x000d3000
[   39.206094] NDCB1: 0x53400000
[   39.206094] NDCB2: 0x00000001
[   39.206094] NDCB3: 0x00000000
[   39.225030] nand: nand_do_read_oob: from = 0x0a9c0000, len = 64
[   39.231233] marvell-nfc pxa3xx-nand: 
[   39.231233] NDCR:  0x9d079fff
[   39.231233] NDCB0: 0x000d3000
[   39.231233] NDCB1: 0x53800000
[   39.231233] NDCB2: 0x00000001
[   39.231233] NDCB3: 0x00000000
[   39.250160] nand: nand_do_read_oob: from = 0x0a9e0000, len = 64
[   39.256192] marvell-nfc pxa3xx-nand: 
[   39.256192] NDCR:  0x9d079fff
[   39.256192] NDCB0: 0x000d3000
[   39.256192] NDCB1: 0x53c00000
[   39.256192] NDCB2: 0x00000001
[   39.256192] NDCB3: 0x00000000
[   39.275126] nand: nand_do_read_oob: from = 0x0aa00000, len = 64
[   39.281332] marvell-nfc pxa3xx-nand: 
[   39.281332] NDCR:  0x9d079fff
[   39.281332] NDCB0: 0x000d3000
[   39.281332] NDCB1: 0x54000000
[   39.281332] NDCB2: 0x00000001
[   39.281332] NDCB3: 0x00000000
[   39.300261] nand: nand_do_read_oob: from = 0x0aa20000, len = 64
[   39.306291] marvell-nfc pxa3xx-nand: 
[   39.306291] NDCR:  0x9d079fff
[   39.306291] NDCB0: 0x000d3000
[   39.306291] NDCB1: 0x54400000
[   39.306291] NDCB2: 0x00000001
[   39.306291] NDCB3: 0x00000000
[   39.325224] nand: nand_do_read_oob: from = 0x0aa40000, len = 64
[   39.331429] marvell-nfc pxa3xx-nand: 
[   39.331429] NDCR:  0x9d079fff
[   39.331429] NDCB0: 0x000d3000
[   39.331429] NDCB1: 0x54800000
[   39.331429] NDCB2: 0x00000001
[   39.331429] NDCB3: 0x00000000
[   39.350358] nand: nand_do_read_oob: from = 0x0aa60000, len = 64
[   39.356391] marvell-nfc pxa3xx-nand: 
[   39.356391] NDCR:  0x9d079fff
[   39.356391] NDCB0: 0x000d3000
[   39.356391] NDCB1: 0x54c00000
[   39.356391] NDCB2: 0x00000001
[   39.356391] NDCB3: 0x00000000
[   39.375321] nand: nand_do_read_oob: from = 0x0aa80000, len = 64
[   39.381520] marvell-nfc pxa3xx-nand: 
[   39.381520] NDCR:  0x9d079fff
[   39.381520] NDCB0: 0x000d3000
[   39.381520] NDCB1: 0x55000000
[   39.381520] NDCB2: 0x00000001
[   39.381520] NDCB3: 0x00000000
[   39.400448] nand: nand_do_read_oob: from = 0x0aaa0000, len = 64
[   39.406480] marvell-nfc pxa3xx-nand: 
[   39.406480] NDCR:  0x9d079fff
[   39.406480] NDCB0: 0x000d3000
[   39.406480] NDCB1: 0x55400000
[   39.406480] NDCB2: 0x00000001
[   39.406480] NDCB3: 0x00000000
[   39.425416] nand: nand_do_read_oob: from = 0x0aac0000, len = 64
[   39.431618] marvell-nfc pxa3xx-nand: 
[   39.431618] NDCR:  0x9d079fff
[   39.431618] NDCB0: 0x000d3000
[   39.431618] NDCB1: 0x55800000
[   39.431618] NDCB2: 0x00000001
[   39.431618] NDCB3: 0x00000000
[   39.450547] nand: nand_do_read_oob: from = 0x0aae0000, len = 64
[   39.456578] marvell-nfc pxa3xx-nand: 
[   39.456578] NDCR:  0x9d079fff
[   39.456578] NDCB0: 0x000d3000
[   39.456578] NDCB1: 0x55c00000
[   39.456578] NDCB2: 0x00000001
[   39.456578] NDCB3: 0x00000000
[   39.475509] nand: nand_do_read_oob: from = 0x0ab00000, len = 64
[   39.481708] marvell-nfc pxa3xx-nand: 
[   39.481708] NDCR:  0x9d079fff
[   39.481708] NDCB0: 0x000d3000
[   39.481708] NDCB1: 0x56000000
[   39.481708] NDCB2: 0x00000001
[   39.481708] NDCB3: 0x00000000
[   39.500634] nand: nand_do_read_oob: from = 0x0ab20000, len = 64
[   39.506668] marvell-nfc pxa3xx-nand: 
[   39.506668] NDCR:  0x9d079fff
[   39.506668] NDCB0: 0x000d3000
[   39.506668] NDCB1: 0x56400000
[   39.506668] NDCB2: 0x00000001
[   39.506668] NDCB3: 0x00000000
[   39.525600] nand: nand_do_read_oob: from = 0x0ab40000, len = 64
[   39.531806] marvell-nfc pxa3xx-nand: 
[   39.531806] NDCR:  0x9d079fff
[   39.531806] NDCB0: 0x000d3000
[   39.531806] NDCB1: 0x56800000
[   39.531806] NDCB2: 0x00000001
[   39.531806] NDCB3: 0x00000000
[   39.550734] nand: nand_do_read_oob: from = 0x0ab60000, len = 64
[   39.556766] marvell-nfc pxa3xx-nand: 
[   39.556766] NDCR:  0x9d079fff
[   39.556766] NDCB0: 0x000d3000
[   39.556766] NDCB1: 0x56c00000
[   39.556766] NDCB2: 0x00000001
[   39.556766] NDCB3: 0x00000000
[   39.575697] nand: nand_do_read_oob: from = 0x0ab80000, len = 64
[   39.581895] marvell-nfc pxa3xx-nand: 
[   39.581895] NDCR:  0x9d079fff
[   39.581895] NDCB0: 0x000d3000
[   39.581895] NDCB1: 0x57000000
[   39.581895] NDCB2: 0x00000001
[   39.581895] NDCB3: 0x00000000
[   39.600822] nand: nand_do_read_oob: from = 0x0aba0000, len = 64
[   39.606855] marvell-nfc pxa3xx-nand: 
[   39.606855] NDCR:  0x9d079fff
[   39.606855] NDCB0: 0x000d3000
[   39.606855] NDCB1: 0x57400000
[   39.606855] NDCB2: 0x00000001
[   39.606855] NDCB3: 0x00000000
[   39.625789] nand: nand_do_read_oob: from = 0x0abc0000, len = 64
[   39.631992] marvell-nfc pxa3xx-nand: 
[   39.631992] NDCR:  0x9d079fff
[   39.631992] NDCB0: 0x000d3000
[   39.631992] NDCB1: 0x57800000
[   39.631992] NDCB2: 0x00000001
[   39.631992] NDCB3: 0x00000000
[   39.650939] nand: nand_do_read_oob: from = 0x0abe0000, len = 64
[   39.656971] marvell-nfc pxa3xx-nand: 
[   39.656971] NDCR:  0x9d079fff
[   39.656971] NDCB0: 0x000d3000
[   39.656971] NDCB1: 0x57c00000
[   39.656971] NDCB2: 0x00000001
[   39.656971] NDCB3: 0x00000000
[   39.675903] nand: nand_do_read_oob: from = 0x0ac00000, len = 64
[   39.682101] marvell-nfc pxa3xx-nand: 
[   39.682101] NDCR:  0x9d079fff
[   39.682101] NDCB0: 0x000d3000
[   39.682101] NDCB1: 0x58000000
[   39.682101] NDCB2: 0x00000001
[   39.682101] NDCB3: 0x00000000
[   39.701028] nand: nand_do_read_oob: from = 0x0ac20000, len = 64
[   39.707061] marvell-nfc pxa3xx-nand: 
[   39.707061] NDCR:  0x9d079fff
[   39.707061] NDCB0: 0x000d3000
[   39.707061] NDCB1: 0x58400000
[   39.707061] NDCB2: 0x00000001
[   39.707061] NDCB3: 0x00000000
[   39.725994] nand: nand_do_read_oob: from = 0x0ac40000, len = 64
[   39.732201] marvell-nfc pxa3xx-nand: 
[   39.732201] NDCR:  0x9d079fff
[   39.732201] NDCB0: 0x000d3000
[   39.732201] NDCB1: 0x58800000
[   39.732201] NDCB2: 0x00000001
[   39.732201] NDCB3: 0x00000000
[   39.751128] nand: nand_do_read_oob: from = 0x0ac60000, len = 64
[   39.757161] marvell-nfc pxa3xx-nand: 
[   39.757161] NDCR:  0x9d079fff
[   39.757161] NDCB0: 0x000d3000
[   39.757161] NDCB1: 0x58c00000
[   39.757161] NDCB2: 0x00000001
[   39.757161] NDCB3: 0x00000000
[   39.776092] nand: nand_do_read_oob: from = 0x0ac80000, len = 64
[   39.782289] marvell-nfc pxa3xx-nand: 
[   39.782289] NDCR:  0x9d079fff
[   39.782289] NDCB0: 0x000d3000
[   39.782289] NDCB1: 0x59000000
[   39.782289] NDCB2: 0x00000001
[   39.782289] NDCB3: 0x00000000
[   39.801217] nand: nand_do_read_oob: from = 0x0aca0000, len = 64
[   39.807248] marvell-nfc pxa3xx-nand: 
[   39.807248] NDCR:  0x9d079fff
[   39.807248] NDCB0: 0x000d3000
[   39.807248] NDCB1: 0x59400000
[   39.807248] NDCB2: 0x00000001
[   39.807248] NDCB3: 0x00000000
[   39.826180] nand: nand_do_read_oob: from = 0x0acc0000, len = 64
[   39.832380] marvell-nfc pxa3xx-nand: 
[   39.832380] NDCR:  0x9d079fff
[   39.832380] NDCB0: 0x000d3000
[   39.832380] NDCB1: 0x59800000
[   39.832380] NDCB2: 0x00000001
[   39.832380] NDCB3: 0x00000000
[   39.851310] nand: nand_do_read_oob: from = 0x0ace0000, len = 64
[   39.857339] marvell-nfc pxa3xx-nand: 
[   39.857339] NDCR:  0x9d079fff
[   39.857339] NDCB0: 0x000d3000
[   39.857339] NDCB1: 0x59c00000
[   39.857339] NDCB2: 0x00000001
[   39.857339] NDCB3: 0x00000000
[   39.876270] nand: nand_do_read_oob: from = 0x0ad00000, len = 64
[   39.882468] marvell-nfc pxa3xx-nand: 
[   39.882468] NDCR:  0x9d079fff
[   39.882468] NDCB0: 0x000d3000
[   39.882468] NDCB1: 0x5a000000
[   39.882468] NDCB2: 0x00000001
[   39.882468] NDCB3: 0x00000000
[   39.901398] nand: nand_do_read_oob: from = 0x0ad20000, len = 64
[   39.907430] marvell-nfc pxa3xx-nand: 
[   39.907430] NDCR:  0x9d079fff
[   39.907430] NDCB0: 0x000d3000
[   39.907430] NDCB1: 0x5a400000
[   39.907430] NDCB2: 0x00000001
[   39.907430] NDCB3: 0x00000000
[   39.926360] nand: nand_do_read_oob: from = 0x0ad40000, len = 64
[   39.932559] marvell-nfc pxa3xx-nand: 
[   39.932559] NDCR:  0x9d079fff
[   39.932559] NDCB0: 0x000d3000
[   39.932559] NDCB1: 0x5a800000
[   39.932559] NDCB2: 0x00000001
[   39.932559] NDCB3: 0x00000000
[   39.951489] nand: nand_do_read_oob: from = 0x0ad60000, len = 64
[   39.957520] marvell-nfc pxa3xx-nand: 
[   39.957520] NDCR:  0x9d079fff
[   39.957520] NDCB0: 0x000d3000
[   39.957520] NDCB1: 0x5ac00000
[   39.957520] NDCB2: 0x00000001
[   39.957520] NDCB3: 0x00000000
[   39.976451] nand: nand_do_read_oob: from = 0x0ad80000, len = 64
[   39.982649] marvell-nfc pxa3xx-nand: 
[   39.982649] NDCR:  0x9d079fff
[   39.982649] NDCB0: 0x000d3000
[   39.982649] NDCB1: 0x5b000000
[   39.982649] NDCB2: 0x00000001
[   39.982649] NDCB3: 0x00000000
[   40.001578] nand: nand_do_read_oob: from = 0x0ada0000, len = 64
[   40.007608] marvell-nfc pxa3xx-nand: 
[   40.007608] NDCR:  0x9d079fff
[   40.007608] NDCB0: 0x000d3000
[   40.007608] NDCB1: 0x5b400000
[   40.007608] NDCB2: 0x00000001
[   40.007608] NDCB3: 0x00000000
[   40.026551] nand: nand_do_read_oob: from = 0x0adc0000, len = 64
[   40.032756] marvell-nfc pxa3xx-nand: 
[   40.032756] NDCR:  0x9d079fff
[   40.032756] NDCB0: 0x000d3000
[   40.032756] NDCB1: 0x5b800000
[   40.032756] NDCB2: 0x00000001
[   40.032756] NDCB3: 0x00000000
[   40.051686] nand: nand_do_read_oob: from = 0x0ade0000, len = 64
[   40.057715] marvell-nfc pxa3xx-nand: 
[   40.057715] NDCR:  0x9d079fff
[   40.057715] NDCB0: 0x000d3000
[   40.057715] NDCB1: 0x5bc00000
[   40.057715] NDCB2: 0x00000001
[   40.057715] NDCB3: 0x00000000
[   40.076649] nand: nand_do_read_oob: from = 0x0ae00000, len = 64
[   40.082853] marvell-nfc pxa3xx-nand: 
[   40.082853] NDCR:  0x9d079fff
[   40.082853] NDCB0: 0x000d3000
[   40.082853] NDCB1: 0x5c000000
[   40.082853] NDCB2: 0x00000001
[   40.082853] NDCB3: 0x00000000
[   40.102129] nand: nand_do_read_oob: from = 0x0ae20000, len = 64
[   40.108173] marvell-nfc pxa3xx-nand: 
[   40.108173] NDCR:  0x9d079fff
[   40.108173] NDCB0: 0x000d3000
[   40.108173] NDCB1: 0x5c400000
[   40.108173] NDCB2: 0x00000001
[   40.108173] NDCB3: 0x00000000
[   40.127132] nand: nand_do_read_oob: from = 0x0ae40000, len = 64
[   40.133331] marvell-nfc pxa3xx-nand: 
[   40.133331] NDCR:  0x9d079fff
[   40.133331] NDCB0: 0x000d3000
[   40.133331] NDCB1: 0x5c800000
[   40.133331] NDCB2: 0x00000001
[   40.133331] NDCB3: 0x00000000
[   40.152260] nand: nand_do_read_oob: from = 0x0ae60000, len = 64
[   40.158294] marvell-nfc pxa3xx-nand: 
[   40.158294] NDCR:  0x9d079fff
[   40.158294] NDCB0: 0x000d3000
[   40.158294] NDCB1: 0x5cc00000
[   40.158294] NDCB2: 0x00000001
[   40.158294] NDCB3: 0x00000000
[   40.177228] nand: nand_do_read_oob: from = 0x0ae80000, len = 64
[   40.183432] marvell-nfc pxa3xx-nand: 
[   40.183432] NDCR:  0x9d079fff
[   40.183432] NDCB0: 0x000d3000
[   40.183432] NDCB1: 0x5d000000
[   40.183432] NDCB2: 0x00000001
[   40.183432] NDCB3: 0x00000000
[   40.202360] nand: nand_do_read_oob: from = 0x0aea0000, len = 64
[   40.208391] marvell-nfc pxa3xx-nand: 
[   40.208391] NDCR:  0x9d079fff
[   40.208391] NDCB0: 0x000d3000
[   40.208391] NDCB1: 0x5d400000
[   40.208391] NDCB2: 0x00000001
[   40.208391] NDCB3: 0x00000000
[   40.227328] nand: nand_do_read_oob: from = 0x0aec0000, len = 64
[   40.233529] marvell-nfc pxa3xx-nand: 
[   40.233529] NDCR:  0x9d079fff
[   40.233529] NDCB0: 0x000d3000
[   40.233529] NDCB1: 0x5d800000
[   40.233529] NDCB2: 0x00000001
[   40.233529] NDCB3: 0x00000000
[   40.252458] nand: nand_do_read_oob: from = 0x0aee0000, len = 64
[   40.258490] marvell-nfc pxa3xx-nand: 
[   40.258490] NDCR:  0x9d079fff
[   40.258490] NDCB0: 0x000d3000
[   40.258490] NDCB1: 0x5dc00000
[   40.258490] NDCB2: 0x00000001
[   40.258490] NDCB3: 0x00000000
[   40.277423] nand: nand_do_read_oob: from = 0x0af00000, len = 64
[   40.283653] marvell-nfc pxa3xx-nand: 
[   40.283653] NDCR:  0x9d079fff
[   40.283653] NDCB0: 0x000d3000
[   40.283653] NDCB1: 0x5e000000
[   40.283653] NDCB2: 0x00000001
[   40.283653] NDCB3: 0x00000000
[   40.302581] nand: nand_do_read_oob: from = 0x0af20000, len = 64
[   40.308612] marvell-nfc pxa3xx-nand: 
[   40.308612] NDCR:  0x9d079fff
[   40.308612] NDCB0: 0x000d3000
[   40.308612] NDCB1: 0x5e400000
[   40.308612] NDCB2: 0x00000001
[   40.308612] NDCB3: 0x00000000
[   40.327655] nand: nand_do_read_oob: from = 0x0af40000, len = 64
[   40.333856] marvell-nfc pxa3xx-nand: 
[   40.333856] NDCR:  0x9d079fff
[   40.333856] NDCB0: 0x000d3000
[   40.333856] NDCB1: 0x5e800000
[   40.333856] NDCB2: 0x00000001
[   40.333856] NDCB3: 0x00000000
[   40.352781] nand: nand_do_read_oob: from = 0x0af60000, len = 64
[   40.358986] marvell-nfc pxa3xx-nand: 
[   40.358986] NDCR:  0x9d079fff
[   40.358986] NDCB0: 0x000d3000
[   40.358986] NDCB1: 0x5ec00000
[   40.358986] NDCB2: 0x00000001
[   40.358986] NDCB3: 0x00000000
[   40.377905] nand: nand_do_read_oob: from = 0x0af80000, len = 64
[   40.384108] marvell-nfc pxa3xx-nand: 
[   40.384108] NDCR:  0x9d079fff
[   40.384108] NDCB0: 0x000d3000
[   40.384108] NDCB1: 0x5f000000
[   40.384108] NDCB2: 0x00000001
[   40.384108] NDCB3: 0x00000000
[   40.403036] nand: nand_do_read_oob: from = 0x0afa0000, len = 64
[   40.409239] marvell-nfc pxa3xx-nand: 
[   40.409239] NDCR:  0x9d079fff
[   40.409239] NDCB0: 0x000d3000
[   40.409239] NDCB1: 0x5f400000
[   40.409239] NDCB2: 0x00000001
[   40.409239] NDCB3: 0x00000000
[   40.428158] nand: nand_do_read_oob: from = 0x0afc0000, len = 64
[   40.434362] marvell-nfc pxa3xx-nand: 
[   40.434362] NDCR:  0x9d079fff
[   40.434362] NDCB0: 0x000d3000
[   40.434362] NDCB1: 0x5f800000
[   40.434362] NDCB2: 0x00000001
[   40.434362] NDCB3: 0x00000000
[   40.453288] nand: nand_do_read_oob: from = 0x0afe0000, len = 64
[   40.459495] marvell-nfc pxa3xx-nand: 
[   40.459495] NDCR:  0x9d079fff
[   40.459495] NDCB0: 0x000d3000
[   40.459495] NDCB1: 0x5fc00000
[   40.459495] NDCB2: 0x00000001
[   40.459495] NDCB3: 0x00000000
[   40.478411] nand: nand_do_read_oob: from = 0x0b000000, len = 64
[   40.484616] marvell-nfc pxa3xx-nand: 
[   40.484616] NDCR:  0x9d079fff
[   40.484616] NDCB0: 0x000d3000
[   40.484616] NDCB1: 0x60000000
[   40.484616] NDCB2: 0x00000001
[   40.484616] NDCB3: 0x00000000
[   40.503546] nand: nand_do_read_oob: from = 0x0b020000, len = 64
[   40.509745] marvell-nfc pxa3xx-nand: 
[   40.509745] NDCR:  0x9d079fff
[   40.509745] NDCB0: 0x000d3000
[   40.509745] NDCB1: 0x60400000
[   40.509745] NDCB2: 0x00000001
[   40.509745] NDCB3: 0x00000000
[   40.528764] nand: nand_do_read_oob: from = 0x0b040000, len = 64
[   40.534800] marvell-nfc pxa3xx-nand: 
[   40.534800] NDCR:  0x9d079fff
[   40.534800] NDCB0: 0x000d3000
[   40.534800] NDCB1: 0x60800000
[   40.534800] NDCB2: 0x00000001
[   40.534800] NDCB3: 0x00000000
[   40.553712] nand: nand_do_read_oob: from = 0x0b060000, len = 64
[   40.559912] marvell-nfc pxa3xx-nand: 
[   40.559912] NDCR:  0x9d079fff
[   40.559912] NDCB0: 0x000d3000
[   40.559912] NDCB1: 0x60c00000
[   40.559912] NDCB2: 0x00000001
[   40.559912] NDCB3: 0x00000000
[   40.578902] nand: nand_do_read_oob: from = 0x0b080000, len = 64
[   40.584939] marvell-nfc pxa3xx-nand: 
[   40.584939] NDCR:  0x9d079fff
[   40.584939] NDCB0: 0x000d3000
[   40.584939] NDCB1: 0x61000000
[   40.584939] NDCB2: 0x00000001
[   40.584939] NDCB3: 0x00000000
[   40.603877] nand: nand_do_read_oob: from = 0x0b0a0000, len = 64
[   40.610082] marvell-nfc pxa3xx-nand: 
[   40.610082] NDCR:  0x9d079fff
[   40.610082] NDCB0: 0x000d3000
[   40.610082] NDCB1: 0x61400000
[   40.610082] NDCB2: 0x00000001
[   40.610082] NDCB3: 0x00000000
[   40.629049] nand: nand_do_read_oob: from = 0x0b0c0000, len = 64
[   40.635076] marvell-nfc pxa3xx-nand: 
[   40.635076] NDCR:  0x9d079fff
[   40.635076] NDCB0: 0x000d3000
[   40.635076] NDCB1: 0x61800000
[   40.635076] NDCB2: 0x00000001
[   40.635076] NDCB3: 0x00000000
[   40.654007] nand: nand_do_read_oob: from = 0x0b0e0000, len = 64
[   40.660206] marvell-nfc pxa3xx-nand: 
[   40.660206] NDCR:  0x9d079fff
[   40.660206] NDCB0: 0x000d3000
[   40.660206] NDCB1: 0x61c00000
[   40.660206] NDCB2: 0x00000001
[   40.660206] NDCB3: 0x00000000
[   40.679134] nand: nand_do_read_oob: from = 0x0b100000, len = 64
[   40.685166] marvell-nfc pxa3xx-nand: 
[   40.685166] NDCR:  0x9d079fff
[   40.685166] NDCB0: 0x000d3000
[   40.685166] NDCB1: 0x62000000
[   40.685166] NDCB2: 0x00000001
[   40.685166] NDCB3: 0x00000000
[   40.704098] nand: nand_do_read_oob: from = 0x0b120000, len = 64
[   40.710295] marvell-nfc pxa3xx-nand: 
[   40.710295] NDCR:  0x9d079fff
[   40.710295] NDCB0: 0x000d3000
[   40.710295] NDCB1: 0x62400000
[   40.710295] NDCB2: 0x00000001
[   40.710295] NDCB3: 0x00000000
[   40.729225] nand: nand_do_read_oob: from = 0x0b140000, len = 64
[   40.735255] marvell-nfc pxa3xx-nand: 
[   40.735255] NDCR:  0x9d079fff
[   40.735255] NDCB0: 0x000d3000
[   40.735255] NDCB1: 0x62800000
[   40.735255] NDCB2: 0x00000001
[   40.735255] NDCB3: 0x00000000
[   40.754188] nand: nand_do_read_oob: from = 0x0b160000, len = 64
[   40.760393] marvell-nfc pxa3xx-nand: 
[   40.760393] NDCR:  0x9d079fff
[   40.760393] NDCB0: 0x000d3000
[   40.760393] NDCB1: 0x62c00000
[   40.760393] NDCB2: 0x00000001
[   40.760393] NDCB3: 0x00000000
[   40.779321] nand: nand_do_read_oob: from = 0x0b180000, len = 64
[   40.785355] marvell-nfc pxa3xx-nand: 
[   40.785355] NDCR:  0x9d079fff
[   40.785355] NDCB0: 0x000d3000
[   40.785355] NDCB1: 0x63000000
[   40.785355] NDCB2: 0x00000001
[   40.785355] NDCB3: 0x00000000
[   40.804288] nand: nand_do_read_oob: from = 0x0b1a0000, len = 64
[   40.810494] marvell-nfc pxa3xx-nand: 
[   40.810494] NDCR:  0x9d079fff
[   40.810494] NDCB0: 0x000d3000
[   40.810494] NDCB1: 0x63400000
[   40.810494] NDCB2: 0x00000001
[   40.810494] NDCB3: 0x00000000
[   40.829421] nand: nand_do_read_oob: from = 0x0b1c0000, len = 64
[   40.835452] marvell-nfc pxa3xx-nand: 
[   40.835452] NDCR:  0x9d079fff
[   40.835452] NDCB0: 0x000d3000
[   40.835452] NDCB1: 0x63800000
[   40.835452] NDCB2: 0x00000001
[   40.835452] NDCB3: 0x00000000
[   40.854384] nand: nand_do_read_oob: from = 0x0b1e0000, len = 64
[   40.860609] marvell-nfc pxa3xx-nand: 
[   40.860609] NDCR:  0x9d079fff
[   40.860609] NDCB0: 0x000d3000
[   40.860609] NDCB1: 0x63c00000
[   40.860609] NDCB2: 0x00000001
[   40.860609] NDCB3: 0x00000000
[   40.879540] nand: nand_do_read_oob: from = 0x0b200000, len = 64
[   40.885567] marvell-nfc pxa3xx-nand: 
[   40.885567] NDCR:  0x9d079fff
[   40.885567] NDCB0: 0x000d3000
[   40.885567] NDCB1: 0x64000000
[   40.885567] NDCB2: 0x00000001
[   40.885567] NDCB3: 0x00000000
[   40.904499] nand: nand_do_read_oob: from = 0x0b220000, len = 64
[   40.910695] marvell-nfc pxa3xx-nand: 
[   40.910695] NDCR:  0x9d079fff
[   40.910695] NDCB0: 0x000d3000
[   40.910695] NDCB1: 0x64400000
[   40.910695] NDCB2: 0x00000001
[   40.910695] NDCB3: 0x00000000
[   40.929627] nand: nand_do_read_oob: from = 0x0b240000, len = 64
[   40.935657] marvell-nfc pxa3xx-nand: 
[   40.935657] NDCR:  0x9d079fff
[   40.935657] NDCB0: 0x000d3000
[   40.935657] NDCB1: 0x64800000
[   40.935657] NDCB2: 0x00000001
[   40.935657] NDCB3: 0x00000000
[   40.954592] nand: nand_do_read_oob: from = 0x0b260000, len = 64
[   40.960798] marvell-nfc pxa3xx-nand: 
[   40.960798] NDCR:  0x9d079fff
[   40.960798] NDCB0: 0x000d3000
[   40.960798] NDCB1: 0x64c00000
[   40.960798] NDCB2: 0x00000001
[   40.960798] NDCB3: 0x00000000
[   40.979726] nand: nand_do_read_oob: from = 0x0b280000, len = 64
[   40.985756] marvell-nfc pxa3xx-nand: 
[   40.985756] NDCR:  0x9d079fff
[   40.985756] NDCB0: 0x000d3000
[   40.985756] NDCB1: 0x65000000
[   40.985756] NDCB2: 0x00000001
[   40.985756] NDCB3: 0x00000000
[   41.004694] nand: nand_do_read_oob: from = 0x0b2a0000, len = 64
[   41.010903] marvell-nfc pxa3xx-nand: 
[   41.010903] NDCR:  0x9d079fff
[   41.010903] NDCB0: 0x000d3000
[   41.010903] NDCB1: 0x65400000
[   41.010903] NDCB2: 0x00000001
[   41.010903] NDCB3: 0x00000000
[   41.029835] nand: nand_do_read_oob: from = 0x0b2c0000, len = 64
[   41.035862] marvell-nfc pxa3xx-nand: 
[   41.035862] NDCR:  0x9d079fff
[   41.035862] NDCB0: 0x000d3000
[   41.035862] NDCB1: 0x65800000
[   41.035862] NDCB2: 0x00000001
[   41.035862] NDCB3: 0x00000000
[   41.054798] nand: nand_do_read_oob: from = 0x0b2e0000, len = 64
[   41.061002] marvell-nfc pxa3xx-nand: 
[   41.061002] NDCR:  0x9d079fff
[   41.061002] NDCB0: 0x000d3000
[   41.061002] NDCB1: 0x65c00000
[   41.061002] NDCB2: 0x00000001
[   41.061002] NDCB3: 0x00000000
[   41.079930] nand: nand_do_read_oob: from = 0x0b300000, len = 64
[   41.085962] marvell-nfc pxa3xx-nand: 
[   41.085962] NDCR:  0x9d079fff
[   41.085962] NDCB0: 0x000d3000
[   41.085962] NDCB1: 0x66000000
[   41.085962] NDCB2: 0x00000001
[   41.085962] NDCB3: 0x00000000
[   41.104899] nand: nand_do_read_oob: from = 0x0b320000, len = 64
[   41.111100] marvell-nfc pxa3xx-nand: 
[   41.111100] NDCR:  0x9d079fff
[   41.111100] NDCB0: 0x000d3000
[   41.111100] NDCB1: 0x66400000
[   41.111100] NDCB2: 0x00000001
[   41.111100] NDCB3: 0x00000000
[   41.130032] nand: nand_do_read_oob: from = 0x0b340000, len = 64
[   41.136060] marvell-nfc pxa3xx-nand: 
[   41.136060] NDCR:  0x9d079fff
[   41.136060] NDCB0: 0x000d3000
[   41.136060] NDCB1: 0x66800000
[   41.136060] NDCB2: 0x00000001
[   41.136060] NDCB3: 0x00000000
[   41.154993] nand: nand_do_read_oob: from = 0x0b360000, len = 64
[   41.161199] marvell-nfc pxa3xx-nand: 
[   41.161199] NDCR:  0x9d079fff
[   41.161199] NDCB0: 0x000d3000
[   41.161199] NDCB1: 0x66c00000
[   41.161199] NDCB2: 0x00000001
[   41.161199] NDCB3: 0x00000000
[   41.180129] nand: nand_do_read_oob: from = 0x0b380000, len = 64
[   41.186158] marvell-nfc pxa3xx-nand: 
[   41.186158] NDCR:  0x9d079fff
[   41.186158] NDCB0: 0x000d3000
[   41.186158] NDCB1: 0x67000000
[   41.186158] NDCB2: 0x00000001
[   41.186158] NDCB3: 0x00000000
[   41.205093] nand: nand_do_read_oob: from = 0x0b3a0000, len = 64
[   41.211299] marvell-nfc pxa3xx-nand: 
[   41.211299] NDCR:  0x9d079fff
[   41.211299] NDCB0: 0x000d3000
[   41.211299] NDCB1: 0x67400000
[   41.211299] NDCB2: 0x00000001
[   41.211299] NDCB3: 0x00000000
[   41.230229] nand: nand_do_read_oob: from = 0x0b3c0000, len = 64
[   41.236258] marvell-nfc pxa3xx-nand: 
[   41.236258] NDCR:  0x9d079fff
[   41.236258] NDCB0: 0x000d3000
[   41.236258] NDCB1: 0x67800000
[   41.236258] NDCB2: 0x00000001
[   41.236258] NDCB3: 0x00000000
[   41.255191] nand: nand_do_read_oob: from = 0x0b3e0000, len = 64
[   41.261395] marvell-nfc pxa3xx-nand: 
[   41.261395] NDCR:  0x9d079fff
[   41.261395] NDCB0: 0x000d3000
[   41.261395] NDCB1: 0x67c00000
[   41.261395] NDCB2: 0x00000001
[   41.261395] NDCB3: 0x00000000
[   41.280327] nand: nand_do_read_oob: from = 0x0b400000, len = 64
[   41.286357] marvell-nfc pxa3xx-nand: 
[   41.286357] NDCR:  0x9d079fff
[   41.286357] NDCB0: 0x000d3000
[   41.286357] NDCB1: 0x68000000
[   41.286357] NDCB2: 0x00000001
[   41.286357] NDCB3: 0x00000000
[   41.305290] nand: nand_do_read_oob: from = 0x0b420000, len = 64
[   41.311494] marvell-nfc pxa3xx-nand: 
[   41.311494] NDCR:  0x9d079fff
[   41.311494] NDCB0: 0x000d3000
[   41.311494] NDCB1: 0x68400000
[   41.311494] NDCB2: 0x00000001
[   41.311494] NDCB3: 0x00000000
[   41.330425] nand: nand_do_read_oob: from = 0x0b440000, len = 64
[   41.336454] marvell-nfc pxa3xx-nand: 
[   41.336454] NDCR:  0x9d079fff
[   41.336454] NDCB0: 0x000d3000
[   41.336454] NDCB1: 0x68800000
[   41.336454] NDCB2: 0x00000001
[   41.336454] NDCB3: 0x00000000
[   41.355388] nand: nand_do_read_oob: from = 0x0b460000, len = 64
[   41.361591] marvell-nfc pxa3xx-nand: 
[   41.361591] NDCR:  0x9d079fff
[   41.361591] NDCB0: 0x000d3000
[   41.361591] NDCB1: 0x68c00000
[   41.361591] NDCB2: 0x00000001
[   41.361591] NDCB3: 0x00000000
[   41.380522] nand: nand_do_read_oob: from = 0x0b480000, len = 64
[   41.386553] marvell-nfc pxa3xx-nand: 
[   41.386553] NDCR:  0x9d079fff
[   41.386553] NDCB0: 0x000d3000
[   41.386553] NDCB1: 0x69000000
[   41.386553] NDCB2: 0x00000001
[   41.386553] NDCB3: 0x00000000
[   41.405484] nand: nand_do_read_oob: from = 0x0b4a0000, len = 64
[   41.411682] marvell-nfc pxa3xx-nand: 
[   41.411682] NDCR:  0x9d079fff
[   41.411682] NDCB0: 0x000d3000
[   41.411682] NDCB1: 0x69400000
[   41.411682] NDCB2: 0x00000001
[   41.411682] NDCB3: 0x00000000
[   41.430614] nand: nand_do_read_oob: from = 0x0b4c0000, len = 64
[   41.436643] marvell-nfc pxa3xx-nand: 
[   41.436643] NDCR:  0x9d079fff
[   41.436643] NDCB0: 0x000d3000
[   41.436643] NDCB1: 0x69800000
[   41.436643] NDCB2: 0x00000001
[   41.436643] NDCB3: 0x00000000
[   41.455579] nand: nand_do_read_oob: from = 0x0b4e0000, len = 64
[   41.461779] marvell-nfc pxa3xx-nand: 
[   41.461779] NDCR:  0x9d079fff
[   41.461779] NDCB0: 0x000d3000
[   41.461779] NDCB1: 0x69c00000
[   41.461779] NDCB2: 0x00000001
[   41.461779] NDCB3: 0x00000000
[   41.480710] nand: nand_do_read_oob: from = 0x0b500000, len = 64
[   41.486740] marvell-nfc pxa3xx-nand: 
[   41.486740] NDCR:  0x9d079fff
[   41.486740] NDCB0: 0x000d3000
[   41.486740] NDCB1: 0x6a000000
[   41.486740] NDCB2: 0x00000001
[   41.486740] NDCB3: 0x00000000
[   41.505693] nand: nand_do_read_oob: from = 0x0b520000, len = 64
[   41.511897] marvell-nfc pxa3xx-nand: 
[   41.511897] NDCR:  0x9d079fff
[   41.511897] NDCB0: 0x000d3000
[   41.511897] NDCB1: 0x6a400000
[   41.511897] NDCB2: 0x00000001
[   41.511897] NDCB3: 0x00000000
[   41.530827] nand: nand_do_read_oob: from = 0x0b540000, len = 64
[   41.536856] marvell-nfc pxa3xx-nand: 
[   41.536856] NDCR:  0x9d079fff
[   41.536856] NDCB0: 0x000d3000
[   41.536856] NDCB1: 0x6a800000
[   41.536856] NDCB2: 0x00000001
[   41.536856] NDCB3: 0x00000000
[   41.555792] nand: nand_do_read_oob: from = 0x0b560000, len = 64
[   41.561995] marvell-nfc pxa3xx-nand: 
[   41.561995] NDCR:  0x9d079fff
[   41.561995] NDCB0: 0x000d3000
[   41.561995] NDCB1: 0x6ac00000
[   41.561995] NDCB2: 0x00000001
[   41.561995] NDCB3: 0x00000000
[   41.580926] nand: nand_do_read_oob: from = 0x0b580000, len = 64
[   41.586956] marvell-nfc pxa3xx-nand: 
[   41.586956] NDCR:  0x9d079fff
[   41.586956] NDCB0: 0x000d3000
[   41.586956] NDCB1: 0x6b000000
[   41.586956] NDCB2: 0x00000001
[   41.586956] NDCB3: 0x00000000
[   41.605888] nand: nand_do_read_oob: from = 0x0b5a0000, len = 64
[   41.612093] marvell-nfc pxa3xx-nand: 
[   41.612093] NDCR:  0x9d079fff
[   41.612093] NDCB0: 0x000d3000
[   41.612093] NDCB1: 0x6b400000
[   41.612093] NDCB2: 0x00000001
[   41.612093] NDCB3: 0x00000000
[   41.631022] nand: nand_do_read_oob: from = 0x0b5c0000, len = 64
[   41.637055] marvell-nfc pxa3xx-nand: 
[   41.637055] NDCR:  0x9d079fff
[   41.637055] NDCB0: 0x000d3000
[   41.637055] NDCB1: 0x6b800000
[   41.637055] NDCB2: 0x00000001
[   41.637055] NDCB3: 0x00000000
[   41.655984] nand: nand_do_read_oob: from = 0x0b5e0000, len = 64
[   41.662182] marvell-nfc pxa3xx-nand: 
[   41.662182] NDCR:  0x9d079fff
[   41.662182] NDCB0: 0x000d3000
[   41.662182] NDCB1: 0x6bc00000
[   41.662182] NDCB2: 0x00000001
[   41.662182] NDCB3: 0x00000000
[   41.681112] nand: nand_do_read_oob: from = 0x0b600000, len = 64
[   41.687144] marvell-nfc pxa3xx-nand: 
[   41.687144] NDCR:  0x9d079fff
[   41.687144] NDCB0: 0x000d3000
[   41.687144] NDCB1: 0x6c000000
[   41.687144] NDCB2: 0x00000001
[   41.687144] NDCB3: 0x00000000
[   41.706076] nand: nand_do_read_oob: from = 0x0b620000, len = 64
[   41.712272] marvell-nfc pxa3xx-nand: 
[   41.712272] NDCR:  0x9d079fff
[   41.712272] NDCB0: 0x000d3000
[   41.712272] NDCB1: 0x6c400000
[   41.712272] NDCB2: 0x00000001
[   41.712272] NDCB3: 0x00000000
[   41.731202] nand: nand_do_read_oob: from = 0x0b640000, len = 64
[   41.737232] marvell-nfc pxa3xx-nand: 
[   41.737232] NDCR:  0x9d079fff
[   41.737232] NDCB0: 0x000d3000
[   41.737232] NDCB1: 0x6c800000
[   41.737232] NDCB2: 0x00000001
[   41.737232] NDCB3: 0x00000000
[   41.756168] nand: nand_do_read_oob: from = 0x0b660000, len = 64
[   41.762374] marvell-nfc pxa3xx-nand: 
[   41.762374] NDCR:  0x9d079fff
[   41.762374] NDCB0: 0x000d3000
[   41.762374] NDCB1: 0x6cc00000
[   41.762374] NDCB2: 0x00000001
[   41.762374] NDCB3: 0x00000000
[   41.781301] nand: nand_do_read_oob: from = 0x0b680000, len = 64
[   41.787332] marvell-nfc pxa3xx-nand: 
[   41.787332] NDCR:  0x9d079fff
[   41.787332] NDCB0: 0x000d3000
[   41.787332] NDCB1: 0x6d000000
[   41.787332] NDCB2: 0x00000001
[   41.787332] NDCB3: 0x00000000
[   41.806269] nand: nand_do_read_oob: from = 0x0b6a0000, len = 64
[   41.812470] marvell-nfc pxa3xx-nand: 
[   41.812470] NDCR:  0x9d079fff
[   41.812470] NDCB0: 0x000d3000
[   41.812470] NDCB1: 0x6d400000
[   41.812470] NDCB2: 0x00000001
[   41.812470] NDCB3: 0x00000000
[   41.831399] nand: nand_do_read_oob: from = 0x0b6c0000, len = 64
[   41.837430] marvell-nfc pxa3xx-nand: 
[   41.837430] NDCR:  0x9d079fff
[   41.837430] NDCB0: 0x000d3000
[   41.837430] NDCB1: 0x6d800000
[   41.837430] NDCB2: 0x00000001
[   41.837430] NDCB3: 0x00000000
[   41.856366] nand: nand_do_read_oob: from = 0x0b6e0000, len = 64
[   41.862570] marvell-nfc pxa3xx-nand: 
[   41.862570] NDCR:  0x9d079fff
[   41.862570] NDCB0: 0x000d3000
[   41.862570] NDCB1: 0x6dc00000
[   41.862570] NDCB2: 0x00000001
[   41.862570] NDCB3: 0x00000000
[   41.881497] nand: nand_do_read_oob: from = 0x0b700000, len = 64
[   41.887529] marvell-nfc pxa3xx-nand: 
[   41.887529] NDCR:  0x9d079fff
[   41.887529] NDCB0: 0x000d3000
[   41.887529] NDCB1: 0x6e000000
[   41.887529] NDCB2: 0x00000001
[   41.887529] NDCB3: 0x00000000
[   41.906462] nand: nand_do_read_oob: from = 0x0b720000, len = 64
[   41.912666] marvell-nfc pxa3xx-nand: 
[   41.912666] NDCR:  0x9d079fff
[   41.912666] NDCB0: 0x000d3000
[   41.912666] NDCB1: 0x6e400000
[   41.912666] NDCB2: 0x00000001
[   41.912666] NDCB3: 0x00000000
[   41.931596] nand: nand_do_read_oob: from = 0x0b740000, len = 64
[   41.937626] marvell-nfc pxa3xx-nand: 
[   41.937626] NDCR:  0x9d079fff
[   41.937626] NDCB0: 0x000d3000
[   41.937626] NDCB1: 0x6e800000
[   41.937626] NDCB2: 0x00000001
[   41.937626] NDCB3: 0x00000000
[   41.956559] nand: nand_do_read_oob: from = 0x0b760000, len = 64
[   41.962757] marvell-nfc pxa3xx-nand: 
[   41.962757] NDCR:  0x9d079fff
[   41.962757] NDCB0: 0x000d3000
[   41.962757] NDCB1: 0x6ec00000
[   41.962757] NDCB2: 0x00000001
[   41.962757] NDCB3: 0x00000000
[   41.981685] nand: nand_do_read_oob: from = 0x0b780000, len = 64
[   41.987717] marvell-nfc pxa3xx-nand: 
[   41.987717] NDCR:  0x9d079fff
[   41.987717] NDCB0: 0x000d3000
[   41.987717] NDCB1: 0x6f000000
[   41.987717] NDCB2: 0x00000001
[   41.987717] NDCB3: 0x00000000
[   42.006651] nand: nand_do_read_oob: from = 0x0b7a0000, len = 64
[   42.012862] marvell-nfc pxa3xx-nand: 
[   42.012862] NDCR:  0x9d079fff
[   42.012862] NDCB0: 0x000d3000
[   42.012862] NDCB1: 0x6f400000
[   42.012862] NDCB2: 0x00000001
[   42.012862] NDCB3: 0x00000000
[   42.031798] nand: nand_do_read_oob: from = 0x0b7c0000, len = 64
[   42.037834] marvell-nfc pxa3xx-nand: 
[   42.037834] NDCR:  0x9d079fff
[   42.037834] NDCB0: 0x000d3000
[   42.037834] NDCB1: 0x6f800000
[   42.037834] NDCB2: 0x00000001
[   42.037834] NDCB3: 0x00000000
[   42.056765] nand: nand_do_read_oob: from = 0x0b7e0000, len = 64
[   42.062971] marvell-nfc pxa3xx-nand: 
[   42.062971] NDCR:  0x9d079fff
[   42.062971] NDCB0: 0x000d3000
[   42.062971] NDCB1: 0x6fc00000
[   42.062971] NDCB2: 0x00000001
[   42.062971] NDCB3: 0x00000000
[   42.081901] nand: nand_do_read_oob: from = 0x0b800000, len = 64
[   42.087932] marvell-nfc pxa3xx-nand: 
[   42.087932] NDCR:  0x9d079fff
[   42.087932] NDCB0: 0x000d3000
[   42.087932] NDCB1: 0x70000000
[   42.087932] NDCB2: 0x00000001
[   42.087932] NDCB3: 0x00000000
[   42.107299] nand: nand_do_read_oob: from = 0x0b820000, len = 64
[   42.113537] marvell-nfc pxa3xx-nand: 
[   42.113537] NDCR:  0x9d079fff
[   42.113537] NDCB0: 0x000d3000
[   42.113537] NDCB1: 0x70400000
[   42.113537] NDCB2: 0x00000001
[   42.113537] NDCB3: 0x00000000
[   42.132471] nand: nand_do_read_oob: from = 0x0b840000, len = 64
[   42.138504] marvell-nfc pxa3xx-nand: 
[   42.138504] NDCR:  0x9d079fff
[   42.138504] NDCB0: 0x000d3000
[   42.138504] NDCB1: 0x70800000
[   42.138504] NDCB2: 0x00000001
[   42.138504] NDCB3: 0x00000000
[   42.157462] nand: nand_do_read_oob: from = 0x0b860000, len = 64
[   42.163667] marvell-nfc pxa3xx-nand: 
[   42.163667] NDCR:  0x9d079fff
[   42.163667] NDCB0: 0x000d3000
[   42.163667] NDCB1: 0x70c00000
[   42.163667] NDCB2: 0x00000001
[   42.163667] NDCB3: 0x00000000
[   42.182596] nand: nand_do_read_oob: from = 0x0b880000, len = 64
[   42.188630] marvell-nfc pxa3xx-nand: 
[   42.188630] NDCR:  0x9d079fff
[   42.188630] NDCB0: 0x000d3000
[   42.188630] NDCB1: 0x71000000
[   42.188630] NDCB2: 0x00000001
[   42.188630] NDCB3: 0x00000000
[   42.207679] nand: nand_do_read_oob: from = 0x0b8a0000, len = 64
[   42.213879] marvell-nfc pxa3xx-nand: 
[   42.213879] NDCR:  0x9d079fff
[   42.213879] NDCB0: 0x000d3000
[   42.213879] NDCB1: 0x71400000
[   42.213879] NDCB2: 0x00000001
[   42.213879] NDCB3: 0x00000000
[   42.232808] nand: nand_do_read_oob: from = 0x0b8c0000, len = 64
[   42.239009] marvell-nfc pxa3xx-nand: 
[   42.239009] NDCR:  0x9d079fff
[   42.239009] NDCB0: 0x000d3000
[   42.239009] NDCB1: 0x71800000
[   42.239009] NDCB2: 0x00000001
[   42.239009] NDCB3: 0x00000000
[   42.257930] nand: nand_do_read_oob: from = 0x0b8e0000, len = 64
[   42.264130] marvell-nfc pxa3xx-nand: 
[   42.264130] NDCR:  0x9d079fff
[   42.264130] NDCB0: 0x000d3000
[   42.264130] NDCB1: 0x71c00000
[   42.264130] NDCB2: 0x00000001
[   42.264130] NDCB3: 0x00000000
[   42.283062] nand: nand_do_read_oob: from = 0x0b900000, len = 64
[   42.289262] marvell-nfc pxa3xx-nand: 
[   42.289262] NDCR:  0x9d079fff
[   42.289262] NDCB0: 0x000d3000
[   42.289262] NDCB1: 0x72000000
[   42.289262] NDCB2: 0x00000001
[   42.289262] NDCB3: 0x00000000
[   42.308182] nand: nand_do_read_oob: from = 0x0b920000, len = 64
[   42.314386] marvell-nfc pxa3xx-nand: 
[   42.314386] NDCR:  0x9d079fff
[   42.314386] NDCB0: 0x000d3000
[   42.314386] NDCB1: 0x72400000
[   42.314386] NDCB2: 0x00000001
[   42.314386] NDCB3: 0x00000000
[   42.333315] nand: nand_do_read_oob: from = 0x0b940000, len = 64
[   42.339516] marvell-nfc pxa3xx-nand: 
[   42.339516] NDCR:  0x9d079fff
[   42.339516] NDCB0: 0x000d3000
[   42.339516] NDCB1: 0x72800000
[   42.339516] NDCB2: 0x00000001
[   42.339516] NDCB3: 0x00000000
[   42.358435] nand: nand_do_read_oob: from = 0x0b960000, len = 64
[   42.364639] marvell-nfc pxa3xx-nand: 
[   42.364639] NDCR:  0x9d079fff
[   42.364639] NDCB0: 0x000d3000
[   42.364639] NDCB1: 0x72c00000
[   42.364639] NDCB2: 0x00000001
[   42.364639] NDCB3: 0x00000000
[   42.383567] nand: nand_do_read_oob: from = 0x0b980000, len = 64
[   42.389770] marvell-nfc pxa3xx-nand: 
[   42.389770] NDCR:  0x9d079fff
[   42.389770] NDCB0: 0x000d3000
[   42.389770] NDCB1: 0x73000000
[   42.389770] NDCB2: 0x00000001
[   42.389770] NDCB3: 0x00000000
[   42.408784] nand: nand_do_read_oob: from = 0x0b9a0000, len = 64
[   42.414819] marvell-nfc pxa3xx-nand: 
[   42.414819] NDCR:  0x9d079fff
[   42.414819] NDCB0: 0x000d3000
[   42.414819] NDCB1: 0x73400000
[   42.414819] NDCB2: 0x00000001
[   42.414819] NDCB3: 0x00000000
[   42.433736] nand: nand_do_read_oob: from = 0x0b9c0000, len = 64
[   42.439937] marvell-nfc pxa3xx-nand: 
[   42.439937] NDCR:  0x9d079fff
[   42.439937] NDCB0: 0x000d3000
[   42.439937] NDCB1: 0x73800000
[   42.439937] NDCB2: 0x00000001
[   42.439937] NDCB3: 0x00000000
[   42.458900] nand: nand_do_read_oob: from = 0x0b9e0000, len = 64
[   42.464937] marvell-nfc pxa3xx-nand: 
[   42.464937] NDCR:  0x9d079fff
[   42.464937] NDCB0: 0x000d3000
[   42.464937] NDCB1: 0x73c00000
[   42.464937] NDCB2: 0x00000001
[   42.464937] NDCB3: 0x00000000
[   42.483875] nand: nand_do_read_oob: from = 0x0ba00000, len = 64
[   42.490079] marvell-nfc pxa3xx-nand: 
[   42.490079] NDCR:  0x9d079fff
[   42.490079] NDCB0: 0x000d3000
[   42.490079] NDCB1: 0x74000000
[   42.490079] NDCB2: 0x00000001
[   42.490079] NDCB3: 0x00000000
[   42.509044] nand: nand_do_read_oob: from = 0x0ba20000, len = 64
[   42.515075] marvell-nfc pxa3xx-nand: 
[   42.515075] NDCR:  0x9d079fff
[   42.515075] NDCB0: 0x000d3000
[   42.515075] NDCB1: 0x74400000
[   42.515075] NDCB2: 0x00000001
[   42.515075] NDCB3: 0x00000000
[   42.534005] nand: nand_do_read_oob: from = 0x0ba40000, len = 64
[   42.540203] marvell-nfc pxa3xx-nand: 
[   42.540203] NDCR:  0x9d079fff
[   42.540203] NDCB0: 0x000d3000
[   42.540203] NDCB1: 0x74800000
[   42.540203] NDCB2: 0x00000001
[   42.540203] NDCB3: 0x00000000
[   42.559132] nand: nand_do_read_oob: from = 0x0ba60000, len = 64
[   42.565165] marvell-nfc pxa3xx-nand: 
[   42.565165] NDCR:  0x9d079fff
[   42.565165] NDCB0: 0x000d3000
[   42.565165] NDCB1: 0x74c00000
[   42.565165] NDCB2: 0x00000001
[   42.565165] NDCB3: 0x00000000
[   42.584096] nand: nand_do_read_oob: from = 0x0ba80000, len = 64
[   42.590305] marvell-nfc pxa3xx-nand: 
[   42.590305] NDCR:  0x9d079fff
[   42.590305] NDCB0: 0x000d3000
[   42.590305] NDCB1: 0x75000000
[   42.590305] NDCB2: 0x00000001
[   42.590305] NDCB3: 0x00000000
[   42.609234] nand: nand_do_read_oob: from = 0x0baa0000, len = 64
[   42.615262] marvell-nfc pxa3xx-nand: 
[   42.615262] NDCR:  0x9d079fff
[   42.615262] NDCB0: 0x000d3000
[   42.615262] NDCB1: 0x75400000
[   42.615262] NDCB2: 0x00000001
[   42.615262] NDCB3: 0x00000000
[   42.634199] nand: nand_do_read_oob: from = 0x0bac0000, len = 64
[   42.640399] marvell-nfc pxa3xx-nand: 
[   42.640399] NDCR:  0x9d079fff
[   42.640399] NDCB0: 0x000d3000
[   42.640399] NDCB1: 0x75800000
[   42.640399] NDCB2: 0x00000001
[   42.640399] NDCB3: 0x00000000
[   42.659330] nand: nand_do_read_oob: from = 0x0bae0000, len = 64
[   42.665362] marvell-nfc pxa3xx-nand: 
[   42.665362] NDCR:  0x9d079fff
[   42.665362] NDCB0: 0x000d3000
[   42.665362] NDCB1: 0x75c00000
[   42.665362] NDCB2: 0x00000001
[   42.665362] NDCB3: 0x00000000
[   42.684295] nand: nand_do_read_oob: from = 0x0bb00000, len = 64
[   42.690500] marvell-nfc pxa3xx-nand: 
[   42.690500] NDCR:  0x9d079fff
[   42.690500] NDCB0: 0x000d3000
[   42.690500] NDCB1: 0x76000000
[   42.690500] NDCB2: 0x00000001
[   42.690500] NDCB3: 0x00000000
[   42.709428] nand: nand_do_read_oob: from = 0x0bb20000, len = 64
[   42.715459] marvell-nfc pxa3xx-nand: 
[   42.715459] NDCR:  0x9d079fff
[   42.715459] NDCB0: 0x000d3000
[   42.715459] NDCB1: 0x76400000
[   42.715459] NDCB2: 0x00000001
[   42.715459] NDCB3: 0x00000000
[   42.734407] nand: nand_do_read_oob: from = 0x0bb40000, len = 64
[   42.740606] marvell-nfc pxa3xx-nand: 
[   42.740606] NDCR:  0x9d079fff
[   42.740606] NDCB0: 0x000d3000
[   42.740606] NDCB1: 0x76800000
[   42.740606] NDCB2: 0x00000001
[   42.740606] NDCB3: 0x00000000
[   42.759533] nand: nand_do_read_oob: from = 0x0bb60000, len = 64
[   42.765567] marvell-nfc pxa3xx-nand: 
[   42.765567] NDCR:  0x9d079fff
[   42.765567] NDCB0: 0x000d3000
[   42.765567] NDCB1: 0x76c00000
[   42.765567] NDCB2: 0x00000001
[   42.765567] NDCB3: 0x00000000
[   42.784499] nand: nand_do_read_oob: from = 0x0bb80000, len = 64
[   42.790706] marvell-nfc pxa3xx-nand: 
[   42.790706] NDCR:  0x9d079fff
[   42.790706] NDCB0: 0x000d3000
[   42.790706] NDCB1: 0x77000000
[   42.790706] NDCB2: 0x00000001
[   42.790706] NDCB3: 0x00000000
[   42.809636] nand: nand_do_read_oob: from = 0x0bba0000, len = 64
[   42.815674] marvell-nfc pxa3xx-nand: 
[   42.815674] NDCR:  0x9d079fff
[   42.815674] NDCB0: 0x000d3000
[   42.815674] NDCB1: 0x77400000
[   42.815674] NDCB2: 0x00000001
[   42.815674] NDCB3: 0x00000000
[   42.834607] nand: nand_do_read_oob: from = 0x0bbc0000, len = 64
[   42.840811] marvell-nfc pxa3xx-nand: 
[   42.840811] NDCR:  0x9d079fff
[   42.840811] NDCB0: 0x000d3000
[   42.840811] NDCB1: 0x77800000
[   42.840811] NDCB2: 0x00000001
[   42.840811] NDCB3: 0x00000000
[   42.859740] nand: nand_do_read_oob: from = 0x0bbe0000, len = 64
[   42.865773] marvell-nfc pxa3xx-nand: 
[   42.865773] NDCR:  0x9d079fff
[   42.865773] NDCB0: 0x000d3000
[   42.865773] NDCB1: 0x77c00000
[   42.865773] NDCB2: 0x00000001
[   42.865773] NDCB3: 0x00000000
[   42.884703] nand: nand_do_read_oob: from = 0x0bc00000, len = 64
[   42.890911] marvell-nfc pxa3xx-nand: 
[   42.890911] NDCR:  0x9d079fff
[   42.890911] NDCB0: 0x000d3000
[   42.890911] NDCB1: 0x78000000
[   42.890911] NDCB2: 0x00000001
[   42.890911] NDCB3: 0x00000000
[   42.909838] nand: nand_do_read_oob: from = 0x0bc20000, len = 64
[   42.915871] marvell-nfc pxa3xx-nand: 
[   42.915871] NDCR:  0x9d079fff
[   42.915871] NDCB0: 0x000d3000
[   42.915871] NDCB1: 0x78400000
[   42.915871] NDCB2: 0x00000001
[   42.915871] NDCB3: 0x00000000
[   42.934803] nand: nand_do_read_oob: from = 0x0bc40000, len = 64
[   42.941010] marvell-nfc pxa3xx-nand: 
[   42.941010] NDCR:  0x9d079fff
[   42.941010] NDCB0: 0x000d3000
[   42.941010] NDCB1: 0x78800000
[   42.941010] NDCB2: 0x00000001
[   42.941010] NDCB3: 0x00000000
[   42.959937] nand: nand_do_read_oob: from = 0x0bc60000, len = 64
[   42.965968] marvell-nfc pxa3xx-nand: 
[   42.965968] NDCR:  0x9d079fff
[   42.965968] NDCB0: 0x000d3000
[   42.965968] NDCB1: 0x78c00000
[   42.965968] NDCB2: 0x00000001
[   42.965968] NDCB3: 0x00000000
[   42.984902] nand: nand_do_read_oob: from = 0x0bc80000, len = 64
[   42.991106] marvell-nfc pxa3xx-nand: 
[   42.991106] NDCR:  0x9d079fff
[   42.991106] NDCB0: 0x000d3000
[   42.991106] NDCB1: 0x79000000
[   42.991106] NDCB2: 0x00000001
[   42.991106] NDCB3: 0x00000000
[   43.010048] nand: nand_do_read_oob: from = 0x0bca0000, len = 64
[   43.016076] marvell-nfc pxa3xx-nand: 
[   43.016076] NDCR:  0x9d079fff
[   43.016076] NDCB0: 0x000d3000
[   43.016076] NDCB1: 0x79400000
[   43.016076] NDCB2: 0x00000001
[   43.016076] NDCB3: 0x00000000
[   43.035007] nand: nand_do_read_oob: from = 0x0bcc0000, len = 64
[   43.041214] marvell-nfc pxa3xx-nand: 
[   43.041214] NDCR:  0x9d079fff
[   43.041214] NDCB0: 0x000d3000
[   43.041214] NDCB1: 0x79800000
[   43.041214] NDCB2: 0x00000001
[   43.041214] NDCB3: 0x00000000
[   43.060141] nand: nand_do_read_oob: from = 0x0bce0000, len = 64
[   43.066175] marvell-nfc pxa3xx-nand: 
[   43.066175] NDCR:  0x9d079fff
[   43.066175] NDCB0: 0x000d3000
[   43.066175] NDCB1: 0x79c00000
[   43.066175] NDCB2: 0x00000001
[   43.066175] NDCB3: 0x00000000
[   43.085105] nand: nand_do_read_oob: from = 0x0bd00000, len = 64
[   43.091314] marvell-nfc pxa3xx-nand: 
[   43.091314] NDCR:  0x9d079fff
[   43.091314] NDCB0: 0x000d3000
[   43.091314] NDCB1: 0x7a000000
[   43.091314] NDCB2: 0x00000001
[   43.091314] NDCB3: 0x00000000
[   43.110240] nand: nand_do_read_oob: from = 0x0bd20000, len = 64
[   43.116272] marvell-nfc pxa3xx-nand: 
[   43.116272] NDCR:  0x9d079fff
[   43.116272] NDCB0: 0x000d3000
[   43.116272] NDCB1: 0x7a400000
[   43.116272] NDCB2: 0x00000001
[   43.116272] NDCB3: 0x00000000
[   43.135204] nand: nand_do_read_oob: from = 0x0bd40000, len = 64
[   43.141411] marvell-nfc pxa3xx-nand: 
[   43.141411] NDCR:  0x9d079fff
[   43.141411] NDCB0: 0x000d3000
[   43.141411] NDCB1: 0x7a800000
[   43.141411] NDCB2: 0x00000001
[   43.141411] NDCB3: 0x00000000
[   43.160337] nand: nand_do_read_oob: from = 0x0bd60000, len = 64
[   43.166371] marvell-nfc pxa3xx-nand: 
[   43.166371] NDCR:  0x9d079fff
[   43.166371] NDCB0: 0x000d3000
[   43.166371] NDCB1: 0x7ac00000
[   43.166371] NDCB2: 0x00000001
[   43.166371] NDCB3: 0x00000000
[   43.185303] nand: nand_do_read_oob: from = 0x0bd80000, len = 64
[   43.191510] marvell-nfc pxa3xx-nand: 
[   43.191510] NDCR:  0x9d079fff
[   43.191510] NDCB0: 0x000d3000
[   43.191510] NDCB1: 0x7b000000
[   43.191510] NDCB2: 0x00000001
[   43.191510] NDCB3: 0x00000000
[   43.210440] nand: nand_do_read_oob: from = 0x0bda0000, len = 64
[   43.216470] marvell-nfc pxa3xx-nand: 
[   43.216470] NDCR:  0x9d079fff
[   43.216470] NDCB0: 0x000d3000
[   43.216470] NDCB1: 0x7b400000
[   43.216470] NDCB2: 0x00000001
[   43.216470] NDCB3: 0x00000000
[   43.235401] nand: nand_do_read_oob: from = 0x0bdc0000, len = 64
[   43.241609] marvell-nfc pxa3xx-nand: 
[   43.241609] NDCR:  0x9d079fff
[   43.241609] NDCB0: 0x000d3000
[   43.241609] NDCB1: 0x7b800000
[   43.241609] NDCB2: 0x00000001
[   43.241609] NDCB3: 0x00000000
[   43.260534] nand: nand_do_read_oob: from = 0x0bde0000, len = 64
[   43.266567] marvell-nfc pxa3xx-nand: 
[   43.266567] NDCR:  0x9d079fff
[   43.266567] NDCB0: 0x000d3000
[   43.266567] NDCB1: 0x7bc00000
[   43.266567] NDCB2: 0x00000001
[   43.266567] NDCB3: 0x00000000
[   43.285500] nand: nand_do_read_oob: from = 0x0be00000, len = 64
[   43.291706] marvell-nfc pxa3xx-nand: 
[   43.291706] NDCR:  0x9d079fff
[   43.291706] NDCB0: 0x000d3000
[   43.291706] NDCB1: 0x7c000000
[   43.291706] NDCB2: 0x00000001
[   43.291706] NDCB3: 0x00000000
[   43.310634] nand: nand_do_read_oob: from = 0x0be20000, len = 64
[   43.316667] marvell-nfc pxa3xx-nand: 
[   43.316667] NDCR:  0x9d079fff
[   43.316667] NDCB0: 0x000d3000
[   43.316667] NDCB1: 0x7c400000
[   43.316667] NDCB2: 0x00000001
[   43.316667] NDCB3: 0x00000000
[   43.335599] nand: nand_do_read_oob: from = 0x0be40000, len = 64
[   43.341803] marvell-nfc pxa3xx-nand: 
[   43.341803] NDCR:  0x9d079fff
[   43.341803] NDCB0: 0x000d3000
[   43.341803] NDCB1: 0x7c800000
[   43.341803] NDCB2: 0x00000001
[   43.341803] NDCB3: 0x00000000
[   43.360751] nand: nand_do_read_oob: from = 0x0be60000, len = 64
[   43.366783] marvell-nfc pxa3xx-nand: 
[   43.366783] NDCR:  0x9d079fff
[   43.366783] NDCB0: 0x000d3000
[   43.366783] NDCB1: 0x7cc00000
[   43.366783] NDCB2: 0x00000001
[   43.366783] NDCB3: 0x00000000
[   43.385715] nand: nand_do_read_oob: from = 0x0be80000, len = 64
[   43.391921] marvell-nfc pxa3xx-nand: 
[   43.391921] NDCR:  0x9d079fff
[   43.391921] NDCB0: 0x000d3000
[   43.391921] NDCB1: 0x7d000000
[   43.391921] NDCB2: 0x00000001
[   43.391921] NDCB3: 0x00000000
[   43.410851] nand: nand_do_read_oob: from = 0x0bea0000, len = 64
[   43.416881] marvell-nfc pxa3xx-nand: 
[   43.416881] NDCR:  0x9d079fff
[   43.416881] NDCB0: 0x000d3000
[   43.416881] NDCB1: 0x7d400000
[   43.416881] NDCB2: 0x00000001
[   43.416881] NDCB3: 0x00000000
[   43.435815] nand: nand_do_read_oob: from = 0x0bec0000, len = 64
[   43.442018] marvell-nfc pxa3xx-nand: 
[   43.442018] NDCR:  0x9d079fff
[   43.442018] NDCB0: 0x000d3000
[   43.442018] NDCB1: 0x7d800000
[   43.442018] NDCB2: 0x00000001
[   43.442018] NDCB3: 0x00000000
[   43.460946] nand: nand_do_read_oob: from = 0x0bee0000, len = 64
[   43.466980] marvell-nfc pxa3xx-nand: 
[   43.466980] NDCR:  0x9d079fff
[   43.466980] NDCB0: 0x000d3000
[   43.466980] NDCB1: 0x7dc00000
[   43.466980] NDCB2: 0x00000001
[   43.466980] NDCB3: 0x00000000
[   43.485911] nand: nand_do_read_oob: from = 0x0bf00000, len = 64
[   43.492120] marvell-nfc pxa3xx-nand: 
[   43.492120] NDCR:  0x9d079fff
[   43.492120] NDCB0: 0x000d3000
[   43.492120] NDCB1: 0x7e000000
[   43.492120] NDCB2: 0x00000001
[   43.492120] NDCB3: 0x00000000
[   43.511044] nand: nand_do_read_oob: from = 0x0bf20000, len = 64
[   43.517078] marvell-nfc pxa3xx-nand: 
[   43.517078] NDCR:  0x9d079fff
[   43.517078] NDCB0: 0x000d3000
[   43.517078] NDCB1: 0x7e400000
[   43.517078] NDCB2: 0x00000001
[   43.517078] NDCB3: 0x00000000
[   43.536008] nand: nand_do_read_oob: from = 0x0bf40000, len = 64
[   43.542207] marvell-nfc pxa3xx-nand: 
[   43.542207] NDCR:  0x9d079fff
[   43.542207] NDCB0: 0x000d3000
[   43.542207] NDCB1: 0x7e800000
[   43.542207] NDCB2: 0x00000001
[   43.542207] NDCB3: 0x00000000
[   43.561135] nand: nand_do_read_oob: from = 0x0bf60000, len = 64
[   43.567167] marvell-nfc pxa3xx-nand: 
[   43.567167] NDCR:  0x9d079fff
[   43.567167] NDCB0: 0x000d3000
[   43.567167] NDCB1: 0x7ec00000
[   43.567167] NDCB2: 0x00000001
[   43.567167] NDCB3: 0x00000000
[   43.586098] nand: nand_do_read_oob: from = 0x0bf80000, len = 64
[   43.592300] marvell-nfc pxa3xx-nand: 
[   43.592300] NDCR:  0x9d079fff
[   43.592300] NDCB0: 0x000d3000
[   43.592300] NDCB1: 0x7f000000
[   43.592300] NDCB2: 0x00000001
[   43.592300] NDCB3: 0x00000000
[   43.611226] nand: nand_do_read_oob: from = 0x0bfa0000, len = 64
[   43.617256] marvell-nfc pxa3xx-nand: 
[   43.617256] NDCR:  0x9d079fff
[   43.617256] NDCB0: 0x000d3000
[   43.617256] NDCB1: 0x7f400000
[   43.617256] NDCB2: 0x00000001
[   43.617256] NDCB3: 0x00000000
[   43.636191] nand: nand_do_read_oob: from = 0x0bfc0000, len = 64
[   43.642397] marvell-nfc pxa3xx-nand: 
[   43.642397] NDCR:  0x9d079fff
[   43.642397] NDCB0: 0x000d3000
[   43.642397] NDCB1: 0x7f800000
[   43.642397] NDCB2: 0x00000001
[   43.642397] NDCB3: 0x00000000
[   43.661323] nand: nand_do_read_oob: from = 0x0bfe0000, len = 64
[   43.667356] marvell-nfc pxa3xx-nand: 
[   43.667356] NDCR:  0x9d079fff
[   43.667356] NDCB0: 0x000d3000
[   43.667356] NDCB1: 0x7fc00000
[   43.667356] NDCB2: 0x00000001
[   43.667356] NDCB3: 0x00000000
[   43.686286] nand: nand_do_read_oob: from = 0x0c000000, len = 64
[   43.692484] marvell-nfc pxa3xx-nand: 
[   43.692484] NDCR:  0x9d079fff
[   43.692484] NDCB0: 0x000d3000
[   43.692484] NDCB1: 0x80000000
[   43.692484] NDCB2: 0x00000001
[   43.692484] NDCB3: 0x00000000
[   43.711411] nand: nand_do_read_oob: from = 0x0c020000, len = 64
[   43.717447] marvell-nfc pxa3xx-nand: 
[   43.717447] NDCR:  0x9d079fff
[   43.717447] NDCB0: 0x000d3000
[   43.717447] NDCB1: 0x80400000
[   43.717447] NDCB2: 0x00000001
[   43.717447] NDCB3: 0x00000000
[   43.736375] nand: nand_do_read_oob: from = 0x0c040000, len = 64
[   43.742575] marvell-nfc pxa3xx-nand: 
[   43.742575] NDCR:  0x9d079fff
[   43.742575] NDCB0: 0x000d3000
[   43.742575] NDCB1: 0x80800000
[   43.742575] NDCB2: 0x00000001
[   43.742575] NDCB3: 0x00000000
[   43.761504] nand: nand_do_read_oob: from = 0x0c060000, len = 64
[   43.767534] marvell-nfc pxa3xx-nand: 
[   43.767534] NDCR:  0x9d079fff
[   43.767534] NDCB0: 0x000d3000
[   43.767534] NDCB1: 0x80c00000
[   43.767534] NDCB2: 0x00000001
[   43.767534] NDCB3: 0x00000000
[   43.786468] nand: nand_do_read_oob: from = 0x0c080000, len = 64
[   43.792673] marvell-nfc pxa3xx-nand: 
[   43.792673] NDCR:  0x9d079fff
[   43.792673] NDCB0: 0x000d3000
[   43.792673] NDCB1: 0x81000000
[   43.792673] NDCB2: 0x00000001
[   43.792673] NDCB3: 0x00000000
[   43.811602] nand: nand_do_read_oob: from = 0x0c0a0000, len = 64
[   43.817633] marvell-nfc pxa3xx-nand: 
[   43.817633] NDCR:  0x9d079fff
[   43.817633] NDCB0: 0x000d3000
[   43.817633] NDCB1: 0x81400000
[   43.817633] NDCB2: 0x00000001
[   43.817633] NDCB3: 0x00000000
[   43.836567] nand: nand_do_read_oob: from = 0x0c0c0000, len = 64
[   43.842772] marvell-nfc pxa3xx-nand: 
[   43.842772] NDCR:  0x9d079fff
[   43.842772] NDCB0: 0x000d3000
[   43.842772] NDCB1: 0x81800000
[   43.842772] NDCB2: 0x00000001
[   43.842772] NDCB3: 0x00000000
[   43.861701] nand: nand_do_read_oob: from = 0x0c0e0000, len = 64
[   43.867731] marvell-nfc pxa3xx-nand: 
[   43.867731] NDCR:  0x9d079fff
[   43.867731] NDCB0: 0x000d3000
[   43.867731] NDCB1: 0x81c00000
[   43.867731] NDCB2: 0x00000001
[   43.867731] NDCB3: 0x00000000
[   43.886666] nand: nand_do_read_oob: from = 0x0c100000, len = 64
[   43.892870] marvell-nfc pxa3xx-nand: 
[   43.892870] NDCR:  0x9d079fff
[   43.892870] NDCB0: 0x000d3000
[   43.892870] NDCB1: 0x82000000
[   43.892870] NDCB2: 0x00000001
[   43.892870] NDCB3: 0x00000000
[   43.911796] nand: nand_do_read_oob: from = 0x0c120000, len = 64
[   43.917831] marvell-nfc pxa3xx-nand: 
[   43.917831] NDCR:  0x9d079fff
[   43.917831] NDCB0: 0x000d3000
[   43.917831] NDCB1: 0x82400000
[   43.917831] NDCB2: 0x00000001
[   43.917831] NDCB3: 0x00000000
[   43.936765] nand: nand_do_read_oob: from = 0x0c140000, len = 64
[   43.942969] marvell-nfc pxa3xx-nand: 
[   43.942969] NDCR:  0x9d079fff
[   43.942969] NDCB0: 0x000d3000
[   43.942969] NDCB1: 0x82800000
[   43.942969] NDCB2: 0x00000001
[   43.942969] NDCB3: 0x00000000
[   43.961898] nand: nand_do_read_oob: from = 0x0c160000, len = 64
[   43.967929] marvell-nfc pxa3xx-nand: 
[   43.967929] NDCR:  0x9d079fff
[   43.967929] NDCB0: 0x000d3000
[   43.967929] NDCB1: 0x82c00000
[   43.967929] NDCB2: 0x00000001
[   43.967929] NDCB3: 0x00000000
[   43.986862] nand: nand_do_read_oob: from = 0x0c180000, len = 64
[   43.993066] marvell-nfc pxa3xx-nand: 
[   43.993066] NDCR:  0x9d079fff
[   43.993066] NDCB0: 0x000d3000
[   43.993066] NDCB1: 0x83000000
[   43.993066] NDCB2: 0x00000001
[   43.993066] NDCB3: 0x00000000
[   44.012024] nand: nand_do_read_oob: from = 0x0c1a0000, len = 64
[   44.018054] marvell-nfc pxa3xx-nand: 
[   44.018054] NDCR:  0x9d079fff
[   44.018054] NDCB0: 0x000d3000
[   44.018054] NDCB1: 0x83400000
[   44.018054] NDCB2: 0x00000001
[   44.018054] NDCB3: 0x00000000
[   44.036985] nand: nand_do_read_oob: from = 0x0c1c0000, len = 64
[   44.043183] marvell-nfc pxa3xx-nand: 
[   44.043183] NDCR:  0x9d079fff
[   44.043183] NDCB0: 0x000d3000
[   44.043183] NDCB1: 0x83800000
[   44.043183] NDCB2: 0x00000001
[   44.043183] NDCB3: 0x00000000
[   44.062110] nand: nand_do_read_oob: from = 0x0c1e0000, len = 64
[   44.068142] marvell-nfc pxa3xx-nand: 
[   44.068142] NDCR:  0x9d079fff
[   44.068142] NDCB0: 0x000d3000
[   44.068142] NDCB1: 0x83c00000
[   44.068142] NDCB2: 0x00000001
[   44.068142] NDCB3: 0x00000000
[   44.087075] nand: nand_do_read_oob: from = 0x0c200000, len = 64
[   44.093561] marvell-nfc pxa3xx-nand: 
[   44.093561] NDCR:  0x9d079fff
[   44.093561] NDCB0: 0x000d3000
[   44.093561] NDCB1: 0x84000000
[   44.093561] NDCB2: 0x00000001
[   44.093561] NDCB3: 0x00000000
[   44.112559] nand: nand_do_read_oob: from = 0x0c220000, len = 64
[   44.118595] marvell-nfc pxa3xx-nand: 
[   44.118595] NDCR:  0x9d079fff
[   44.118595] NDCB0: 0x000d3000
[   44.118595] NDCB1: 0x84400000
[   44.118595] NDCB2: 0x00000001
[   44.118595] NDCB3: 0x00000000
[   44.137638] nand: nand_do_read_oob: from = 0x0c240000, len = 64
[   44.143845] marvell-nfc pxa3xx-nand: 
[   44.143845] NDCR:  0x9d079fff
[   44.143845] NDCB0: 0x000d3000
[   44.143845] NDCB1: 0x84800000
[   44.143845] NDCB2: 0x00000001
[   44.143845] NDCB3: 0x00000000
[   44.162773] nand: nand_do_read_oob: from = 0x0c260000, len = 64
[   44.168976] marvell-nfc pxa3xx-nand: 
[   44.168976] NDCR:  0x9d079fff
[   44.168976] NDCB0: 0x000d3000
[   44.168976] NDCB1: 0x84c00000
[   44.168976] NDCB2: 0x00000001
[   44.168976] NDCB3: 0x00000000
[   44.187900] nand: nand_do_read_oob: from = 0x0c280000, len = 64
[   44.194099] marvell-nfc pxa3xx-nand: 
[   44.194099] NDCR:  0x9d079fff
[   44.194099] NDCB0: 0x000d3000
[   44.194099] NDCB1: 0x85000000
[   44.194099] NDCB2: 0x00000001
[   44.194099] NDCB3: 0x00000000
[   44.213029] nand: nand_do_read_oob: from = 0x0c2a0000, len = 64
[   44.219229] marvell-nfc pxa3xx-nand: 
[   44.219229] NDCR:  0x9d079fff
[   44.219229] NDCB0: 0x000d3000
[   44.219229] NDCB1: 0x85400000
[   44.219229] NDCB2: 0x00000001
[   44.219229] NDCB3: 0x00000000
[   44.238150] nand: nand_do_read_oob: from = 0x0c2c0000, len = 64
[   44.244354] marvell-nfc pxa3xx-nand: 
[   44.244354] NDCR:  0x9d079fff
[   44.244354] NDCB0: 0x000d3000
[   44.244354] NDCB1: 0x85800000
[   44.244354] NDCB2: 0x00000001
[   44.244354] NDCB3: 0x00000000
[   44.263283] nand: nand_do_read_oob: from = 0x0c2e0000, len = 64
[   44.269484] marvell-nfc pxa3xx-nand: 
[   44.269484] NDCR:  0x9d079fff
[   44.269484] NDCB0: 0x000d3000
[   44.269484] NDCB1: 0x85c00000
[   44.269484] NDCB2: 0x00000001
[   44.269484] NDCB3: 0x00000000
[   44.288402] nand: nand_do_read_oob: from = 0x0c300000, len = 64
[   44.294605] marvell-nfc pxa3xx-nand: 
[   44.294605] NDCR:  0x9d079fff
[   44.294605] NDCB0: 0x000d3000
[   44.294605] NDCB1: 0x86000000
[   44.294605] NDCB2: 0x00000001
[   44.294605] NDCB3: 0x00000000
[   44.313536] nand: nand_do_read_oob: from = 0x0c320000, len = 64
[   44.319735] marvell-nfc pxa3xx-nand: 
[   44.319735] NDCR:  0x9d079fff
[   44.319735] NDCB0: 0x000d3000
[   44.319735] NDCB1: 0x86400000
[   44.319735] NDCB2: 0x00000001
[   44.319735] NDCB3: 0x00000000
[   44.338760] nand: nand_do_read_oob: from = 0x0c340000, len = 64
[   44.344797] marvell-nfc pxa3xx-nand: 
[   44.344797] NDCR:  0x9d079fff
[   44.344797] NDCB0: 0x000d3000
[   44.344797] NDCB1: 0x86800000
[   44.344797] NDCB2: 0x00000001
[   44.344797] NDCB3: 0x00000000
[   44.363708] nand: nand_do_read_oob: from = 0x0c360000, len = 64
[   44.369912] marvell-nfc pxa3xx-nand: 
[   44.369912] NDCR:  0x9d079fff
[   44.369912] NDCB0: 0x000d3000
[   44.369912] NDCB1: 0x86c00000
[   44.369912] NDCB2: 0x00000001
[   44.369912] NDCB3: 0x00000000
[   44.388900] nand: nand_do_read_oob: from = 0x0c380000, len = 64
[   44.394936] marvell-nfc pxa3xx-nand: 
[   44.394936] NDCR:  0x9d079fff
[   44.394936] NDCB0: 0x000d3000
[   44.394936] NDCB1: 0x87000000
[   44.394936] NDCB2: 0x00000001
[   44.394936] NDCB3: 0x00000000
[   44.413878] nand: nand_do_read_oob: from = 0x0c3a0000, len = 64
[   44.420079] marvell-nfc pxa3xx-nand: 
[   44.420079] NDCR:  0x9d079fff
[   44.420079] NDCB0: 0x000d3000
[   44.420079] NDCB1: 0x87400000
[   44.420079] NDCB2: 0x00000001
[   44.420079] NDCB3: 0x00000000
[   44.439048] nand: nand_do_read_oob: from = 0x0c3c0000, len = 64
[   44.445083] marvell-nfc pxa3xx-nand: 
[   44.445083] NDCR:  0x9d079fff
[   44.445083] NDCB0: 0x000d3000
[   44.445083] NDCB1: 0x87800000
[   44.445083] NDCB2: 0x00000001
[   44.445083] NDCB3: 0x00000000
[   44.464017] nand: nand_do_read_oob: from = 0x0c3e0000, len = 64
[   44.470222] marvell-nfc pxa3xx-nand: 
[   44.470222] NDCR:  0x9d079fff
[   44.470222] NDCB0: 0x000d3000
[   44.470222] NDCB1: 0x87c00000
[   44.470222] NDCB2: 0x00000001
[   44.470222] NDCB3: 0x00000000
[   44.489150] nand: nand_do_read_oob: from = 0x0c400000, len = 64
[   44.495182] marvell-nfc pxa3xx-nand: 
[   44.495182] NDCR:  0x9d079fff
[   44.495182] NDCB0: 0x000d3000
[   44.495182] NDCB1: 0x88000000
[   44.495182] NDCB2: 0x00000001
[   44.495182] NDCB3: 0x00000000
[   44.514115] nand: nand_do_read_oob: from = 0x0c420000, len = 64
[   44.520320] marvell-nfc pxa3xx-nand: 
[   44.520320] NDCR:  0x9d079fff
[   44.520320] NDCB0: 0x000d3000
[   44.520320] NDCB1: 0x88400000
[   44.520320] NDCB2: 0x00000001
[   44.520320] NDCB3: 0x00000000
[   44.539252] nand: nand_do_read_oob: from = 0x0c440000, len = 64
[   44.545279] marvell-nfc pxa3xx-nand: 
[   44.545279] NDCR:  0x9d079fff
[   44.545279] NDCB0: 0x000d3000
[   44.545279] NDCB1: 0x88800000
[   44.545279] NDCB2: 0x00000001
[   44.545279] NDCB3: 0x00000000
[   44.564215] nand: nand_do_read_oob: from = 0x0c460000, len = 64
[   44.570419] marvell-nfc pxa3xx-nand: 
[   44.570419] NDCR:  0x9d079fff
[   44.570419] NDCB0: 0x000d3000
[   44.570419] NDCB1: 0x88c00000
[   44.570419] NDCB2: 0x00000001
[   44.570419] NDCB3: 0x00000000
[   44.589370] nand: nand_do_read_oob: from = 0x0c480000, len = 64
[   44.595403] marvell-nfc pxa3xx-nand: 
[   44.595403] NDCR:  0x9d079fff
[   44.595403] NDCB0: 0x000d3000
[   44.595403] NDCB1: 0x89000000
[   44.595403] NDCB2: 0x00000001
[   44.595403] NDCB3: 0x00000000
[   44.614338] nand: nand_do_read_oob: from = 0x0c4a0000, len = 64
[   44.620542] marvell-nfc pxa3xx-nand: 
[   44.620542] NDCR:  0x9d079fff
[   44.620542] NDCB0: 0x000d3000
[   44.620542] NDCB1: 0x89400000
[   44.620542] NDCB2: 0x00000001
[   44.620542] NDCB3: 0x00000000
[   44.639473] nand: nand_do_read_oob: from = 0x0c4c0000, len = 64
[   44.645503] marvell-nfc pxa3xx-nand: 
[   44.645503] NDCR:  0x9d079fff
[   44.645503] NDCB0: 0x000d3000
[   44.645503] NDCB1: 0x89800000
[   44.645503] NDCB2: 0x00000001
[   44.645503] NDCB3: 0x00000000
[   44.664626] nand: nand_do_read_oob: from = 0x0c4e0000, len = 64
[   44.670844] marvell-nfc pxa3xx-nand: 
[   44.670844] NDCR:  0x9d079fff
[   44.670844] NDCB0: 0x000d3000
[   44.670844] NDCB1: 0x89c00000
[   44.670844] NDCB2: 0x00000001
[   44.670844] NDCB3: 0x00000000
[   44.689782] nand: nand_do_read_oob: from = 0x0c500000, len = 64
[   44.695808] marvell-nfc pxa3xx-nand: 
[   44.695808] NDCR:  0x9d079fff
[   44.695808] NDCB0: 0x000d3000
[   44.695808] NDCB1: 0x8a000000
[   44.695808] NDCB2: 0x00000001
[   44.695808] NDCB3: 0x00000000
[   44.714743] nand: nand_do_read_oob: from = 0x0c520000, len = 64
[   44.720945] marvell-nfc pxa3xx-nand: 
[   44.720945] NDCR:  0x9d079fff
[   44.720945] NDCB0: 0x000d3000
[   44.720945] NDCB1: 0x8a400000
[   44.720945] NDCB2: 0x00000001
[   44.720945] NDCB3: 0x00000000
[   44.739875] nand: nand_do_read_oob: from = 0x0c540000, len = 64
[   44.745907] marvell-nfc pxa3xx-nand: 
[   44.745907] NDCR:  0x9d079fff
[   44.745907] NDCB0: 0x000d3000
[   44.745907] NDCB1: 0x8a800000
[   44.745907] NDCB2: 0x00000001
[   44.745907] NDCB3: 0x00000000
[   44.764840] nand: nand_do_read_oob: from = 0x0c560000, len = 64
[   44.771043] marvell-nfc pxa3xx-nand: 
[   44.771043] NDCR:  0x9d079fff
[   44.771043] NDCB0: 0x000d3000
[   44.771043] NDCB1: 0x8ac00000
[   44.771043] NDCB2: 0x00000001
[   44.771043] NDCB3: 0x00000000
[   44.789974] nand: nand_do_read_oob: from = 0x0c580000, len = 64
[   44.796005] marvell-nfc pxa3xx-nand: 
[   44.796005] NDCR:  0x9d079fff
[   44.796005] NDCB0: 0x000d3000
[   44.796005] NDCB1: 0x8b000000
[   44.796005] NDCB2: 0x00000001
[   44.796005] NDCB3: 0x00000000
[   44.814939] nand: nand_do_read_oob: from = 0x0c5a0000, len = 64
[   44.821143] marvell-nfc pxa3xx-nand: 
[   44.821143] NDCR:  0x9d079fff
[   44.821143] NDCB0: 0x000d3000
[   44.821143] NDCB1: 0x8b400000
[   44.821143] NDCB2: 0x00000001
[   44.821143] NDCB3: 0x00000000
[   44.840074] nand: nand_do_read_oob: from = 0x0c5c0000, len = 64
[   44.846103] marvell-nfc pxa3xx-nand: 
[   44.846103] NDCR:  0x9d079fff
[   44.846103] NDCB0: 0x000d3000
[   44.846103] NDCB1: 0x8b800000
[   44.846103] NDCB2: 0x00000001
[   44.846103] NDCB3: 0x00000000
[   44.865038] nand: nand_do_read_oob: from = 0x0c5e0000, len = 64
[   44.871241] marvell-nfc pxa3xx-nand: 
[   44.871241] NDCR:  0x9d079fff
[   44.871241] NDCB0: 0x000d3000
[   44.871241] NDCB1: 0x8bc00000
[   44.871241] NDCB2: 0x00000001
[   44.871241] NDCB3: 0x00000000
[   44.890170] nand: nand_do_read_oob: from = 0x0c600000, len = 64
[   44.896201] marvell-nfc pxa3xx-nand: 
[   44.896201] NDCR:  0x9d079fff
[   44.896201] NDCB0: 0x000d3000
[   44.896201] NDCB1: 0x8c000000
[   44.896201] NDCB2: 0x00000001
[   44.896201] NDCB3: 0x00000000
[   44.915137] nand: nand_do_read_oob: from = 0x0c620000, len = 64
[   44.921341] marvell-nfc pxa3xx-nand: 
[   44.921341] NDCR:  0x9d079fff
[   44.921341] NDCB0: 0x000d3000
[   44.921341] NDCB1: 0x8c400000
[   44.921341] NDCB2: 0x00000001
[   44.921341] NDCB3: 0x00000000
[   44.940269] nand: nand_do_read_oob: from = 0x0c640000, len = 64
[   44.946300] marvell-nfc pxa3xx-nand: 
[   44.946300] NDCR:  0x9d079fff
[   44.946300] NDCB0: 0x000d3000
[   44.946300] NDCB1: 0x8c800000
[   44.946300] NDCB2: 0x00000001
[   44.946300] NDCB3: 0x00000000
[   44.965235] nand: nand_do_read_oob: from = 0x0c660000, len = 64
[   44.971437] marvell-nfc pxa3xx-nand: 
[   44.971437] NDCR:  0x9d079fff
[   44.971437] NDCB0: 0x000d3000
[   44.971437] NDCB1: 0x8cc00000
[   44.971437] NDCB2: 0x00000001
[   44.971437] NDCB3: 0x00000000
[   44.990370] nand: nand_do_read_oob: from = 0x0c680000, len = 64
[   44.996399] marvell-nfc pxa3xx-nand: 
[   44.996399] NDCR:  0x9d079fff
[   44.996399] NDCB0: 0x000d3000
[   44.996399] NDCB1: 0x8d000000
[   44.996399] NDCB2: 0x00000001
[   44.996399] NDCB3: 0x00000000
[   45.015345] nand: nand_do_read_oob: from = 0x0c6a0000, len = 64
[   45.021547] marvell-nfc pxa3xx-nand: 
[   45.021547] NDCR:  0x9d079fff
[   45.021547] NDCB0: 0x000d3000
[   45.021547] NDCB1: 0x8d400000
[   45.021547] NDCB2: 0x00000001
[   45.021547] NDCB3: 0x00000000
[   45.040477] nand: nand_do_read_oob: from = 0x0c6c0000, len = 64
[   45.046508] marvell-nfc pxa3xx-nand: 
[   45.046508] NDCR:  0x9d079fff
[   45.046508] NDCB0: 0x000d3000
[   45.046508] NDCB1: 0x8d800000
[   45.046508] NDCB2: 0x00000001
[   45.046508] NDCB3: 0x00000000
[   45.065439] nand: nand_do_read_oob: from = 0x0c6e0000, len = 64
[   45.071644] marvell-nfc pxa3xx-nand: 
[   45.071644] NDCR:  0x9d079fff
[   45.071644] NDCB0: 0x000d3000
[   45.071644] NDCB1: 0x8dc00000
[   45.071644] NDCB2: 0x00000001
[   45.071644] NDCB3: 0x00000000
[   45.090573] nand: nand_do_read_oob: from = 0x0c700000, len = 64
[   45.096603] marvell-nfc pxa3xx-nand: 
[   45.096603] NDCR:  0x9d079fff
[   45.096603] NDCB0: 0x000d3000
[   45.096603] NDCB1: 0x8e000000
[   45.096603] NDCB2: 0x00000001
[   45.096603] NDCB3: 0x00000000
[   45.115543] nand: nand_do_read_oob: from = 0x0c720000, len = 64
[   45.121743] marvell-nfc pxa3xx-nand: 
[   45.121743] NDCR:  0x9d079fff
[   45.121743] NDCB0: 0x000d3000
[   45.121743] NDCB1: 0x8e400000
[   45.121743] NDCB2: 0x00000001
[   45.121743] NDCB3: 0x00000000
[   45.140672] nand: nand_do_read_oob: from = 0x0c740000, len = 64
[   45.146702] marvell-nfc pxa3xx-nand: 
[   45.146702] NDCR:  0x9d079fff
[   45.146702] NDCB0: 0x000d3000
[   45.146702] NDCB1: 0x8e800000
[   45.146702] NDCB2: 0x00000001
[   45.146702] NDCB3: 0x00000000
[   45.165636] nand: nand_do_read_oob: from = 0x0c760000, len = 64
[   45.171839] marvell-nfc pxa3xx-nand: 
[   45.171839] NDCR:  0x9d079fff
[   45.171839] NDCB0: 0x000d3000
[   45.171839] NDCB1: 0x8ec00000
[   45.171839] NDCB2: 0x00000001
[   45.171839] NDCB3: 0x00000000
[   45.190770] nand: nand_do_read_oob: from = 0x0c780000, len = 64
[   45.196802] marvell-nfc pxa3xx-nand: 
[   45.196802] NDCR:  0x9d079fff
[   45.196802] NDCB0: 0x000d3000
[   45.196802] NDCB1: 0x8f000000
[   45.196802] NDCB2: 0x00000001
[   45.196802] NDCB3: 0x00000000
[   45.215735] nand: nand_do_read_oob: from = 0x0c7a0000, len = 64
[   45.221962] marvell-nfc pxa3xx-nand: 
[   45.221962] NDCR:  0x9d079fff
[   45.221962] NDCB0: 0x000d3000
[   45.221962] NDCB1: 0x8f400000
[   45.221962] NDCB2: 0x00000001
[   45.221962] NDCB3: 0x00000000
[   45.240890] nand: nand_do_read_oob: from = 0x0c7c0000, len = 64
[   45.246926] marvell-nfc pxa3xx-nand: 
[   45.246926] NDCR:  0x9d079fff
[   45.246926] NDCB0: 0x000d3000
[   45.246926] NDCB1: 0x8f800000
[   45.246926] NDCB2: 0x00000001
[   45.246926] NDCB3: 0x00000000
[   45.265858] nand: nand_do_read_oob: from = 0x0c7e0000, len = 64
[   45.272055] marvell-nfc pxa3xx-nand: 
[   45.272055] NDCR:  0x9d079fff
[   45.272055] NDCB0: 0x000d3000
[   45.272055] NDCB1: 0x8fc00000
[   45.272055] NDCB2: 0x00000001
[   45.272055] NDCB3: 0x00000000
[   45.290986] nand: nand_do_read_oob: from = 0x0c800000, len = 64
[   45.297017] marvell-nfc pxa3xx-nand: 
[   45.297017] NDCR:  0x9d079fff
[   45.297017] NDCB0: 0x000d3000
[   45.297017] NDCB1: 0x90000000
[   45.297017] NDCB2: 0x00000001
[   45.297017] NDCB3: 0x00000000
[   45.315951] nand: nand_do_read_oob: from = 0x0c820000, len = 64
[   45.322155] marvell-nfc pxa3xx-nand: 
[   45.322155] NDCR:  0x9d079fff
[   45.322155] NDCB0: 0x000d3000
[   45.322155] NDCB1: 0x90400000
[   45.322155] NDCB2: 0x00000001
[   45.322155] NDCB3: 0x00000000
[   45.341083] nand: nand_do_read_oob: from = 0x0c840000, len = 64
[   45.347114] marvell-nfc pxa3xx-nand: 
[   45.347114] NDCR:  0x9d079fff
[   45.347114] NDCB0: 0x000d3000
[   45.347114] NDCB1: 0x90800000
[   45.347114] NDCB2: 0x00000001
[   45.347114] NDCB3: 0x00000000
[   45.366048] nand: nand_do_read_oob: from = 0x0c860000, len = 64
[   45.372252] marvell-nfc pxa3xx-nand: 
[   45.372252] NDCR:  0x9d079fff
[   45.372252] NDCB0: 0x000d3000
[   45.372252] NDCB1: 0x90c00000
[   45.372252] NDCB2: 0x00000001
[   45.372252] NDCB3: 0x00000000
[   45.391181] nand: nand_do_read_oob: from = 0x0c880000, len = 64
[   45.397214] marvell-nfc pxa3xx-nand: 
[   45.397214] NDCR:  0x9d079fff
[   45.397214] NDCB0: 0x000d3000
[   45.397214] NDCB1: 0x91000000
[   45.397214] NDCB2: 0x00000001
[   45.397214] NDCB3: 0x00000000
[   45.416144] nand: nand_do_read_oob: from = 0x0c8a0000, len = 64
[   45.422344] marvell-nfc pxa3xx-nand: 
[   45.422344] NDCR:  0x9d079fff
[   45.422344] NDCB0: 0x000d3000
[   45.422344] NDCB1: 0x91400000
[   45.422344] NDCB2: 0x00000001
[   45.422344] NDCB3: 0x00000000
[   45.441271] nand: nand_do_read_oob: from = 0x0c8c0000, len = 64
[   45.447303] marvell-nfc pxa3xx-nand: 
[   45.447303] NDCR:  0x9d079fff
[   45.447303] NDCB0: 0x000d3000
[   45.447303] NDCB1: 0x91800000
[   45.447303] NDCB2: 0x00000001
[   45.447303] NDCB3: 0x00000000
[   45.466236] nand: nand_do_read_oob: from = 0x0c8e0000, len = 64
[   45.472441] marvell-nfc pxa3xx-nand: 
[   45.472441] NDCR:  0x9d079fff
[   45.472441] NDCB0: 0x000d3000
[   45.472441] NDCB1: 0x91c00000
[   45.472441] NDCB2: 0x00000001
[   45.472441] NDCB3: 0x00000000
[   45.491370] nand: nand_do_read_oob: from = 0x0c900000, len = 64
[   45.497400] marvell-nfc pxa3xx-nand: 
[   45.497400] NDCR:  0x9d079fff
[   45.497400] NDCB0: 0x000d3000
[   45.497400] NDCB1: 0x92000000
[   45.497400] NDCB2: 0x00000001
[   45.497400] NDCB3: 0x00000000
[   45.516333] nand: nand_do_read_oob: from = 0x0c920000, len = 64
[   45.522540] marvell-nfc pxa3xx-nand: 
[   45.522540] NDCR:  0x9d079fff
[   45.522540] NDCB0: 0x000d3000
[   45.522540] NDCB1: 0x92400000
[   45.522540] NDCB2: 0x00000001
[   45.522540] NDCB3: 0x00000000
[   45.541466] nand: nand_do_read_oob: from = 0x0c940000, len = 64
[   45.547499] marvell-nfc pxa3xx-nand: 
[   45.547499] NDCR:  0x9d079fff
[   45.547499] NDCB0: 0x000d3000
[   45.547499] NDCB1: 0x92800000
[   45.547499] NDCB2: 0x00000001
[   45.547499] NDCB3: 0x00000000
[   45.566431] nand: nand_do_read_oob: from = 0x0c960000, len = 64
[   45.572640] marvell-nfc pxa3xx-nand: 
[   45.572640] NDCR:  0x9d079fff
[   45.572640] NDCB0: 0x000d3000
[   45.572640] NDCB1: 0x92c00000
[   45.572640] NDCB2: 0x00000001
[   45.572640] NDCB3: 0x00000000
[   45.591565] nand: nand_do_read_oob: from = 0x0c980000, len = 64
[   45.597597] marvell-nfc pxa3xx-nand: 
[   45.597597] NDCR:  0x9d079fff
[   45.597597] NDCB0: 0x000d3000
[   45.597597] NDCB1: 0x93000000
[   45.597597] NDCB2: 0x00000001
[   45.597597] NDCB3: 0x00000000
[   45.616531] nand: nand_do_read_oob: from = 0x0c9a0000, len = 64
[   45.622738] marvell-nfc pxa3xx-nand: 
[   45.622738] NDCR:  0x9d079fff
[   45.622738] NDCB0: 0x000d3000
[   45.622738] NDCB1: 0x93400000
[   45.622738] NDCB2: 0x00000001
[   45.622738] NDCB3: 0x00000000
[   45.641664] nand: nand_do_read_oob: from = 0x0c9c0000, len = 64
[   45.647698] marvell-nfc pxa3xx-nand: 
[   45.647698] NDCR:  0x9d079fff
[   45.647698] NDCB0: 0x000d3000
[   45.647698] NDCB1: 0x93800000
[   45.647698] NDCB2: 0x00000001
[   45.647698] NDCB3: 0x00000000
[   45.666628] nand: nand_do_read_oob: from = 0x0c9e0000, len = 64
[   45.672826] marvell-nfc pxa3xx-nand: 
[   45.672826] NDCR:  0x9d079fff
[   45.672826] NDCB0: 0x000d3000
[   45.672826] NDCB1: 0x93c00000
[   45.672826] NDCB2: 0x00000001
[   45.672826] NDCB3: 0x00000000
[   45.691753] nand: nand_do_read_oob: from = 0x0ca00000, len = 64
[   45.697787] marvell-nfc pxa3xx-nand: 
[   45.697787] NDCR:  0x9d079fff
[   45.697787] NDCB0: 0x000d3000
[   45.697787] NDCB1: 0x94000000
[   45.697787] NDCB2: 0x00000001
[   45.697787] NDCB3: 0x00000000
[   45.716719] nand: nand_do_read_oob: from = 0x0ca20000, len = 64
[   45.722924] marvell-nfc pxa3xx-nand: 
[   45.722924] NDCR:  0x9d079fff
[   45.722924] NDCB0: 0x000d3000
[   45.722924] NDCB1: 0x94400000
[   45.722924] NDCB2: 0x00000001
[   45.722924] NDCB3: 0x00000000
[   45.741853] nand: nand_do_read_oob: from = 0x0ca40000, len = 64
[   45.747886] marvell-nfc pxa3xx-nand: 
[   45.747886] NDCR:  0x9d079fff
[   45.747886] NDCB0: 0x000d3000
[   45.747886] NDCB1: 0x94800000
[   45.747886] NDCB2: 0x00000001
[   45.747886] NDCB3: 0x00000000
[   45.766817] nand: nand_do_read_oob: from = 0x0ca60000, len = 64
[   45.773022] marvell-nfc pxa3xx-nand: 
[   45.773022] NDCR:  0x9d079fff
[   45.773022] NDCB0: 0x000d3000
[   45.773022] NDCB1: 0x94c00000
[   45.773022] NDCB2: 0x00000001
[   45.773022] NDCB3: 0x00000000
[   45.791951] nand: nand_do_read_oob: from = 0x0ca80000, len = 64
[   45.797983] marvell-nfc pxa3xx-nand: 
[   45.797983] NDCR:  0x9d079fff
[   45.797983] NDCB0: 0x000d3000
[   45.797983] NDCB1: 0x95000000
[   45.797983] NDCB2: 0x00000001
[   45.797983] NDCB3: 0x00000000
[   45.816918] nand: nand_do_read_oob: from = 0x0caa0000, len = 64
[   45.823121] marvell-nfc pxa3xx-nand: 
[   45.823121] NDCR:  0x9d079fff
[   45.823121] NDCB0: 0x000d3000
[   45.823121] NDCB1: 0x95400000
[   45.823121] NDCB2: 0x00000001
[   45.823121] NDCB3: 0x00000000
[   45.842051] nand: nand_do_read_oob: from = 0x0cac0000, len = 64
[   45.848082] marvell-nfc pxa3xx-nand: 
[   45.848082] NDCR:  0x9d079fff
[   45.848082] NDCB0: 0x000d3000
[   45.848082] NDCB1: 0x95800000
[   45.848082] NDCB2: 0x00000001
[   45.848082] NDCB3: 0x00000000
[   45.867030] nand: nand_do_read_oob: from = 0x0cae0000, len = 64
[   45.873241] marvell-nfc pxa3xx-nand: 
[   45.873241] NDCR:  0x9d079fff
[   45.873241] NDCB0: 0x000d3000
[   45.873241] NDCB1: 0x95c00000
[   45.873241] NDCB2: 0x00000001
[   45.873241] NDCB3: 0x00000000
[   45.892165] nand: nand_do_read_oob: from = 0x0cb00000, len = 64
[   45.898198] marvell-nfc pxa3xx-nand: 
[   45.898198] NDCR:  0x9d079fff
[   45.898198] NDCB0: 0x000d3000
[   45.898198] NDCB1: 0x96000000
[   45.898198] NDCB2: 0x00000001
[   45.898198] NDCB3: 0x00000000
[   45.917130] nand: nand_do_read_oob: from = 0x0cb20000, len = 64
[   45.923335] marvell-nfc pxa3xx-nand: 
[   45.923335] NDCR:  0x9d079fff
[   45.923335] NDCB0: 0x000d3000
[   45.923335] NDCB1: 0x96400000
[   45.923335] NDCB2: 0x00000001
[   45.923335] NDCB3: 0x00000000
[   45.942263] nand: nand_do_read_oob: from = 0x0cb40000, len = 64
[   45.948295] marvell-nfc pxa3xx-nand: 
[   45.948295] NDCR:  0x9d079fff
[   45.948295] NDCB0: 0x000d3000
[   45.948295] NDCB1: 0x96800000
[   45.948295] NDCB2: 0x00000001
[   45.948295] NDCB3: 0x00000000
[   45.967227] nand: nand_do_read_oob: from = 0x0cb60000, len = 64
[   45.973433] marvell-nfc pxa3xx-nand: 
[   45.973433] NDCR:  0x9d079fff
[   45.973433] NDCB0: 0x000d3000
[   45.973433] NDCB1: 0x96c00000
[   45.973433] NDCB2: 0x00000001
[   45.973433] NDCB3: 0x00000000
[   45.992362] nand: nand_do_read_oob: from = 0x0cb80000, len = 64
[   45.998395] marvell-nfc pxa3xx-nand: 
[   45.998395] NDCR:  0x9d079fff
[   45.998395] NDCB0: 0x000d3000
[   45.998395] NDCB1: 0x97000000
[   45.998395] NDCB2: 0x00000001
[   45.998395] NDCB3: 0x00000000
[   46.017334] nand: nand_do_read_oob: from = 0x0cba0000, len = 64
[   46.023535] marvell-nfc pxa3xx-nand: 
[   46.023535] NDCR:  0x9d079fff
[   46.023535] NDCB0: 0x000d3000
[   46.023535] NDCB1: 0x97400000
[   46.023535] NDCB2: 0x00000001
[   46.023535] NDCB3: 0x00000000
[   46.042461] nand: nand_do_read_oob: from = 0x0cbc0000, len = 64
[   46.048492] marvell-nfc pxa3xx-nand: 
[   46.048492] NDCR:  0x9d079fff
[   46.048492] NDCB0: 0x000d3000
[   46.048492] NDCB1: 0x97800000
[   46.048492] NDCB2: 0x00000001
[   46.048492] NDCB3: 0x00000000
[   46.067425] nand: nand_do_read_oob: from = 0x0cbe0000, len = 64
[   46.073630] marvell-nfc pxa3xx-nand: 
[   46.073630] NDCR:  0x9d079fff
[   46.073630] NDCB0: 0x000d3000
[   46.073630] NDCB1: 0x97c00000
[   46.073630] NDCB2: 0x00000001
[   46.073630] NDCB3: 0x00000000
[   46.092889] nand: nand_do_read_oob: from = 0x0cc00000, len = 64
[   46.099125] marvell-nfc pxa3xx-nand: 
[   46.099125] NDCR:  0x9d079fff
[   46.099125] NDCB0: 0x000d3000
[   46.099125] NDCB1: 0x98000000
[   46.099125] NDCB2: 0x00000001
[   46.099125] NDCB3: 0x00000000
[   46.118047] nand: nand_do_read_oob: from = 0x0cc20000, len = 64
[   46.124245] marvell-nfc pxa3xx-nand: 
[   46.124245] NDCR:  0x9d079fff
[   46.124245] NDCB0: 0x000d3000
[   46.124245] NDCB1: 0x98400000
[   46.124245] NDCB2: 0x00000001
[   46.124245] NDCB3: 0x00000000
[   46.143177] nand: nand_do_read_oob: from = 0x0cc40000, len = 64
[   46.149376] marvell-nfc pxa3xx-nand: 
[   46.149376] NDCR:  0x9d079fff
[   46.149376] NDCB0: 0x000d3000
[   46.149376] NDCB1: 0x98800000
[   46.149376] NDCB2: 0x00000001
[   46.149376] NDCB3: 0x00000000
[   46.168296] nand: nand_do_read_oob: from = 0x0cc60000, len = 64
[   46.174499] marvell-nfc pxa3xx-nand: 
[   46.174499] NDCR:  0x9d079fff
[   46.174499] NDCB0: 0x000d3000
[   46.174499] NDCB1: 0x98c00000
[   46.174499] NDCB2: 0x00000001
[   46.174499] NDCB3: 0x00000000
[   46.193429] nand: nand_do_read_oob: from = 0x0cc80000, len = 64
[   46.199629] marvell-nfc pxa3xx-nand: 
[   46.199629] NDCR:  0x9d079fff
[   46.199629] NDCB0: 0x000d3000
[   46.199629] NDCB1: 0x99000000
[   46.199629] NDCB2: 0x00000001
[   46.199629] NDCB3: 0x00000000
[   46.218551] nand: nand_do_read_oob: from = 0x0cca0000, len = 64
[   46.224752] marvell-nfc pxa3xx-nand: 
[   46.224752] NDCR:  0x9d079fff
[   46.224752] NDCB0: 0x000d3000
[   46.224752] NDCB1: 0x99400000
[   46.224752] NDCB2: 0x00000001
[   46.224752] NDCB3: 0x00000000
[   46.243681] nand: nand_do_read_oob: from = 0x0ccc0000, len = 64
[   46.249884] marvell-nfc pxa3xx-nand: 
[   46.249884] NDCR:  0x9d079fff
[   46.249884] NDCB0: 0x000d3000
[   46.249884] NDCB1: 0x99800000
[   46.249884] NDCB2: 0x00000001
[   46.249884] NDCB3: 0x00000000
[   46.268877] nand: nand_do_read_oob: from = 0x0cce0000, len = 64
[   46.274909] marvell-nfc pxa3xx-nand: 
[   46.274909] NDCR:  0x9d079fff
[   46.274909] NDCB0: 0x000d3000
[   46.274909] NDCB1: 0x99c00000
[   46.274909] NDCB2: 0x00000001
[   46.274909] NDCB3: 0x00000000
[   46.293845] nand: nand_do_read_oob: from = 0x0cd00000, len = 64
[   46.300044] marvell-nfc pxa3xx-nand: 
[   46.300044] NDCR:  0x9d079fff
[   46.300044] NDCB0: 0x000d3000
[   46.300044] NDCB1: 0x9a000000
[   46.300044] NDCB2: 0x00000001
[   46.300044] NDCB3: 0x00000000
[   46.319009] nand: nand_do_read_oob: from = 0x0cd20000, len = 64
[   46.325037] marvell-nfc pxa3xx-nand: 
[   46.325037] NDCR:  0x9d079fff
[   46.325037] NDCB0: 0x000d3000
[   46.325037] NDCB1: 0x9a400000
[   46.325037] NDCB2: 0x00000001
[   46.325037] NDCB3: 0x00000000
[   46.343971] nand: nand_do_read_oob: from = 0x0cd40000, len = 64
[   46.350177] marvell-nfc pxa3xx-nand: 
[   46.350177] NDCR:  0x9d079fff
[   46.350177] NDCB0: 0x000d3000
[   46.350177] NDCB1: 0x9a800000
[   46.350177] NDCB2: 0x00000001
[   46.350177] NDCB3: 0x00000000
[   46.369103] nand: nand_do_read_oob: from = 0x0cd60000, len = 64
[   46.375136] marvell-nfc pxa3xx-nand: 
[   46.375136] NDCR:  0x9d079fff
[   46.375136] NDCB0: 0x000d3000
[   46.375136] NDCB1: 0x9ac00000
[   46.375136] NDCB2: 0x00000001
[   46.375136] NDCB3: 0x00000000
[   46.394070] nand: nand_do_read_oob: from = 0x0cd80000, len = 64
[   46.400273] marvell-nfc pxa3xx-nand: 
[   46.400273] NDCR:  0x9d079fff
[   46.400273] NDCB0: 0x000d3000
[   46.400273] NDCB1: 0x9b000000
[   46.400273] NDCB2: 0x00000001
[   46.400273] NDCB3: 0x00000000
[   46.419204] nand: nand_do_read_oob: from = 0x0cda0000, len = 64
[   46.425235] marvell-nfc pxa3xx-nand: 
[   46.425235] NDCR:  0x9d079fff
[   46.425235] NDCB0: 0x000d3000
[   46.425235] NDCB1: 0x9b400000
[   46.425235] NDCB2: 0x00000001
[   46.425235] NDCB3: 0x00000000
[   46.444165] nand: nand_do_read_oob: from = 0x0cdc0000, len = 64
[   46.450364] marvell-nfc pxa3xx-nand: 
[   46.450364] NDCR:  0x9d079fff
[   46.450364] NDCB0: 0x000d3000
[   46.450364] NDCB1: 0x9b800000
[   46.450364] NDCB2: 0x00000001
[   46.450364] NDCB3: 0x00000000
[   46.469315] nand: nand_do_read_oob: from = 0x0cde0000, len = 64
[   46.475343] marvell-nfc pxa3xx-nand: 
[   46.475343] NDCR:  0x9d079fff
[   46.475343] NDCB0: 0x000d3000
[   46.475343] NDCB1: 0x9bc00000
[   46.475343] NDCB2: 0x00000001
[   46.475343] NDCB3: 0x00000000
[   46.494275] nand: nand_do_read_oob: from = 0x0ce00000, len = 64
[   46.500479] marvell-nfc pxa3xx-nand: 
[   46.500479] NDCR:  0x9d079fff
[   46.500479] NDCB0: 0x000d3000
[   46.500479] NDCB1: 0x9c000000
[   46.500479] NDCB2: 0x00000001
[   46.500479] NDCB3: 0x00000000
[   46.519408] nand: nand_do_read_oob: from = 0x0ce20000, len = 64
[   46.525441] marvell-nfc pxa3xx-nand: 
[   46.525441] NDCR:  0x9d079fff
[   46.525441] NDCB0: 0x000d3000
[   46.525441] NDCB1: 0x9c400000
[   46.525441] NDCB2: 0x00000001
[   46.525441] NDCB3: 0x00000000
[   46.544374] nand: nand_do_read_oob: from = 0x0ce40000, len = 64
[   46.550580] marvell-nfc pxa3xx-nand: 
[   46.550580] NDCR:  0x9d079fff
[   46.550580] NDCB0: 0x000d3000
[   46.550580] NDCB1: 0x9c800000
[   46.550580] NDCB2: 0x00000001
[   46.550580] NDCB3: 0x00000000
[   46.569509] nand: nand_do_read_oob: from = 0x0ce60000, len = 64
[   46.575539] marvell-nfc pxa3xx-nand: 
[   46.575539] NDCR:  0x9d079fff
[   46.575539] NDCB0: 0x000d3000
[   46.575539] NDCB1: 0x9cc00000
[   46.575539] NDCB2: 0x00000001
[   46.575539] NDCB3: 0x00000000
[   46.594475] nand: nand_do_read_oob: from = 0x0ce80000, len = 64
[   46.600677] marvell-nfc pxa3xx-nand: 
[   46.600677] NDCR:  0x9d079fff
[   46.600677] NDCB0: 0x000d3000
[   46.600677] NDCB1: 0x9d000000
[   46.600677] NDCB2: 0x00000001
[   46.600677] NDCB3: 0x00000000
[   46.619606] nand: nand_do_read_oob: from = 0x0cea0000, len = 64
[   46.625638] marvell-nfc pxa3xx-nand: 
[   46.625638] NDCR:  0x9d079fff
[   46.625638] NDCB0: 0x000d3000
[   46.625638] NDCB1: 0x9d400000
[   46.625638] NDCB2: 0x00000001
[   46.625638] NDCB3: 0x00000000
[   46.644572] nand: nand_do_read_oob: from = 0x0cec0000, len = 64
[   46.650775] marvell-nfc pxa3xx-nand: 
[   46.650775] NDCR:  0x9d079fff
[   46.650775] NDCB0: 0x000d3000
[   46.650775] NDCB1: 0x9d800000
[   46.650775] NDCB2: 0x00000001
[   46.650775] NDCB3: 0x00000000
[   46.669706] nand: nand_do_read_oob: from = 0x0cee0000, len = 64
[   46.675737] marvell-nfc pxa3xx-nand: 
[   46.675737] NDCR:  0x9d079fff
[   46.675737] NDCB0: 0x000d3000
[   46.675737] NDCB1: 0x9dc00000
[   46.675737] NDCB2: 0x00000001
[   46.675737] NDCB3: 0x00000000
[   46.694670] nand: nand_do_read_oob: from = 0x0cf00000, len = 64
[   46.700875] marvell-nfc pxa3xx-nand: 
[   46.700875] NDCR:  0x9d079fff
[   46.700875] NDCB0: 0x000d3000
[   46.700875] NDCB1: 0x9e000000
[   46.700875] NDCB2: 0x00000001
[   46.700875] NDCB3: 0x00000000
[   46.719802] nand: nand_do_read_oob: from = 0x0cf20000, len = 64
[   46.725834] marvell-nfc pxa3xx-nand: 
[   46.725834] NDCR:  0x9d079fff
[   46.725834] NDCB0: 0x000d3000
[   46.725834] NDCB1: 0x9e400000
[   46.725834] NDCB2: 0x00000001
[   46.725834] NDCB3: 0x00000000
[   46.744765] nand: nand_do_read_oob: from = 0x0cf40000, len = 64
[   46.750964] marvell-nfc pxa3xx-nand: 
[   46.750964] NDCR:  0x9d079fff
[   46.750964] NDCB0: 0x000d3000
[   46.750964] NDCB1: 0x9e800000
[   46.750964] NDCB2: 0x00000001
[   46.750964] NDCB3: 0x00000000
[   46.769892] nand: nand_do_read_oob: from = 0x0cf60000, len = 64
[   46.775924] marvell-nfc pxa3xx-nand: 
[   46.775924] NDCR:  0x9d079fff
[   46.775924] NDCB0: 0x000d3000
[   46.775924] NDCB1: 0x9ec00000
[   46.775924] NDCB2: 0x00000001
[   46.775924] NDCB3: 0x00000000
[   46.794855] nand: nand_do_read_oob: from = 0x0cf80000, len = 64
[   46.801062] marvell-nfc pxa3xx-nand: 
[   46.801062] NDCR:  0x9d079fff
[   46.801062] NDCB0: 0x000d3000
[   46.801062] NDCB1: 0x9f000000
[   46.801062] NDCB2: 0x00000001
[   46.801062] NDCB3: 0x00000000
[   46.819990] nand: nand_do_read_oob: from = 0x0cfa0000, len = 64
[   46.826022] marvell-nfc pxa3xx-nand: 
[   46.826022] NDCR:  0x9d079fff
[   46.826022] NDCB0: 0x000d3000
[   46.826022] NDCB1: 0x9f400000
[   46.826022] NDCB2: 0x00000001
[   46.826022] NDCB3: 0x00000000
[   46.844955] nand: nand_do_read_oob: from = 0x0cfc0000, len = 64
[   46.851162] marvell-nfc pxa3xx-nand: 
[   46.851162] NDCR:  0x9d079fff
[   46.851162] NDCB0: 0x000d3000
[   46.851162] NDCB1: 0x9f800000
[   46.851162] NDCB2: 0x00000001
[   46.851162] NDCB3: 0x00000000
[   46.870089] nand: nand_do_read_oob: from = 0x0cfe0000, len = 64
[   46.876122] marvell-nfc pxa3xx-nand: 
[   46.876122] NDCR:  0x9d079fff
[   46.876122] NDCB0: 0x000d3000
[   46.876122] NDCB1: 0x9fc00000
[   46.876122] NDCB2: 0x00000001
[   46.876122] NDCB3: 0x00000000
[   46.895054] nand: nand_do_read_oob: from = 0x0d000000, len = 64
[   46.901262] marvell-nfc pxa3xx-nand: 
[   46.901262] NDCR:  0x9d079fff
[   46.901262] NDCB0: 0x000d3000
[   46.901262] NDCB1: 0xa0000000
[   46.901262] NDCB2: 0x00000001
[   46.901262] NDCB3: 0x00000000
[   46.920188] nand: nand_do_read_oob: from = 0x0d020000, len = 64
[   46.926220] marvell-nfc pxa3xx-nand: 
[   46.926220] NDCR:  0x9d079fff
[   46.926220] NDCB0: 0x000d3000
[   46.926220] NDCB1: 0xa0400000
[   46.926220] NDCB2: 0x00000001
[   46.926220] NDCB3: 0x00000000
[   46.945153] nand: nand_do_read_oob: from = 0x0d040000, len = 64
[   46.951358] marvell-nfc pxa3xx-nand: 
[   46.951358] NDCR:  0x9d079fff
[   46.951358] NDCB0: 0x000d3000
[   46.951358] NDCB1: 0xa0800000
[   46.951358] NDCB2: 0x00000001
[   46.951358] NDCB3: 0x00000000
[   46.970287] nand: nand_do_read_oob: from = 0x0d060000, len = 64
[   46.976316] marvell-nfc pxa3xx-nand: 
[   46.976316] NDCR:  0x9d079fff
[   46.976316] NDCB0: 0x000d3000
[   46.976316] NDCB1: 0xa0c00000
[   46.976316] NDCB2: 0x00000001
[   46.976316] NDCB3: 0x00000000
[   46.995250] nand: nand_do_read_oob: from = 0x0d080000, len = 64
[   47.001447] marvell-nfc pxa3xx-nand: 
[   47.001447] NDCR:  0x9d079fff
[   47.001447] NDCB0: 0x000d3000
[   47.001447] NDCB1: 0xa1000000
[   47.001447] NDCB2: 0x00000001
[   47.001447] NDCB3: 0x00000000
[   47.020390] nand: nand_do_read_oob: from = 0x0d0a0000, len = 64
[   47.026425] marvell-nfc pxa3xx-nand: 
[   47.026425] NDCR:  0x9d079fff
[   47.026425] NDCB0: 0x000d3000
[   47.026425] NDCB1: 0xa1400000
[   47.026425] NDCB2: 0x00000001
[   47.026425] NDCB3: 0x00000000
[   47.045358] nand: nand_do_read_oob: from = 0x0d0c0000, len = 64
[   47.051563] marvell-nfc pxa3xx-nand: 
[   47.051563] NDCR:  0x9d079fff
[   47.051563] NDCB0: 0x000d3000
[   47.051563] NDCB1: 0xa1800000
[   47.051563] NDCB2: 0x00000001
[   47.051563] NDCB3: 0x00000000
[   47.070492] nand: nand_do_read_oob: from = 0x0d0e0000, len = 64
[   47.076524] marvell-nfc pxa3xx-nand: 
[   47.076524] NDCR:  0x9d079fff
[   47.076524] NDCB0: 0x000d3000
[   47.076524] NDCB1: 0xa1c00000
[   47.076524] NDCB2: 0x00000001
[   47.076524] NDCB3: 0x00000000
[   47.095455] nand: nand_do_read_oob: from = 0x0d100000, len = 64
[   47.101681] marvell-nfc pxa3xx-nand: 
[   47.101681] NDCR:  0x9d079fff
[   47.101681] NDCB0: 0x000d3000
[   47.101681] NDCB1: 0xa2000000
[   47.101681] NDCB2: 0x00000001
[   47.101681] NDCB3: 0x00000000
[   47.120608] nand: nand_do_read_oob: from = 0x0d120000, len = 64
[   47.126638] marvell-nfc pxa3xx-nand: 
[   47.126638] NDCR:  0x9d079fff
[   47.126638] NDCB0: 0x000d3000
[   47.126638] NDCB1: 0xa2400000
[   47.126638] NDCB2: 0x00000001
[   47.126638] NDCB3: 0x00000000
[   47.145573] nand: nand_do_read_oob: from = 0x0d140000, len = 64
[   47.151778] marvell-nfc pxa3xx-nand: 
[   47.151778] NDCR:  0x9d079fff
[   47.151778] NDCB0: 0x000d3000
[   47.151778] NDCB1: 0xa2800000
[   47.151778] NDCB2: 0x00000001
[   47.151778] NDCB3: 0x00000000
[   47.170706] nand: nand_do_read_oob: from = 0x0d160000, len = 64
[   47.176739] marvell-nfc pxa3xx-nand: 
[   47.176739] NDCR:  0x9d079fff
[   47.176739] NDCB0: 0x000d3000
[   47.176739] NDCB1: 0xa2c00000
[   47.176739] NDCB2: 0x00000001
[   47.176739] NDCB3: 0x00000000
[   47.195671] nand: nand_do_read_oob: from = 0x0d180000, len = 64
[   47.201875] marvell-nfc pxa3xx-nand: 
[   47.201875] NDCR:  0x9d079fff
[   47.201875] NDCB0: 0x000d3000
[   47.201875] NDCB1: 0xa3000000
[   47.201875] NDCB2: 0x00000001
[   47.201875] NDCB3: 0x00000000
[   47.220807] nand: nand_do_read_oob: from = 0x0d1a0000, len = 64
[   47.226835] marvell-nfc pxa3xx-nand: 
[   47.226835] NDCR:  0x9d079fff
[   47.226835] NDCB0: 0x000d3000
[   47.226835] NDCB1: 0xa3400000
[   47.226835] NDCB2: 0x00000001
[   47.226835] NDCB3: 0x00000000
[   47.245769] nand: nand_do_read_oob: from = 0x0d1c0000, len = 64
[   47.251975] marvell-nfc pxa3xx-nand: 
[   47.251975] NDCR:  0x9d079fff
[   47.251975] NDCB0: 0x000d3000
[   47.251975] NDCB1: 0xa3800000
[   47.251975] NDCB2: 0x00000001
[   47.251975] NDCB3: 0x00000000
[   47.270905] nand: nand_do_read_oob: from = 0x0d1e0000, len = 64
[   47.276935] marvell-nfc pxa3xx-nand: 
[   47.276935] NDCR:  0x9d079fff
[   47.276935] NDCB0: 0x000d3000
[   47.276935] NDCB1: 0xa3c00000
[   47.276935] NDCB2: 0x00000001
[   47.276935] NDCB3: 0x00000000
[   47.295866] nand: nand_do_read_oob: from = 0x0d200000, len = 64
[   47.302062] marvell-nfc pxa3xx-nand: 
[   47.302062] NDCR:  0x9d079fff
[   47.302062] NDCB0: 0x000d3000
[   47.302062] NDCB1: 0xa4000000
[   47.302062] NDCB2: 0x00000001
[   47.302062] NDCB3: 0x00000000
[   47.320993] nand: nand_do_read_oob: from = 0x0d220000, len = 64
[   47.327024] marvell-nfc pxa3xx-nand: 
[   47.327024] NDCR:  0x9d079fff
[   47.327024] NDCB0: 0x000d3000
[   47.327024] NDCB1: 0xa4400000
[   47.327024] NDCB2: 0x00000001
[   47.327024] NDCB3: 0x00000000
[   47.345960] nand: nand_do_read_oob: from = 0x0d240000, len = 64
[   47.352161] marvell-nfc pxa3xx-nand: 
[   47.352161] NDCR:  0x9d079fff
[   47.352161] NDCB0: 0x000d3000
[   47.352161] NDCB1: 0xa4800000
[   47.352161] NDCB2: 0x00000001
[   47.352161] NDCB3: 0x00000000
[   47.371096] nand: nand_do_read_oob: from = 0x0d260000, len = 64
[   47.377132] marvell-nfc pxa3xx-nand: 
[   47.377132] NDCR:  0x9d079fff
[   47.377132] NDCB0: 0x000d3000
[   47.377132] NDCB1: 0xa4c00000
[   47.377132] NDCB2: 0x00000001
[   47.377132] NDCB3: 0x00000000
[   47.396069] nand: nand_do_read_oob: from = 0x0d280000, len = 64
[   47.402268] marvell-nfc pxa3xx-nand: 
[   47.402268] NDCR:  0x9d079fff
[   47.402268] NDCB0: 0x000d3000
[   47.402268] NDCB1: 0xa5000000
[   47.402268] NDCB2: 0x00000001
[   47.402268] NDCB3: 0x00000000
[   47.421197] nand: nand_do_read_oob: from = 0x0d2a0000, len = 64
[   47.427230] marvell-nfc pxa3xx-nand: 
[   47.427230] NDCR:  0x9d079fff
[   47.427230] NDCB0: 0x000d3000
[   47.427230] NDCB1: 0xa5400000
[   47.427230] NDCB2: 0x00000001
[   47.427230] NDCB3: 0x00000000
[   47.446163] nand: nand_do_read_oob: from = 0x0d2c0000, len = 64
[   47.452369] marvell-nfc pxa3xx-nand: 
[   47.452369] NDCR:  0x9d079fff
[   47.452369] NDCB0: 0x000d3000
[   47.452369] NDCB1: 0xa5800000
[   47.452369] NDCB2: 0x00000001
[   47.452369] NDCB3: 0x00000000
[   47.471297] nand: nand_do_read_oob: from = 0x0d2e0000, len = 64
[   47.477328] marvell-nfc pxa3xx-nand: 
[   47.477328] NDCR:  0x9d079fff
[   47.477328] NDCB0: 0x000d3000
[   47.477328] NDCB1: 0xa5c00000
[   47.477328] NDCB2: 0x00000001
[   47.477328] NDCB3: 0x00000000
[   47.496261] nand: nand_do_read_oob: from = 0x0d300000, len = 64
[   47.502465] marvell-nfc pxa3xx-nand: 
[   47.502465] NDCR:  0x9d079fff
[   47.502465] NDCB0: 0x000d3000
[   47.502465] NDCB1: 0xa6000000
[   47.502465] NDCB2: 0x00000001
[   47.502465] NDCB3: 0x00000000
[   47.521396] nand: nand_do_read_oob: from = 0x0d320000, len = 64
[   47.527426] marvell-nfc pxa3xx-nand: 
[   47.527426] NDCR:  0x9d079fff
[   47.527426] NDCB0: 0x000d3000
[   47.527426] NDCB1: 0xa6400000
[   47.527426] NDCB2: 0x00000001
[   47.527426] NDCB3: 0x00000000
[   47.546361] nand: nand_do_read_oob: from = 0x0d340000, len = 64
[   47.552565] marvell-nfc pxa3xx-nand: 
[   47.552565] NDCR:  0x9d079fff
[   47.552565] NDCB0: 0x000d3000
[   47.552565] NDCB1: 0xa6800000
[   47.552565] NDCB2: 0x00000001
[   47.552565] NDCB3: 0x00000000
[   47.571495] nand: nand_do_read_oob: from = 0x0d360000, len = 64
[   47.577527] marvell-nfc pxa3xx-nand: 
[   47.577527] NDCR:  0x9d079fff
[   47.577527] NDCB0: 0x000d3000
[   47.577527] NDCB1: 0xa6c00000
[   47.577527] NDCB2: 0x00000001
[   47.577527] NDCB3: 0x00000000
[   47.596461] nand: nand_do_read_oob: from = 0x0d380000, len = 64
[   47.602663] marvell-nfc pxa3xx-nand: 
[   47.602663] NDCR:  0x9d079fff
[   47.602663] NDCB0: 0x000d3000
[   47.602663] NDCB1: 0xa7000000
[   47.602663] NDCB2: 0x00000001
[   47.602663] NDCB3: 0x00000000
[   47.621592] nand: nand_do_read_oob: from = 0x0d3a0000, len = 64
[   47.627622] marvell-nfc pxa3xx-nand: 
[   47.627622] NDCR:  0x9d079fff
[   47.627622] NDCB0: 0x000d3000
[   47.627622] NDCB1: 0xa7400000
[   47.627622] NDCB2: 0x00000001
[   47.627622] NDCB3: 0x00000000
[   47.646556] nand: nand_do_read_oob: from = 0x0d3c0000, len = 64
[   47.652754] marvell-nfc pxa3xx-nand: 
[   47.652754] NDCR:  0x9d079fff
[   47.652754] NDCB0: 0x000d3000
[   47.652754] NDCB1: 0xa7800000
[   47.652754] NDCB2: 0x00000001
[   47.652754] NDCB3: 0x00000000
[   47.671681] nand: nand_do_read_oob: from = 0x0d3e0000, len = 64
[   47.677713] marvell-nfc pxa3xx-nand: 
[   47.677713] NDCR:  0x9d079fff
[   47.677713] NDCB0: 0x000d3000
[   47.677713] NDCB1: 0xa7c00000
[   47.677713] NDCB2: 0x00000001
[   47.677713] NDCB3: 0x00000000
[   47.696648] nand: nand_do_read_oob: from = 0x0d400000, len = 64
[   47.702852] marvell-nfc pxa3xx-nand: 
[   47.702852] NDCR:  0x9d079fff
[   47.702852] NDCB0: 0x000d3000
[   47.702852] NDCB1: 0xa8000000
[   47.702852] NDCB2: 0x00000001
[   47.702852] NDCB3: 0x00000000
[   47.721782] nand: nand_do_read_oob: from = 0x0d420000, len = 64
[   47.727812] marvell-nfc pxa3xx-nand: 
[   47.727812] NDCR:  0x9d079fff
[   47.727812] NDCB0: 0x000d3000
[   47.727812] NDCB1: 0xa8400000
[   47.727812] NDCB2: 0x00000001
[   47.727812] NDCB3: 0x00000000
[   47.746762] nand: nand_do_read_oob: from = 0x0d440000, len = 64
[   47.752970] marvell-nfc pxa3xx-nand: 
[   47.752970] NDCR:  0x9d079fff
[   47.752970] NDCB0: 0x000d3000
[   47.752970] NDCB1: 0xa8800000
[   47.752970] NDCB2: 0x00000001
[   47.752970] NDCB3: 0x00000000
[   47.771898] nand: nand_do_read_oob: from = 0x0d460000, len = 64
[   47.777928] marvell-nfc pxa3xx-nand: 
[   47.777928] NDCR:  0x9d079fff
[   47.777928] NDCB0: 0x000d3000
[   47.777928] NDCB1: 0xa8c00000
[   47.777928] NDCB2: 0x00000001
[   47.777928] NDCB3: 0x00000000
[   47.796859] nand: nand_do_read_oob: from = 0x0d480000, len = 64
[   47.803055] marvell-nfc pxa3xx-nand: 
[   47.803055] NDCR:  0x9d079fff
[   47.803055] NDCB0: 0x000d3000
[   47.803055] NDCB1: 0xa9000000
[   47.803055] NDCB2: 0x00000001
[   47.803055] NDCB3: 0x00000000
[   47.821987] nand: nand_do_read_oob: from = 0x0d4a0000, len = 64
[   47.828016] marvell-nfc pxa3xx-nand: 
[   47.828016] NDCR:  0x9d079fff
[   47.828016] NDCB0: 0x000d3000
[   47.828016] NDCB1: 0xa9400000
[   47.828016] NDCB2: 0x00000001
[   47.828016] NDCB3: 0x00000000
[   47.846948] nand: nand_do_read_oob: from = 0x0d4c0000, len = 64
[   47.853146] marvell-nfc pxa3xx-nand: 
[   47.853146] NDCR:  0x9d079fff
[   47.853146] NDCB0: 0x000d3000
[   47.853146] NDCB1: 0xa9800000
[   47.853146] NDCB2: 0x00000001
[   47.853146] NDCB3: 0x00000000
[   47.872076] nand: nand_do_read_oob: from = 0x0d4e0000, len = 64
[   47.878107] marvell-nfc pxa3xx-nand: 
[   47.878107] NDCR:  0x9d079fff
[   47.878107] NDCB0: 0x000d3000
[   47.878107] NDCB1: 0xa9c00000
[   47.878107] NDCB2: 0x00000001
[   47.878107] NDCB3: 0x00000000
[   47.897041] nand: nand_do_read_oob: from = 0x0d500000, len = 64
[   47.903247] marvell-nfc pxa3xx-nand: 
[   47.903247] NDCR:  0x9d079fff
[   47.903247] NDCB0: 0x000d3000
[   47.903247] NDCB1: 0xaa000000
[   47.903247] NDCB2: 0x00000001
[   47.903247] NDCB3: 0x00000000
[   47.922175] nand: nand_do_read_oob: from = 0x0d520000, len = 64
[   47.928205] marvell-nfc pxa3xx-nand: 
[   47.928205] NDCR:  0x9d079fff
[   47.928205] NDCB0: 0x000d3000
[   47.928205] NDCB1: 0xaa400000
[   47.928205] NDCB2: 0x00000001
[   47.928205] NDCB3: 0x00000000
[   47.947139] nand: nand_do_read_oob: from = 0x0d540000, len = 64
[   47.953342] marvell-nfc pxa3xx-nand: 
[   47.953342] NDCR:  0x9d079fff
[   47.953342] NDCB0: 0x000d3000
[   47.953342] NDCB1: 0xaa800000
[   47.953342] NDCB2: 0x00000001
[   47.953342] NDCB3: 0x00000000
[   47.972274] nand: nand_do_read_oob: from = 0x0d560000, len = 64
[   47.978303] marvell-nfc pxa3xx-nand: 
[   47.978303] NDCR:  0x9d079fff
[   47.978303] NDCB0: 0x000d3000
[   47.978303] NDCB1: 0xaac00000
[   47.978303] NDCB2: 0x00000001
[   47.978303] NDCB3: 0x00000000
[   47.997236] nand: nand_do_read_oob: from = 0x0d580000, len = 64
[   48.003442] marvell-nfc pxa3xx-nand: 
[   48.003442] NDCR:  0x9d079fff
[   48.003442] NDCB0: 0x000d3000
[   48.003442] NDCB1: 0xab000000
[   48.003442] NDCB2: 0x00000001
[   48.003442] NDCB3: 0x00000000
[   48.022381] nand: nand_do_read_oob: from = 0x0d5a0000, len = 64
[   48.028411] marvell-nfc pxa3xx-nand: 
[   48.028411] NDCR:  0x9d079fff
[   48.028411] NDCB0: 0x000d3000
[   48.028411] NDCB1: 0xab400000
[   48.028411] NDCB2: 0x00000001
[   48.028411] NDCB3: 0x00000000
[   48.047345] nand: nand_do_read_oob: from = 0x0d5c0000, len = 64
[   48.053549] marvell-nfc pxa3xx-nand: 
[   48.053549] NDCR:  0x9d079fff
[   48.053549] NDCB0: 0x000d3000
[   48.053549] NDCB1: 0xab800000
[   48.053549] NDCB2: 0x00000001
[   48.053549] NDCB3: 0x00000000
[   48.072476] nand: nand_do_read_oob: from = 0x0d5e0000, len = 64
[   48.078509] marvell-nfc pxa3xx-nand: 
[   48.078509] NDCR:  0x9d079fff
[   48.078509] NDCB0: 0x000d3000
[   48.078509] NDCB1: 0xabc00000
[   48.078509] NDCB2: 0x00000001
[   48.078509] NDCB3: 0x00000000
[   48.097879] nand: nand_do_read_oob: from = 0x0d600000, len = 64
[   48.104114] marvell-nfc pxa3xx-nand: 
[   48.104114] NDCR:  0x9d079fff
[   48.104114] NDCB0: 0x000d3000
[   48.104114] NDCB1: 0xac000000
[   48.104114] NDCB2: 0x00000001
[   48.104114] NDCB3: 0x00000000
[   48.123053] nand: nand_do_read_oob: from = 0x0d620000, len = 64
[   48.129253] marvell-nfc pxa3xx-nand: 
[   48.129253] NDCR:  0x9d079fff
[   48.129253] NDCB0: 0x000d3000
[   48.129253] NDCB1: 0xac400000
[   48.129253] NDCB2: 0x00000001
[   48.129253] NDCB3: 0x00000000
[   48.148175] nand: nand_do_read_oob: from = 0x0d640000, len = 64
[   48.154376] marvell-nfc pxa3xx-nand: 
[   48.154376] NDCR:  0x9d079fff
[   48.154376] NDCB0: 0x000d3000
[   48.154376] NDCB1: 0xac800000
[   48.154376] NDCB2: 0x00000001
[   48.154376] NDCB3: 0x00000000
[   48.173310] nand: nand_do_read_oob: from = 0x0d660000, len = 64
[   48.179516] marvell-nfc pxa3xx-nand: 
[   48.179516] NDCR:  0x9d079fff
[   48.179516] NDCB0: 0x000d3000
[   48.179516] NDCB1: 0xacc00000
[   48.179516] NDCB2: 0x00000001
[   48.179516] NDCB3: 0x00000000
[   48.198437] nand: nand_do_read_oob: from = 0x0d680000, len = 64
[   48.204636] marvell-nfc pxa3xx-nand: 
[   48.204636] NDCR:  0x9d079fff
[   48.204636] NDCB0: 0x000d3000
[   48.204636] NDCB1: 0xad000000
[   48.204636] NDCB2: 0x00000001
[   48.204636] NDCB3: 0x00000000
[   48.223568] nand: nand_do_read_oob: from = 0x0d6a0000, len = 64
[   48.229769] marvell-nfc pxa3xx-nand: 
[   48.229769] NDCR:  0x9d079fff
[   48.229769] NDCB0: 0x000d3000
[   48.229769] NDCB1: 0xad400000
[   48.229769] NDCB2: 0x00000001
[   48.229769] NDCB3: 0x00000000
[   48.248784] nand: nand_do_read_oob: from = 0x0d6c0000, len = 64
[   48.254819] marvell-nfc pxa3xx-nand: 
[   48.254819] NDCR:  0x9d079fff
[   48.254819] NDCB0: 0x000d3000
[   48.254819] NDCB1: 0xad800000
[   48.254819] NDCB2: 0x00000001
[   48.254819] NDCB3: 0x00000000
[   48.273742] nand: nand_do_read_oob: from = 0x0d6e0000, len = 64
[   48.279946] marvell-nfc pxa3xx-nand: 
[   48.279946] NDCR:  0x9d079fff
[   48.279946] NDCB0: 0x000d3000
[   48.279946] NDCB1: 0xadc00000
[   48.279946] NDCB2: 0x00000001
[   48.279946] NDCB3: 0x00000000
[   48.298898] nand: nand_do_read_oob: from = 0x0d700000, len = 64
[   48.304935] marvell-nfc pxa3xx-nand: 
[   48.304935] NDCR:  0x9d079fff
[   48.304935] NDCB0: 0x000d3000
[   48.304935] NDCB1: 0xae000000
[   48.304935] NDCB2: 0x00000001
[   48.304935] NDCB3: 0x00000000
[   48.323875] nand: nand_do_read_oob: from = 0x0d720000, len = 64
[   48.330079] marvell-nfc pxa3xx-nand: 
[   48.330079] NDCR:  0x9d079fff
[   48.330079] NDCB0: 0x000d3000
[   48.330079] NDCB1: 0xae400000
[   48.330079] NDCB2: 0x00000001
[   48.330079] NDCB3: 0x00000000
[   48.349067] nand: nand_do_read_oob: from = 0x0d740000, len = 64
[   48.355098] marvell-nfc pxa3xx-nand: 
[   48.355098] NDCR:  0x9d079fff
[   48.355098] NDCB0: 0x000d3000
[   48.355098] NDCB1: 0xae800000
[   48.355098] NDCB2: 0x00000001
[   48.355098] NDCB3: 0x00000000
[   48.374031] nand: nand_do_read_oob: from = 0x0d760000, len = 64
[   48.380237] marvell-nfc pxa3xx-nand: 
[   48.380237] NDCR:  0x9d079fff
[   48.380237] NDCB0: 0x000d3000
[   48.380237] NDCB1: 0xaec00000
[   48.380237] NDCB2: 0x00000001
[   48.380237] NDCB3: 0x00000000
[   48.399163] nand: nand_do_read_oob: from = 0x0d780000, len = 64
[   48.405197] marvell-nfc pxa3xx-nand: 
[   48.405197] NDCR:  0x9d079fff
[   48.405197] NDCB0: 0x000d3000
[   48.405197] NDCB1: 0xaf000000
[   48.405197] NDCB2: 0x00000001
[   48.405197] NDCB3: 0x00000000
[   48.424134] nand: nand_do_read_oob: from = 0x0d7a0000, len = 64
[   48.430336] marvell-nfc pxa3xx-nand: 
[   48.430336] NDCR:  0x9d079fff
[   48.430336] NDCB0: 0x000d3000
[   48.430336] NDCB1: 0xaf400000
[   48.430336] NDCB2: 0x00000001
[   48.430336] NDCB3: 0x00000000
[   48.449263] nand: nand_do_read_oob: from = 0x0d7c0000, len = 64
[   48.455295] marvell-nfc pxa3xx-nand: 
[   48.455295] NDCR:  0x9d079fff
[   48.455295] NDCB0: 0x000d3000
[   48.455295] NDCB1: 0xaf800000
[   48.455295] NDCB2: 0x00000001
[   48.455295] NDCB3: 0x00000000
[   48.474226] nand: nand_do_read_oob: from = 0x0d7e0000, len = 64
[   48.480426] marvell-nfc pxa3xx-nand: 
[   48.480426] NDCR:  0x9d079fff
[   48.480426] NDCB0: 0x000d3000
[   48.480426] NDCB1: 0xafc00000
[   48.480426] NDCB2: 0x00000001
[   48.480426] NDCB3: 0x00000000
[   48.499354] nand: nand_do_read_oob: from = 0x0d800000, len = 64
[   48.505386] marvell-nfc pxa3xx-nand: 
[   48.505386] NDCR:  0x9d079fff
[   48.505386] NDCB0: 0x000d3000
[   48.505386] NDCB1: 0xb0000000
[   48.505386] NDCB2: 0x00000001
[   48.505386] NDCB3: 0x00000000
[   48.524317] nand: nand_do_read_oob: from = 0x0d820000, len = 64
[   48.530523] marvell-nfc pxa3xx-nand: 
[   48.530523] NDCR:  0x9d079fff
[   48.530523] NDCB0: 0x000d3000
[   48.530523] NDCB1: 0xb0400000
[   48.530523] NDCB2: 0x00000001
[   48.530523] NDCB3: 0x00000000
[   48.549450] nand: nand_do_read_oob: from = 0x0d840000, len = 64
[   48.555484] marvell-nfc pxa3xx-nand: 
[   48.555484] NDCR:  0x9d079fff
[   48.555484] NDCB0: 0x000d3000
[   48.555484] NDCB1: 0xb0800000
[   48.555484] NDCB2: 0x00000001
[   48.555484] NDCB3: 0x00000000
[   48.574414] nand: nand_do_read_oob: from = 0x0d860000, len = 64
[   48.580613] marvell-nfc pxa3xx-nand: 
[   48.580613] NDCR:  0x9d079fff
[   48.580613] NDCB0: 0x000d3000
[   48.580613] NDCB1: 0xb0c00000
[   48.580613] NDCB2: 0x00000001
[   48.580613] NDCB3: 0x00000000
[   48.599540] nand: nand_do_read_oob: from = 0x0d880000, len = 64
[   48.605573] marvell-nfc pxa3xx-nand: 
[   48.605573] NDCR:  0x9d079fff
[   48.605573] NDCB0: 0x000d3000
[   48.605573] NDCB1: 0xb1000000
[   48.605573] NDCB2: 0x00000001
[   48.605573] NDCB3: 0x00000000
[   48.624507] nand: nand_do_read_oob: from = 0x0d8a0000, len = 64
[   48.630712] marvell-nfc pxa3xx-nand: 
[   48.630712] NDCR:  0x9d079fff
[   48.630712] NDCB0: 0x000d3000
[   48.630712] NDCB1: 0xb1400000
[   48.630712] NDCB2: 0x00000001
[   48.630712] NDCB3: 0x00000000
[   48.649636] nand: nand_do_read_oob: from = 0x0d8c0000, len = 64
[   48.655671] marvell-nfc pxa3xx-nand: 
[   48.655671] NDCR:  0x9d079fff
[   48.655671] NDCB0: 0x000d3000
[   48.655671] NDCB1: 0xb1800000
[   48.655671] NDCB2: 0x00000001
[   48.655671] NDCB3: 0x00000000
[   48.674606] nand: nand_do_read_oob: from = 0x0d8e0000, len = 64
[   48.680811] marvell-nfc pxa3xx-nand: 
[   48.680811] NDCR:  0x9d079fff
[   48.680811] NDCB0: 0x000d3000
[   48.680811] NDCB1: 0xb1c00000
[   48.680811] NDCB2: 0x00000001
[   48.680811] NDCB3: 0x00000000
[   48.699737] nand: nand_do_read_oob: from = 0x0d900000, len = 64
[   48.705771] marvell-nfc pxa3xx-nand: 
[   48.705771] NDCR:  0x9d079fff
[   48.705771] NDCB0: 0x000d3000
[   48.705771] NDCB1: 0xb2000000
[   48.705771] NDCB2: 0x00000001
[   48.705771] NDCB3: 0x00000000
[   48.724702] nand: nand_do_read_oob: from = 0x0d920000, len = 64
[   48.730909] marvell-nfc pxa3xx-nand: 
[   48.730909] NDCR:  0x9d079fff
[   48.730909] NDCB0: 0x000d3000
[   48.730909] NDCB1: 0xb2400000
[   48.730909] NDCB2: 0x00000001
[   48.730909] NDCB3: 0x00000000
[   48.749835] nand: nand_do_read_oob: from = 0x0d940000, len = 64
[   48.755867] marvell-nfc pxa3xx-nand: 
[   48.755867] NDCR:  0x9d079fff
[   48.755867] NDCB0: 0x000d3000
[   48.755867] NDCB1: 0xb2800000
[   48.755867] NDCB2: 0x00000001
[   48.755867] NDCB3: 0x00000000
[   48.774801] nand: nand_do_read_oob: from = 0x0d960000, len = 64
[   48.781008] marvell-nfc pxa3xx-nand: 
[   48.781008] NDCR:  0x9d079fff
[   48.781008] NDCB0: 0x000d3000
[   48.781008] NDCB1: 0xb2c00000
[   48.781008] NDCB2: 0x00000001
[   48.781008] NDCB3: 0x00000000
[   48.799934] nand: nand_do_read_oob: from = 0x0d980000, len = 64
[   48.805966] marvell-nfc pxa3xx-nand: 
[   48.805966] NDCR:  0x9d079fff
[   48.805966] NDCB0: 0x000d3000
[   48.805966] NDCB1: 0xb3000000
[   48.805966] NDCB2: 0x00000001
[   48.805966] NDCB3: 0x00000000
[   48.824900] nand: nand_do_read_oob: from = 0x0d9a0000, len = 64
[   48.831106] marvell-nfc pxa3xx-nand: 
[   48.831106] NDCR:  0x9d079fff
[   48.831106] NDCB0: 0x000d3000
[   48.831106] NDCB1: 0xb3400000
[   48.831106] NDCB2: 0x00000001
[   48.831106] NDCB3: 0x00000000
[   48.850033] nand: nand_do_read_oob: from = 0x0d9c0000, len = 64
[   48.856066] marvell-nfc pxa3xx-nand: 
[   48.856066] NDCR:  0x9d079fff
[   48.856066] NDCB0: 0x000d3000
[   48.856066] NDCB1: 0xb3800000
[   48.856066] NDCB2: 0x00000001
[   48.856066] NDCB3: 0x00000000
[   48.874996] nand: nand_do_read_oob: from = 0x0d9e0000, len = 64
[   48.881196] marvell-nfc pxa3xx-nand: 
[   48.881196] NDCR:  0x9d079fff
[   48.881196] NDCB0: 0x000d3000
[   48.881196] NDCB1: 0xb3c00000
[   48.881196] NDCB2: 0x00000001
[   48.881196] NDCB3: 0x00000000
[   48.900126] nand: nand_do_read_oob: from = 0x0da00000, len = 64
[   48.906155] marvell-nfc pxa3xx-nand: 
[   48.906155] NDCR:  0x9d079fff
[   48.906155] NDCB0: 0x000d3000
[   48.906155] NDCB1: 0xb4000000
[   48.906155] NDCB2: 0x00000001
[   48.906155] NDCB3: 0x00000000
[   48.925088] nand: nand_do_read_oob: from = 0x0da20000, len = 64
[   48.931293] marvell-nfc pxa3xx-nand: 
[   48.931293] NDCR:  0x9d079fff
[   48.931293] NDCB0: 0x000d3000
[   48.931293] NDCB1: 0xb4400000
[   48.931293] NDCB2: 0x00000001
[   48.931293] NDCB3: 0x00000000
[   48.950222] nand: nand_do_read_oob: from = 0x0da40000, len = 64
[   48.956253] marvell-nfc pxa3xx-nand: 
[   48.956253] NDCR:  0x9d079fff
[   48.956253] NDCB0: 0x000d3000
[   48.956253] NDCB1: 0xb4800000
[   48.956253] NDCB2: 0x00000001
[   48.956253] NDCB3: 0x00000000
[   48.975194] nand: nand_do_read_oob: from = 0x0da60000, len = 64
[   48.981412] marvell-nfc pxa3xx-nand: 
[   48.981412] NDCR:  0x9d079fff
[   48.981412] NDCB0: 0x000d3000
[   48.981412] NDCB1: 0xb4c00000
[   48.981412] NDCB2: 0x00000001
[   48.981412] NDCB3: 0x00000000
[   49.000340] nand: nand_do_read_oob: from = 0x0da80000, len = 64
[   49.006369] marvell-nfc pxa3xx-nand: 
[   49.006369] NDCR:  0x9d079fff
[   49.006369] NDCB0: 0x000d3000
[   49.006369] NDCB1: 0xb5000000
[   49.006369] NDCB2: 0x00000001
[   49.006369] NDCB3: 0x00000000
[   49.025312] nand: nand_do_read_oob: from = 0x0daa0000, len = 64
[   49.031521] marvell-nfc pxa3xx-nand: 
[   49.031521] NDCR:  0x9d079fff
[   49.031521] NDCB0: 0x000d3000
[   49.031521] NDCB1: 0xb5400000
[   49.031521] NDCB2: 0x00000001
[   49.031521] NDCB3: 0x00000000
[   49.050446] nand: nand_do_read_oob: from = 0x0dac0000, len = 64
[   49.056477] marvell-nfc pxa3xx-nand: 
[   49.056477] NDCR:  0x9d079fff
[   49.056477] NDCB0: 0x000d3000
[   49.056477] NDCB1: 0xb5800000
[   49.056477] NDCB2: 0x00000001
[   49.056477] NDCB3: 0x00000000
[   49.075410] nand: nand_do_read_oob: from = 0x0dae0000, len = 64
[   49.081617] marvell-nfc pxa3xx-nand: 
[   49.081617] NDCR:  0x9d079fff
[   49.081617] NDCB0: 0x000d3000
[   49.081617] NDCB1: 0xb5c00000
[   49.081617] NDCB2: 0x00000001
[   49.081617] NDCB3: 0x00000000
[   49.100544] nand: nand_do_read_oob: from = 0x0db00000, len = 64
[   49.106576] marvell-nfc pxa3xx-nand: 
[   49.106576] NDCR:  0x9d079fff
[   49.106576] NDCB0: 0x000d3000
[   49.106576] NDCB1: 0xb6000000
[   49.106576] NDCB2: 0x00000001
[   49.106576] NDCB3: 0x00000000
[   49.125510] nand: nand_do_read_oob: from = 0x0db20000, len = 64
[   49.131714] marvell-nfc pxa3xx-nand: 
[   49.131714] NDCR:  0x9d079fff
[   49.131714] NDCB0: 0x000d3000
[   49.131714] NDCB1: 0xb6400000
[   49.131714] NDCB2: 0x00000001
[   49.131714] NDCB3: 0x00000000
[   49.150639] nand: nand_do_read_oob: from = 0x0db40000, len = 64
[   49.156675] marvell-nfc pxa3xx-nand: 
[   49.156675] NDCR:  0x9d079fff
[   49.156675] NDCB0: 0x000d3000
[   49.156675] NDCB1: 0xb6800000
[   49.156675] NDCB2: 0x00000001
[   49.156675] NDCB3: 0x00000000
[   49.175608] nand: nand_do_read_oob: from = 0x0db60000, len = 64
[   49.181812] marvell-nfc pxa3xx-nand: 
[   49.181812] NDCR:  0x9d079fff
[   49.181812] NDCB0: 0x000d3000
[   49.181812] NDCB1: 0xb6c00000
[   49.181812] NDCB2: 0x00000001
[   49.181812] NDCB3: 0x00000000
[   49.200741] nand: nand_do_read_oob: from = 0x0db80000, len = 64
[   49.206771] marvell-nfc pxa3xx-nand: 
[   49.206771] NDCR:  0x9d079fff
[   49.206771] NDCB0: 0x000d3000
[   49.206771] NDCB1: 0xb7000000
[   49.206771] NDCB2: 0x00000001
[   49.206771] NDCB3: 0x00000000
[   49.225705] nand: nand_do_read_oob: from = 0x0dba0000, len = 64
[   49.231911] marvell-nfc pxa3xx-nand: 
[   49.231911] NDCR:  0x9d079fff
[   49.231911] NDCB0: 0x000d3000
[   49.231911] NDCB1: 0xb7400000
[   49.231911] NDCB2: 0x00000001
[   49.231911] NDCB3: 0x00000000
[   49.250839] nand: nand_do_read_oob: from = 0x0dbc0000, len = 64
[   49.256871] marvell-nfc pxa3xx-nand: 
[   49.256871] NDCR:  0x9d079fff
[   49.256871] NDCB0: 0x000d3000
[   49.256871] NDCB1: 0xb7800000
[   49.256871] NDCB2: 0x00000001
[   49.256871] NDCB3: 0x00000000
[   49.275804] nand: nand_do_read_oob: from = 0x0dbe0000, len = 64
[   49.282010] marvell-nfc pxa3xx-nand: 
[   49.282010] NDCR:  0x9d079fff
[   49.282010] NDCB0: 0x000d3000
[   49.282010] NDCB1: 0xb7c00000
[   49.282010] NDCB2: 0x00000001
[   49.282010] NDCB3: 0x00000000
[   49.300936] nand: nand_do_read_oob: from = 0x0dc00000, len = 64
[   49.306970] marvell-nfc pxa3xx-nand: 
[   49.306970] NDCR:  0x9d079fff
[   49.306970] NDCB0: 0x000d3000
[   49.306970] NDCB1: 0xb8000000
[   49.306970] NDCB2: 0x00000001
[   49.306970] NDCB3: 0x00000000
[   49.325901] nand: nand_do_read_oob: from = 0x0dc20000, len = 64
[   49.332108] marvell-nfc pxa3xx-nand: 
[   49.332108] NDCR:  0x9d079fff
[   49.332108] NDCB0: 0x000d3000
[   49.332108] NDCB1: 0xb8400000
[   49.332108] NDCB2: 0x00000001
[   49.332108] NDCB3: 0x00000000
[   49.351034] nand: nand_do_read_oob: from = 0x0dc40000, len = 64
[   49.357067] marvell-nfc pxa3xx-nand: 
[   49.357067] NDCR:  0x9d079fff
[   49.357067] NDCB0: 0x000d3000
[   49.357067] NDCB1: 0xb8800000
[   49.357067] NDCB2: 0x00000001
[   49.357067] NDCB3: 0x00000000
[   49.376000] nand: nand_do_read_oob: from = 0x0dc60000, len = 64
[   49.382207] marvell-nfc pxa3xx-nand: 
[   49.382207] NDCR:  0x9d079fff
[   49.382207] NDCB0: 0x000d3000
[   49.382207] NDCB1: 0xb8c00000
[   49.382207] NDCB2: 0x00000001
[   49.382207] NDCB3: 0x00000000
[   49.401132] nand: nand_do_read_oob: from = 0x0dc80000, len = 64
[   49.407166] marvell-nfc pxa3xx-nand: 
[   49.407166] NDCR:  0x9d079fff
[   49.407166] NDCB0: 0x000d3000
[   49.407166] NDCB1: 0xb9000000
[   49.407166] NDCB2: 0x00000001
[   49.407166] NDCB3: 0x00000000
[   49.426098] nand: nand_do_read_oob: from = 0x0dca0000, len = 64
[   49.432305] marvell-nfc pxa3xx-nand: 
[   49.432305] NDCR:  0x9d079fff
[   49.432305] NDCB0: 0x000d3000
[   49.432305] NDCB1: 0xb9400000
[   49.432305] NDCB2: 0x00000001
[   49.432305] NDCB3: 0x00000000
[   49.451232] nand: nand_do_read_oob: from = 0x0dcc0000, len = 64
[   49.457265] marvell-nfc pxa3xx-nand: 
[   49.457265] NDCR:  0x9d079fff
[   49.457265] NDCB0: 0x000d3000
[   49.457265] NDCB1: 0xb9800000
[   49.457265] NDCB2: 0x00000001
[   49.457265] NDCB3: 0x00000000
[   49.476197] nand: nand_do_read_oob: from = 0x0dce0000, len = 64
[   49.482403] marvell-nfc pxa3xx-nand: 
[   49.482403] NDCR:  0x9d079fff
[   49.482403] NDCB0: 0x000d3000
[   49.482403] NDCB1: 0xb9c00000
[   49.482403] NDCB2: 0x00000001
[   49.482403] NDCB3: 0x00000000
[   49.501331] nand: nand_do_read_oob: from = 0x0dd00000, len = 64
[   49.507364] marvell-nfc pxa3xx-nand: 
[   49.507364] NDCR:  0x9d079fff
[   49.507364] NDCB0: 0x000d3000
[   49.507364] NDCB1: 0xba000000
[   49.507364] NDCB2: 0x00000001
[   49.507364] NDCB3: 0x00000000
[   49.526296] nand: nand_do_read_oob: from = 0x0dd20000, len = 64
[   49.532502] marvell-nfc pxa3xx-nand: 
[   49.532502] NDCR:  0x9d079fff
[   49.532502] NDCB0: 0x000d3000
[   49.532502] NDCB1: 0xba400000
[   49.532502] NDCB2: 0x00000001
[   49.532502] NDCB3: 0x00000000
[   49.551430] nand: nand_do_read_oob: from = 0x0dd40000, len = 64
[   49.557461] marvell-nfc pxa3xx-nand: 
[   49.557461] NDCR:  0x9d079fff
[   49.557461] NDCB0: 0x000d3000
[   49.557461] NDCB1: 0xba800000
[   49.557461] NDCB2: 0x00000001
[   49.557461] NDCB3: 0x00000000
[   49.576397] nand: nand_do_read_oob: from = 0x0dd60000, len = 64
[   49.582599] marvell-nfc pxa3xx-nand: 
[   49.582599] NDCR:  0x9d079fff
[   49.582599] NDCB0: 0x000d3000
[   49.582599] NDCB1: 0xbac00000
[   49.582599] NDCB2: 0x00000001
[   49.582599] NDCB3: 0x00000000
[   49.601527] nand: nand_do_read_oob: from = 0x0dd80000, len = 64
[   49.607560] marvell-nfc pxa3xx-nand: 
[   49.607560] NDCR:  0x9d079fff
[   49.607560] NDCB0: 0x000d3000
[   49.607560] NDCB1: 0xbb000000
[   49.607560] NDCB2: 0x00000001
[   49.607560] NDCB3: 0x00000000
[   49.626508] nand: nand_do_read_oob: from = 0x0dda0000, len = 64
[   49.632715] marvell-nfc pxa3xx-nand: 
[   49.632715] NDCR:  0x9d079fff
[   49.632715] NDCB0: 0x000d3000
[   49.632715] NDCB1: 0xbb400000
[   49.632715] NDCB2: 0x00000001
[   49.632715] NDCB3: 0x00000000
[   49.651645] nand: nand_do_read_oob: from = 0x0ddc0000, len = 64
[   49.657676] marvell-nfc pxa3xx-nand: 
[   49.657676] NDCR:  0x9d079fff
[   49.657676] NDCB0: 0x000d3000
[   49.657676] NDCB1: 0xbb800000
[   49.657676] NDCB2: 0x00000001
[   49.657676] NDCB3: 0x00000000
[   49.676607] nand: nand_do_read_oob: from = 0x0dde0000, len = 64
[   49.682815] marvell-nfc pxa3xx-nand: 
[   49.682815] NDCR:  0x9d079fff
[   49.682815] NDCB0: 0x000d3000
[   49.682815] NDCB1: 0xbbc00000
[   49.682815] NDCB2: 0x00000001
[   49.682815] NDCB3: 0x00000000
[   49.701742] nand: nand_do_read_oob: from = 0x0de00000, len = 64
[   49.707775] marvell-nfc pxa3xx-nand: 
[   49.707775] NDCR:  0x9d079fff
[   49.707775] NDCB0: 0x000d3000
[   49.707775] NDCB1: 0xbc000000
[   49.707775] NDCB2: 0x00000001
[   49.707775] NDCB3: 0x00000000
[   49.726707] nand: nand_do_read_oob: from = 0x0de20000, len = 64
[   49.732912] marvell-nfc pxa3xx-nand: 
[   49.732912] NDCR:  0x9d079fff
[   49.732912] NDCB0: 0x000d3000
[   49.732912] NDCB1: 0xbc400000
[   49.732912] NDCB2: 0x00000001
[   49.732912] NDCB3: 0x00000000
[   49.751842] nand: nand_do_read_oob: from = 0x0de40000, len = 64
[   49.757873] marvell-nfc pxa3xx-nand: 
[   49.757873] NDCR:  0x9d079fff
[   49.757873] NDCB0: 0x000d3000
[   49.757873] NDCB1: 0xbc800000
[   49.757873] NDCB2: 0x00000001
[   49.757873] NDCB3: 0x00000000
[   49.776811] nand: nand_do_read_oob: from = 0x0de60000, len = 64
[   49.783011] marvell-nfc pxa3xx-nand: 
[   49.783011] NDCR:  0x9d079fff
[   49.783011] NDCB0: 0x000d3000
[   49.783011] NDCB1: 0xbcc00000
[   49.783011] NDCB2: 0x00000001
[   49.783011] NDCB3: 0x00000000
[   49.801941] nand: nand_do_read_oob: from = 0x0de80000, len = 64
[   49.807971] marvell-nfc pxa3xx-nand: 
[   49.807971] NDCR:  0x9d079fff
[   49.807971] NDCB0: 0x000d3000
[   49.807971] NDCB1: 0xbd000000
[   49.807971] NDCB2: 0x00000001
[   49.807971] NDCB3: 0x00000000
[   49.826904] nand: nand_do_read_oob: from = 0x0dea0000, len = 64
[   49.833112] marvell-nfc pxa3xx-nand: 
[   49.833112] NDCR:  0x9d079fff
[   49.833112] NDCB0: 0x000d3000
[   49.833112] NDCB1: 0xbd400000
[   49.833112] NDCB2: 0x00000001
[   49.833112] NDCB3: 0x00000000
[   49.852038] nand: nand_do_read_oob: from = 0x0dec0000, len = 64
[   49.858069] marvell-nfc pxa3xx-nand: 
[   49.858069] NDCR:  0x9d079fff
[   49.858069] NDCB0: 0x000d3000
[   49.858069] NDCB1: 0xbd800000
[   49.858069] NDCB2: 0x00000001
[   49.858069] NDCB3: 0x00000000
[   49.877001] nand: nand_do_read_oob: from = 0x0dee0000, len = 64
[   49.883209] marvell-nfc pxa3xx-nand: 
[   49.883209] NDCR:  0x9d079fff
[   49.883209] NDCB0: 0x000d3000
[   49.883209] NDCB1: 0xbdc00000
[   49.883209] NDCB2: 0x00000001
[   49.883209] NDCB3: 0x00000000
[   49.902136] nand: nand_do_read_oob: from = 0x0df00000, len = 64
[   49.908168] marvell-nfc pxa3xx-nand: 
[   49.908168] NDCR:  0x9d079fff
[   49.908168] NDCB0: 0x000d3000
[   49.908168] NDCB1: 0xbe000000
[   49.908168] NDCB2: 0x00000001
[   49.908168] NDCB3: 0x00000000
[   49.927100] nand: nand_do_read_oob: from = 0x0df20000, len = 64
[   49.933306] marvell-nfc pxa3xx-nand: 
[   49.933306] NDCR:  0x9d079fff
[   49.933306] NDCB0: 0x000d3000
[   49.933306] NDCB1: 0xbe400000
[   49.933306] NDCB2: 0x00000001
[   49.933306] NDCB3: 0x00000000
[   49.952236] nand: nand_do_read_oob: from = 0x0df40000, len = 64
[   49.958267] marvell-nfc pxa3xx-nand: 
[   49.958267] NDCR:  0x9d079fff
[   49.958267] NDCB0: 0x000d3000
[   49.958267] NDCB1: 0xbe800000
[   49.958267] NDCB2: 0x00000001
[   49.958267] NDCB3: 0x00000000
[   49.977199] nand: nand_do_read_oob: from = 0x0df60000, len = 64
[   49.983404] marvell-nfc pxa3xx-nand: 
[   49.983404] NDCR:  0x9d079fff
[   49.983404] NDCB0: 0x000d3000
[   49.983404] NDCB1: 0xbec00000
[   49.983404] NDCB2: 0x00000001
[   49.983404] NDCB3: 0x00000000
[   50.002333] nand: nand_do_read_oob: from = 0x0df80000, len = 64
[   50.008365] marvell-nfc pxa3xx-nand: 
[   50.008365] NDCR:  0x9d079fff
[   50.008365] NDCB0: 0x000d3000
[   50.008365] NDCB1: 0xbf000000
[   50.008365] NDCB2: 0x00000001
[   50.008365] NDCB3: 0x00000000
[   50.027305] nand: nand_do_read_oob: from = 0x0dfa0000, len = 64
[   50.033512] marvell-nfc pxa3xx-nand: 
[   50.033512] NDCR:  0x9d079fff
[   50.033512] NDCB0: 0x000d3000
[   50.033512] NDCB1: 0xbf400000
[   50.033512] NDCB2: 0x00000001
[   50.033512] NDCB3: 0x00000000
[   50.052439] nand: nand_do_read_oob: from = 0x0dfc0000, len = 64
[   50.058472] marvell-nfc pxa3xx-nand: 
[   50.058472] NDCR:  0x9d079fff
[   50.058472] NDCB0: 0x000d3000
[   50.058472] NDCB1: 0xbf800000
[   50.058472] NDCB2: 0x00000001
[   50.058472] NDCB3: 0x00000000
[   50.077402] nand: nand_do_read_oob: from = 0x0dfe0000, len = 64
[   50.083603] marvell-nfc pxa3xx-nand: 
[   50.083603] NDCR:  0x9d079fff
[   50.083603] NDCB0: 0x000d3000
[   50.083603] NDCB1: 0xbfc00000
[   50.083603] NDCB2: 0x00000001
[   50.083603] NDCB3: 0x00000000
[   50.102870] nand: nand_do_read_oob: from = 0x0e000000, len = 64
[   50.109105] marvell-nfc pxa3xx-nand: 
[   50.109105] NDCR:  0x9d079fff
[   50.109105] NDCB0: 0x000d3000
[   50.109105] NDCB1: 0xc0000000
[   50.109105] NDCB2: 0x00000001
[   50.109105] NDCB3: 0x00000000
[   50.128026] nand: nand_do_read_oob: from = 0x0e020000, len = 64
[   50.134225] marvell-nfc pxa3xx-nand: 
[   50.134225] NDCR:  0x9d079fff
[   50.134225] NDCB0: 0x000d3000
[   50.134225] NDCB1: 0xc0400000
[   50.134225] NDCB2: 0x00000001
[   50.134225] NDCB3: 0x00000000
[   50.153157] nand: nand_do_read_oob: from = 0x0e040000, len = 64
[   50.159358] marvell-nfc pxa3xx-nand: 
[   50.159358] NDCR:  0x9d079fff
[   50.159358] NDCB0: 0x000d3000
[   50.159358] NDCB1: 0xc0800000
[   50.159358] NDCB2: 0x00000001
[   50.159358] NDCB3: 0x00000000
[   50.178275] nand: nand_do_read_oob: from = 0x0e060000, len = 64
[   50.184478] marvell-nfc pxa3xx-nand: 
[   50.184478] NDCR:  0x9d079fff
[   50.184478] NDCB0: 0x000d3000
[   50.184478] NDCB1: 0xc0c00000
[   50.184478] NDCB2: 0x00000001
[   50.184478] NDCB3: 0x00000000
[   50.203407] nand: nand_do_read_oob: from = 0x0e080000, len = 64
[   50.209610] marvell-nfc pxa3xx-nand: 
[   50.209610] NDCR:  0x9d079fff
[   50.209610] NDCB0: 0x000d3000
[   50.209610] NDCB1: 0xc1000000
[   50.209610] NDCB2: 0x00000001
[   50.209610] NDCB3: 0x00000000
[   50.228530] nand: nand_do_read_oob: from = 0x0e0a0000, len = 64
[   50.234753] marvell-nfc pxa3xx-nand: 
[   50.234753] NDCR:  0x9d079fff
[   50.234753] NDCB0: 0x000d3000
[   50.234753] NDCB1: 0xc1400000
[   50.234753] NDCB2: 0x00000001
[   50.234753] NDCB3: 0x00000000
[   50.253682] nand: nand_do_read_oob: from = 0x0e0c0000, len = 64
[   50.259880] marvell-nfc pxa3xx-nand: 
[   50.259880] NDCR:  0x9d079fff
[   50.259880] NDCB0: 0x000d3000
[   50.259880] NDCB1: 0xc1800000
[   50.259880] NDCB2: 0x00000001
[   50.259880] NDCB3: 0x00000000
[   50.278879] nand: nand_do_read_oob: from = 0x0e0e0000, len = 64
[   50.284914] marvell-nfc pxa3xx-nand: 
[   50.284914] NDCR:  0x9d079fff
[   50.284914] NDCB0: 0x000d3000
[   50.284914] NDCB1: 0xc1c00000
[   50.284914] NDCB2: 0x00000001
[   50.284914] NDCB3: 0x00000000
[   50.303848] nand: nand_do_read_oob: from = 0x0e100000, len = 64
[   50.310048] marvell-nfc pxa3xx-nand: 
[   50.310048] NDCR:  0x9d079fff
[   50.310048] NDCB0: 0x000d3000
[   50.310048] NDCB1: 0xc2000000
[   50.310048] NDCB2: 0x00000001
[   50.310048] NDCB3: 0x00000000
[   50.329015] nand: nand_do_read_oob: from = 0x0e120000, len = 64
[   50.335042] marvell-nfc pxa3xx-nand: 
[   50.335042] NDCR:  0x9d079fff
[   50.335042] NDCB0: 0x000d3000
[   50.335042] NDCB1: 0xc2400000
[   50.335042] NDCB2: 0x00000001
[   50.335042] NDCB3: 0x00000000
[   50.353979] nand: nand_do_read_oob: from = 0x0e140000, len = 64
[   50.360180] marvell-nfc pxa3xx-nand: 
[   50.360180] NDCR:  0x9d079fff
[   50.360180] NDCB0: 0x000d3000
[   50.360180] NDCB1: 0xc2800000
[   50.360180] NDCB2: 0x00000001
[   50.360180] NDCB3: 0x00000000
[   50.379109] nand: nand_do_read_oob: from = 0x0e160000, len = 64
[   50.385142] marvell-nfc pxa3xx-nand: 
[   50.385142] NDCR:  0x9d079fff
[   50.385142] NDCB0: 0x000d3000
[   50.385142] NDCB1: 0xc2c00000
[   50.385142] NDCB2: 0x00000001
[   50.385142] NDCB3: 0x00000000
[   50.404072] nand: nand_do_read_oob: from = 0x0e180000, len = 64
[   50.410271] marvell-nfc pxa3xx-nand: 
[   50.410271] NDCR:  0x9d079fff
[   50.410271] NDCB0: 0x000d3000
[   50.410271] NDCB1: 0xc3000000
[   50.410271] NDCB2: 0x00000001
[   50.410271] NDCB3: 0x00000000
[   50.429199] nand: nand_do_read_oob: from = 0x0e1a0000, len = 64
[   50.435230] marvell-nfc pxa3xx-nand: 
[   50.435230] NDCR:  0x9d079fff
[   50.435230] NDCB0: 0x000d3000
[   50.435230] NDCB1: 0xc3400000
[   50.435230] NDCB2: 0x00000001
[   50.435230] NDCB3: 0x00000000
[   50.454164] nand: nand_do_read_oob: from = 0x0e1c0000, len = 64
[   50.460370] marvell-nfc pxa3xx-nand: 
[   50.460370] NDCR:  0x9d079fff
[   50.460370] NDCB0: 0x000d3000
[   50.460370] NDCB1: 0xc3800000
[   50.460370] NDCB2: 0x00000001
[   50.460370] NDCB3: 0x00000000
[   50.479300] nand: nand_do_read_oob: from = 0x0e1e0000, len = 64
[   50.485329] marvell-nfc pxa3xx-nand: 
[   50.485329] NDCR:  0x9d079fff
[   50.485329] NDCB0: 0x000d3000
[   50.485329] NDCB1: 0xc3c00000
[   50.485329] NDCB2: 0x00000001
[   50.485329] NDCB3: 0x00000000
[   50.504265] nand: nand_do_read_oob: from = 0x0e200000, len = 64
[   50.510470] marvell-nfc pxa3xx-nand: 
[   50.510470] NDCR:  0x9d079fff
[   50.510470] NDCB0: 0x000d3000
[   50.510470] NDCB1: 0xc4000000
[   50.510470] NDCB2: 0x00000001
[   50.510470] NDCB3: 0x00000000
[   50.529395] nand: nand_do_read_oob: from = 0x0e220000, len = 64
[   50.535427] marvell-nfc pxa3xx-nand: 
[   50.535427] NDCR:  0x9d079fff
[   50.535427] NDCB0: 0x000d3000
[   50.535427] NDCB1: 0xc4400000
[   50.535427] NDCB2: 0x00000001
[   50.535427] NDCB3: 0x00000000
[   50.554363] nand: nand_do_read_oob: from = 0x0e240000, len = 64
[   50.560565] marvell-nfc pxa3xx-nand: 
[   50.560565] NDCR:  0x9d079fff
[   50.560565] NDCB0: 0x000d3000
[   50.560565] NDCB1: 0xc4800000
[   50.560565] NDCB2: 0x00000001
[   50.560565] NDCB3: 0x00000000
[   50.579496] nand: nand_do_read_oob: from = 0x0e260000, len = 64
[   50.585525] marvell-nfc pxa3xx-nand: 
[   50.585525] NDCR:  0x9d079fff
[   50.585525] NDCB0: 0x000d3000
[   50.585525] NDCB1: 0xc4c00000
[   50.585525] NDCB2: 0x00000001
[   50.585525] NDCB3: 0x00000000
[   50.604458] nand: nand_do_read_oob: from = 0x0e280000, len = 64
[   50.610657] marvell-nfc pxa3xx-nand: 
[   50.610657] NDCR:  0x9d079fff
[   50.610657] NDCB0: 0x000d3000
[   50.610657] NDCB1: 0xc5000000
[   50.610657] NDCB2: 0x00000001
[   50.610657] NDCB3: 0x00000000
[   50.629584] nand: nand_do_read_oob: from = 0x0e2a0000, len = 64
[   50.635616] marvell-nfc pxa3xx-nand: 
[   50.635616] NDCR:  0x9d079fff
[   50.635616] NDCB0: 0x000d3000
[   50.635616] NDCB1: 0xc5400000
[   50.635616] NDCB2: 0x00000001
[   50.635616] NDCB3: 0x00000000
[   50.654551] nand: nand_do_read_oob: from = 0x0e2c0000, len = 64
[   50.660752] marvell-nfc pxa3xx-nand: 
[   50.660752] NDCR:  0x9d079fff
[   50.660752] NDCB0: 0x000d3000
[   50.660752] NDCB1: 0xc5800000
[   50.660752] NDCB2: 0x00000001
[   50.660752] NDCB3: 0x00000000
[   50.679685] nand: nand_do_read_oob: from = 0x0e2e0000, len = 64
[   50.685714] marvell-nfc pxa3xx-nand: 
[   50.685714] NDCR:  0x9d079fff
[   50.685714] NDCB0: 0x000d3000
[   50.685714] NDCB1: 0xc5c00000
[   50.685714] NDCB2: 0x00000001
[   50.685714] NDCB3: 0x00000000
[   50.704647] nand: nand_do_read_oob: from = 0x0e300000, len = 64
[   50.710853] marvell-nfc pxa3xx-nand: 
[   50.710853] NDCR:  0x9d079fff
[   50.710853] NDCB0: 0x000d3000
[   50.710853] NDCB1: 0xc6000000
[   50.710853] NDCB2: 0x00000001
[   50.710853] NDCB3: 0x00000000
[   50.729782] nand: nand_do_read_oob: from = 0x0e320000, len = 64
[   50.735814] marvell-nfc pxa3xx-nand: 
[   50.735814] NDCR:  0x9d079fff
[   50.735814] NDCB0: 0x000d3000
[   50.735814] NDCB1: 0xc6400000
[   50.735814] NDCB2: 0x00000001
[   50.735814] NDCB3: 0x00000000
[   50.754747] nand: nand_do_read_oob: from = 0x0e340000, len = 64
[   50.760952] marvell-nfc pxa3xx-nand: 
[   50.760952] NDCR:  0x9d079fff
[   50.760952] NDCB0: 0x000d3000
[   50.760952] NDCB1: 0xc6800000
[   50.760952] NDCB2: 0x00000001
[   50.760952] NDCB3: 0x00000000
[   50.779882] nand: nand_do_read_oob: from = 0x0e360000, len = 64
[   50.785911] marvell-nfc pxa3xx-nand: 
[   50.785911] NDCR:  0x9d079fff
[   50.785911] NDCB0: 0x000d3000
[   50.785911] NDCB1: 0xc6c00000
[   50.785911] NDCB2: 0x00000001
[   50.785911] NDCB3: 0x00000000
[   50.804846] nand: nand_do_read_oob: from = 0x0e380000, len = 64
[   50.811050] marvell-nfc pxa3xx-nand: 
[   50.811050] NDCR:  0x9d079fff
[   50.811050] NDCB0: 0x000d3000
[   50.811050] NDCB1: 0xc7000000
[   50.811050] NDCB2: 0x00000001
[   50.811050] NDCB3: 0x00000000
[   50.829978] nand: nand_do_read_oob: from = 0x0e3a0000, len = 64
[   50.836010] marvell-nfc pxa3xx-nand: 
[   50.836010] NDCR:  0x9d079fff
[   50.836010] NDCB0: 0x000d3000
[   50.836010] NDCB1: 0xc7400000
[   50.836010] NDCB2: 0x00000001
[   50.836010] NDCB3: 0x00000000
[   50.854943] nand: nand_do_read_oob: from = 0x0e3c0000, len = 64
[   50.861166] marvell-nfc pxa3xx-nand: 
[   50.861166] NDCR:  0x9d079fff
[   50.861166] NDCB0: 0x000d3000
[   50.861166] NDCB1: 0xc7800000
[   50.861166] NDCB2: 0x00000001
[   50.861166] NDCB3: 0x00000000
[   50.880096] nand: nand_do_read_oob: from = 0x0e3e0000, len = 64
[   50.886126] marvell-nfc pxa3xx-nand: 
[   50.886126] NDCR:  0x9d079fff
[   50.886126] NDCB0: 0x000d3000
[   50.886126] NDCB1: 0xc7c00000
[   50.886126] NDCB2: 0x00000001
[   50.886126] NDCB3: 0x00000000
[   50.905060] nand: nand_do_read_oob: from = 0x0e400000, len = 64
[   50.911264] marvell-nfc pxa3xx-nand: 
[   50.911264] NDCR:  0x9d079fff
[   50.911264] NDCB0: 0x000d3000
[   50.911264] NDCB1: 0xc8000000
[   50.911264] NDCB2: 0x00000001
[   50.911264] NDCB3: 0x00000000
[   50.930194] nand: nand_do_read_oob: from = 0x0e420000, len = 64
[   50.936224] marvell-nfc pxa3xx-nand: 
[   50.936224] NDCR:  0x9d079fff
[   50.936224] NDCB0: 0x000d3000
[   50.936224] NDCB1: 0xc8400000
[   50.936224] NDCB2: 0x00000001
[   50.936224] NDCB3: 0x00000000
[   50.955157] nand: nand_do_read_oob: from = 0x0e440000, len = 64
[   50.961362] marvell-nfc pxa3xx-nand: 
[   50.961362] NDCR:  0x9d079fff
[   50.961362] NDCB0: 0x000d3000
[   50.961362] NDCB1: 0xc8800000
[   50.961362] NDCB2: 0x00000001
[   50.961362] NDCB3: 0x00000000
[   50.980292] nand: nand_do_read_oob: from = 0x0e460000, len = 64
[   50.986323] marvell-nfc pxa3xx-nand: 
[   50.986323] NDCR:  0x9d079fff
[   50.986323] NDCB0: 0x000d3000
[   50.986323] NDCB1: 0xc8c00000
[   50.986323] NDCB2: 0x00000001
[   50.986323] NDCB3: 0x00000000
[   51.005257] nand: nand_do_read_oob: from = 0x0e480000, len = 64
[   51.011468] marvell-nfc pxa3xx-nand: 
[   51.011468] NDCR:  0x9d079fff
[   51.011468] NDCB0: 0x000d3000
[   51.011468] NDCB1: 0xc9000000
[   51.011468] NDCB2: 0x00000001
[   51.011468] NDCB3: 0x00000000
[   51.030401] nand: nand_do_read_oob: from = 0x0e4a0000, len = 64
[   51.036430] marvell-nfc pxa3xx-nand: 
[   51.036430] NDCR:  0x9d079fff
[   51.036430] NDCB0: 0x000d3000
[   51.036430] NDCB1: 0xc9400000
[   51.036430] NDCB2: 0x00000001
[   51.036430] NDCB3: 0x00000000
[   51.055367] nand: nand_do_read_oob: from = 0x0e4c0000, len = 64
[   51.061570] marvell-nfc pxa3xx-nand: 
[   51.061570] NDCR:  0x9d079fff
[   51.061570] NDCB0: 0x000d3000
[   51.061570] NDCB1: 0xc9800000
[   51.061570] NDCB2: 0x00000001
[   51.061570] NDCB3: 0x00000000
[   51.080498] nand: nand_do_read_oob: from = 0x0e4e0000, len = 64
[   51.086528] marvell-nfc pxa3xx-nand: 
[   51.086528] NDCR:  0x9d079fff
[   51.086528] NDCB0: 0x000d3000
[   51.086528] NDCB1: 0xc9c00000
[   51.086528] NDCB2: 0x00000001
[   51.086528] NDCB3: 0x00000000
[   51.105463] nand: nand_do_read_oob: from = 0x0e500000, len = 64
[   51.111667] marvell-nfc pxa3xx-nand: 
[   51.111667] NDCR:  0x9d079fff
[   51.111667] NDCB0: 0x000d3000
[   51.111667] NDCB1: 0xca000000
[   51.111667] NDCB2: 0x00000001
[   51.111667] NDCB3: 0x00000000
[   51.130596] nand: nand_do_read_oob: from = 0x0e520000, len = 64
[   51.136626] marvell-nfc pxa3xx-nand: 
[   51.136626] NDCR:  0x9d079fff
[   51.136626] NDCB0: 0x000d3000
[   51.136626] NDCB1: 0xca400000
[   51.136626] NDCB2: 0x00000001
[   51.136626] NDCB3: 0x00000000
[   51.155559] nand: nand_do_read_oob: from = 0x0e540000, len = 64
[   51.161765] marvell-nfc pxa3xx-nand: 
[   51.161765] NDCR:  0x9d079fff
[   51.161765] NDCB0: 0x000d3000
[   51.161765] NDCB1: 0xca800000
[   51.161765] NDCB2: 0x00000001
[   51.161765] NDCB3: 0x00000000
[   51.180695] nand: nand_do_read_oob: from = 0x0e560000, len = 64
[   51.186726] marvell-nfc pxa3xx-nand: 
[   51.186726] NDCR:  0x9d079fff
[   51.186726] NDCB0: 0x000d3000
[   51.186726] NDCB1: 0xcac00000
[   51.186726] NDCB2: 0x00000001
[   51.186726] NDCB3: 0x00000000
[   51.205657] nand: nand_do_read_oob: from = 0x0e580000, len = 64
[   51.211865] marvell-nfc pxa3xx-nand: 
[   51.211865] NDCR:  0x9d079fff
[   51.211865] NDCB0: 0x000d3000
[   51.211865] NDCB1: 0xcb000000
[   51.211865] NDCB2: 0x00000001
[   51.211865] NDCB3: 0x00000000
[   51.230792] nand: nand_do_read_oob: from = 0x0e5a0000, len = 64
[   51.236823] marvell-nfc pxa3xx-nand: 
[   51.236823] NDCR:  0x9d079fff
[   51.236823] NDCB0: 0x000d3000
[   51.236823] NDCB1: 0xcb400000
[   51.236823] NDCB2: 0x00000001
[   51.236823] NDCB3: 0x00000000
[   51.255758] nand: nand_do_read_oob: from = 0x0e5c0000, len = 64
[   51.261963] marvell-nfc pxa3xx-nand: 
[   51.261963] NDCR:  0x9d079fff
[   51.261963] NDCB0: 0x000d3000
[   51.261963] NDCB1: 0xcb800000
[   51.261963] NDCB2: 0x00000001
[   51.261963] NDCB3: 0x00000000
[   51.280891] nand: nand_do_read_oob: from = 0x0e5e0000, len = 64
[   51.286921] marvell-nfc pxa3xx-nand: 
[   51.286921] NDCR:  0x9d079fff
[   51.286921] NDCB0: 0x000d3000
[   51.286921] NDCB1: 0xcbc00000
[   51.286921] NDCB2: 0x00000001
[   51.286921] NDCB3: 0x00000000
[   51.305858] nand: nand_do_read_oob: from = 0x0e600000, len = 64
[   51.312061] marvell-nfc pxa3xx-nand: 
[   51.312061] NDCR:  0x9d079fff
[   51.312061] NDCB0: 0x000d3000
[   51.312061] NDCB1: 0xcc000000
[   51.312061] NDCB2: 0x00000001
[   51.312061] NDCB3: 0x00000000
[   51.330992] nand: nand_do_read_oob: from = 0x0e620000, len = 64
[   51.337020] marvell-nfc pxa3xx-nand: 
[   51.337020] NDCR:  0x9d079fff
[   51.337020] NDCB0: 0x000d3000
[   51.337020] NDCB1: 0xcc400000
[   51.337020] NDCB2: 0x00000001
[   51.337020] NDCB3: 0x00000000
[   51.355959] nand: nand_do_read_oob: from = 0x0e640000, len = 64
[   51.362159] marvell-nfc pxa3xx-nand: 
[   51.362159] NDCR:  0x9d079fff
[   51.362159] NDCB0: 0x000d3000
[   51.362159] NDCB1: 0xcc800000
[   51.362159] NDCB2: 0x00000001
[   51.362159] NDCB3: 0x00000000
[   51.381089] nand: nand_do_read_oob: from = 0x0e660000, len = 64
[   51.387120] marvell-nfc pxa3xx-nand: 
[   51.387120] NDCR:  0x9d079fff
[   51.387120] NDCB0: 0x000d3000
[   51.387120] NDCB1: 0xccc00000
[   51.387120] NDCB2: 0x00000001
[   51.387120] NDCB3: 0x00000000
[   51.406052] nand: nand_do_read_oob: from = 0x0e680000, len = 64
[   51.412256] marvell-nfc pxa3xx-nand: 
[   51.412256] NDCR:  0x9d079fff
[   51.412256] NDCB0: 0x000d3000
[   51.412256] NDCB1: 0xcd000000
[   51.412256] NDCB2: 0x00000001
[   51.412256] NDCB3: 0x00000000
[   51.431186] nand: nand_do_read_oob: from = 0x0e6a0000, len = 64
[   51.437219] marvell-nfc pxa3xx-nand: 
[   51.437219] NDCR:  0x9d079fff
[   51.437219] NDCB0: 0x000d3000
[   51.437219] NDCB1: 0xcd400000
[   51.437219] NDCB2: 0x00000001
[   51.437219] NDCB3: 0x00000000
[   51.456155] nand: nand_do_read_oob: from = 0x0e6c0000, len = 64
[   51.462355] marvell-nfc pxa3xx-nand: 
[   51.462355] NDCR:  0x9d079fff
[   51.462355] NDCB0: 0x000d3000
[   51.462355] NDCB1: 0xcd800000
[   51.462355] NDCB2: 0x00000001
[   51.462355] NDCB3: 0x00000000
[   51.481284] nand: nand_do_read_oob: from = 0x0e6e0000, len = 64
[   51.487317] marvell-nfc pxa3xx-nand: 
[   51.487317] NDCR:  0x9d079fff
[   51.487317] NDCB0: 0x000d3000
[   51.487317] NDCB1: 0xcdc00000
[   51.487317] NDCB2: 0x00000001
[   51.487317] NDCB3: 0x00000000
[   51.506269] nand: nand_do_read_oob: from = 0x0e700000, len = 64
[   51.512474] marvell-nfc pxa3xx-nand: 
[   51.512474] NDCR:  0x9d079fff
[   51.512474] NDCB0: 0x000d3000
[   51.512474] NDCB1: 0xce000000
[   51.512474] NDCB2: 0x00000001
[   51.512474] NDCB3: 0x00000000
[   51.531400] nand: nand_do_read_oob: from = 0x0e720000, len = 64
[   51.537433] marvell-nfc pxa3xx-nand: 
[   51.537433] NDCR:  0x9d079fff
[   51.537433] NDCB0: 0x000d3000
[   51.537433] NDCB1: 0xce400000
[   51.537433] NDCB2: 0x00000001
[   51.537433] NDCB3: 0x00000000
[   51.556367] nand: nand_do_read_oob: from = 0x0e740000, len = 64
[   51.562568] marvell-nfc pxa3xx-nand: 
[   51.562568] NDCR:  0x9d079fff
[   51.562568] NDCB0: 0x000d3000
[   51.562568] NDCB1: 0xce800000
[   51.562568] NDCB2: 0x00000001
[   51.562568] NDCB3: 0x00000000
[   51.581499] nand: nand_do_read_oob: from = 0x0e760000, len = 64
[   51.587529] marvell-nfc pxa3xx-nand: 
[   51.587529] NDCR:  0x9d079fff
[   51.587529] NDCB0: 0x000d3000
[   51.587529] NDCB1: 0xcec00000
[   51.587529] NDCB2: 0x00000001
[   51.587529] NDCB3: 0x00000000
[   51.606465] nand: nand_do_read_oob: from = 0x0e780000, len = 64
[   51.612668] marvell-nfc pxa3xx-nand: 
[   51.612668] NDCR:  0x9d079fff
[   51.612668] NDCB0: 0x000d3000
[   51.612668] NDCB1: 0xcf000000
[   51.612668] NDCB2: 0x00000001
[   51.612668] NDCB3: 0x00000000
[   51.631598] nand: nand_do_read_oob: from = 0x0e7a0000, len = 64
[   51.637628] marvell-nfc pxa3xx-nand: 
[   51.637628] NDCR:  0x9d079fff
[   51.637628] NDCB0: 0x000d3000
[   51.637628] NDCB1: 0xcf400000
[   51.637628] NDCB2: 0x00000001
[   51.637628] NDCB3: 0x00000000
[   51.656560] nand: nand_do_read_oob: from = 0x0e7c0000, len = 64
[   51.662759] marvell-nfc pxa3xx-nand: 
[   51.662759] NDCR:  0x9d079fff
[   51.662759] NDCB0: 0x000d3000
[   51.662759] NDCB1: 0xcf800000
[   51.662759] NDCB2: 0x00000001
[   51.662759] NDCB3: 0x00000000
[   51.681686] nand: nand_do_read_oob: from = 0x0e7e0000, len = 64
[   51.687718] marvell-nfc pxa3xx-nand: 
[   51.687718] NDCR:  0x9d079fff
[   51.687718] NDCB0: 0x000d3000
[   51.687718] NDCB1: 0xcfc00000
[   51.687718] NDCB2: 0x00000001
[   51.687718] NDCB3: 0x00000000
[   51.706651] nand: nand_do_read_oob: from = 0x0e800000, len = 64
[   51.712858] marvell-nfc pxa3xx-nand: 
[   51.712858] NDCR:  0x9d079fff
[   51.712858] NDCB0: 0x000d3000
[   51.712858] NDCB1: 0xd0000000
[   51.712858] NDCB2: 0x00000001
[   51.712858] NDCB3: 0x00000000
[   51.731786] nand: nand_do_read_oob: from = 0x0e820000, len = 64
[   51.737817] marvell-nfc pxa3xx-nand: 
[   51.737817] NDCR:  0x9d079fff
[   51.737817] NDCB0: 0x000d3000
[   51.737817] NDCB1: 0xd0400000
[   51.737817] NDCB2: 0x00000001
[   51.737817] NDCB3: 0x00000000
[   51.756749] nand: nand_do_read_oob: from = 0x0e840000, len = 64
[   51.762947] marvell-nfc pxa3xx-nand: 
[   51.762947] NDCR:  0x9d079fff
[   51.762947] NDCB0: 0x000d3000
[   51.762947] NDCB1: 0xd0800000
[   51.762947] NDCB2: 0x00000001
[   51.762947] NDCB3: 0x00000000
[   51.781875] nand: nand_do_read_oob: from = 0x0e860000, len = 64
[   51.787906] marvell-nfc pxa3xx-nand: 
[   51.787906] NDCR:  0x9d079fff
[   51.787906] NDCB0: 0x000d3000
[   51.787906] NDCB1: 0xd0c00000
[   51.787906] NDCB2: 0x00000001
[   51.787906] NDCB3: 0x00000000
[   51.806840] nand: nand_do_read_oob: from = 0x0e880000, len = 64
[   51.813043] marvell-nfc pxa3xx-nand: 
[   51.813043] NDCR:  0x9d079fff
[   51.813043] NDCB0: 0x000d3000
[   51.813043] NDCB1: 0xd1000000
[   51.813043] NDCB2: 0x00000001
[   51.813043] NDCB3: 0x00000000
[   51.831972] nand: nand_do_read_oob: from = 0x0e8a0000, len = 64
[   51.838006] marvell-nfc pxa3xx-nand: 
[   51.838006] NDCR:  0x9d079fff
[   51.838006] NDCB0: 0x000d3000
[   51.838006] NDCB1: 0xd1400000
[   51.838006] NDCB2: 0x00000001
[   51.838006] NDCB3: 0x00000000
[   51.856936] nand: nand_do_read_oob: from = 0x0e8c0000, len = 64
[   51.863135] marvell-nfc pxa3xx-nand: 
[   51.863135] NDCR:  0x9d079fff
[   51.863135] NDCB0: 0x000d3000
[   51.863135] NDCB1: 0xd1800000
[   51.863135] NDCB2: 0x00000001
[   51.863135] NDCB3: 0x00000000
[   51.882062] nand: nand_do_read_oob: from = 0x0e8e0000, len = 64
[   51.888096] marvell-nfc pxa3xx-nand: 
[   51.888096] NDCR:  0x9d079fff
[   51.888096] NDCB0: 0x000d3000
[   51.888096] NDCB1: 0xd1c00000
[   51.888096] NDCB2: 0x00000001
[   51.888096] NDCB3: 0x00000000
[   51.907026] nand: nand_do_read_oob: from = 0x0e900000, len = 64
[   51.913225] marvell-nfc pxa3xx-nand: 
[   51.913225] NDCR:  0x9d079fff
[   51.913225] NDCB0: 0x000d3000
[   51.913225] NDCB1: 0xd2000000
[   51.913225] NDCB2: 0x00000001
[   51.913225] NDCB3: 0x00000000
[   51.932154] nand: nand_do_read_oob: from = 0x0e920000, len = 64
[   51.938185] marvell-nfc pxa3xx-nand: 
[   51.938185] NDCR:  0x9d079fff
[   51.938185] NDCB0: 0x000d3000
[   51.938185] NDCB1: 0xd2400000
[   51.938185] NDCB2: 0x00000001
[   51.938185] NDCB3: 0x00000000
[   51.957117] nand: nand_do_read_oob: from = 0x0e940000, len = 64
[   51.963323] marvell-nfc pxa3xx-nand: 
[   51.963323] NDCR:  0x9d079fff
[   51.963323] NDCB0: 0x000d3000
[   51.963323] NDCB1: 0xd2800000
[   51.963323] NDCB2: 0x00000001
[   51.963323] NDCB3: 0x00000000
[   51.982250] nand: nand_do_read_oob: from = 0x0e960000, len = 64
[   51.988282] marvell-nfc pxa3xx-nand: 
[   51.988282] NDCR:  0x9d079fff
[   51.988282] NDCB0: 0x000d3000
[   51.988282] NDCB1: 0xd2c00000
[   51.988282] NDCB2: 0x00000001
[   51.988282] NDCB3: 0x00000000
[   52.007215] nand: nand_do_read_oob: from = 0x0e980000, len = 64
[   52.013419] marvell-nfc pxa3xx-nand: 
[   52.013419] NDCR:  0x9d079fff
[   52.013419] NDCB0: 0x000d3000
[   52.013419] NDCB1: 0xd3000000
[   52.013419] NDCB2: 0x00000001
[   52.013419] NDCB3: 0x00000000
[   52.032349] nand: nand_do_read_oob: from = 0x0e9a0000, len = 64
[   52.038381] marvell-nfc pxa3xx-nand: 
[   52.038381] NDCR:  0x9d079fff
[   52.038381] NDCB0: 0x000d3000
[   52.038381] NDCB1: 0xd3400000
[   52.038381] NDCB2: 0x00000001
[   52.038381] NDCB3: 0x00000000
[   52.057315] nand: nand_do_read_oob: from = 0x0e9c0000, len = 64
[   52.063519] marvell-nfc pxa3xx-nand: 
[   52.063519] NDCR:  0x9d079fff
[   52.063519] NDCB0: 0x000d3000
[   52.063519] NDCB1: 0xd3800000
[   52.063519] NDCB2: 0x00000001
[   52.063519] NDCB3: 0x00000000
[   52.082449] nand: nand_do_read_oob: from = 0x0e9e0000, len = 64
[   52.088481] marvell-nfc pxa3xx-nand: 
[   52.088481] NDCR:  0x9d079fff
[   52.088481] NDCB0: 0x000d3000
[   52.088481] NDCB1: 0xd3c00000
[   52.088481] NDCB2: 0x00000001
[   52.088481] NDCB3: 0x00000000
[   52.107846] nand: nand_do_read_oob: from = 0x0ea00000, len = 64
[   52.114087] marvell-nfc pxa3xx-nand: 
[   52.114087] NDCR:  0x9d079fff
[   52.114087] NDCB0: 0x000d3000
[   52.114087] NDCB1: 0xd4000000
[   52.114087] NDCB2: 0x00000001
[   52.114087] NDCB3: 0x00000000
[   52.133019] nand: nand_do_read_oob: from = 0x0ea20000, len = 64
[   52.139247] marvell-nfc pxa3xx-nand: 
[   52.139247] NDCR:  0x9d079fff
[   52.139247] NDCB0: 0x000d3000
[   52.139247] NDCB1: 0xd4400000
[   52.139247] NDCB2: 0x00000001
[   52.139247] NDCB3: 0x00000000
[   52.158171] nand: nand_do_read_oob: from = 0x0ea40000, len = 64
[   52.164373] marvell-nfc pxa3xx-nand: 
[   52.164373] NDCR:  0x9d079fff
[   52.164373] NDCB0: 0x000d3000
[   52.164373] NDCB1: 0xd4800000
[   52.164373] NDCB2: 0x00000001
[   52.164373] NDCB3: 0x00000000
[   52.183302] nand: nand_do_read_oob: from = 0x0ea60000, len = 64
[   52.189503] marvell-nfc pxa3xx-nand: 
[   52.189503] NDCR:  0x9d079fff
[   52.189503] NDCB0: 0x000d3000
[   52.189503] NDCB1: 0xd4c00000
[   52.189503] NDCB2: 0x00000001
[   52.189503] NDCB3: 0x00000000
[   52.208421] nand: nand_do_read_oob: from = 0x0ea80000, len = 64
[   52.214626] marvell-nfc pxa3xx-nand: 
[   52.214626] NDCR:  0x9d079fff
[   52.214626] NDCB0: 0x000d3000
[   52.214626] NDCB1: 0xd5000000
[   52.214626] NDCB2: 0x00000001
[   52.214626] NDCB3: 0x00000000
[   52.233553] nand: nand_do_read_oob: from = 0x0eaa0000, len = 64
[   52.239759] marvell-nfc pxa3xx-nand: 
[   52.239759] NDCR:  0x9d079fff
[   52.239759] NDCB0: 0x000d3000
[   52.239759] NDCB1: 0xd5400000
[   52.239759] NDCB2: 0x00000001
[   52.239759] NDCB3: 0x00000000
[   52.258771] nand: nand_do_read_oob: from = 0x0eac0000, len = 64
[   52.264806] marvell-nfc pxa3xx-nand: 
[   52.264806] NDCR:  0x9d079fff
[   52.264806] NDCB0: 0x000d3000
[   52.264806] NDCB1: 0xd5800000
[   52.264806] NDCB2: 0x00000001
[   52.264806] NDCB3: 0x00000000
[   52.283726] nand: nand_do_read_oob: from = 0x0eae0000, len = 64
[   52.289932] marvell-nfc pxa3xx-nand: 
[   52.289932] NDCR:  0x9d079fff
[   52.289932] NDCB0: 0x000d3000
[   52.289932] NDCB1: 0xd5c00000
[   52.289932] NDCB2: 0x00000001
[   52.289932] NDCB3: 0x00000000
[   52.308900] nand: nand_do_read_oob: from = 0x0eb00000, len = 64
[   52.314939] marvell-nfc pxa3xx-nand: 
[   52.314939] NDCR:  0x9d079fff
[   52.314939] NDCB0: 0x000d3000
[   52.314939] NDCB1: 0xd6000000
[   52.314939] NDCB2: 0x00000001
[   52.314939] NDCB3: 0x00000000
[   52.333881] nand: nand_do_read_oob: from = 0x0eb20000, len = 64
[   52.340084] marvell-nfc pxa3xx-nand: 
[   52.340084] NDCR:  0x9d079fff
[   52.340084] NDCB0: 0x000d3000
[   52.340084] NDCB1: 0xd6400000
[   52.340084] NDCB2: 0x00000001
[   52.340084] NDCB3: 0x00000000
[   52.359049] nand: nand_do_read_oob: from = 0x0eb40000, len = 64
[   52.365087] marvell-nfc pxa3xx-nand: 
[   52.365087] NDCR:  0x9d079fff
[   52.365087] NDCB0: 0x000d3000
[   52.365087] NDCB1: 0xd6800000
[   52.365087] NDCB2: 0x00000001
[   52.365087] NDCB3: 0x00000000
[   52.384021] nand: nand_do_read_oob: from = 0x0eb60000, len = 64
[   52.390225] marvell-nfc pxa3xx-nand: 
[   52.390225] NDCR:  0x9d079fff
[   52.390225] NDCB0: 0x000d3000
[   52.390225] NDCB1: 0xd6c00000
[   52.390225] NDCB2: 0x00000001
[   52.390225] NDCB3: 0x00000000
[   52.409151] nand: nand_do_read_oob: from = 0x0eb80000, len = 64
[   52.415185] marvell-nfc pxa3xx-nand: 
[   52.415185] NDCR:  0x9d079fff
[   52.415185] NDCB0: 0x000d3000
[   52.415185] NDCB1: 0xd7000000
[   52.415185] NDCB2: 0x00000001
[   52.415185] NDCB3: 0x00000000
[   52.434116] nand: nand_do_read_oob: from = 0x0eba0000, len = 64
[   52.440325] marvell-nfc pxa3xx-nand: 
[   52.440325] NDCR:  0x9d079fff
[   52.440325] NDCB0: 0x000d3000
[   52.440325] NDCB1: 0xd7400000
[   52.440325] NDCB2: 0x00000001
[   52.440325] NDCB3: 0x00000000
[   52.459252] nand: nand_do_read_oob: from = 0x0ebc0000, len = 64
[   52.465283] marvell-nfc pxa3xx-nand: 
[   52.465283] NDCR:  0x9d079fff
[   52.465283] NDCB0: 0x000d3000
[   52.465283] NDCB1: 0xd7800000
[   52.465283] NDCB2: 0x00000001
[   52.465283] NDCB3: 0x00000000
[   52.484215] nand: nand_do_read_oob: from = 0x0ebe0000, len = 64
[   52.490422] marvell-nfc pxa3xx-nand: 
[   52.490422] NDCR:  0x9d079fff
[   52.490422] NDCB0: 0x000d3000
[   52.490422] NDCB1: 0xd7c00000
[   52.490422] NDCB2: 0x00000001
[   52.490422] NDCB3: 0x00000000
[   52.509349] nand: nand_do_read_oob: from = 0x0ec00000, len = 64
[   52.515381] marvell-nfc pxa3xx-nand: 
[   52.515381] NDCR:  0x9d079fff
[   52.515381] NDCB0: 0x000d3000
[   52.515381] NDCB1: 0xd8000000
[   52.515381] NDCB2: 0x00000001
[   52.515381] NDCB3: 0x00000000
[   52.534312] nand: nand_do_read_oob: from = 0x0ec20000, len = 64
[   52.540512] marvell-nfc pxa3xx-nand: 
[   52.540512] NDCR:  0x9d079fff
[   52.540512] NDCB0: 0x000d3000
[   52.540512] NDCB1: 0xd8400000
[   52.540512] NDCB2: 0x00000001
[   52.540512] NDCB3: 0x00000000
[   52.559436] nand: nand_do_read_oob: from = 0x0ec40000, len = 64
[   52.565472] marvell-nfc pxa3xx-nand: 
[   52.565472] NDCR:  0x9d079fff
[   52.565472] NDCB0: 0x000d3000
[   52.565472] NDCB1: 0xd8800000
[   52.565472] NDCB2: 0x00000001
[   52.565472] NDCB3: 0x00000000
[   52.584403] nand: nand_do_read_oob: from = 0x0ec60000, len = 64
[   52.590602] marvell-nfc pxa3xx-nand: 
[   52.590602] NDCR:  0x9d079fff
[   52.590602] NDCB0: 0x000d3000
[   52.590602] NDCB1: 0xd8c00000
[   52.590602] NDCB2: 0x00000001
[   52.590602] NDCB3: 0x00000000
[   52.609529] nand: nand_do_read_oob: from = 0x0ec80000, len = 64
[   52.615561] marvell-nfc pxa3xx-nand: 
[   52.615561] NDCR:  0x9d079fff
[   52.615561] NDCB0: 0x000d3000
[   52.615561] NDCB1: 0xd9000000
[   52.615561] NDCB2: 0x00000001
[   52.615561] NDCB3: 0x00000000
[   52.634492] nand: nand_do_read_oob: from = 0x0eca0000, len = 64
[   52.640691] marvell-nfc pxa3xx-nand: 
[   52.640691] NDCR:  0x9d079fff
[   52.640691] NDCB0: 0x000d3000
[   52.640691] NDCB1: 0xd9400000
[   52.640691] NDCB2: 0x00000001
[   52.640691] NDCB3: 0x00000000
[   52.659619] nand: nand_do_read_oob: from = 0x0ecc0000, len = 64
[   52.665651] marvell-nfc pxa3xx-nand: 
[   52.665651] NDCR:  0x9d079fff
[   52.665651] NDCB0: 0x000d3000
[   52.665651] NDCB1: 0xd9800000
[   52.665651] NDCB2: 0x00000001
[   52.665651] NDCB3: 0x00000000
[   52.684583] nand: nand_do_read_oob: from = 0x0ece0000, len = 64
[   52.690780] marvell-nfc pxa3xx-nand: 
[   52.690780] NDCR:  0x9d079fff
[   52.690780] NDCB0: 0x000d3000
[   52.690780] NDCB1: 0xd9c00000
[   52.690780] NDCB2: 0x00000001
[   52.690780] NDCB3: 0x00000000
[   52.709708] nand: nand_do_read_oob: from = 0x0ed00000, len = 64
[   52.715741] marvell-nfc pxa3xx-nand: 
[   52.715741] NDCR:  0x9d079fff
[   52.715741] NDCB0: 0x000d3000
[   52.715741] NDCB1: 0xda000000
[   52.715741] NDCB2: 0x00000001
[   52.715741] NDCB3: 0x00000000
[   52.734673] nand: nand_do_read_oob: from = 0x0ed20000, len = 64
[   52.740899] marvell-nfc pxa3xx-nand: 
[   52.740899] NDCR:  0x9d079fff
[   52.740899] NDCB0: 0x000d3000
[   52.740899] NDCB1: 0xda400000
[   52.740899] NDCB2: 0x00000001
[   52.740899] NDCB3: 0x00000000
[   52.759825] nand: nand_do_read_oob: from = 0x0ed40000, len = 64
[   52.765856] marvell-nfc pxa3xx-nand: 
[   52.765856] NDCR:  0x9d079fff
[   52.765856] NDCB0: 0x000d3000
[   52.765856] NDCB1: 0xda800000
[   52.765856] NDCB2: 0x00000001
[   52.765856] NDCB3: 0x00000000
[   52.784787] nand: nand_do_read_oob: from = 0x0ed60000, len = 64
[   52.790987] marvell-nfc pxa3xx-nand: 
[   52.790987] NDCR:  0x9d079fff
[   52.790987] NDCB0: 0x000d3000
[   52.790987] NDCB1: 0xdac00000
[   52.790987] NDCB2: 0x00000001
[   52.790987] NDCB3: 0x00000000
[   52.809915] nand: nand_do_read_oob: from = 0x0ed80000, len = 64
[   52.815947] marvell-nfc pxa3xx-nand: 
[   52.815947] NDCR:  0x9d079fff
[   52.815947] NDCB0: 0x000d3000
[   52.815947] NDCB1: 0xdb000000
[   52.815947] NDCB2: 0x00000001
[   52.815947] NDCB3: 0x00000000
[   52.834878] nand: nand_do_read_oob: from = 0x0eda0000, len = 64
[   52.841087] marvell-nfc pxa3xx-nand: 
[   52.841087] NDCR:  0x9d079fff
[   52.841087] NDCB0: 0x000d3000
[   52.841087] NDCB1: 0xdb400000
[   52.841087] NDCB2: 0x00000001
[   52.841087] NDCB3: 0x00000000
[   52.860012] nand: nand_do_read_oob: from = 0x0edc0000, len = 64
[   52.866045] marvell-nfc pxa3xx-nand: 
[   52.866045] NDCR:  0x9d079fff
[   52.866045] NDCB0: 0x000d3000
[   52.866045] NDCB1: 0xdb800000
[   52.866045] NDCB2: 0x00000001
[   52.866045] NDCB3: 0x00000000
[   52.884976] nand: nand_do_read_oob: from = 0x0ede0000, len = 64
[   52.891184] marvell-nfc pxa3xx-nand: 
[   52.891184] NDCR:  0x9d079fff
[   52.891184] NDCB0: 0x000d3000
[   52.891184] NDCB1: 0xdbc00000
[   52.891184] NDCB2: 0x00000001
[   52.891184] NDCB3: 0x00000000
[   52.910112] nand: nand_do_read_oob: from = 0x0ee00000, len = 64
[   52.916144] marvell-nfc pxa3xx-nand: 
[   52.916144] NDCR:  0x9d079fff
[   52.916144] NDCB0: 0x000d3000
[   52.916144] NDCB1: 0xdc000000
[   52.916144] NDCB2: 0x00000001
[   52.916144] NDCB3: 0x00000000
[   52.935078] nand: nand_do_read_oob: from = 0x0ee20000, len = 64
[   52.941281] marvell-nfc pxa3xx-nand: 
[   52.941281] NDCR:  0x9d079fff
[   52.941281] NDCB0: 0x000d3000
[   52.941281] NDCB1: 0xdc400000
[   52.941281] NDCB2: 0x00000001
[   52.941281] NDCB3: 0x00000000
[   52.960212] nand: nand_do_read_oob: from = 0x0ee40000, len = 64
[   52.966241] marvell-nfc pxa3xx-nand: 
[   52.966241] NDCR:  0x9d079fff
[   52.966241] NDCB0: 0x000d3000
[   52.966241] NDCB1: 0xdc800000
[   52.966241] NDCB2: 0x00000001
[   52.966241] NDCB3: 0x00000000
[   52.985178] nand: nand_do_read_oob: from = 0x0ee60000, len = 64
[   52.991382] marvell-nfc pxa3xx-nand: 
[   52.991382] NDCR:  0x9d079fff
[   52.991382] NDCB0: 0x000d3000
[   52.991382] NDCB1: 0xdcc00000
[   52.991382] NDCB2: 0x00000001
[   52.991382] NDCB3: 0x00000000
[   53.010320] nand: nand_do_read_oob: from = 0x0ee80000, len = 64
[   53.016349] marvell-nfc pxa3xx-nand: 
[   53.016349] NDCR:  0x9d079fff
[   53.016349] NDCB0: 0x000d3000
[   53.016349] NDCB1: 0xdd000000
[   53.016349] NDCB2: 0x00000001
[   53.016349] NDCB3: 0x00000000
[   53.035281] nand: nand_do_read_oob: from = 0x0eea0000, len = 64
[   53.041487] marvell-nfc pxa3xx-nand: 
[   53.041487] NDCR:  0x9d079fff
[   53.041487] NDCB0: 0x000d3000
[   53.041487] NDCB1: 0xdd400000
[   53.041487] NDCB2: 0x00000001
[   53.041487] NDCB3: 0x00000000
[   53.060415] nand: nand_do_read_oob: from = 0x0eec0000, len = 64
[   53.066448] marvell-nfc pxa3xx-nand: 
[   53.066448] NDCR:  0x9d079fff
[   53.066448] NDCB0: 0x000d3000
[   53.066448] NDCB1: 0xdd800000
[   53.066448] NDCB2: 0x00000001
[   53.066448] NDCB3: 0x00000000
[   53.085382] nand: nand_do_read_oob: from = 0x0eee0000, len = 64
[   53.091586] marvell-nfc pxa3xx-nand: 
[   53.091586] NDCR:  0x9d079fff
[   53.091586] NDCB0: 0x000d3000
[   53.091586] NDCB1: 0xddc00000
[   53.091586] NDCB2: 0x00000001
[   53.091586] NDCB3: 0x00000000
[   53.110512] nand: nand_do_read_oob: from = 0x0ef00000, len = 64
[   53.116545] marvell-nfc pxa3xx-nand: 
[   53.116545] NDCR:  0x9d079fff
[   53.116545] NDCB0: 0x000d3000
[   53.116545] NDCB1: 0xde000000
[   53.116545] NDCB2: 0x00000001
[   53.116545] NDCB3: 0x00000000
[   53.135479] nand: nand_do_read_oob: from = 0x0ef20000, len = 64
[   53.141683] marvell-nfc pxa3xx-nand: 
[   53.141683] NDCR:  0x9d079fff
[   53.141683] NDCB0: 0x000d3000
[   53.141683] NDCB1: 0xde400000
[   53.141683] NDCB2: 0x00000001
[   53.141683] NDCB3: 0x00000000
[   53.160614] nand: nand_do_read_oob: from = 0x0ef40000, len = 64
[   53.166645] marvell-nfc pxa3xx-nand: 
[   53.166645] NDCR:  0x9d079fff
[   53.166645] NDCB0: 0x000d3000
[   53.166645] NDCB1: 0xde800000
[   53.166645] NDCB2: 0x00000001
[   53.166645] NDCB3: 0x00000000
[   53.185578] nand: nand_do_read_oob: from = 0x0ef60000, len = 64
[   53.191784] marvell-nfc pxa3xx-nand: 
[   53.191784] NDCR:  0x9d079fff
[   53.191784] NDCB0: 0x000d3000
[   53.191784] NDCB1: 0xdec00000
[   53.191784] NDCB2: 0x00000001
[   53.191784] NDCB3: 0x00000000
[   53.210710] nand: nand_do_read_oob: from = 0x0ef80000, len = 64
[   53.216743] marvell-nfc pxa3xx-nand: 
[   53.216743] NDCR:  0x9d079fff
[   53.216743] NDCB0: 0x000d3000
[   53.216743] NDCB1: 0xdf000000
[   53.216743] NDCB2: 0x00000001
[   53.216743] NDCB3: 0x00000000
[   53.235675] nand: nand_do_read_oob: from = 0x0efa0000, len = 64
[   53.241883] marvell-nfc pxa3xx-nand: 
[   53.241883] NDCR:  0x9d079fff
[   53.241883] NDCB0: 0x000d3000
[   53.241883] NDCB1: 0xdf400000
[   53.241883] NDCB2: 0x00000001
[   53.241883] NDCB3: 0x00000000
[   53.260808] nand: nand_do_read_oob: from = 0x0efc0000, len = 64
[   53.266844] marvell-nfc pxa3xx-nand: 
[   53.266844] NDCR:  0x9d079fff
[   53.266844] NDCB0: 0x000d3000
[   53.266844] NDCB1: 0xdf800000
[   53.266844] NDCB2: 0x00000001
[   53.266844] NDCB3: 0x00000000
[   53.285782] nand: nand_do_read_oob: from = 0x0efe0000, len = 64
[   53.291989] marvell-nfc pxa3xx-nand: 
[   53.291989] NDCR:  0x9d079fff
[   53.291989] NDCB0: 0x000d3000
[   53.291989] NDCB1: 0xdfc00000
[   53.291989] NDCB2: 0x00000001
[   53.291989] NDCB3: 0x00000000
[   53.310918] nand: nand_do_read_oob: from = 0x0f000000, len = 64
[   53.316949] marvell-nfc pxa3xx-nand: 
[   53.316949] NDCR:  0x9d079fff
[   53.316949] NDCB0: 0x000d3000
[   53.316949] NDCB1: 0xe0000000
[   53.316949] NDCB2: 0x00000001
[   53.316949] NDCB3: 0x00000000
[   53.335880] nand: nand_do_read_oob: from = 0x0f020000, len = 64
[   53.342087] marvell-nfc pxa3xx-nand: 
[   53.342087] NDCR:  0x9d079fff
[   53.342087] NDCB0: 0x000d3000
[   53.342087] NDCB1: 0xe0400000
[   53.342087] NDCB2: 0x00000001
[   53.342087] NDCB3: 0x00000000
[   53.361015] nand: nand_do_read_oob: from = 0x0f040000, len = 64
[   53.367047] marvell-nfc pxa3xx-nand: 
[   53.367047] NDCR:  0x9d079fff
[   53.367047] NDCB0: 0x000d3000
[   53.367047] NDCB1: 0xe0800000
[   53.367047] NDCB2: 0x00000001
[   53.367047] NDCB3: 0x00000000
[   53.385996] nand: nand_do_read_oob: from = 0x0f060000, len = 64
[   53.392194] marvell-nfc pxa3xx-nand: 
[   53.392194] NDCR:  0x9d079fff
[   53.392194] NDCB0: 0x000d3000
[   53.392194] NDCB1: 0xe0c00000
[   53.392194] NDCB2: 0x00000001
[   53.392194] NDCB3: 0x00000000
[   53.411122] nand: nand_do_read_oob: from = 0x0f080000, len = 64
[   53.417152] marvell-nfc pxa3xx-nand: 
[   53.417152] NDCR:  0x9d079fff
[   53.417152] NDCB0: 0x000d3000
[   53.417152] NDCB1: 0xe1000000
[   53.417152] NDCB2: 0x00000001
[   53.417152] NDCB3: 0x00000000
[   53.436087] nand: nand_do_read_oob: from = 0x0f0a0000, len = 64
[   53.442294] marvell-nfc pxa3xx-nand: 
[   53.442294] NDCR:  0x9d079fff
[   53.442294] NDCB0: 0x000d3000
[   53.442294] NDCB1: 0xe1400000
[   53.442294] NDCB2: 0x00000001
[   53.442294] NDCB3: 0x00000000
[   53.461220] nand: nand_do_read_oob: from = 0x0f0c0000, len = 64
[   53.467251] marvell-nfc pxa3xx-nand: 
[   53.467251] NDCR:  0x9d079fff
[   53.467251] NDCB0: 0x000d3000
[   53.467251] NDCB1: 0xe1800000
[   53.467251] NDCB2: 0x00000001
[   53.467251] NDCB3: 0x00000000
[   53.486185] nand: nand_do_read_oob: from = 0x0f0e0000, len = 64
[   53.492392] marvell-nfc pxa3xx-nand: 
[   53.492392] NDCR:  0x9d079fff
[   53.492392] NDCB0: 0x000d3000
[   53.492392] NDCB1: 0xe1c00000
[   53.492392] NDCB2: 0x00000001
[   53.492392] NDCB3: 0x00000000
[   53.511318] nand: nand_do_read_oob: from = 0x0f100000, len = 64
[   53.517349] marvell-nfc pxa3xx-nand: 
[   53.517349] NDCR:  0x9d079fff
[   53.517349] NDCB0: 0x000d3000
[   53.517349] NDCB1: 0xe2000000
[   53.517349] NDCB2: 0x00000001
[   53.517349] NDCB3: 0x00000000
[   53.536283] nand: nand_do_read_oob: from = 0x0f120000, len = 64
[   53.542487] marvell-nfc pxa3xx-nand: 
[   53.542487] NDCR:  0x9d079fff
[   53.542487] NDCB0: 0x000d3000
[   53.542487] NDCB1: 0xe2400000
[   53.542487] NDCB2: 0x00000001
[   53.542487] NDCB3: 0x00000000
[   53.561416] nand: nand_do_read_oob: from = 0x0f140000, len = 64
[   53.567448] marvell-nfc pxa3xx-nand: 
[   53.567448] NDCR:  0x9d079fff
[   53.567448] NDCB0: 0x000d3000
[   53.567448] NDCB1: 0xe2800000
[   53.567448] NDCB2: 0x00000001
[   53.567448] NDCB3: 0x00000000
[   53.586382] nand: nand_do_read_oob: from = 0x0f160000, len = 64
[   53.592590] marvell-nfc pxa3xx-nand: 
[   53.592590] NDCR:  0x9d079fff
[   53.592590] NDCB0: 0x000d3000
[   53.592590] NDCB1: 0xe2c00000
[   53.592590] NDCB2: 0x00000001
[   53.592590] NDCB3: 0x00000000
[   53.611520] nand: nand_do_read_oob: from = 0x0f180000, len = 64
[   53.617557] marvell-nfc pxa3xx-nand: 
[   53.617557] NDCR:  0x9d079fff
[   53.617557] NDCB0: 0x000d3000
[   53.617557] NDCB1: 0xe3000000
[   53.617557] NDCB2: 0x00000001
[   53.617557] NDCB3: 0x00000000
[   53.636488] nand: nand_do_read_oob: from = 0x0f1a0000, len = 64
[   53.642692] marvell-nfc pxa3xx-nand: 
[   53.642692] NDCR:  0x9d079fff
[   53.642692] NDCB0: 0x000d3000
[   53.642692] NDCB1: 0xe3400000
[   53.642692] NDCB2: 0x00000001
[   53.642692] NDCB3: 0x00000000
[   53.661621] nand: nand_do_read_oob: from = 0x0f1c0000, len = 64
[   53.667654] marvell-nfc pxa3xx-nand: 
[   53.667654] NDCR:  0x9d079fff
[   53.667654] NDCB0: 0x000d3000
[   53.667654] NDCB1: 0xe3800000
[   53.667654] NDCB2: 0x00000001
[   53.667654] NDCB3: 0x00000000
[   53.686588] nand: nand_do_read_oob: from = 0x0f1e0000, len = 64
[   53.692795] marvell-nfc pxa3xx-nand: 
[   53.692795] NDCR:  0x9d079fff
[   53.692795] NDCB0: 0x000d3000
[   53.692795] NDCB1: 0xe3c00000
[   53.692795] NDCB2: 0x00000001
[   53.692795] NDCB3: 0x00000000
[   53.711723] nand: nand_do_read_oob: from = 0x0f200000, len = 64
[   53.717752] marvell-nfc pxa3xx-nand: 
[   53.717752] NDCR:  0x9d079fff
[   53.717752] NDCB0: 0x000d3000
[   53.717752] NDCB1: 0xe4000000
[   53.717752] NDCB2: 0x00000001
[   53.717752] NDCB3: 0x00000000
[   53.736690] nand: nand_do_read_oob: from = 0x0f220000, len = 64
[   53.742892] marvell-nfc pxa3xx-nand: 
[   53.742892] NDCR:  0x9d079fff
[   53.742892] NDCB0: 0x000d3000
[   53.742892] NDCB1: 0xe4400000
[   53.742892] NDCB2: 0x00000001
[   53.742892] NDCB3: 0x00000000
[   53.761820] nand: nand_do_read_oob: from = 0x0f240000, len = 64
[   53.767851] marvell-nfc pxa3xx-nand: 
[   53.767851] NDCR:  0x9d079fff
[   53.767851] NDCB0: 0x000d3000
[   53.767851] NDCB1: 0xe4800000
[   53.767851] NDCB2: 0x00000001
[   53.767851] NDCB3: 0x00000000
[   53.786788] nand: nand_do_read_oob: from = 0x0f260000, len = 64
[   53.792989] marvell-nfc pxa3xx-nand: 
[   53.792989] NDCR:  0x9d079fff
[   53.792989] NDCB0: 0x000d3000
[   53.792989] NDCB1: 0xe4c00000
[   53.792989] NDCB2: 0x00000001
[   53.792989] NDCB3: 0x00000000
[   53.811919] nand: nand_do_read_oob: from = 0x0f280000, len = 64
[   53.817949] marvell-nfc pxa3xx-nand: 
[   53.817949] NDCR:  0x9d079fff
[   53.817949] NDCB0: 0x000d3000
[   53.817949] NDCB1: 0xe5000000
[   53.817949] NDCB2: 0x00000001
[   53.817949] NDCB3: 0x00000000
[   53.836886] nand: nand_do_read_oob: from = 0x0f2a0000, len = 64
[   53.843088] marvell-nfc pxa3xx-nand: 
[   53.843088] NDCR:  0x9d079fff
[   53.843088] NDCB0: 0x000d3000
[   53.843088] NDCB1: 0xe5400000
[   53.843088] NDCB2: 0x00000001
[   53.843088] NDCB3: 0x00000000
[   53.862019] nand: nand_do_read_oob: from = 0x0f2c0000, len = 64
[   53.868047] marvell-nfc pxa3xx-nand: 
[   53.868047] NDCR:  0x9d079fff
[   53.868047] NDCB0: 0x000d3000
[   53.868047] NDCB1: 0xe5800000
[   53.868047] NDCB2: 0x00000001
[   53.868047] NDCB3: 0x00000000
[   53.886984] nand: nand_do_read_oob: from = 0x0f2e0000, len = 64
[   53.893186] marvell-nfc pxa3xx-nand: 
[   53.893186] NDCR:  0x9d079fff
[   53.893186] NDCB0: 0x000d3000
[   53.893186] NDCB1: 0xe5c00000
[   53.893186] NDCB2: 0x00000001
[   53.893186] NDCB3: 0x00000000
[   53.912115] nand: nand_do_read_oob: from = 0x0f300000, len = 64
[   53.918147] marvell-nfc pxa3xx-nand: 
[   53.918147] NDCR:  0x9d079fff
[   53.918147] NDCB0: 0x000d3000
[   53.918147] NDCB1: 0xe6000000
[   53.918147] NDCB2: 0x00000001
[   53.918147] NDCB3: 0x00000000
[   53.937080] nand: nand_do_read_oob: from = 0x0f320000, len = 64
[   53.943287] marvell-nfc pxa3xx-nand: 
[   53.943287] NDCR:  0x9d079fff
[   53.943287] NDCB0: 0x000d3000
[   53.943287] NDCB1: 0xe6400000
[   53.943287] NDCB2: 0x00000001
[   53.943287] NDCB3: 0x00000000
[   53.962214] nand: nand_do_read_oob: from = 0x0f340000, len = 64
[   53.968244] marvell-nfc pxa3xx-nand: 
[   53.968244] NDCR:  0x9d079fff
[   53.968244] NDCB0: 0x000d3000
[   53.968244] NDCB1: 0xe6800000
[   53.968244] NDCB2: 0x00000001
[   53.968244] NDCB3: 0x00000000
[   53.987179] nand: nand_do_read_oob: from = 0x0f360000, len = 64
[   53.993384] marvell-nfc pxa3xx-nand: 
[   53.993384] NDCR:  0x9d079fff
[   53.993384] NDCB0: 0x000d3000
[   53.993384] NDCB1: 0xe6c00000
[   53.993384] NDCB2: 0x00000001
[   53.993384] NDCB3: 0x00000000
[   54.012322] nand: nand_do_read_oob: from = 0x0f380000, len = 64
[   54.018353] marvell-nfc pxa3xx-nand: 
[   54.018353] NDCR:  0x9d079fff
[   54.018353] NDCB0: 0x000d3000
[   54.018353] NDCB1: 0xe7000000
[   54.018353] NDCB2: 0x00000001
[   54.018353] NDCB3: 0x00000000
[   54.037302] nand: nand_do_read_oob: from = 0x0f3a0000, len = 64
[   54.043507] marvell-nfc pxa3xx-nand: 
[   54.043507] NDCR:  0x9d079fff
[   54.043507] NDCB0: 0x000d3000
[   54.043507] NDCB1: 0xe7400000
[   54.043507] NDCB2: 0x00000001
[   54.043507] NDCB3: 0x00000000
[   54.062437] nand: nand_do_read_oob: from = 0x0f3c0000, len = 64
[   54.068467] marvell-nfc pxa3xx-nand: 
[   54.068467] NDCR:  0x9d079fff
[   54.068467] NDCB0: 0x000d3000
[   54.068467] NDCB1: 0xe7800000
[   54.068467] NDCB2: 0x00000001
[   54.068467] NDCB3: 0x00000000
[   54.087400] nand: nand_do_read_oob: from = 0x0f3e0000, len = 64
[   54.093890] marvell-nfc pxa3xx-nand: 
[   54.093890] NDCR:  0x9d079fff
[   54.093890] NDCB0: 0x000d3000
[   54.093890] NDCB1: 0xe7c00000
[   54.093890] NDCB2: 0x00000001
[   54.093890] NDCB3: 0x00000000
[   54.112895] nand: nand_do_read_oob: from = 0x0f400000, len = 64
[   54.119100] marvell-nfc pxa3xx-nand: 
[   54.119100] NDCR:  0x9d079fff
[   54.119100] NDCB0: 0x000d3000
[   54.119100] NDCB1: 0xe8000000
[   54.119100] NDCB2: 0x00000001
[   54.119100] NDCB3: 0x00000000
[   54.138017] nand: nand_do_read_oob: from = 0x0f420000, len = 64
[   54.144219] marvell-nfc pxa3xx-nand: 
[   54.144219] NDCR:  0x9d079fff
[   54.144219] NDCB0: 0x000d3000
[   54.144219] NDCB1: 0xe8400000
[   54.144219] NDCB2: 0x00000001
[   54.144219] NDCB3: 0x00000000
[   54.163151] nand: nand_do_read_oob: from = 0x0f440000, len = 64
[   54.169352] marvell-nfc pxa3xx-nand: 
[   54.169352] NDCR:  0x9d079fff
[   54.169352] NDCB0: 0x000d3000
[   54.169352] NDCB1: 0xe8800000
[   54.169352] NDCB2: 0x00000001
[   54.169352] NDCB3: 0x00000000
[   54.188273] nand: nand_do_read_oob: from = 0x0f460000, len = 64
[   54.194475] marvell-nfc pxa3xx-nand: 
[   54.194475] NDCR:  0x9d079fff
[   54.194475] NDCB0: 0x000d3000
[   54.194475] NDCB1: 0xe8c00000
[   54.194475] NDCB2: 0x00000001
[   54.194475] NDCB3: 0x00000000
[   54.213406] nand: nand_do_read_oob: from = 0x0f480000, len = 64
[   54.219604] marvell-nfc pxa3xx-nand: 
[   54.219604] NDCR:  0x9d079fff
[   54.219604] NDCB0: 0x000d3000
[   54.219604] NDCB1: 0xe9000000
[   54.219604] NDCB2: 0x00000001
[   54.219604] NDCB3: 0x00000000
[   54.238528] nand: nand_do_read_oob: from = 0x0f4a0000, len = 64
[   54.244729] marvell-nfc pxa3xx-nand: 
[   54.244729] NDCR:  0x9d079fff
[   54.244729] NDCB0: 0x000d3000
[   54.244729] NDCB1: 0xe9400000
[   54.244729] NDCB2: 0x00000001
[   54.244729] NDCB3: 0x00000000
[   54.263659] nand: nand_do_read_oob: from = 0x0f4c0000, len = 64
[   54.269860] marvell-nfc pxa3xx-nand: 
[   54.269860] NDCR:  0x9d079fff
[   54.269860] NDCB0: 0x000d3000
[   54.269860] NDCB1: 0xe9800000
[   54.269860] NDCB2: 0x00000001
[   54.269860] NDCB3: 0x00000000
[   54.288853] nand: nand_do_read_oob: from = 0x0f4e0000, len = 64
[   54.294892] marvell-nfc pxa3xx-nand: 
[   54.294892] NDCR:  0x9d079fff
[   54.294892] NDCB0: 0x000d3000
[   54.294892] NDCB1: 0xe9c00000
[   54.294892] NDCB2: 0x00000001
[   54.294892] NDCB3: 0x00000000
[   54.313824] nand: nand_do_read_oob: from = 0x0f500000, len = 64
[   54.320028] marvell-nfc pxa3xx-nand: 
[   54.320028] NDCR:  0x9d079fff
[   54.320028] NDCB0: 0x000d3000
[   54.320028] NDCB1: 0xea000000
[   54.320028] NDCB2: 0x00000001
[   54.320028] NDCB3: 0x00000000
[   54.338995] nand: nand_do_read_oob: from = 0x0f520000, len = 64
[   54.345031] marvell-nfc pxa3xx-nand: 
[   54.345031] NDCR:  0x9d079fff
[   54.345031] NDCB0: 0x000d3000
[   54.345031] NDCB1: 0xea400000
[   54.345031] NDCB2: 0x00000001
[   54.345031] NDCB3: 0x00000000
[   54.363965] nand: nand_do_read_oob: from = 0x0f540000, len = 64
[   54.370170] marvell-nfc pxa3xx-nand: 
[   54.370170] NDCR:  0x9d079fff
[   54.370170] NDCB0: 0x000d3000
[   54.370170] NDCB1: 0xea800000
[   54.370170] NDCB2: 0x00000001
[   54.370170] NDCB3: 0x00000000
[   54.389098] nand: nand_do_read_oob: from = 0x0f560000, len = 64
[   54.395127] marvell-nfc pxa3xx-nand: 
[   54.395127] NDCR:  0x9d079fff
[   54.395127] NDCB0: 0x000d3000
[   54.395127] NDCB1: 0xeac00000
[   54.395127] NDCB2: 0x00000001
[   54.395127] NDCB3: 0x00000000
[   54.414061] nand: nand_do_read_oob: from = 0x0f580000, len = 64
[   54.420269] marvell-nfc pxa3xx-nand: 
[   54.420269] NDCR:  0x9d079fff
[   54.420269] NDCB0: 0x000d3000
[   54.420269] NDCB1: 0xeb000000
[   54.420269] NDCB2: 0x00000001
[   54.420269] NDCB3: 0x00000000
[   54.439196] nand: nand_do_read_oob: from = 0x0f5a0000, len = 64
[   54.445227] marvell-nfc pxa3xx-nand: 
[   54.445227] NDCR:  0x9d079fff
[   54.445227] NDCB0: 0x000d3000
[   54.445227] NDCB1: 0xeb400000
[   54.445227] NDCB2: 0x00000001
[   54.445227] NDCB3: 0x00000000
[   54.464162] nand: nand_do_read_oob: from = 0x0f5c0000, len = 64
[   54.470366] marvell-nfc pxa3xx-nand: 
[   54.470366] NDCR:  0x9d079fff
[   54.470366] NDCB0: 0x000d3000
[   54.470366] NDCB1: 0xeb800000
[   54.470366] NDCB2: 0x00000001
[   54.470366] NDCB3: 0x00000000
[   54.489294] nand: nand_do_read_oob: from = 0x0f5e0000, len = 64
[   54.495326] marvell-nfc pxa3xx-nand: 
[   54.495326] NDCR:  0x9d079fff
[   54.495326] NDCB0: 0x000d3000
[   54.495326] NDCB1: 0xebc00000
[   54.495326] NDCB2: 0x00000001
[   54.495326] NDCB3: 0x00000000
[   54.514262] nand: nand_do_read_oob: from = 0x0f600000, len = 64
[   54.520463] marvell-nfc pxa3xx-nand: 
[   54.520463] NDCR:  0x9d079fff
[   54.520463] NDCB0: 0x000d3000
[   54.520463] NDCB1: 0xec000000
[   54.520463] NDCB2: 0x00000001
[   54.520463] NDCB3: 0x00000000
[   54.539399] nand: nand_do_read_oob: from = 0x0f620000, len = 64
[   54.545433] marvell-nfc pxa3xx-nand: 
[   54.545433] NDCR:  0x9d079fff
[   54.545433] NDCB0: 0x000d3000
[   54.545433] NDCB1: 0xec400000
[   54.545433] NDCB2: 0x00000001
[   54.545433] NDCB3: 0x00000000
[   54.564367] nand: nand_do_read_oob: from = 0x0f640000, len = 64
[   54.570571] marvell-nfc pxa3xx-nand: 
[   54.570571] NDCR:  0x9d079fff
[   54.570571] NDCB0: 0x000d3000
[   54.570571] NDCB1: 0xec800000
[   54.570571] NDCB2: 0x00000001
[   54.570571] NDCB3: 0x00000000
[   54.589501] nand: nand_do_read_oob: from = 0x0f660000, len = 64
[   54.595532] marvell-nfc pxa3xx-nand: 
[   54.595532] NDCR:  0x9d079fff
[   54.595532] NDCB0: 0x000d3000
[   54.595532] NDCB1: 0xecc00000
[   54.595532] NDCB2: 0x00000001
[   54.595532] NDCB3: 0x00000000
[   54.614466] nand: nand_do_read_oob: from = 0x0f680000, len = 64
[   54.620694] marvell-nfc pxa3xx-nand: 
[   54.620694] NDCR:  0x9d079fff
[   54.620694] NDCB0: 0x000d3000
[   54.620694] NDCB1: 0xed000000
[   54.620694] NDCB2: 0x00000001
[   54.620694] NDCB3: 0x00000000
[   54.639628] nand: nand_do_read_oob: from = 0x0f6a0000, len = 64
[   54.645655] marvell-nfc pxa3xx-nand: 
[   54.645655] NDCR:  0x9d079fff
[   54.645655] NDCB0: 0x000d3000
[   54.645655] NDCB1: 0xed400000
[   54.645655] NDCB2: 0x00000001
[   54.645655] NDCB3: 0x00000000
[   54.664589] nand: nand_do_read_oob: from = 0x0f6c0000, len = 64
[   54.670794] marvell-nfc pxa3xx-nand: 
[   54.670794] NDCR:  0x9d079fff
[   54.670794] NDCB0: 0x000d3000
[   54.670794] NDCB1: 0xed800000
[   54.670794] NDCB2: 0x00000001
[   54.670794] NDCB3: 0x00000000
[   54.689725] nand: nand_do_read_oob: from = 0x0f6e0000, len = 64
[   54.695755] marvell-nfc pxa3xx-nand: 
[   54.695755] NDCR:  0x9d079fff
[   54.695755] NDCB0: 0x000d3000
[   54.695755] NDCB1: 0xedc00000
[   54.695755] NDCB2: 0x00000001
[   54.695755] NDCB3: 0x00000000
[   54.714687] nand: nand_do_read_oob: from = 0x0f700000, len = 64
[   54.720893] marvell-nfc pxa3xx-nand: 
[   54.720893] NDCR:  0x9d079fff
[   54.720893] NDCB0: 0x000d3000
[   54.720893] NDCB1: 0xee000000
[   54.720893] NDCB2: 0x00000001
[   54.720893] NDCB3: 0x00000000
[   54.739822] nand: nand_do_read_oob: from = 0x0f720000, len = 64
[   54.745853] marvell-nfc pxa3xx-nand: 
[   54.745853] NDCR:  0x9d079fff
[   54.745853] NDCB0: 0x000d3000
[   54.745853] NDCB1: 0xee400000
[   54.745853] NDCB2: 0x00000001
[   54.745853] NDCB3: 0x00000000
[   54.764785] nand: nand_do_read_oob: from = 0x0f740000, len = 64
[   54.770992] marvell-nfc pxa3xx-nand: 
[   54.770992] NDCR:  0x9d079fff
[   54.770992] NDCB0: 0x000d3000
[   54.770992] NDCB1: 0xee800000
[   54.770992] NDCB2: 0x00000001
[   54.770992] NDCB3: 0x00000000
[   54.789920] nand: nand_do_read_oob: from = 0x0f760000, len = 64
[   54.795952] marvell-nfc pxa3xx-nand: 
[   54.795952] NDCR:  0x9d079fff
[   54.795952] NDCB0: 0x000d3000
[   54.795952] NDCB1: 0xeec00000
[   54.795952] NDCB2: 0x00000001
[   54.795952] NDCB3: 0x00000000
[   54.814883] nand: nand_do_read_oob: from = 0x0f780000, len = 64
[   54.821090] marvell-nfc pxa3xx-nand: 
[   54.821090] NDCR:  0x9d079fff
[   54.821090] NDCB0: 0x000d3000
[   54.821090] NDCB1: 0xef000000
[   54.821090] NDCB2: 0x00000001
[   54.821090] NDCB3: 0x00000000
[   54.840019] nand: nand_do_read_oob: from = 0x0f7a0000, len = 64
[   54.846049] marvell-nfc pxa3xx-nand: 
[   54.846049] NDCR:  0x9d079fff
[   54.846049] NDCB0: 0x000d3000
[   54.846049] NDCB1: 0xef400000
[   54.846049] NDCB2: 0x00000001
[   54.846049] NDCB3: 0x00000000
[   54.864982] nand: nand_do_read_oob: from = 0x0f7c0000, len = 64
[   54.871190] marvell-nfc pxa3xx-nand: 
[   54.871190] NDCR:  0x9d079fff
[   54.871190] NDCB0: 0x000d3000
[   54.871190] NDCB1: 0xef800000
[   54.871190] NDCB2: 0x00000001
[   54.871190] NDCB3: 0x00000000
[   54.890119] nand: nand_do_read_oob: from = 0x0f7e0000, len = 64
[   54.896150] marvell-nfc pxa3xx-nand: 
[   54.896150] NDCR:  0x9d079fff
[   54.896150] NDCB0: 0x000d3000
[   54.896150] NDCB1: 0xefc00000
[   54.896150] NDCB2: 0x00000001
[   54.896150] NDCB3: 0x00000000
[   54.915080] nand: nand_do_read_oob: from = 0x0f800000, len = 64
[   54.921285] marvell-nfc pxa3xx-nand: 
[   54.921285] NDCR:  0x9d079fff
[   54.921285] NDCB0: 0x000d3000
[   54.921285] NDCB1: 0xf0000000
[   54.921285] NDCB2: 0x00000001
[   54.921285] NDCB3: 0x00000000
[   54.940215] nand: nand_do_read_oob: from = 0x0f820000, len = 64
[   54.946248] marvell-nfc pxa3xx-nand: 
[   54.946248] NDCR:  0x9d079fff
[   54.946248] NDCB0: 0x000d3000
[   54.946248] NDCB1: 0xf0400000
[   54.946248] NDCB2: 0x00000001
[   54.946248] NDCB3: 0x00000000
[   54.965179] nand: nand_do_read_oob: from = 0x0f840000, len = 64
[   54.971385] marvell-nfc pxa3xx-nand: 
[   54.971385] NDCR:  0x9d079fff
[   54.971385] NDCB0: 0x000d3000
[   54.971385] NDCB1: 0xf0800000
[   54.971385] NDCB2: 0x00000001
[   54.971385] NDCB3: 0x00000000
[   54.990312] nand: nand_do_read_oob: from = 0x0f860000, len = 64
[   54.996345] marvell-nfc pxa3xx-nand: 
[   54.996345] NDCR:  0x9d079fff
[   54.996345] NDCB0: 0x000d3000
[   54.996345] NDCB1: 0xf0c00000
[   54.996345] NDCB2: 0x00000001
[   54.996345] NDCB3: 0x00000000
[   55.015287] nand: nand_do_read_oob: from = 0x0f880000, len = 64
[   55.021492] marvell-nfc pxa3xx-nand: 
[   55.021492] NDCR:  0x9d079fff
[   55.021492] NDCB0: 0x000d3000
[   55.021492] NDCB1: 0xf1000000
[   55.021492] NDCB2: 0x00000001
[   55.021492] NDCB3: 0x00000000
[   55.040418] nand: nand_do_read_oob: from = 0x0f8a0000, len = 64
[   55.046452] marvell-nfc pxa3xx-nand: 
[   55.046452] NDCR:  0x9d079fff
[   55.046452] NDCB0: 0x000d3000
[   55.046452] NDCB1: 0xf1400000
[   55.046452] NDCB2: 0x00000001
[   55.046452] NDCB3: 0x00000000
[   55.065384] nand: nand_do_read_oob: from = 0x0f8c0000, len = 64
[   55.071591] marvell-nfc pxa3xx-nand: 
[   55.071591] NDCR:  0x9d079fff
[   55.071591] NDCB0: 0x000d3000
[   55.071591] NDCB1: 0xf1800000
[   55.071591] NDCB2: 0x00000001
[   55.071591] NDCB3: 0x00000000
[   55.090517] nand: nand_do_read_oob: from = 0x0f8e0000, len = 64
[   55.096550] marvell-nfc pxa3xx-nand: 
[   55.096550] NDCR:  0x9d079fff
[   55.096550] NDCB0: 0x000d3000
[   55.096550] NDCB1: 0xf1c00000
[   55.096550] NDCB2: 0x00000001
[   55.096550] NDCB3: 0x00000000
[   55.115481] nand: nand_do_read_oob: from = 0x0f900000, len = 64
[   55.121681] marvell-nfc pxa3xx-nand: 
[   55.121681] NDCR:  0x9d079fff
[   55.121681] NDCB0: 0x000d3000
[   55.121681] NDCB1: 0xf2000000
[   55.121681] NDCB2: 0x00000001
[   55.121681] NDCB3: 0x00000000
[   55.140611] nand: nand_do_read_oob: from = 0x0f920000, len = 64
[   55.146641] marvell-nfc pxa3xx-nand: 
[   55.146641] NDCR:  0x9d079fff
[   55.146641] NDCB0: 0x000d3000
[   55.146641] NDCB1: 0xf2400000
[   55.146641] NDCB2: 0x00000001
[   55.146641] NDCB3: 0x00000000
[   55.165574] nand: nand_do_read_oob: from = 0x0f940000, len = 64
[   55.171777] marvell-nfc pxa3xx-nand: 
[   55.171777] NDCR:  0x9d079fff
[   55.171777] NDCB0: 0x000d3000
[   55.171777] NDCB1: 0xf2800000
[   55.171777] NDCB2: 0x00000001
[   55.171777] NDCB3: 0x00000000
[   55.190706] nand: nand_do_read_oob: from = 0x0f960000, len = 64
[   55.196739] marvell-nfc pxa3xx-nand: 
[   55.196739] NDCR:  0x9d079fff
[   55.196739] NDCB0: 0x000d3000
[   55.196739] NDCB1: 0xf2c00000
[   55.196739] NDCB2: 0x00000001
[   55.196739] NDCB3: 0x00000000
[   55.215671] nand: nand_do_read_oob: from = 0x0f980000, len = 64
[   55.221880] marvell-nfc pxa3xx-nand: 
[   55.221880] NDCR:  0x9d079fff
[   55.221880] NDCB0: 0x000d3000
[   55.221880] NDCB1: 0xf3000000
[   55.221880] NDCB2: 0x00000001
[   55.221880] NDCB3: 0x00000000
[   55.240806] nand: nand_do_read_oob: from = 0x0f9a0000, len = 64
[   55.246839] marvell-nfc pxa3xx-nand: 
[   55.246839] NDCR:  0x9d079fff
[   55.246839] NDCB0: 0x000d3000
[   55.246839] NDCB1: 0xf3400000
[   55.246839] NDCB2: 0x00000001
[   55.246839] NDCB3: 0x00000000
[   55.265786] nand: nand_do_read_oob: from = 0x0f9c0000, len = 64
[   55.271996] marvell-nfc pxa3xx-nand: 
[   55.271996] NDCR:  0x9d079fff
[   55.271996] NDCB0: 0x000d3000
[   55.271996] NDCB1: 0xf3800000
[   55.271996] NDCB2: 0x00000001
[   55.271996] NDCB3: 0x00000000
[   55.290922] nand: nand_do_read_oob: from = 0x0f9e0000, len = 64
[   55.296954] marvell-nfc pxa3xx-nand: 
[   55.296954] NDCR:  0x9d079fff
[   55.296954] NDCB0: 0x000d3000
[   55.296954] NDCB1: 0xf3c00000
[   55.296954] NDCB2: 0x00000001
[   55.296954] NDCB3: 0x00000000
[   55.315886] nand: nand_do_read_oob: from = 0x0fa00000, len = 64
[   55.322092] marvell-nfc pxa3xx-nand: 
[   55.322092] NDCR:  0x9d079fff
[   55.322092] NDCB0: 0x000d3000
[   55.322092] NDCB1: 0xf4000000
[   55.322092] NDCB2: 0x00000001
[   55.322092] NDCB3: 0x00000000
[   55.341022] nand: nand_do_read_oob: from = 0x0fa20000, len = 64
[   55.347051] marvell-nfc pxa3xx-nand: 
[   55.347051] NDCR:  0x9d079fff
[   55.347051] NDCB0: 0x000d3000
[   55.347051] NDCB1: 0xf4400000
[   55.347051] NDCB2: 0x00000001
[   55.347051] NDCB3: 0x00000000
[   55.365986] nand: nand_do_read_oob: from = 0x0fa40000, len = 64
[   55.372192] marvell-nfc pxa3xx-nand: 
[   55.372192] NDCR:  0x9d079fff
[   55.372192] NDCB0: 0x000d3000
[   55.372192] NDCB1: 0xf4800000
[   55.372192] NDCB2: 0x00000001
[   55.372192] NDCB3: 0x00000000
[   55.391120] nand: nand_do_read_oob: from = 0x0fa60000, len = 64
[   55.397152] marvell-nfc pxa3xx-nand: 
[   55.397152] NDCR:  0x9d079fff
[   55.397152] NDCB0: 0x000d3000
[   55.397152] NDCB1: 0xf4c00000
[   55.397152] NDCB2: 0x00000001
[   55.397152] NDCB3: 0x00000000
[   55.416081] nand: nand_do_read_oob: from = 0x0fa80000, len = 64
[   55.422279] marvell-nfc pxa3xx-nand: 
[   55.422279] NDCR:  0x9d079fff
[   55.422279] NDCB0: 0x000d3000
[   55.422279] NDCB1: 0xf5000000
[   55.422279] NDCB2: 0x00000001
[   55.422279] NDCB3: 0x00000000
[   55.441209] nand: nand_do_read_oob: from = 0x0faa0000, len = 64
[   55.447240] marvell-nfc pxa3xx-nand: 
[   55.447240] NDCR:  0x9d079fff
[   55.447240] NDCB0: 0x000d3000
[   55.447240] NDCB1: 0xf5400000
[   55.447240] NDCB2: 0x00000001
[   55.447240] NDCB3: 0x00000000
[   55.466174] nand: nand_do_read_oob: from = 0x0fac0000, len = 64
[   55.472379] marvell-nfc pxa3xx-nand: 
[   55.472379] NDCR:  0x9d079fff
[   55.472379] NDCB0: 0x000d3000
[   55.472379] NDCB1: 0xf5800000
[   55.472379] NDCB2: 0x00000001
[   55.472379] NDCB3: 0x00000000
[   55.491306] nand: nand_do_read_oob: from = 0x0fae0000, len = 64
[   55.497339] marvell-nfc pxa3xx-nand: 
[   55.497339] NDCR:  0x9d079fff
[   55.497339] NDCB0: 0x000d3000
[   55.497339] NDCB1: 0xf5c00000
[   55.497339] NDCB2: 0x00000001
[   55.497339] NDCB3: 0x00000000
[   55.516271] nand: nand_do_read_oob: from = 0x0fb00000, len = 64
[   55.522478] marvell-nfc pxa3xx-nand: 
[   55.522478] NDCR:  0x9d079fff
[   55.522478] NDCB0: 0x000d3000
[   55.522478] NDCB1: 0xf6000000
[   55.522478] NDCB2: 0x00000001
[   55.522478] NDCB3: 0x00000000
[   55.541407] nand: nand_do_read_oob: from = 0x0fb20000, len = 64
[   55.547436] marvell-nfc pxa3xx-nand: 
[   55.547436] NDCR:  0x9d079fff
[   55.547436] NDCB0: 0x000d3000
[   55.547436] NDCB1: 0xf6400000
[   55.547436] NDCB2: 0x00000001
[   55.547436] NDCB3: 0x00000000
[   55.566369] nand: nand_do_read_oob: from = 0x0fb40000, len = 64
[   55.572574] marvell-nfc pxa3xx-nand: 
[   55.572574] NDCR:  0x9d079fff
[   55.572574] NDCB0: 0x000d3000
[   55.572574] NDCB1: 0xf6800000
[   55.572574] NDCB2: 0x00000001
[   55.572574] NDCB3: 0x00000000
[   55.591503] nand: nand_do_read_oob: from = 0x0fb60000, len = 64
[   55.597535] marvell-nfc pxa3xx-nand: 
[   55.597535] NDCR:  0x9d079fff
[   55.597535] NDCB0: 0x000d3000
[   55.597535] NDCB1: 0xf6c00000
[   55.597535] NDCB2: 0x00000001
[   55.597535] NDCB3: 0x00000000
[   55.616468] nand: nand_do_read_oob: from = 0x0fb80000, len = 64
[   55.622672] marvell-nfc pxa3xx-nand: 
[   55.622672] NDCR:  0x9d079fff
[   55.622672] NDCB0: 0x000d3000
[   55.622672] NDCB1: 0xf7000000
[   55.622672] NDCB2: 0x00000001
[   55.622672] NDCB3: 0x00000000
[   55.641603] nand: nand_do_read_oob: from = 0x0fba0000, len = 64
[   55.647634] marvell-nfc pxa3xx-nand: 
[   55.647634] NDCR:  0x9d079fff
[   55.647634] NDCB0: 0x000d3000
[   55.647634] NDCB1: 0xf7400000
[   55.647634] NDCB2: 0x00000001
[   55.647634] NDCB3: 0x00000000
[   55.666565] nand: nand_do_read_oob: from = 0x0fbc0000, len = 64
[   55.672764] marvell-nfc pxa3xx-nand: 
[   55.672764] NDCR:  0x9d079fff
[   55.672764] NDCB0: 0x000d3000
[   55.672764] NDCB1: 0xf7800000
[   55.672764] NDCB2: 0x00000001
[   55.672764] NDCB3: 0x00000000
[   55.691692] nand: nand_do_read_oob: from = 0x0fbe0000, len = 64
[   55.697725] marvell-nfc pxa3xx-nand: 
[   55.697725] NDCR:  0x9d079fff
[   55.697725] NDCB0: 0x000d3000
[   55.697725] NDCB1: 0xf7c00000
[   55.697725] NDCB2: 0x00000001
[   55.697725] NDCB3: 0x00000000
[   55.716656] nand: nand_do_read_oob: from = 0x0fc00000, len = 64
[   55.722862] marvell-nfc pxa3xx-nand: 
[   55.722862] NDCR:  0x9d079fff
[   55.722862] NDCB0: 0x000d3000
[   55.722862] NDCB1: 0xf8000000
[   55.722862] NDCB2: 0x00000001
[   55.722862] NDCB3: 0x00000000
[   55.741788] nand: nand_do_read_oob: from = 0x0fc20000, len = 64
[   55.747822] marvell-nfc pxa3xx-nand: 
[   55.747822] NDCR:  0x9d079fff
[   55.747822] NDCB0: 0x000d3000
[   55.747822] NDCB1: 0xf8400000
[   55.747822] NDCB2: 0x00000001
[   55.747822] NDCB3: 0x00000000
[   55.766756] nand: nand_do_read_oob: from = 0x0fc40000, len = 64
[   55.772959] marvell-nfc pxa3xx-nand: 
[   55.772959] NDCR:  0x9d079fff
[   55.772959] NDCB0: 0x000d3000
[   55.772959] NDCB1: 0xf8800000
[   55.772959] NDCB2: 0x00000001
[   55.772959] NDCB3: 0x00000000
[   55.791889] nand: nand_do_read_oob: from = 0x0fc60000, len = 64
[   55.797920] marvell-nfc pxa3xx-nand: 
[   55.797920] NDCR:  0x9d079fff
[   55.797920] NDCB0: 0x000d3000
[   55.797920] NDCB1: 0xf8c00000
[   55.797920] NDCB2: 0x00000001
[   55.797920] NDCB3: 0x00000000
[   55.816853] nand: nand_do_read_oob: from = 0x0fc80000, len = 64
[   55.823050] marvell-nfc pxa3xx-nand: 
[   55.823050] NDCR:  0x9d079fff
[   55.823050] NDCB0: 0x000d3000
[   55.823050] NDCB1: 0xf9000000
[   55.823050] NDCB2: 0x00000001
[   55.823050] NDCB3: 0x00000000
[   55.841979] nand: nand_do_read_oob: from = 0x0fca0000, len = 64
[   55.848011] marvell-nfc pxa3xx-nand: 
[   55.848011] NDCR:  0x9d079fff
[   55.848011] NDCB0: 0x000d3000
[   55.848011] NDCB1: 0xf9400000
[   55.848011] NDCB2: 0x00000001
[   55.848011] NDCB3: 0x00000000
[   55.866942] nand: nand_do_read_oob: from = 0x0fcc0000, len = 64
[   55.873149] marvell-nfc pxa3xx-nand: 
[   55.873149] NDCR:  0x9d079fff
[   55.873149] NDCB0: 0x000d3000
[   55.873149] NDCB1: 0xf9800000
[   55.873149] NDCB2: 0x00000001
[   55.873149] NDCB3: 0x00000000
[   55.892074] nand: nand_do_read_oob: from = 0x0fce0000, len = 64
[   55.898109] marvell-nfc pxa3xx-nand: 
[   55.898109] NDCR:  0x9d079fff
[   55.898109] NDCB0: 0x000d3000
[   55.898109] NDCB1: 0xf9c00000
[   55.898109] NDCB2: 0x00000001
[   55.898109] NDCB3: 0x00000000
[   55.917056] nand: nand_do_read_oob: from = 0x0fd00000, len = 64
[   55.923256] marvell-nfc pxa3xx-nand: 
[   55.923256] NDCR:  0x9d079fff
[   55.923256] NDCB0: 0x000d3000
[   55.923256] NDCB1: 0xfa000000
[   55.923256] NDCB2: 0x00000001
[   55.923256] NDCB3: 0x00000000
[   55.942182] nand: nand_do_read_oob: from = 0x0fd20000, len = 64
[   55.948215] marvell-nfc pxa3xx-nand: 
[   55.948215] NDCR:  0x9d079fff
[   55.948215] NDCB0: 0x000d3000
[   55.948215] NDCB1: 0xfa400000
[   55.948215] NDCB2: 0x00000001
[   55.948215] NDCB3: 0x00000000
[   55.967147] nand: nand_do_read_oob: from = 0x0fd40000, len = 64
[   55.973353] marvell-nfc pxa3xx-nand: 
[   55.973353] NDCR:  0x9d079fff
[   55.973353] NDCB0: 0x000d3000
[   55.973353] NDCB1: 0xfa800000
[   55.973353] NDCB2: 0x00000001
[   55.973353] NDCB3: 0x00000000
[   55.992284] nand: nand_do_read_oob: from = 0x0fd60000, len = 64
[   55.998314] marvell-nfc pxa3xx-nand: 
[   55.998314] NDCR:  0x9d079fff
[   55.998314] NDCB0: 0x000d3000
[   55.998314] NDCB1: 0xfac00000
[   55.998314] NDCB2: 0x00000001
[   55.998314] NDCB3: 0x00000000
[   56.017256] nand: nand_do_read_oob: from = 0x0fd80000, len = 64
[   56.023463] marvell-nfc pxa3xx-nand: 
[   56.023463] NDCR:  0x9d079fff
[   56.023463] NDCB0: 0x000d3000
[   56.023463] NDCB1: 0xfb000000
[   56.023463] NDCB2: 0x00000001
[   56.023463] NDCB3: 0x00000000
[   56.042390] nand: nand_do_read_oob: from = 0x0fda0000, len = 64
[   56.048422] marvell-nfc pxa3xx-nand: 
[   56.048422] NDCR:  0x9d079fff
[   56.048422] NDCB0: 0x000d3000
[   56.048422] NDCB1: 0xfb400000
[   56.048422] NDCB2: 0x00000001
[   56.048422] NDCB3: 0x00000000
[   56.067354] nand: nand_do_read_oob: from = 0x0fdc0000, len = 64
[   56.073560] marvell-nfc pxa3xx-nand: 
[   56.073560] NDCR:  0x9d079fff
[   56.073560] NDCB0: 0x000d3000
[   56.073560] NDCB1: 0xfb800000
[   56.073560] NDCB2: 0x00000001
[   56.073560] NDCB3: 0x00000000
[   56.092819] nand: nand_do_read_oob: from = 0x0fde0000, len = 64
[   56.099053] marvell-nfc pxa3xx-nand: 
[   56.099053] NDCR:  0x9d079fff
[   56.099053] NDCB0: 0x000d3000
[   56.099053] NDCB1: 0xfbc00000
[   56.099053] NDCB2: 0x00000001
[   56.099053] NDCB3: 0x00000000
[   56.117975] nand: nand_do_read_oob: from = 0x0fe00000, len = 64
[   56.124175] marvell-nfc pxa3xx-nand: 
[   56.124175] NDCR:  0x9d079fff
[   56.124175] NDCB0: 0x000d3000
[   56.124175] NDCB1: 0xfc000000
[   56.124175] NDCB2: 0x00000001
[   56.124175] NDCB3: 0x00000000
[   56.143109] nand: nand_do_read_oob: from = 0x0fe20000, len = 64
[   56.149315] marvell-nfc pxa3xx-nand: 
[   56.149315] NDCR:  0x9d079fff
[   56.149315] NDCB0: 0x000d3000
[   56.149315] NDCB1: 0xfc400000
[   56.149315] NDCB2: 0x00000001
[   56.149315] NDCB3: 0x00000000
[   56.168234] nand: nand_do_read_oob: from = 0x0fe40000, len = 64
[   56.174436] marvell-nfc pxa3xx-nand: 
[   56.174436] NDCR:  0x9d079fff
[   56.174436] NDCB0: 0x000d3000
[   56.174436] NDCB1: 0xfc800000
[   56.174436] NDCB2: 0x00000001
[   56.174436] NDCB3: 0x00000000
[   56.193367] nand: nand_do_read_oob: from = 0x0fe60000, len = 64
[   56.199570] marvell-nfc pxa3xx-nand: 
[   56.199570] NDCR:  0x9d079fff
[   56.199570] NDCB0: 0x000d3000
[   56.199570] NDCB1: 0xfcc00000
[   56.199570] NDCB2: 0x00000001
[   56.199570] NDCB3: 0x00000000
[   56.218489] nand: nand_do_read_oob: from = 0x0fe80000, len = 64
[   56.224691] marvell-nfc pxa3xx-nand: 
[   56.224691] NDCR:  0x9d079fff
[   56.224691] NDCB0: 0x000d3000
[   56.224691] NDCB1: 0xfd000000
[   56.224691] NDCB2: 0x00000001
[   56.224691] NDCB3: 0x00000000
[   56.243619] nand: nand_do_read_oob: from = 0x0fea0000, len = 64
[   56.249822] marvell-nfc pxa3xx-nand: 
[   56.249822] NDCR:  0x9d079fff
[   56.249822] NDCB0: 0x000d3000
[   56.249822] NDCB1: 0xfd400000
[   56.249822] NDCB2: 0x00000001
[   56.249822] NDCB3: 0x00000000
[   56.268942] nand: nand_do_read_oob: from = 0x0fec0000, len = 64
[   56.274987] marvell-nfc pxa3xx-nand: 
[   56.274987] NDCR:  0x9d079fff
[   56.274987] NDCB0: 0x000d3000
[   56.274987] NDCB1: 0xfd800000
[   56.274987] NDCB2: 0x00000001
[   56.274987] NDCB3: 0x00000000
[   56.293934] nand: nand_do_read_oob: from = 0x0fee0000, len = 64
[   56.300135] marvell-nfc pxa3xx-nand: 
[   56.300135] NDCR:  0x9d079fff
[   56.300135] NDCB0: 0x000d3000
[   56.300135] NDCB1: 0xfdc00000
[   56.300135] NDCB2: 0x00000001
[   56.300135] NDCB3: 0x00000000
[   56.319063] nand: nand_do_read_oob: from = 0x0ff00000, len = 64
[   56.325097] marvell-nfc pxa3xx-nand: 
[   56.325097] NDCR:  0x9d079fff
[   56.325097] NDCB0: 0x000d3000
[   56.325097] NDCB1: 0xfe000000
[   56.325097] NDCB2: 0x00000001
[   56.325097] NDCB3: 0x00000000
[   56.344030] nand: nand_do_read_oob: from = 0x0ff20000, len = 64
[   56.350235] marvell-nfc pxa3xx-nand: 
[   56.350235] NDCR:  0x9d079fff
[   56.350235] NDCB0: 0x000d3000
[   56.350235] NDCB1: 0xfe400000
[   56.350235] NDCB2: 0x00000001
[   56.350235] NDCB3: 0x00000000
[   56.369162] nand: nand_do_read_oob: from = 0x0ff40000, len = 64
[   56.375195] marvell-nfc pxa3xx-nand: 
[   56.375195] NDCR:  0x9d079fff
[   56.375195] NDCB0: 0x000d3000
[   56.375195] NDCB1: 0xfe800000
[   56.375195] NDCB2: 0x00000001
[   56.375195] NDCB3: 0x00000000
[   56.394124] nand: nand_do_read_oob: from = 0x0ff60000, len = 64
[   56.400324] marvell-nfc pxa3xx-nand: 
[   56.400324] NDCR:  0x9d079fff
[   56.400324] NDCB0: 0x000d3000
[   56.400324] NDCB1: 0xfec00000
[   56.400324] NDCB2: 0x00000001
[   56.400324] NDCB3: 0x00000000
[   56.419249] nand: nand_do_read_oob: from = 0x0ff80000, len = 64
[   56.425285] marvell-nfc pxa3xx-nand: 
[   56.425285] NDCR:  0x9d079fff
[   56.425285] NDCB0: 0x000d3000
[   56.425285] NDCB1: 0xff000000
[   56.425285] NDCB2: 0x00000001
[   56.425285] NDCB3: 0x00000000
[   56.444217] nand: nand_do_read_oob: from = 0x0ffa0000, len = 64
[   56.450425] marvell-nfc pxa3xx-nand: 
[   56.450425] NDCR:  0x9d079fff
[   56.450425] NDCB0: 0x000d3000
[   56.450425] NDCB1: 0xff400000
[   56.450425] NDCB2: 0x00000001
[   56.450425] NDCB3: 0x00000000
[   56.469354] nand: nand_do_read_oob: from = 0x0ffc0000, len = 64
[   56.475383] marvell-nfc pxa3xx-nand: 
[   56.475383] NDCR:  0x9d079fff
[   56.475383] NDCB0: 0x000d3000
[   56.475383] NDCB1: 0xff800000
[   56.475383] NDCB2: 0x00000001
[   56.475383] NDCB3: 0x00000000
[   56.494314] nand: nand_do_read_oob: from = 0x0ffe0000, len = 64
[   56.500545] marvell-nfc pxa3xx-nand: 
[   56.500545] NDCR:  0x9d079fff
[   56.500545] NDCB0: 0x000d3000
[   56.500545] NDCB1: 0xffc00000
[   56.500545] NDCB2: 0x00000001
[   56.500545] NDCB3: 0x00000000
[   56.519945] nand: nand_erase_nand: start = 0x00000ffe0000, len = 131072
[   56.526615] nand: executing subop:
[   56.530231] nand:     ->CMD      [0x70]
[   56.534117] nand:     ->DATA_IN  [1 B, force 8-bit]
[   56.539238] marvell-nfc pxa3xx-nand: 
[   56.539238] NDCR:  0x9d079fff
[   56.539238] NDCB0: 0x00800070
[   56.539238] NDCB1: 0x00000000
[   56.539238] NDCB2: 0x00000000
[   56.539238] NDCB3: 0x00000000
[   56.557893] nand: executing subop:
[   56.561501] nand:     ->CMD      [0x60]
[   56.565396] nand:     ->ADDR     [3 cyc: c0 ff 01]
[   56.570353] nand:     ->CMD      [0xd0]
[   56.574233] nand:     ->WAITRDY  [max 0 ms]
[   56.578516] marvell-nfc pxa3xx-nand: 
[   56.578516] NDCR:  0x9d079fff
[   56.578516] NDCB0: 0x004bd060
[   56.578516] NDCB1: 0x0001ffc0
[   56.578516] NDCB2: 0x00000000
[   56.578516] NDCB3: 0x00000000
[   56.599314] nand: executing subop:
[   56.602787] nand:     ->CMD      [0x70]
[   56.606656] nand:     ->DATA_IN  [1 B, force 8-bit]
[   56.611790] marvell-nfc pxa3xx-nand: 
[   56.611790] NDCR:  0x9d079fff
[   56.611790] NDCB0: 0x00800070
[   56.611790] NDCB1: 0x00000000
[   56.611790] NDCB2: 0x00000000
[   56.611790] NDCB3: 0x00000000
[   56.630473] nand: executing subop:
[   56.633929] nand:     ->CMD      [0x70]
[   56.637798] nand:     ->DATA_IN  [1 B, force 8-bit]
[   56.642930] marvell-nfc pxa3xx-nand: 
[   56.642930] NDCR:  0x9d079fff
[   56.642930] NDCB0: 0x00800070
[   56.642930] NDCB1: 0x00000000
[   56.642930] NDCB2: 0x00000000
[   56.642930] NDCB3: 0x00000000
[   56.661651] marvell-nfc pxa3xx-nand: 
[   56.661651] NDCR:  0xdd079fff
[   56.661651] NDCB0: 0x002d1080
[   56.661651] NDCB1: 0xffc00000
[   56.661651] NDCB2: 0x00000001
[   56.661651] NDCB3: 0x00000000
[   56.680799] Bad block table written to 0x00000ffe0000, version 0x01
[   56.687602] nand: nand_erase_nand: start = 0x00000ffc0000, len = 131072
[   56.694420] nand: executing subop:
[   56.697873] nand:     ->CMD      [0x70]
[   56.701890] nand:     ->DATA_IN  [1 B, force 8-bit]
[   56.706879] marvell-nfc pxa3xx-nand: 
[   56.706879] NDCR:  0x9d079fff
[   56.706879] NDCB0: 0x00800070
[   56.706879] NDCB1: 0x00000000
[   56.706879] NDCB2: 0x00000000
[   56.706879] NDCB3: 0x00000000
[   56.725523] nand: executing subop:
[   56.729130] nand:     ->CMD      [0x60]
[   56.733023] nand:     ->ADDR     [3 cyc: 80 ff 01]
[   56.737835] nand:     ->CMD      [0xd0]
[   56.741847] nand:     ->WAITRDY  [max 0 ms]
[   56.746151] marvell-nfc pxa3xx-nand: 
[   56.746151] NDCR:  0x9d079fff
[   56.746151] NDCB0: 0x004bd060
[   56.746151] NDCB1: 0x0001ff80
[   56.746151] NDCB2: 0x00000000
[   56.746151] NDCB3: 0x00000000
[   56.766897] nand: executing subop:
[   56.770541] nand:     ->CMD      [0x70]
[   56.774425] nand:     ->DATA_IN  [1 B, force 8-bit]
[   56.779539] marvell-nfc pxa3xx-nand: 
[   56.779539] NDCR:  0x9d079fff
[   56.779539] NDCB0: 0x00800070
[   56.779539] NDCB1: 0x00000000
[   56.779539] NDCB2: 0x00000000
[   56.779539] NDCB3: 0x00000000
[   56.798212] nand: executing subop:
[   56.801828] nand:     ->CMD      [0x70]
[   56.805715] nand:     ->DATA_IN  [1 B, force 8-bit]
[   56.810823] marvell-nfc pxa3xx-nand: 
[   56.810823] NDCR:  0x9d079fff
[   56.810823] NDCB0: 0x00800070
[   56.810823] NDCB1: 0x00000000
[   56.810823] NDCB2: 0x00000000
[   56.810823] NDCB3: 0x00000000
[   56.829547] marvell-nfc pxa3xx-nand: 
[   56.829547] NDCR:  0xdd079fff
[   56.829547] NDCB0: 0x002d1080
[   56.829547] NDCB1: 0xff800000
[   56.829547] NDCB2: 0x00000001
[   56.829547] NDCB3: 0x00000000
[   56.848813] Bad block table written to 0x00000ffc0000, version 0x01
[   56.855656] 6 cmdlinepart partitions found on MTD device pxa3xx_nand-0
[   56.862511] Creating 6 MTD partitions on "pxa3xx_nand-0":
[   56.867999] 0x000000000000-0x000000020000 : "TIMH"
[   56.876504] 0x000000020000-0x000000040000 : "OBMI"
[   56.885961] 0x000000040000-0x000000100000 : "barebox"
[   56.895779] 0x000000100000-0x000000140000 : "barebox-env"
[   56.905831] 0x000000140000-0x000000d40000 : "kernel"
[   56.916328] 0x000000d40000-0x000003260000 : "root"
[   56.930475] smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre <nico@fluxnic.net>
[   56.983081] smc91x smc91x.0 eth0: SMC91C11xFD (rev 2) at c4867300 IRQ 214
[   56.991231]  DMA c386d710 [nowait]
[   56.994784] smc91x smc91x.0 eth0: Ethernet addr: 00:0e:0c:a7:26:f7
[   57.007426] input: pxa27x-keypad as /devices/platform/pxa27x-keypad/input/input0
[   57.017305] pxa-rtc pxa-rtc: failed to find rtc clock source
[   57.024908] rtc rtc0: invalid alarm value: 0-1-1 0:0:0
[   57.032187] pxa-rtc pxa-rtc: rtc core: registered pxa-rtc as rtc0
[   57.042867] sa1100_wdt: SA1100/PXA2xx Watchdog Timer: timer margin 60 sec
[   57.094773] soc-audio soc-audio: ASoC: machine Zylonite should use snd_soc_register_card()
[   57.118303] wm9713-codec wm9713-codec: Control not supported for path Mic B Source -> [MPB] -> Mic B Pre Amp
[   57.130404] wm9713-codec wm9713-codec: ASoC: no dapm match for Mic B Source --> MPB --> Mic B Pre Amp
[   57.140110] wm9713-codec wm9713-codec: ASoC: Failed to add route Mic B Source -> MPB -> Mic B Pre Amp
[   57.152938] soc-audio soc-audio: wm9713-hifi <-> pxa2xx-ac97 mapping ok
[   57.162041] soc-audio soc-audio: wm9713-aux <-> pxa2xx-ac97-aux mapping ok
[   57.172444] soc-audio soc-audio: wm9713-voice <-> pxa-ssp-dai.2 mapping ok
[   57.181332] wm9713-codec wm9713-codec: ASoC: mux Sidetone Mux has no paths
[   57.220634] NET: Registered protocol family 17
[   57.225651] Key type dns_resolver registered
[   57.231634] XScale iWMMXt coprocessor detected.
[   57.243915] Loading compiled-in X.509 certificates
[   57.265044] ubi0: attaching mtd5
[   57.270836] marvell-nfc pxa3xx-nand: 
[   57.270836] NDCR:  0xdd079fff
[   57.270836] NDCB0: 0x000d3000
[   57.270836] NDCB1: 0x23400000
[   57.270836] NDCB2: 0x00000000
[   57.270836] NDCB3: 0x00000000
[   57.290323] marvell-nfc pxa3xx-nand: 
[   57.290323] NDCR:  0xdd079fff
[   57.290323] NDCB0: 0x000d3000
[   57.290323] NDCB1: 0x23410000
[   57.290323] NDCB2: 0x00000000
[   57.290323] NDCB3: 0x00000000
[   57.309578] marvell-nfc pxa3xx-nand: 
[   57.309578] NDCR:  0x9d079fff
[   57.309578] NDCB0: 0x000d3000
[   57.309578] NDCB1: 0x23410000
[   57.309578] NDCB2: 0x00000000
[   57.309578] NDCB3: 0x00000000
[   57.329455] marvell-nfc pxa3xx-nand: 
[   57.329455] NDCR:  0xdd079fff
[   57.329455] NDCB0: 0x000d3000
[   57.329455] NDCB1: 0x23800000
[   57.329455] NDCB2: 0x00000000
[   57.329455] NDCB3: 0x00000000
[   57.349043] marvell-nfc pxa3xx-nand: 
[   57.349043] NDCR:  0xdd079fff
[   57.349043] NDCB0: 0x000d3000
[   57.349043] NDCB1: 0x23810000
[   57.349043] NDCB2: 0x00000000
[   57.349043] NDCB3: 0x00000000
[   57.368067] marvell-nfc pxa3xx-nand: 
[   57.368067] NDCR:  0x9d079fff
[   57.368067] NDCB0: 0x000d3000
[   57.368067] NDCB1: 0x23810000
[   57.368067] NDCB2: 0x00000000
[   57.368067] NDCB3: 0x00000000
[   57.387203] marvell-nfc pxa3xx-nand: 
[   57.387203] NDCR:  0xdd079fff
[   57.387203] NDCB0: 0x000d3000
[   57.387203] NDCB1: 0x23c00000
[   57.387203] NDCB2: 0x00000000
[   57.387203] NDCB3: 0x00000000
[   57.406286] marvell-nfc pxa3xx-nand: 
[   57.406286] NDCR:  0xdd079fff
[   57.406286] NDCB0: 0x000d3000
[   57.406286] NDCB1: 0x23c10000
[   57.406286] NDCB2: 0x00000000
[   57.406286] NDCB3: 0x00000000
[   57.425279] marvell-nfc pxa3xx-nand: 
[   57.425279] NDCR:  0x9d079fff
[   57.425279] NDCB0: 0x000d3000
[   57.425279] NDCB1: 0x23c10000
[   57.425279] NDCB2: 0x00000000
[   57.425279] NDCB3: 0x00000000
[   57.444404] marvell-nfc pxa3xx-nand: 
[   57.444404] NDCR:  0xdd079fff
[   57.444404] NDCB0: 0x000d3000
[   57.444404] NDCB1: 0x24000000
[   57.444404] NDCB2: 0x00000000
[   57.444404] NDCB3: 0x00000000
[   57.463507] marvell-nfc pxa3xx-nand: 
[   57.463507] NDCR:  0xdd079fff
[   57.463507] NDCB0: 0x000d3000
[   57.463507] NDCB1: 0x24010000
[   57.463507] NDCB2: 0x00000000
[   57.463507] NDCB3: 0x00000000
[   57.482501] marvell-nfc pxa3xx-nand: 
[   57.482501] NDCR:  0x9d079fff
[   57.482501] NDCB0: 0x000d3000
[   57.482501] NDCB1: 0x24010000
[   57.482501] NDCB2: 0x00000000
[   57.482501] NDCB3: 0x00000000
[   57.501614] marvell-nfc pxa3xx-nand: 
[   57.501614] NDCR:  0xdd079fff
[   57.501614] NDCB0: 0x000d3000
[   57.501614] NDCB1: 0x24400000
[   57.501614] NDCB2: 0x00000000
[   57.501614] NDCB3: 0x00000000
[   57.520697] marvell-nfc pxa3xx-nand: 
[   57.520697] NDCR:  0xdd079fff
[   57.520697] NDCB0: 0x000d3000
[   57.520697] NDCB1: 0x24410000
[   57.520697] NDCB2: 0x00000000
[   57.520697] NDCB3: 0x00000000
[   57.539691] marvell-nfc pxa3xx-nand: 
[   57.539691] NDCR:  0x9d079fff
[   57.539691] NDCB0: 0x000d3000
[   57.539691] NDCB1: 0x24410000
[   57.539691] NDCB2: 0x00000000
[   57.539691] NDCB3: 0x00000000
[   57.558900] marvell-nfc pxa3xx-nand: 
[   57.558900] NDCR:  0xdd079fff
[   57.558900] NDCB0: 0x000d3000
[   57.558900] NDCB1: 0x24800000
[   57.558900] NDCB2: 0x00000000
[   57.558900] NDCB3: 0x00000000
[   57.577950] marvell-nfc pxa3xx-nand: 
[   57.577950] NDCR:  0xdd079fff
[   57.577950] NDCB0: 0x000d3000
[   57.577950] NDCB1: 0x24810000
[   57.577950] NDCB2: 0x00000000
[   57.577950] NDCB3: 0x00000000
[   57.596947] marvell-nfc pxa3xx-nand: 
[   57.596947] NDCR:  0x9d079fff
[   57.596947] NDCB0: 0x000d3000
[   57.596947] NDCB1: 0x24810000
[   57.596947] NDCB2: 0x00000000
[   57.596947] NDCB3: 0x00000000
[   57.616060] marvell-nfc pxa3xx-nand: 
[   57.616060] NDCR:  0xdd079fff
[   57.616060] NDCB0: 0x000d3000
[   57.616060] NDCB1: 0x24c00000
[   57.616060] NDCB2: 0x00000000
[   57.616060] NDCB3: 0x00000000
[   57.635131] marvell-nfc pxa3xx-nand: 
[   57.635131] NDCR:  0xdd079fff
[   57.635131] NDCB0: 0x000d3000
[   57.635131] NDCB1: 0x24c10000
[   57.635131] NDCB2: 0x00000000
[   57.635131] NDCB3: 0x00000000
[   57.654125] marvell-nfc pxa3xx-nand: 
[   57.654125] NDCR:  0x9d079fff
[   57.654125] NDCB0: 0x000d3000
[   57.654125] NDCB1: 0x24c10000
[   57.654125] NDCB2: 0x00000000
[   57.654125] NDCB3: 0x00000000
[   57.673242] marvell-nfc pxa3xx-nand: 
[   57.673242] NDCR:  0xdd079fff
[   57.673242] NDCB0: 0x000d3000
[   57.673242] NDCB1: 0x25000000
[   57.673242] NDCB2: 0x00000000
[   57.673242] NDCB3: 0x00000000
[   57.692323] marvell-nfc pxa3xx-nand: 
[   57.692323] NDCR:  0xdd079fff
[   57.692323] NDCB0: 0x000d3000
[   57.692323] NDCB1: 0x25010000
[   57.692323] NDCB2: 0x00000000
[   57.692323] NDCB3: 0x00000000
[   57.711315] marvell-nfc pxa3xx-nand: 
[   57.711315] NDCR:  0x9d079fff
[   57.711315] NDCB0: 0x000d3000
[   57.711315] NDCB1: 0x25010000
[   57.711315] NDCB2: 0x00000000
[   57.711315] NDCB3: 0x00000000
[   57.730429] marvell-nfc pxa3xx-nand: 
[   57.730429] NDCR:  0xdd079fff
[   57.730429] NDCB0: 0x000d3000
[   57.730429] NDCB1: 0x25400000
[   57.730429] NDCB2: 0x00000000
[   57.730429] NDCB3: 0x00000000
[   57.749501] marvell-nfc pxa3xx-nand: 
[   57.749501] NDCR:  0xdd079fff
[   57.749501] NDCB0: 0x000d3000
[   57.749501] NDCB1: 0x25410000
[   57.749501] NDCB2: 0x00000000
[   57.749501] NDCB3: 0x00000000
[   57.768488] marvell-nfc pxa3xx-nand: 
[   57.768488] NDCR:  0x9d079fff
[   57.768488] NDCB0: 0x000d3000
[   57.768488] NDCB1: 0x25410000
[   57.768488] NDCB2: 0x00000000
[   57.768488] NDCB3: 0x00000000
[   57.787603] marvell-nfc pxa3xx-nand: 
[   57.787603] NDCR:  0xdd079fff
[   57.787603] NDCB0: 0x000d3000
[   57.787603] NDCB1: 0x25800000
[   57.787603] NDCB2: 0x00000000
[   57.787603] NDCB3: 0x00000000
[   57.806684] marvell-nfc pxa3xx-nand: 
[   57.806684] NDCR:  0xdd079fff
[   57.806684] NDCB0: 0x000d3000
[   57.806684] NDCB1: 0x25810000
[   57.806684] NDCB2: 0x00000000
[   57.806684] NDCB3: 0x00000000
[   57.825678] marvell-nfc pxa3xx-nand: 
[   57.825678] NDCR:  0x9d079fff
[   57.825678] NDCB0: 0x000d3000
[   57.825678] NDCB1: 0x25810000
[   57.825678] NDCB2: 0x00000000
[   57.825678] NDCB3: 0x00000000
[   57.844790] marvell-nfc pxa3xx-nand: 
[   57.844790] NDCR:  0xdd079fff
[   57.844790] NDCB0: 0x000d3000
[   57.844790] NDCB1: 0x25c00000
[   57.844790] NDCB2: 0x00000000
[   57.844790] NDCB3: 0x00000000
[   57.863867] marvell-nfc pxa3xx-nand: 
[   57.863867] NDCR:  0xdd079fff
[   57.863867] NDCB0: 0x000d3000
[   57.863867] NDCB1: 0x25c10000
[   57.863867] NDCB2: 0x00000000
[   57.863867] NDCB3: 0x00000000
[   57.882866] marvell-nfc pxa3xx-nand: 
[   57.882866] NDCR:  0x9d079fff
[   57.882866] NDCB0: 0x000d3000
[   57.882866] NDCB1: 0x25c10000
[   57.882866] NDCB2: 0x00000000
[   57.882866] NDCB3: 0x00000000
[   57.901978] marvell-nfc pxa3xx-nand: 
[   57.901978] NDCR:  0xdd079fff
[   57.901978] NDCB0: 0x000d3000
[   57.901978] NDCB1: 0x26000000
[   57.901978] NDCB2: 0x00000000
[   57.901978] NDCB3: 0x00000000
[   57.921054] marvell-nfc pxa3xx-nand: 
[   57.921054] NDCR:  0xdd079fff
[   57.921054] NDCB0: 0x000d3000
[   57.921054] NDCB1: 0x26010000
[   57.921054] NDCB2: 0x00000000
[   57.921054] NDCB3: 0x00000000
[   57.940048] marvell-nfc pxa3xx-nand: 
[   57.940048] NDCR:  0x9d079fff
[   57.940048] NDCB0: 0x000d3000
[   57.940048] NDCB1: 0x26010000
[   57.940048] NDCB2: 0x00000000
[   57.940048] NDCB3: 0x00000000
[   57.959212] marvell-nfc pxa3xx-nand: 
[   57.959212] NDCR:  0xdd079fff
[   57.959212] NDCB0: 0x000d3000
[   57.959212] NDCB1: 0x26400000
[   57.959212] NDCB2: 0x00000000
[   57.959212] NDCB3: 0x00000000
[   57.978278] marvell-nfc pxa3xx-nand: 
[   57.978278] NDCR:  0xdd079fff
[   57.978278] NDCB0: 0x000d3000
[   57.978278] NDCB1: 0x26410000
[   57.978278] NDCB2: 0x00000000
[   57.978278] NDCB3: 0x00000000
[   57.997273] marvell-nfc pxa3xx-nand: 
[   57.997273] NDCR:  0x9d079fff
[   57.997273] NDCB0: 0x000d3000
[   57.997273] NDCB1: 0x26410000
[   57.997273] NDCB2: 0x00000000
[   57.997273] NDCB3: 0x00000000
[   58.016401] marvell-nfc pxa3xx-nand: 
[   58.016401] NDCR:  0xdd079fff
[   58.016401] NDCB0: 0x000d3000
[   58.016401] NDCB1: 0x26800000
[   58.016401] NDCB2: 0x00000000
[   58.016401] NDCB3: 0x00000000
[   58.035486] marvell-nfc pxa3xx-nand: 
[   58.035486] NDCR:  0xdd079fff
[   58.035486] NDCB0: 0x000d3000
[   58.035486] NDCB1: 0x26810000
[   58.035486] NDCB2: 0x00000000
[   58.035486] NDCB3: 0x00000000
[   58.054485] marvell-nfc pxa3xx-nand: 
[   58.054485] NDCR:  0x9d079fff
[   58.054485] NDCB0: 0x000d3000
[   58.054485] NDCB1: 0x26810000
[   58.054485] NDCB2: 0x00000000
[   58.054485] NDCB3: 0x00000000
[   58.073619] marvell-nfc pxa3xx-nand: 
[   58.073619] NDCR:  0xdd079fff
[   58.073619] NDCB0: 0x000d3000
[   58.073619] NDCB1: 0x26c00000
[   58.073619] NDCB2: 0x00000000
[   58.073619] NDCB3: 0x00000000
[   58.093171] marvell-nfc pxa3xx-nand: 
[   58.093171] NDCR:  0xdd079fff
[   58.093171] NDCB0: 0x000d3000
[   58.093171] NDCB1: 0x26c10000
[   58.093171] NDCB2: 0x00000000
[   58.093171] NDCB3: 0x00000000
[   58.112203] marvell-nfc pxa3xx-nand: 
[   58.112203] NDCR:  0x9d079fff
[   58.112203] NDCB0: 0x000d3000
[   58.112203] NDCB1: 0x26c10000
[   58.112203] NDCB2: 0x00000000
[   58.112203] NDCB3: 0x00000000
[   58.131344] marvell-nfc pxa3xx-nand: 
[   58.131344] NDCR:  0xdd079fff
[   58.131344] NDCB0: 0x000d3000
[   58.131344] NDCB1: 0x27000000
[   58.131344] NDCB2: 0x00000000
[   58.131344] NDCB3: 0x00000000
[   58.150423] marvell-nfc pxa3xx-nand: 
[   58.150423] NDCR:  0xdd079fff
[   58.150423] NDCB0: 0x000d3000
[   58.150423] NDCB1: 0x27010000
[   58.150423] NDCB2: 0x00000000
[   58.150423] NDCB3: 0x00000000
[   58.169420] marvell-nfc pxa3xx-nand: 
[   58.169420] NDCR:  0x9d079fff
[   58.169420] NDCB0: 0x000d3000
[   58.169420] NDCB1: 0x27010000
[   58.169420] NDCB2: 0x00000000
[   58.169420] NDCB3: 0x00000000
[   58.188528] marvell-nfc pxa3xx-nand: 
[   58.188528] NDCR:  0xdd079fff
[   58.188528] NDCB0: 0x000d3000
[   58.188528] NDCB1: 0x27400000
[   58.188528] NDCB2: 0x00000000
[   58.188528] NDCB3: 0x00000000
[   58.207610] marvell-nfc pxa3xx-nand: 
[   58.207610] NDCR:  0xdd079fff
[   58.207610] NDCB0: 0x000d3000
[   58.207610] NDCB1: 0x27410000
[   58.207610] NDCB2: 0x00000000
[   58.207610] NDCB3: 0x00000000
[   58.226605] marvell-nfc pxa3xx-nand: 
[   58.226605] NDCR:  0x9d079fff
[   58.226605] NDCB0: 0x000d3000
[   58.226605] NDCB1: 0x27410000
[   58.226605] NDCB2: 0x00000000
[   58.226605] NDCB3: 0x00000000
[   58.245752] marvell-nfc pxa3xx-nand: 
[   58.245752] NDCR:  0xdd079fff
[   58.245752] NDCB0: 0x000d3000
[   58.245752] NDCB1: 0x27800000
[   58.245752] NDCB2: 0x00000000
[   58.245752] NDCB3: 0x00000000
[   58.264840] marvell-nfc pxa3xx-nand: 
[   58.264840] NDCR:  0xdd079fff
[   58.264840] NDCB0: 0x000d3000
[   58.264840] NDCB1: 0x27810000
[   58.264840] NDCB2: 0x00000000
[   58.264840] NDCB3: 0x00000000
[   58.283945] marvell-nfc pxa3xx-nand: 
[   58.283945] NDCR:  0xdd079fff
[   58.283945] NDCB0: 0x000d3000
[   58.283945] NDCB1: 0x27c00000
[   58.283945] NDCB2: 0x00000000
[   58.283945] NDCB3: 0x00000000
[   58.303028] marvell-nfc pxa3xx-nand: 
[   58.303028] NDCR:  0xdd079fff
[   58.303028] NDCB0: 0x000d3000
[   58.303028] NDCB1: 0x27c10000
[   58.303028] NDCB2: 0x00000000
[   58.303028] NDCB3: 0x00000000
[   58.322017] marvell-nfc pxa3xx-nand: 
[   58.322017] NDCR:  0x9d079fff
[   58.322017] NDCB0: 0x000d3000
[   58.322017] NDCB1: 0x27c10000
[   58.322017] NDCB2: 0x00000000
[   58.322017] NDCB3: 0x00000000
[   58.341136] marvell-nfc pxa3xx-nand: 
[   58.341136] NDCR:  0xdd079fff
[   58.341136] NDCB0: 0x000d3000
[   58.341136] NDCB1: 0x28000000
[   58.341136] NDCB2: 0x00000000
[   58.341136] NDCB3: 0x00000000
[   58.360217] marvell-nfc pxa3xx-nand: 
[   58.360217] NDCR:  0xdd079fff
[   58.360217] NDCB0: 0x000d3000
[   58.360217] NDCB1: 0x28010000
[   58.360217] NDCB2: 0x00000000
[   58.360217] NDCB3: 0x00000000
[   58.379214] marvell-nfc pxa3xx-nand: 
[   58.379214] NDCR:  0x9d079fff
[   58.379214] NDCB0: 0x000d3000
[   58.379214] NDCB1: 0x28010000
[   58.379214] NDCB2: 0x00000000
[   58.379214] NDCB3: 0x00000000
[   58.398323] marvell-nfc pxa3xx-nand: 
[   58.398323] NDCR:  0xdd079fff
[   58.398323] NDCB0: 0x000d3000
[   58.398323] NDCB1: 0x28400000
[   58.398323] NDCB2: 0x00000000
[   58.398323] NDCB3: 0x00000000
[   58.417403] marvell-nfc pxa3xx-nand: 
[   58.417403] NDCR:  0xdd079fff
[   58.417403] NDCB0: 0x000d3000
[   58.417403] NDCB1: 0x28410000
[   58.417403] NDCB2: 0x00000000
[   58.417403] NDCB3: 0x00000000
[   58.436500] marvell-nfc pxa3xx-nand: 
[   58.436500] NDCR:  0xdd079fff
[   58.436500] NDCB0: 0x000d3000
[   58.436500] NDCB1: 0x28800000
[   58.436500] NDCB2: 0x00000000
[   58.436500] NDCB3: 0x00000000
[   58.455580] marvell-nfc pxa3xx-nand: 
[   58.455580] NDCR:  0xdd079fff
[   58.455580] NDCB0: 0x000d3000
[   58.455580] NDCB1: 0x28810000
[   58.455580] NDCB2: 0x00000000
[   58.455580] NDCB3: 0x00000000
[   58.474568] marvell-nfc pxa3xx-nand: 
[   58.474568] NDCR:  0x9d079fff
[   58.474568] NDCB0: 0x000d3000
[   58.474568] NDCB1: 0x28810000
[   58.474568] NDCB2: 0x00000000
[   58.474568] NDCB3: 0x00000000
[   58.493687] marvell-nfc pxa3xx-nand: 
[   58.493687] NDCR:  0xdd079fff
[   58.493687] NDCB0: 0x000d3000
[   58.493687] NDCB1: 0x28c00000
[   58.493687] NDCB2: 0x00000000
[   58.493687] NDCB3: 0x00000000
[   58.512769] marvell-nfc pxa3xx-nand: 
[   58.512769] NDCR:  0xdd079fff
[   58.512769] NDCB0: 0x000d3000
[   58.512769] NDCB1: 0x28c10000
[   58.512769] NDCB2: 0x00000000
[   58.512769] NDCB3: 0x00000000
[   58.531757] marvell-nfc pxa3xx-nand: 
[   58.531757] NDCR:  0x9d079fff
[   58.531757] NDCB0: 0x000d3000
[   58.531757] NDCB1: 0x28c10000
[   58.531757] NDCB2: 0x00000000
[   58.531757] NDCB3: 0x00000000
[   58.550873] marvell-nfc pxa3xx-nand: 
[   58.550873] NDCR:  0xdd079fff
[   58.550873] NDCB0: 0x000d3000
[   58.550873] NDCB1: 0x29000000
[   58.550873] NDCB2: 0x00000000
[   58.550873] NDCB3: 0x00000000
[   58.569948] marvell-nfc pxa3xx-nand: 
[   58.569948] NDCR:  0xdd079fff
[   58.569948] NDCB0: 0x000d3000
[   58.569948] NDCB1: 0x29010000
[   58.569948] NDCB2: 0x00000000
[   58.569948] NDCB3: 0x00000000
[   58.588930] marvell-nfc pxa3xx-nand: 
[   58.588930] NDCR:  0x9d079fff
[   58.588930] NDCB0: 0x000d3000
[   58.588930] NDCB1: 0x29010000
[   58.588930] NDCB2: 0x00000000
[   58.588930] NDCB3: 0x00000000
[   58.608033] marvell-nfc pxa3xx-nand: 
[   58.608033] NDCR:  0xdd079fff
[   58.608033] NDCB0: 0x000d3000
[   58.608033] NDCB1: 0x29400000
[   58.608033] NDCB2: 0x00000000
[   58.608033] NDCB3: 0x00000000
[   58.627106] marvell-nfc pxa3xx-nand: 
[   58.627106] NDCR:  0xdd079fff
[   58.627106] NDCB0: 0x000d3000
[   58.627106] NDCB1: 0x29410000
[   58.627106] NDCB2: 0x00000000
[   58.627106] NDCB3: 0x00000000
[   58.646099] marvell-nfc pxa3xx-nand: 
[   58.646099] NDCR:  0x9d079fff
[   58.646099] NDCB0: 0x000d3000
[   58.646099] NDCB1: 0x29410000
[   58.646099] NDCB2: 0x00000000
[   58.646099] NDCB3: 0x00000000
[   58.665244] marvell-nfc pxa3xx-nand: 
[   58.665244] NDCR:  0xdd079fff
[   58.665244] NDCB0: 0x000d3000
[   58.665244] NDCB1: 0x29800000
[   58.665244] NDCB2: 0x00000000
[   58.665244] NDCB3: 0x00000000
[   58.684328] marvell-nfc pxa3xx-nand: 
[   58.684328] NDCR:  0xdd079fff
[   58.684328] NDCB0: 0x000d3000
[   58.684328] NDCB1: 0x29810000
[   58.684328] NDCB2: 0x00000000
[   58.684328] NDCB3: 0x00000000
[   58.703327] marvell-nfc pxa3xx-nand: 
[   58.703327] NDCR:  0x9d079fff
[   58.703327] NDCB0: 0x000d3000
[   58.703327] NDCB1: 0x29810000
[   58.703327] NDCB2: 0x00000000
[   58.703327] NDCB3: 0x00000000
[   58.722442] marvell-nfc pxa3xx-nand: 
[   58.722442] NDCR:  0xdd079fff
[   58.722442] NDCB0: 0x000d3000
[   58.722442] NDCB1: 0x29c00000
[   58.722442] NDCB2: 0x00000000
[   58.722442] NDCB3: 0x00000000
[   58.741519] marvell-nfc pxa3xx-nand: 
[   58.741519] NDCR:  0xdd079fff
[   58.741519] NDCB0: 0x000d3000
[   58.741519] NDCB1: 0x29c10000
[   58.741519] NDCB2: 0x00000000
[   58.741519] NDCB3: 0x00000000
[   58.760513] marvell-nfc pxa3xx-nand: 
[   58.760513] NDCR:  0x9d079fff
[   58.760513] NDCB0: 0x000d3000
[   58.760513] NDCB1: 0x29c10000
[   58.760513] NDCB2: 0x00000000
[   58.760513] NDCB3: 0x00000000
[   58.779627] marvell-nfc pxa3xx-nand: 
[   58.779627] NDCR:  0xdd079fff
[   58.779627] NDCB0: 0x000d3000
[   58.779627] NDCB1: 0x2a000000
[   58.779627] NDCB2: 0x00000000
[   58.779627] NDCB3: 0x00000000
[   58.798812] marvell-nfc pxa3xx-nand: 
[   58.798812] NDCR:  0xdd079fff
[   58.798812] NDCB0: 0x000d3000
[   58.798812] NDCB1: 0x2a010000
[   58.798812] NDCB2: 0x00000000
[   58.798812] NDCB3: 0x00000000
[   58.817756] marvell-nfc pxa3xx-nand: 
[   58.817756] NDCR:  0x9d079fff
[   58.817756] NDCB0: 0x000d3000
[   58.817756] NDCB1: 0x2a010000
[   58.817756] NDCB2: 0x00000000
[   58.817756] NDCB3: 0x00000000
[   58.836867] marvell-nfc pxa3xx-nand: 
[   58.836867] NDCR:  0xdd079fff
[   58.836867] NDCB0: 0x000d3000
[   58.836867] NDCB1: 0x2a400000
[   58.836867] NDCB2: 0x00000000
[   58.836867] NDCB3: 0x00000000
[   58.855944] marvell-nfc pxa3xx-nand: 
[   58.855944] NDCR:  0xdd079fff
[   58.855944] NDCB0: 0x000d3000
[   58.855944] NDCB1: 0x2a410000
[   58.855944] NDCB2: 0x00000000
[   58.855944] NDCB3: 0x00000000
[   58.874934] marvell-nfc pxa3xx-nand: 
[   58.874934] NDCR:  0x9d079fff
[   58.874934] NDCB0: 0x000d3000
[   58.874934] NDCB1: 0x2a410000
[   58.874934] NDCB2: 0x00000000
[   58.874934] NDCB3: 0x00000000
[   58.894051] marvell-nfc pxa3xx-nand: 
[   58.894051] NDCR:  0xdd079fff
[   58.894051] NDCB0: 0x000d3000
[   58.894051] NDCB1: 0x2a800000
[   58.894051] NDCB2: 0x00000000
[   58.894051] NDCB3: 0x00000000
[   58.913132] marvell-nfc pxa3xx-nand: 
[   58.913132] NDCR:  0xdd079fff
[   58.913132] NDCB0: 0x000d3000
[   58.913132] NDCB1: 0x2a810000
[   58.913132] NDCB2: 0x00000000
[   58.913132] NDCB3: 0x00000000
[   58.932127] marvell-nfc pxa3xx-nand: 
[   58.932127] NDCR:  0x9d079fff
[   58.932127] NDCB0: 0x000d3000
[   58.932127] NDCB1: 0x2a810000
[   58.932127] NDCB2: 0x00000000
[   58.932127] NDCB3: 0x00000000
[   58.951248] marvell-nfc pxa3xx-nand: 
[   58.951248] NDCR:  0xdd079fff
[   58.951248] NDCB0: 0x000d3000
[   58.951248] NDCB1: 0x2ac00000
[   58.951248] NDCB2: 0x00000000
[   58.951248] NDCB3: 0x00000000
[   58.970320] marvell-nfc pxa3xx-nand: 
[   58.970320] NDCR:  0xdd079fff
[   58.970320] NDCB0: 0x000d3000
[   58.970320] NDCB1: 0x2ac10000
[   58.970320] NDCB2: 0x00000000
[   58.970320] NDCB3: 0x00000000
[   58.989315] marvell-nfc pxa3xx-nand: 
[   58.989315] NDCR:  0x9d079fff
[   58.989315] NDCB0: 0x000d3000
[   58.989315] NDCB1: 0x2ac10000
[   58.989315] NDCB2: 0x00000000
[   58.989315] NDCB3: 0x00000000
[   59.008432] marvell-nfc pxa3xx-nand: 
[   59.008432] NDCR:  0xdd079fff
[   59.008432] NDCB0: 0x000d3000
[   59.008432] NDCB1: 0x2b000000
[   59.008432] NDCB2: 0x00000000
[   59.008432] NDCB3: 0x00000000
[   59.027523] marvell-nfc pxa3xx-nand: 
[   59.027523] NDCR:  0xdd079fff
[   59.027523] NDCB0: 0x000d3000
[   59.027523] NDCB1: 0x2b010000
[   59.027523] NDCB2: 0x00000000
[   59.027523] NDCB3: 0x00000000
[   59.046521] marvell-nfc pxa3xx-nand: 
[   59.046521] NDCR:  0x9d079fff
[   59.046521] NDCB0: 0x000d3000
[   59.046521] NDCB1: 0x2b010000
[   59.046521] NDCB2: 0x00000000
[   59.046521] NDCB3: 0x00000000
[   59.065645] marvell-nfc pxa3xx-nand: 
[   59.065645] NDCR:  0xdd079fff
[   59.065645] NDCB0: 0x000d3000
[   59.065645] NDCB1: 0x2b400000
[   59.065645] NDCB2: 0x00000000
[   59.065645] NDCB3: 0x00000000
[   59.084725] marvell-nfc pxa3xx-nand: 
[   59.084725] NDCR:  0xdd079fff
[   59.084725] NDCB0: 0x000d3000
[   59.084725] NDCB1: 0x2b410000
[   59.084725] NDCB2: 0x00000000
[   59.084725] NDCB3: 0x00000000
[   59.103721] marvell-nfc pxa3xx-nand: 
[   59.103721] NDCR:  0x9d079fff
[   59.103721] NDCB0: 0x000d3000
[   59.103721] NDCB1: 0x2b410000
[   59.103721] NDCB2: 0x00000000
[   59.103721] NDCB3: 0x00000000
[   59.122840] marvell-nfc pxa3xx-nand: 
[   59.122840] NDCR:  0xdd079fff
[   59.122840] NDCB0: 0x000d3000
[   59.122840] NDCB1: 0x2b800000
[   59.122840] NDCB2: 0x00000000
[   59.122840] NDCB3: 0x00000000
[   59.141911] marvell-nfc pxa3xx-nand: 
[   59.141911] NDCR:  0xdd079fff
[   59.141911] NDCB0: 0x000d3000
[   59.141911] NDCB1: 0x2b810000
[   59.141911] NDCB2: 0x00000000
[   59.141911] NDCB3: 0x00000000
[   59.160907] marvell-nfc pxa3xx-nand: 
[   59.160907] NDCR:  0x9d079fff
[   59.160907] NDCB0: 0x000d3000
[   59.160907] NDCB1: 0x2b810000
[   59.160907] NDCB2: 0x00000000
[   59.160907] NDCB3: 0x00000000
[   59.180016] marvell-nfc pxa3xx-nand: 
[   59.180016] NDCR:  0xdd079fff
[   59.180016] NDCB0: 0x000d3000
[   59.180016] NDCB1: 0x2bc00000
[   59.180016] NDCB2: 0x00000000
[   59.180016] NDCB3: 0x00000000
[   59.199131] marvell-nfc pxa3xx-nand: 
[   59.199131] NDCR:  0xdd079fff
[   59.199131] NDCB0: 0x000d3000
[   59.199131] NDCB1: 0x2bc10000
[   59.199131] NDCB2: 0x00000000
[   59.199131] NDCB3: 0x00000000
[   59.218120] marvell-nfc pxa3xx-nand: 
[   59.218120] NDCR:  0x9d079fff
[   59.218120] NDCB0: 0x000d3000
[   59.218120] NDCB1: 0x2bc10000
[   59.218120] NDCB2: 0x00000000
[   59.218120] NDCB3: 0x00000000
[   59.237235] marvell-nfc pxa3xx-nand: 
[   59.237235] NDCR:  0xdd079fff
[   59.237235] NDCB0: 0x000d3000
[   59.237235] NDCB1: 0x2c000000
[   59.237235] NDCB2: 0x00000000
[   59.237235] NDCB3: 0x00000000
[   59.256311] marvell-nfc pxa3xx-nand: 
[   59.256311] NDCR:  0xdd079fff
[   59.256311] NDCB0: 0x000d3000
[   59.256311] NDCB1: 0x2c010000
[   59.256311] NDCB2: 0x00000000
[   59.256311] NDCB3: 0x00000000
[   59.275319] marvell-nfc pxa3xx-nand: 
[   59.275319] NDCR:  0x9d079fff
[   59.275319] NDCB0: 0x000d3000
[   59.275319] NDCB1: 0x2c010000
[   59.275319] NDCB2: 0x00000000
[   59.275319] NDCB3: 0x00000000
[   59.294431] marvell-nfc pxa3xx-nand: 
[   59.294431] NDCR:  0xdd079fff
[   59.294431] NDCB0: 0x000d3000
[   59.294431] NDCB1: 0x2c400000
[   59.294431] NDCB2: 0x00000000
[   59.294431] NDCB3: 0x00000000
[   59.313505] marvell-nfc pxa3xx-nand: 
[   59.313505] NDCR:  0xdd079fff
[   59.313505] NDCB0: 0x000d3000
[   59.313505] NDCB1: 0x2c410000
[   59.313505] NDCB2: 0x00000000
[   59.313505] NDCB3: 0x00000000
[   59.332498] marvell-nfc pxa3xx-nand: 
[   59.332498] NDCR:  0x9d079fff
[   59.332498] NDCB0: 0x000d3000
[   59.332498] NDCB1: 0x2c410000
[   59.332498] NDCB2: 0x00000000
[   59.332498] NDCB3: 0x00000000
[   59.351612] marvell-nfc pxa3xx-nand: 
[   59.351612] NDCR:  0xdd079fff
[   59.351612] NDCB0: 0x000d3000
[   59.351612] NDCB1: 0x2c800000
[   59.351612] NDCB2: 0x00000000
[   59.351612] NDCB3: 0x00000000
[   59.370686] marvell-nfc pxa3xx-nand: 
[   59.370686] NDCR:  0xdd079fff
[   59.370686] NDCB0: 0x000d3000
[   59.370686] NDCB1: 0x2c810000
[   59.370686] NDCB2: 0x00000000
[   59.370686] NDCB3: 0x00000000
[   59.389679] marvell-nfc pxa3xx-nand: 
[   59.389679] NDCR:  0x9d079fff
[   59.389679] NDCB0: 0x000d3000
[   59.389679] NDCB1: 0x2c810000
[   59.389679] NDCB2: 0x00000000
[   59.389679] NDCB3: 0x00000000
[   59.409773] marvell-nfc pxa3xx-nand: 
[   59.409773] NDCR:  0xdd079fff
[   59.409773] NDCB0: 0x000d3000
[   59.409773] NDCB1: 0x50800000
[   59.409773] NDCB2: 0x00000000
[   59.409773] NDCB3: 0x00000000
[   59.429029] marvell-nfc pxa3xx-nand: 
[   59.429029] NDCR:  0xdd079fff
[   59.429029] NDCB0: 0x000d3000
[   59.429029] NDCB1: 0x50810000
[   59.429029] NDCB2: 0x00000000
[   59.429029] NDCB3: 0x00000000
[   59.448042] marvell-nfc pxa3xx-nand: 
[   59.448042] NDCR:  0x9d079fff
[   59.448042] NDCB0: 0x000d3000
[   59.448042] NDCB1: 0x50810000
[   59.448042] NDCB2: 0x00000000
[   59.448042] NDCB3: 0x00000000
[   59.467164] marvell-nfc pxa3xx-nand: 
[   59.467164] NDCR:  0xdd079fff
[   59.467164] NDCB0: 0x000d3000
[   59.467164] NDCB1: 0x50c00000
[   59.467164] NDCB2: 0x00000000
[   59.467164] NDCB3: 0x00000000
[   59.486242] marvell-nfc pxa3xx-nand: 
[   59.486242] NDCR:  0xdd079fff
[   59.486242] NDCB0: 0x000d3000
[   59.486242] NDCB1: 0x50c10000
[   59.486242] NDCB2: 0x00000000
[   59.486242] NDCB3: 0x00000000
[   59.505235] marvell-nfc pxa3xx-nand: 
[   59.505235] NDCR:  0x9d079fff
[   59.505235] NDCB0: 0x000d3000
[   59.505235] NDCB1: 0x50c10000
[   59.505235] NDCB2: 0x00000000
[   59.505235] NDCB3: 0x00000000
[   59.524349] marvell-nfc pxa3xx-nand: 
[   59.524349] NDCR:  0xdd079fff
[   59.524349] NDCB0: 0x000d3000
[   59.524349] NDCB1: 0x51000000
[   59.524349] NDCB2: 0x00000000
[   59.524349] NDCB3: 0x00000000
[   59.543423] marvell-nfc pxa3xx-nand: 
[   59.543423] NDCR:  0xdd079fff
[   59.543423] NDCB0: 0x000d3000
[   59.543423] NDCB1: 0x51010000
[   59.543423] NDCB2: 0x00000000
[   59.543423] NDCB3: 0x00000000
[   59.562418] marvell-nfc pxa3xx-nand: 
[   59.562418] NDCR:  0x9d079fff
[   59.562418] NDCB0: 0x000d3000
[   59.562418] NDCB1: 0x51010000
[   59.562418] NDCB2: 0x00000000
[   59.562418] NDCB3: 0x00000000
[   59.581528] marvell-nfc pxa3xx-nand: 
[   59.581528] NDCR:  0xdd079fff
[   59.581528] NDCB0: 0x000d3000
[   59.581528] NDCB1: 0x51400000
[   59.581528] NDCB2: 0x00000000
[   59.581528] NDCB3: 0x00000000
[   59.600605] marvell-nfc pxa3xx-nand: 
[   59.600605] NDCR:  0xdd079fff
[   59.600605] NDCB0: 0x000d3000
[   59.600605] NDCB1: 0x51410000
[   59.600605] NDCB2: 0x00000000
[   59.600605] NDCB3: 0x00000000
[   59.619598] marvell-nfc pxa3xx-nand: 
[   59.619598] NDCR:  0x9d079fff
[   59.619598] NDCB0: 0x000d3000
[   59.619598] NDCB1: 0x51410000
[   59.619598] NDCB2: 0x00000000
[   59.619598] NDCB3: 0x00000000
[   59.638825] marvell-nfc pxa3xx-nand: 
[   59.638825] NDCR:  0xdd079fff
[   59.638825] NDCB0: 0x000d3000
[   59.638825] NDCB1: 0x51800000
[   59.638825] NDCB2: 0x00000000
[   59.638825] NDCB3: 0x00000000
[   59.657847] marvell-nfc pxa3xx-nand: 
[   59.657847] NDCR:  0xdd079fff
[   59.657847] NDCB0: 0x000d3000
[   59.657847] NDCB1: 0x51810000
[   59.657847] NDCB2: 0x00000000
[   59.657847] NDCB3: 0x00000000
[   59.676840] marvell-nfc pxa3xx-nand: 
[   59.676840] NDCR:  0x9d079fff
[   59.676840] NDCB0: 0x000d3000
[   59.676840] NDCB1: 0x51810000
[   59.676840] NDCB2: 0x00000000
[   59.676840] NDCB3: 0x00000000
[   59.695956] marvell-nfc pxa3xx-nand: 
[   59.695956] NDCR:  0xdd079fff
[   59.695956] NDCB0: 0x000d3000
[   59.695956] NDCB1: 0x51c00000
[   59.695956] NDCB2: 0x00000000
[   59.695956] NDCB3: 0x00000000
[   59.715039] marvell-nfc pxa3xx-nand: 
[   59.715039] NDCR:  0xdd079fff
[   59.715039] NDCB0: 0x000d3000
[   59.715039] NDCB1: 0x51c10000
[   59.715039] NDCB2: 0x00000000
[   59.715039] NDCB3: 0x00000000
[   59.734038] marvell-nfc pxa3xx-nand: 
[   59.734038] NDCR:  0x9d079fff
[   59.734038] NDCB0: 0x000d3000
[   59.734038] NDCB1: 0x51c10000
[   59.734038] NDCB2: 0x00000000
[   59.734038] NDCB3: 0x00000000
[   59.753156] marvell-nfc pxa3xx-nand: 
[   59.753156] NDCR:  0xdd079fff
[   59.753156] NDCB0: 0x000d3000
[   59.753156] NDCB1: 0x52000000
[   59.753156] NDCB2: 0x00000000
[   59.753156] NDCB3: 0x00000000
[   59.772234] marvell-nfc pxa3xx-nand: 
[   59.772234] NDCR:  0xdd079fff
[   59.772234] NDCB0: 0x000d3000
[   59.772234] NDCB1: 0x52010000
[   59.772234] NDCB2: 0x00000000
[   59.772234] NDCB3: 0x00000000
[   59.791225] marvell-nfc pxa3xx-nand: 
[   59.791225] NDCR:  0x9d079fff
[   59.791225] NDCB0: 0x000d3000
[   59.791225] NDCB1: 0x52010000
[   59.791225] NDCB2: 0x00000000
[   59.791225] NDCB3: 0x00000000
[   59.810348] marvell-nfc pxa3xx-nand: 
[   59.810348] NDCR:  0xdd079fff
[   59.810348] NDCB0: 0x000d3000
[   59.810348] NDCB1: 0x52400000
[   59.810348] NDCB2: 0x00000000
[   59.810348] NDCB3: 0x00000000
[   59.829430] marvell-nfc pxa3xx-nand: 
[   59.829430] NDCR:  0xdd079fff
[   59.829430] NDCB0: 0x000d3000
[   59.829430] NDCB1: 0x52410000
[   59.829430] NDCB2: 0x00000000
[   59.829430] NDCB3: 0x00000000
[   59.848437] marvell-nfc pxa3xx-nand: 
[   59.848437] NDCR:  0x9d079fff
[   59.848437] NDCB0: 0x000d3000
[   59.848437] NDCB1: 0x52410000
[   59.848437] NDCB2: 0x00000000
[   59.848437] NDCB3: 0x00000000
[   59.867556] marvell-nfc pxa3xx-nand: 
[   59.867556] NDCR:  0xdd079fff
[   59.867556] NDCB0: 0x000d3000
[   59.867556] NDCB1: 0x52800000
[   59.867556] NDCB2: 0x00000000
[   59.867556] NDCB3: 0x00000000
[   59.886635] marvell-nfc pxa3xx-nand: 
[   59.886635] NDCR:  0xdd079fff
[   59.886635] NDCB0: 0x000d3000
[   59.886635] NDCB1: 0x52810000
[   59.886635] NDCB2: 0x00000000
[   59.886635] NDCB3: 0x00000000
[   59.905631] marvell-nfc pxa3xx-nand: 
[   59.905631] NDCR:  0x9d079fff
[   59.905631] NDCB0: 0x000d3000
[   59.905631] NDCB1: 0x52810000
[   59.905631] NDCB2: 0x00000000
[   59.905631] NDCB3: 0x00000000
[   59.924745] marvell-nfc pxa3xx-nand: 
[   59.924745] NDCR:  0xdd079fff
[   59.924745] NDCB0: 0x000d3000
[   59.924745] NDCB1: 0x52c00000
[   59.924745] NDCB2: 0x00000000
[   59.924745] NDCB3: 0x00000000
[   59.943828] marvell-nfc pxa3xx-nand: 
[   59.943828] NDCR:  0xdd079fff
[   59.943828] NDCB0: 0x000d3000
[   59.943828] NDCB1: 0x52c10000
[   59.943828] NDCB2: 0x00000000
[   59.943828] NDCB3: 0x00000000
[   59.962826] marvell-nfc pxa3xx-nand: 
[   59.962826] NDCR:  0x9d079fff
[   59.962826] NDCB0: 0x000d3000
[   59.962826] NDCB1: 0x52c10000
[   59.962826] NDCB2: 0x00000000
[   59.962826] NDCB3: 0x00000000
[   59.981938] marvell-nfc pxa3xx-nand: 
[   59.981938] NDCR:  0xdd079fff
[   59.981938] NDCB0: 0x000d3000
[   59.981938] NDCB1: 0x53000000
[   59.981938] NDCB2: 0x00000000
[   59.981938] NDCB3: 0x00000000
[   60.001012] marvell-nfc pxa3xx-nand: 
[   60.001012] NDCR:  0xdd079fff
[   60.001012] NDCB0: 0x000d3000
[   60.001012] NDCB1: 0x53010000
[   60.001012] NDCB2: 0x00000000
[   60.001012] NDCB3: 0x00000000
[   60.020221] marvell-nfc pxa3xx-nand: 
[   60.020221] NDCR:  0x9d079fff
[   60.020221] NDCB0: 0x000d3000
[   60.020221] NDCB1: 0x53010000
[   60.020221] NDCB2: 0x00000000
[   60.020221] NDCB3: 0x00000000
[   60.039368] marvell-nfc pxa3xx-nand: 
[   60.039368] NDCR:  0xdd079fff
[   60.039368] NDCB0: 0x000d3000
[   60.039368] NDCB1: 0x53400000
[   60.039368] NDCB2: 0x00000000
[   60.039368] NDCB3: 0x00000000
[   60.058441] marvell-nfc pxa3xx-nand: 
[   60.058441] NDCR:  0xdd079fff
[   60.058441] NDCB0: 0x000d3000
[   60.058441] NDCB1: 0x53410000
[   60.058441] NDCB2: 0x00000000
[   60.058441] NDCB3: 0x00000000
[   60.077437] marvell-nfc pxa3xx-nand: 
[   60.077437] NDCR:  0x9d079fff
[   60.077437] NDCB0: 0x000d3000
[   60.077437] NDCB1: 0x53410000
[   60.077437] NDCB2: 0x00000000
[   60.077437] NDCB3: 0x00000000
[   60.097071] marvell-nfc pxa3xx-nand: 
[   60.097071] NDCR:  0xdd079fff
[   60.097071] NDCB0: 0x000d3000
[   60.097071] NDCB1: 0x53800000
[   60.097071] NDCB2: 0x00000000
[   60.097071] NDCB3: 0x00000000
[   60.116183] marvell-nfc pxa3xx-nand: 
[   60.116183] NDCR:  0xdd079fff
[   60.116183] NDCB0: 0x000d3000
[   60.116183] NDCB1: 0x53810000
[   60.116183] NDCB2: 0x00000000
[   60.116183] NDCB3: 0x00000000
[   60.135177] marvell-nfc pxa3xx-nand: 
[   60.135177] NDCR:  0x9d079fff
[   60.135177] NDCB0: 0x000d3000
[   60.135177] NDCB1: 0x53810000
[   60.135177] NDCB2: 0x00000000
[   60.135177] NDCB3: 0x00000000
[   60.154288] marvell-nfc pxa3xx-nand: 
[   60.154288] NDCR:  0xdd079fff
[   60.154288] NDCB0: 0x000d3000
[   60.154288] NDCB1: 0x53c00000
[   60.154288] NDCB2: 0x00000000
[   60.154288] NDCB3: 0x00000000
[   60.173365] marvell-nfc pxa3xx-nand: 
[   60.173365] NDCR:  0xdd079fff
[   60.173365] NDCB0: 0x000d3000
[   60.173365] NDCB1: 0x53c10000
[   60.173365] NDCB2: 0x00000000
[   60.173365] NDCB3: 0x00000000
[   60.192359] marvell-nfc pxa3xx-nand: 
[   60.192359] NDCR:  0x9d079fff
[   60.192359] NDCB0: 0x000d3000
[   60.192359] NDCB1: 0x53c10000
[   60.192359] NDCB2: 0x00000000
[   60.192359] NDCB3: 0x00000000
[   60.211474] marvell-nfc pxa3xx-nand: 
[   60.211474] NDCR:  0xdd079fff
[   60.211474] NDCB0: 0x000d3000
[   60.211474] NDCB1: 0x54000000
[   60.211474] NDCB2: 0x00000000
[   60.211474] NDCB3: 0x00000000
[   60.230556] marvell-nfc pxa3xx-nand: 
[   60.230556] NDCR:  0xdd079fff
[   60.230556] NDCB0: 0x000d3000
[   60.230556] NDCB1: 0x54010000
[   60.230556] NDCB2: 0x00000000
[   60.230556] NDCB3: 0x00000000
[   60.249556] marvell-nfc pxa3xx-nand: 
[   60.249556] NDCR:  0x9d079fff
[   60.249556] NDCB0: 0x000d3000
[   60.249556] NDCB1: 0x54010000
[   60.249556] NDCB2: 0x00000000
[   60.249556] NDCB3: 0x00000000
[   60.268799] marvell-nfc pxa3xx-nand: 
[   60.268799] NDCR:  0xdd079fff
[   60.268799] NDCB0: 0x000d3000
[   60.268799] NDCB1: 0x54400000
[   60.268799] NDCB2: 0x00000000
[   60.268799] NDCB3: 0x00000000
[   60.287813] marvell-nfc pxa3xx-nand: 
[   60.287813] NDCR:  0xdd079fff
[   60.287813] NDCB0: 0x000d3000
[   60.287813] NDCB1: 0x54410000
[   60.287813] NDCB2: 0x00000000
[   60.287813] NDCB3: 0x00000000
[   60.306813] marvell-nfc pxa3xx-nand: 
[   60.306813] NDCR:  0x9d079fff
[   60.306813] NDCB0: 0x000d3000
[   60.306813] NDCB1: 0x54410000
[   60.306813] NDCB2: 0x00000000
[   60.306813] NDCB3: 0x00000000
[   60.325931] marvell-nfc pxa3xx-nand: 
[   60.325931] NDCR:  0xdd079fff
[   60.325931] NDCB0: 0x000d3000
[   60.325931] NDCB1: 0x55000000
[   60.325931] NDCB2: 0x00000000
[   60.325931] NDCB3: 0x00000000
[   60.345007] marvell-nfc pxa3xx-nand: 
[   60.345007] NDCR:  0xdd079fff
[   60.345007] NDCB0: 0x000d3000
[   60.345007] NDCB1: 0x55010000
[   60.345007] NDCB2: 0x00000000
[   60.345007] NDCB3: 0x00000000
[   60.364001] marvell-nfc pxa3xx-nand: 
[   60.364001] NDCR:  0x9d079fff
[   60.364001] NDCB0: 0x000d3000
[   60.364001] NDCB1: 0x55010000
[   60.364001] NDCB2: 0x00000000
[   60.364001] NDCB3: 0x00000000
[   60.383116] marvell-nfc pxa3xx-nand: 
[   60.383116] NDCR:  0xdd079fff
[   60.383116] NDCB0: 0x000d3000
[   60.383116] NDCB1: 0x55400000
[   60.383116] NDCB2: 0x00000000
[   60.383116] NDCB3: 0x00000000
[   60.402197] marvell-nfc pxa3xx-nand: 
[   60.402197] NDCR:  0xdd079fff
[   60.402197] NDCB0: 0x000d3000
[   60.402197] NDCB1: 0x55410000
[   60.402197] NDCB2: 0x00000000
[   60.402197] NDCB3: 0x00000000
[   60.421190] marvell-nfc pxa3xx-nand: 
[   60.421190] NDCR:  0x9d079fff
[   60.421190] NDCB0: 0x000d3000
[   60.421190] NDCB1: 0x55410000
[   60.421190] NDCB2: 0x00000000
[   60.421190] NDCB3: 0x00000000
[   60.440302] marvell-nfc pxa3xx-nand: 
[   60.440302] NDCR:  0xdd079fff
[   60.440302] NDCB0: 0x000d3000
[   60.440302] NDCB1: 0x55800000
[   60.440302] NDCB2: 0x00000000
[   60.440302] NDCB3: 0x00000000
[   60.459400] marvell-nfc pxa3xx-nand: 
[   60.459400] NDCR:  0xdd079fff
[   60.459400] NDCB0: 0x000d3000
[   60.459400] NDCB1: 0x55810000
[   60.459400] NDCB2: 0x00000000
[   60.459400] NDCB3: 0x00000000
[   60.478391] marvell-nfc pxa3xx-nand: 
[   60.478391] NDCR:  0x9d079fff
[   60.478391] NDCB0: 0x000d3000
[   60.478391] NDCB1: 0x55810000
[   60.478391] NDCB2: 0x00000000
[   60.478391] NDCB3: 0x00000000
[   60.497507] marvell-nfc pxa3xx-nand: 
[   60.497507] NDCR:  0xdd079fff
[   60.497507] NDCB0: 0x000d3000
[   60.497507] NDCB1: 0x55c00000
[   60.497507] NDCB2: 0x00000000
[   60.497507] NDCB3: 0x00000000
[   60.516585] marvell-nfc pxa3xx-nand: 
[   60.516585] NDCR:  0xdd079fff
[   60.516585] NDCB0: 0x000d3000
[   60.516585] NDCB1: 0x55c10000
[   60.516585] NDCB2: 0x00000000
[   60.516585] NDCB3: 0x00000000
[   60.535578] marvell-nfc pxa3xx-nand: 
[   60.535578] NDCR:  0x9d079fff
[   60.535578] NDCB0: 0x000d3000
[   60.535578] NDCB1: 0x55c10000
[   60.535578] NDCB2: 0x00000000
[   60.535578] NDCB3: 0x00000000
[   60.554689] marvell-nfc pxa3xx-nand: 
[   60.554689] NDCR:  0xdd079fff
[   60.554689] NDCB0: 0x000d3000
[   60.554689] NDCB1: 0x56000000
[   60.554689] NDCB2: 0x00000000
[   60.554689] NDCB3: 0x00000000
[   60.573763] marvell-nfc pxa3xx-nand: 
[   60.573763] NDCR:  0xdd079fff
[   60.573763] NDCB0: 0x000d3000
[   60.573763] NDCB1: 0x56010000
[   60.573763] NDCB2: 0x00000000
[   60.573763] NDCB3: 0x00000000
[   60.592755] marvell-nfc pxa3xx-nand: 
[   60.592755] NDCR:  0x9d079fff
[   60.592755] NDCB0: 0x000d3000
[   60.592755] NDCB1: 0x56010000
[   60.592755] NDCB2: 0x00000000
[   60.592755] NDCB3: 0x00000000
[   60.611868] marvell-nfc pxa3xx-nand: 
[   60.611868] NDCR:  0xdd079fff
[   60.611868] NDCB0: 0x000d3000
[   60.611868] NDCB1: 0x56400000
[   60.611868] NDCB2: 0x00000000
[   60.611868] NDCB3: 0x00000000
[   60.630946] marvell-nfc pxa3xx-nand: 
[   60.630946] NDCR:  0xdd079fff
[   60.630946] NDCB0: 0x000d3000
[   60.630946] NDCB1: 0x56410000
[   60.630946] NDCB2: 0x00000000
[   60.630946] NDCB3: 0x00000000
[   60.649937] marvell-nfc pxa3xx-nand: 
[   60.649937] NDCR:  0x9d079fff
[   60.649937] NDCB0: 0x000d3000
[   60.649937] NDCB1: 0x56410000
[   60.649937] NDCB2: 0x00000000
[   60.649937] NDCB3: 0x00000000
[   60.669070] marvell-nfc pxa3xx-nand: 
[   60.669070] NDCR:  0xdd079fff
[   60.669070] NDCB0: 0x000d3000
[   60.669070] NDCB1: 0x56800000
[   60.669070] NDCB2: 0x00000000
[   60.669070] NDCB3: 0x00000000
[   60.688143] marvell-nfc pxa3xx-nand: 
[   60.688143] NDCR:  0xdd079fff
[   60.688143] NDCB0: 0x000d3000
[   60.688143] NDCB1: 0x56810000
[   60.688143] NDCB2: 0x00000000
[   60.688143] NDCB3: 0x00000000
[   60.707135] marvell-nfc pxa3xx-nand: 
[   60.707135] NDCR:  0x9d079fff
[   60.707135] NDCB0: 0x000d3000
[   60.707135] NDCB1: 0x56810000
[   60.707135] NDCB2: 0x00000000
[   60.707135] NDCB3: 0x00000000
[   60.726250] marvell-nfc pxa3xx-nand: 
[   60.726250] NDCR:  0xdd079fff
[   60.726250] NDCB0: 0x000d3000
[   60.726250] NDCB1: 0x56c00000
[   60.726250] NDCB2: 0x00000000
[   60.726250] NDCB3: 0x00000000
[   60.745333] marvell-nfc pxa3xx-nand: 
[   60.745333] NDCR:  0xdd079fff
[   60.745333] NDCB0: 0x000d3000
[   60.745333] NDCB1: 0x56c10000
[   60.745333] NDCB2: 0x00000000
[   60.745333] NDCB3: 0x00000000
[   60.764332] marvell-nfc pxa3xx-nand: 
[   60.764332] NDCR:  0x9d079fff
[   60.764332] NDCB0: 0x000d3000
[   60.764332] NDCB1: 0x56c10000
[   60.764332] NDCB2: 0x00000000
[   60.764332] NDCB3: 0x00000000
[   60.783447] marvell-nfc pxa3xx-nand: 
[   60.783447] NDCR:  0xdd079fff
[   60.783447] NDCB0: 0x000d3000
[   60.783447] NDCB1: 0x57000000
[   60.783447] NDCB2: 0x00000000
[   60.783447] NDCB3: 0x00000000
[   60.802527] marvell-nfc pxa3xx-nand: 
[   60.802527] NDCR:  0xdd079fff
[   60.802527] NDCB0: 0x000d3000
[   60.802527] NDCB1: 0x57010000
[   60.802527] NDCB2: 0x00000000
[   60.802527] NDCB3: 0x00000000
[   60.821520] marvell-nfc pxa3xx-nand: 
[   60.821520] NDCR:  0x9d079fff
[   60.821520] NDCB0: 0x000d3000
[   60.821520] NDCB1: 0x57010000
[   60.821520] NDCB2: 0x00000000
[   60.821520] NDCB3: 0x00000000
[   60.840635] marvell-nfc pxa3xx-nand: 
[   60.840635] NDCR:  0xdd079fff
[   60.840635] NDCB0: 0x000d3000
[   60.840635] NDCB1: 0x57400000
[   60.840635] NDCB2: 0x00000000
[   60.840635] NDCB3: 0x00000000
[   60.859718] marvell-nfc pxa3xx-nand: 
[   60.859718] NDCR:  0xdd079fff
[   60.859718] NDCB0: 0x000d3000
[   60.859718] NDCB1: 0x57410000
[   60.859718] NDCB2: 0x00000000
[   60.859718] NDCB3: 0x00000000
[   60.878796] marvell-nfc pxa3xx-nand: 
[   60.878796] NDCR:  0x9d079fff
[   60.878796] NDCB0: 0x000d3000
[   60.878796] NDCB1: 0x57410000
[   60.878796] NDCB2: 0x00000000
[   60.878796] NDCB3: 0x00000000
[   60.897886] marvell-nfc pxa3xx-nand: 
[   60.897886] NDCR:  0xdd079fff
[   60.897886] NDCB0: 0x000d3000
[   60.897886] NDCB1: 0x57c00000
[   60.897886] NDCB2: 0x00000000
[   60.897886] NDCB3: 0x00000000
[   60.916967] marvell-nfc pxa3xx-nand: 
[   60.916967] NDCR:  0xdd079fff
[   60.916967] NDCB0: 0x000d3000
[   60.916967] NDCB1: 0x57c10000
[   60.916967] NDCB2: 0x00000000
[   60.916967] NDCB3: 0x00000000
[   60.935957] marvell-nfc pxa3xx-nand: 
[   60.935957] NDCR:  0x9d079fff
[   60.935957] NDCB0: 0x000d3000
[   60.935957] NDCB1: 0x57c10000
[   60.935957] NDCB2: 0x00000000
[   60.935957] NDCB3: 0x00000000
[   60.955072] marvell-nfc pxa3xx-nand: 
[   60.955072] NDCR:  0xdd079fff
[   60.955072] NDCB0: 0x000d3000
[   60.955072] NDCB1: 0x58000000
[   60.955072] NDCB2: 0x00000000
[   60.955072] NDCB3: 0x00000000
[   60.974148] marvell-nfc pxa3xx-nand: 
[   60.974148] NDCR:  0xdd079fff
[   60.974148] NDCB0: 0x000d3000
[   60.974148] NDCB1: 0x58010000
[   60.974148] NDCB2: 0x00000000
[   60.974148] NDCB3: 0x00000000
[   60.993140] marvell-nfc pxa3xx-nand: 
[   60.993140] NDCR:  0x9d079fff
[   60.993140] NDCB0: 0x000d3000
[   60.993140] NDCB1: 0x58010000
[   60.993140] NDCB2: 0x00000000
[   60.993140] NDCB3: 0x00000000
[   61.012262] marvell-nfc pxa3xx-nand: 
[   61.012262] NDCR:  0xdd079fff
[   61.012262] NDCB0: 0x000d3000
[   61.012262] NDCB1: 0x58400000
[   61.012262] NDCB2: 0x00000000
[   61.012262] NDCB3: 0x00000000
[   61.031332] marvell-nfc pxa3xx-nand: 
[   61.031332] NDCR:  0xdd079fff
[   61.031332] NDCB0: 0x000d3000
[   61.031332] NDCB1: 0x58410000
[   61.031332] NDCB2: 0x00000000
[   61.031332] NDCB3: 0x00000000
[   61.050347] marvell-nfc pxa3xx-nand: 
[   61.050347] NDCR:  0x9d079fff
[   61.050347] NDCB0: 0x000d3000
[   61.050347] NDCB1: 0x58410000
[   61.050347] NDCB2: 0x00000000
[   61.050347] NDCB3: 0x00000000
[   61.069665] ubi0: scanning is finished
[   61.073622] ubi0 error: ubi_read_volume_table: the layout volume was not found
[   61.081178] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd5, error -22
[   61.088556] UBI error: cannot attach mtd5
[   61.094051] pxa-rtc pxa-rtc: setting system clock to 2000-01-01 00:01:26 UTC (946684886)
[   61.173248] smc91x smc91x.0 eth0: link down
[   63.031810] smc91x smc91x.0 eth0: link up, 100Mbps, full-duplex, lpa 0xCDE1
[   63.088817] IP-Config: Complete:
[   63.092174]      device=eth0, hwaddr=00:0e:0c:a7:26:f7, ipaddr=192.168.1.232, mask=255.255.255.0, gw=255.255.255.255
[   63.102853]      host=192.168.1.232, domain=, nis-domain=(none)
[   63.108938]      bootserver=192.168.1.5, rootserver=192.168.1.5, rootpath=
[   63.117215] ALSA device list:
[   63.120674]   #0: Zylonite
[   63.146191] Freeing unused kernel memory: 2396K
[   63.151134] This architecture does not have kernel memory protection.
Starting logging: OK
Loading all the available modules: modprobe: module smc91x not found in modules.dep
modprobe: module soundcore not found in modules.dep
