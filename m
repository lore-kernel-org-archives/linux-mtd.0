Received: from srv1.bluewind.it ([216.38.51.188])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwaU0-00047Y-Ir
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2013 16:09:43 +0000
Message-ID: <51DC357C.3090006@bluewind.it>
Date: Tue, 09 Jul 2013 18:08:28 +0200
From: enrico benetti <enrico.benetti@bluewind.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBI leb_write_unlock NULL pointer Oops
References: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
 <1372662331.22014.27.camel@sauron.fi.intel.com>
 <CAP+RiCDA=WnWfja+qa25Va60Wjee9Pcq69B02yMsvtw4BcwcKQ@mail.gmail.com>
 <51DBC864.6060505@bluewind.it>
In-Reply-To: <51DBC864.6060505@bluewind.it>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: motobud@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/09/2013 10:23 AM, enrico benetti wrote:
>
>> I have yet to reproduce the oops', but the two patches submitted by
>> Atrem look like them may correct the issue.  I'll apply the patches
>> and try to reproduce the issue again.
>>
> Hi Brent,
> I'm working on a back-ported 2.6.35.3 tree for a NOR based system (
> 00AM29EWH).
>
> I already merged
>
> 605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
> 33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a 
> horrid bug
>
> but rarely I fall into this oops on NULL pointer, so they don't seem 
> to fix
> the issue.
> I'm going to run again integck test with ubi debug messages active.
>
>
Hi All,
again running integck test for power cut recovery testing I fell into 
this OOPS, but now on __up_read from leb_read_unlock.

So this issue is always related to (maybe unneeded) leb unlock calls.
Tonight I'm going to run integck with UBI DBG eba messages.
I'll let you know.


integck: write 27 bytes, offset 25043, file 756372 (line 903)
[   38.471134] Unable to handle kernel NULL pointer dereference at 
virtual address 00000000
[   38.479252] pgd = 8d2b8000
[   38.481964] [00000000] *pgd=9d438031, *pte=00000000, *ppte=00000000
[   38.488283] Internal error: Oops: 17 [#1] PREEMPT
[   38.492993] last sysfs file: /sys/devices/virtual/ubi/ubi0/min_io_size
[   38.499529] Modules linked in:
[   38.502609] CPU: 0    Not tainted 
(2.6.35.3-998-ga1cd8a7-v3.8-gabc6f42-dirty #18)
[   38.510214] PC is at __up_read+0x50/0xec
[   38.514151] LR is at leb_read_unlock+0xa0/0xf4
[   38.518605] pc : [<801fb830>]    lr : [<80285884>] psr: 00000093
[   38.518613] sp : 8d4839d8  ip : 8d4839e8  fp : 0001ff80
[   38.530107] r10: 0000000b  r9 : 00000000  r8 : 8d487c00
[   38.535341] r7 : 8d482000  r6 : 8d31c800  r5 : 60000013  r4 : 8d107340
[   38.541879] r3 : 00000000  r2 : 00000000  r1 : ffffffff  r0 : 8d107358
[   38.548420] Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[   38.555653] Control: 10c5387d  Table: 9d2b8019  DAC: 00000015
[   38.561408] Process integck (pid: 1276, stack limit = 0x8d4822e8)
[   38.567512] Stack: (0x8d4839d8 to 0x8d484000)
[   38.571880] 
39c0:                                                       8d107340 
8d31c800
[   38.580075] 39e0: 8d31c800 80285884 00000000 0000000b 8d31c800 
80285cdc 0001ff80 8d483a34
[   38.588269] 3a00: 00000000 00000000 00000000 00000002 00000001 
00000000 00000006 910ce000
[   38.596463] 3a20: 8d242d50 8d487c00 0000000b 0001ff80 00000000 
00000000 910ce000 8d31c800
[   38.604658] 3a40: 00000080 802830dc 00000000 0001ff80 00000000 
00000003 00000000 801bc374
[   38.612853] 3a60: 8d33b000 0000002b 00000001 8d3968c0 0001ff80 
00000000 0000000b 8d33b000
[   38.621048] 3a80: 8d3a8800 8d33b000 8055f2e0 801a5e28 0001ff80 
00000000 80524294 00008050
[   38.629242] 3aa0: 00000000 8d3968c0 00000000 910ce000 0000000b 
801accc4 0001ff80 00000000
[   38.637437] 3ac0: 00000000 910ce000 00000000 910ce000 0001ff80 
8d482000 0000000b 801ad120
[   38.645633] 3ae0: 8d33b000 0000000b 00000000 8d33b000 000011c0 
8d483b88 8d482000 80574e60
[   38.653827] 3b00: 8d3a8800 0000000b 8055f2e0 801b2a88 00000000 
00000000 00000002 60000113
[   38.662022] 3b20: 8056f1ec 8d482000 00000002 8008b494 00000041 
00000000 00001030 8d33b000
[   38.670217] 3b40: 000011c0 8d3a8800 8d482000 80574e60 00000038 
80574e68 8055f2e0 801b3350
[   38.678411] 3b60: 00000001 00000000 4c4bc35d 00000000 00000000 
8055c63c 00000000 8d3a8824
[   38.686606] 3b80: 8d33b790 00000000 00000000 0001bb60 00000010 
0000000b 8d432470 8d33b868
[   38.694801] 3ba0: 00001000 ffffffe4 8d33b000 8d482000 80574e68 
80574e60 8055e170 8d3a8920
[   38.702997] 3bc0: 00000002 80195cac 8d344030 8d483c70 8053e650 
8d483c70 8d344030 801e2e1c
[   38.711191] 3be0: 00000000 8d3a8944 00000000 00000000 8d33b15c 
00001030 00000120 00000000
[   38.719387] 3c00: 00001000 801b9dfc 8d483c70 8d344000 8d33b000 
8d483cc0 00001000 00001030
[   38.727582] 3c20: 00001b84 00000001 8afd2000 80198910 8d483c74 
80533af0 00000000 80084014
[   38.735776] 3c40: 8d482000 00000001 00000000 8d483d1c 00000006 
00000000 40002869 806eca40
[   38.743971] 3c60: 8c0d9848 00000000 a0000113 8d33b008 00001000 
00000000 00000000 806eca40
[   38.752166] 3c80: 8d33b000 8c0d97a8 00001000 20000006 00001b84 
8afd2000 00000001 8019a954
[   38.760361] 3ca0: 00001000 80085108 00000000 803d7740 40000000 
806eca40 806eca40 8d483d80
[   38.768556] 3cc0: 00001b84 20000006 8c0d9848 00000006 806eca40 
8d483d14 00000000 8c0d9848
[   38.776750] 3ce0: 00000000 8008bd80 8d483d80 8008c718 00000001 
801bc374 00000007 00000001
[   38.784945] 3d00: 8008bd6c 8c0d9848 000061d2 00000000 000061ee 
00000001 00000000 806eca40
[   38.793139] 3d20: 00000000 8afd21d3 0000001b 00000000 0000001b 
0000001b 8d482000 8c0d9848
[   38.801334] 3d40: 00000000 000001d3 803eb85c 00000000 0000001b 
00000007 0000001b 8d483d80
[   38.809528] 3d60: 8c0d9848 000061d3 00000000 000061d3 00000000 
00000001 00000000 80085dac
[   38.817722] 3d80: 00000001 00000000 00000000 7fffffff 00000000 
00000000 000061d3 00000000
[   38.825916] 3da0: 000061ed 00000000 00000000 00000000 8c0d9848 
00000018 8c0d9848 000061ed
[   38.834111] 3dc0: 00000000 80085de8 000061ed 00000000 00000001 
8004ea28 00000001 8c0d9848
[   38.842305] 3de0: 8d281800 000061ed 00000000 0000001b 8d483f38 
800d4294 000061ed 00000000
[   38.850500] 3e00: 000061d3 000061ed 00000000 0000001b 00000000 
800d4348 000061ed 00000000
[   38.858694] 3e20: 00000001 8d281800 8c0d981c 0000001b 00000000 
8d281800 00000001 800865c0
[   38.866889] 3e40: 0000001b 00000000 000061d3 00000000 8d483ec0 
8d33b000 fffffdee 00000001
[   38.875083] 3e60: 8d483f38 80199254 000061d3 00000000 8d482000 
8d090784 8052db38 00000bb0
[   38.883279] 3e80: 8052db38 00002201 60000013 00000000 00000002 
a0000013 8d483ec0 8d483f80
[   38.891474] 3ea0: 8d281800 8d483f38 fffffdee 8d482000 000061d3 
800b25c0 000061d3 00000000
[   38.899668] 3ec0: a0000013 8d26dd80 00000000 00000001 ffffffff 
8d281800 00000000 00000000
[   38.907862] 3ee0: 00000000 00000000 8d1228a0 40000013 00000000 
00000000 000061ee 00000000
[   38.916057] 3f00: 2aac9000 0000003e 0000001b 60000113 0000001b 
00000000 00000000 00000102
[   38.924251] 3f20: 0000000a 80533af0 8d483f44 8004e01c 00000004 
8c004000 7ea8d858 0000001b
[   38.932446] 3f40: 0000001b 8d281800 7ea8d858 8d483f80 0000001b 
00000000 0002b7e8 800b2fc4
[   38.940641] 3f60: 8d281800 7ea8d858 8d281800 7ea8d858 000061d3 
00000000 0000001b 800b3118
[   38.948835] 3f80: 000061d3 00000000 0000001b 00000000 0000001b 
00007fff 7ea95880 00000004
[   38.957031] 3fa0: 8002b104 8002af80 0000001b 00007fff 0000000d 
7ea8d858 0000001b 00000175
[   38.965226] 3fc0: 0000001b 00007fff 7ea95880 00000004 7ea8d858 
0000001b 00000000 0002b7e8
[   38.973421] 3fe0: 0000001b 7ea8d838 0000ae1c 2ab9924c 40000010 
0000000d 00000000 00000000
[   38.981638] [<801fb830>] (__up_read+0x50/0xec) from [<80285884>] 
(leb_read_unlock+0xa0/0xf4)
[   38.990100] [<80285884>] (leb_read_unlock+0xa0/0xf4) from 
[<80285cdc>] (ubi_eba_read_leb+0x404/0x480)
[   38.999339] [<80285cdc>] (ubi_eba_read_leb+0x404/0x480) from 
[<802830dc>] (ubi_leb_read+0x124/0x1a8)
[   39.008503] [<802830dc>] (ubi_leb_read+0x124/0x1a8) from [<801a5e28>] 
(ubifs_leb_read+0x24/0x84)
[   39.017315] [<801a5e28>] (ubifs_leb_read+0x24/0x84) from [<801accc4>] 
(ubifs_start_scan+0xbc/0x140)
[   39.026386] [<801accc4>] (ubifs_start_scan+0xbc/0x140) from 
[<801ad120>] (ubifs_scan+0x1c/0x348)
[   39.035196] [<801ad120>] (ubifs_scan+0x1c/0x348) from [<801b2a88>] 
(ubifs_garbage_collect_leb+0x1d8/0x810)
[   39.044876] [<801b2a88>] (ubifs_garbage_collect_leb+0x1d8/0x810) from 
[<801b3350>] (ubifs_garbage_collect+0x290/0x724)
[   39.055597] [<801b3350>] (ubifs_garbage_collect+0x290/0x724) from 
[<80195cac>] (make_reservation+0x15c/0x618)
[   39.065533] [<80195cac>] (make_reservation+0x15c/0x618) from 
[<80198910>] (ubifs_jnl_write_data+0x18c/0x33c)
[   39.075383] [<80198910>] (ubifs_jnl_write_data+0x18c/0x33c) from 
[<8019a954>] (do_writepage+0x9c/0x1e4)
[   39.084808] [<8019a954>] (do_writepage+0x9c/0x1e4) from [<8008bd80>] 
(__writepage+0x14/0x5c)
[   39.093270] [<8008bd80>] (__writepage+0x14/0x5c) from [<8008c718>] 
(write_cache_pages+0x24c/0x32c)
[   39.102252] [<8008c718>] (write_cache_pages+0x24c/0x32c) from 
[<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c)
[   39.112538] [<80085dac>] (__filemap_fdatawrite_range+0x64/0x6c) from 
[<80085de8>] (filemap_write_and_wait_range+0x34/0x68)
[   39.123618] [<80085de8>] (filemap_write_and_wait_range+0x34/0x68) 
from [<800d4294>] (vfs_fsync_range+0x34/0x7c)
[   39.133732] [<800d4294>] (vfs_fsync_range+0x34/0x7c) from 
[<800d4348>] (generic_write_sync+0x6c/0x74)
[   39.142974] [<800d4348>] (generic_write_sync+0x6c/0x74) from 
[<800865c0>] (generic_file_aio_write+0xb4/0xc8)
[   39.152823] [<800865c0>] (generic_file_aio_write+0xb4/0xc8) from 
[<80199254>] (ubifs_aio_write+0x168/0x17c)
[   39.162589] [<80199254>] (ubifs_aio_write+0x168/0x17c) from 
[<800b25c0>] (do_sync_write+0xa0/0xe8)
[   39.171571] [<800b25c0>] (do_sync_write+0xa0/0xe8) from [<800b2fc4>] 
(vfs_write+0xac/0x154)
[   39.179942] [<800b2fc4>] (vfs_write+0xac/0x154) from [<800b3118>] 
(sys_write+0x3c/0x68)
[   39.187974] [<800b3118>] (sys_write+0x3c/0x68) from [<8002af80>] 
(ret_fast_syscall+0x0/0x30)
[   39.196433] Code: e1530001 0a000016 e3e01000 e5801000 (e8930003)
