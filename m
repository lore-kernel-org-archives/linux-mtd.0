Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUqt5-0002sS-QK
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 00:15:08 +0000
Received: by ewy23 with SMTP id 23so27031ewy.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 16:15:01 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1263331836.3445.4.camel@localhost.localdomain>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
	<1263331836.3445.4.camel@localhost.localdomain>
Date: Tue, 12 Jan 2010 19:15:01 -0500
Message-ID: <152584231001121615h2b52b7ddv33980c9c4a88f37b@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 12, 2010 at 4:30 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Oh, yeas, you have NOR, the tests were made and used on NAND, and had
> problems with NOR. But there was a fix recently:
>
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/1ae356eafcdff6fa5c59d66072dc7577632a6d68

After applying this patch I was able to successfully run mtd_readtest,
mtd_speedtest and mtd_stresstest (I think all other don't apply to
NOR):
(initramfs) cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00020000 "RedBoot"
mtd1: 01f20000 00020000 "ubi"
mtd2: 00001000 00020000 "RedBoot config"
mtd3: 00020000 00020000 "FIS directory"
(initramfs) modprobe redboot
(initramfs) modprobe ixp4xx
[   34.020000] IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
[   34.020000]  Intel/Sharp Extended Query Table at 0x010A
[   34.030000]  Intel/Sharp Extended Query Table at 0x010A
[   34.030000]  Intel/Sharp Extended Query Table at 0x010A
[   34.040000]  Intel/Sharp Extended Query Table at 0x010A
[   34.040000]  Intel/Sharp Extended Query Table at 0x010A
[   34.050000] Using buffer write method
[   34.050000] Using auto-unlock on power-up/resume
[   34.060000] cfi_cmdset_0001: Erase suspend on write enabled
[   34.060000] Searching for RedBoot partition table in IXP4XX-Flash.0
at offset 0x1fc0000
[   34.130000] 4 RedBoot partitions found on MTD device IXP4XX-Flash.0
[   34.140000] Creating 4 MTD partitions on "IXP4XX-Flash.0":
[   34.150000] 0x000000000000-0x000000080000 : "RedBoot"
[   34.150000] 0x000000080000-0x000001fa0000 : "ubi"
[   34.160000] 0x000001fa0000-0x000001fa1000 : "RedBoot config"
[   34.170000] mtd: partition "RedBoot config" doesn't end on an erase
block -- leaving writable anyway
[   34.180000] 0x000001fc0000-0x000001fe0000 : "FIS directory"
(initramfs) modprobe mtd_readtest dev=1
[   42.860000]
[   42.860000] =================================================
[   42.870000] mtd_readtest: MTD device: 1
[   42.870000] mtd_readtest: not NAND flash, assume page size is 512 bytes.
[   42.880000] mtd_readtest: MTD device size 32636928, eraseblock size
131072, page size 512, count of eraseblocks 249, pages per eraseblock
256, OOB size 0
[   42.900000] mtd_readtest: testing page read
[   58.770000] mtd_readtest: finished
[   58.770000] =================================================
(initramfs) modprobe mtd_speedtest dev=1
[   74.140000]
[   74.140000] =================================================
[   74.150000] mtd_speedtest: MTD device: 1
[   74.150000] mtd_speedtest: not NAND flash, assume page size is 512 bytes.
[   74.160000] mtd_speedtest: MTD device size 32636928, eraseblock
size 131072, page size 512, count of eraseblocks 249, pages per
eraseblock 256, OOB size 0
[  287.670000] mtd_speedtest: testing eraseblock write speed
[  320.600000] mtd_speedtest: eraseblock write speed is 967 KiB/s
[  320.600000] mtd_speedtest: testing eraseblock read speed
[  336.040000] mtd_speedtest: eraseblock read speed is 2065 KiB/s
[  549.940000] mtd_speedtest: testing page write speed
[  585.750000] mtd_speedtest: page write speed is 890 KiB/s
[  585.750000] mtd_speedtest: testing page read speed
[  601.320000] mtd_speedtest: page read speed is 2048 KiB/s
[  815.710000] mtd_speedtest: testing 2 page write speed
[  848.680000] mtd_speedtest: 2 page write speed is 966 KiB/s
[  848.690000] mtd_speedtest: testing 2 page read speed
[  864.180000] mtd_speedtest: 2 page read speed is 2058 KiB/s
[  864.180000] mtd_speedtest: Testing erase speed
[ 1078.540000] mtd_speedtest: erase speed is 148 KiB/s
[ 1078.540000] mtd_speedtest: finished
[ 1078.540000] =================================================
(initramfs) modprobe mtd_stresstest dev=1
[ 1152.240000]
[ 1152.240000] =================================================
[ 1152.250000] mtd_stresstest: MTD device: 1
[ 1152.250000] mtd_stresstest: not NAND flash, assume page size is 512 bytes.
[ 1152.260000] mtd_stresstest: MTD device size 32636928, eraseblock
size 131072, page size 512, count of eraseblocks 249, pages per
eraseblock 256, OOB size 0
[ 1152.280000] mtd_stresstest: doing operations
[ 1152.290000] mtd_stresstest: 0 operations done
[ 1650.340000] mtd_stresstest: 1024 operations done
[ 2190.950000] mtd_stresstest: 2048 operations done
[ 2717.250000] mtd_stresstest: 3072 operations done
[ 3226.910000] mtd_stresstest: 4096 operations done
[ 3723.830000] mtd_stresstest: 5120 operations done
[ 4284.190000] mtd_stresstest: 6144 operations done
[ 4850.920000] mtd_stresstest: 7168 operations done
[ 5383.650000] mtd_stresstest: 8192 operations done
[ 5868.380000] mtd_stresstest: 9216 operations done
[ 6280.290000] mtd_stresstest: finished, 10000 operations done
[ 6280.300000] =================================================


I also tried mtdram (running on the target system) configured with the
same total_size and erase_size as my physical mtd device and had no
problem at all:
(initramfs) lsmod
Module                  Size  Used by
squashfs               43612  0
zlib_inflate           16128  1 squashfs
gluebi                  6616  0
ixp4xx_eth             13972  0
pcimsg                  9144  0
ubi                    84092  1 gluebi
mtdram                  3424  1
(initramfs) cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01f20000 00020000 "mtdram test device"
mtd1: 0038e1dc 0001ff80 "kernel"
mtd2: 00d34000 0001ff80 "squashfs"
(initramfs) ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:60
Present UBI devices:            ubi0

ubi0
Volumes count:                           2
Logical eraseblock size:                 130944 bytes, f KiB
Total amount of logical eraseblocks:     249 (32605056 bytes, f MiB)
Amount of available logical eraseblocks: 110 (14403840 bytes, f MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     7
Minimum input/output unit size:          1 byte
Character device major/minor:            253:0
Present volumes:                         0, 1

Volume ID:   0 (on ubi0)
Type:        static
Alignment:   1
Size:        29 LEBs (3797376 bytes, f MiB)
Data bytes:  3727836 bytes (f MiB)
State:       OK
Name:        kernel
Character device major/minor: 253:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        static
Alignment:   1
Size:        106 LEBs (13880064 bytes, f MiB)
Data bytes:  13844480 bytes (f MiB)
State:       OK
Name:        squashfs
Character device major/minor: 253:2
(initramfs) ubimkvol -m -N ubifs /dev/ubi0
Set volume size to 14403840
Volume ID 2, size 110 LEBs (14403840 bytes, f MiB), LEB size 130944
bytes (f KiB), dynamic, name "ubifs", alignment 1
(initramfs) mkdir /mnt
(initramfs) mount -t ubifs ubi0:ubifs /mnt
[  280.430000] UBIFS: default file-system created
[  280.460000] UBIFS DBG (pid 1495): ubifs_bg_thread: background
thread "ubifs_bgt0_2" started, PID 1495
[  280.610000] UBIFS: mounted UBI device 0, volume 2, name "ubifs"
[  280.610000] UBIFS: file system size:   13094400 bytes (12787 KiB,
12 MiB, 100 LEBs)
[  280.620000] UBIFS: journal size:       1047553 bytes (1023 KiB, 0
MiB, 6 LEBs)
[  280.630000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[  280.630000] UBIFS: default compressor: lzo
[  280.640000] UBIFS: reserved for root:  618480 bytes (603 KiB)
[  280.640000] UBIFS DBG (pid 1482): mount_ubifs: compiled on:
Jan 12 2010 at 17:02:37
[  280.650000] UBIFS DBG (pid 1482): mount_ubifs: min. I/O unit size:  8 bytes
[  280.660000] UBIFS DBG (pid 1482): mount_ubifs: LEB size:
130944 bytes (127 KiB)
[  280.670000] UBIFS DBG (pid 1482): mount_ubifs: data journal heads:  1
[  280.670000] UBIFS DBG (pid 1482): mount_ubifs: UUID:
36A57898-E179-4127-B506-B56B8F6EE5FF
[  280.680000] UBIFS DBG (pid 1482): mount_ubifs: big_lpt              0
[  280.690000] UBIFS DBG (pid 1482): mount_ubifs: log LEBs:            3 (3 - 5)
[  280.700000] UBIFS DBG (pid 1482): mount_ubifs: LPT area LEBs:       2 (6 - 7)
[  280.700000] UBIFS DBG (pid 1482): mount_ubifs: orphan area LEBs:    2 (8 - 9)
[  280.710000] UBIFS DBG (pid 1482): mount_ubifs: main area LEBs:
100 (10 - 109)
[  280.720000] UBIFS DBG (pid 1482): mount_ubifs: index LEBs:          1
[  280.720000] UBIFS DBG (pid 1482): mount_ubifs: total index bytes:
48 (0 KiB, 0 MiB)
[  280.730000] UBIFS DBG (pid 1482): mount_ubifs: key hash type:       0
[  280.740000] UBIFS DBG (pid 1482): mount_ubifs: tree fanout:         8
[  280.750000] UBIFS DBG (pid 1482): mount_ubifs: reserved GC LEB:     12
[  280.750000] UBIFS DBG (pid 1482): mount_ubifs: first main LEB:      10
[  280.760000] UBIFS DBG (pid 1482): mount_ubifs: max. znode size      240
[  280.770000] UBIFS DBG (pid 1482): mount_ubifs: max. index node size 192
[  280.770000] UBIFS DBG (pid 1482): mount_ubifs: node sizes:
data 48, inode 160, dentry 56
[  280.780000] UBIFS DBG (pid 1482): mount_ubifs: node sizes:
trun 56, sb 4096, master 512
[  280.790000] UBIFS DBG (pid 1482): mount_ubifs: node sizes:
ref 64, cmt. start 32, orph 32
[  280.800000] UBIFS DBG (pid 1482): mount_ubifs: max. node sizes:
data 4144, inode 4256 dentry 312
[  280.810000] UBIFS DBG (pid 1482): mount_ubifs: dead watermark:      56
[  280.810000] UBIFS DBG (pid 1482): mount_ubifs: dark watermark:      4256
[  280.820000] UBIFS DBG (pid 1482): mount_ubifs: LEB overhead:        2480
[  280.830000] UBIFS DBG (pid 1482): mount_ubifs: max. dark space:
425600 (415 KiB, 0 MiB)
[  280.840000] UBIFS DBG (pid 1482): mount_ubifs: maximum bud bytes:
654721 (639 KiB, 0 MiB)
[  280.840000] UBIFS DBG (pid 1482): mount_ubifs: BG commit bud bytes:
523777 (511 KiB, 0 MiB)
[  280.850000] UBIFS DBG (pid 1482): mount_ubifs: current bud bytes
0 (0 KiB, 0 MiB)
[  280.860000] UBIFS DBG (pid 1482): mount_ubifs: max. seq. number:    7
[  280.870000] UBIFS DBG (pid 1482): mount_ubifs: commit number:       0


What else can I try? I still have the failure to mount ubifs on the
physical device, but all applicable mtd tests for NOR pass on it and
mtdram works as expected on the target system.

Jon
