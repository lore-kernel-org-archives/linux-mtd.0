Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkmFg-00010E-0F
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2012 01:45:52 +0000
Message-ID: <50CFCBDC.6090102@freescale.com>
Date: Tue, 18 Dec 2012 09:50:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: UBI IO errors with GPMI NAND
References: <50CBF18B.3050208@gmail.com>
In-Reply-To: <50CBF18B.3050208@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B412=E6=9C=8815=E6=97=A5 11:42, Vikram Narayanan =E5=
=86=99=E9=81=93:
> I'm using a i.Mx6 Solo based custom board with the below NAND chip.
The gpmi-nand can not run in the imx6 solo board. Please check the=20
PINMUX for the gpmi. It is not ready.

thanks.

Huang Shijie


> <<NAND device: Manufacturer ID: 0x98, Chip ID: 0xac (Toshiba NAND=20
> 512MiB 1,8V 8-bit), page size: 4096, OOB size: 128>>
>
> I'm getting warnings like the one below while attaching the mtd to=20
> ubi, with a backtrace.
>
> <<UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096=20
> bytes from PEB 969:4096, read only 4096 bytes, retry>>
>
> According to [1], I ran mtd-tests. But the mtd_oobtest failed to=20
> proceed as the GPMI-NAND doesn't define a valid nand_ecclayout=20
> structure. (drivers/mtd/nand/gpmi-nand/gpmi-nand.c) [l2-mtd.git]
>
> I guess that the mtd_oobtest can't be performed without a valid=20
> nand_ecclayout as the ooblen, oobavail are taken from this struct when=20
> trying to write to the OOB area in the test.
>
> Did someone try to execute this test with gpmi-nand driver?
>
> The weird behavior is, I see the errors while mounting an empty flash=20
> as well. I need to do a ubiattach followed by ubiformat. Please see=20
> the detailed log.
>
> [1] http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error
>
> <Detailed log>
> root@BOX:/# ubiattach -m 6 /dev/ubi_ctrl
> [ 77.053308] UBI: attaching mtd6 to ubi2
> [ 77.058095] UBI: physical eraseblock size: 262144 bytes (256 KiB)
> [ 77.066010] UBI: logical eraseblock size: 253952 bytes
> [ 77.072237] UBI: smallest flash I/O unit: 4096
> [ 77.077782] UBI: VID header offset: 4096 (aligned 4096)
> [ 77.085361] UBI: data offset: 8192
> [ 78.653120] UBI warning: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 714:4096, read only 4096 bytes, retry
> [ 78.668408] UBI warning: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 714:4096, read only 4096 bytes, retry
> [ 78.683707] UBI warning: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 714:4096, read only 4096 bytes, retry
> [ 78.699016] UBI error: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 714:4096, read 4096 bytes
> [ 78.711264] Backtrace:
> [ 78.714606] [<80011464>] (dump_backtrace+0x0/0x10c) from [<80414774>]=20
> (dump_stack+0x18/0x1c)
> [ 78.724676] r6:00001000 r5:ffffffb6 r4:8a311800 r3:60000013
> [ 78.732046] [<8041475c>] (dump_stack+0x0/0x1c) from [<802bb030>]=20
> (ubi_io_read+0x1fc/0x2d8)
> [ 78.741991] [<802bae34>] (ubi_io_read+0x0/0x2d8) from [<802bb56c>]=20
> (ubi_io_read_vid_hdr+0x78/0x220)
> [ 78.752734] [<802bb4f4>] (ubi_io_read_vid_hdr+0x0/0x220) from=20
> [<802bfbdc>] (ubi_attach+0x31c/0x1448)
> [ 78.763593] [<802bf8c0>] (ubi_attach+0x0/0x1448) from [<802b5b6c>]=20
> (ubi_attach_mtd_dev+0x6a8/0xcf4)
> [ 78.774390] [<802b54c4>] (ubi_attach_mtd_dev+0x0/0xcf4) from=20
> [<802b6460>] (ctrl_cdev_ioctl+0xd8/0x184)
> [ 78.785485] [<802b6388>] (ctrl_cdev_ioctl+0x0/0x184) from=20
> [<800dbaa4>] (do_vfs_ioctl+0x570/0x5e4)
> [ 78.796100] r7:00000003 r6:8a610580 r5:8a21fc58 r4:7e9ccc2c
> [ 78.803564] [<800db534>] (do_vfs_ioctl+0x0/0x5e4) from [<800dbb58>]=20
> (sys_ioctl+0x40/0x64)
> [ 78.813471] r9:8a616000 r8:8000d944 r7:00000003 r6:40186f40 r5:7e9ccc2=
c
> r4:8a610580
> [ 78.823947] [<800dbb18>] (sys_ioctl+0x0/0x64) from [<8000d7c0>]=20
> (ret_fast_syscall+0x0/0x30)
> [ 78.833987] r7:00000036 r6:00008b20 r5:00000000 r4:00000000
> [ 79.467228] UBI warning: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 969:4096, read only 4096 bytes, retry
> [ 79.482716] UBI warning: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 969:4096, read only 4096 bytes, retry
> [ 79.498185] UBI warning: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 969:4096, read only 4096 bytes, retry
> [ 79.513668] UBI error: ubi_io_read: error -74 (ECC error) while=20
> reading 4096 bytes from PEB 969:4096, read 4096 bytes
> [ 79.526009] Backtrace:
> [ 79.529352] [<80011464>] (dump_backtrace+0x0/0x10c) from [<80414774>]=20
> (dump_stack+0x18/0x1c)
> [ 79.539499] r6:00001000 r5:ffffffb6 r4:8a311800 r3:60000013
> [ 79.546945] [<8041475c>] (dump_stack+0x0/0x1c) from [<802bb030>]=20
> (ubi_io_read+0x1fc/0x2d8)
> [ 79.556920] [<802bae34>] (ubi_io_read+0x0/0x2d8) from [<802bb56c>]=20
> (ubi_io_read_vid_hdr+0x78/0x220)
> [ 79.567730] [<802bb4f4>] (ubi_io_read_vid_hdr+0x0/0x220) from=20
> [<802bfbdc>] (ubi_attach+0x31c/0x1448)
> [ 79.578628] [<802bf8c0>] (ubi_attach+0x0/0x1448) from [<802b5b6c>]=20
> (ubi_attach_mtd_dev+0x6a8/0xcf4)
> [ 79.589458] [<802b54c4>] (ubi_attach_mtd_dev+0x0/0xcf4) from=20
> [<802b6460>] (ctrl_cdev_ioctl+0xd8/0x184)
> [ 79.600529] [<802b6388>] (ctrl_cdev_ioctl+0x0/0x184) from=20
> [<800dbaa4>] (do_vfs_ioctl+0x570/0x5e4)
> [ 79.611135] r7:00000003 r6:8a610580 r5:8a21fc58 r4:7e9ccc2c
> [ 79.618593] [<800db534>] (do_vfs_ioctl+0x0/0x5e4) from [<800dbb58>]=20
> (sys_ioctl+0x40/0x64)
> [ 79.628488] r9:8a616000 r8:8000d944 r7:00000003 r6:40186f40 r5:7e9ccc2=
c
> r4:8a610580
> [ 79.638971] [<800dbb18>] (sys_ioctl+0x0/0x64) from [<8000d7c0>]=20
> (ret_fast_syscall+0x0/0x30)
> [ 79.649009] r7:00000036 r6:00008b20 r5:00000000 r4:00000000
> [ 80.160882] UBI error: scan_peb: bad image sequence number=20
> -1059128657 in PEB 1168, expected -2128599336
> [ 80.172534] UBI error: ubi_attach_mtd_dev: failed to attach mtd6,=20
> error -22
> ubiattach: error!: cannot attach mtd6
> error 22 (Invalid argument)
> root@BOX:/# ubiformat /dev/mtd6
> ubiformat: mtd6 (nand), size 307232768 bytes (293.0 MiB), 1172=20
> eraseblocks of 262144 bytes (256.0 KiB), min. I/O size 4096 bytes
> libscan: scanning eraseblock 1171 -- 100 % complete
> ubiformat: 1170 eraseblocks have valid erase counter, mean value is 1
> ubiformat: warning!: 2 of 1172 eraseblocks contain non-ubifs data
> ubiformat: continue? (yes/no) yes
> ubiformat: formatting eraseblock 1171 -- 100 % complete
> root@BOX:/# ubiattach -m 6 /dev/ubi_ctrl
> [ 112.615497] UBI: attaching mtd6 to ubi2
> [ 112.620299] UBI: physical eraseblock size: 262144 bytes (256 KiB)
> [ 112.628266] UBI: logical eraseblock size: 253952 bytes
> [ 112.634542] UBI: smallest flash I/O unit: 4096
> [ 112.640071] UBI: VID header offset: 4096 (aligned 4096)
> [ 112.647673] UBI: data offset: 8192
> [ 115.211159] UBI: max. sequence number: 0
> [ 115.231875] UBI: attached mtd6 to ubi2
> [ 115.236460] UBI: MTD device name: "user_data2"
> [ 115.242453] UBI: MTD device size: 293 MiB
> [ 115.248174] UBI: number of good PEBs: 1172
> [ 115.253620] UBI: number of bad PEBs: 0
> [ 115.258763] UBI: number of corrupted PEBs: 0
> [ 115.263925] UBI: max. allowed volumes: 128
> [ 115.269230] UBI: wear-leveling threshold: 4096
> [ 115.274623] UBI: number of internal volumes: 1
> [ 115.279726] UBI: number of user volumes: 0
> [ 115.284826] UBI: available PEBs: 1157
> [ 115.290158] UBI: total number of reserved PEBs: 15
> [ 115.295582] UBI: number of PEBs reserved for bad PEB handling: 11
> [ 115.302857] UBI: max/mean erase counter: 3/2
> [ 115.307752] UBI: image sequence number: 552854966
> [ 115.313163] UBI: background thread "ubi_bgt2d" started, PID 134
> UBI device number 2, total 1172 LEBs (297631744 bytes, 283.8 MiB),=20
> available 1157 LEBs (293822464 bytes, 280.2 MiB), LEB size 253952=20
> bytes (248.0 KiB)
> </Detailed log>
>
