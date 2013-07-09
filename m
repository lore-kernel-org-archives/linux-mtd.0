Received: from srv1.bluewind.it ([216.38.51.188])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwTCL-0001jm-76
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2013 08:22:58 +0000
Received: from smtp.bluewind.it ([80.86.152.212]:46281 helo=[192.168.0.42])
 by srv1.bluewind.it with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.80.1) (envelope-from <enrico.benetti@bluewind.it>)
 id 1UwTBz-0002NJ-UW
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2013 10:22:36 +0200
Message-ID: <51DBC864.6060505@bluewind.it>
Date: Tue, 09 Jul 2013 10:23:00 +0200
From: enrico benetti <enrico.benetti@bluewind.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBI leb_write_unlock NULL pointer Oops
References: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
 <1372662331.22014.27.camel@sauron.fi.intel.com>
 <CAP+RiCDA=WnWfja+qa25Va60Wjee9Pcq69B02yMsvtw4BcwcKQ@mail.gmail.com>
In-Reply-To: <CAP+RiCDA=WnWfja+qa25Va60Wjee9Pcq69B02yMsvtw4BcwcKQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I have yet to reproduce the oops', but the two patches submitted by
> Atrem look like them may correct the issue.  I'll apply the patches
> and try to reproduce the issue again.
>
Hi Brent,
I'm working on a back-ported 2.6.35.3 tree for a NOR based system (
00AM29EWH).

I already merged

605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid bug

but rarely I fall into this oops on NULL pointer, so they don't seem to fix
the issue.
I'm going to run again integck test with ubi debug messages active.

Trace follows below:

integck: write 152 bytes, offset 251, file 2694 (line 903)
integck: write 2 bytes, offset 10225, file 632263 (line 903)
integck: write 1 bytes, offset 0, file 
kdubxbrrfdtmjdhbqlhkpzguwvcmdjaprvibhjcvpfmkylppqaxnkocxjbxqssmxcnsdmsfbxesrssgtzkejenoccxgqusrov
ngonlypkcejuqxiyjzxbsykagidcfmckgpfzcvvfwkiawgizuarwvlfcibwtefadewrhzthaazwzylqjnauhmlavxhqmpmxdbhriyknugufzowqbutprulmyzsckvnscixdlejbf 

ftfloltumrmoayncb (line 903)
integck: write 30564 bytes, offset 6132, file 538228 (line 903)
integck: write 1 bytes, offset 30284, file 538228 (line 903)
integck: write 42 bytes, offset 36734, file 433076 (line 903)
[  300.554525] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000c
[  300.562641] pgd = 8d408000
[  300.565353] [0000000c] *pgd=9d46b031, *pte=00000000, *ppte=00000000
[  300.571672] Internal error: Oops: 17 [#1] PREEMPT
[  300.576383] last sysfs file: /sys/devices/virtual/ubi/ubi0/min_io_size
[  300.582919] Modules linked in:
[  300.585996] CPU: 0    Not tainted 
(2.6.35.3-998-ga1cd8a7-v3.8-gabc6f42 #15)
[  300.593080] PC is at __up_write+0x40/0x188
[  300.597192] LR is at leb_write_unlock+0xa0/0xf4
[  300.601733] pc : [<801fb698>]    lr : [<80283e08>] psr: 00000093
[  300.601741] sp : 8d3a9ad0  ip : 8d3a9af8  fp : 00000012
[  300.613236] r10: 00013d08  r9 : 00000080  r8 : 60000013
[  300.618470] r7 : 8d3fb29c  r6 : 00000000  r5 : 8d3fb298  r4 : 8d3fb280
[  300.625006] r3 : 8d3a8000  r2 : 00000000  r1 : 00000000  r0 : 8d3fb298
[  300.631547] Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[  300.638780] Control: 10c5387d  Table: 9d408019  DAC: 00000015
[  300.644535] Process integck (pid: 1243, stack limit = 0x8d3a82e8)
[  300.650638] Stack: (0x8d3a9ad0 to 0x8d3aa000)
[  300.655006] 9ac0:                                     8d3fb298 
8d3fb280 8d31f000 00000000
[  300.663201] 9ae0: 0000000b 00000000 00000080 00013d08 00000012 
80283e08 8d31f000 8d343c00
[  300.671395] 9b00: 00000000 802850e0 000002f8 00000021 00000000 
80057180 0000001f 8002a070
[  300.679591] 9b20: ffffffff 8e800000 8d343c00 8002aa8c 8b5cf000 
8b9024b1 8b5cf125 8d434000
[  300.687786] 9b40: ffccd581 8b5cf000 000008cd 8ea62000 000000bd 
000002f8 8d343c00 00013d08
[  300.695981] 9b60: 8d31f000 0000000b 8d43f080 00000000 8d434000 
80282c34 00013d08 000002f8
[  300.704176] 9b80: 8b5d0000 00005789 00000057 000000bb 8d434030 
8d434000 8d440000 00013d08
[  300.712371] 9ba0: 0000000b 000002f8 8d434000 00000108 00013d08 
801a4bd4 000002f8 0000000b
[  300.720566] 9bc0: 8d434000 00013d08 8d400520 8d440000 00001030 
8d400520 00001030 801a5308
[  300.728761] 9be0: 000002f8 8d400544 00000000 00000000 8d434000 
00001030 00000000 0004a6f6
[  300.736955] 9c00: 8d440000 0000000b 00000000 8d434000 8d440000 
8d3a9cc0 8d400520 00001030
[  300.745150] 9c20: 0000000b 00000001 00013d08 80198984 8d3a9c74 
00000108 00000012 00013c80
[  300.753344] 9c40: 00000000 8d440000 00000000 8d3a9d1c 00000008 
00000000 4000286d 806f89e0
[  300.761540] 9c60: 8c0eb9d0 00000000 a0000013 8d440008 00001000 
00000000 00000000 806f89e0
[  300.769735] 9c80: 8d440000 8c0eb930 00001000 20000008 00000880 
8b5cf000 00000001 8019a954
[  300.777930] 9ca0: 00001000 80085108 00000000 8d4405f4 8d440604 
806f89e0 806f89e0 8d3a9d80
[  300.786125] 9cc0: 00000880 20000008 8c0eb9d0 00000008 806f89e0 
8d3a9d14 00000000 8c0eb9d0
[  300.794319] 9ce0: 00000000 8008bd80 8d3a9d80 8008c718 00000001 
00000000 00000009 00000001
[  300.802513] 9d00: 8008bd6c 8c0eb9d0 00008f7d 00000000 00008fa8 
00000001 00000000 806f89e0
[  300.810708] 9d20: 8b5cf000 8b5cff7e 0000002a 00000000 0000002a 
0000002a 8d3a8000 8c0eb9d0
[  300.818902] 9d40: 00000000 00000f7e 803eb838 00000000 0000002a 
00000009 0000002a 8d3a9d80
[  300.827096] 9d60: 8c0eb9d0 00008f7e 00000000 00008f7e 00000000 
00000001 00000000 80085dac
[  300.835291] 9d80: 00000001 00000000 00000000 7fffffff 00000000 
00000000 00008f7e 00000000
[  300.843485] 9da0: 00008fa7 00000000 00000000 00000000 8c0eb9d0 
00000015 8c0eb9d0 00008fa7
[  300.851680] 9dc0: 00000000 80085de8 00008fa7 00000000 00000001 
80574e68 80574e60 8c0eb9d0
[  300.859875] 9de0: 8d087a80 00008fa7 00000000 0000002a 8d3a9f38 
800d4294 00008fa7 00000000
[  300.868069] 9e00: 00008f7e 00008fa7 00000000 0000002a 00000000 
800d4348 00008fa7 00000000
[  300.876264] 9e20: 00000001 8d087a80 8c0eb9a4 0000002a 00000000 
8d087a80 00000001 800865c0
[  300.884458] 9e40: 0000002a 00000000 00008f7e 00000000 8d3a9ec0 
8d440000 00000000 00000001
[  300.892653] 9e60: 8d3a9f38 80199254 00008f7e 00000000 8052db38 
00100000 00000000 00000000
[  300.900847] 9e80: 00000000 000000a0 60000013 00000000 00000002 
a0000013 8d3a9ec0 8d3a9f80
[  300.909042] 9ea0: 8d087a80 8d3a9f38 fffffdee 8d3a8000 00008f7e 
800b25c0 00008f7e 00000000
[  300.917236] 9ec0: a0000013 8d0d1d80 00000000 00000001 ffffffff 
8d087a80 00000000 00000000
[  300.925431] 9ee0: 00000000 00000000 8d102e60 40000013 00000000 
00000000 00008fa8 00000000
[  300.933626] 9f00: 2aac9000 0000003e 0000002a 60000113 0000002a 
00000000 00000000 00000102
[  300.941821] 9f20: 0000000a 80533af0 8d3a9f44 8004e01c 00000004 
8c004000 7eb99a48 0000002a
[  300.950016] 9f40: 0000002a 8d087a80 7eb99a48 8d3a9f80 0000002a 
00000000 0002a6f0 800b2fc4
[  300.958211] 9f60: 8d087a80 7eb99a48 8d087a80 7eb99a48 00008f7e 
00000000 0000002a 800b3118
[  300.966405] 9f80: 00008f7e 00000000 0000002a 00000000 0000002a 
00007fff 7eba1a70 00000004
[  300.974600] 9fa0: 8002b104 8002af80 0000002a 00007fff 00000004 
7eb99a48 0000002a 000003be
[  300.982794] 9fc0: 0000002a 00007fff 7eba1a70 00000004 7eb99a48 
0000002a 00000000 0002a6f0
[  300.990989] 9fe0: 0000002a 7eb99a28 0000ae1c 2ab9924c 40000010 
00000004 00000000 00000000
[  300.999209] [<801fb698>] (__up_write+0x40/0x188) from [<80283e08>] 
(leb_write_unlock+0xa0/0xf4)
[  301.007931] [<80283e08>] (leb_write_unlock+0xa0/0xf4) from 
[<802850e0>] (ubi_eba_write_leb+0x568/0x80c)
[  301.017345] [<802850e0>] (ubi_eba_write_leb+0x568/0x80c) from 
[<80282c34>] (ubi_leb_write+0x124/0x168)
[  301.026683] [<80282c34>] (ubi_leb_write+0x124/0x168) from 
[<801a4bd4>] (ubifs_leb_write+0x104/0x118)
[  301.035842] [<801a4bd4>] (ubifs_leb_write+0x104/0x118) from 
[<801a5308>] (ubifs_wbuf_write_nolock+0x520/0x9e8)
[  301.045867] [<801a5308>] (ubifs_wbuf_write_nolock+0x520/0x9e8) from 
[<80198984>] (ubifs_jnl_write_data+0x200/0x33c)
[  301.056326] [<80198984>] (ubifs_jnl_write_data+0x200/0x33c) from 
[<8019a954>] (do_writepage+0x9c/0x1e4)
[  301.065751] [<8019a954>] (do_writepage+0x9c/0x1e4) from [<8008bd80>] 
(__writepage+0x14/0x5c)
[  301.074215] [<8008bd80>] (__writepage+0x14/0x5c) from [<8008c718>] 
(write_cache_pages+0x24c/0x32c)
[  301.083197] [<8008c718>] (write_cache_pages+0x24c/0x32c) from 
[<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c)
[  301.093482] [<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c) from 
[<80085de8>] (filemap_write_and_wait_range+0x34/0x68)
[  301.104562] [<80085de8>] (filemap_write_and_wait_range+0x34/0x68) 
from [<800d4294>] (vfs_fsync_range+0x34/0x7c)
[  301.114677] [<800d4294>] (vfs_fsync_range+0x34/0x7c) from 
[<800d4348>] (generic_write_sync+0x6c/0x74)
[  301.123918] [<800d4348>] (generic_write_sync+0x6c/0x74) from 
[<800865c0>] (generic_file_aio_write+0xb4/0xc8)
[  301.133768] [<800865c0>] (generic_file_aio_write+0xb4/0xc8) from 
[<80199254>] (ubifs_aio_write+0x168/0x17c)
[  301.143533] [<80199254>] (ubifs_aio_write+0x168/0x17c) from 
[<800b25c0>] (do_sync_write+0xa0/0xe8)
[  301.152513] [<800b25c0>] (do_sync_write+0xa0/0xe8) from [<800b2fc4>] 
(vfs_write+0xac/0x154)
[  301.160884] [<800b2fc4>] (vfs_write+0xac/0x154) from [<800b3118>] 
(sys_write+0x3c/0x68)
[  301.168917] [<800b3118>] (sys_write+0x3c/0x68) from [<8002af80>] 
(ret_fast_syscall+0x0/0x30)
[  301.177375] Code: e4871004 e5902004 e1520007 0a00003c (e592600c)
[  301.183561] mxc_ipu mxc_ipu: Channel already disabled 9
[  301.188798] mxc_ipu mxc_ipu: Channel already uninitialized 9
[  301.194579] BUG: scheduling while atomic: integck/1243/0x00000004
[  301.200679] Modules linked in:
[  301.203783] [<8002f828>] (unwind_backtrace+0x0/0x16c) from 
[<803d74e4>] (schedule+0x6c/0x324)
[  301.212333] [<803d74e4>] (schedule+0x6c/0x324) from [<803d7f70>] 
(schedule_timeout+0x1c8/0x1fc)
[  301.221059] [<803d7f70>] (schedule_timeout+0x1c8/0x1fc) from 
[<8005d758>] (msleep+0x14/0x24)
[  301.229538] [<8005d758>] (msleep+0x14/0x24) from [<802f86cc>] 
(ipu_init_sync_panel+0x314/0x1150)
[  301.238362] [<802f86cc>] (ipu_init_sync_panel+0x314/0x1150) from 
[<8021c4cc>] (mxcfb_set_par+0x4e0/0x5e8)
[  301.247955] [<8021c4cc>] (mxcfb_set_par+0x4e0/0x5e8) from 
[<8021c690>] (mxcfb_blank+0xbc/0xf8)
[  301.256587] [<8021c690>] (mxcfb_blank+0xbc/0xf8) from [<8020c264>] 
(fb_blank+0x3c/0x68)
[  301.264612] [<8020c264>] (fb_blank+0x3c/0x68) from [<80214898>] 
(fbcon_blank+0xe8/0x1f4)
[  301.272729] [<80214898>] (fbcon_blank+0xe8/0x1f4) from [<8023be44>] 
(do_unblank_screen+0xc4/0x13c)
[  301.281712] [<8023be44>] (do_unblank_screen+0xc4/0x13c) from 
[<801fef08>] (bust_spinlocks+0x20/0x44)
[  301.290869] [<801fef08>] (bust_spinlocks+0x20/0x44) from [<8002e358>] 
(die+0x240/0x304)
[  301.298894] [<8002e358>] (die+0x240/0x304) from [<800306ac>] 
(__do_kernel_fault+0x64/0x84)
[  301.307178] [<800306ac>] (__do_kernel_fault+0x64/0x84) from 
[<8003088c>] (do_page_fault+0x1c0/0x1d4)
[  301.316332] [<8003088c>] (do_page_fault+0x1c0/0x1d4) from 
[<8002a2c8>] (do_DataAbort+0x34/0x94)
[  301.325054] [<8002a2c8>] (do_DataAbort+0x34/0x94) from [<8002aa2c>] 
(__dabt_svc+0x4c/0x60)
[  301.333329] Exception stack(0x8d3a9a88 to 0x8d3a9ad0)
[  301.338395] 9a80:                   8d3fb298 00000000 00000000 
8d3a8000 8d3fb280 8d3fb298
[  301.346592] 9aa0: 00000000 8d3fb29c 60000013 00000080 00013d08 
00000012 8d3a9af8 8d3a9ad0
[  301.354782] 9ac0: 80283e08 801fb698 00000093 ffffffff
[  301.359855] [<8002aa2c>] (__dabt_svc+0x4c/0x60) from [<801fb698>] 
(__up_write+0x40/0x188)
[  301.368055] [<801fb698>] (__up_write+0x40/0x188) from [<80283e08>] 
(leb_write_unlock+0xa0/0xf4)
[  301.376775] [<80283e08>] (leb_write_unlock+0xa0/0xf4) from 
[<802850e0>] (ubi_eba_write_leb+0x568/0x80c)
[  301.386189] [<802850e0>] (ubi_eba_write_leb+0x568/0x80c) from 
[<80282c34>] (ubi_leb_write+0x124/0x168)
[  301.395519] [<80282c34>] (ubi_leb_write+0x124/0x168) from 
[<801a4bd4>] (ubifs_leb_write+0x104/0x118)
[  301.404674] [<801a4bd4>] (ubifs_leb_write+0x104/0x118) from 
[<801a5308>] (ubifs_wbuf_write_nolock+0x520/0x9e8)
[  301.414697] [<801a5308>] (ubifs_wbuf_write_nolock+0x520/0x9e8) from 
[<80198984>] (ubifs_jnl_write_data+0x200/0x33c)
[  301.425155] [<80198984>] (ubifs_jnl_write_data+0x200/0x33c) from 
[<8019a954>] (do_writepage+0x9c/0x1e4)
[  301.434571] [<8019a954>] (do_writepage+0x9c/0x1e4) from [<8008bd80>] 
(__writepage+0x14/0x5c)
[  301.443031] [<8008bd80>] (__writepage+0x14/0x5c) from [<8008c718>] 
(write_cache_pages+0x24c/0x32c)
[  301.452012] [<8008c718>] (write_cache_pages+0x24c/0x32c) from 
[<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c)
[  301.462296] [<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c) from 
[<80085de8>] (filemap_write_and_wait_range+0x34/0x68)
[  301.473367] [<80085de8>] (filemap_write_and_wait_range+0x34/0x68) 
from [<800d4294>] (vfs_fsync_range+0x34/0x7c)
[  301.483479] [<800d4294>] (vfs_fsync_range+0x34/0x7c) from 
[<800d4348>] (generic_write_sync+0x6c/0x74)
[  301.492722] [<800d4348>] (generic_write_sync+0x6c/0x74) from 
[<800865c0>] (generic_file_aio_write+0xb4/0xc8)
[  301.502570] [<800865c0>] (generic_file_aio_write+0xb4/0xc8) from 
[<80199254>] (ubifs_aio_write+0x168/0x17c)
[  301.512332] [<80199254>] (ubifs_aio_write+0x168/0x17c) from 
[<800b25c0>] (do_sync_write+0xa0/0xe8)
[  301.521311] [<800b25c0>] (do_sync_write+0xa0/0xe8) from [<800b2fc4>] 
(vfs_write+0xac/0x154)
[  301.529681] [<800b2fc4>] (vfs_write+0xac/0x154) from [<800b3118>] 
(sys_write+0x3c/0x68)
[  301.537706] [<800b3118>] (sys_write+0x3c/0x68) from [<8002af80>] 
(ret_fast_syscall+0x0/0x30)
[  301.548089] BUG: scheduling while atomic: integck/1243/0x00000004
[  301.554197] Modules linked in:
[  301.557323] [<8002f828>] (unwind_backtrace+0x0/0x16c) from 
[<803d74e4>] (schedule+0x6c/0x324)
[  301.565872] [<803d74e4>] (schedule+0x6c/0x324) from [<803d7f70>] 
(schedule_timeout+0x1c8/0x1fc)
[  301.574612] [<803d7f70>] (schedule_timeout+0x1c8/0x1fc) from 
[<8005d758>] (msleep+0x14/0x24)
[  301.583093] [<8005d758>] (msleep+0x14/0x24) from [<802f86cc>] 
(ipu_init_sync_panel+0x314/0x1150)
[  301.591921] [<802f86cc>] (ipu_init_sync_panel+0x314/0x1150) from 
[<8021c4cc>] (mxcfb_set_par+0x4e0/0x5e8)
[  301.601528] [<8021c4cc>] (mxcfb_set_par+0x4e0/0x5e8) from 
[<8021c690>] (mxcfb_blank+0xbc/0xf8)
[  301.610175] [<8021c690>] (mxcfb_blank+0xbc/0xf8) from [<8020c264>] 
(fb_blank+0x3c/0x68)
[  301.618213] [<8020c264>] (fb_blank+0x3c/0x68) from [<80214898>] 
(fbcon_blank+0xe8/0x1f4)
[  301.626327] [<80214898>] (fbcon_blank+0xe8/0x1f4) from [<8023be44>] 
(do_unblank_screen+0xc4/0x13c)
[  301.635324] [<8023be44>] (do_unblank_screen+0xc4/0x13c) from 
[<801fef08>] (bust_spinlocks+0x20/0x44)
[  301.644494] [<801fef08>] (bust_spinlocks+0x20/0x44) from [<8002e358>] 
(die+0x240/0x304)
[  301.652532] [<8002e358>] (die+0x240/0x304) from [<800306ac>] 
(__do_kernel_fault+0x64/0x84)
[  301.660829] [<800306ac>] (__do_kernel_fault+0x64/0x84) from 
[<8003088c>] (do_page_fault+0x1c0/0x1d4)
[  301.669995] [<8003088c>] (do_page_fault+0x1c0/0x1d4) from 
[<8002a2c8>] (do_DataAbort+0x34/0x94)
[  301.678727] [<8002a2c8>] (do_DataAbort+0x34/0x94) from [<8002aa2c>] 
(__dabt_svc+0x4c/0x60)
[  301.687015] Exception stack(0x8d3a9a88 to 0x8d3a9ad0)
[  301.692080] 9a80:                   8d3fb298 00000000 00000000 
8d3a8000 8d3fb280 8d3fb298
[  301.700289] 9aa0: 00000000 8d3fb29c 60000013 00000080 00013d08 
00000012 8d3a9af8 8d3a9ad0
[  301.708492] 9ac0: 80283e08 801fb698 00000093 ffffffff
[  301.713567] [<8002aa2c>] (__dabt_svc+0x4c/0x60) from [<801fb698>] 
(__up_write+0x40/0x188)
[  301.721782] [<801fb698>] (__up_write+0x40/0x188) from [<80283e08>] 
(leb_write_unlock+0xa0/0xf4)
[  301.730515] [<80283e08>] (leb_write_unlock+0xa0/0xf4) from 
[<802850e0>] (ubi_eba_write_leb+0x568/0x80c)
[  301.739951] [<802850e0>] (ubi_eba_write_leb+0x568/0x80c) from 
[<80282c34>] (ubi_leb_write+0x124/0x168)
[  301.749298] [<80282c34>] (ubi_leb_write+0x124/0x168) from 
[<801a4bd4>] (ubifs_leb_write+0x104/0x118)
[  301.758469] [<801a4bd4>] (ubifs_leb_write+0x104/0x118) from 
[<801a5308>] (ubifs_wbuf_write_nolock+0x520/0x9e8)
[  301.768507] [<801a5308>] (ubifs_wbuf_write_nolock+0x520/0x9e8) from 
[<80198984>] (ubifs_jnl_write_data+0x200/0x33c)
[  301.778978] [<80198984>] (ubifs_jnl_write_data+0x200/0x33c) from 
[<8019a954>] (do_writepage+0x9c/0x1e4)
[  301.788408] [<8019a954>] (do_writepage+0x9c/0x1e4) from [<8008bd80>] 
(__writepage+0x14/0x5c)
[  301.796882] [<8008bd80>] (__writepage+0x14/0x5c) from [<8008c718>] 
(write_cache_pages+0x24c/0x32c)
[  301.805865] [<8008c718>] (write_cache_pages+0x24c/0x32c) from 
[<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c)
[  301.816163] [<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c) from 
[<80085de8>] (filemap_write_and_wait_range+0x34/0x68)
[  301.827251] [<80085de8>] (filemap_write_and_wait_range+0x34/0x68) 
from [<800d4294>] (vfs_fsync_range+0x34/0x7c)
[  301.837378] [<800d4294>] (vfs_fsync_range+0x34/0x7c) from 
[<800d4348>] (generic_write_sync+0x6c/0x74)
[  301.846634] [<800d4348>] (generic_write_sync+0x6c/0x74) from 
[<800865c0>] (generic_file_aio_write+0xb4/0xc8)
[  301.856485] [<800865c0>] (generic_file_aio_write+0xb4/0xc8) from 
[<80199254>] (ubifs_aio_write+0x168/0x17c)
[  301.866277] [<80199254>] (ubifs_aio_write+0x168/0x17c) from 
[<800b25c0>] (do_sync_write+0xa0/0xe8)
[  301.875273] [<800b25c0>] (do_sync_write+0xa0/0xe8) from [<800b2fc4>] 
(vfs_write+0xac/0x154)
[  301.883669] [<800b2fc4>] (vfs_write+0xac/0x154) from [<800b3118>] 
(sys_write+0x3c/0x68)
[  301.891708] [<800b3118>] (sys_write+0x3c/0x68) from [<8002af80>] 
(ret_fast_syscall+0x0/0x30)
[  301.904585] ---[ end trace 650a5c397325e07d ]---
[  301.909255] note: integck[1243] exited with preempt_count 2
/ubitest-sync-136.sh: line 24:  1243 Segmentation fault 
/tests-1.4.9/fs-tests/integrity/integck -v -e /mnt/integ-nor-ubi-136/


> We discovered a bug recently which may cause memory corruptions. I do
> not know if it is accountable for this problem or not, but it is worth
> having it. See these patches in the l2-mtd.git tree:
>
> 605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
> 33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid bug
>
> --
> Best Regards,
> Artem Bityutskiy
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
