Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT96g-0000Zx-3d
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 15:22:04 +0000
Received: by mail-oi0-x22a.google.com with SMTP id j15so102807580oih.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 07:21:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Mon, 16 Jan 2017 20:51:39 +0530
Message-ID: <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
Subject: Re: UBIFS errors are randomly seen after reboots
To: linux-mtd@lists.infradead.org
Cc: richard.weinberger@gmail.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Thanks for your response.

Based on your response I enabled chk_io , chk_gen,
tst_emulate_bitflips and tst_emulate_power_failure  options in
/sys/kernel/debug/ubi/ubi0 directory. I carried on with my test which
keeps on creating/writing data to files in all the available nand
partitions and during which a reboot is issued .

 Below are the various UBI messages I'm seeing quite consistently at
different times after enabling the debug options.

1. UBI error: do_sync_erase: cannot erase PEB 200 (emulated)
2. UBI error: erase_worker: failed to erase PEB 200, error -5
3. UBI: mark PEB 200 as bad
4. UBI error: ubi_io_write: cannot write 2048 bytes to PEB 452:0 (emulated)
5. UBI error: erase_worker: failed to erase PEB 452, error -5
     UBI: mark PEB 452 as bad
     Bad block table written to 0x00000ffe0000, version 0x0B
     Bad block table written to 0x00000ffc0000, version 0x0B
     UBI: 40 PEBs left in the reserve

Are all the above errors forecasting any doom or are they expected ?


Below is the complete nand flash and  UBI logs since booting, Sorry
for the huge log  :-

[    5.112214] nand_probe: comcertonand base: 0xe8800000
[    5.117330] ONFI flash detected
[    5.120771] ONFI param page 0 valid
[    5.124278] NAND device: Manufacturer ID: 0x01, Chip ID: 0xda (AMD S34ML02G2)
[    5.131475] hw_syndrome correction 2048.
[    5.135429] Using default values for hw ecc
[    5.141895] Bad block table found at page 131008, version 0x07
[    5.149973] Bad block table found at page 130944, version 0x07
[    5.158054] nand_read_bbt: bad block at 0x000002220000
[    5.163210] nand_read_bbt: bad block at 0x0000026a0000
[    5.168376] nand_read_bbt: bad block at 0x0000026c0000
[    5.173535] nand_read_bbt: bad block at 0x000003b60000
[    5.178699] nand_read_bbt: bad block at 0x000004cc0000
[    5.183856] nand_read_bbt: bad block at 0x000005960000
[    5.191340] 13 cmdlinepart partitions found on MTD device comcertonand
[    5.197903] Creating 13 MTD partitions on "comcertonand":
[    5.203324] 0x000000000000-0x000000080000 : "barebox"
[    5.209529] 0x000000080000-0x000000100000 : "bareboxfact"
[    5.216029] 0x000000100000-0x000000120000 : "env"
[    5.221767] 0x000000120000-0x000000920000 : "kernel1"
[    5.227889] 0x000000920000-0x000006520000 : "rootfs1"
[    5.234019] 0x000006520000-0x000006540000 : "reserved_dtb1"
[    5.240697] 0x000006540000-0x000006d40000 : "kernel2"
[    5.246855] 0x000006d40000-0x00000c940000 : "rootfs2"
[    5.253048] 0x00000c940000-0x00000c960000 : "reserved_dtb2"
[    5.259726] 0x00000c960000-0x00000cb60000 : "configcert"
[    5.266117] 0x00000cb60000-0x00000d760000 : "avcsign"
[    5.272211] 0x00000d760000-0x00000f760000 : "webrootdb"
[    5.278564] 0x00000f760000-0x00000f960000 : "license"
[    5.285177] designware_spi_probe:Initializing SPI Controller :
Using dma=1 CLK(DUS)=250000000 Hz
[    5.294003] dw_spi_dma_init:343: initializing spi dma....done
[    5.299991] spi_dma_init:105: dma_ineted set to 1.
[    5.305283] jedec 66069 ext_jedec 19712
[    5.309231] m25p80 spi1.0: found s25sl032a, expected m25p80
[    5.314876] m25p80 spi1.0: s25sl032a (4096 Kbytes)
[    5.319691] 7 cmdlinepart partitions found on MTD device spi1.0
[    5.325672] Creating 7 MTD partitions on "spi1.0":
[    5.330484] 0x000000000000-0x000000020000 : "uloader"
[    5.336801] 0x000000020000-0x0000000a0000 : "barebox"
[    5.342923] 0x0000000a0000-0x0000000c0000 : "env"
[    5.348726] 0x0000000c0000-0x0000000e0000 : "boardinfo"
[    5.355096] 0x0000000e0000-0x0000000f0000 : "md5sum1"
[    5.361227] 0x0000000f0000-0x000000100000 : "md5sum2"
[    5.367402] 0x000000100000-0x000000110000 : "boot_check"
[    5.373787] comcerto_spi comcerto_spi.1: at 0x96500000 mapped to
0xE8814000, irq=60
[    5.381539] designware_spi_probe:Initializing SPI Controller :
Using dma=0 CLK(spi_i2c)=250000000 Hz
[    5.391342] comcerto_spi comcerto_spi.0: at 0x90498000 mapped to
0xE8816000, irq=61
-----------------------------------------------
[    9.481547] UBI: scanning is finished
[    9.536221] UBI: attached mtd4 (name "rootfs1", size 92 MiB) to ubi0
[    9.542602] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    9.549452] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    9.556190] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    9.563089] UBI: good PEBs: 730, bad PEBs: 6, corrupted PEBs: 0
[    9.569039] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
[    9.576209] UBI: max/mean erase counter: 11/1, WL threshold: 4096,
image sequence number: 938621452
[    9.585298] UBI: available PEBs: 0, total reserved PEBs: 730, PEBs
reserved for bad PEB handling: 44
[    9.594502] UBI: background thread "ubi_bgt0d" started, PID 527
[    9.601627] c2k-rtc c2k-rtc: setting system clock to 2012-07-16
17:49:19 UTC (1342460959)
[    9.609854] Registering CPUFreq(comcerto)
[    9.614671] md: Skipping autodetection of RAID arrays.
(raid=autodetect will force)
[   10.109537] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[   10.115593] UBIFS: file system size:   84946944 bytes (82956 KiB,
81 MiB, 669 LEBs)
[   10.123277] UBIFS: journal size:       9023488 bytes (8812 KiB, 8
MiB, 72 LEBs)
[   10.130622] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   10.136483] UBIFS: default compressor: zlib
[   10.140681] UBIFS: reserved for root:  0 bytes (0 KiB)
[   10.161459] VFS: Mounted root (ubifs filesystem) on device 0:13.
--------------------------------------------------------------------------
[   34.491872] UBI: schedule PEB 720 for scrubbing
[   35.496551] UBI: scrubbed PEB 720 (LEB 0:178), data moved to PEB 685
[   38.338551] UBI: schedule PEB 144 for scrubbing
[   39.861853] UBI: scrubbed PEB 144 (LEB 0:142), data moved to PEB 112
[   40.762302] UBI: schedule PEB 170 for scrubbing
[   41.785315] UBI: scrubbed PEB 170 (LEB 0:168), data moved to PEB 522
[   44.344547] UBI: schedule PEB 603 for scrubbing
[   45.340803] UBI: scrubbed PEB 603 (LEB 0:374), data moved to PEB 596
[   47.956012] UBI: schedule PEB 652 for scrubbing
[   49.248152] UBI: scrubbed PEB 652 (LEB 0:312), data moved to PEB 53
[   49.612931] UBI: schedule PEB 15 for scrubbing
[   50.567397] UBI: scrubbed PEB 15 (LEB 0:141), data moved to PEB 725
[   63.262926] UBI: schedule PEB 245 for scrubbing
[   64.358367] UBI: scrubbed PEB 245 (LEB 0:450), data moved to PEB 709
[   65.383584] UBI: schedule PEB 27 for scrubbing
[   66.675284] UBI: scrubbed PEB 27 (LEB 0:177), data moved to PEB 523
[   67.086551] UBI: schedule PEB 644 for scrubbing
[   67.950969] yaffs: dev is 8388609 name is "sda1" rw
[   67.956027] yaffs: passed flags ""
[   67.959551] yaffs: mtd is read only, setting superblock read only
[   68.362497] UBI: scrubbed PEB 644 (LEB 0:123), data moved to PEB 33
[   68.391761] yaffs: dev is 8388609 name is "sda1" rw
[   68.396803] yaffs: passed flags ""
[   68.400271] yaffs: mtd is read only, setting superblock read only
[   69.250548] UBI: schedule PEB 33 for scrubbing
[   70.138746] UBI: scrubbed PEB 33 (LEB 0:123), data moved to PEB 25
[   72.689685] UBI: schedule PEB 685 for scrubbing
[   73.946288] UBI: scrubbed PEB 685 (LEB 0:178), data moved to PEB 726
[   78.505748] UBI: schedule PEB 602 for scrubbing
[   79.495422] UBI: scrubbed PEB 602 (LEB 0:126), data moved to PEB 550
[   80.653549] UBI: schedule PEB 39 for scrubbing
[   81.798931] UBI: scrubbed PEB 39 (LEB 0:122), data moved to PEB 229
[   88.502851] UBI: schedule PEB 256 for scrubbing
[   89.405373] UBI: scrubbed PEB 256 (LEB 0:447), data moved to PEB 675
[   92.521612] UBI: schedule PEB 38 for scrubbing
[   93.448157] UBI: scrubbed PEB 38 (LEB 0:118), data moved to PEB 451
[   94.272328] UBI: schedule PEB 451 for scrubbing
[   95.526283] UBI: scrubbed PEB 451 (LEB 0:118), data moved to PEB 222
[   99.864548] UBI: schedule PEB 547 for scrubbing
[  101.467978] UBI: scrubbed PEB 547 (LEB 0:259), data moved to PEB 260
[  103.768054] UBI: schedule PEB 244 for scrubbing
[  108.655102] UBI: schedule PEB 250 for scrubbing
[  109.955079] UBI: scrubbed PEB 244 (LEB 0:242), data moved to PEB 685
[  111.398264] UBI: scrubbed PEB 250 (LEB 0:208), data moved to PEB 26
[  115.776754] UBI: schedule PEB 646 for scrubbing
[  116.692774] UBI: scrubbed PEB 646 (LEB 0:214), data moved to PEB 59
[  116.867968] UBI error: do_sync_erase: cannot erase PEB 646 (emulated)
[  116.874490] UBI error: erase_worker: failed to erase PEB 646, error -5
[  116.881067] UBI: mark PEB 646 as bad
------------------------------------------------------------------
[  284.244846] UBI: schedule PEB 205 for scrubbing
[  285.176521] UBI: scrubbed PEB 205 (LEB 0:450), data moved to PEB 525
[  288.379804] UBI: schedule PEB 171 for scrubbing
[  289.894932] UBI: scrubbed PEB 171 (LEB 0:169), data moved to PEB 678
[  291.096216] UBI: schedule PEB 608 for scrubbing
[  292.153477] UBI: scrubbed PEB 608 (LEB 0:268), data moved to PEB 107
[  292.344435] UBI: schedule PEB 705 for scrubbing
[  293.311608] UBI: schedule PEB 625 for scrubbing
[  293.739674] UBI: scrubbed PEB 705 (LEB 0:324), data moved to PEB 526
[  294.549757] UBI: schedule PEB 194 for scrubbing
[  295.201757] UBI: scrubbed PEB 625 (LEB 0:173), data moved to PEB 300
[  295.343045] UBI: schedule PEB 300 for scrubbing
[  296.597891] UBI: scrubbed PEB 194 (LEB 0:449), data moved to PEB 636
[  298.533679] UBI: scrubbed PEB 300 (LEB 0:173), data moved to PEB 591
[  310.821339] UBI: schedule PEB 540 for scrubbing
[  311.342791] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
452:0 (emulated)
[  311.350613] Backtrace:
[  311.353199] [<c40113a0>] (dump_backtrace+0x0/0x110) from
[<c43fff28>] (dump_stack+0x18/0x1c)
[  311.361720]  r6:000001c4 r5:fffffffb r4:e6196000 r3:c45a2dbc
[  311.367632] [<c43fff10>] (dump_stack+0x0/0x1c) from [<c426854c>]
(ubi_io_write+0x2d0/0x58c)
[  311.376098] [<c426827c>] (ubi_io_write+0x0/0x58c) from [<c4268a58>]
(ubi_io_write_ec_hdr+0x148/0x160)
[  311.385432] [<c4268910>] (ubi_io_write_ec_hdr+0x0/0x160) from
[<c42698d4>] (erase_worker+0x270/0x670)
[  311.394759]  r6:e4ce4000 r5:e6196000 r4:00000001
[  311.399562] [<c4269664>] (erase_worker+0x0/0x670) from [<c4269d2c>]
(do_sync_erase+0x58/0x68)
[  311.408172] [<c4269cd4>] (do_sync_erase+0x0/0x68) from [<c426a35c>]
(wear_leveling_worker+0x5d0/0x76c)
[  311.417537]  r7:e61ded28 r6:00000000 r5:e6196000 r4:e4ce4000
[  311.423370] [<c4269d8c>] (wear_leveling_worker+0x0/0x76c) from
[<c4269568>] (do_work+0xd4/0x110)
[  311.432250] [<c4269494>] (do_work+0x0/0x110) from [<c426b2c0>]
(ubi_thread+0x110/0x1a0)
[  311.440330]  r7:00000000 r6:00000000 r5:e61f2000 r4:e6196000
[  311.446252] [<c426b1b0>] (ubi_thread+0x0/0x1a0) from [<c405234c>]
(kthread+0x90/0x98)
[  311.454167] [<c40522bc>] (kthread+0x0/0x98) from [<c4036bd4>]
(do_exit+0x0/0x6f8)
[  311.461745]  r6:c4036bd4 r5:c40522bc r4:e6035ec4
[  311.466600] UBI error: erase_worker: failed to erase PEB 452, error -5
[  311.473199] UBI: mark PEB 452 as bad
[  311.501575] Bad block table written to 0x00000ffe0000, version 0x0B
[  311.528197] Bad block table written to 0x00000ffc0000, version 0x0B
[  311.534519] UBI: 40 PEBs left in the reserve
[  313.355032] UBI: schedule PEB 195 for scrubbing
[  314.580035] UBI: scrubbed PEB 540 (LEB 0:385), data moved to PEB 281
[  316.154272] UBI: scrubbed PEB 195 (LEB 0:111), data moved to PEB 262


Thanks
Chaitanya



On Mon, Jan 16, 2017 at 1:22 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Chaitanya,
>
> On Mon, Jan 16, 2017 at 6:28 AM, chaitanya vinnakota
> <chaitanya.sai.v@gmail.com> wrote:
>> Hi All,
>>
>> We are observing  UBIFS and ECC errors randomly even after safe
>> reboots . We are using a 256M  spansion nand flash and the kernel
>> version is 3.2.54. These errors disappear upon next reboots and appear
>> again randomly.
>
> Your log does not show ECC errors.
>
>> [   10.428162] UBIFS error (pid 1): ubifs_check_node: bad CRC:
>> calculated 0xa86e925a, read 0xd9a150bb
>
> Hmm, a bad CRC without ECC error? Odd.
>
>> Is the issue with UBIFS or with the nand driver ?
>
> I'd check the driver first. Does it pass mtd and ubi tests?
>
> --
> Thanks,
> //richard
