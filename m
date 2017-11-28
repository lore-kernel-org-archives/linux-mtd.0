Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJfif-0005X5-5t
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 13:14:39 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
Date: Tue, 28 Nov 2017 14:12:45 +0100
MIME-Version: 1.0
In-Reply-To: <20171128140210.34215e19@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel

On 2017-11-28 14:02, Miquel RAYNAL wrote:
> Hi Sean,
>
>> I'm currently in the process of doing bringup on a custom armada 38x
>> board. During the firsts boots of the Linux kernel we saw that the
>> NAND driver throws a lot of timeout messages.
>>
>> Like this:
>> [ 28.321054] pxa3xx-nand f10d0000.flash: Wait time out!!!
>> [ 28.521054] pxa3xx-nand f10d0000.flash: Wait time out!!!
>> [ 28.721054] pxa3xx-nand f10d0000.flash: Wait time out!!!
> Could you paste the entire dmesg please ?
Sure, se below. BBT is disabled
>
> Also, what kernel are you using ?
4.14.0 :-)
>
>> That lead me to investigate the issue and found this thread (quite
>> old): https://www.spinics.net/lists/arm-kernel/msg488581.html
>>
>> In the thread some is describing a possible race condition when the
>> NAND framework is scanning for bad blocks.
> Not sure this is still relevant, but, who knows.
>
>
> Thanks,
> Miquèl

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.0-00023-gd0f553c82aac-dirty (skn@skn) 
(gcc version 7.2.0 (Arch Repository)) #46 SMP PREEMPT Tue Nov 28 
12:44:43 CET 2017
[    0.000000] CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), 
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] OF: fdt: Machine model: Triax DVB-TC Output
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] random: fast init done
[    0.000000] percpu: Embedded 17 pages/cpu @ef7ca000 s37132 r8192 
d24308 u69632
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: console=ttyS0,115200 ubi.mtd=1 
mtdparts=pxa3xx_nand-0:1m(uboot),-(ubi0) shell
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes)
[    0.000000] Memory: 1026888K/1048576K available (6144K kernel code, 
428K rwdata, 1328K rodata, 1024K init, 159K bss, 21688K reserved, 0K 
cma-reserved, 262144K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0700000   (7136 kB)
[    0.000000]       .init : 0xc0900000 - 0xc0a00000   (1024 kB)
[    0.000000]       .data : 0xc0a00000 - 0xc0a6b230   ( 429 kB)
[    0.000000]        .bss : 0xc0a6b230 - 0xc0a9317c   ( 160 kB)
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]     RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=2.
[    0.000000]     Tasks RCU enabled.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 D prefetch enabled, offset 1 lines
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
[    0.000000] L2C-310 Coherent cache controller enabled, 16 ways, 1024 kB
[    0.000000] L2C-310 Coherent: CACHE_ID 0x410054c9, AUX_CTRL 0x56070001
[    0.000010] sched_clock: 64 bits at 533MHz, resolution 1ns, wraps 
every 2199023255551ns
[    0.000023] clocksource: arm_global_timer: mask: 0xffffffffffffffff 
max_cycles: 0x7aed16d152, max_idle_ns: 440795225656 ns
[    0.000042] Switching to timer-based delay loop, resolution 1ns
[    0.000209] Ignoring duplicate/late registration of 
read_current_timer delay
[    0.000219] clocksource: armada_370_xp_clocksource: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 76450417870 ns
[    0.000559] Console: colour dummy device 80x30
[    0.000580] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 1066.00 BogoMIPS (lpj=5330000)
[    0.000590] pid_max: default: 32768 minimum: 301
[    0.000671] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000680] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes)
[    0.001053] CPU: Testing write buffer coherency: ok
[    0.001211] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.040132] Setting up static identity map for 0x100000 - 0x100060
[    0.040228] mvebu-soc-id: MVEBU SoC ID=0x6810, Rev=0x4
[    0.040323] mvebu-pmsu: Initializing Power Management Service Unit
[    0.060106] Hierarchical SRCU implementation.
[    0.100104] smp: Bringing up secondary CPUs ...
[    0.170166] Booting CPU 1
[    1.200101] CPU1: failed to come online
[    1.200154] smp: Brought up 1 node, 1 CPU
[    1.200160] SMP: Total of 1 processors activated (1066.00 BogoMIPS).
[    1.200165] CPU: All CPU(s) started in SVC mode.
[    1.200696] devtmpfs: initialized
[    1.202583] VFP support v0.3: implementor 41 architecture 3 part 30 
variant 9 rev 4
[    1.202704] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.202715] futex hash table entries: 512 (order: 3, 32768 bytes)
[    1.202821] pinctrl core: initialized pinctrl subsystem
[    1.203212] NET: Registered protocol family 16
[    1.203846] DMA: preallocated 256 KiB pool for atomic coherent 
allocations
[    1.204397] cpuidle: using governor ladder
[    1.204462] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 
watchpoint registers.
[    1.204469] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    1.204598] mvebu-pmsu: CPU hotplug support is currently broken on 
Armada 38x: disabling
[    1.204608] mvebu-pmsu: CPU idle is currently broken on Armada 38x: 
disabling
[    1.240390] SCSI subsystem initialized
[    1.260188] clocksource: Switched to clocksource arm_global_timer
[    1.286316] NET: Registered protocol family 2
[    1.286687] TCP established hash table entries: 8192 (order: 3, 32768 
bytes)
[    1.286746] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    1.286841] TCP: Hash tables configured (established 8192 bind 8192)
[    1.286921] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    1.286959] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    1.287074] NET: Registered protocol family 1
[    1.307361] RPC: Registered named UNIX socket transport module.
[    1.307367] RPC: Registered udp transport module.
[    1.307372] RPC: Registered tcp transport module.
[    1.307376] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.307513] Unpacking initramfs...
[    1.439858] Freeing initrd memory: 2656K
[    1.440285] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 
counters available
[    1.441143] workingset: timestamp_bits=30 max_order=18 bucket_order=0
[    1.452415] bounce: pool size: 64 pages
[    1.452451] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 251)
[    1.452459] io scheduler noop registered
[    1.452464] io scheduler deadline registered
[    1.452499] io scheduler cfq registered (default)
[    1.452505] io scheduler mq-deadline registered
[    1.452510] io scheduler kyber registered
[    1.453243] armada-38x-pinctrl f1018000.pinctrl: registered pinctrl 
driver
[    1.454825] mvebu-pcie soc:pcie: PCI host bridge to bus 0000:00
[    1.454837] pci_bus 0000:00: root bus resource [io 0x1000-0xfffff]
[    1.454845] pci_bus 0000:00: root bus resource [mem 
0xe0000000-0xe7ffffff]
[    1.454852] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.455028] PCI: bus0: Fast back to back transfers disabled
[    1.455037] pci 0000:00:01.0: bridge configuration invalid ([bus 
00-00]), reconfiguring
[    1.455102] PCI: bus1: Fast back to back transfers enabled
[    1.455129] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.455456] mv_xor f1060800.xor: Marvell shared XOR driver
[    1.510678] mv_xor f1060800.xor: Marvell XOR (Descriptor Mode): ( xor 
cpy intr )
[    1.510833] mv_xor f1060900.xor: Marvell shared XOR driver
[    1.570660] mv_xor f1060900.xor: Marvell XOR (Descriptor Mode): ( xor 
cpy intr )
[    1.594127] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.595218] console [ttyS0] disabled
[    1.615355] f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq = 22, 
base_baud = 15625000) is a 16550A
[    2.284175] console [ttyS0] enabled
[    2.288684] pxa3xx-nand f10d0000.flash: This platform can't do DMA on 
this device
[    2.296924] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    2.303311] nand: Micron MT29F2G08ABAEAH4
[    2.307334] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, 
OOB size: 64
[    2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step 
size 2048
[    2.321936] Scanning device for bad blocks
[    2.530193] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    2.740191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    2.950191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    3.160192] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    3.370191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    3.580191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    3.790191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    4.000191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    4.210191] pxa3xx-nand f10d0000.flash: Wait time out!!!
[    4.420191] pxa3xx-nand f10d0000.flash: Wait time out!!!
...
