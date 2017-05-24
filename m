Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDfFN-0006fu-SF
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 22:59:21 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>
Subject: Re: pxa3xx-nand failing to find device on linux-next
Date: Wed, 24 May 2017 22:58:53 +0000
Message-ID: <69dfc0d5ca774efb8c92e9ec635f68ec@svr-chch-ex1.atlnz.lc>
References: <b36366e358904310aee4970b77f57dba@svr-chch-ex1.atlnz.lc>
 <2a79405e219b4c37ba00defbe4a0dfe4@svr-chch-ex1.atlnz.lc>
 <20170524132301.12ad33d8@bbrezillon> <20170524132508.420614c7@bbrezillon>
 <ebe9d9bca4754d1ba920295f2fdd1359@svr-chch-ex1.atlnz.lc>
 <20170525003646.276516d0@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25/05/17 10:36, Boris Brezillon wrote:=0A=
> Le Wed, 24 May 2017 22:03:52 +0000,=0A=
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> a =E9crit :=0A=
> =0A=
>> On 24/05/17 23:25, Boris Brezillon wrote:=0A=
>>> On Wed, 24 May 2017 13:23:01 +0200=0A=
>>> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:=0A=
>>>    =0A=
>>>> Hi Chris,=0A=
>>>>=0A=
>>>> On Wed, 24 May 2017 09:36:56 +0000=0A=
>>>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>>>   =0A=
>>>>> On 23/05/17 17:27, Chris Packham wrote:=0A=
>>>>>> Hi,=0A=
>>>>>>=0A=
>>>>>> I'm doing some testing on linux-next and I'm finding that my nand fl=
ash=0A=
>>>>>> has disappeared.=0A=
>>>>>>=0A=
>>>>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this devic=
e=0A=
>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
>>>>>> On-die ECC forcefully enabled, not supported=0A=
>>>>>> nand: No NAND device found=0A=
>>>>>> pxa3xx-nand f10d0000.flash: failed to scan nand at cs 0=0A=
>>>>>>=0A=
>>>>>> This was working around 4.11. I'll try to do some more digging tomor=
row=0A=
>>>>>> to narrow down a failure point but I thought I'd send this out now j=
ust=0A=
>>>>>> in case it rings any bells.=0A=
>>>>>>=0A=
>>>>>> The board I'm using (DB-88F6820-AMC) is unfortunately out-of tree bu=
t it=0A=
>>>>>> should be pretty close to the armada-388-db. I can make my dts avail=
able=0A=
>>>>>> if it's helpful.=0A=
>>>>>=0A=
>>>>> Still works on 4.12-rc2. Fails on next-20170524.=0A=
>>>>>=0A=
>>>>> This appears to be due to commit b566d9c055de ("mtd: nand: add suppor=
t=0A=
>>>>> for Micron on-die ECC"). Which based on the description seems intenti=
onal.=0A=
>>>>>=0A=
>>>>> Since I have access to a hardware platform that has a micron flash wi=
th=0A=
>>>>> ECC forcefully enabled how can I help to get this implemented.=0A=
>>>>=0A=
>>>> Can you try with this patch applied [1]?=0A=
>>>=0A=
>>> Sorry, wrong patch. Can you try this one [1] instead?=0A=
>>>=0A=
>>> [1]http://code.bulix.org/pkfhmi-135875=0A=
>>>    =0A=
>>=0A=
>> With the patch above the chip is detected but ubifs is unhappy=0A=
> =0A=
> Hm, weird. And if you revert my both Thomas patch and mine, what do you=
=0A=
> get?=0A=
=0A=
Seems to work just fine.=0A=
=0A=
> BTW, can you paste the full boot logs, not only the failing part?=0A=
=0A=
Sure. Full log from next-20170524 + http://code.bulix.org/pkfhmi-135875 =0A=
below.=0A=
=0A=
[root@linuxbox /]# dmesg=0A=
pcpu-alloc: [0] 0 [0] 1=0A=
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 455168=
=0A=
Kernel command line: console=3DttyS0,115200 root=3D/dev/ram0 loglevel=3D8=
=0A=
PID hash table entries: 4096 (order: 2, 16384 bytes)=0A=
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)=0A=
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)=0A=
Memory: 1798628K/1835008K available (5120K kernel code, 173K rwdata, =0A=
1364K rodata, 1024K init, 123K bss, 36380K reserved, 0K cma-rese=0A=
rved)=0A=
Virtual kernel memory layout:=0A=
     vector  : 0xffff0000 - 0xffff1000   (   4 kB)=0A=
     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)=0A=
     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)=0A=
     lowmem  : 0x80000000 - 0xf0000000   (1792 MB)=0A=
     modules : 0x7f000000 - 0x80000000   (  16 MB)=0A=
       .text : 0x80008000 - 0x80600000   (6112 kB)=0A=
       .init : 0x80800000 - 0x80900000   (1024 kB)=0A=
       .data : 0x80900000 - 0x8092b600   ( 174 kB)=0A=
        .bss : 0x80930688 - 0x8094f440   ( 124 kB)=0A=
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1=0A=
Preemptible hierarchical RCU implementation.=0A=
         RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D2.=0A=
RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2=0A=
NR_IRQS:16 nr_irqs:16 16=0A=
L2C-310 enabling early BRESP for Cortex-A9=0A=
L2C-310 full line of zeros enabled for Cortex-A9=0A=
L2C-310 D prefetch enabled, offset 1 lines=0A=
L2C-310 dynamic clock gating enabled, standby mode enabled=0A=
L2C-310 Coherent cache controller enabled, 16 ways, 1024 kB=0A=
L2C-310 Coherent: CACHE_ID 0x410054c9, AUX_CTRL 0x56070001=0A=
Switching to timer-based delay loop, resolution 50ns=0A=
sched_clock: 32 bits at 20MHz, resolution 50ns, wraps every 107374182375ns=
=0A=
clocksource: armada_370_xp_clocksource: mask: 0xffffffff max_cycles: =0A=
0xffffffff, max_idle_ns: 95563022313 ns=0A=
Calibrating delay loop (skipped), value calculated using timer =0A=
frequency.. 40.00 BogoMIPS (lpj=3D200000)=0A=
pid_max: default: 32768 minimum: 301=0A=
Mount-cache hash table entries: 4096 (order: 2, 16384 bytes)=0A=
Mountpoint-cache hash table entries: 4096 (order: 2, 16384 bytes)=0A=
CPU: Testing write buffer coherency: ok=0A=
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000=0A=
Setting up static identity map for 0x100000 - 0x100060=0A=
mvebu-soc-id: MVEBU SoC ID=3D0x6820, Rev=3D0x4=0A=
mvebu-pmsu: Initializing Power Management Service Unit=0A=
Hierarchical SRCU implementation.=0A=
smp: Bringing up secondary CPUs ...=0A=
Booting CPU 1=0A=
CPU1: thread -1, cpu 1, socket 0, mpidr 80000001=0A=
smp: Brought up 1 node, 2 CPUs=0A=
SMP: Total of 2 processors activated (80.00 BogoMIPS).=0A=
CPU: All CPU(s) started in SVC mode.=0A=
devtmpfs: initialized=0A=
VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 4=0A=
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, =0A=
max_idle_ns: 19112604462750000 ns=0A=
futex hash table entries: 512 (order: 3, 32768 bytes)=0A=
pinctrl core: initialized pinctrl subsystem=0A=
NET: Registered protocol family 16=0A=
DMA: preallocated 256 KiB pool for atomic coherent allocations=0A=
mvebu-pmsu: CPU hotplug support is currently broken on Armada 38x: disablin=
g=0A=
mvebu-pmsu: CPU idle is currently broken on Armada 38x: disabling=0A=
SCSI subsystem initialized=0A=
usbcore: registered new interface driver usbfs=0A=
usbcore: registered new interface driver hub=0A=
usbcore: registered new device driver usb=0A=
clocksource: Switched to clocksource armada_370_xp_clocksource=0A=
NET: Registered protocol family 2=0A=
TCP established hash table entries: 16384 (order: 4, 65536 bytes)=0A=
TCP bind hash table entries: 16384 (order: 5, 131072 bytes)=0A=
TCP: Hash tables configured (established 16384 bind 16384)=0A=
UDP hash table entries: 1024 (order: 3, 32768 bytes)=0A=
UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)=0A=
NET: Registered protocol family 1=0A=
PCI: CLS 0 bytes, default 64=0A=
Trying to unpack rootfs image as initramfs...=0A=
rootfs image is not initramfs (junk in compressed archive); looks like =0A=
an initrd=0A=
Freeing initrd memory: 11756K=0A=
workingset: timestamp_bits=3D30 max_order=3D19 bucket_order=3D0=0A=
squashfs: version 4.0 (2009/01/31) Phillip Lougher=0A=
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)=0A=
io scheduler noop registered=0A=
io scheduler deadline registered=0A=
io scheduler cfq registered (default)=0A=
io scheduler mq-deadline registered=0A=
io scheduler kyber registered=0A=
armada-38x-pinctrl f1018000.pinctrl: registered pinctrl driver=0A=
mvebu-pcie soc:pcie-controller: PCI host bridge to bus 0000:00=0A=
pci_bus 0000:00: root bus resource [io  0x1000-0xfffff]=0A=
pci_bus 0000:00: root bus resource [mem 0xe0000000-0xe7ffffff]=0A=
pci_bus 0000:00: root bus resource [bus 00-ff]=0A=
pci 0000:00:01.0: [11ab:6820] type 01 class 0x060400=0A=
PCI: bus0: Fast back to back transfers disabled=0A=
pci 0000:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring=
=0A=
PCI: bus1: Fast back to back transfers enabled=0A=
pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01=0A=
pci 0000:00:01.0: PCI bridge to [bus 01]=0A=
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled=0A=
console [ttyS0] disabled=0A=
f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq =3D 21, base_baud =3D =0A=
12500000) is a 16550A=0A=
console [ttyS0] enabled=0A=
brd: module loaded=0A=
loop: module loaded=0A=
mtdoops: mtd device (mtddev=3Dname/number) must be supplied=0A=
pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device=0A=
pxa3xx-nand f10d0000.flash: Wait time out!!!=0A=
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd3=0A=
nand: Micron MT29F8G08ABACAWP=0A=
nand: 1024 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224=0A=
pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step size 1024=0A=
Bad block table found at page 262080, version 0x01=0A=
Bad block table found at page 262016, version 0x01=0A=
m25p80 spi1.0: n25q256a (32768 Kbytes)=0A=
2 ofpart partitions found on MTD device spi1.0=0A=
Creating 2 MTD partitions on "spi1.0":=0A=
0x000000000000-0x000000100000 : "u-boot"=0A=
0x000000100000-0x000000140000 : "u-boot-env"=0A=
libphy: Fixed MDIO Bus: probed=0A=
libphy: orion_mdio_bus: probed=0A=
mvneta f1070000.ethernet eth0: Using device tree mac address =0A=
00:50:43:00:08:fd=0A=
mvneta f1034000.ethernet eth1: Using hardware mac address 00:50:43:00:08:fd=
=0A=
usbcore: registered new interface driver asix=0A=
usbcore: registered new interface driver cdc_ether=0A=
usbcore: registered new interface driver smsc75xx=0A=
usbcore: registered new interface driver usb-storage=0A=
i2c /dev entries driver=0A=
(NULL device *): hwmon_device_register() is deprecated. Please convert =0A=
the driver to use hwmon_device_register_with_info().=0A=
orion_wdt: Initial timeout 214 sec=0A=
Netfilter messages via NETLINK v0.30.=0A=
nf_conntrack version 0.5.0 (16384 buckets, 65536 max)=0A=
ipip: IPv4 and MPLS over IPv4 tunneling driver=0A=
ip_tables: (C) 2000-2006 Netfilter Core Team=0A=
Initializing XFRM netlink socket=0A=
NET: Registered protocol family 10=0A=
Segment Routing with IPv6=0A=
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver=0A=
NET: Registered protocol family 17=0A=
NET: Registered protocol family 15=0A=
Registering SWP/SWPB emulation handler=0A=
registered taskstats version 1=0A=
RAMDISK: squashfs filesystem found at block 0=0A=
RAMDISK: Loading 11753KiB [1 disk] into ram disk... -=0A=
-=0A=
done.=0A=
VFS: Mounted root (squashfs filesystem) readonly on device 1:0.=0A=
devtmpfs: mounted=0A=
Freeing unused kernel memory: 1024K=0A=
 >systemd[1]: System time before build time, advancing clock.=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
 >systemd[1]: systemd 231 running in system mode. (-PAM -AUDIT -SELINUX =0A=
-IMA -APPARMOR -SMACK +SYSVINIT -UTMP -LIBCRYPTSETUP -GCRYPT -=0A=
GNUTLS -ACL -XZ -LZ4 -SECCOMP +BLKID -ELFUTILS -KMOD -IDN)=0A=
 >systemd[1]: Detected architecture arm.=0A=
 >systemd[1]: Set hostname to <awplus>.=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
 >systemd[1]: Initializing machine ID from random generator.=0A=
 >systemd[1]: Installed transient /etc/machine-id file.=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
 >udevd[581]: starting version 174=0A=
ubi0: attaching mtd0=0A=
random: fast init done=0A=
random: crng init done=0A=
ubi0: scanning is finished=0A=
ubi0: attached mtd0 (name "pxa3xx_nand-0", size 1024 MiB)=0A=
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes=0A=
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096=0A=
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192=0A=
ubi0: good PEBs: 4088, bad PEBs: 8, corrupted PEBs: 0=0A=
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128=0A=
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence =0A=
number: 2130122366=0A=
ubi0: available PEBs: 0, total reserved PEBs: 4088, PEBs reserved for =0A=
bad PEB handling: 72=0A=
ubi0: background thread "ubi_bgt0d" started, PID 597=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 601=0A=
UBIFS (ubi0:0): recovery needed=0A=
UBIFS (ubi0:0): recovery completed=0A=
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "user"=0A=
UBIFS (ubi0:0): LEB size: 253952 bytes (248 KiB), min./max. I/O unit =0A=
sizes: 4096 bytes/4096 bytes=0A=
UBIFS (ubi0:0): FS size: 1016315904 bytes (969 MiB, 4002 LEBs), journal =0A=
size 9404416 bytes (8 MiB, 38 LEBs)=0A=
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)=0A=
UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID =0A=
2C1F4CD3-FDB1-4A52-8BE8-79AAD15CF6EC, small LPT model=0A=
UBIFS error (ubi0:0 pid 599): ubifs_read_node: bad node type (160 but =0A=
expected 0)=0A=
UBIFS error (ubi0:0 pid 599): ubifs_read_node: bad node at LEB 10:90344, =
=0A=
LEB mapping status 1=0A=
Not a node, first 24 bytes:=0A=
00000000: 00 00 00 00 31 18 10 06 e5 43 e1 9f 3b 00 00 00 00 00 00 00 a0 =
=0A=
00 00 00                          ....1....C..;...........=0A=
CPU: 1 PID: 599 Comm: mount Not tainted 4.12.0-rc2-next-20170524-at1+ #58=
=0A=
Hardware name: Marvell Armada 380/385 (Device Tree)=0A=
[<801102dc>] (unwind_backtrace) from [<8010b658>] (show_stack+0x10/0x14)=0A=
[<8010b658>] (show_stack) from [<8031aa0c>] (dump_stack+0x88/0x9c)=0A=
[<8031aa0c>] (dump_stack) from [<802aebb8>] (ubifs_read_node+0x130/0x284)=
=0A=
[<802aebb8>] (ubifs_read_node) from [<802ca2a4>] =0A=
(ubifs_tnc_read_node+0x4c/0xd4)=0A=
[<802ca2a4>] (ubifs_tnc_read_node) from [<802b1e60>] =0A=
(ubifs_tnc_locate+0x1c0/0x1c8)=0A=
[<802b1e60>] (ubifs_tnc_locate) from [<802aa15c>] (ubifs_iget+0x78/0x554)=
=0A=
[<802aa15c>] (ubifs_iget) from [<802aa90c>] (ubifs_mount+0x2d4/0x1524)=0A=
[<802aa90c>] (ubifs_mount) from [<801dfab4>] (mount_fs+0x14/0xa4)=0A=
[<801dfab4>] (mount_fs) from [<801fa6b4>] (vfs_kern_mount+0x4c/0xf4)=0A=
[<801fa6b4>] (vfs_kern_mount) from [<801fd738>] (do_mount+0x154/0xb50)=0A=
[<801fd738>] (do_mount) from [<801fe49c>] (SyS_mount+0x74/0x9c)=0A=
[<801fe49c>] (SyS_mount) from [<801077a0>] (ret_fast_syscall+0x0/0x3c)=0A=
UBIFS error (ubi0:0 pid 599): ubifs_iget: failed to read inode 1, error -22=
=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops=0A=
ubi0: detaching mtd0=0A=
ubi0: mtd0 is detached=0A=
ubi0: attaching mtd0=0A=
ubi0: scanning is finished=0A=
ubi0 error: ubi_read_volume_table: the layout volume was not found=0A=
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd0, error -22=0A=
=0A=
