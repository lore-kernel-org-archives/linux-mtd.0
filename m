Received: from mail-oi0-f54.google.com ([209.85.218.54])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVcC4-0004g3-M3
 for linux-mtd@lists.infradead.org; Mon, 23 Jan 2017 10:49:50 +0000
Received: by mail-oi0-f54.google.com with SMTP id m124so77819696oif.1
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2017 02:49:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMBC=j5nyA=7vCb_AeM_oYAS+p_+mrcG=nwXVDO6WqD=Sg_nMg@mail.gmail.com>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
 <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
 <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
 <CAMBC=j6t2h_yB3wQbNUexrJto+O3ruTXo992JWFLH293OyH0Bg@mail.gmail.com>
 <10f4c447-f1e5-89dc-17b6-b5d450a473fe@nod.at>
 <CAMBC=j5nyA=7vCb_AeM_oYAS+p_+mrcG=nwXVDO6WqD=Sg_nMg@mail.gmail.com>
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Mon, 23 Jan 2017 16:18:25 +0530
Message-ID: <CAMBC=j74mtCsatQnhOLfouA6d58VCd69YY9W8c=Soa8CiCtTFA@mail.gmail.com>
Subject: Re: UBIFS errors are randomly seen after reboots
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
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

We are seeing UBIFS errors even when the root-filesystem  is mounted
read-only. But , the error is reported only once.
Our test scenario is we are rebooting the device by calling "reboot"
from a script ,  during data-write operations to the mtd partitions
other than root-filesystem executed by another script.

What's more baffling is why root-filesystem UBIFS errors are seen when
the data-write operations are  performed on the other partitions and
most importantly when rootfs is mounted read-only,

[  155.121005] UBIFS error (pid 5040): ubifs_decompress: cannot
decompress 2434 bytes, compressor zlib, error -22
[  155.121017] UBIFS error (pid 5040): read_block: bad data node
(block 60, inode 3484)
[  155.121026] UBIFS error (pid 5040): do_readpage: cannot read page
60 of inode 3484, error -22

ECC errors are also observed sometimes when the rootfs is mounted read-only

[  154.824361] ECC: uncorrectable error 2 !!!
[  154.824368] ECC correction failed for page 0x00014b58
[  154.825474] ECC: uncorrectable error 2 !!!
[  154.825479] ECC correction failed for page 0x00014b58
[  154.825604] UBI warning: ubi_io_read: error -74 (ECC error) while
reading 188 bytes from PEB 451:50368, read only 188 bytes, retry

The page 0x00014b58 falls in the rootfs partition. But , nanddump
utility is not reporting any bad blocks from the rootfs partition .

 ~# nanddump /dev/mtd4
nanddump: warning!: you did not specify a default bad-block handling
  method. In future versions, the default will change to
  --bb=skipbad. Use "nanddump --help" for more information.
nanddump: warning!: in next release, nanddump will not dump OOB
  by default. Use `nanddump --oob' explicitly to ensure
  it is dumped.
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0

 We ran mtd and ubi tests , mtd all tests passed but UBI one test i.e
io_basic failed.

Can you please help us in this regard. Any inputs or suggestions ?


Thanks
Chaitanya

On Wed, Jan 18, 2017 at 5:05 PM, chaitanya vinnakota
<chaitanya.sai.v@gmail.com> wrote:
> Hi Richard,
> io_basic test failed  whereas the rest of the tests i.e io_read
> ,io_update,  io_paral,  volrefcnt passed.  I also ran mtd-tests and
> all of them passed.
>
> To sum it up , we've rsvol and io_basic which failed and the rest all
> passed. Does this give any lead to the root cause of UBIFS errors or
> are there any pending tests which we need to perform ?
>
>
> Below is the output of io_basic test
>
> root@router6654A1:~/arm-openwrt-linux# ./io_basic /dev/ubi1
> [137176.494161] INFO: rcu_sched detected stall on CPU 0 (t=6000 jiffies)
> [137176.500628] Backtrace:
> [137176.503212] [<c40113a0>] (dump_backtrace+0x0/0x110) from
> [<c43fff28>] (dump_stack+0x18/0x1c)
> [137176.511765]  r6:c458e080
> [137176.514150] INFO: rcu_sched detected stalls on CPUs/tasks: { 0}
> (detected by 1, t=6002 jiffies)
> [137176.514166] Backtrace:
> [137176.514186] [<c40113a0>] (dump_backtrace+0x0/0x110) from
> [<c43fff28>] (dump_stack+0x18/0x1c)
> [137176.514196]  r6:c45a6680 r5:c45a6620 r4:c4e31674 r3:00000000
> [137176.514228] [<c43fff10>] (dump_stack+0x0/0x1c) from [<c4080368>]
> (__rcu_pending+0x210/0x38c)
> [137176.514248] [<c4080158>] (__rcu_pending+0x0/0x38c) from
> [<c4081270>] (rcu_check_callbacks+0xe8/0x17c)
> [137176.514269] [<c4081188>] (rcu_check_callbacks+0x0/0x17c) from
> [<c4041f70>] (update_process_times+0x40/0x64)
> [137176.514279]  r8:e5267595 r7:00000001 r6:e6049780 r5:00000000 r4:e6066000
> [137176.514294] r3:00010000
> [137176.514315] [<c4041f30>] (update_process_times+0x0/0x64) from
> [<c4063174>] (tick_sched_timer+0x9c/0xdc)
> [137176.514325]  r7:c4e314a0 r6:e6067f68 r5:e6066000 r4:c4e31598
> [137176.514351] [<c40630d8>] (tick_sched_timer+0x0/0xdc) from
> [<c40564f0>] (__run_hrtimer+0xf4/0x1c8)
> [137176.514360]  r9:e6067eb0 r8:e5266b80 r6:c4e314d8 r5:c4e314a0 r4:c4e31598
> [137176.514385] [<c40563fc>] (__run_hrtimer+0x0/0x1c8) from
> [<c4057248>] (hrtimer_interrupt+0x124/0x288)
> [137176.514404] [<c4057124>] (hrtimer_interrupt+0x0/0x288) from
> [<c4013640>] (twd_handler+0x28/0x30)
> [137176.514422] [<c4013618>] (twd_handler+0x0/0x30) from [<c407d8d8>]
> (handle_percpu_devid_irq+0xd0/0x150)
> [137176.514431]  r4:0000001d r3:c4013618
> [137176.514448] [<c407d808>] (handle_percpu_devid_irq+0x0/0x150) from
> [<c4079e88>] (generic_handle_irq+0x34/0x48)
> [137176.514466] [<c4079e54>] (generic_handle_irq+0x0/0x48) from
> [<c400e494>] (handle_IRQ+0x80/0xc0)
> [137176.514483] [<c400e414>] (handle_IRQ+0x0/0xc0) from [<c40081d0>]
> (asm_do_IRQ+0x10/0x14)
> [137176.514492]  r5:60000013 r4:c400e72c
> [137176.514507] [<c40081c0>] (asm_do_IRQ+0x0/0x14) from [<c400d738>]
> (__irq_svc+0x38/0x90)
> [137176.514518] Exception stack(0xe6067f68 to 0xe6067fb0)
> [137176.514529] 7f60:                   00000001 00000000 e6067fb0
> 00000000 e6066000 c44058a8
> [137176.514544] 7f80: c45c6984 c45c6ab4 0400406a 412fc091 00000000
> e6067fbc e6067fc0 e6067fb0
> [137176.514555] 7fa0: c400e728 c400e72c 60000013 ffffffff
> [137176.514571] [<c400e700>] (default_idle+0x0/0x30) from [<c400e90c>]
> (cpu_idle+0x84/0xc8)
> [137176.514596] [<c400e888>] (cpu_idle+0x0/0xc8) from [<c43fcc0c>]
> (secondary_start_kernel+0x140/0x158)
> [137176.514606]  r6:10c03c7d r5:c45a8b14 r4:00000002 r3:c45988ac
> [137176.514693] [<c43fcacc>] (secondary_start_kernel+0x0/0x158) from
> [<043fc4b4>] (0x43fc4b4)
> [137176.514703]  r5:00000015 r4:2606806a
> [137176.739774]  r5:c45a6620 r4:c4e29674 r3:c45a2dbc
> [137176.744558] [<c43fff10>] (dump_stack+0x0/0x1c) from [<c40801e0>]
> (__rcu_pending+0x88/0x38c)
> [137176.753035] [<c4080158>] (__rcu_pending+0x0/0x38c) from
> [<c4081270>] (rcu_check_callbacks+0xe8/0x17c)
> [137176.762382] [<c4081188>] (rcu_check_callbacks+0x0/0x17c) from
> [<c4041f70>] (update_process_times+0x40/0x64)
> [137176.772240]  r8:e3f551f5 r7:00000000 r6:e4a71540 r5:00000000 r4:e2012000
> [137176.778925] r3:00010000
> [137176.781677] [<c4041f30>] (update_process_times+0x0/0x64) from
> [<c4063174>] (tick_sched_timer+0x9c/0xdc)
> [137176.791186]  r7:c4e294a0 r6:e2013c70 r5:e2012000 r4:c4e29598
> [137176.797011] [<c40630d8>] (tick_sched_timer+0x0/0xdc) from
> [<c40564f0>] (__run_hrtimer+0xf4/0x1c8)
> [137176.805998]  r9:e2013bb8 r8:e3f53e80 r6:c4e294d8 r5:c4e294a0 r4:c4e29598
> [137176.812875] [<c40563fc>] (__run_hrtimer+0x0/0x1c8) from
> [<c4057248>] (hrtimer_interrupt+0x124/0x288)
> [137176.822134] [<c4057124>] (hrtimer_interrupt+0x0/0x288) from
> [<c4013640>] (twd_handler+0x28/0x30)
> [137176.831042] [<c4013618>] (twd_handler+0x0/0x30) from [<c407d8d8>]
> (handle_percpu_devid_irq+0xd0/0x150)
> [137176.840465]  r4:0000001d r3:c4013618
> [137176.844170] [<c407d808>] (handle_percpu_devid_irq+0x0/0x150) from
> [<c4079e88>] (generic_handle_irq+0x34/0x48)
> [137176.854213] [<c4079e54>] (generic_handle_irq+0x0/0x48) from
> [<c400e494>] (handle_IRQ+0x80/0xc0)
> [137176.863032] [<c400e414>] (handle_IRQ+0x0/0xc0) from [<c40081d0>]
> (asm_do_IRQ+0x10/0x14)
> [137176.871148]  r5:20000013 r4:c41c330c
> [137176.874852] [<c40081c0>] (asm_do_IRQ+0x0/0x14) from [<c400d738>]
> (__irq_svc+0x38/0x90)
> [137176.882883] Exception stack(0xe2013c70 to 0xe2013cb8)
> [137176.888041] 3c60:                                     e8800000
> ec3cf580 00000270 a5a5a5a5
> [137176.896335] 3c80: a5a5a5a5 0000a5a5 000000a5 ec3cf400 00000001
> c4619aa8 00000400 e2013cd4
> [137176.904629] 3ca0: 000000a5 e2013cb8 000000a5 c41c330c 20000013 ffffffff
> [137176.911371] [<c42594c8>] (nand_read_buf+0x0/0x1c) from
> [<c425d8a4>] (comcerto_nand_read_page_hwecc+0x70/0x140)
> [137176.921498] [<c425d834>] (comcerto_nand_read_page_hwecc+0x0/0x140)
> from [<c4258e68>] (nand_do_read_ops+0x200/0x438)
> [137176.932062] [<c4258c68>] (nand_do_read_ops+0x0/0x438) from
> [<c425a950>] (nand_read+0x80/0xa4)
> [137176.940708] [<c425a8d0>] (nand_read+0x0/0xa4) from [<c42442ac>]
> (part_read+0x78/0xcc)
> [137176.948649]  r9:00000000 r8:04140000 r7:00000000 r6:06d40000 r5:00000003
> [137176.955334] r4:e6295c00
> [137176.958081] [<c4244234>] (part_read+0x0/0xcc) from [<c42675b0>]
> (ubi_io_read+0x120/0x2b0)
> [137176.966379] [<c4267490>] (ubi_io_read+0x0/0x2b0) from [<c426522c>]
> (ubi_eba_read_leb+0x2b8/0x3b0)
> [137176.975375] [<c4264f74>] (ubi_eba_read_leb+0x0/0x3b0) from
> [<c426ddd4>] (ubi_check_volume+0x78/0xbc)
> [137176.984630] [<c426dd5c>] (ubi_check_volume+0x0/0xbc) from
> [<c42639ec>] (vol_cdev_write+0x2d4/0x354)
> [137176.993806] [<c4263718>] (vol_cdev_write+0x0/0x354) from
> [<c40d7c00>] (vfs_write+0xbc/0x148)
> [137177.002364] [<c40d7b44>] (vfs_write+0x0/0x148) from [<c40d7e8c>]
> (sys_write+0x48/0x74)
> [137177.010392]  r8:c400dd44 r7:00000004 r6:00000200 r5:bebc3a18 r4:e4996e40
> [137177.017270] [<c40d7e44>] (sys_write+0x0/0x74) from [<c400dbc0>]
> (ret_fast_syscall+0x0/0x30)
> [137177.025734]  r6:00010ba0 r5:00000000 r4:bebc3ca8
>
>
> Thanks
> Chaitanya
>
> On Tue, Jan 17, 2017 at 8:09 PM, Richard Weinberger <richard@nod.at> wrote:
>> Chaitanya,
>>
>> Am 17.01.2017 um 15:32 schrieb chaitanya vinnakota:
>>> Now , I'm seeing altogether different form of errors.
>>>
>>> ./runtests.sh /dev/ubi1
>>> Running mkvol_basic /dev/ubi1
>>> Running mkvol_bad /dev/ubi1
>>
>> _bad is supposed to return errors.
>>
>>> [77361.468670] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.475116] Volume creation request dump:
>>> [77361.479139]  vol_id    -2
>>> [77361.481768]  alignment 1
>>> [77361.484322]  bytes     86343680
>>> [77361.487473]  vol_type  3
>>> [77361.490013]  name_len  22
>>> [77361.492641]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.498235] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.504652] Volume creation request dump:
>>> [77361.508676]  vol_id    128
>>> [77361.511390]  alignment 1
>>> [77361.513930]  bytes     86343680
>>> [77361.517095]  vol_type  3
>>> [77361.519636]  name_len  22
>>> [77361.522265]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.527634] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.534009] Volume creation request dump:
>>> [77361.538064]  vol_id    0
>>> [77361.540606]  alignment 0
>>> [77361.543145]  bytes     86343680
>>> [77361.546316]  vol_type  3
>>> [77361.548857]  name_len  22
>>> [77361.551485]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.558437] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.564862] Volume creation request dump:
>>> [77361.568902]  vol_id    0
>>> [77361.571457]  alignment -1
>>> [77361.574101]  bytes     86343680
>>> [77361.577313]  vol_type  3
>>> [77361.579866]  name_len  22
>>> [77361.582504]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.587943] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.594355] Volume creation request dump:
>>> [77361.598394]  vol_id    0
>>> [77361.600945]  alignment 126977
>>> [77361.603936]  bytes     86343680
>>> [77361.607132]  vol_type  3
>>> [77361.609688]  name_len  22
>>> [77361.612329]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.617765] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.624199] Volume creation request dump:
>>> [77361.628241]  vol_id    0
>>> [77361.630800]  alignment 2049
>>> [77361.633617]  bytes     86343680
>>> [77361.636814]  vol_type  3
>>> [77361.639368]  name_len  22
>>> [77361.642010]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.647478] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.653868] Volume creation request dump:
>>> [77361.657940]  vol_id    0
>>> [77361.660510]  alignment 1
>>> [77361.663065]  bytes     -1
>>> [77361.665739]  vol_type  3
>>> [77361.668290]  name_len  22
>>> [77361.670930]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.676360] UBI error: verify_mkvol_req: bad volume creation request
>>> [77361.682748] Volume creation request dump:
>>> [77361.686826]  vol_id    0
>>> [77361.689383]  alignment 1
>>> [77361.691936]  bytes     0
>>> [77361.694513]  vol_type  3
>>> [77361.697068]  name_len  22
>>> [77361.699708]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.705119] UBI error: ubi_create_volume: not enough PEBs, only 680 available
>>> [77361.712293] UBI error: ubi_create_volume: cannot create volume 0, error -28
>>> [77361.719415] UBI error: ubi_create_volume: not enough PEBs, only 680 available
>>> [77361.726655] UBI error: ubi_create_volume: cannot create volume 0, error -28
>>> [77361.733804] UBI error: verify_mkvol_req: bad volume creation request
>>
>> These are fine.
>>
>>> [77361.740243] Volume creation request dump:
>>> [77361.744301]  vol_id    0
>>> [77361.746854]  alignment 1
>>> [77361.749407]  bytes     126976
>>> [77361.752397]  vol_type  7
>>> [77361.754981]  name_len  22
>>> [77361.757622]  1st 16 characters of name: mkvol_bad:test_m
>>> [77361.926468] UBI error: ubi_create_volume: volume 0 already exists
>>> [77361.932606] UBI error: ubi_create_volume: cannot create volume 0, error -17
>>> [77361.939839] UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
>>> [77361.947946] UBI error: ubi_create_volume: cannot create volume 1, error -17
>>> [77362.290898] UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
>>> [77362.299021] UBI error: ubi_create_volume: cannot create volume 1, error -17
>>> [77405.406937] UBI error: ubi_open_volume: cannot open device 1, volume 128, error -22
>>> [77405.420226] UBI error: ubi_open_volume: cannot open device 1, volume -1, error -22
>>> [77405.427910] UBI error: ubi_open_volume: cannot open device 1, volume 128, error -22
>>> [77405.435657] UBI error: ubi_open_volume: cannot open device 1, volume 0, error -19
>>> [77405.774800] UBI error: ubi_open_volume: cannot open device 1, volume 0, error -19
>>
>> These are fine too.
>>
>>> Running mkvol_paral /dev/ubi1
>>> Running rsvol /dev/ubi1
>>> [rsvol] test_rsvol1():178: function open() failed with error 2 (No such file or directory)
>>> [rsvol] test_rsvol1():179: cannot open "/dev/ubi1_0"
>>
>> That's one is odd.
>> Do all other tests fail too?
>> io_basic and io_parallel are interesting. You can also start them by hand.
>>
>> Thanks,
>> //richard
