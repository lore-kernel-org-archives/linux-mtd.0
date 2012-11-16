Received: from mx1.riseup.net ([198.252.153.129])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZOU9-0000fp-5L
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 16:09:44 +0000
From: micah anderson <micah@riseup.net>
To: dedekind1@gmail.com
Subject: Re: UBIFS error (pid 564): read_znode: bad indexing node at LEB
 484:66064, error 2
In-Reply-To: <1353054666.3618.6.camel@sauron.fi.intel.com>
References: <87625h85fd.fsf@minnow.riseup.net>
 <1353054666.3618.6.camel@sauron.fi.intel.com>
Date: Fri, 16 Nov 2012 11:09:32 -0500
Message-ID: <87obixil6r.fsf@minnow.riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Wed, 2012-11-07 at 16:32 -0500, Micah Anderson wrote:
>> I had a power outage yesterday. When things came back and I tried to
>> boot my guruplug, I am not getting the following:
>>=20
>> [   97.273764] UBIFS error (pid 564): read_znode: bad indexing node at L=
EB 484:66064, error 2
>> [   97.282188] UBIFS warning (pid 564): ubifs_ro_mode: switched to read-=
only mode, error -22
>> [   97.290431] UBIFS error (pid 564): ubifs_budget_space: cannot budget =
space, error -22
>
> I'd need to see entire log, no -ENOCLUE with this amount of input.

Ok, this is the rest of dmesg, I'm happy to provide any other
information I can:

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.32-5-kirkwood (Debian 2.6.32-45) (dannf@de=
bian.org) (gcc version 4.3.5 (Debian 4.3.5-4) ) #1 Sun May 6 16:57:51 UTC 2=
012
[    0.000000] CPU: Feroceon 88FR131 [56251311] revision 1 (ARMv5TE), cr=3D=
00053977
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: Marvell GuruPlug Reference Board
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 131072
[    0.000000] free_area_init_node: node 0, pgdat c03d50c4, node_mem_map c0=
442000
[    0.000000]   Normal zone: 1024 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 130048 pages, LIFO batch:31
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 130048
[    0.000000] Kernel command line: console=3DttyS0,115200 ubi.mtd=3D2 root=
=3Dubi0:rootfs rootfstype=3Dubifs
[    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 byt=
es)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 byte=
s)
[    0.000000] Memory: 256MB 256MB =3D 512MB total
[    0.000000] Memory: 515200KB available (3516K code, 583K data, 124K init=
, 0K highmem)
[    0.000000] SLUB: Genslabs=3D11, HWalign=3D32, Order=3D0-3, MinObjects=
=3D0, CPUs=3D1, Nodes=3D1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:114
[    0.000000] Console: colour dummy device 80x30
[    0.000123] Calibrating delay loop... 1192.75 BogoMIPS (lpj=3D5963776)
[    0.240077] Security Framework initialized
[    0.240097] SELinux:  Disabled at boot.
[    0.240118] Mount-cache hash table entries: 512
[    0.240377] Initializing cgroup subsys ns
[    0.240390] Initializing cgroup subsys cpuacct
[    0.240399] Initializing cgroup subsys devices
[    0.240408] Initializing cgroup subsys freezer
[    0.240415] Initializing cgroup subsys net_cls
[    0.240456] CPU: Testing write buffer coherency: ok
[    0.241012] devtmpfs: initialized
[    0.242422] regulator: core version 0.5
[    0.242593] NET: Registered protocol family 16
[    0.242981] Kirkwood: MV88F6281-A1, TCLK=3D200000000.
[    0.242993] Feroceon L2: Cache support initialised.
[    0.243396] initial MPP regs: 01111111 11113311 33331111 33333333 000033=
33 00000222 00000000
[    0.243418]   final MPP regs: 01111111 11113311 33331111 33333333 000033=
33 00000222 00000000
[    0.244951] bio: create slab <bio-0> at 0
[    0.245241] vgaarb: loaded
[    0.245700] Switching to clocksource orion_clocksource
[    0.249628] NET: Registered protocol family 2
[    0.249867] IP route cache hash table entries: 4096 (order: 2, 16384 byt=
es)
[    0.250700] TCP established hash table entries: 16384 (order: 5, 131072 =
bytes)
[    0.251054] TCP bind hash table entries: 16384 (order: 4, 65536 bytes)
[    0.251234] TCP: Hash tables configured (established 16384 bind 16384)
[    0.251243] TCP reno registered
[    0.251393] NET: Registered protocol family 1
[    0.251645] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.251880] audit: initializing netlink socket (disabled)
[    0.251907] type=3D2000 audit(0.244:1): initialized
[    0.258400] VFS: Disk quotas dquot_6.5.2
[    0.258665] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.258763] JFFS2 version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Red Ha=
t, Inc.
[    0.259404] msgmni has been set to 1006
[    0.261080] alg: No test for stdrng (krng)
[    0.261199] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 253)
[    0.261211] io scheduler noop registered
[    0.261219] io scheduler anticipatory registered
[    0.261226] io scheduler deadline registered
[    0.261412] io scheduler cfq registered (default)
[    0.267448] Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
[    0.267915] serial8250.0: ttyS0 at MMIO 0xf1012000 (irq =3D 33) is a 165=
50A
[    0.579620] console [ttyS0] enabled
[    0.583689] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung N=
AND 512MiB 3,3V 8-bit)
[    0.592386] Scanning device for bad blocks
[    0.748304] Creating 3 MTD partitions on "orion_nand":
[    0.753470] 0x000000000000-0x000000100000 : "u-boot"
[    0.759032] 0x000000100000-0x000000500000 : "uImage"
[    0.764497] 0x000000500000-0x000020000000 : "root"
[    0.770376] UBI: attaching mtd2 to ubi0
[    0.774229] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.780540] UBI: logical eraseblock size:    129024 bytes
[    0.785972] UBI: smallest flash I/O unit:    2048
[    0.790698] UBI: sub-page size:              512
[    0.795337] UBI: VID header offset:          512 (aligned 512)
[    0.801205] UBI: data offset:                2048
[    1.604406] UBI: attached mtd2 to ubi0
[    1.608204] UBI: MTD device name:            "root"
[    1.613107] UBI: MTD device size:            507 MiB
[    1.618106] UBI: number of good PEBs:        4056
[    1.622829] UBI: number of bad PEBs:         0
[    1.627303] UBI: max. allowed volumes:       128
[    1.631942] UBI: wear-leveling threshold:    4096
[    1.636677] UBI: number of internal volumes: 1
[    1.641142] UBI: number of user volumes:     1
[    1.645606] UBI: available PEBs:             0
[    1.650079] UBI: total number of reserved PEBs: 4056
[    1.655068] UBI: number of PEBs reserved for bad PEB handling: 40
[    1.661198] UBI: max/mean erase counter: 268/53
[    1.665758] UBI: image sequence number: 0
[    1.669795] UBI: background thread "ubi_bgt0d" started, PID 26
[    1.676037] mice: PS/2 mouse device common for all mice
[    1.681512] rtc-mv rtc-mv: rtc core: registered rtc-mv as rtc0
[    1.687462] i2c /dev entries driver
[    1.691140] cpuidle: using governor ladder
[    1.695362] cpuidle: using governor menu
[    1.699427] Registered led device: guruplug:red:health
[    1.704661] Registered led device: guruplug:green:health
[    1.710069] Registered led device: guruplug:red:wmode
[    1.715197] Registered led device: guruplug:green:wmode
[    1.720508] mv_xor_shared mv_xor_shared.0: Marvell shared XOR driver
[    1.726927] mv_xor_shared mv_xor_shared.1: Marvell shared XOR driver
[    1.765770] mv_xor mv_xor.0: Marvell XOR: ( xor cpy )
[    1.805766] mv_xor mv_xor.1: Marvell XOR: ( xor fill cpy )
[    1.845765] mv_xor mv_xor.2: Marvell XOR: ( xor cpy )
[    1.885765] mv_xor mv_xor.3: Marvell XOR: ( xor fill cpy )
[    1.892460] TCP cubic registered
[    1.895706] NET: Registered protocol family 17
[    1.900202] Gating clock of unused units
[    1.900211] before: 0x00dfc3fd
[    1.900217]  after: 0x00cf41d9
[    1.900522] registered taskstats version 1
[    1.905286] rtc-mv rtc-mv: setting system clock to 2012-11-07 17:05:13 U=
TC (1352307913)
[    1.913397] Initalizing network drop monitor service
[    1.970194] UBIFS: recovery needed
[    2.054842] UBIFS: recovery completed
[    2.058547] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    2.064589] UBIFS: file system size:   515708928 bytes (503622 KiB, 491 =
MiB, 3997 LEBs)
[    2.072637] UBIFS: journal size:       25804800 bytes (25200 KiB, 24 MiB=
, 200 LEBs)
[    2.080335] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    2.086202] UBIFS: default compressor: lzo
[    2.090318] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[    2.096666] VFS: Mounted root (ubifs filesystem) on device 0:13.
[    2.102730] Freeing init memory: 124K
[    3.445934] SCSI subsystem initialized
[    3.477005] MV-643xx 10/100/1000 ethernet driver version 1.4
[    3.484088] mv643xx_eth smi: probed
[    3.518194] net eth0: port 0 with MAC address 02:50:43:1a:72:43
[    3.593089] net eth1: port 0 with MAC address 02:50:43:ab:d2:bc
[    3.608671] usbcore: registered new interface driver usbfs
[    3.615480] usbcore: registered new interface driver hub
[    3.632689] usbcore: registered new device driver usb
[    3.883414] libata version 3.00 loaded.
[    3.936409] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    4.008432] mmc0: mvsdio driver initialized, lacking card detect (fall b=
ack to polling)
[    4.017723] orion-ehci orion-ehci.0: Marvell Orion EHCI
[    4.023030] orion-ehci orion-ehci.0: new USB bus registered, assigned bu=
s number 1
[    4.056758] orion-ehci orion-ehci.0: irq 19, io mem 0xf1050000
[    4.075748] orion-ehci orion-ehci.0: USB 2.0 started, EHCI 1.00
[    4.081769] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    4.088613] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.095881] usb usb1: Product: Marvell Orion EHCI
[    4.100603] usb usb1: Manufacturer: Linux 2.6.32-5-kirkwood ehci_hcd
[    4.106996] usb usb1: SerialNumber: orion-ehci.0
[    4.112213] usb usb1: configuration #1 chosen from 1 choice
[    4.118172] hub 1-0:1.0: USB hub found
[    4.122425] hub 1-0:1.0: 1 port detected
[    4.126651] sata_mv sata_mv.0: version 1.28
[    4.135176] sata_mv sata_mv.0: slots 32 ports 1
[    4.142917] mmc0: new high speed SDIO card at address 0001
[    4.157391] scsi0 : sata_mv
[    4.172895] ata1: SATA max UDMA/133 irq 21
[    4.445742] usb 1-1: new high speed USB device using orion-ehci and addr=
ess 2
[    4.597159] usb 1-1: New USB device found, idVendor=3D05e3, idProduct=3D=
0608
[    4.603897] usb 1-1: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    4.611076] usb 1-1: Product: USB2.0 Hub
[    4.616452] usb 1-1: configuration #1 chosen from 1 choice
[    4.625702] hub 1-1:1.0: USB hub found
[    4.630290] hub 1-1:1.0: 4 ports detected
[    4.815757] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl F300)
[    4.822827] ata1.15: Port Multiplier 1.1, 0x197b:0x2352 r0, 2 ports, fea=
t 0x0/0x0
[    4.830362] ata1.15: Asynchronous notification not supported, hotplug wo=
n't
[    4.830369]          work on fan-out ports. Use warm-plug instead.
[    4.844451] ata1.00: hard resetting link
[    4.865779] ata1.00: failed to read SCR 2 (Emask=3D0x40)
[    4.870970] ata1.00: COMRESET failed (errno=3D-5)
[    4.875526] ata1.00: failed to read SCR 0 (Emask=3D0x40)
[    4.880700] ata1.00: reset failed, giving up
[    4.884991] ata1.15: hard resetting link
[    4.946180] usb 1-1.1: new high speed USB device using orion-ehci and ad=
dress 3
[    5.067664] usb 1-1.1: New USB device found, idVendor=3D05e3, idProduct=
=3D0726
[    5.074576] usb 1-1.1: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D2
[    5.081933] usb 1-1.1: Product: USB Storage
[    5.086171] usb 1-1.1: SerialNumber: 000000009909
[    5.092703] usb 1-1.1: configuration #1 chosen from 1 choice
[    5.150757] Initializing USB Mass Storage driver...
[    5.156017] scsi1 : SCSI emulation for USB Mass Storage devices
[    5.162584] usbcore: registered new interface driver usb-storage
[    5.168653] USB Mass Storage support registered.
[    5.173912] usb-storage: device found at 3
[    5.173921] usb-storage: waiting for device to settle before scanning
[    5.186077] usb 1-1.2: new full speed USB device using orion-ehci and ad=
dress 4
[    5.403031] usb 1-1.2: New USB device found, idVendor=3D08bb, idProduct=
=3D2902
[    5.409959] usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    5.417336] usb 1-1.2: Product: USB Audio CODEC=20
[    5.421972] usb 1-1.2: Manufacturer: Burr-Brown from TI=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
[    5.430236] usb 1-1.2: configuration #1 chosen from 1 choice
[    5.512564] ata1.15: SATA link up 3.0 Gbps (SStatus 123 SControl F300)
[    9.845745] ata1.00: hard resetting link
[   10.166149] usb-storage: device scan complete
[   10.186873] scsi 1:0:0:0: Direct-Access     Generic  STORAGE DEVICE   99=
09 PQ: 0 ANSI: 0
[   10.195583] scsi 1:0:0:1: Direct-Access     Generic  STORAGE DEVICE   99=
09 PQ: 0 ANSI: 0
[   10.356036] ata1.01: hard resetting link
[   10.745779] ata1.00: ATA-8: WDC WD20EARS-00MVWB0, 51.0AB51, max UDMA/133
[   10.752518] ata1.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 31/32)
[   10.815835] ata1.00: configured for UDMA/133
[   10.820228] ata1: EH complete
[   10.823486] scsi 0:0:0:0: Direct-Access     ATA      WDC WD20EARS-00M 51=
.0 PQ: 0 ANSI: 5
[   10.883713] usbcore: registered new interface driver hiddev
[   10.972170] input: Burr-Brown from TI               USB Audio CODEC  as =
/devices/platform/orion-ehci.0/usb1/1-1/1-1.2/1-1.2:1.3/input/input0
[   10.991779] generic-usb 0003:08BB:2902.0001: input,hidraw0: USB HID v1.0=
0 Device [Burr-Brown from TI               USB Audio CODEC ] on usb-orion-e=
hci.0-1.2/input3
[   11.006596] usbcore: registered new interface driver usbhid
[   11.047319] usbhid: v2.6:USB HID core driver
[   11.071099] sd 1:0:0:0: [sda] Attached SCSI removable disk
[   11.076809] sd 0:0:0:0: [sdc] 3907029168 512-byte logical blocks: (2.00 =
TB/1.81 TiB)
[   11.101554] sd 0:0:0:0: [sdc] Write Protect is off
[   11.106418] sd 0:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[   11.106575] sd 0:0:0:0: [sdc] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[   11.121727] sd 1:0:0:1: [sdb] Attached SCSI removable disk
[   11.139854] uap_probe: vendor=3D0x02DF device=3D0x9104 class=3D0 functio=
n=3D1
[   11.146981]  sdc:
[   11.225083] uap_sdio mmc0:0001:1: firmware: requesting mrvl/helper_sd.bin
[   11.296330] uap_sdio mmc0:0001:1: firmware: requesting mrvl/sd8688_ap.bin
[   11.558453]  sdc1
[   11.564018] sd 0:0:0:0: [sdc] Attached SCSI disk
[   11.780456] Bluetooth: Core ver 2.15
[   11.794745] NET: Registered protocol family 31
[   11.799264] Bluetooth: HCI device and connection manager initialized
[   11.805697] Bluetooth: HCI socket layer initialized
[   11.878481] UAP FW is active
[   12.188427] usbcore: registered new interface driver snd-usb-audio
[   12.874464] Bluetooth: vendor=3D0x2df, device=3D0x9105, class=3D255, fn=
=3D2
[   13.362045] device-mapper: uevent: version 1.0.3
[   13.369264] device-mapper: ioctl: 4.15.0-ioctl (2009-04-01) initialised:=
 dm-devel@redhat.com
[   13.761546] NET: Registered protocol family 10
[   15.117415] ADDRCONF(NETDEV_UP): eth0: link is not ready
[   97.273764] UBIFS error (pid 564): read_znode: bad indexing node at LEB =
484:66064, error 2
[   97.282188] UBIFS warning (pid 564): ubifs_ro_mode: switched to read-onl=
y mode, error -22
[   97.290431] UBIFS error (pid 564): ubifs_budget_space: cannot budget spa=
ce, error -22
[   97.304855] UBIFS error (pid 571): make_reservation: cannot reserve 216 =
bytes in jhead 1, error -30
[   97.390253] UBIFS error (pid 591): make_reservation: cannot reserve 400 =
bytes in jhead 1, error -30
[   97.406090] UBIFS error (pid 591): ubifs_create: cannot create regular f=
ile, error -30
[  107.722236] UBIFS error (pid 596): make_reservation: cannot reserve 400 =
bytes in jhead 1, error -30
[  107.807325] UBIFS error (pid 517): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  107.816475] UBIFS error (pid 517): ubifs_create: cannot create regular f=
ile, error -30
[  107.976677] UBIFS error (pid 647): make_reservation: cannot reserve 216 =
bytes in jhead 1, error -30
[  108.113381] UBIFS error (pid 669): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  108.135235] UBIFS error (pid 670): make_reservation: cannot reserve 216 =
bytes in jhead 1, error -30
[  108.350668] UBIFS error (pid 698): make_reservation: cannot reserve 384 =
bytes in jhead 1, error -30
[  108.365953] UBIFS error (pid 698): ubifs_create: cannot create regular f=
ile, error -30
[  108.374595] UBIFS error (pid 698): make_reservation: cannot reserve 384 =
bytes in jhead 1, error -30
[  108.398965] UBIFS error (pid 698): ubifs_create: cannot create regular f=
ile, error -30
[  108.519943] UBIFS error (pid 713): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  108.536986] UBIFS error (pid 714): make_reservation: cannot reserve 464 =
bytes in jhead 1, error -30
[  108.554406] UBIFS error (pid 715): make_reservation: cannot reserve 464 =
bytes in jhead 1, error -30
[  108.570767] UBIFS error (pid 716): make_reservation: cannot reserve 464 =
bytes in jhead 1, error -30
[  108.592794] UBIFS error (pid 717): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  108.601949] UBIFS error (pid 717): ubifs_create: cannot create regular f=
ile, error -30
[  108.620693] UBIFS error (pid 720): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  108.629864] UBIFS error (pid 720): ubifs_create: cannot create regular f=
ile, error -30
[  108.653318] UBIFS error (pid 722): make_reservation: cannot reserve 384 =
bytes in jhead 1, error -30
[  108.664742] UBIFS error (pid 698): make_reservation: cannot reserve 216 =
bytes in jhead 1, error -30
[  118.550352] UBIFS error (pid 724): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  118.559489] UBIFS error (pid 724): ubifs_create: cannot create regular f=
ile, error -30
[  141.175744] UBIFS error (pid 208): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  141.184840] UBIFS error (pid 208): ubifs_write_inode: can't write inode =
20658, error -30
[  141.192992] UBIFS error (pid 208): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  141.202090] UBIFS error (pid 208): ubifs_write_inode: can't write inode =
5606, error -30
[  141.210153] UBIFS error (pid 208): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  141.219251] UBIFS error (pid 208): ubifs_write_inode: can't write inode =
198294, error -30
[  141.227487] UBIFS error (pid 208): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  141.236586] UBIFS error (pid 208): ubifs_write_inode: can't write inode =
198405, error -30
[  418.685011] UBIFS error (pid 748): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  418.717582] UBIFS error (pid 748): ubifs_create: cannot create regular f=
ile, error -30
[  418.892370] UBIFS error (pid 765): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  418.913617] UBIFS error (pid 749): make_reservation: cannot reserve 400 =
bytes in jhead 1, error -30
[  418.950102] UBIFS error (pid 765): ubifs_create: cannot create regular f=
ile, error -30
[  418.968897] UBIFS error (pid 766): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  419.013688] UBIFS error (pid 766): ubifs_create: cannot create regular f=
ile, error -30
[  419.132993] UBIFS error (pid 785): ubifs_budget_space: cannot budget spa=
ce, error -30
[  419.145830] UBIFS error (pid 786): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  419.154922] UBIFS error (pid 786): ubifs_write_inode: can't write inode =
51013, error -30
[  419.252075] UBIFS error (pid 804): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  419.279395] UBIFS error (pid 804): ubifs_create: cannot create regular f=
ile, error -30
[  419.711695] UBIFS error (pid 827): make_reservation: cannot reserve 392 =
bytes in jhead 1, error -30
[  419.740104] UBIFS error (pid 827): ubifs_create: cannot create regular f=
ile, error -30
[  421.145578] UBIFS error (pid 814): ubifs_budget_space: cannot budget spa=
ce, error -30
[  456.135780] UBIFS error (pid 786): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  456.144876] UBIFS error (pid 786): ubifs_write_inode: can't write inode =
5606, error -30
[  456.152941] UBIFS error (pid 786): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  456.162039] UBIFS error (pid 786): ubifs_write_inode: can't write inode =
198294, error -30
[  476.165896] UBIFS error (pid 786): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[  476.174995] UBIFS error (pid 786): ubifs_write_inode: can't write inode =
5605, error -30
[  501.600677] UBIFS error (pid 874): make_reservation: cannot reserve 384 =
bytes in jhead 1, error -30
[  501.609823] UBIFS error (pid 874): ubifs_create: cannot create regular f=
ile, error -30
[38983.468726] ata1.00: failed to read SCR 1 (Emask=3D0x40)
[38983.473895] ata1.01: failed to read SCR 1 (Emask=3D0x40)
[38983.479077] ata1.15: exception Emask 0x10 SAct 0x0 SErr 0x10180000 actio=
n 0x6 frozen
[38983.486867] ata1.15: edma_err_cause=3D00000020 pp_flags=3D00000007, SErr=
or=3D00180000
[38983.494359] ata1.15: SError: { 10B8B Dispar }
[38983.498741] ata1.00: exception Emask 0x100 SAct 0x0 SErr 0x0 action 0x6 =
frozen
[38983.506014] ata1.01: exception Emask 0x100 SAct 0x0 SErr 0x0 action 0x6 =
frozen
[38983.513281] ata1.15: hard resetting link
[38983.864028] ata1.15: SATA link down (SStatus 0 SControl F300)
[38983.910209] ata1.15: failed to read PMP GSCR[0] (Emask=3D0x3)
[38983.915823] ata1.15: PMP revalidation failed (errno=3D-5)
[38988.864028] ata1.15: hard resetting link
[38989.214028] ata1.15: SATA link down (SStatus 0 SControl F300)
[38989.260039] ata1.15: failed to read PMP GSCR[0] (Emask=3D0x3)
[38989.265647] ata1.15: PMP revalidation failed (errno=3D-5)
[38989.270895] ata1.15: limiting SATA link speed to 1.5 Gbps
[38994.214027] ata1.15: hard resetting link
[38994.564034] ata1.15: SATA link down (SStatus 0 SControl F310)
[38994.610184] ata1.15: failed to read PMP GSCR[0] (Emask=3D0x3)
[38994.615795] ata1.15: PMP revalidation failed (errno=3D-5)
[38999.564034] ata1.15: hard resetting link
[38999.914035] ata1.15: SATA link down (SStatus 0 SControl F310)
[38999.960092] ata1.15: failed to read PMP GSCR[0] (Emask=3D0x3)
[38999.965708] ata1.15: PMP revalidation failed (errno=3D-5)
[39004.914034] ata1.15: hard resetting link
[39005.264043] ata1.15: SATA link down (SStatus 0 SControl F310)
[39005.310192] ata1.15: failed to read PMP GSCR[0] (Emask=3D0x3)
[39005.315801] ata1.15: PMP revalidation failed (errno=3D-5)
[39005.321047] ata1.15: failed to recover PMP after 5 tries, giving up
[39005.327352] ata1.15: Port Multiplier detaching
[39005.331817] ata1.00: disabled
[39005.334811] ata1.00: disabled
[39005.337809] ata1: hard resetting link
[39005.684041] ata1: SATA link down (SStatus 0 SControl F310)
[39005.689568] ata1: EH complete
[39005.692562] ata1.00: detaching (SCSI 0:0:0:0)
[39005.703416] sd 0:0:0:0: [sdc] Synchronizing SCSI cache
[39005.708881] sd 0:0:0:0: [sdc] Result: hostbyte=3DDID_BAD_TARGET driverby=
te=3DDRIVER_OK
[39005.716555] sd 0:0:0:0: [sdc] Stopping disk
[39005.720796] sd 0:0:0:0: [sdc] START_STOP FAILED
[39005.725363] sd 0:0:0:0: [sdc] Result: hostbyte=3DDID_BAD_TARGET driverby=
te=3DDRIVER_OK
[771920.354661] usb 1-1.2: USB disconnect, address 4
[773164.015454] UBIFS error (pid 9450): make_reservation: cannot reserve 39=
2 bytes in jhead 1, error -30
[773164.024759] UBIFS error (pid 9450): ubifs_create: cannot create regular=
 file, error -30
[773164.032966] UBIFS error (pid 9450): make_reservation: cannot reserve 39=
2 bytes in jhead 1, error -30
[773164.042255] UBIFS error (pid 9450): ubifs_create: cannot create regular=
 file, error -30
[773164.050831] UBIFS error (pid 9450): make_reservation: cannot reserve 39=
2 bytes in jhead 1, error -30
[773164.060120] UBIFS error (pid 9450): ubifs_create: cannot create regular=
 file, error -30
[773164.068308] UBIFS error (pid 9450): make_reservation: cannot reserve 39=
2 bytes in jhead 1, error -30
[773164.077592] UBIFS error (pid 9450): ubifs_create: cannot create regular=
 file, error -30
[773286.323880] UBIFS error (pid 9452): make_reservation: cannot reserve 21=
6 bytes in jhead 1, error -30

>> The filesystem is read-only and I can't seem to figure out how to get it
>> out of this state. As far as I can tell, there is no fsck.ubifs and I'm
>> at a loss at how to get things back to a reasonable state. I found the
>> 'nandtest' command, which might be useful for mapping out bad areas, but
>> I'm not going to run that without a better clue at how likely I am to
>> brick things.
>
> No, there is no recovery program, the file-system is supposed to always
> be mountable. Please, use mtdtests to validate the HW:
>
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

The filesystem *is* still mounted, and I seem to be able to read from
it, it is just read-only and I can't get it out of that state.=20

I'll look into getting the mtdtests tools installed.

thanks!
micah
