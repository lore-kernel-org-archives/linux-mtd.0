Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFrcD-0002ka-JN
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 01:40:32 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: ubifs error with marvell_nand on Armada-98DX4251 (was Re: [PATCH]
 mtd: rawnand: marvell: fix command xtype in BCH write hook)
Date: Tue, 8 May 2018 01:38:13 +0000
Message-ID: <91c282c4fe9344d88684131d1a64dcf2@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
 <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
 <20180504091001.3e6650d6@xps13>
 <729567d8180a4b70ba9226dcd9eee0b4@svr-chch-ex1.atlnz.lc>
 <20180507095053.249547d0@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi Boris,=0A=
=0A=
Thanks for picking this up while Miquel is taking a break.=0A=
=0A=
On 07/05/18 19:51, Boris Brezillon wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Mon, 7 May 2018 03:48:42 +0000=0A=
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> Hi Miquel,=0A=
>>=0A=
>> On 04/05/18 19:10, Miquel Raynal wrote:=0A=
>>> Hi Chris,=0A=
>>>=0A=
>>> On Fri, 4 May 2018 00:06:48 +0000, Chris Packham=0A=
>>> <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>>>=0A=
>>>> I do have one platform that passes the initial detection but starts to=
=0A=
>>>> report ubifs errors when mounted.=0A=
>>>>=0A=
>>>> Armada-98DX4251 Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224=0A=
>>>>=0A=
>>>> This is probably unrelated to this particular fix. It may be as simple=
=0A=
>>>> as something not catering for the Armada-98DX4251 SoC or a genuine=0A=
>>>> difference between Armada-98DX4251 and Armada-385. 4.16.4 with=0A=
>>>> pxa3xx_nand works with this combination.=0A=
>>=0A=
>> I did spot a few problems in the pinctrl driver for this platform, but=
=0A=
>> nothing that was stopping things from working (the bootloader set the=0A=
>> MPP functions correctly). I've sent some patches for that.=0A=
>>=0A=
>>> Can you please share more details: the device tree (at least the NAND=
=0A=
>>> node), the strength requested, the boot log, the errors?=0A=
>>=0A=
>> Here's the relevant part of the device tree=0A=
>>=0A=
>> 	nand@d0000 {=0A=
>> 		compatible =3D "marvell,armada370-nand";=0A=
>> 		reg =3D <0xd0000 0x54>;=0A=
>> 		#address-cells =3D <0x1>;=0A=
>> 		#size-cells =3D <0x1>;=0A=
>> 		interrupts =3D <0x71>;=0A=
>> 		clocks =3D <0xc 0x0>;=0A=
>> 		status =3D "okay";=0A=
>> 		num-cs =3D <0x1>;=0A=
>> 		marvell,nand-enable-arbiter;=0A=
>> 		nand-on-flash-bbt;=0A=
>> 	};=0A=
>>=0A=
>> 	...=0A=
>>=0A=
>> 	dfx-server@ac000000 {=0A=
>> 		compatible =3D "marvell,dfx-server", "simple-bus";=0A=
>> 		#address-cells =3D <0x1>;=0A=
>> 		#size-cells =3D <0x1>;=0A=
>> 		ranges =3D <0x0 0x8000000 0x0 0x100000>;=0A=
>> 		reg =3D <0x8000000 0x0 0x100000>;=0A=
>> 		phandle =3D <0xe>;=0A=
>>=0A=
>> 		corediv-clock@f8268 {=0A=
>> 			compatible =3D "marvell,mv98dx3236-corediv-clock";=0A=
>> 			reg =3D <0xf8268 0xc>;=0A=
>> 			#clock-cells =3D <0x1>;=0A=
>> 			clocks =3D <0x9>;=0A=
>> 			clock-output-names =3D "nand";=0A=
>> 			phandle =3D <0xc>;=0A=
>> 		};=0A=
>> 	};=0A=
>>=0A=
=0A=
<snip old partial boot info>=0A=
>>=0A=
> =0A=
> Can you paste the full boot logs?=0A=
> =0A=
=0A=
4.17.0-rc4 + xtype patch + delay patch=0A=
=0A=
Booting Linux on physical CPU 0x0=0A=
Linux version 4.17.0-rc4-at1+ (@chrisp-dl) (gcc version 4.9.3 =0A=
(crosstool-NG crosstool-ng-1.22.0)) #4 SMP PREEMPT Tue May 8 00:58:27 U=0A=
TC 2018=0A=
CPU: ARMv7 Processor [562f5842] revision 2 (ARMv7), cr=3D10c5387d=0A=
CPU: div instructions available: patching division code=0A=
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache=0A=
OF: fdt: Machine model: SBx81XLEM=0A=
Memory policy: Data cache writealloc=0A=
On node 0 totalpages: 262144=0A=
   Normal zone: 2048 pages used for memmap=0A=
   Normal zone: 0 pages reserved=0A=
   Normal zone: 262144 pages, LIFO batch:31=0A=
random: get_random_bytes called from start_kernel+0x9c/0x400 with =0A=
crng_init=3D0=0A=
percpu: Embedded 15 pages/cpu @(ptrval) s30848 r8192 d22400 u61440=0A=
pcpu-alloc: s30848 r8192 d22400 u61440 alloc=3D15*4096=0A=
pcpu-alloc: [0] 0 [0] 1=0A=
Built 1 zonelists, mobility grouping on.  Total pages: 260096=0A=
Kernel command line: console=3DttyS0,115200 root=3D/dev/ram0 =0A=
releasefile=3D/var/lib/tftpboot/lif_12.rel bootversion=3D5.1.2 loglevel=3D8=
 mtdoop=0A=
s.mtddev=3Derrlog rtctime=3D050800292018.34 reladdr=3D0x1000000,f98f1f=0A=
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)=0A=
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)=0A=
Memory: 1017708K/1048576K available (5120K kernel code, 198K rwdata, =0A=
1488K rodata, 1024K init, 108K bss, 30868K reserved, 0K cma-rese=0A=
rved)=0A=
Virtual kernel memory layout:=0A=
     vector  : 0xffff0000 - 0xffff1000   (   4 kB)=0A=
     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)=0A=
     vmalloc : 0xc0800000 - 0xff800000   (1008 MB)=0A=
     lowmem  : 0x80000000 - 0xc0000000   (1024 MB)=0A=
     modules : 0x7f000000 - 0x80000000   (  16 MB)=0A=
       .text : 0x(ptrval) - 0x(ptrval)   (6112 kB)=0A=
       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)=0A=
       .data : 0x(ptrval) - 0x(ptrval)   ( 199 kB)=0A=
        .bss : 0x(ptrval) - 0x(ptrval)   ( 109 kB)=0A=
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1=0A=
Preemptible hierarchical RCU implementation.=0A=
         RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D2.=0A=
         Tasks RCU enabled.=0A=
RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2=0A=
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16=0A=
L2C: DT/platform modifies aux control register: 0x1a09ef00 -> 0x1a09ef02=0A=
Aurora cache controller enabled, 32 ways, 2048 kB=0A=
Aurora: CACHE_ID 0x00000100, AUX_CTRL 0x1a09ef02=0A=
Switching to timer-based delay loop, resolution 40ns=0A=
sched_clock: 32 bits at 25MHz, resolution 40ns, wraps every 85899345900ns=
=0A=
clocksource: armada_370_xp_clocksource: mask: 0xffffffff max_cycles: =0A=
0xffffffff, max_idle_ns: 76450417870 ns=0A=
Calibrating delay loop (skipped), value calculated using timer =0A=
frequency.. 50.00 BogoMIPS (lpj=3D250000)=0A=
pid_max: default: 32768 minimum: 301=0A=
Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)=0A=
Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)=0A=
CPU: Testing write buffer coherency: ok=0A=
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000=0A=
Setting up static identity map for 0x100000 - 0x100060=0A=
mvebu-soc-id: MVEBU SoC ID=3D0xFC00, Rev=3D0x0=0A=
mvebu-pmsu: Initializing Power Management Service Unit=0A=
Hierarchical SRCU implementation.=0A=
smp: Bringing up secondary CPUs ...=0A=
CPU1: thread -1, cpu 1, socket 0, mpidr 80000001=0A=
smp: Brought up 1 node, 2 CPUs=0A=
SMP: Total of 2 processors activated (100.00 BogoMIPS).=0A=
CPU: All CPU(s) started in SVC mode.=0A=
devtmpfs: initialized=0A=
VFP support v0.3: implementor 56 architecture 2 part 20 variant 9 rev 6=0A=
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, =0A=
max_idle_ns: 19112604462750000 ns=0A=
futex hash table entries: 512 (order: 3, 32768 bytes)=0A=
pinctrl core: initialized pinctrl subsystem=0A=
NET: Registered protocol family 16=0A=
DMA: preallocated 256 KiB pool for atomic coherent allocations=0A=
SCSI subsystem initialized=0A=
usbcore: registered new interface driver usbfs=0A=
usbcore: registered new interface driver hub=0A=
usbcore: registered new device driver usb=0A=
EDAC MC: Ver: 3.0.0=0A=
EDAC DEBUG: edac_mc_sysfs_init: device mc created=0A=
clocksource: Switched to clocksource armada_370_xp_clocksource=0A=
NET: Registered protocol family 2=0A=
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)=0A=
TCP established hash table entries: 8192 (order: 3, 32768 bytes)=0A=
TCP bind hash table entries: 8192 (order: 4, 65536 bytes)=0A=
TCP: Hash tables configured (established 8192 bind 8192)=0A=
UDP hash table entries: 512 (order: 2, 16384 bytes)=0A=
UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)=0A=
NET: Registered protocol family 1=0A=
PCI: CLS 0 bytes, default 64=0A=
Trying to unpack rootfs image as initramfs...=0A=
rootfs image is not initramfs (junk in compressed archive); looks like =0A=
an initrd=0A=
Freeing initrd memory: 13176K=0A=
workingset: timestamp_bits=3D30 max_order=3D18 bucket_order=3D0=0A=
squashfs: version 4.0 (2009/01/31) Phillip Lougher=0A=
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)=0A=
io scheduler noop registered=0A=
io scheduler deadline registered=0A=
io scheduler cfq registered (default)=0A=
io scheduler mq-deadline registered=0A=
io scheduler kyber registered=0A=
armada-xp-pinctrl f1018000.pin-ctrl: registered pinctrl driver=0A=
mvebu-pcie soc:pcie@82000000: PCI host bridge to bus 0000:00=0A=
pci_bus 0000:00: root bus resource [io  0x1000-0xfffff]=0A=
pci_bus 0000:00: root bus resource [mem 0xf8000000-0xffdfffff]=0A=
pci_bus 0000:00: root bus resource [bus 00-ff]=0A=
pci 0000:00:01.0: [11ab:fc00] type 01 class 0x060400=0A=
PCI: bus0: Fast back to back transfers disabled=0A=
pci 0000:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring=
=0A=
pci 0000:01:00.0: [14e4:1656] type 00 class 0x020000=0A=
pci 0000:01:00.0: reg 0x10: [mem 0x94000000-0x9400ffff 64bit pref]=0A=
pci 0000:01:00.0: reg 0x18: [mem 0x94010000-0x9401ffff 64bit pref]=0A=
pci 0000:01:00.0: reg 0x20: [mem 0x94020000-0x9402ffff 64bit pref]=0A=
pci 0000:01:00.0: PME# supported from D0 D3hot D3cold=0A=
pci 0000:01:00.1: [14e4:1656] type 00 class 0x020000=0A=
pci 0000:01:00.1: reg 0x10: [mem 0x94030000-0x9403ffff 64bit pref]=0A=
pci 0000:01:00.1: reg 0x18: [mem 0x94040000-0x9404ffff 64bit pref]=0A=
pci 0000:01:00.1: reg 0x20: [mem 0x94050000-0x9405ffff 64bit pref]=0A=
pci 0000:01:00.1: PME# supported from D0 D3hot D3cold=0A=
PCI: bus1: Fast back to back transfers disabled=0A=
pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01=0A=
pci 0000:00:01.0: BAR 8: assigned [mem 0xf8000000-0xf80fffff]=0A=
pci 0000:01:00.0: BAR 0: assigned [mem 0xf8000000-0xf800ffff 64bit pref]=0A=
pci 0000:01:00.0: BAR 2: assigned [mem 0xf8010000-0xf801ffff 64bit pref]=0A=
pci 0000:01:00.0: BAR 4: assigned [mem 0xf8020000-0xf802ffff 64bit pref]=0A=
pci 0000:01:00.1: BAR 0: assigned [mem 0xf8030000-0xf803ffff 64bit pref]=0A=
pci 0000:01:00.1: BAR 2: assigned [mem 0xf8040000-0xf804ffff 64bit pref]=0A=
pci 0000:01:00.1: BAR 4: assigned [mem 0xf8050000-0xf805ffff 64bit pref]=0A=
pci 0000:00:01.0: PCI bridge to [bus 01]=0A=
pci 0000:00:01.0:   bridge window [mem 0xf8000000-0xf80fffff]=0A=
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled=0A=
console [ttyS0] disabled=0A=
f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq =3D 19, base_baud =3D =0A=
12500000) is a 16550A=0A=
console [ttyS0] enabled=0A=
f1012100.serial: ttyS1 at MMIO 0xf1012100 (irq =3D 20, base_baud =3D =0A=
12500000) is a 16550A=0A=
brd: module loaded=0A=
loop: module loaded=0A=
nand: nand_flash_detect_onfi:=0A=
00000000: 4f 4e 46 49 02 00 18 00 3f 00 00 00 00 00 00 00  ONFI....?.......=
=0A=
00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
00000020: 4d 49 43 52 4f 4e 20 20 20 20 20 20 4d 54 32 39  MICRON      MT29=
=0A=
00000030: 46 38 47 30 38 41 42 41 43 41 57 50 20 20 20 20  F8G08ABACAWP=0A=
00000040: 2c 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ,...............=
=0A=
00000050: 00 10 00 00 e0 00 00 04 00 00 38 00 40 00 00 00  ..........8.@...=
=0A=
00000060: 00 10 00 00 01 23 01 50 00 06 04 01 00 00 04 00  .....#.P........=
=0A=
00000070: 08 01 0e 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
00000080: 0a 3f 00 3f 00 58 02 10 27 19 00 64 00 00 00 00  .?.?.X..'..d....=
=0A=
00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
000000a0: 00 00 00 00 01 00 01 00 00 02 04 80 01 81 04 01  ................=
=0A=
000000b0: 02 01 0a 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................=
=0A=
000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 8e 3d  ...............=
=3D=0A=
=0A=
CP> my debug dumping the ONFI params=0A=
=0A=
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd3=0A=
nand: Micron MT29F8G08ABACAWP=0A=
nand: 1024 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224=0A=
Bad block table found at page 262080, version 0x01=0A=
Bad block table found at page 262016, version 0x01=0A=
3 fixed-partitions partitions found on MTD device pxa3xx_nand-0=0A=
Creating 3 MTD partitions on "pxa3xx_nand-0":=0A=
0x000000000000-0x00003f800000 : "user"=0A=
0x00003f800000-0x00003fc00000 : "errlog"=0A=
mtdoops: ready 0, 1 (no erase)=0A=
mtdoops: Attached to MTD device 1=0A=
0x00003fc00000-0x000040000000 : "nand-bbt"=0A=
m25p80 spi0.0: m25p128 (16384 Kbytes)=0A=
3 fixed-partitions partitions found on MTD device spi0.0=0A=
Creating 3 MTD partitions on "spi0.0":=0A=
0x000000000000-0x000000100000 : "u-boot"=0A=
0x000000100000-0x000000140000 : "u-boot-env"=0A=
0x000000140000-0x000001000000 : "unused"=0A=
libphy: Fixed MDIO Bus: probed=0A=
libphy: orion_mdio_bus: probed=0A=
usbcore: registered new interface driver asix=0A=
usbcore: registered new interface driver cdc_ether=0A=
usbcore: registered new interface driver smsc75xx=0A=
usbcore: registered new interface driver usb-storage=0A=
i2c /dev entries driver=0A=
i2c i2c-0: Added multiplexed i2c bus 1=0A=
i2c i2c-0: Added multiplexed i2c bus 2=0A=
i2c i2c-0: Added multiplexed i2c bus 3=0A=
i2c i2c-0: Added multiplexed i2c bus 4=0A=
i2c i2c-0: Added multiplexed i2c bus 5=0A=
i2c i2c-0: Added multiplexed i2c bus 6=0A=
i2c i2c-0: Added multiplexed i2c bus 7=0A=
i2c i2c-0: Added multiplexed i2c bus 8=0A=
pca954x 0-0071: registered 8 multiplexed busses for I2C switch pca9548=0A=
i2c i2c-0: Added multiplexed i2c bus 9=0A=
i2c i2c-0: Added multiplexed i2c bus 10=0A=
i2c i2c-0: Added multiplexed i2c bus 11=0A=
i2c i2c-0: Added multiplexed i2c bus 12=0A=
i2c i2c-0: Added multiplexed i2c bus 13=0A=
i2c i2c-0: Added multiplexed i2c bus 14=0A=
i2c i2c-0: Added multiplexed i2c bus 15=0A=
i2c i2c-0: Added multiplexed i2c bus 16=0A=
pca954x 0-0072: registered 8 multiplexed busses for I2C switch pca9548=0A=
orion_wdt: Initial timeout 171 sec=0A=
ipip: IPv4 and MPLS over IPv4 tunneling driver=0A=
Initializing XFRM netlink socket=0A=
NET: Registered protocol family 10=0A=
Segment Routing with IPv6=0A=
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver=0A=
NET: Registered protocol family 17=0A=
NET: Registered protocol family 15=0A=
Registering SWP/SWPB emulation handler=0A=
registered taskstats version 1=0A=
RAMDISK: squashfs filesystem found at block 0=0A=
RAMDISK: Loading 13174KiB [1 disk] into ram disk... -=0A=
\=0A=
done.=0A=
VFS: Mounted root (squashfs filesystem) readonly on device 1:0.=0A=
devtmpfs: mounted=0A=
Freeing unused kernel memory: 1024K=0A=
overlayfs: upper fs does not support xattr, falling back to index=3Doff.=0A=
overlayfs: upper fs does not support xattr, falling back to index=3Doff.=0A=
overlayfs: upper fs does not support xattr, falling back to index=3Doff.=0A=
systemd[1]: System time before build time, advancing clock.=0A=
systemd[1]: Failed to insert module 'autofs4': No such file or directory=0A=
systemd[1]: systemd 234 running in system mode. (-PAM -AUDIT -SELINUX =0A=
-IMA -APPARMOR -SMACK -SYSVINIT -UTMP -LIBCRYPTSETUP -GCRYPT -G=0A=
NUTLS -ACL -XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN =0A=
default-hierarchy=3Dhybrid)=0A=
systemd[1]: Detected architecture arm.=0A=
=0A=
  Linux=0A=
=0A=
systemd[1]: Set hostname to <awplus>.=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
systemd[1]: Initializing machine ID from random generator.=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
systemd[1]: Reached target Timers.=0A=
[  OK  ] Reached target Timers.=0A=
random: systemd: uninitialized urandom read (16 bytes read)=0A=
systemd[1]: Listening on udev Control Socket.=0A=
[  OK  ] Listening on udev Control Socket.=0A=
systemd[1]: Reached target Swap.=0A=
[  OK  ] Reached target Swap.=0A=
systemd[1]: Created slice System Slice.=0A=
[  OK  ] Created slice System Slice.=0A=
systemd[1]: Mounting Kernel Debug File System...=0A=
          Mounting Kernel Debug File System...=0A=
systemd[1]: Listening on Syslog Socket.=0A=
[  OK  ] Listening on Syslog Socket.=0A=
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.=0A=
[  OK  ] Listening on Journal Socket (/dev/log).=0A=
[  OK  ] Started Forward Password Requests to Wall Directory Watch.=0A=
[  OK  ] Listening on udev Kernel Socket.=0A=
[  OK  ] Listening on Journal Socket.=0A=
          Starting Journal Service...=0A=
[  OK  ] Reached target Sockets.=0A=
          Starting udev Coldplug all Devices...=0A=
          Starting Remount Root and Kernel File Systems...=0A=
[  OK  ] Started Dispatch Password Requests to Console Directory Watch.=0A=
[  OK  ] Reached target Paths.=0A=
[  OK  ] Created slice system-serial\x2dgetty.slice.=0A=
          Starting udev Kernel Device Manager...=0A=
          Starting Apply Kernel Variables...=0A=
[  OK  ] Reached target Slices.=0A=
[  OK  ] Mounted Kernel Debug File System.=0A=
[  OK  ] Started Remount Root and Kernel File Systems.=0A=
[  OK  ] Started Journal Service.=0A=
          Starting Flush Journal to Persistent Storage...=0A=
[  OK  ] Reached target Local File Systems (Pre).=0A=
          Mounting /tmp...=0A=
[  OK  ] Mounted /tmp.=0A=
          Starting Linuxbox Startup...=0A=
[  OK  ] Reached target Local File Systems.=0A=
          Starting Update is Completed...=0A=
[  OK  ] Started udev Coldplug all Devices.=0A=
[  OK  ] Started Applysystemd-journald[650]: Received request to flush =0A=
runtime journal from PID 1=0A=
  Kernel Variables.=0A=
[  OK  ] Started Flush Journal to Persistent Storage.=0A=
Mounting static filesystems...                          [  OK  ] Started =
=0A=
udev Kernel Device Manager.=0A=
[  OK  ] Started Update is Completed.=0A=
[  OK  ]=0A=
[  OK  ] Found device /dev/ttyS0.=0A=
[  OK  ] Found device /dev/ttyS1.=0A=
Attaching to /dev/mtd0...                               ubi0: attaching mtd=
0=0A=
ubi0: scanning is finished=0A=
ubi0: empty MTD device detected=0A=
ubi0: attached mtd0 (name "user", size 1016 MiB)=0A=
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes=0A=
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096=0A=
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192=0A=
ubi0: good PEBs: 4064, bad PEBs: 0, corrupted PEBs: 0=0A=
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128=0A=
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence =0A=
number: 446481738=0A=
ubi0: available PEBs: 3980, total reserved PEBs: 84, PEBs reserved for =0A=
bad PEB handling: 80=0A=
ubi0: background thread "ubi_bgt0d" started, PID 1039=0A=
[  OK  ]=0A=
Mounting file system...                                 [ INFO ]=0A=
random: fast init done=0A=
  +----------------------------------------------------+    |=0A=
  | mount: mounting ubi0:user on /flash failed: No suc |----+=0A=
  | h device                                           |=0A=
  | The user flash filesystem is corrupt.              |=0A=
  | The system will now erase and re-format the flash  |=0A=
  | filesystem.                                        |=0A=
  +----------------------------------------------------+=0A=
=0A=
CP> This is expected since the chip was erased before this boot.=0A=
=0A=
Creating empty flash filesystem image...                [  OK  ]=0A=
ubi0: detaching mtd0=0A=
ubi0: mtd0 is detached=0A=
Formatting /dev/mtd0...                                 [  OK  ]=0A=
Attaching to /dev/mtd0...                               ubi0: attaching mtd=
0=0A=
ubi0: scanning is finished=0A=
ubi0: attached mtd0 (name "user", size 1016 MiB)=0A=
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes=0A=
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096=0A=
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192=0A=
ubi0: good PEBs: 4064, bad PEBs: 0, corrupted PEBs: 0=0A=
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128=0A=
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence =0A=
number: 1680402752=0A=
ubi0: available PEBs: 3980, total reserved PEBs: 84, PEBs reserved for =0A=
bad PEB handling: 80=0A=
ubi0: background thread "ubi_bgt0d" started, PID 1074=0A=
[  OK  ]=0A=
Creating volume...                                      [  OK  ]=0A=
Updating volume...                                      [  OK  ]=0A=
Re-mounting file system...                              UBIFS (ubi0:0): =0A=
background thread "ubifs_bgt0_0" started, PID 1087=0A=
UBIFS (ubi0:0): start fixing up free space=0A=
UBIFS (ubi0:0): free space fixup complete=0A=
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "user"=0A=
UBIFS (ubi0:0): LEB size: 253952 bytes (248 KiB), min./max. I/O unit =0A=
sizes: 4096 bytes/4096 bytes=0A=
UBIFS (ubi0:0): FS size: 1008189440 bytes (961 MiB, 3970 LEBs), journal =0A=
size 9404416 bytes (8 MiB, 38 LEBs)=0A=
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)=0A=
UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID =0A=
56D01DE4-B181-42C6-9DA1-02C1C86622EF, small LPT model=0A=
UBIFS error (ubi0:0 pid 1084): ubifs_read_node: bad node type (9 but =0A=
expected 0)=0A=
UBIFS error (ubi0:0 pid 1084): ubifs_read_node: bad node at LEB 10:0, =0A=
LEB mapping status 1=0A=
         magic          0x6101831=0A=
         crc            0x7532a597=0A=
         node_type      9 (indexing node)=0A=
         group_type     0 (no node group)=0A=
         sqnum          3=0A=
         len            48=0A=
         child_cnt      1=0A=
         level          0=0A=
         Branches:=0A=
         0: LEB 10:0 len 160 key (1, inode)=0A=
CPU: 0 PID: 1084 Comm: mount Not tainted 4.17.0-rc4-at1+ #4=0A=
Hardware name: Marvell Armada 370/XP (Device Tree)=0A=
[<80110f40>] (unwind_backtrace) from [<8010c350>] (show_stack+0x10/0x14)=0A=
[<8010c350>] (show_stack) from [<805c1474>] (dump_stack+0x88/0x9c)=0A=
[<805c1474>] (dump_stack) from [<802ccc80>] (ubifs_read_node+0x130/0x284)=
=0A=
[<802ccc80>] (ubifs_read_node) from [<802e8ee8>] =0A=
(ubifs_tnc_read_node+0xcc/0xd4)=0A=
[<802e8ee8>] (ubifs_tnc_read_node) from [<802d0098>] =0A=
(ubifs_tnc_locate+0x1c4/0x1ec)=0A=
[<802d0098>] (ubifs_tnc_locate) from [<802c80f8>] (ubifs_iget+0x98/0x56c)=
=0A=
[<802c80f8>] (ubifs_iget) from [<802c88c0>] (ubifs_mount+0x2f4/0x1594)=0A=
[<802c88c0>] (ubifs_mount) from [<801eefe8>] (mount_fs+0x14/0xa4)=0A=
[<801eefe8>] (mount_fs) from [<8020a448>] (vfs_kern_mount+0x4c/0xf4)=0A=
[<8020a448>] (vfs_kern_mount) from [<8020d5fc>] (do_mount+0x184/0xb98)=0A=
[<8020d5fc>] (do_mount) from [<8020e390>] (ksys_mount+0x8c/0xbc)=0A=
[<8020e390>] (ksys_mount) from [<80101000>] (ret_fast_syscall+0x0/0x54)=0A=
Exception stack(0xbda0ffa8 to 0xbda0fff0)=0A=
ffa0:                   00000000 00000000 7ef62f4e 7ef62f60 7ef62f48 =0A=
00008010=0A=
ffc0: 00000000 00000000 7ef62f48 00000015 7ef62f4e 00008010 00000000 =0A=
000a5f44=0A=
ffe0: 76da91b0 7ef62af0 00046020 76da91c0=0A=
UBIFS error (ubi0:0 pid 1084): ubifs_iget: failed to read inode 1, error -2=
2=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops=0A=
[FAILED]=0A=
  +----------------------------------------------------+    |=0A=
  | mount: mounting ubi0:user on /flash failed: Invali |----+=0A=
  | d argument                                         |=0A=
  +----------------------------------------------------+=0A=
Checking for last gasp debug output...                  [  OK  ]=0A=
/sbin/fs-local-setup: line 374: can't create =0A=
/flash/.configs/upstart.conf: nonexistent directory=0A=
touch: /flash/.configs/localtime: No such file or directory=0A=
chmod: /flash/.configs/localtime: No such file or directory=0A=
mkdir: can't create directory '/flash/.nvs': Read-only file system=0A=
mount: mounting /flash/.nvs on /nvs failed: No such file or directory=0A=
[  OK  ] Started Linuxbox Startup.=0A=
[  OK  ] Reached target System Initialization.=0A=
[  OK  ] Reached target Basic System.=0A=
[  OK  ] Started Serial Getty on ttyS0.=0A=
          Starting crond...=0A=
          Starting apteryx...=0A=
[  OK  ] Started Serial Getty on ttyS1.=0A=
          Starting syslog-ng...=0A=
[  OK  ] Started inetd.=0A=
          Starting Install test files...=0A=
[  OK  ] Started crond.=0A=
[  OK  ] Started apteryx.=0A=
          Starting StrongSwan IPsec...=0A=
[  OK  ] Started logconf.=0A=
[  OK  ] Started Install test files.=0A=
[  OK  ] Started StrongSwan IPsec.=0A=
[  OK  ] Started syslog-ng.=0A=
[  OK  ] Reached target Multi-User System.=0A=
[  OK  ] Reached target Login Prompts.=0A=
=0A=
linuxbox login: root=0A=
[root@linuxbox ~]# cat /sys/class/mtd/mtd0/ecc_strength=0A=
16=0A=
[root@linuxbox ~]# cat /sys/class/mtd/mtd0/ecc_step_size=0A=
1024=0A=
=0A=
>>=0A=
>>>=0A=
>>> Are you sure Linux ECC configuration is aligned with the bootloader's?=
=0A=
>>=0A=
>> In this case the bootloader doesn't have any NAND support enabled since=
=0A=
>> this board is always network booting.=0A=
>>=0A=
>> It is likely that an older kernel has set this up with ecc-strength=3D4.=
=0A=
>> Does flash_erase destroy the ecc data as well or is there some other=0A=
>> mtd-util to do this from userland?=0A=
> =0A=
> There's no metadata describing the ECC setup to use. flash_erase should=
=0A=
> place the NAND is a clean state.=0A=
> =0A=
>>=0A=
>> That got me thinking. I ran with the new driver but the following added=
=0A=
>> to the dts=0A=
>>=0A=
>> +       nand-ecc-strength =3D <4>;=0A=
>> +       nand-ecc-step-size =3D <512>;=0A=
>>=0A=
>> After an erase/re-init things were working.=0A=
>>=0A=
>> But then if I have nothing (auto-select) or nand-ecc-strength =3D <8>=0A=
>> (which would be "correct" for this chip) in the dts I get the errors abo=
ve.=0A=
> =0A=
> Maybe a problem with the 16bits/1024bytes layout, but what's weird is=0A=
> that the driver does not report ECC errors.=0A=
> =0A=
=0A=
Maybe. I've stumbled across little differences between Armada-38x and =0A=
98DX4251 before but they are mostly to do with the fact the clock =0A=
control is moved. I haven't struck anything where the NFC has different =0A=
behaviour (until now).=0A=
=0A=
The old pxa3xx driver seems happy with the 16bits/1024bytes. Unless it's =
=0A=
lying to me and falling back to 16/2048.=0A=
