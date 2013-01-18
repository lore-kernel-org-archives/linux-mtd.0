Received: from mail.hostingconnect.net ([72.18.140.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tw8xF-0003bJ-9K
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 10:13:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by brd.matrixcomsec.com (Postfix) with ESMTP id D994C17100D3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2013 15:43:20 +0530 (IST)
Message-ID: <20130118154320.17054yn2gb0jkm4g@192.168.50.55>
Date: Fri, 18 Jan 2013 15:43:20 +0530
From: PrakashKamliya <prakash.kamliya@matrixcomsec.com>
To: linux-mtd@lists.infradead.org
Subject: BUG at fs/jffs2/readinode:38!
MIME-Version: 1.0
Content-Type: text/plain;
	charset=;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi There,

I am getting BUG with the JFFS2 file system. my board is running on
Cavium CNS3420 ARm based processor. and the kernel i am using is
2.6.35.12

i get this problem consistently. Whenever i download one tar.gz file
to the filesystem using the ftp and on next reboot i get issue while
kernel tries to mount the jffs2 filesystem.

On booup time the permission of the file is being changed in one of =20
the bootup script

below  is the console ouput of kernel

## Booting kernel from Legacy Image at 04000000 ...
     Image Name:   Linux-2.6.35.12-cavm1
     Created:      2013-01-18   4:50:49 UTC
     Image Type:   ARM Linux Kernel Image (uncompressed)
     Data Size:    2346396 Bytes =3D  2.2 MB
     Load Address: 02000000
     Entry Point:  02000000
     Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Li done, booting t[    0.000000] Linux version
2.6.35.12-cavm1 (prakash@prakash.domainrnd) (gcc version 4.4.1
(arm-cavm-64k-2010q1) ) #5 Fri Jan 18 10:20:39 IST 2013
[    0.000000] Cavium Networks CNS3XXX SDK v1.2-2848
[    0.000000] CPU: ARMv6-compatible processor [410fb024] revision 4
(ARMv7), cr=3D00c5387f
[    0.000000] CPU: VIPT nonaliasing data cache, VIPT nonaliasing
instruction cache
[    0.000000] Machine: Cavium Networks CNS3410 OIB Board
[    0.000000] Ignoring unrecognised tag 0x00000000
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] boot_command_line - root=3D/dev/mtdblock2 rw
init=3D/linuxrc mem=3D128M rootfstype=3Djffs2 console=3DttyS0,38400n8
eth0addr=3D00:50:C2:55:B2:96 eth1addr=3D00:50:C2:55:B2:A6
[    0.000000] Eth0 Mac - 0:50:c2:55:b2:96:
[    0.000000] Eth1 Mac - 0:50:c2:55:b2:a6:
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.
   Total pages: 2047
[    0.000000] Kernel command line: root=3D/dev/mtdblock3 rw
init=3D/linuxrc mem=3D128M rootfstype=3Djffs2  console=3DttyS0,38400n8
[    0.000000] PID hash table entries: 512 (order: -5, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 0, 65536 bytes=
)
[    0.000000] Inode-cache hash table entries: 16384 (order: 0, 65536 bytes)
[    0.000000] Memory: 128MB =3D 128MB total
[    0.000000] Memory: 125120k/125120k available, 5952k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0x00000000   (  64 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     DMA     : 0xffa00000 - 0xffe00000   (   4 MB)
[    0.000000]     vmalloc : 0xa8800000 - 0xe0000000   ( 888 MB)
[    0.000000]     lowmem  : 0xa0000000 - 0xa8000000   ( 128 MB)
[    0.000000]     modules : 0x9f000000 - 0xa0000000   (  16 MB)
[    0.000000]       .init : 0xa0008000 - 0xa0040000   ( 224 kB)
[    0.000000]       .text : 0xa0040000 - 0xa0460000   (4224 kB)
[    0.000000]       .data : 0xa047e000 - 0xa04adc80   ( 192 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] =09RCU-based detection of stalled CPUs is disabled.
[    0.000000] =09Verbose stalled-CPUs detection is disabled.
[    0.000000] NR_IRQS:96
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [ttyS0] enabled
[    0.020000] Calibrating delay loop... 193.33 BogoMIPS (lpj=3D966656)
[    0.240000] pid_max: default: 32768 minimum: 301
[    0.250000] Mount-cache hash table entries: 8192
[    0.260000] CPU: Testing write buffer coherency: ok
[    0.270000] devtmpfs: initialized
[    0.280000] NET: Registered protocol family 16
[    0.290000] L310 cache controller enabled
[    0.300000] l2x0: 8 ways, CACHE_ID 0x410000c4, AUX_CTRL 0x02540000,
Cache size: 262144 B
[    0.310000] Initializing CNS3XXX DMA controller
[    0.320000] First time microcode alloc for channel 0 done @phy:24240000
[    0.330000] First time microcode alloc for channel 1 done @phy:24250000
[    0.340000] First time microcode alloc for channel 2 done @phy:24260000
[    0.350000] First time microcode alloc for channel 3 done @phy:24270000
[    0.360000] First time microcode alloc for channel 4 done @phy:24280000
[    0.370000] First time microcode alloc for channel 5 done @phy:24290000
[    0.380000] First time microcode alloc for channel 6 done @phy:242a0000
[    0.390000] First time microcode alloc for channel 7 done @phy:242b0000
[    0.400000] First time microcode alloc for channel 8 done @phy:242c0000
[    0.410000] cns_rdma_init: start
[    0.420000] cns_rdma_init: reg1: virt=3D0xa4014a88
[    0.430000] cns_rdma_init: pre-allocating rdma_sg: 32*280=3D8960
[    0.440000] cns_rdma_init: q1: virt=3D0xa40e3a00, phy=3D0x240e3a00 ->
0x240e3bf0
[    0.450000] cns_rdma_init: done, err=3D0
[    0.460000] Cavium feature enabled: 64KB page size,
[    0.470000] cns3420_init=3D>669: -19
[    0.530000] bio: create slab <bio-0> at 0
[    0.540000] SCSI subsystem initialized
[    0.550000] usbcore: registered new interface driver usbfs
[    0.560000] usbcore: registered new interface driver hub
[    0.570000] usbcore: registered new device driver usb
[    0.580000] i2c-gpio: probe of i2c-gpio.1 failed with error -22
[    0.610000] NET: Registered protocol family 2
[    0.630000] IP route cache hash table entries: 16384 (order: 0,
65536 bytes)
[    0.640000] TCP established hash table entries: 8192 (order: 0,
65536 bytes)
[    0.650000] TCP bind hash table entries: 8192 (order: -1, 32768 bytes)
[    0.660000] TCP: Hash tables configured (established 8192 bind 8192)
[    0.670000] TCP reno registered
[    0.680000] UDP hash table entries: 4096 (order: 0, 65536 bytes)
[    0.690000] UDP-Lite hash table entries: 4096 (order: 0, 65536 bytes)
[    0.700000] NET: Registered protocol family 1
[    0.710000] RPC: Registered udp transport module.
[    0.720000] RPC: Registered tcp transport module.
[    0.730000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.740000] CNS3XXX PCIe Host Control Driver
[    0.750000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.760000] CNS3XXX PCIe support both internal and external clock.
[    0.770000] However, incorrect selection may result in system hang.
[    0.780000] If booting hangs, please select choose
CONFIG_CNS3XXX_EXTERNAL_CLOCK_SOURCEinstead.
[    0.800000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.810000] PCI-E0 uses internal clock source.
[    0.820000] PCIe: Port[0] Enable PCIe LTSSM
[    0.830000] PCIe: Port[0] Check data link layer...Link up.
[    0.840000] PCIe: Set Bridge Max_Payload_Size to 128 byte
[    0.850000] PCIe: Set Bridge Max_Read_Request_Size to 128 byte
[    0.860000] PCIe: Set Device Max_Payload_Size to 128 byte
[    0.870000] PCIe: Set Device Max_Read_Request_Size to 128 byte
[    0.880000] PCI: bus0: Fast back to back transfers disabled
[    0.890000] PCI: bus1: Fast back to back transfers disabled
[    0.900000] PCIe0: Bridge found.
[    0.910000] PCI: enabling device 0000:00:00.0 (0140 -> 0143)
[    0.920000] PCIe0 map irq: 0000:00:00.00 slot 0, pin 1, irq: 87
[    0.930000] PCIe0 map irq: 0000:01:00.00 slot 0, pin 1, irq: 61
[    0.940000] pci 0000:00:00.0: BAR 8: assigned [mem 0xa0000000-0xa00fffff]
[    0.950000] pci 0000:01:00.0: BAR 0: assigned [mem
0xa0000000-0xa000ffff 64bit]
[    0.960000] pci 0000:01:00.0: BAR 0: set to [mem
0xa0000000-0xa000ffff 64bit] (PCI address [0xa0000000-0xa000ffff]
[    0.970000] PCI-E1 uses internal clock source.
[    0.980000] PCIe: Port[1] Enable PCIe LTSSM
[    0.990000] PCIe: Port[1] Check data link layer...Device not found.
[    1.510000] PCIe: Set Bridge Max_Payload_Size to 128 byte
[    1.520000] PCIe: Set Bridge Max_Read_Request_Size to 128 byte
[    1.540000] PCI: bus0: Fast back to back transfers disabled
[    1.550000] PCI: bus1: Fast back to back transfers enabled
[    1.560000] PCIe1: Bridge found.
[    1.570000] PCIe0 map irq: 0000:00:00.00 slot 0, pin 1, irq: 87
[    1.580000] PCIe0 map irq: 0000:01:00.00 slot 0, pin 1, irq: 61
[    1.590000] PCIe1 map irq: 0001:00:00.00 slot 0, pin 1, irq: 88
[    1.600000] pci 0001:00:00.0: PCI bridge to [bus 01-01]
[    1.610000] pci 0001:00:00.0:   bridge window [io  disabled]
[    1.620000] pci 0001:00:00.0:   bridge window [mem disabled]
[    1.630000] pci 0001:00:00.0:   bridge window [mem pref disabled]
[    1.640000] pci 0001:00:00.0: PCI bridge to [bus 01-01]
[    1.650000] pci 0001:00:00.0:   bridge window [io  disabled]
[    1.660000] pci 0001:00:00.0:   bridge window [mem disabled]
[    1.670000] pci 0001:00:00.0:   bridge window [mem pref disabled]
[    1.680000] PCI: enabling device 0001:00:00.0 (0140 -> 0143)
[    1.690000] NetWinder Floating Point Emulator V0.97 (double precision)
[    1.710000] JFFS2 version 2.2. (NAND) =C3=82=C2=A9 2001-2006 Red Hat, Inc=
.
[    1.720000] JFFS2: default compression mode: priority
[    1.730000] msgmni has been set to 244
[    1.740000] alg: No test for cipher_null (cipher_null-generic)
[    1.750000] alg: No test for ecb(cipher_null) (ecb-cipher_null)
[    1.760000] alg: No test for digest_null (digest_null-generic)
[    1.770000] alg: No test for compress_null (compress_null-generic)
[    1.790000] alg: No test for stdrng (krng)
[    1.800000] io scheduler noop registered
[    1.810000] io scheduler deadline registered (default)
[    1.820000] io scheduler cfq registered
[    1.830000] cns3xxx gpio initialize.GPIO interrupt handler install ok.
[    1.860000] Serial: 8250/16550 driver, 3 ports, IRQ sharing disabled
[    1.870000] serial8250: ttyS0 at MMIO 0x78000000 (irq =3D 45) is a 16550A
[    1.880000] serial8250: ttyS1 at MMIO 0x78400000 (irq =3D 46) is a 16550A
[    1.890000] serial8250: ttyS2 at MMIO 0x78800000 (irq =3D 47) is a 16550A
[    1.900000] physmap platform flash device: 04000000 at 10000000
[    1.910000] physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
[    1.920000] Amd/Fujitsu Extended Query Table at 0x0040
[    1.930000] number of CFI chips: 1
[    1.940000] RedBoot partition parsing not available
[    1.950000] Using physmap partition information
[    1.960000] Creating 4 MTD partitions on "physmap-flash.0":
[    1.970000] 0x000000000000-0x000000040000 : "uboot"
[    1.980000] 0x000000040000-0x000000500000 : "kernel"
[    2.000000] 0x000000500000-0x000003fe0000 : "filesystem"
[    2.010000] 0x000003fe0000-0x000004000000 : "ubootenv"
[    2.020000] ubi_notify_add(a4451440 [uboot])
[    2.030000] UBI: attaching mtd0 to ubi0
[    2.040000] UBI: MTD device 0 is write-protected, attach in read-only mod=
e
[    2.050000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    2.060000] UBI: logical eraseblock size:    130944 bytes
[    2.070000] UBI: smallest flash I/O unit:    1
[    2.080000] UBI: VID header offset:          64 (aligned 64)
[    2.090000] UBI: data offset:                128
[    2.100000] UBI warning: ubi_scan: 2 PEBs are corrupted
[    2.110000] corrupted PEBs are: 0 1
[    2.120000] UBI error: ubi_read_volume_table: the layout volume was
not found
[    2.130000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
[    2.140000] ubi_attach failed on 'uboot': -22
[    2.150000] ubi_notify_add(a4451040 [kernel])
[    2.160000] UBI: attaching mtd1 to ubi0
[    2.170000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    2.180000] UBI: logical eraseblock size:    130944 bytes
[    2.190000] UBI: smallest flash I/O unit:    1
[    2.200000] UBI: VID header offset:          64 (aligned 64)
[    2.210000] UBI: data offset:                128
[    2.230000] UBI warning: ubi_scan: 38 PEBs are corrupted
[    2.240000] corrupted PEBs are: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37
[    2.280000] UBI error: ubi_read_volume_table: the layout volume was
not found
[    2.290000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
[    2.300000] ubi_attach failed on 'kernel': -22
[    2.310000] ubi_notify_add(a4450c40 [filesystem])
[    2.320000] UBI: attaching mtd2 to ubi0
[    2.330000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    2.340000] UBI: logical eraseblock size:    130944 bytes
[    2.350000] UBI: smallest flash I/O unit:    1
[    2.360000] UBI: VID header offset:          64 (aligned 64)
[    2.370000] UBI: data offset:                128
[    2.410000] UBI warning: ubi_scan: 471 PEBs are corrupted
[    2.420000] corrupted PEBs are: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37
38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60
61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83
84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104
105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121
122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138
139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155
156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172
173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189
190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206
207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240
241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257
258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274
275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291
292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308
309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325
326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342
343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359
360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376
377 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393
394 395 396 397 398 399 400 401 402 403 404 405 406 407 408 409 410
411 412 413 414 415 416 417 418 419 420 421 422 423 424 425 426 427
428 429 430 431 432 433 434 435 436 437 438 439 440 441 442 443 444
445 446 447 448 449 450 451 452 453 454 455 456 457 458 459 460 461
462 463 464 465 466 467 468 469 470
[    2.910000] UBI error: ubi_read_volume_table: the layout volume was
not found
[    2.920000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
[    2.930000] ubi_attach failed on 'filesystem': -22
[    2.940000] ubi_notify_add(a4450840 [ubootenv])
[    2.950000] UBI: attaching mtd3 to ubi0
[    2.960000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    2.970000] UBI: logical eraseblock size:    130944 bytes
[    2.980000] UBI: smallest flash I/O unit:    1
[    2.990000] UBI: VID header offset:          64 (aligned 64)
[    3.000000] UBI: data offset:                128
[    3.010000] UBI warning: ubi_scan: 1 PEBs are corrupted
[    3.020000] corrupted PEBs are: 0
[    3.030000] UBI error: ubi_read_volume_table: the layout volume was
not found
[    3.040000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
[    3.050000] ubi_attach failed on 'ubootenv': -22
[    3.060000] cns3xxx_init_module :
[    3.080000] CNS3XXX PSE: Initialize
[    3.090000] MAC 0
[    3.100000] phy_id: 181
[    3.110000] Initialize DM9161
[    3.120000] MAC 1
[    3.130000] Initialize RTL8309G-GR
[    3.180000] jumbo_frame off
[    3.190000] MAX_PACKET_LEN:1536
[    3.190000] valid mac 0 :
[    3.200000] valid mac 0 :
[    3.210000] PPP generic driver version 2.4.2
[    3.220000] PPP Deflate Compression module registered
[    3.230000] PPP BSD Compression module registered
[    3.240000] PPP MPPE Compression module registered
[    3.250000] NET: Registered protocol family 24
[    3.260000] tun: Universal TUN/TAP device driver, 1.6
[    3.270000] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    3.280000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.290000]
[    3.290000]  drivers/usb/host/ehci-cns3xxx.c cns3xxx_ehci_probe
[    3.300000] cns3xxx-ehci cns3xxx-ehci.0: CNS3XXX EHCI Host Controller
[    3.310000] cns3xxx-ehci cns3xxx-ehci.0: new USB bus registered,
assigned bus number 1
[    3.320000]
[    3.320000]  drivers/usb/host/ehci-cns3xxx.c cns3xxx_ehci_init
[    3.330000] cns3xxx_ehci_init,***Threshold OUT=3D0x60,IN=3D0x60 ***
[    3.370000] cns3xxx-ehci cns3xxx-ehci.0: irq 64, io mem 0x82000000
[    3.400000] cns3xxx-ehci cns3xxx-ehci.0: USB 0.0 started, EHCI 1.00
[    3.410000] usb usb1: New USB device found, idVendor=3D1d6b(Linux
Foundation), idProduct=3D0002
[    3.420000] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    3.430000] usb usb1: Product: CNS3XXX EHCI Host Controller
[    3.440000] usb usb1: Manufacturer: Linux 2.6.35.12-cavm1 ehci_hcd
[    3.450000] usb usb1: SerialNumber: cns3xxx-ehci.0
[    3.470000] hub 1-0:1.0: USB hub found
[    3.480000] hub 1-0:1.0: 1 port detected
[    3.490000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.500000] cns3xxx-ohci cns3xxx-ohci.0: CNS3XXX OHCI Host controller
[    3.510000] cns3xxx-ohci cns3xxx-ohci.0: new USB bus registered,
assigned bus number 2
[    3.520000] cns3xxx-ohci cns3xxx-ohci.0: irq 91, io mem 0x88000000
[    3.590000] usb usb2: New USB device found, idVendor=3D1d6b(Linux
Foundation), idProduct=3D0001
[    3.600000] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    3.610000] usb usb2: Product: CNS3XXX OHCI Host controller
[    3.620000] usb usb2: Manufacturer: Linux 2.6.35.12-cavm1 ohci_hcd
[    3.630000] usb usb2: SerialNumber: cns3xxx-ohci.0
[    3.640000] hub 2-0:1.0: USB hub found
[    3.650000] hub 2-0:1.0: 1 port detected
[    3.660000] dwc_otg: version 2.72a 24-JUN-2008
[    3.670000] calling otg driver probe
[    3.680000] DWC_otg: Core Release: 2.72a
[    3.890000] DWC_otg: Periodic Transfer Interrupt Enhancement - disabled
[    3.900000] DWC_otg: Multiprocessor Interrupt Enhancement - disabled
[    3.910000] DWC_otg: Dedicated Tx FIFOs mode
[    3.920000] dwc_otg_pcd_init: 1
[    3.930000] DWC_otg: Using DMA mode
[    3.940000] DWC_otg: Device using Buffer DMA mode
[    3.950000] dwc_otg lm0: DWC OTG Controller
[    3.960000] dwc_otg lm0: new USB bus registered, assigned bus number 3
[    3.970000] dwc_otg lm0: irq 63, io mem 0x00000000
[    3.980000] DWC_otg: Init: Port Power? op_state=3D1
[    3.990000] DWC_otg: Init: Power Port (0)
[    4.000000] usb usb3: New USB device found, idVendor=3D1d6b(Linux
Foundation), idProduct=3D0002
[    4.010000] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    4.020000] usb usb3: Product: DWC OTG Controller
[    4.030000] usb usb3: Manufacturer: Linux 2.6.35.12-cavm1 dwc_otg_hcd
[    4.040000] usb usb3: SerialNumber: gadget
[    4.050000] hub 3-0:1.0: USB hub found
[    4.060000] hub 3-0:1.0: 1 port detected
[    4.070000] Initializing USB Mass Storage driver...
[    4.080000] usbcore: registered new interface driver usb-storage
[    4.090000] USB Mass Storage support registered.
[    4.100000] usbcore: registered new interface driver libusual
[    4.110000] usbcore: registered new interface driver usbled
[    4.120000] GACT probability on
[    4.130000] Mirror/redirect action on
[    4.140000] Simple TC action Loaded
[    4.150000] netem: version 1.2
[    4.160000] u32 classifier
[    4.170000]     Performance counters on
[    4.180000]     input device check on
[    4.190000]     Actions configured
[    4.200000] Netfilter messages via NETLINK v0.30.
[    4.210000] nf_conntrack version 0.5.0 (1955 buckets, 7820 max)
[    4.220000] CONFIG_NF_CT_ACCT is deprecated and will be removed
soon. Please use
[    4.230000] nf_conntrack.acct=3D1 kernel parameter, acct=3D1
nf_conntrack module option or
[    4.240000] sysctl net.netfilter.nf_conntrack_acct=3D1 to enable it.
[    4.250000] ctnetlink v0.93: registering with nfnetlink.
[    4.260000] xt_time: kernel timezone is -0000
[    4.270000] IPv4 over IPv4 tunneling driver
[    4.280000] GRE over IPv4 tunneling driver
[    4.290000] ip_tables: (C) 2000-2006 Netfilter Core Team
[    4.300000] ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
[    4.310000] arp_tables: (C) 2002 David S. Miller
[    4.320000] TCP cubic registered
[    4.330000] Initializing XFRM netlink socket
[    4.340000] NET: Registered protocol family 17
[    4.350000] NET: Registered protocol family 15
[    4.360000] Bridge firewalling registered
[    4.370000] L2TP core driver, V2.0
[    4.380000] PPPoL2TP kernel driver, V2.0
[    4.390000] 802.1Q VLAN Support v1.8 Ben Greear <greearb@candelatech.com>
[    4.400000] All bugs added by David S. Miller <davem@redhat.com>
[    4.410000] lib80211: common routines for IEEE802.11 drivers
[    4.420000] VFP support v0.3: implementor 41 architecture 1 part 20
variant b rev 4
[   23.360000] VFS: Mounted root (jffs2 filesystem) on device 31:2.
[   23.380000] devtmpfs: mounted
Setting the hostname to Navan-CNX200
Mounting filesystems
mount: mounting shm on /dev/shm failed: No such file or directory
Initializing random number generator... done.
Setting up networking on loopback device:
Setting up networking on eth0:
[   29.410000] alloc tx/rx resource
[   29.420000] open mac port 0
Adding static route for default gateway to 192.168.1.254:
Setting up networking on eth1:
[   29.580000] open mac port 1
Starting inetd:
no rtc_log file
[   33.260000] kernel BUG at fs/jffs2/readinode.c:38!
[   33.270000] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   33.280000] pgd =3D a5114000
[   33.290000] [00000000] *pgd=3D24cb0031, *pte=3D00000000, *ppte=3D00000000
[   33.310000] Internal error: Oops: 817 [#1]
[   33.310000] last sysfs file:
[   33.310000] Modules linked in:
[   33.310000] CPU: 0    Not tainted  (2.6.35.12-cavm1 #5)
[   33.310000] PC is at __bug+0x1c/0x28
[   33.310000] LR is at __bug+0x18/0x28
[   33.310000] pc : [<a00446c0>]    lr : [<a00446bc>]    psr: 60000013
[   33.310000] sp : a5101c80  ip : 0000378b  fp : 00000000
[   33.310000] r10: a422f5d8  r9 : a47e50a8  r8 : 00000014
[   33.310000] r7 : a47e4c28  r6 : a4458440  r5 : 00000000  r4 : a4458440
[   33.310000] r3 : 00000000  r2 : a5101c74  r1 : a03dd01d  r0 : 0000003c
[   33.310000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment user
[   33.310000] Control: 00c5787d  Table: 25114008  DAC: 00000015
[   33.310000] Process chmod (pid: 497, stack limit =3D 0xa5100268)
[   33.310000] Stack: (0xa5101c80 to 0xa5102000)
[   33.310000] 1c80: a47fbb88 a011eb84 00050000 02d89eb0 a5101d10
a4458440 a5101d10 a47e4c28
[   33.310000] 1ca0: a47e50a8 a5259a38 a5100000 00000000 00000000
a4458440 a47e4c28 00000014
[   33.310000] 1cc0: a47e50a8 a5259a38 a5100000 a01205fc a5101d10
00050000 000560c8 00000000
[   33.310000] 1ce0: 00000000 00000000 00000014 a5101d98 029861a4
a47e23e8 a47e4de8 00000014
[   33.310000] 1d00: 00000000 00000000 00000000 a422b9c8 00000000
a45c6d55 a40bd9e0 a5259a38
[   33.310000] 1d20: 0000088b a5100000 a4458440 a4458538 00000000
a45c6d55 00000000 a0121180
[   33.310000] 1d40: a0129108 a5259a70 a4458640 a5101d98 ffffffff
a5259a38 a5259a38 a0335210
[   33.310000] 1d60: 22222222 22222222 22222222 a5259a70 a5259a38
a4458440 a47db4c0 a47db488
[   33.310000] 1d80: 00000000 a45c6d55 a40bd9e0 a0127fa4 00205d30
00000007 a5101db4 a0059ec0
[   33.310000] 1da0: 00000007 00000002 00000000 00026667 00000000
a0189d44 a5101eab a5101ec0
[   33.310000] 1dc0: ffffffff a47db488 a47db488 a0335210 22222222
22222222 22222222 22222222
[   33.310000] 1de0: a47db488 0000088b a45c6ec0 a52608e0 a47db4c0
a47db488 00000000 a011acac
[   33.310000] 1e00: a5101ec0 a5101e58 a52608e0 a47db530 a40807e0
00000000 a47db4c0 a00b6690
[   33.310000] 1e20: a443b06c a5101ec0 16a87581 00000000 a5100000
a443b07f a443b06c a5101ed4
[   33.310000] 1e40: a47db4c0 a00b84ec a5101ea0 16a87581 00000013
a443b06c a40807e0 a40bd9e0
[   33.310000] 1e60: 6c0a020a a5101ec0 a5101e88 a5100000 a443b060
00000000 a5100000 00000000
[   33.310000] 1e80: 355a0008 a00b89f0 a40807e0 a40b70e0 ffffff9c
a5101ec0 a443b060 00000000
[   33.310000] 1ea0: ffffff9c 00000000 00000000 a00b8acc a443b060
a5101f48 a5101f30 a00b9420
[   33.310000] 1ec0: a40807e0 a40bd9e0 a4871000 a5259be8 a47fbbf8
a40807e0 a40b70e0 00000000
[   33.310000] 1ee0: 00000001 00000000 00000000 00000003 a5101f80
a00bb160 a47da460 a0334090
[   33.310000] 1f00: a03edb8b a5101f14 a47da460 a0334fb8 00000004
00000000 9efbf9d8 a5101f48
[   33.310000] 1f20: 00000001 000000c4 a0040fa8 a00b1dd4 ffffff9c
000a0048 9efbf9d8 9efbf9d8
[   33.310000] 1f40: 00000001 a00b1e60 00000000 a4761ae0 00000000
ffffffff a4761ae0 a00afc48
[   33.310000] 1f60: 00000000 00000000 00000000 a4761ae0 00000000
a4150860 a4761ae0 00000000
[   33.310000] 1f80: a4150860 a00ad2b0 a4150860 a4761ae0 00000001
a00ad330 00000001 9efbf9d8
[   33.310000] 1fa0: 000a0048 a0040e00 9efbf9d8 000a0048 000a0048
9efbf9d8 9efbf9d8 00077bfc
[   33.310000] 1fc0: 9efbf9d8 000a0048 00000001 000000c4 9efbfe03
00053c3c 00053c3c 355a0008
[   33.310000] 1fe0: 00098b0c 9efbf9c0 00073e50 35736b74 60000010
000a0048 00000000 000005cc
[   33.310000] [<a00446c0>] (__bug+0x1c/0x28) from [<a011eb84>]
(check_tn_node+0x90/0x438)
[   33.310000] [<a011eb84>] (check_tn_node+0x90/0x438) from
[<a01205fc>] (jffs2_do_read_inode_internal+0x268/0xb3c)
[   33.310000] [<a01205fc>] (jffs2_do_read_inode_internal+0x268/0xb3c)
from [<a0121180>] (jffs2_do_read_inode+0x21c/0x24c)
[   33.310000] [<a0121180>] (jffs2_do_read_inode+0x21c/0x24c) from
[<a0127fa4>] (jffs2_iget+0x84/0x340)
[   33.310000] [<a0127fa4>] (jffs2_iget+0x84/0x340) from [<a011acac>]
(jffs2_lookup+0xcc/0x104)
[   33.310000] [<a011acac>] (jffs2_lookup+0xcc/0x104) from
[<a00b6690>] (do_lookup+0xe4/0x1b0)
[   33.310000] [<a00b6690>] (do_lookup+0xe4/0x1b0) from [<a00b84ec>]
(link_path_walk+0x5ac/0x9e0)
[   33.310000] [<a00b84ec>] (link_path_walk+0x5ac/0x9e0) from
[<a00b89f0>] (path_walk+0x40/0x90)
[   33.310000] [<a00b89f0>] (path_walk+0x40/0x90) from [<a00b8acc>]
(do_path_lookup+0x24/0x4c)
[   33.310000] [<a00b8acc>] (do_path_lookup+0x24/0x4c) from
[<a00b9420>] (user_path_at+0x54/0x90)
[   33.310000] [<a00b9420>] (user_path_at+0x54/0x90) from [<a00b1dd4>]
(vfs_fstatat+0x28/0x54)
[   33.310000] [<a00b1dd4>] (vfs_fstatat+0x28/0x54) from [<a00b1e60>]
(sys_lstat64+0x14/0x34)
[   33.310000] [<a00b1e60>] (sys_lstat64+0x14/0x34) from [<a0040e00>]
(ret_fast_syscall+0x0/0x30)
[   33.310000] Code: e59f0010 e1a01003 eb0bbe6e e3a03000 (e5833000)
[   33.320000] ---[ end trace 4274c2089ccc9601 ]---



thanks
prakash


----- End forwarded message -----
