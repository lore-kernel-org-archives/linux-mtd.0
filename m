Received: from caladan.roxor.cx ([82.238.123.217])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9j3e-0002cb-IF
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 17:06:30 +0000
Date: Thu, 28 May 2009 19:06:21 +0200
From: =?utf-8?B?QXVyw6lsaWVuIEfDiVLDlE1F?= <ag@debian.org>
To: linux-mtd@lists.infradead.org
Subject: UBIFS: "sync" mount option does not work
Message-ID: <20090528170621.GJ18372@roxor.cx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Mounting a ubifs RedBoot partition located on a NOR flash as root
filesystem fails.

The kernel is an up-to-date 2.6.24 ubifs git backport.

It always works fine without the "sync" mount option, but I *really*
need to disable writeback.

Here is the full boot log.

RedBoot> exec -b 0x18000 -l 0x500000 -c "noinitrd console=3Dmxcuart,0x5000C=
000,115200n8 rootfstype=3Dubifs ubi.mtd=3Drootfs0 root=3Dubi0:rootfs rootfl=
ags=3Dsync ignore_loglevel"
Warning: invalid entry address but still continue ...
entry=3D0x80018000, target=3D0x80018000
[    0.000000] Linux version 2.6.24.6 (ag@debian.org) (gcc version 4.2.4 (D=
ebian 4.2.4-6)) #1 PREEMPT Thu May 28 18:22:53 CEST 2009
[    0.000000] CPU: ARMv6-compatible processor [4107b364] revision 4 (ARMv6=
TEJ), cr=3D00e5387f
[    0.000000] Machine: Freescale MX31/MX32 ADS
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 65536
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 4064 pages, LIFO batch:0
[    0.000000]   Normal zone: 480 pages used for memmap
[    0.000000]   Normal zone: 60960 pages, LIFO batch:15
[    0.000000]   Movable zone: 0 pages used for memmap
[    0.000000] CPU0: D VIPT write-back cache
[    0.000000] CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, =
128 sets
[    0.000000] CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, =
128 sets
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 65024
[    0.000000] Kernel command line: noinitrd console=3Dmxcuart,0x5000C000,1=
15200n8 rootfstype=3Dubifs ubi.mtd=3Drootfs0 root=3Dubi0:rootfs rootflags=
=3Dsync ignore_loglevel
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] MXC IRQ initialized
[    0.000000] PID hash table entries: 1024 (order: 10, 4096 bytes)
[    0.000000] MXC GPT timer initialized, rate =3D 19500000
[    0.000000] Console: colour dummy device 80x30
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 byt=
es)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.060000] Memory: 256MB =3D 256MB total
[    0.060000] Memory: 256420KB available (3040K code, 303K data, 88K init)
[    0.060000] Calibrating delay loop... 155.64 BogoMIPS (lpj=3D778240)
[    0.260000] Mount-cache hash table entries: 512
[    0.260000] CPU: Testing write buffer coherency: ok
[    0.260000] net_namespace: 64 bytes
[    0.270000] NET: Registered protocol family 16
[    0.270000] L2X0 cache controller enabled
[    0.280000] CPU is i.MX31 Revision 2.0
[    0.280000] Clock input source is 26000000
[    0.280000] MXC_Early serial console at MMIO 0x5000c000 (options '115200=
n8')
[    0.280000] console [mxcuart0] enabled
[    0.290000] MXC GPIO hardware
[    0.300000] Using SDMA I.API
[    0.300000] MXC DMA API initialized
[    0.320000] SCSI subsystem initialized
[    0.320000] libata version 3.00 loaded.
[    0.370000] NET: Registered protocol family 2
[    0.380000] Time: mxc_gpt clocksource has been installed.
[    0.380000] Switched to high resolution mode on CPU 0
[    0.490000] IP route cache hash table entries: 2048 (order: 1, 8192 byte=
s)
[    0.500000] TCP established hash table entries: 8192 (order: 4, 65536 by=
tes)
[    0.510000] TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
[    0.510000] TCP: Hash tables configured (established 8192 bind 8192)
[    0.520000] TCP reno registered
[    0.550000] Low-Level PM Driver module loaded
[    0.550000] Freescale i.MX31 Dynamic Power Management.
[    0.560000] usb: Host 2 host (isp1504) registered
[    0.560000] usb: DR gadget (isp1504) registered
[    0.570000] DPTC driver module loaded
[    0.570000] isp1504xc_init
[    0.590000] io scheduler noop registered
[    0.590000] io scheduler anticipatory registered
[    0.590000] io scheduler deadline registered
[    0.600000] io scheduler cfq registered (default)
[    0.660000] Serial: MXC Internal UART driver
[    0.670000] mxcintuart.0: ttymxc0 at MMIO 0x43f90000 (irq =3D 45) is a F=
reescale MXC
[    0.670000] mxcintuart.1: ttymxc1 at MMIO 0x43f94000 (irq =3D 32) is a F=
reescale MXC
[    0.680000] mxcintuart.2: ttymxc2 at MMIO 0x5000c000 (irq =3D 18) is a F=
reescale MXC
[    0.690000] PPP generic driver version 2.4.2
[    0.700000] PPP Deflate Compression module registered
[    0.700000] PPP BSD Compression module registered
[    0.710000] Driver 'sd' needs updating - please use bus_type methods
[    0.720000] scsi0 : pata_fsl
[    0.720000] ata1: PATA max PIO6 irq 15
[    0.930000] ata1.00: ATA-0: SILICONSYSTEMS INC 1GB, 241-0230, max MWDMA2
[    0.930000] ata1.00: 2046240 sectors, multi 0: LBA=20
[    0.960000] ata1.00: configured for PIO4
[    1.000000] ata1.00: configured for PIO4
[    1.000000] ata1: EH complete
[    1.000000] scsi 0:0:0:0: Direct-Access     ATA      SILICONSYSTEMS I 24=
1- PQ: 0 ANSI: 5
[    1.020000] sd 0:0:0:0: [sda] 2046240 512-byte hardware sectors (1048 MB)
[    1.020000] sd 0:0:0:0: [sda] Write Protect is off
[    1.030000] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.030000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[    1.040000] sd 0:0:0:0: [sda] 2046240 512-byte hardware sectors (1048 MB)
[    1.050000] sd 0:0:0:0: [sda] Write Protect is off
[    1.060000] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.060000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[    1.070000]  sda: sda1
[    1.080000] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.080000] MXC MTD nor Driver 2.0
[    1.100000] mxc_nor_flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
[    1.110000] mxc_nor_flash.0: Found 1 x16 devices at 0x8000000 in 16-bit =
bank
[    1.110000]  Amd/Fujitsu Extended Query Table at 0x0040
[    1.120000] mxc_nor_flash.0: CFI does not contain boot bank location. As=
suming top.
[    1.130000] number of CFI chips: 2
[    1.130000] cfi_cmdset_0002: Disabling erase-suspend-program due to code=
 brokenness.
[    1.140000] Searching for RedBoot partition table in mxc_nor_flash.0 at =
offset 0x40000
[    1.210000] 8 RedBoot partitions found on MTD device mxc_nor_flash.0
[    1.220000] Creating 8 MTD partitions on "mxc_nor_flash.0":
[    1.220000] 0x00000000-0x00040000 : "RedBoot"
[    1.230000] 0x00040000-0x00060000 : "FIS directory"
[    1.230000] 0x00060000-0x00061000 : "RedBoot config"
[    1.240000] mtd: partition "RedBoot config" doesn't end on an erase bloc=
k -- force read-only
[    1.250000] 0x00100000-0x00600000 : "vmlinux0"
[    1.250000] 0x00600000-0x08000000 : "rootfs0"
[    1.260000] 0x08000000-0x08100000 : "user"
[    1.270000] 0x08100000-0x08600000 : "vmlinux1"
[    1.270000] 0x08600000-0x10000000 : "rootfs1"
[    1.280000] UBI: attaching mtd4 to ubi0
[    1.280000] UBI DBG (pid 1): io_init: min_io_size      1
[    1.290000] UBI DBG (pid 1): io_init: hdrs_min_io_size 1
[    1.290000] UBI DBG (pid 1): io_init: ec_hdr_alsize    64
[    1.300000] UBI DBG (pid 1): io_init: vid_hdr_alsize   64
[    1.310000] UBI DBG (pid 1): io_init: vid_hdr_offset   64
[    1.310000] UBI DBG (pid 1): io_init: vid_hdr_aloffset 64
[    1.320000] UBI DBG (pid 1): io_init: vid_hdr_shift    0
[    1.320000] UBI DBG (pid 1): io_init: leb_start        128
[    1.330000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    1.330000] UBI: logical eraseblock size:    130944 bytes
[    1.340000] UBI: smallest flash I/O unit:    1
[    1.340000] UBI: VID header offset:          64 (aligned 64)
[    1.350000] UBI: data offset:                128
[    1.360000] UBI DBG (pid 1): ubi_scan: process PEB 0
[    1.360000] UBI DBG (pid 1): ubi_scan: process PEB 1
[    1.370000] UBI DBG (pid 1): ubi_scan: process PEB 2
[    1.370000] UBI DBG (pid 1): ubi_scan: process PEB 3
[    1.380000] UBI DBG (pid 1): ubi_scan: process PEB 4
[    1.380000] UBI DBG (pid 1): ubi_scan: process PEB 5
[    1.390000] UBI DBG (pid 1): ubi_scan: process PEB 6
[    1.390000] UBI DBG (pid 1): ubi_scan: process PEB 7
[    1.400000] UBI DBG (pid 1): ubi_scan: process PEB 8
[    1.400000] UBI DBG (pid 1): ubi_scan: process PEB 9
[    1.410000] UBI DBG (pid 1): ubi_scan: process PEB 10
[    1.410000] UBI DBG (pid 1): ubi_scan: process PEB 11
[    1.420000] UBI DBG (pid 1): ubi_scan: process PEB 12
[    1.420000] UBI DBG (pid 1): ubi_scan: process PEB 13
[    1.430000] UBI DBG (pid 1): ubi_scan: process PEB 14
[    1.430000] UBI DBG (pid 1): ubi_scan: process PEB 15
[    1.440000] UBI DBG (pid 1): ubi_scan: process PEB 16
[    1.440000] UBI DBG (pid 1): ubi_scan: process PEB 17
[    1.450000] UBI DBG (pid 1): ubi_scan: process PEB 18
[    1.450000] UBI DBG (pid 1): ubi_scan: process PEB 19
[    1.460000] UBI DBG (pid 1): ubi_scan: process PEB 20
[    1.460000] UBI DBG (pid 1): ubi_scan: process PEB 21
[    1.470000] UBI DBG (pid 1): ubi_scan: process PEB 22
[    1.470000] UBI DBG (pid 1): ubi_scan: process PEB 23
[    1.480000] UBI DBG (pid 1): ubi_scan: process PEB 24
[    1.480000] UBI DBG (pid 1): ubi_scan: process PEB 25
[    1.490000] UBI DBG (pid 1): ubi_scan: process PEB 26
[    1.500000] UBI DBG (pid 1): ubi_scan: process PEB 27
[    1.500000] UBI DBG (pid 1): ubi_scan: process PEB 28
[    1.510000] UBI DBG (pid 1): ubi_scan: process PEB 29
[    1.510000] UBI DBG (pid 1): ubi_scan: process PEB 30
[    1.520000] UBI DBG (pid 1): ubi_scan: process PEB 31
[    1.520000] UBI DBG (pid 1): ubi_scan: process PEB 32
[    1.530000] UBI DBG (pid 1): ubi_scan: process PEB 33
[    1.530000] UBI DBG (pid 1): ubi_scan: process PEB 34
[    1.540000] UBI DBG (pid 1): ubi_scan: process PEB 35
[    1.540000] UBI DBG (pid 1): ubi_scan: process PEB 36
[    1.550000] UBI DBG (pid 1): ubi_scan: process PEB 37
[    1.550000] UBI DBG (pid 1): ubi_scan: process PEB 38
[    1.560000] UBI DBG (pid 1): ubi_scan: process PEB 39
[    1.560000] UBI DBG (pid 1): ubi_scan: process PEB 40
[    1.570000] UBI DBG (pid 1): ubi_scan: process PEB 41
[    1.570000] UBI DBG (pid 1): ubi_scan: process PEB 42
[    1.580000] UBI DBG (pid 1): ubi_scan: process PEB 43
[    1.580000] UBI DBG (pid 1): ubi_scan: process PEB 44
[    1.590000] UBI DBG (pid 1): ubi_scan: process PEB 45
[    1.590000] UBI DBG (pid 1): ubi_scan: process PEB 46
[    1.600000] UBI DBG (pid 1): ubi_scan: process PEB 47
[    1.610000] UBI DBG (pid 1): ubi_scan: process PEB 48
[    1.610000] UBI DBG (pid 1): ubi_scan: process PEB 49
[    1.620000] UBI DBG (pid 1): ubi_scan: process PEB 50
[    1.620000] UBI DBG (pid 1): ubi_scan: process PEB 51
[    1.630000] UBI DBG (pid 1): ubi_scan: process PEB 52
[    1.630000] UBI DBG (pid 1): ubi_scan: process PEB 53
[    1.640000] UBI DBG (pid 1): ubi_scan: process PEB 54
[    1.640000] UBI DBG (pid 1): ubi_scan: process PEB 55
[    1.650000] UBI DBG (pid 1): ubi_scan: process PEB 56
[    1.650000] UBI DBG (pid 1): ubi_scan: process PEB 57
[    1.660000] UBI DBG (pid 1): ubi_scan: process PEB 58
[    1.660000] UBI DBG (pid 1): ubi_scan: process PEB 59
[    1.670000] UBI DBG (pid 1): ubi_scan: process PEB 60
[    1.670000] UBI DBG (pid 1): ubi_scan: process PEB 61
[    1.680000] UBI DBG (pid 1): ubi_scan: process PEB 62
[    1.680000] UBI DBG (pid 1): ubi_scan: process PEB 63
[    1.690000] UBI DBG (pid 1): ubi_scan: process PEB 64
[    1.690000] UBI DBG (pid 1): ubi_scan: process PEB 65
[    1.700000] UBI DBG (pid 1): ubi_scan: process PEB 66
[    1.700000] UBI DBG (pid 1): ubi_scan: process PEB 67
[    1.710000] UBI DBG (pid 1): ubi_scan: process PEB 68
[    1.710000] UBI DBG (pid 1): ubi_scan: process PEB 69
[    1.720000] UBI DBG (pid 1): ubi_scan: process PEB 70
[    1.730000] UBI DBG (pid 1): ubi_scan: process PEB 71
[    1.730000] UBI DBG (pid 1): ubi_scan: process PEB 72
[    1.740000] UBI DBG (pid 1): ubi_scan: process PEB 73
[    1.740000] UBI DBG (pid 1): ubi_scan: process PEB 74
[    1.750000] UBI DBG (pid 1): ubi_scan: process PEB 75
[    1.750000] UBI DBG (pid 1): ubi_scan: process PEB 76
[    1.760000] UBI DBG (pid 1): ubi_scan: process PEB 77
[    1.760000] UBI DBG (pid 1): ubi_scan: process PEB 78
[    1.770000] UBI DBG (pid 1): ubi_scan: process PEB 79
[    1.770000] UBI DBG (pid 1): ubi_scan: process PEB 80
[    1.780000] UBI DBG (pid 1): ubi_scan: process PEB 81
[    1.780000] UBI DBG (pid 1): ubi_scan: process PEB 82
[    1.790000] UBI DBG (pid 1): ubi_scan: process PEB 83
[    1.790000] UBI DBG (pid 1): ubi_scan: process PEB 84
[    1.800000] UBI DBG (pid 1): ubi_scan: process PEB 85
[    1.800000] UBI DBG (pid 1): ubi_scan: process PEB 86
[    1.810000] UBI DBG (pid 1): ubi_scan: process PEB 87
[    1.810000] UBI DBG (pid 1): ubi_scan: process PEB 88
[    1.820000] UBI DBG (pid 1): ubi_scan: process PEB 89
[    1.820000] UBI DBG (pid 1): ubi_scan: process PEB 90
[    1.830000] UBI DBG (pid 1): ubi_scan: process PEB 91
[    1.840000] UBI DBG (pid 1): ubi_scan: process PEB 92
[    1.840000] UBI DBG (pid 1): ubi_scan: process PEB 93
[    1.850000] UBI DBG (pid 1): ubi_scan: process PEB 94
[    1.850000] UBI DBG (pid 1): ubi_scan: process PEB 95
[    1.860000] UBI DBG (pid 1): ubi_scan: process PEB 96
[    1.860000] UBI DBG (pid 1): ubi_scan: process PEB 97
[    1.870000] UBI DBG (pid 1): ubi_scan: process PEB 98
[    1.870000] UBI DBG (pid 1): ubi_scan: process PEB 99
[    1.880000] UBI DBG (pid 1): ubi_scan: process PEB 100
[    1.880000] UBI DBG (pid 1): ubi_scan: process PEB 101
[    1.890000] UBI DBG (pid 1): ubi_scan: process PEB 102
[    1.890000] UBI DBG (pid 1): ubi_scan: process PEB 103
[    1.900000] UBI DBG (pid 1): ubi_scan: process PEB 104
[    1.900000] UBI DBG (pid 1): ubi_scan: process PEB 105
[    1.910000] UBI DBG (pid 1): ubi_scan: process PEB 106
[    1.910000] UBI DBG (pid 1): ubi_scan: process PEB 107
[    1.920000] UBI DBG (pid 1): ubi_scan: process PEB 108
[    1.920000] UBI DBG (pid 1): ubi_scan: process PEB 109
[    1.930000] UBI DBG (pid 1): ubi_scan: process PEB 110
[    1.940000] UBI DBG (pid 1): ubi_scan: process PEB 111
[    1.940000] UBI DBG (pid 1): ubi_scan: process PEB 112
[    1.950000] UBI DBG (pid 1): ubi_scan: process PEB 113
[    1.950000] UBI DBG (pid 1): ubi_scan: process PEB 114
[    1.960000] UBI DBG (pid 1): ubi_scan: process PEB 115
[    1.960000] UBI DBG (pid 1): ubi_scan: process PEB 116
[    1.970000] UBI DBG (pid 1): ubi_scan: process PEB 117
[    1.970000] UBI DBG (pid 1): ubi_scan: process PEB 118
[    1.980000] UBI DBG (pid 1): ubi_scan: process PEB 119
[    1.980000] UBI DBG (pid 1): ubi_scan: process PEB 120
[    1.990000] UBI DBG (pid 1): ubi_scan: process PEB 121
[    1.990000] UBI DBG (pid 1): ubi_scan: process PEB 122
[    2.000000] UBI DBG (pid 1): ubi_scan: process PEB 123
[    2.000000] UBI DBG (pid 1): ubi_scan: process PEB 124
[    2.010000] UBI DBG (pid 1): ubi_scan: process PEB 125
[    2.020000] UBI DBG (pid 1): ubi_scan: process PEB 126
[    2.020000] UBI DBG (pid 1): ubi_scan: process PEB 127
[    2.030000] UBI DBG (pid 1): ubi_scan: process PEB 128
[    2.030000] UBI DBG (pid 1): ubi_scan: process PEB 129
[    2.040000] UBI DBG (pid 1): ubi_scan: process PEB 130
[    2.040000] UBI DBG (pid 1): ubi_scan: process PEB 131
[    2.050000] UBI DBG (pid 1): ubi_scan: process PEB 132
[    2.050000] UBI DBG (pid 1): ubi_scan: process PEB 133
[    2.060000] UBI DBG (pid 1): ubi_scan: process PEB 134
[    2.060000] UBI DBG (pid 1): ubi_scan: process PEB 135
[    2.070000] UBI DBG (pid 1): ubi_scan: process PEB 136
[    2.070000] UBI DBG (pid 1): ubi_scan: process PEB 137
[    2.080000] UBI DBG (pid 1): ubi_scan: process PEB 138
[    2.080000] UBI DBG (pid 1): ubi_scan: process PEB 139
[    2.090000] UBI DBG (pid 1): ubi_scan: process PEB 140
[    2.100000] UBI DBG (pid 1): ubi_scan: process PEB 141
[    2.100000] UBI DBG (pid 1): ubi_scan: process PEB 142
[    2.110000] UBI DBG (pid 1): ubi_scan: process PEB 143
[    2.110000] UBI DBG (pid 1): ubi_scan: process PEB 144
[    2.120000] UBI DBG (pid 1): ubi_scan: process PEB 145
[    2.120000] UBI DBG (pid 1): ubi_scan: process PEB 146
[    2.130000] UBI DBG (pid 1): ubi_scan: process PEB 147
[    2.130000] UBI DBG (pid 1): ubi_scan: process PEB 148
[    2.140000] UBI DBG (pid 1): ubi_scan: process PEB 149
[    2.140000] UBI DBG (pid 1): ubi_scan: process PEB 150
[    2.150000] UBI DBG (pid 1): ubi_scan: process PEB 151
[    2.150000] UBI DBG (pid 1): ubi_scan: process PEB 152
[    2.160000] UBI DBG (pid 1): ubi_scan: process PEB 153
[    2.160000] UBI DBG (pid 1): ubi_scan: process PEB 154
[    2.170000] UBI DBG (pid 1): ubi_scan: process PEB 155
[    2.170000] UBI DBG (pid 1): ubi_scan: process PEB 156
[    2.180000] UBI DBG (pid 1): ubi_scan: process PEB 157
[    2.190000] UBI DBG (pid 1): ubi_scan: process PEB 158
[    2.190000] UBI DBG (pid 1): ubi_scan: process PEB 159
[    2.200000] UBI DBG (pid 1): ubi_scan: process PEB 160
[    2.200000] UBI DBG (pid 1): ubi_scan: process PEB 161
[    2.210000] UBI DBG (pid 1): ubi_scan: process PEB 162
[    2.210000] UBI DBG (pid 1): ubi_scan: process PEB 163
[    2.220000] UBI DBG (pid 1): ubi_scan: process PEB 164
[    2.220000] UBI DBG (pid 1): ubi_scan: process PEB 165
[    2.230000] UBI DBG (pid 1): ubi_scan: process PEB 166
[    2.230000] UBI DBG (pid 1): ubi_scan: process PEB 167
[    2.240000] UBI DBG (pid 1): ubi_scan: process PEB 168
[    2.240000] UBI DBG (pid 1): ubi_scan: process PEB 169
[    2.250000] UBI DBG (pid 1): ubi_scan: process PEB 170
[    2.250000] UBI DBG (pid 1): ubi_scan: process PEB 171
[    2.260000] UBI DBG (pid 1): ubi_scan: process PEB 172
[    2.270000] UBI DBG (pid 1): ubi_scan: process PEB 173
[    2.270000] UBI DBG (pid 1): ubi_scan: process PEB 174
[    2.280000] UBI DBG (pid 1): ubi_scan: process PEB 175
[    2.280000] UBI DBG (pid 1): ubi_scan: process PEB 176
[    2.290000] UBI DBG (pid 1): ubi_scan: process PEB 177
[    2.290000] UBI DBG (pid 1): ubi_scan: process PEB 178
[    2.300000] UBI DBG (pid 1): ubi_scan: process PEB 179
[    2.300000] UBI DBG (pid 1): ubi_scan: process PEB 180
[    2.310000] UBI DBG (pid 1): ubi_scan: process PEB 181
[    2.310000] UBI DBG (pid 1): ubi_scan: process PEB 182
[    2.320000] UBI DBG (pid 1): ubi_scan: process PEB 183
[    2.320000] UBI DBG (pid 1): ubi_scan: process PEB 184
[    2.330000] UBI DBG (pid 1): ubi_scan: process PEB 185
[    2.330000] UBI DBG (pid 1): ubi_scan: process PEB 186
[    2.340000] UBI DBG (pid 1): ubi_scan: process PEB 187
[    2.350000] UBI DBG (pid 1): ubi_scan: process PEB 188
[    2.350000] UBI DBG (pid 1): ubi_scan: process PEB 189
[    2.360000] UBI DBG (pid 1): ubi_scan: process PEB 190
[    2.360000] UBI DBG (pid 1): ubi_scan: process PEB 191
[    2.370000] UBI DBG (pid 1): ubi_scan: process PEB 192
[    2.370000] UBI DBG (pid 1): ubi_scan: process PEB 193
[    2.380000] UBI DBG (pid 1): ubi_scan: process PEB 194
[    2.380000] UBI DBG (pid 1): ubi_scan: process PEB 195
[    2.390000] UBI DBG (pid 1): ubi_scan: process PEB 196
[    2.390000] UBI DBG (pid 1): ubi_scan: process PEB 197
[    2.400000] UBI DBG (pid 1): ubi_scan: process PEB 198
[    2.400000] UBI DBG (pid 1): ubi_scan: process PEB 199
[    2.410000] UBI DBG (pid 1): ubi_scan: process PEB 200
[    2.410000] UBI DBG (pid 1): ubi_scan: process PEB 201
[    2.420000] UBI DBG (pid 1): ubi_scan: process PEB 202
[    2.420000] UBI DBG (pid 1): ubi_scan: process PEB 203
[    2.430000] UBI DBG (pid 1): ubi_scan: process PEB 204
[    2.440000] UBI DBG (pid 1): ubi_scan: process PEB 205
[    2.440000] UBI DBG (pid 1): ubi_scan: process PEB 206
[    2.450000] UBI DBG (pid 1): ubi_scan: process PEB 207
[    2.450000] UBI DBG (pid 1): ubi_scan: process PEB 208
[    2.460000] UBI DBG (pid 1): ubi_scan: process PEB 209
[    2.460000] UBI DBG (pid 1): ubi_scan: process PEB 210
[    2.470000] UBI DBG (pid 1): ubi_scan: process PEB 211
[    2.470000] UBI DBG (pid 1): ubi_scan: process PEB 212
[    2.480000] UBI DBG (pid 1): ubi_scan: process PEB 213
[    2.480000] UBI DBG (pid 1): ubi_scan: process PEB 214
[    2.490000] UBI DBG (pid 1): ubi_scan: process PEB 215
[    2.490000] UBI DBG (pid 1): ubi_scan: process PEB 216
[    2.500000] UBI DBG (pid 1): ubi_scan: process PEB 217
[    2.500000] UBI DBG (pid 1): ubi_scan: process PEB 218
[    2.510000] UBI DBG (pid 1): ubi_scan: process PEB 219
[    2.520000] UBI DBG (pid 1): ubi_scan: process PEB 220
[    2.520000] UBI DBG (pid 1): ubi_scan: process PEB 221
[    2.530000] UBI DBG (pid 1): ubi_scan: process PEB 222
[    2.530000] UBI DBG (pid 1): ubi_scan: process PEB 223
[    2.540000] UBI DBG (pid 1): ubi_scan: process PEB 224
[    2.540000] UBI DBG (pid 1): ubi_scan: process PEB 225
[    2.550000] UBI DBG (pid 1): ubi_scan: process PEB 226
[    2.550000] UBI DBG (pid 1): ubi_scan: process PEB 227
[    2.560000] UBI DBG (pid 1): ubi_scan: process PEB 228
[    2.560000] UBI DBG (pid 1): ubi_scan: process PEB 229
[    2.570000] UBI DBG (pid 1): ubi_scan: process PEB 230
[    2.570000] UBI DBG (pid 1): ubi_scan: process PEB 231
[    2.580000] UBI DBG (pid 1): ubi_scan: process PEB 232
[    2.580000] UBI DBG (pid 1): ubi_scan: process PEB 233
[    2.590000] UBI DBG (pid 1): ubi_scan: process PEB 234
[    2.590000] UBI DBG (pid 1): ubi_scan: process PEB 235
[    2.600000] UBI DBG (pid 1): ubi_scan: process PEB 236
[    2.610000] UBI DBG (pid 1): ubi_scan: process PEB 237
[    2.610000] UBI DBG (pid 1): ubi_scan: process PEB 238
[    2.620000] UBI DBG (pid 1): ubi_scan: process PEB 239
[    2.620000] UBI DBG (pid 1): ubi_scan: process PEB 240
[    2.630000] UBI DBG (pid 1): ubi_scan: process PEB 241
[    2.630000] UBI DBG (pid 1): ubi_scan: process PEB 242
[    2.640000] UBI DBG (pid 1): ubi_scan: process PEB 243
[    2.640000] UBI DBG (pid 1): ubi_scan: process PEB 244
[    2.650000] UBI DBG (pid 1): ubi_scan: process PEB 245
[    2.650000] UBI DBG (pid 1): ubi_scan: process PEB 246
[    2.660000] UBI DBG (pid 1): ubi_scan: process PEB 247
[    2.660000] UBI DBG (pid 1): ubi_scan: process PEB 248
[    2.670000] UBI DBG (pid 1): ubi_scan: process PEB 249
[    2.670000] UBI DBG (pid 1): ubi_scan: process PEB 250
[    2.680000] UBI DBG (pid 1): ubi_scan: process PEB 251
[    2.690000] UBI DBG (pid 1): ubi_scan: process PEB 252
[    2.690000] UBI DBG (pid 1): ubi_scan: process PEB 253
[    2.700000] UBI DBG (pid 1): ubi_scan: process PEB 254
[    2.700000] UBI DBG (pid 1): ubi_scan: process PEB 255
[    2.710000] UBI DBG (pid 1): ubi_scan: process PEB 256
[    2.710000] UBI DBG (pid 1): ubi_scan: process PEB 257
[    2.720000] UBI DBG (pid 1): ubi_scan: process PEB 258
[    2.720000] UBI DBG (pid 1): ubi_scan: process PEB 259
[    2.730000] UBI DBG (pid 1): ubi_scan: process PEB 260
[    2.730000] UBI DBG (pid 1): ubi_scan: process PEB 261
[    2.740000] UBI DBG (pid 1): ubi_scan: process PEB 262
[    2.740000] UBI DBG (pid 1): ubi_scan: process PEB 263
[    2.750000] UBI DBG (pid 1): ubi_scan: process PEB 264
[    2.750000] UBI DBG (pid 1): ubi_scan: process PEB 265
[    2.760000] UBI DBG (pid 1): ubi_scan: process PEB 266
[    2.760000] UBI DBG (pid 1): ubi_scan: process PEB 267
[    2.770000] UBI DBG (pid 1): ubi_scan: process PEB 268
[    2.780000] UBI DBG (pid 1): ubi_scan: process PEB 269
[    2.780000] UBI DBG (pid 1): ubi_scan: process PEB 270
[    2.790000] UBI DBG (pid 1): ubi_scan: process PEB 271
[    2.790000] UBI DBG (pid 1): ubi_scan: process PEB 272
[    2.800000] UBI DBG (pid 1): ubi_scan: process PEB 273
[    2.800000] UBI DBG (pid 1): ubi_scan: process PEB 274
[    2.810000] UBI DBG (pid 1): ubi_scan: process PEB 275
[    2.810000] UBI DBG (pid 1): ubi_scan: process PEB 276
[    2.820000] UBI DBG (pid 1): ubi_scan: process PEB 277
[    2.820000] UBI DBG (pid 1): ubi_scan: process PEB 278
[    2.830000] UBI DBG (pid 1): ubi_scan: process PEB 279
[    2.830000] UBI DBG (pid 1): ubi_scan: process PEB 280
[    2.840000] UBI DBG (pid 1): ubi_scan: process PEB 281
[    2.840000] UBI DBG (pid 1): ubi_scan: process PEB 282
[    2.850000] UBI DBG (pid 1): ubi_scan: process PEB 283
[    2.860000] UBI DBG (pid 1): ubi_scan: process PEB 284
[    2.860000] UBI DBG (pid 1): ubi_scan: process PEB 285
[    2.870000] UBI DBG (pid 1): ubi_scan: process PEB 286
[    2.870000] UBI DBG (pid 1): ubi_scan: process PEB 287
[    2.880000] UBI DBG (pid 1): ubi_scan: process PEB 288
[    2.880000] UBI DBG (pid 1): ubi_scan: process PEB 289
[    2.890000] UBI DBG (pid 1): ubi_scan: process PEB 290
[    2.890000] UBI DBG (pid 1): ubi_scan: process PEB 291
[    2.900000] UBI DBG (pid 1): ubi_scan: process PEB 292
[    2.900000] UBI DBG (pid 1): ubi_scan: process PEB 293
[    2.910000] UBI DBG (pid 1): ubi_scan: process PEB 294
[    2.910000] UBI DBG (pid 1): ubi_scan: process PEB 295
[    2.920000] UBI DBG (pid 1): ubi_scan: process PEB 296
[    2.920000] UBI DBG (pid 1): ubi_scan: process PEB 297
[    2.930000] UBI DBG (pid 1): ubi_scan: process PEB 298
[    2.940000] UBI DBG (pid 1): ubi_scan: process PEB 299
[    2.940000] UBI DBG (pid 1): ubi_scan: process PEB 300
[    2.950000] UBI DBG (pid 1): ubi_scan: process PEB 301
[    2.950000] UBI DBG (pid 1): ubi_scan: process PEB 302
[    2.960000] UBI DBG (pid 1): ubi_scan: process PEB 303
[    2.960000] UBI DBG (pid 1): ubi_scan: process PEB 304
[    2.970000] UBI DBG (pid 1): ubi_scan: process PEB 305
[    2.970000] UBI DBG (pid 1): ubi_scan: process PEB 306
[    2.980000] UBI DBG (pid 1): ubi_scan: process PEB 307
[    2.980000] UBI DBG (pid 1): ubi_scan: process PEB 308
[    2.990000] UBI DBG (pid 1): ubi_scan: process PEB 309
[    2.990000] UBI DBG (pid 1): ubi_scan: process PEB 310
[    3.000000] UBI DBG (pid 1): ubi_scan: process PEB 311
[    3.000000] UBI DBG (pid 1): ubi_scan: process PEB 312
[    3.010000] UBI DBG (pid 1): ubi_scan: process PEB 313
[    3.010000] UBI DBG (pid 1): ubi_scan: process PEB 314
[    3.020000] UBI DBG (pid 1): ubi_scan: process PEB 315
[    3.030000] UBI DBG (pid 1): ubi_scan: process PEB 316
[    3.030000] UBI DBG (pid 1): ubi_scan: process PEB 317
[    3.040000] UBI DBG (pid 1): ubi_scan: process PEB 318
[    3.040000] UBI DBG (pid 1): ubi_scan: process PEB 319
[    3.050000] UBI DBG (pid 1): ubi_scan: process PEB 320
[    3.050000] UBI DBG (pid 1): ubi_scan: process PEB 321
[    3.060000] UBI DBG (pid 1): ubi_scan: process PEB 322
[    3.060000] UBI DBG (pid 1): ubi_scan: process PEB 323
[    3.070000] UBI DBG (pid 1): ubi_scan: process PEB 324
[    3.070000] UBI DBG (pid 1): ubi_scan: process PEB 325
[    3.080000] UBI DBG (pid 1): ubi_scan: process PEB 326
[    3.080000] UBI DBG (pid 1): ubi_scan: process PEB 327
[    3.090000] UBI DBG (pid 1): ubi_scan: process PEB 328
[    3.090000] UBI DBG (pid 1): ubi_scan: process PEB 329
[    3.100000] UBI DBG (pid 1): ubi_scan: process PEB 330
[    3.100000] UBI DBG (pid 1): ubi_scan: process PEB 331
[    3.110000] UBI DBG (pid 1): ubi_scan: process PEB 332
[    3.120000] UBI DBG (pid 1): ubi_scan: process PEB 333
[    3.120000] UBI DBG (pid 1): ubi_scan: process PEB 334
[    3.130000] UBI DBG (pid 1): ubi_scan: process PEB 335
[    3.130000] UBI DBG (pid 1): ubi_scan: process PEB 336
[    3.140000] UBI DBG (pid 1): ubi_scan: process PEB 337
[    3.140000] UBI DBG (pid 1): ubi_scan: process PEB 338
[    3.150000] UBI DBG (pid 1): ubi_scan: process PEB 339
[    3.150000] UBI DBG (pid 1): ubi_scan: process PEB 340
[    3.160000] UBI DBG (pid 1): ubi_scan: process PEB 341
[    3.160000] UBI DBG (pid 1): ubi_scan: process PEB 342
[    3.170000] UBI DBG (pid 1): ubi_scan: process PEB 343
[    3.170000] UBI DBG (pid 1): ubi_scan: process PEB 344
[    3.180000] UBI DBG (pid 1): ubi_scan: process PEB 345
[    3.180000] UBI DBG (pid 1): ubi_scan: process PEB 346
[    3.190000] UBI DBG (pid 1): ubi_scan: process PEB 347
[    3.200000] UBI DBG (pid 1): ubi_scan: process PEB 348
[    3.200000] UBI DBG (pid 1): ubi_scan: process PEB 349
[    3.210000] UBI DBG (pid 1): ubi_scan: process PEB 350
[    3.210000] UBI DBG (pid 1): ubi_scan: process PEB 351
[    3.220000] UBI DBG (pid 1): ubi_scan: process PEB 352
[    3.220000] UBI DBG (pid 1): ubi_scan: process PEB 353
[    3.230000] UBI DBG (pid 1): ubi_scan: process PEB 354
[    3.230000] UBI DBG (pid 1): ubi_scan: process PEB 355
[    3.240000] UBI DBG (pid 1): ubi_scan: process PEB 356
[    3.240000] UBI DBG (pid 1): ubi_scan: process PEB 357
[    3.250000] UBI DBG (pid 1): ubi_scan: process PEB 358
[    3.250000] UBI DBG (pid 1): ubi_scan: process PEB 359
[    3.260000] UBI DBG (pid 1): ubi_scan: process PEB 360
[    3.260000] UBI DBG (pid 1): ubi_scan: process PEB 361
[    3.270000] UBI DBG (pid 1): ubi_scan: process PEB 362
[    3.270000] UBI DBG (pid 1): ubi_scan: process PEB 363
[    3.280000] UBI DBG (pid 1): ubi_scan: process PEB 364
[    3.290000] UBI DBG (pid 1): ubi_scan: process PEB 365
[    3.290000] UBI DBG (pid 1): ubi_scan: process PEB 366
[    3.300000] UBI DBG (pid 1): ubi_scan: process PEB 367
[    3.300000] UBI DBG (pid 1): ubi_scan: process PEB 368
[    3.310000] UBI DBG (pid 1): ubi_scan: process PEB 369
[    3.310000] UBI DBG (pid 1): ubi_scan: process PEB 370
[    3.320000] UBI DBG (pid 1): ubi_scan: process PEB 371
[    3.320000] UBI DBG (pid 1): ubi_scan: process PEB 372
[    3.330000] UBI DBG (pid 1): ubi_scan: process PEB 373
[    3.330000] UBI DBG (pid 1): ubi_scan: process PEB 374
[    3.340000] UBI DBG (pid 1): ubi_scan: process PEB 375
[    3.340000] UBI DBG (pid 1): ubi_scan: process PEB 376
[    3.350000] UBI DBG (pid 1): ubi_scan: process PEB 377
[    3.350000] UBI DBG (pid 1): ubi_scan: process PEB 378
[    3.360000] UBI DBG (pid 1): ubi_scan: process PEB 379
[    3.370000] UBI DBG (pid 1): ubi_scan: process PEB 380
[    3.370000] UBI DBG (pid 1): ubi_scan: process PEB 381
[    3.380000] UBI DBG (pid 1): ubi_scan: process PEB 382
[    3.380000] UBI DBG (pid 1): ubi_scan: process PEB 383
[    3.390000] UBI DBG (pid 1): ubi_scan: process PEB 384
[    3.390000] UBI DBG (pid 1): ubi_scan: process PEB 385
[    3.400000] UBI DBG (pid 1): ubi_scan: process PEB 386
[    3.400000] UBI DBG (pid 1): ubi_scan: process PEB 387
[    3.410000] UBI DBG (pid 1): ubi_scan: process PEB 388
[    3.410000] UBI DBG (pid 1): ubi_scan: process PEB 389
[    3.420000] UBI DBG (pid 1): ubi_scan: process PEB 390
[    3.420000] UBI DBG (pid 1): ubi_scan: process PEB 391
[    3.430000] UBI DBG (pid 1): ubi_scan: process PEB 392
[    3.430000] UBI DBG (pid 1): ubi_scan: process PEB 393
[    3.440000] UBI DBG (pid 1): ubi_scan: process PEB 394
[    3.440000] UBI DBG (pid 1): ubi_scan: process PEB 395
[    3.450000] UBI DBG (pid 1): ubi_scan: process PEB 396
[    3.460000] UBI DBG (pid 1): ubi_scan: process PEB 397
[    3.460000] UBI DBG (pid 1): ubi_scan: process PEB 398
[    3.470000] UBI DBG (pid 1): ubi_scan: process PEB 399
[    3.470000] UBI DBG (pid 1): ubi_scan: process PEB 400
[    3.480000] UBI DBG (pid 1): ubi_scan: process PEB 401
[    3.480000] UBI DBG (pid 1): ubi_scan: process PEB 402
[    3.490000] UBI DBG (pid 1): ubi_scan: process PEB 403
[    3.490000] UBI DBG (pid 1): ubi_scan: process PEB 404
[    3.500000] UBI DBG (pid 1): ubi_scan: process PEB 405
[    3.500000] UBI DBG (pid 1): ubi_scan: process PEB 406
[    3.510000] UBI DBG (pid 1): ubi_scan: process PEB 407
[    3.510000] UBI DBG (pid 1): ubi_scan: process PEB 408
[    3.520000] UBI DBG (pid 1): ubi_scan: process PEB 409
[    3.520000] UBI DBG (pid 1): ubi_scan: process PEB 410
[    3.530000] UBI DBG (pid 1): ubi_scan: process PEB 411
[    3.530000] UBI DBG (pid 1): ubi_scan: process PEB 412
[    3.540000] UBI DBG (pid 1): ubi_scan: process PEB 413
[    3.550000] UBI DBG (pid 1): ubi_scan: process PEB 414
[    3.550000] UBI DBG (pid 1): ubi_scan: process PEB 415
[    3.560000] UBI DBG (pid 1): ubi_scan: process PEB 416
[    3.560000] UBI DBG (pid 1): ubi_scan: process PEB 417
[    3.570000] UBI DBG (pid 1): ubi_scan: process PEB 418
[    3.570000] UBI DBG (pid 1): ubi_scan: process PEB 419
[    3.580000] UBI DBG (pid 1): ubi_scan: process PEB 420
[    3.580000] UBI DBG (pid 1): ubi_scan: process PEB 421
[    3.590000] UBI DBG (pid 1): ubi_scan: process PEB 422
[    3.590000] UBI DBG (pid 1): ubi_scan: process PEB 423
[    3.600000] UBI DBG (pid 1): ubi_scan: process PEB 424
[    3.600000] UBI DBG (pid 1): ubi_scan: process PEB 425
[    3.610000] UBI DBG (pid 1): ubi_scan: process PEB 426
[    3.610000] UBI DBG (pid 1): ubi_scan: process PEB 427
[    3.620000] UBI DBG (pid 1): ubi_scan: process PEB 428
[    3.620000] UBI DBG (pid 1): ubi_scan: process PEB 429
[    3.630000] UBI DBG (pid 1): ubi_scan: process PEB 430
[    3.640000] UBI DBG (pid 1): ubi_scan: process PEB 431
[    3.640000] UBI DBG (pid 1): ubi_scan: process PEB 432
[    3.650000] UBI DBG (pid 1): ubi_scan: process PEB 433
[    3.650000] UBI DBG (pid 1): ubi_scan: process PEB 434
[    3.660000] UBI DBG (pid 1): ubi_scan: process PEB 435
[    3.660000] UBI DBG (pid 1): ubi_scan: process PEB 436
[    3.670000] UBI DBG (pid 1): ubi_scan: process PEB 437
[    3.670000] UBI DBG (pid 1): ubi_scan: process PEB 438
[    3.680000] UBI DBG (pid 1): ubi_scan: process PEB 439
[    3.680000] UBI DBG (pid 1): ubi_scan: process PEB 440
[    3.690000] UBI DBG (pid 1): ubi_scan: process PEB 441
[    3.690000] UBI DBG (pid 1): ubi_scan: process PEB 442
[    3.700000] UBI DBG (pid 1): ubi_scan: process PEB 443
[    3.700000] UBI DBG (pid 1): ubi_scan: process PEB 444
[    3.710000] UBI DBG (pid 1): ubi_scan: process PEB 445
[    3.710000] UBI DBG (pid 1): ubi_scan: process PEB 446
[    3.720000] UBI DBG (pid 1): ubi_scan: process PEB 447
[    3.730000] UBI DBG (pid 1): ubi_scan: process PEB 448
[    3.730000] UBI DBG (pid 1): ubi_scan: process PEB 449
[    3.740000] UBI DBG (pid 1): ubi_scan: process PEB 450
[    3.740000] UBI DBG (pid 1): ubi_scan: process PEB 451
[    3.750000] UBI DBG (pid 1): ubi_scan: process PEB 452
[    3.750000] UBI DBG (pid 1): ubi_scan: process PEB 453
[    3.760000] UBI DBG (pid 1): ubi_scan: process PEB 454
[    3.760000] UBI DBG (pid 1): ubi_scan: process PEB 455
[    3.770000] UBI DBG (pid 1): ubi_scan: process PEB 456
[    3.770000] UBI DBG (pid 1): ubi_scan: process PEB 457
[    3.780000] UBI DBG (pid 1): ubi_scan: process PEB 458
[    3.780000] UBI DBG (pid 1): ubi_scan: process PEB 459
[    3.790000] UBI DBG (pid 1): ubi_scan: process PEB 460
[    3.790000] UBI DBG (pid 1): ubi_scan: process PEB 461
[    3.800000] UBI DBG (pid 1): ubi_scan: process PEB 462
[    3.810000] UBI DBG (pid 1): ubi_scan: process PEB 463
[    3.810000] UBI DBG (pid 1): ubi_scan: process PEB 464
[    3.820000] UBI DBG (pid 1): ubi_scan: process PEB 465
[    3.820000] UBI DBG (pid 1): ubi_scan: process PEB 466
[    3.830000] UBI DBG (pid 1): ubi_scan: process PEB 467
[    3.830000] UBI DBG (pid 1): ubi_scan: process PEB 468
[    3.840000] UBI DBG (pid 1): ubi_scan: process PEB 469
[    3.840000] UBI DBG (pid 1): ubi_scan: process PEB 470
[    3.850000] UBI DBG (pid 1): ubi_scan: process PEB 471
[    3.850000] UBI DBG (pid 1): ubi_scan: process PEB 472
[    3.860000] UBI DBG (pid 1): ubi_scan: process PEB 473
[    3.860000] UBI DBG (pid 1): ubi_scan: process PEB 474
[    3.870000] UBI DBG (pid 1): ubi_scan: process PEB 475
[    3.870000] UBI DBG (pid 1): ubi_scan: process PEB 476
[    3.880000] UBI DBG (pid 1): ubi_scan: process PEB 477
[    3.880000] UBI DBG (pid 1): ubi_scan: process PEB 478
[    3.890000] UBI DBG (pid 1): ubi_scan: process PEB 479
[    3.900000] UBI DBG (pid 1): ubi_scan: process PEB 480
[    3.900000] UBI DBG (pid 1): ubi_scan: process PEB 481
[    3.910000] UBI DBG (pid 1): ubi_scan: process PEB 482
[    3.910000] UBI DBG (pid 1): ubi_scan: process PEB 483
[    3.920000] UBI DBG (pid 1): ubi_scan: process PEB 484
[    3.920000] UBI DBG (pid 1): ubi_scan: process PEB 485
[    3.930000] UBI DBG (pid 1): ubi_scan: process PEB 486
[    3.930000] UBI DBG (pid 1): ubi_scan: process PEB 487
[    3.940000] UBI DBG (pid 1): ubi_scan: process PEB 488
[    3.940000] UBI DBG (pid 1): ubi_scan: process PEB 489
[    3.950000] UBI DBG (pid 1): ubi_scan: process PEB 490
[    3.950000] UBI DBG (pid 1): ubi_scan: process PEB 491
[    3.960000] UBI DBG (pid 1): ubi_scan: process PEB 492
[    3.960000] UBI DBG (pid 1): ubi_scan: process PEB 493
[    3.970000] UBI DBG (pid 1): ubi_scan: process PEB 494
[    3.970000] UBI DBG (pid 1): ubi_scan: process PEB 495
[    3.980000] UBI DBG (pid 1): ubi_scan: process PEB 496
[    3.990000] UBI DBG (pid 1): ubi_scan: process PEB 497
[    3.990000] UBI DBG (pid 1): ubi_scan: process PEB 498
[    4.000000] UBI DBG (pid 1): ubi_scan: process PEB 499
[    4.000000] UBI DBG (pid 1): ubi_scan: process PEB 500
[    4.010000] UBI DBG (pid 1): ubi_scan: process PEB 501
[    4.010000] UBI DBG (pid 1): ubi_scan: process PEB 502
[    4.020000] UBI DBG (pid 1): ubi_scan: process PEB 503
[    4.020000] UBI DBG (pid 1): ubi_scan: process PEB 504
[    4.030000] UBI DBG (pid 1): ubi_scan: process PEB 505
[    4.030000] UBI DBG (pid 1): ubi_scan: process PEB 506
[    4.040000] UBI DBG (pid 1): ubi_scan: process PEB 507
[    4.040000] UBI DBG (pid 1): ubi_scan: process PEB 508
[    4.050000] UBI DBG (pid 1): ubi_scan: process PEB 509
[    4.050000] UBI DBG (pid 1): ubi_scan: process PEB 510
[    4.060000] UBI DBG (pid 1): ubi_scan: process PEB 511
[    4.060000] UBI DBG (pid 1): ubi_scan: process PEB 512
[    4.070000] UBI DBG (pid 1): ubi_scan: process PEB 513
[    4.080000] UBI DBG (pid 1): ubi_scan: process PEB 514
[    4.080000] UBI DBG (pid 1): ubi_scan: process PEB 515
[    4.090000] UBI DBG (pid 1): ubi_scan: process PEB 516
[    4.090000] UBI DBG (pid 1): ubi_scan: process PEB 517
[    4.100000] UBI DBG (pid 1): ubi_scan: process PEB 518
[    4.100000] UBI DBG (pid 1): ubi_scan: process PEB 519
[    4.110000] UBI DBG (pid 1): ubi_scan: process PEB 520
[    4.110000] UBI DBG (pid 1): ubi_scan: process PEB 521
[    4.120000] UBI DBG (pid 1): ubi_scan: process PEB 522
[    4.120000] UBI DBG (pid 1): ubi_scan: process PEB 523
[    4.130000] UBI DBG (pid 1): ubi_scan: process PEB 524
[    4.130000] UBI DBG (pid 1): ubi_scan: process PEB 525
[    4.140000] UBI DBG (pid 1): ubi_scan: process PEB 526
[    4.140000] UBI DBG (pid 1): ubi_scan: process PEB 527
[    4.150000] UBI DBG (pid 1): ubi_scan: process PEB 528
[    4.160000] UBI DBG (pid 1): ubi_scan: process PEB 529
[    4.160000] UBI DBG (pid 1): ubi_scan: process PEB 530
[    4.170000] UBI DBG (pid 1): ubi_scan: process PEB 531
[    4.170000] UBI DBG (pid 1): ubi_scan: process PEB 532
[    4.180000] UBI DBG (pid 1): ubi_scan: process PEB 533
[    4.180000] UBI DBG (pid 1): ubi_scan: process PEB 534
[    4.190000] UBI DBG (pid 1): ubi_scan: process PEB 535
[    4.190000] UBI DBG (pid 1): ubi_scan: process PEB 536
[    4.200000] UBI DBG (pid 1): ubi_scan: process PEB 537
[    4.200000] UBI DBG (pid 1): ubi_scan: process PEB 538
[    4.210000] UBI DBG (pid 1): ubi_scan: process PEB 539
[    4.210000] UBI DBG (pid 1): ubi_scan: process PEB 540
[    4.220000] UBI DBG (pid 1): ubi_scan: process PEB 541
[    4.220000] UBI DBG (pid 1): ubi_scan: process PEB 542
[    4.230000] UBI DBG (pid 1): ubi_scan: process PEB 543
[    4.230000] UBI DBG (pid 1): ubi_scan: process PEB 544
[    4.240000] UBI DBG (pid 1): ubi_scan: process PEB 545
[    4.250000] UBI DBG (pid 1): ubi_scan: process PEB 546
[    4.250000] UBI DBG (pid 1): ubi_scan: process PEB 547
[    4.260000] UBI DBG (pid 1): ubi_scan: process PEB 548
[    4.260000] UBI DBG (pid 1): ubi_scan: process PEB 549
[    4.270000] UBI DBG (pid 1): ubi_scan: process PEB 550
[    4.270000] UBI DBG (pid 1): ubi_scan: process PEB 551
[    4.280000] UBI DBG (pid 1): ubi_scan: process PEB 552
[    4.280000] UBI DBG (pid 1): ubi_scan: process PEB 553
[    4.290000] UBI DBG (pid 1): ubi_scan: process PEB 554
[    4.290000] UBI DBG (pid 1): ubi_scan: process PEB 555
[    4.300000] UBI DBG (pid 1): ubi_scan: process PEB 556
[    4.300000] UBI DBG (pid 1): ubi_scan: process PEB 557
[    4.310000] UBI DBG (pid 1): ubi_scan: process PEB 558
[    4.310000] UBI DBG (pid 1): ubi_scan: process PEB 559
[    4.320000] UBI DBG (pid 1): ubi_scan: process PEB 560
[    4.320000] UBI DBG (pid 1): ubi_scan: process PEB 561
[    4.330000] UBI DBG (pid 1): ubi_scan: process PEB 562
[    4.340000] UBI DBG (pid 1): ubi_scan: process PEB 563
[    4.340000] UBI DBG (pid 1): ubi_scan: process PEB 564
[    4.350000] UBI DBG (pid 1): ubi_scan: process PEB 565
[    4.350000] UBI DBG (pid 1): ubi_scan: process PEB 566
[    4.360000] UBI DBG (pid 1): ubi_scan: process PEB 567
[    4.360000] UBI DBG (pid 1): ubi_scan: process PEB 568
[    4.370000] UBI DBG (pid 1): ubi_scan: process PEB 569
[    4.370000] UBI DBG (pid 1): ubi_scan: process PEB 570
[    4.380000] UBI DBG (pid 1): ubi_scan: process PEB 571
[    4.380000] UBI DBG (pid 1): ubi_scan: process PEB 572
[    4.390000] UBI DBG (pid 1): ubi_scan: process PEB 573
[    4.390000] UBI DBG (pid 1): ubi_scan: process PEB 574
[    4.400000] UBI DBG (pid 1): ubi_scan: process PEB 575
[    4.400000] UBI DBG (pid 1): ubi_scan: process PEB 576
[    4.410000] UBI DBG (pid 1): ubi_scan: process PEB 577
[    4.410000] UBI DBG (pid 1): ubi_scan: process PEB 578
[    4.420000] UBI DBG (pid 1): ubi_scan: process PEB 579
[    4.430000] UBI DBG (pid 1): ubi_scan: process PEB 580
[    4.430000] UBI DBG (pid 1): ubi_scan: process PEB 581
[    4.440000] UBI DBG (pid 1): ubi_scan: process PEB 582
[    4.440000] UBI DBG (pid 1): ubi_scan: process PEB 583
[    4.450000] UBI DBG (pid 1): ubi_scan: process PEB 584
[    4.450000] UBI DBG (pid 1): ubi_scan: process PEB 585
[    4.460000] UBI DBG (pid 1): ubi_scan: process PEB 586
[    4.460000] UBI DBG (pid 1): ubi_scan: process PEB 587
[    4.470000] UBI DBG (pid 1): ubi_scan: process PEB 588
[    4.470000] UBI DBG (pid 1): ubi_scan: process PEB 589
[    4.480000] UBI DBG (pid 1): ubi_scan: process PEB 590
[    4.480000] UBI DBG (pid 1): ubi_scan: process PEB 591
[    4.490000] UBI DBG (pid 1): ubi_scan: process PEB 592
[    4.490000] UBI DBG (pid 1): ubi_scan: process PEB 593
[    4.500000] UBI DBG (pid 1): ubi_scan: process PEB 594
[    4.510000] UBI DBG (pid 1): ubi_scan: process PEB 595
[    4.510000] UBI DBG (pid 1): ubi_scan: process PEB 596
[    4.520000] UBI DBG (pid 1): ubi_scan: process PEB 597
[    4.520000] UBI DBG (pid 1): ubi_scan: process PEB 598
[    4.530000] UBI DBG (pid 1): ubi_scan: process PEB 599
[    4.530000] UBI DBG (pid 1): ubi_scan: process PEB 600
[    4.540000] UBI DBG (pid 1): ubi_scan: process PEB 601
[    4.540000] UBI DBG (pid 1): ubi_scan: process PEB 602
[    4.550000] UBI DBG (pid 1): ubi_scan: process PEB 603
[    4.550000] UBI DBG (pid 1): ubi_scan: process PEB 604
[    4.560000] UBI DBG (pid 1): ubi_scan: process PEB 605
[    4.560000] UBI DBG (pid 1): ubi_scan: process PEB 606
[    4.570000] UBI DBG (pid 1): ubi_scan: process PEB 607
[    4.570000] UBI DBG (pid 1): ubi_scan: process PEB 608
[    4.580000] UBI DBG (pid 1): ubi_scan: process PEB 609
[    4.580000] UBI DBG (pid 1): ubi_scan: process PEB 610
[    4.590000] UBI DBG (pid 1): ubi_scan: process PEB 611
[    4.600000] UBI DBG (pid 1): ubi_scan: process PEB 612
[    4.600000] UBI DBG (pid 1): ubi_scan: process PEB 613
[    4.610000] UBI DBG (pid 1): ubi_scan: process PEB 614
[    4.610000] UBI DBG (pid 1): ubi_scan: process PEB 615
[    4.620000] UBI DBG (pid 1): ubi_scan: process PEB 616
[    4.620000] UBI DBG (pid 1): ubi_scan: process PEB 617
[    4.630000] UBI DBG (pid 1): ubi_scan: process PEB 618
[    4.630000] UBI DBG (pid 1): ubi_scan: process PEB 619
[    4.640000] UBI DBG (pid 1): ubi_scan: process PEB 620
[    4.640000] UBI DBG (pid 1): ubi_scan: process PEB 621
[    4.650000] UBI DBG (pid 1): ubi_scan: process PEB 622
[    4.650000] UBI DBG (pid 1): ubi_scan: process PEB 623
[    4.660000] UBI DBG (pid 1): ubi_scan: process PEB 624
[    4.660000] UBI DBG (pid 1): ubi_scan: process PEB 625
[    4.670000] UBI DBG (pid 1): ubi_scan: process PEB 626
[    4.670000] UBI DBG (pid 1): ubi_scan: process PEB 627
[    4.680000] UBI DBG (pid 1): ubi_scan: process PEB 628
[    4.690000] UBI DBG (pid 1): ubi_scan: process PEB 629
[    4.690000] UBI DBG (pid 1): ubi_scan: process PEB 630
[    4.700000] UBI DBG (pid 1): ubi_scan: process PEB 631
[    4.700000] UBI DBG (pid 1): ubi_scan: process PEB 632
[    4.710000] UBI DBG (pid 1): ubi_scan: process PEB 633
[    4.710000] UBI DBG (pid 1): ubi_scan: process PEB 634
[    4.720000] UBI DBG (pid 1): ubi_scan: process PEB 635
[    4.720000] UBI DBG (pid 1): ubi_scan: process PEB 636
[    4.730000] UBI DBG (pid 1): ubi_scan: process PEB 637
[    4.730000] UBI DBG (pid 1): ubi_scan: process PEB 638
[    4.740000] UBI DBG (pid 1): ubi_scan: process PEB 639
[    4.740000] UBI DBG (pid 1): ubi_scan: process PEB 640
[    4.750000] UBI DBG (pid 1): ubi_scan: process PEB 641
[    4.750000] UBI DBG (pid 1): ubi_scan: process PEB 642
[    4.760000] UBI DBG (pid 1): ubi_scan: process PEB 643
[    4.760000] UBI DBG (pid 1): ubi_scan: process PEB 644
[    4.770000] UBI DBG (pid 1): ubi_scan: process PEB 645
[    4.780000] UBI DBG (pid 1): ubi_scan: process PEB 646
[    4.780000] UBI DBG (pid 1): ubi_scan: process PEB 647
[    4.790000] UBI DBG (pid 1): ubi_scan: process PEB 648
[    4.790000] UBI DBG (pid 1): ubi_scan: process PEB 649
[    4.800000] UBI DBG (pid 1): ubi_scan: process PEB 650
[    4.800000] UBI DBG (pid 1): ubi_scan: process PEB 651
[    4.810000] UBI DBG (pid 1): ubi_scan: process PEB 652
[    4.810000] UBI DBG (pid 1): ubi_scan: process PEB 653
[    4.820000] UBI DBG (pid 1): ubi_scan: process PEB 654
[    4.820000] UBI DBG (pid 1): ubi_scan: process PEB 655
[    4.830000] UBI DBG (pid 1): ubi_scan: process PEB 656
[    4.830000] UBI DBG (pid 1): ubi_scan: process PEB 657
[    4.840000] UBI DBG (pid 1): ubi_scan: process PEB 658
[    4.840000] UBI DBG (pid 1): ubi_scan: process PEB 659
[    4.850000] UBI DBG (pid 1): ubi_scan: process PEB 660
[    4.860000] UBI DBG (pid 1): ubi_scan: process PEB 661
[    4.860000] UBI DBG (pid 1): ubi_scan: process PEB 662
[    4.870000] UBI DBG (pid 1): ubi_scan: process PEB 663
[    4.870000] UBI DBG (pid 1): ubi_scan: process PEB 664
[    4.880000] UBI DBG (pid 1): ubi_scan: process PEB 665
[    4.880000] UBI DBG (pid 1): ubi_scan: process PEB 666
[    4.890000] UBI DBG (pid 1): ubi_scan: process PEB 667
[    4.890000] UBI DBG (pid 1): ubi_scan: process PEB 668
[    4.900000] UBI DBG (pid 1): ubi_scan: process PEB 669
[    4.900000] UBI DBG (pid 1): ubi_scan: process PEB 670
[    4.910000] UBI DBG (pid 1): ubi_scan: process PEB 671
[    4.910000] UBI DBG (pid 1): ubi_scan: process PEB 672
[    4.920000] UBI DBG (pid 1): ubi_scan: process PEB 673
[    4.920000] UBI DBG (pid 1): ubi_scan: process PEB 674
[    4.930000] UBI DBG (pid 1): ubi_scan: process PEB 675
[    4.930000] UBI DBG (pid 1): ubi_scan: process PEB 676
[    4.940000] UBI DBG (pid 1): ubi_scan: process PEB 677
[    4.950000] UBI DBG (pid 1): ubi_scan: process PEB 678
[    4.950000] UBI DBG (pid 1): ubi_scan: process PEB 679
[    4.960000] UBI DBG (pid 1): ubi_scan: process PEB 680
[    4.960000] UBI DBG (pid 1): ubi_scan: process PEB 681
[    4.970000] UBI DBG (pid 1): ubi_scan: process PEB 682
[    4.970000] UBI DBG (pid 1): ubi_scan: process PEB 683
[    4.980000] UBI DBG (pid 1): ubi_scan: process PEB 684
[    4.980000] UBI DBG (pid 1): ubi_scan: process PEB 685
[    4.990000] UBI DBG (pid 1): ubi_scan: process PEB 686
[    4.990000] UBI DBG (pid 1): ubi_scan: process PEB 687
[    5.000000] UBI DBG (pid 1): ubi_scan: process PEB 688
[    5.000000] UBI DBG (pid 1): ubi_scan: process PEB 689
[    5.010000] UBI DBG (pid 1): ubi_scan: process PEB 690
[    5.010000] UBI DBG (pid 1): ubi_scan: process PEB 691
[    5.020000] UBI DBG (pid 1): ubi_scan: process PEB 692
[    5.020000] UBI DBG (pid 1): ubi_scan: process PEB 693
[    5.030000] UBI DBG (pid 1): ubi_scan: process PEB 694
[    5.040000] UBI DBG (pid 1): ubi_scan: process PEB 695
[    5.040000] UBI DBG (pid 1): ubi_scan: process PEB 696
[    5.050000] UBI DBG (pid 1): ubi_scan: process PEB 697
[    5.050000] UBI DBG (pid 1): ubi_scan: process PEB 698
[    5.060000] UBI DBG (pid 1): ubi_scan: process PEB 699
[    5.060000] UBI DBG (pid 1): ubi_scan: process PEB 700
[    5.070000] UBI DBG (pid 1): ubi_scan: process PEB 701
[    5.070000] UBI DBG (pid 1): ubi_scan: process PEB 702
[    5.080000] UBI DBG (pid 1): ubi_scan: process PEB 703
[    5.080000] UBI DBG (pid 1): ubi_scan: process PEB 704
[    5.090000] UBI DBG (pid 1): ubi_scan: process PEB 705
[    5.090000] UBI DBG (pid 1): ubi_scan: process PEB 706
[    5.100000] UBI DBG (pid 1): ubi_scan: process PEB 707
[    5.100000] UBI DBG (pid 1): ubi_scan: process PEB 708
[    5.110000] UBI DBG (pid 1): ubi_scan: process PEB 709
[    5.110000] UBI DBG (pid 1): ubi_scan: process PEB 710
[    5.120000] UBI DBG (pid 1): ubi_scan: process PEB 711
[    5.130000] UBI DBG (pid 1): ubi_scan: process PEB 712
[    5.130000] UBI DBG (pid 1): ubi_scan: process PEB 713
[    5.140000] UBI DBG (pid 1): ubi_scan: process PEB 714
[    5.140000] UBI DBG (pid 1): ubi_scan: process PEB 715
[    5.150000] UBI DBG (pid 1): ubi_scan: process PEB 716
[    5.150000] UBI DBG (pid 1): ubi_scan: process PEB 717
[    5.160000] UBI DBG (pid 1): ubi_scan: process PEB 718
[    5.160000] UBI DBG (pid 1): ubi_scan: process PEB 719
[    5.170000] UBI DBG (pid 1): ubi_scan: process PEB 720
[    5.170000] UBI DBG (pid 1): ubi_scan: process PEB 721
[    5.180000] UBI DBG (pid 1): ubi_scan: process PEB 722
[    5.180000] UBI DBG (pid 1): ubi_scan: process PEB 723
[    5.190000] UBI DBG (pid 1): ubi_scan: process PEB 724
[    5.190000] UBI DBG (pid 1): ubi_scan: process PEB 725
[    5.200000] UBI DBG (pid 1): ubi_scan: process PEB 726
[    5.210000] UBI DBG (pid 1): ubi_scan: process PEB 727
[    5.210000] UBI DBG (pid 1): ubi_scan: process PEB 728
[    5.220000] UBI DBG (pid 1): ubi_scan: process PEB 729
[    5.220000] UBI DBG (pid 1): ubi_scan: process PEB 730
[    5.230000] UBI DBG (pid 1): ubi_scan: process PEB 731
[    5.230000] UBI DBG (pid 1): ubi_scan: process PEB 732
[    5.240000] UBI DBG (pid 1): ubi_scan: process PEB 733
[    5.240000] UBI DBG (pid 1): ubi_scan: process PEB 734
[    5.250000] UBI DBG (pid 1): ubi_scan: process PEB 735
[    5.250000] UBI DBG (pid 1): ubi_scan: process PEB 736
[    5.260000] UBI DBG (pid 1): ubi_scan: process PEB 737
[    5.260000] UBI DBG (pid 1): ubi_scan: process PEB 738
[    5.270000] UBI DBG (pid 1): ubi_scan: process PEB 739
[    5.270000] UBI DBG (pid 1): ubi_scan: process PEB 740
[    5.280000] UBI DBG (pid 1): ubi_scan: process PEB 741
[    5.280000] UBI DBG (pid 1): ubi_scan: process PEB 742
[    5.290000] UBI DBG (pid 1): ubi_scan: process PEB 743
[    5.300000] UBI DBG (pid 1): ubi_scan: process PEB 744
[    5.300000] UBI DBG (pid 1): ubi_scan: process PEB 745
[    5.310000] UBI DBG (pid 1): ubi_scan: process PEB 746
[    5.310000] UBI DBG (pid 1): ubi_scan: process PEB 747
[    5.320000] UBI DBG (pid 1): ubi_scan: process PEB 748
[    5.320000] UBI DBG (pid 1): ubi_scan: process PEB 749
[    5.330000] UBI DBG (pid 1): ubi_scan: process PEB 750
[    5.330000] UBI DBG (pid 1): ubi_scan: process PEB 751
[    5.340000] UBI DBG (pid 1): ubi_scan: process PEB 752
[    5.340000] UBI DBG (pid 1): ubi_scan: process PEB 753
[    5.350000] UBI DBG (pid 1): ubi_scan: process PEB 754
[    5.350000] UBI DBG (pid 1): ubi_scan: process PEB 755
[    5.360000] UBI DBG (pid 1): ubi_scan: process PEB 756
[    5.360000] UBI DBG (pid 1): ubi_scan: process PEB 757
[    5.370000] UBI DBG (pid 1): ubi_scan: process PEB 758
[    5.370000] UBI DBG (pid 1): ubi_scan: process PEB 759
[    5.380000] UBI DBG (pid 1): ubi_scan: process PEB 760
[    5.390000] UBI DBG (pid 1): ubi_scan: process PEB 761
[    5.390000] UBI DBG (pid 1): ubi_scan: process PEB 762
[    5.400000] UBI DBG (pid 1): ubi_scan: process PEB 763
[    5.400000] UBI DBG (pid 1): ubi_scan: process PEB 764
[    5.410000] UBI DBG (pid 1): ubi_scan: process PEB 765
[    5.410000] UBI DBG (pid 1): ubi_scan: process PEB 766
[    5.420000] UBI DBG (pid 1): ubi_scan: process PEB 767
[    5.420000] UBI DBG (pid 1): ubi_scan: process PEB 768
[    5.430000] UBI DBG (pid 1): ubi_scan: process PEB 769
[    5.430000] UBI DBG (pid 1): ubi_scan: process PEB 770
[    5.440000] UBI DBG (pid 1): ubi_scan: process PEB 771
[    5.440000] UBI DBG (pid 1): ubi_scan: process PEB 772
[    5.450000] UBI DBG (pid 1): ubi_scan: process PEB 773
[    5.450000] UBI DBG (pid 1): ubi_scan: process PEB 774
[    5.460000] UBI DBG (pid 1): ubi_scan: process PEB 775
[    5.460000] UBI DBG (pid 1): ubi_scan: process PEB 776
[    5.470000] UBI DBG (pid 1): ubi_scan: process PEB 777
[    5.480000] UBI DBG (pid 1): ubi_scan: process PEB 778
[    5.480000] UBI DBG (pid 1): ubi_scan: process PEB 779
[    5.490000] UBI DBG (pid 1): ubi_scan: process PEB 780
[    5.490000] UBI DBG (pid 1): ubi_scan: process PEB 781
[    5.500000] UBI DBG (pid 1): ubi_scan: process PEB 782
[    5.500000] UBI DBG (pid 1): ubi_scan: process PEB 783
[    5.510000] UBI DBG (pid 1): ubi_scan: process PEB 784
[    5.510000] UBI DBG (pid 1): ubi_scan: process PEB 785
[    5.520000] UBI DBG (pid 1): ubi_scan: process PEB 786
[    5.520000] UBI DBG (pid 1): ubi_scan: process PEB 787
[    5.530000] UBI DBG (pid 1): ubi_scan: process PEB 788
[    5.530000] UBI DBG (pid 1): ubi_scan: process PEB 789
[    5.540000] UBI DBG (pid 1): ubi_scan: process PEB 790
[    5.540000] UBI DBG (pid 1): ubi_scan: process PEB 791
[    5.550000] UBI DBG (pid 1): ubi_scan: process PEB 792
[    5.560000] UBI DBG (pid 1): ubi_scan: process PEB 793
[    5.560000] UBI DBG (pid 1): ubi_scan: process PEB 794
[    5.570000] UBI DBG (pid 1): ubi_scan: process PEB 795
[    5.570000] UBI DBG (pid 1): ubi_scan: process PEB 796
[    5.580000] UBI DBG (pid 1): ubi_scan: process PEB 797
[    5.580000] UBI DBG (pid 1): ubi_scan: process PEB 798
[    5.590000] UBI DBG (pid 1): ubi_scan: process PEB 799
[    5.590000] UBI DBG (pid 1): ubi_scan: process PEB 800
[    5.600000] UBI DBG (pid 1): ubi_scan: process PEB 801
[    5.600000] UBI DBG (pid 1): ubi_scan: process PEB 802
[    5.610000] UBI DBG (pid 1): ubi_scan: process PEB 803
[    5.610000] UBI DBG (pid 1): ubi_scan: process PEB 804
[    5.620000] UBI DBG (pid 1): ubi_scan: process PEB 805
[    5.620000] UBI DBG (pid 1): ubi_scan: process PEB 806
[    5.630000] UBI DBG (pid 1): ubi_scan: process PEB 807
[    5.630000] UBI DBG (pid 1): ubi_scan: process PEB 808
[    5.640000] UBI DBG (pid 1): ubi_scan: process PEB 809
[    5.650000] UBI DBG (pid 1): ubi_scan: process PEB 810
[    5.650000] UBI DBG (pid 1): ubi_scan: process PEB 811
[    5.660000] UBI DBG (pid 1): ubi_scan: process PEB 812
[    5.660000] UBI DBG (pid 1): ubi_scan: process PEB 813
[    5.670000] UBI DBG (pid 1): ubi_scan: process PEB 814
[    5.670000] UBI DBG (pid 1): ubi_scan: process PEB 815
[    5.680000] UBI DBG (pid 1): ubi_scan: process PEB 816
[    5.680000] UBI DBG (pid 1): ubi_scan: process PEB 817
[    5.690000] UBI DBG (pid 1): ubi_scan: process PEB 818
[    5.690000] UBI DBG (pid 1): ubi_scan: process PEB 819
[    5.700000] UBI DBG (pid 1): ubi_scan: process PEB 820
[    5.700000] UBI DBG (pid 1): ubi_scan: process PEB 821
[    5.710000] UBI DBG (pid 1): ubi_scan: process PEB 822
[    5.710000] UBI DBG (pid 1): ubi_scan: process PEB 823
[    5.720000] UBI DBG (pid 1): ubi_scan: process PEB 824
[    5.720000] UBI DBG (pid 1): ubi_scan: process PEB 825
[    5.730000] UBI DBG (pid 1): ubi_scan: process PEB 826
[    5.740000] UBI DBG (pid 1): ubi_scan: process PEB 827
[    5.740000] UBI DBG (pid 1): ubi_scan: process PEB 828
[    5.750000] UBI DBG (pid 1): ubi_scan: process PEB 829
[    5.750000] UBI DBG (pid 1): ubi_scan: process PEB 830
[    5.760000] UBI DBG (pid 1): ubi_scan: process PEB 831
[    5.760000] UBI DBG (pid 1): ubi_scan: process PEB 832
[    5.770000] UBI DBG (pid 1): ubi_scan: process PEB 833
[    5.770000] UBI DBG (pid 1): ubi_scan: process PEB 834
[    5.780000] UBI DBG (pid 1): ubi_scan: process PEB 835
[    5.780000] UBI DBG (pid 1): ubi_scan: process PEB 836
[    5.790000] UBI DBG (pid 1): ubi_scan: process PEB 837
[    5.790000] UBI DBG (pid 1): ubi_scan: process PEB 838
[    5.800000] UBI DBG (pid 1): ubi_scan: process PEB 839
[    5.800000] UBI DBG (pid 1): ubi_scan: process PEB 840
[    5.810000] UBI DBG (pid 1): ubi_scan: process PEB 841
[    5.810000] UBI DBG (pid 1): ubi_scan: process PEB 842
[    5.820000] UBI DBG (pid 1): ubi_scan: process PEB 843
[    5.830000] UBI DBG (pid 1): ubi_scan: process PEB 844
[    5.830000] UBI DBG (pid 1): ubi_scan: process PEB 845
[    5.840000] UBI DBG (pid 1): ubi_scan: process PEB 846
[    5.840000] UBI DBG (pid 1): ubi_scan: process PEB 847
[    5.850000] UBI DBG (pid 1): ubi_scan: process PEB 848
[    5.850000] UBI DBG (pid 1): ubi_scan: process PEB 849
[    5.860000] UBI DBG (pid 1): ubi_scan: process PEB 850
[    5.860000] UBI DBG (pid 1): ubi_scan: process PEB 851
[    5.870000] UBI DBG (pid 1): ubi_scan: process PEB 852
[    5.870000] UBI DBG (pid 1): ubi_scan: process PEB 853
[    5.880000] UBI DBG (pid 1): ubi_scan: process PEB 854
[    5.880000] UBI DBG (pid 1): ubi_scan: process PEB 855
[    5.890000] UBI DBG (pid 1): ubi_scan: process PEB 856
[    5.890000] UBI DBG (pid 1): ubi_scan: process PEB 857
[    5.900000] UBI DBG (pid 1): ubi_scan: process PEB 858
[    5.910000] UBI DBG (pid 1): ubi_scan: process PEB 859
[    5.910000] UBI DBG (pid 1): ubi_scan: process PEB 860
[    5.920000] UBI DBG (pid 1): ubi_scan: process PEB 861
[    5.920000] UBI DBG (pid 1): ubi_scan: process PEB 862
[    5.930000] UBI DBG (pid 1): ubi_scan: process PEB 863
[    5.930000] UBI DBG (pid 1): ubi_scan: process PEB 864
[    5.940000] UBI DBG (pid 1): ubi_scan: process PEB 865
[    5.940000] UBI DBG (pid 1): ubi_scan: process PEB 866
[    5.950000] UBI DBG (pid 1): ubi_scan: process PEB 867
[    5.950000] UBI DBG (pid 1): ubi_scan: process PEB 868
[    5.960000] UBI DBG (pid 1): ubi_scan: process PEB 869
[    5.960000] UBI DBG (pid 1): ubi_scan: process PEB 870
[    5.970000] UBI DBG (pid 1): ubi_scan: process PEB 871
[    5.970000] UBI DBG (pid 1): ubi_scan: process PEB 872
[    5.980000] UBI DBG (pid 1): ubi_scan: process PEB 873
[    5.980000] UBI DBG (pid 1): ubi_scan: process PEB 874
[    5.990000] UBI DBG (pid 1): ubi_scan: process PEB 875
[    6.000000] UBI DBG (pid 1): ubi_scan: process PEB 876
[    6.000000] UBI DBG (pid 1): ubi_scan: process PEB 877
[    6.010000] UBI DBG (pid 1): ubi_scan: process PEB 878
[    6.010000] UBI DBG (pid 1): ubi_scan: process PEB 879
[    6.020000] UBI DBG (pid 1): ubi_scan: process PEB 880
[    6.020000] UBI DBG (pid 1): ubi_scan: process PEB 881
[    6.030000] UBI DBG (pid 1): ubi_scan: process PEB 882
[    6.030000] UBI DBG (pid 1): ubi_scan: process PEB 883
[    6.040000] UBI DBG (pid 1): ubi_scan: process PEB 884
[    6.040000] UBI DBG (pid 1): ubi_scan: process PEB 885
[    6.050000] UBI DBG (pid 1): ubi_scan: process PEB 886
[    6.050000] UBI DBG (pid 1): ubi_scan: process PEB 887
[    6.060000] UBI DBG (pid 1): ubi_scan: process PEB 888
[    6.060000] UBI DBG (pid 1): ubi_scan: process PEB 889
[    6.070000] UBI DBG (pid 1): ubi_scan: process PEB 890
[    6.070000] UBI DBG (pid 1): ubi_scan: process PEB 891
[    6.080000] UBI DBG (pid 1): ubi_scan: process PEB 892
[    6.090000] UBI DBG (pid 1): ubi_scan: process PEB 893
[    6.090000] UBI DBG (pid 1): ubi_scan: process PEB 894
[    6.100000] UBI DBG (pid 1): ubi_scan: process PEB 895
[    6.100000] UBI DBG (pid 1): ubi_scan: process PEB 896
[    6.110000] UBI DBG (pid 1): ubi_scan: process PEB 897
[    6.110000] UBI DBG (pid 1): ubi_scan: process PEB 898
[    6.120000] UBI DBG (pid 1): ubi_scan: process PEB 899
[    6.120000] UBI DBG (pid 1): ubi_scan: process PEB 900
[    6.130000] UBI DBG (pid 1): ubi_scan: process PEB 901
[    6.130000] UBI DBG (pid 1): ubi_scan: process PEB 902
[    6.140000] UBI DBG (pid 1): ubi_scan: process PEB 903
[    6.140000] UBI DBG (pid 1): ubi_scan: process PEB 904
[    6.150000] UBI DBG (pid 1): ubi_scan: process PEB 905
[    6.150000] UBI DBG (pid 1): ubi_scan: process PEB 906
[    6.160000] UBI DBG (pid 1): ubi_scan: process PEB 907
[    6.160000] UBI DBG (pid 1): ubi_scan: process PEB 908
[    6.170000] UBI DBG (pid 1): ubi_scan: process PEB 909
[    6.180000] UBI DBG (pid 1): ubi_scan: process PEB 910
[    6.180000] UBI DBG (pid 1): ubi_scan: process PEB 911
[    6.190000] UBI DBG (pid 1): ubi_scan: process PEB 912
[    6.190000] UBI DBG (pid 1): ubi_scan: process PEB 913
[    6.200000] UBI DBG (pid 1): ubi_scan: process PEB 914
[    6.200000] UBI DBG (pid 1): ubi_scan: process PEB 915
[    6.210000] UBI DBG (pid 1): ubi_scan: process PEB 916
[    6.210000] UBI DBG (pid 1): ubi_scan: process PEB 917
[    6.220000] UBI DBG (pid 1): ubi_scan: process PEB 918
[    6.220000] UBI DBG (pid 1): ubi_scan: process PEB 919
[    6.230000] UBI DBG (pid 1): ubi_scan: process PEB 920
[    6.230000] UBI DBG (pid 1): ubi_scan: process PEB 921
[    6.240000] UBI DBG (pid 1): ubi_scan: process PEB 922
[    6.240000] UBI DBG (pid 1): ubi_scan: process PEB 923
[    6.250000] UBI DBG (pid 1): ubi_scan: process PEB 924
[    6.260000] UBI DBG (pid 1): ubi_scan: process PEB 925
[    6.260000] UBI DBG (pid 1): ubi_scan: process PEB 926
[    6.270000] UBI DBG (pid 1): ubi_scan: process PEB 927
[    6.270000] UBI DBG (pid 1): ubi_scan: process PEB 928
[    6.280000] UBI DBG (pid 1): ubi_scan: process PEB 929
[    6.280000] UBI DBG (pid 1): ubi_scan: process PEB 930
[    6.290000] UBI DBG (pid 1): ubi_scan: process PEB 931
[    6.290000] UBI DBG (pid 1): ubi_scan: process PEB 932
[    6.300000] UBI DBG (pid 1): ubi_scan: process PEB 933
[    6.300000] UBI DBG (pid 1): ubi_scan: process PEB 934
[    6.310000] UBI DBG (pid 1): ubi_scan: process PEB 935
[    6.310000] UBI DBG (pid 1): ubi_scan: process PEB 936
[    6.320000] UBI DBG (pid 1): ubi_scan: process PEB 937
[    6.320000] UBI DBG (pid 1): ubi_scan: process PEB 938
[    6.330000] UBI DBG (pid 1): ubi_scan: process PEB 939
[    6.330000] UBI DBG (pid 1): ubi_scan: process PEB 940
[    6.340000] UBI DBG (pid 1): ubi_scan: process PEB 941
[    6.350000] UBI DBG (pid 1): ubi_scan: process PEB 942
[    6.350000] UBI DBG (pid 1): ubi_scan: process PEB 943
[    6.360000] UBI DBG (pid 1): ubi_scan: process PEB 944
[    6.360000] UBI DBG (pid 1): ubi_scan: process PEB 945
[    6.370000] UBI DBG (pid 1): ubi_scan: process PEB 946
[    6.370000] UBI DBG (pid 1): ubi_scan: process PEB 947
[    6.380000] UBI DBG (pid 1): ubi_scan: process PEB 948
[    6.380000] UBI DBG (pid 1): ubi_scan: process PEB 949
[    6.390000] UBI DBG (pid 1): ubi_scan: process PEB 950
[    6.390000] UBI DBG (pid 1): ubi_scan: process PEB 951
[    6.400000] UBI DBG (pid 1): ubi_scan: process PEB 952
[    6.400000] UBI DBG (pid 1): ubi_scan: process PEB 953
[    6.410000] UBI DBG (pid 1): ubi_scan: process PEB 954
[    6.410000] UBI DBG (pid 1): ubi_scan: process PEB 955
[    6.420000] UBI DBG (pid 1): ubi_scan: process PEB 956
[    6.420000] UBI DBG (pid 1): ubi_scan: process PEB 957
[    6.430000] UBI DBG (pid 1): ubi_scan: process PEB 958
[    6.440000] UBI DBG (pid 1): ubi_scan: process PEB 959
[    6.440000] UBI DBG (pid 1): ubi_scan: process PEB 960
[    6.450000] UBI DBG (pid 1): ubi_scan: process PEB 961
[    6.450000] UBI DBG (pid 1): ubi_scan: process PEB 962
[    6.460000] UBI DBG (pid 1): ubi_scan: process PEB 963
[    6.460000] UBI DBG (pid 1): ubi_scan: process PEB 964
[    6.470000] UBI DBG (pid 1): ubi_scan: process PEB 965
[    6.470000] UBI DBG (pid 1): ubi_scan: process PEB 966
[    6.480000] UBI DBG (pid 1): ubi_scan: process PEB 967
[    6.480000] UBI DBG (pid 1): ubi_scan: process PEB 968
[    6.490000] UBI DBG (pid 1): ubi_scan: process PEB 969
[    6.490000] UBI DBG (pid 1): ubi_scan: process PEB 970
[    6.500000] UBI DBG (pid 1): ubi_scan: process PEB 971
[    6.500000] UBI DBG (pid 1): ubi_scan: process PEB 972
[    6.510000] UBI DBG (pid 1): ubi_scan: process PEB 973
[    6.510000] UBI DBG (pid 1): ubi_scan: process PEB 974
[    6.520000] UBI DBG (pid 1): ubi_scan: process PEB 975
[    6.530000] UBI DBG (pid 1): ubi_scan: scanning is finished
[    6.530000] UBI DBG (pid 1): process_lvol: check layout volume
[    6.570000] UBI DBG (pid 1): uif_init: ubi0 major is 254
[    6.580000] UBI DBG (pid 1): ubi_add_volume: add volume 0
[    6.590000] UBI: attached mtd4 to ubi0
[    6.590000] UBI: MTD device name:            "rootfs0"
[    6.600000] UBI: MTD device size:            122 MiB
[    6.600000] UBI: number of good PEBs:        976
[    6.610000] UBI: number of bad PEBs:         0
[    6.610000] UBI: max. allowed volumes:       128
[    6.610000] UBI: wear-leveling threshold:    4096
[    6.620000] UBI: number of internal volumes: 1
[    6.620000] UBI: number of user volumes:     1
[    6.630000] UBI: available PEBs:             0
[    6.630000] UBI: total number of reserved PEBs: 976
[    6.640000] UBI: number of PEBs reserved for bad PEB handling: 0
[    6.640000] UBI: max/mean erase counter: 2/0
[    6.650000] UBI: background thread "ubi_bgt0d" started, PID 184
[    6.650000] mice: PS/2 mouse device common for all mice
[    6.660000] MXC WatchDog Driver 2.0
[    6.670000] MXC Watchdog # 0 Timer: initial timeout 60 sec
[    6.680000] TCP cubic registered
[    6.680000] NET: Registered protocol family 1
[    6.690000] NET: Registered protocol family 10
[    6.700000] IPv6 over IPv4 tunneling driver
[    6.730000] NET: Registered protocol family 17
[    6.730000] Power Management for Freescale MX31
[    6.740000] VFP support v0.3: implementor 41 architecture 1 part 20 vari=
ant b rev 2
[    6.750000] Switching Console to ttymxc2 at MMIO 0x5000c000 (options '11=
5200n8')
[    6.760000] console [ttymxc2] enabled
[    6.760000] UBIFS DBG (pid 1): ubifs_get_sb: name ubi0:rootfs, flags 0x8=
000
[    6.770000] UBI DBG (pid 1): ubi_open_volume_nm: open volume rootfs, mod=
e 1
[    6.780000] UBI DBG (pid 1): ubi_open_volume: open device 0 volume 0, mo=
de 1
[    6.780000] UBIFS DBG (pid 1): ubifs_get_sb: opened ubi0_0
[    6.790000] UBI DBG (pid 1): ubi_open_volume: open device 0 volume 0, mo=
de 2
[    6.800000] UBIFS error (pid 1): ubifs_parse_options: unrecognized mount=
 option "sync" or missing value
[    6.810000] UBI DBG (pid 1): ubi_close_volume: close volume 0, mode 2
[    6.810000] UBI DBG (pid 1): ubi_close_volume: close volume 0, mode 1
[    6.820000] List of all partitions:
[    6.820000] 0800    1023120 sda driver: sd
[    6.830000]   0801    1020096 sda1
[    6.830000] No filesystem could mount root, tried:  ubifs
[    6.830000] Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(0,0)

Rebooting the system without the "sync" mount option allows me to
show some more info...

% cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "RedBoot"
mtd1: 00020000 00020000 "FIS directory"
mtd2: 00001000 00020000 "RedBoot config"
mtd3: 00500000 00020000 "vmlinux0"
mtd4: 07a00000 00020000 "rootfs0"
mtd5: 00100000 00020000 "user"
mtd6: 00500000 00020000 "vmlinux1"
mtd7: 07a00000 00020000 "rootfs1"

% ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi0

ubi0:
Volumes count:                           1
Logical eraseblock size:                 130944
Total amount of logical eraseblocks:     976 (127801344 bytes, 121.9 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     2
Minimum input/output unit size:          1 bytes
Character device major/minor:            254:0
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        972 LEBs (127277568 bytes, 121.4 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 254:1

Cheers,
--=20
 .''`.   Aur=C3=A9lien G=C3=89R=C3=94ME
: :'  :
`. `'`   Debian Developer
  `-     Unix Sys & Net Admin

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoexI0ACgkQI2xgxmW0sWKGsQCeNtegTb+QJyDEBNAgOgI/4SiP
oBIAn0Mym54MVIrjybS01pPjy8/ds5hl
=lFyF
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
