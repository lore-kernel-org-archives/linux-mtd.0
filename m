Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtLlM-00021g-L7
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 20:31:37 +0000
Received: by oifu63 with SMTP id u63so102630591oif.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 12:31:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
 <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
 <562FD60E.9020807@nod.at>
 <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
Date: Mon, 2 Nov 2015 12:31:11 -0800
Message-ID: <CAJ+vNU3Y_SnLSAojp3-hXxR02dtfX5n78GkS6Zt-izDZMh2msQ@mail.gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
From: Tim Harvey <tharvey@gateworks.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie.huang@arm.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 2, 2015 at 12:27 PM, Tim Harvey <tharvey@gateworks.com> wrote:
> On Tue, Oct 27, 2015 at 12:52 PM, Richard Weinberger <richard@nod.at> wrote:
>> Tim,
>>
>> Am 27.10.2015 um 20:01 schrieb Tim Harvey:
>>> I'm not understanding what is making you say that the issue I
>>> encountered is 'not' the unstable bits issue described at
>>> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits? My
>>> understanding is that the 'unstable bit' issue refers to bits which
>>> are truly unstable and can read either way each and every read due to
>>> not getting properly erased/written.
>>
>> You are right. I was sorting out the unstable bits issue a bit too
>> early. I'm sorry.
>> Let's double check. Can you enable UBI verbose logging while testing?
>> Such that we can see which blocks were written/erased while the power cut
>> happened?
>>
>
> Richard,
>
> I have 2 IMX6 based boards that I've recreated a UBI/UBIFS NAND
> corruption using Linux 4.2 with dynamic debug enabled for
> ubi_io_write. This particular test cycle consisted of 5 different
> boards and had over 40,000 boot/power-cuts before corruption occurred.
> In each case the corruption is in a slightly different area.
>
> The boards remain in a corrupted state which will allow me to get
> further debug info.
>
> Board1 looks like this:
>
> [    0.000000] Linux version 4.2.0-00015-g64291f7 (tharvey@tharvey)
> (gcc version 4.8.3 (OpenWrt/Linaro GCC 4.8-2014.04 r43990) ) #195 SMP
> Thu Oct 29 14:27:36 PDT 2015
> [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] Machine model: Gateworks Ventana i.MX6 Dual/Quad GW52XX
> ...
> [    0.000000] Kernel command line: console=ttymxc1,115200
> root=ubi0:rootfs ubi.mtd=2 rootfstype=ubifs dyndbg="func ubi_io_write
> +p" debug
> ...
> [    2.045065] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
> [    2.051477] nand: Micron MT29F16G08ADACAH4
> [    2.055590] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
> 4096, OOB size: 224
> [    2.087400] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
> [    2.094321] Scanning device for bad blocks
> ...
> [    3.704946] 3 ofpart partitions found on MTD device gpmi-nand
> [    3.710735] Creating 3 MTD partitions on "gpmi-nand":
> [    3.715823] 0x000000000000-0x000001000000 : "uboot"
> [    3.725088] 0x000001000000-0x000001100000 : "env"
> [    3.733000] 0x000001100000-0x000080000000 : "rootfs"
> [    3.741880] gpmi-nand 112000.gpmi-nand: driver registered.
> ...
> [    4.365104] ubi0: attaching mtd2
> [    8.418862] ubi0: scanning is finished
> [    8.445084] ubi0: attached mtd2 (name "rootfs", size 2031 MiB)
> [    8.450977] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
> [    8.457864] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
> [    8.464676] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
> [    8.471666] ubi0: good PEBs: 8124, bad PEBs: 0, corrupted PEBs: 0
> [    8.477767] ubi0: user volume: 1, internal volumes: 1, max. volumes
> count: 128
> [    8.485015] ubi0: max/mean erase counter: 7/3, WL threshold: 4096,
> image sequence number: 42283325
> [    8.494000] ubi0: available PEBs: 0, total reserved PEBs: 8124,
> PEBs reserved for bad PEB handling: 160
> [    8.503610] ubi0: background thread "ubi_bgt0d" started, PID 81
> ...
> [    8.615672] UBIFS (ubi0:0): recovery needed
> [    8.657083] UBIFS (ubi0:0): recovery deferred
> [    8.661965] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> name "rootfs", R/O mode
> [    8.670290] UBIFS (ubi0:0): LEB size: 253952 bytes (248 KiB),
> min./max. I/O unit sizes: 4096 bytes/4096 bytes
> [    8.680248] UBIFS (ubi0:0): FS size: 2018918400 bytes (1925 MiB,
> 7950 LEBs), journal size 9404416 bytes (8 MiB, 38 LEBs)
> [    8.691145] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
> [    8.697001] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0),
> UUID BB5E5EB5-6A21-48AA-9C31-DE6B4A32ABAD, small LPT model
> [    8.709784] VFS: Mounted root (ubifs filesystem) readonly on device 0:14.
> [    8.719451] devtmpfs: mounted
> [    8.723002] Freeing unused kernel memory: 420K (80aa5000 - 80b0e000)
> INIT: version 2.88 booting
> Starting udev
> [    9.548551] udevd[114]: starting version 182
> [   10.018775] UBIFS (ubi0:0): completing deferred recovery
> [   10.043624] UBI DBG io (pid 145): write 4096 bytes to PEB 2253:4096
> [   10.054878] UBI DBG io (pid 145): write 94208 bytes to PEB 2253:8192
> [   10.096644] UBI DBG io (pid 81): write 4096 bytes to PEB 2250:0
> [   10.143314] UBI DBG io (pid 145): write 4096 bytes to PEB 2254:4096
> [   10.153917] UBI DBG io (pid 145): write 184320 bytes to PEB 2254:8192
> ^^^^^ PEB 2254 is the one that becomes un-readable on the next boot
>
> [   10.186288] UBI DBG io (pid 81): write 4096 bytes to PEB 2251:0
> [   10.204620] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 173
> [   10.213375] UBI DBG io (pid 145): write 4096 bytes to PEB 2255:4096
> [   10.223864] UBI DBG io (pid 145): write 4096 bytes to PEB 2255:8192
> [   10.239935] UBI DBG io (pid 145): write 4096 bytes to PEB 2237:32768
> [   10.261787] UBI DBG io (pid 145): write 4096 bytes to PEB 2184:102400
> [   10.272978] UBI DBG io (pid 145): write 4096 bytes to PEB 2173:114688
> [   10.285948] UBI DBG io (pid 145): write 4096 bytes to PEB 2174:114688
> [   10.296027] UBIFS (ubi0:0): deferred recovery completed
> [   10.299453] UBI DBG io (pid 81): write 4096 bytes to PEB 2252:0
> bootlogd: cannot allocate pseudo tty: No such file or directory
> ALSA: Restoring mixer settings...
> Mon Oct 26 16:37:16 UTC 2015
> INIT: Entering runlevel: 5
> Configuring network interfaces... [   11.471755] fec 2188000.ethernet
> eth0: Freescale FEC PHY driver [Generic PHY]
> (mii_bus:phy_addr=2188000.ethernet:00, irq=-1)
> [   11.483499] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> udhcpc (v1.23.1) started
> Sending discover...
> Sending discover...
> [   15.000462] UBI DBG io (pid 173): write 4096 bytes to PEB 2253:102400
> [   16.472720] fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full -
> flow control rx/tx
> [   16.480975] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> Sending discover...
> Sending select for 192.168.1.1...
> Lease of 192.168.1.1 obtained, lease time 21600
> /etc/udhcpc.d/50default: Adding DNS 192.168.1.100
> done.
>
> <power cut>
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.2.0-00015-g64291f7 (tharvey@tharvey)
> (gcc version 4.8.3 (OpenWrt/Linaro GCC 4.8-2014.04 r43990) ) #195 SMP
> Thu Oct 29 14:27:36 PDT 2015
> [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] Machine model: Gateworks Ventana i.MX6 Dual/Quad GW52XX
> ...
> [    2.044936] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
> [    2.051348] nand: Micron MT29F16G08ADACAH4
> [    2.055461] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
> 4096, OOB size: 224
> [    2.087272] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
> [    2.094196] Scanning device for bad blocks
> ...
> [    3.710706] Creating 3 MTD partitions on "gpmi-nand":
> [    3.715793] 0x000000000000-0x000001000000 : "uboot"
> [    3.725027] 0x000001000000-0x000001100000 : "env"
> [    3.732929] 0x000001100000-0x000080000000 : "rootfs"
> [    3.741781] gpmi-nand 112000.gpmi-nand: driver registered.
> ...
> [    4.366226] ubi0: attaching mtd2
> [    8.445733] ubi0: scanning is finished
> [    8.477551] ubi0: attached mtd2 (name "rootfs", size 2031 MiB)
> [    8.483443] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
> [    8.490355] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
> [    8.497155] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
> [    8.504148] ubi0: good PEBs: 8124, bad PEBs: 0, corrupted PEBs: 0
> [    8.510274] ubi0: user volume: 1, internal volumes: 1, max. volumes
> count: 128
> [    8.517510] ubi0: max/mean erase counter: 7/3, WL threshold: 4096,
> image sequence number: 42283325
> [    8.526498] ubi0: available PEBs: 0, total reserved PEBs: 8124,
> PEBs reserved for bad PEB handling: 160
> [    8.536151] ubi0: background thread "ubi_bgt0d" started, PID 82
> ...
> [    8.635364] UBIFS (ubi0:0): recovery needed
> [    8.676203] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
> [    8.692460] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
> [    8.708741] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
> ^^^^ non correctable ecc error on PEB 2254  - I verified that this was
> not the first time this PEB has been used
> [    8.724987] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 69632 bytes from PEB 2254:192512, read 69632 bytes
> [    8.736163] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 4.2.0-00015-g64291f7 dirty #195
> [    8.744021] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [    8.750582] Backtrace:
> [    8.753074] [<8001400c>] (dump_backtrace) from [<800141f8>]
> (show_stack+0x18/0x1c)
> [    8.760667]  r6:80b2d960 r5:80b2d960 r4:00000000 r3:00000000
> [    8.766424] [<800141e0>] (show_stack) from [<807ceeb8>]
> (dump_stack+0x8c/0xa4)
> [    8.773687] [<807cee2c>] (dump_stack) from [<80474730>]
> (ubi_io_read+0x130/0x378)
> [    8.781212]  r6:00000000 r5:00011000 r4:ffffffb6 r3:be070000
> [    8.786951] [<80474600>] (ubi_io_read) from [<80471564>]
> (ubi_eba_read_leb+0x19c/0x4c8)
> [    8.794975]  r10:00000000 r9:c0c63000 r8:000008ce r7:00001f15
> r6:00000000 r5:bda3a000
> [    8.802928]  r4:bda12000
> [    8.805489] [<804713c8>] (ubi_eba_read_leb) from [<8047077c>]
> (ubi_leb_read+0x94/0x130)
> [    8.813527]  r10:00000000 r9:c0c63000 r8:bda3a000 r7:0002d000
> r6:00001f15 r5:00011000
> [    8.821467]  r4:bda12000
> [    8.824037] [<804706e8>] (ubi_leb_read) from [<80257870>]
> (ubifs_leb_read+0x30/0x9c)
> [    8.831815]  r10:be29a000 r9:80b77ff8 r8:00001f15 r7:0002d000
> r6:00011000 r5:be29a000
> [    8.839731]  r4:bdaea600
> [    8.842312] [<80257840>] (ubifs_leb_read) from [<80260fac>]
> (ubifs_start_scan+0x84/0x134)
> [    8.850522]  r8:c0c36000 r7:00001f15 r6:be29a000 r5:0002d000 r4:bdaea600
> [    8.857322] [<80260f28>] (ubifs_start_scan) from [<80276270>]
> (ubifs_recover_leb+0x80/0xb80)
> [    8.865794]  r8:00001f15 r7:c0c63000 r6:00011000 r5:00001f15 r4:00000001
> [    8.872609] [<802761f0>] (ubifs_recover_leb) from [<802627f0>]
> (ubifs_replay_journal+0xd34/0x1a48)
> [    8.881601]  r10:00017188 r9:0002d000 r8:be29a000 r7:00000000
> r6:bdaea608 r5:00001f15
> [    8.889518]  r4:00000001
> [    8.892106] [<80261abc>] (ubifs_replay_journal) from [<80254954>]
> (ubifs_mount+0x136c/0x2170)
> [    8.900666]  r10:be29a008 r9:00000000 r8:0003db70 r7:be29a000
> r6:80b76870 r5:be3f6000
> [    8.908584]  r4:00000000
> [    8.911171] [<802535e8>] (ubifs_mount) from [<801055f8>] (mount_fs+0x1c/0xb0)
> [    8.918323]  r10:00008001 r9:00000000 r8:80b2a2e0 r7:80124e34
> r6:80b2a2e0 r5:bd9cfac0
> [    8.926258]  r4:be365900
> [    8.928829] [<801055dc>] (mount_fs) from [<80121868>]
> (vfs_kern_mount+0x5c/0x144)
> [    8.936355]  r6:00008001 r5:bd9cfac0 r4:be365900
> [    8.941056] [<8012180c>] (vfs_kern_mount) from [<80124e34>]
> (do_mount+0x19c/0xd0c)
> [    8.948642]  r9:80b2a2e0 r8:80b1ebdc r7:bd9cfa80 r6:bd9cfac0
> r5:00000060 r4:00000000
> [    8.956498] [<80124c98>] (do_mount) from [<80125d38>] (SyS_mount+0x7c/0xa8)
> [    8.963493]  r10:000000d7 r9:80afa7b0 r8:8099d910 r7:00008001
> r6:00000000 r5:bd9cfac0
> [    8.971429]  r4:bd9cfa80
> [    8.973993] [<80125cbc>] (SyS_mount) from [<80aa6260>]
> (mount_block_root+0x114/0x240)
> [    8.981856]  r8:befa3a40 r7:80afa7a0 r6:bd9d2000 r5:bd9d2000 r4:00008001
> [    8.988651] [<80aa614c>] (mount_block_root) from [<80aa664c>]
> (prepare_namespace+0x98/0x1d0)
> [    8.997123]  r10:000000d7 r9:80afa780 r8:80b087e4 r7:80afa778
> r6:80afa7a0 r5:80afa7a0
> [    9.005058]  r4:80afa7b0
> [    9.007617] [<80aa65b4>] (prepare_namespace) from [<80aa5efc>]
> (kernel_init_freeable+0x1a4/0x1f0)
> [    9.016522]  r6:80b8b000 r5:80b8b000 r4:00000007
> [    9.021217] [<80aa5d58>] (kernel_init_freeable) from [<807c91b4>]
> (kernel_init+0x10/0xf4)
> [    9.029412]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:807c91a4
> [    9.037354]  r4:00000000
> [    9.039918] [<807c91a4>] (kernel_init) from [<800104b8>]
> (ret_from_fork+0x14/0x3c)
> [    9.047525]  r4:00000000 r3:00000000
> [    9.051259] UBIFS error (ubi0:0 pid 1): ubifs_recover_leb: corrupt
> empty space LEB 7957:184320, corruption starts at 4665
> [    9.062247] UBIFS error (ubi0:0 pid 1): ubifs_scanned_corruption:
> corruption at LEB 7957:188985
> [    9.070972] UBIFS error (ubi0:0 pid 1): ubifs_scanned_corruption:
> first 8192 bytes from LEB 7957:188985
> [    9.080396] 00000000: ffffffef ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> [    9.091903] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> ...
> [   12.002997] 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> [   12.014501] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> [   12.026000] UBIFS error (ubi0:0 pid 1): ubifs_recover_leb: LEB 7957
> scanning failed
> ^^^^ recovery failed
> [   12.036886] VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(0,0): error -117
>
> After added Huang Shijie's 'mtd: gpmi: fix the bitflips for erased
> page' patch from http://patchwork.ozlabs.org/patch/309763/ which shows
> the following on board1:
> [    8.532624] UBIFS (ubi0:0): recovery needed
> [    8.569104] gpmi-nand 112000.gpmi-nand: The page(148656) is an
> erased page(1,6,1,1).
> [    8.577748] gpmi-nand 112000.gpmi-nand: The page(148658) is an
> erased page(1,6,1,1).
> [    8.586413] gpmi-nand 112000.gpmi-nand: The page(148660) is an
> erased page(1,6,1,1).
> [    8.595050] gpmi-nand 112000.gpmi-nand: The page(148662) is an
> erased page(1,6,1,1).
> [    8.603705] gpmi-nand 112000.gpmi-nand: The page(148664) is an
> erased page(1,6,1,1).
> [    8.612310] gpmi-nand 112000.gpmi-nand: The page(148666) is an
> erased page(1,6,1,1).
> [    8.620940] gpmi-nand 112000.gpmi-nand: The page(148668) is an
> erased page(1,6,1,1).
> [    8.629580] gpmi-nand 112000.gpmi-nand: The page(148670) is an
> erased page(1,6,1,1).
> ^^^^ 1 bit-flip on ecc read, 1 bit-flip on non-ecc read, ecc-str=6,
> memset's buffer to 0xff to attempt to recover
> [    8.644345] UBIFS (ubi0:0): recovery deferred
> [    8.649209] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> name "rootfs", R/O mode
> [    8.657537] UBIFS (ubi0:0): LEB size: 253952 bytes (248 KiB),
> min./max. I/O unit sizes: 4096 bytes/4096 bytes
> [    8.667486] UBIFS (ubi0:0): FS size: 2018918400 bytes (1925 MiB,
> 7950 LEBs), journal size 9404416 bytes (8 MiB, 38 LEBs)
> [    8.678409] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
> [    8.684283] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0),
> UUID BB5E5EB5-6A21-48AA-9C31-DE6B4A32ABAD, small LPT model
> [    8.697990] VFS: Mounted root (ubifs filesystem) readonly on device 0:14.
> ^^^^ able to recover and always ends up this way over further boots
> ^^^^ after applying this patch I boot with init=foo so as to not allow
> rootfs to get mounted read/write by udev and perhaps permanently
> recover the board
>
>
>
> Board2 looks like this:
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.2.0-00015-g64291f7 (tharvey@tharvey)
> (gcc version 4.8.3 (OpenWrt/Linaro GCC 4.8-2014.04 r43990) ) #195 SMP
> Thu Oct 29 14:27:36 PDT 2015
> [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] Machine model: Gateworks Ventana i.MX6 Dual/Quad GW552X
> ...
> [    0.000000] Kernel command line: console=ttymxc1,115200
> root=ubi0:rootfs ubi.mtd=2 rootfstype=ubifs dyndbg="func ubi_io_write
> +p" debug
> ...
> [    2.341988] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
> [    2.348382] nand: Micron MT29F16G08ADACAH4
> [    2.352495] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
> 4096, OOB size: 224
> [    2.384301] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
> [    2.391224] Scanning device for bad blocks
> ...
> [    4.024472] 3 ofpart partitions found on MTD device gpmi-nand
> [    4.030265] Creating 3 MTD partitions on "gpmi-nand":
> [    4.035336] 0x000000000000-0x000001000000 : "uboot"
> [    4.044635] 0x000001000000-0x000001100000 : "env"
> [    4.052559] 0x000001100000-0x000080000000 : "rootfs"
> [    4.061452] gpmi-nand 112000.gpmi-nand: driver registered.
> ...
> [    4.426420] ubi0: attaching mtd2
> [    8.514755] ubi0: scanning is finished
> [    8.541225] ubi0: attached mtd2 (name "rootfs", size 2031 MiB)
> [    8.547108] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
> [    8.553994] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
> [    8.560810] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
> [    8.567799] ubi0: good PEBs: 8124, bad PEBs: 0, corrupted PEBs: 0
> [    8.573901] ubi0: user volume: 1, internal volumes: 1, max. volumes
> count: 128
> [    8.581161] ubi0: max/mean erase counter: 4/2, WL threshold: 4096,
> image sequence number: 42283325
> [    8.590148] ubi0: available PEBs: 0, total reserved PEBs: 8124,
> PEBs reserved for bad PEB handling: 160
> [    8.599737] ubi0: background thread "ubi_bgt0d" started, PID 74
> ...
> [    8.712166] UBIFS (ubi0:0): recovery needed
> [    8.749882] UBIFS (ubi0:0): recovery deferred
> [    8.754639] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> name "rootfs", R/O mode
> [    8.762941] UBIFS (ubi0:0): LEB size: 253952 bytes (248 KiB),
> min./max. I/O unit sizes: 4096 bytes/4096 bytes
> [    8.772883] UBIFS (ubi0:0): FS size: 2018918400 bytes (1925 MiB,
> 7950 LEBs), journal size 9404416 bytes (8 MiB, 38 LEBs)
> [    8.783773] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
> [    8.789631] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0),
> UUID BB5E5EB5-6A21-48AA-9C31-DE6B4A32ABAD, small LPT model
> [    8.803366] VFS: Mounted root (ubifs filesystem) readonly on device 0:14.
> [    8.813172] devtmpfs: mounted
> [    8.816746] Freeing unused kernel memory: 420K (80aa5000 - 80b0e000)
> INIT: version 2.88 booting
> Starting udev
> [    9.621167] udevd[106]: starting version 182
> [   10.525521] UBIFS (ubi0:0): completing deferred recovery
> [   10.540072] UBI DBG io (pid 162): write 4096 bytes to PEB 5891:4096
> [   10.547480] UBI DBG io (pid 162): write 110592 bytes to PEB 5891:8192
> [   10.578168] UBI DBG io (pid 162): write 4096 bytes to PEB 5892:4096
> [   10.585053] UBI DBG io (pid 74): write 4096 bytes to PEB 2944:0
> [   10.585639] UBI DBG io (pid 162): write 163840 bytes to PEB 5892:8192
> [   10.607478] UBI DBG io (pid 74): write 4096 bytes to PEB 2945:0
> [   10.615485] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 163
> [   10.617094] UBI DBG io (pid 162): write 4096 bytes to PEB 5893:4096
> [   10.618542] UBI DBG io (pid 162): write 4096 bytes to PEB 5893:8192
> [   10.619487] UBI DBG io (pid 162): write 4096 bytes to PEB 2859:212992
> [   10.620347] UBI DBG io (pid 162): write 4096 bytes to PEB 2850:225280
> ^^^^^ this is the PEB that gets uncorrectable ECC errors - I verified
> that this was not the first time this PEB has been used
> [   10.621476] UBI DBG io (pid 162): write 4096 bytes to PEB 2851:225280
> [   10.623058] UBIFS (ubi0:0): deferred recovery completed
> [   10.628641] UBI DBG io (pid 74): write 4096 bytes to PEB 2946:0
> bootlogd: cannot allocate pseudo tty: No such file or directory
> Populating dev cache
> ALSA: Restoring mixer settings...
> /usr/sbin/alsactl: load_state:1729: No soundcards found...
> Sat Oct 24 11:28:04 UTC 2015
> INIT: Entering runlevel: 5
> Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
> Starting system message bus: dbus.
> Starting Dropbear SSH server: dropbear.
> Starting rpcbind daemon...done.
> Starting watchdog:  [1
> 34m[ [1
> 32m  OK   [1
> 34m] [0
> 39m
> Starting advanced power management daemon: No APM support in kernel
> (failed.)
> starting DNS forwarder and DHCP server: dnsmasq... done.
>
> <power cut>
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.2.0-00015-g64291f7 (tharvey@tharvey)
> (gcc version 4.8.3 (OpenWrt/Linaro GCC 4.8-2014.04 r43990) ) #195 SMP
> Thu Oct 29 14:27:36 PDT 2015
> ...
> [    2.332131] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
> [    2.338524] nand: Micron MT29F16G08ADACAH4
> [    2.342638] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
> 4096, OOB size: 224
> [    2.374442] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
> [    2.381366] Scanning device for bad blocks
> ...
> [    4.013255] 3 ofpart partitions found on MTD device gpmi-nand
> [    4.019040] Creating 3 MTD partitions on "gpmi-nand":
> [    4.024111] 0x000000000000-0x000001000000 : "uboot"
> [    4.033352] 0x000001000000-0x000001100000 : "env"
> [    4.041210] 0x000001100000-0x000080000000 : "rootfs"
> [    4.050164] gpmi-nand 112000.gpmi-nand: driver registered.
> ...
> [    4.416614] ubi0: attaching mtd2
> [    8.500977] ubi0: scanning is finished
> [    8.527328] ubi0: attached mtd2 (name "rootfs", size 2031 MiB)
> [    8.533184] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
> [    8.540089] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
> [    8.546906] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
> [    8.553878] ubi0: good PEBs: 8124, bad PEBs: 0, corrupted PEBs: 0
> [    8.559998] ubi0: user volume: 1, internal volumes: 1, max. volumes
> count: 128
> [    8.567248] ubi0: max/mean erase counter: 4/2, WL threshold: 4096,
> image sequence number: 42283325
> [    8.576216] ubi0: available PEBs: 0, total reserved PEBs: 8124,
> PEBs reserved for bad PEB handling: 160
> [    8.585813] ubi0: background thread "ubi_bgt0d" started, PID 73
> ..
> [    8.683337] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read only 253952 bytes, retry
> [    8.710495] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read only 253952 bytes, retry
> [    8.736821] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read only 253952 bytes, retry
> [    8.763179] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read 253952 bytes
> ^^^^ uncorrectable ECC error on PEB 2850
> [    8.774340] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 4.2.0-00015-g64291f7 #195
> [    8.782194] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [    8.788743] Backtrace:
> [    8.791237] [<8001400c>] (dump_backtrace) from [<800141f8>]
> (show_stack+0x18/0x1c)
> [    8.798839]  r6:80b2d960 r5:80b2d960 r4:00000000 r3:00000000
> [    8.804589] [<800141e0>] (show_stack) from [<807ceeb8>]
> (dump_stack+0x8c/0xa4)
> [    8.811855] [<807cee2c>] (dump_stack) from [<80474730>]
> (ubi_io_read+0x130/0x378)
> [    8.819359]  r6:00000000 r5:0003e000 r4:ffffffb6 r3:9e468000
> [    8.825099] [<80474600>] (ubi_io_read) from [<80471564>]
> (ubi_eba_read_leb+0x19c/0x4c8)
> [    8.833125]  r10:00000000 r9:a0c0d000 r8:00000b22 r7:00000001
> r6:00000000 r5:9dd8a000
> [    8.841065]  r4:9dd9e000
> [    8.843628] [<804713c8>] (ubi_eba_read_leb) from [<8047077c>]
> (ubi_leb_read+0x94/0x130)
> [    8.851661]  r10:00000000 r9:a0c0d000 r8:9dd8a000 r7:00000000
> r6:00000001 r5:0003e000
> [    8.859596]  r4:9dd9e000
> [    8.862170] [<804706e8>] (ubi_leb_read) from [<80257870>]
> (ubifs_leb_read+0x30/0x9c)
> [    8.869937]  r10:9e673008 r9:00000001 r8:00000001 r7:00000000
> r6:0003e000 r5:9e673000
> [    8.877873]  r4:9de22240
> [    8.880437] [<80257840>] (ubifs_leb_read) from [<80260fac>]
> (ubifs_start_scan+0x84/0x134)
> [    8.888637]  r8:a0c0d000 r7:00000001 r6:9e673000 r5:00000000 r4:9de22240
> [    8.895433] [<80260f28>] (ubifs_start_scan) from [<802613ac>]
> (ubifs_scan+0x30/0x3d4)
> [    8.903284]  r8:00000001 r7:9e673000 r6:a0c0d000 r5:00000000 r4:0003e000
> [    8.910097] [<8026137c>] (ubifs_scan) from [<8025fcd8>]
> (ubifs_read_master+0x48/0xd78)
> [    8.918034]  r10:9e673008 r9:9dd7bf80 r8:9e673000 r7:00000001
> r6:80b76870 r5:9dda1800
> [    8.925952]  r4:00000001
> [    8.928533] [<8025fc90>] (ubifs_read_master) from [<80254714>]
> (ubifs_mount+0x112c/0x2170)
> [    8.936819]  r10:9e673008 r9:9dd7bf80 r8:9e673b38 r7:9e673000
> r6:80b76870 r5:9dda1800
> [    8.944738]  r4:00000001
> [    8.947326] [<802535e8>] (ubifs_mount) from [<801055f8>] (mount_fs+0x1c/0xb0)
> [    8.954466]  r10:00008001 r9:00000000 r8:80b2a2e0 r7:80124e34
> r6:80b2a2e0 r5:9dd73c80
> [    8.962404]  r4:9dd76500
> [    8.964975] [<801055dc>] (mount_fs) from [<80121868>]
> (vfs_kern_mount+0x5c/0x144)
> [    8.972479]  r6:00008001 r5:9dd73c80 r4:9dd76500
> [    8.977177] [<8012180c>] (vfs_kern_mount) from [<80124e34>]
> (do_mount+0x19c/0xd0c)
> [    8.984750]  r9:80b2a2e0 r8:80b1ebdc r7:9e7b5d00 r6:9dd73c80
> r5:00000060 r4:00000000
> [    8.992605] [<80124c98>] (do_mount) from [<80125d38>] (SyS_mount+0x7c/0xa8)
> [    8.999588]  r10:000000d7 r9:80afa7b0 r8:8099d910 r7:00008001
> r6:00000000 r5:9dd73c80
> [    9.007522]  r4:9e7b5d00
> [    9.010087] [<80125cbc>] (SyS_mount) from [<80aa6260>]
> (mount_block_root+0x114/0x240)
> [    9.017941]  r8:9efacd20 r7:80afa7a0 r6:9de69000 r5:9de69000 r4:00008001
> [    9.024736] [<80aa614c>] (mount_block_root) from [<80aa664c>]
> (prepare_namespace+0x98/0x1d0)
> [    9.033195]  r10:000000d7 r9:80afa780 r8:80b087e4 r7:80afa778
> r6:80afa7a0 r5:80afa7a0
> [    9.041129]  r4:80afa7b0
> [    9.043690] [<80aa65b4>] (prepare_namespace) from [<80aa5efc>]
> (kernel_init_freeable+0x1a4/0x1f0)
> [    9.052592]  r6:80b8b000 r5:80b8b000 r4:00000007
> [    9.057290] [<80aa5d58>] (kernel_init_freeable) from [<807c91b4>]
> (kernel_init+0x10/0xf4)
> [    9.065472]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:807c91a4
> [    9.073407]  r4:00000000
> [    9.075970] [<807c91a4>] (kernel_init) from [<800104b8>]
> (ret_from_fork+0x14/0x3c)
> [    9.083560]  r4:00000000 r3:00000000
> [    9.102369] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read only 253952 bytes, retry
> [    9.128774] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read only 253952 bytes, retry
> [    9.155184] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read only 253952 bytes, retry
> [    9.181522] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2850:8192, read 253952 bytes
> ^^^^ unrecoverable ECC error on PEB 2850
> [    9.192683] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 4.2.0-00015-g64291f7 #195
> [    9.200535] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [    9.207083] Backtrace:
> [    9.209573] [<8001400c>] (dump_backtrace) from [<800141f8>]
> (show_stack+0x18/0x1c)
> [    9.217173]  r6:80b2d960 r5:80b2d960 r4:00000000 r3:00000000
> [    9.222916] [<800141e0>] (show_stack) from [<807ceeb8>]
> (dump_stack+0x8c/0xa4)
> [    9.230177] [<807cee2c>] (dump_stack) from [<80474730>]
> (ubi_io_read+0x130/0x378)
> [    9.237688]  r6:00000000 r5:0003e000 r4:ffffffb6 r3:9e468000
> [    9.243429] [<80474600>] (ubi_io_read) from [<80471564>]
> (ubi_eba_read_leb+0x19c/0x4c8)
> [    9.251458]  r10:00000000 r9:a0c4c000 r8:00000b22 r7:00000001
> r6:00000000 r5:9dd8a000
> [    9.259398]  r4:9dd9e000
> [    9.261962] [<804713c8>] (ubi_eba_read_leb) from [<8047077c>]
> (ubi_leb_read+0x94/0x130)
> [    9.269988]  r10:00000000 r9:a0c4c000 r8:9dd8a000 r7:00000000
> r6:00000001 r5:0003e000
> [    9.277925]  r4:9dd9e000
> [    9.280495] [<804706e8>] (ubi_leb_read) from [<80257870>]
> (ubifs_leb_read+0x30/0x9c)
> [    9.288264]  r10:9e673000 r9:9dd7bf80 r8:00000001 r7:00000000
> r6:0003e000 r5:9e673000
> [    9.296182]  r4:9e673000
> [    9.298768] [<80257840>] (ubifs_leb_read) from [<8027569c>]
> (get_master_node+0x54/0x324)
> [    9.306880]  r8:9e673000 r7:80b77ff8 r6:00001000 r5:00001000 r4:9e673000
> [    9.313681] [<80275648>] (get_master_node) from [<80275d98>]
> (ubifs_recover_master_node+0x60/0x3ec)
> [    9.322749]  r10:9e673008 r9:9dd7bf80 r8:9e673000 r7:80b77ff8
> r6:00001000 r5:9dda1800
> [    9.330685]  r4:9e673000
> [    9.333248] [<80275d38>] (ubifs_recover_master_node) from
> [<8026080c>] (ubifs_read_master+0xb7c/0xd78)
> [    9.342575]  r7:00000001 r6:80b76870 r5:9dda1800 r4:ffffff8b
> [    9.348335] [<8025fc90>] (ubifs_read_master) from [<80254714>]
> (ubifs_mount+0x112c/0x2170)
> [    9.356621]  r10:9e673008 r9:9dd7bf80 r8:9e673b38 r7:9e673000
> r6:80b76870 r5:9dda1800
> [    9.364540]  r4:00000001
> [    9.367127] [<802535e8>] (ubifs_mount) from [<801055f8>] (mount_fs+0x1c/0xb0)
> [    9.374266]  r10:00008001 r9:00000000 r8:80b2a2e0 r7:80124e34
> r6:80b2a2e0 r5:9dd73c80
> [    9.382204]  r4:9dd76500
> [    9.384772] [<801055dc>] (mount_fs) from [<80121868>]
> (vfs_kern_mount+0x5c/0x144)
> [    9.392276]  r6:00008001 r5:9dd73c80 r4:9dd76500
> [    9.396974] [<8012180c>] (vfs_kern_mount) from [<80124e34>]
> (do_mount+0x19c/0xd0c)
> [    9.404547]  r9:80b2a2e0 r8:80b1ebdc r7:9e7b5d00 r6:9dd73c80
> r5:00000060 r4:00000000
> [    9.412404] [<80124c98>] (do_mount) from [<80125d38>] (SyS_mount+0x7c/0xa8)
> [    9.419386]  r10:000000d7 r9:80afa7b0 r8:8099d910 r7:00008001
> r6:00000000 r5:9dd73c80
> [    9.427320]  r4:9e7b5d00
> [    9.429887] [<80125cbc>] (SyS_mount) from [<80aa6260>]
> (mount_block_root+0x114/0x240)
> [    9.437743]  r8:9efacd20 r7:80afa7a0 r6:9de69000 r5:9de69000 r4:00008001
> [    9.444539] [<80aa614c>] (mount_block_root) from [<80aa664c>]
> (prepare_namespace+0x98/0x1d0)
> [    9.452999]  r10:000000d7 r9:80afa780 r8:80b087e4 r7:80afa778
> r6:80afa7a0 r5:80afa7a0
> [    9.460933]  r4:80afa7b0
> [    9.463494] [<80aa65b4>] (prepare_namespace) from [<80aa5efc>]
> (kernel_init_freeable+0x1a4/0x1f0)
> [    9.472386]  r6:80b8b000 r5:80b8b000 r4:00000007
> [    9.477081] [<80aa5d58>] (kernel_init_freeable) from [<807c91b4>]
> (kernel_init+0x10/0xf4)
> [    9.485262]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:807c91a4
> [    9.493196]  r4:00000000
> [    9.495758] [<807c91a4>] (kernel_init) from [<800104b8>]
> (ret_from_fork+0x14/0x3c)
> [    9.503349]  r4:00000000 r3:00000000
> [    9.507115] UBIFS error (ubi0:0 pid 1): ubifs_recover_master_node:
> failed to recover master node
> ^^^ master node recovery fails
> ...
> [    9.618335] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
>
> After added Huang Shijie's 'mtd: gpmi: fix the bitflips for erased
> page' patch from http://patchwork.ozlabs.org/patch/309763/ which shows
> the following on board2:
> [    8.605463] gpmi-nand 112000.gpmi-nand: The page(186809) is an
> erased page(7,6,1,0).
> [    8.628012] gpmi-nand 112000.gpmi-nand: The page(186809) is an
> erased page(7,6,1,0).
> ^^^ 1 bit-flip on ecc read, 0 bit-flip on non-ecc read, ecc-str=6,
> memset's buffer to 0xff to attempt to recover
> [    8.637305] UBIFS error (ubi0:0 pid 1): ubifs_recover_master_node:
> failed to recover master node
> ^^^ unable to recover and always ends up this way over further boots
>
>>> If I understand what you are saying you are thinking that my issue is
>>> instead the result of a never-used PEB that had bit-flips from the
>>> manufacturer in which case the bits would read the same every time?
>>> How can we know this PEB was never before used and isn't one that was
>>> being erased/written during a power cut?
>>
>> I've seen bit flips on cheap SLC NANDs which came out of a sudden.
>> According to the FAE I was talking to this is legit for NAND
>> as long the flipping bits are fixable by the ECC engine.
>>
>
> I'm a little confused by the fact that gpmi-nand.c encounters an
> uncorrectable status yet when the bit-flips are counted by Huang's
> 'gmpi_erased_check' they come out to 1 which is less than the ecc str.
> Is this saying that ecc already corrected what it could and there was
> 'still' 1 more flip?
>
>>> In my test scenario where the rootfs is mounted from the kernel
>>> read-only, but later mounted read-write by userspace (yet not being
>>> specifically written to by userspace) then power-cut should 'any' NAND
>>> writes would be occurring at all? And if not as I suspect, then how
>>> could a subsequent boot end up using a PEB that may have been never
>>> previously used and have bit-flips from the manufacturer?
>>
>> UBIFS's has a wandering journal. During the remount it moved maybe.
>> But for a more expressive analysis I'd need a nanddump to find out which
>> blocks are in which role.
>> Can you share the nanddump?
>>
>
> This makes sense, and I apparently lied when I said the test software
> wasn't writing to the rootfs. There is at least one process that does
> write: the dhcp client when it writes to /etc/resolv.con and possibly
> something else writes as well. So we are power-cutting an an un-clean
> ubifs and never allowing a safe shutdown so I would expect the journal
> to be wandering around.
>
>>> Should we be doing an erase block on every NAND block during our board
>>> manufacturing process to avoid this?
>>
>> Sorry, I don't understand this sentence.
>> Do you mean a full erasure of the whole NAND?
>> If so, it would not help as the bit flips can come later.
>> (Without writing/erasing the block)
>> The root cause is that your NFC cannot correct bit flips on empty pages.
>>
>>> It sounds like this 'unexpected bit-flips on erased pages from the
>>> mfg' issue is a ticking time-bomb for people using ubi/ubifs NAND.
>>> Shouldn't the http://www.linux-mtd.infradead.org/doc/ubifs.html page
>>> be updated to refer to this known issue as well as the unstable bit
>>> issue?
>>
>> As I said the root cause is that some NFCs cannot correct bit flips on empty
>> pages.
>> Instead of putting warnings to ubifs.html I'd love to see a solution on the
>> said drivers or MTD core.
>>
>>> I can add some debugging to find out - what specifically would be
>>> helpful to add?
>>
>> A hexdump of the buffer would be a good start.
>>
>>> Thanks for the help!
>>
>> Thanks for sharing your issues. This is the only way
>> to address them.
>> That said, as far on no board I had access to I was able to reproduce the unstable bits
>> issue. It was always something else.
>>
>> Thanks,
>> //richard
>
> I can provide dumps of various blocks if needed or add more debugging
> on the reads after the corruption occurred. It takes me a day or two
> to re-create the issue if you want me to turn on more debugging during
> the writes.
>
> I've cc'd Huang, Elie, and Brian who were involved in the patch to
> detect bit-flips in gpmi-nand.c reads - perhaps they have some more
> ideas. I find it interesting that in one case that patch resolves the
> issue and in the other it does not.
>
> Regards,
>
> Tim

Cc: Huang Shijie <shijie.huang@arm.com>

Updated Huang's e-mail as the old one bounced

Tim
