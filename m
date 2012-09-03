Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8UMI-0002uC-D6
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 10:58:24 +0000
Received: by lagu2 with SMTP id u2so3341273lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 03:58:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346659239.3061.17.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
 <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
 <1346659239.3061.17.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 3 Sep 2012 12:57:58 +0200
Message-ID: <CACQ1gAgxnrLR-NDkiw=QUZ9r6JO30AVwX6MOYX4vV9WXoBaBiA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/3 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2012-08-31 at 16:46 +0200, Richard Genoud wrote:
>> BUT, I ran into a bug, I don't know if it's my kernel (as I've got
>> quite a lot of patches ahead of 3.6 to get my board run), but it's
>> kind of nasty.
>
> What is your kernel? Why don't you just pull the corresponding ubifs
> backport tree?
I'm on 3.6-rc1 + specific work for my board (pinctrl, device tree and
some driver stuff) without which I can't boot

> Would you please be able to reproduce this with linux-ubi tree and also
> send be the full oops?
I rebased my work onto linux-ubi/master, I enabled only the needed
options to boot and test.
[   12.500000] UBI: attaching mtd3 to ubi0
[   12.539062] UBI: scanning is finished
[   12.539062] UBI: empty MTD device detected
[   12.562500] ------------[ cut here ]------------
[   12.562500] kernel BUG at mm/slob.c:331!
[   12.562500] Internal error: Oops - BUG: 0 [#1] ARM
[   12.562500] CPU: 0    Not tainted  (3.6.0-rc1+ #887)
[   12.562500] PC is at slob_alloc.clone.18+0x174/0x1b4
[   12.562500] LR is at slob_page_alloc+0x1a8/0x1d0
[   12.562500] pc : [<c0068130>]    lr : [<c0067c40>]    psr: 60000093
[   12.562500] sp : c7b47e08  ip : 00000000  fp : 01020014
[   12.562500] r10: 00000000  r9 : a0000013  r8 : 00007b69
[   12.562500] r7 : c0321000  r6 : 00000030  r5 : c0417d20  r4 : c02e1908
[   12.562500] r3 : 01020014  r2 : 01020013  r1 : fefdffec  r0 : 00000000
[   12.562500] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment user
[   12.562500] Control: 0005317f  Table: 27b48000  DAC: 00000015
[   12.562500] Process ubiattach (pid: 354, stack limit = 0xc7b46270)
[   12.562500] Stack: (0xc7b47e08 to 0xc7b48000)
[   12.562500] 7e00:                   00000030 000000d0 01020014
c7add1e0 c7b6a0f4 00000000
[   12.562500] 7e20: c7b6a0a0 c7add2a0 00000001 00000001 c7b6a0f0
c0068374 00000000 c7b67020
[   12.562500] 7e40: c7b6a0f4 c01798c0 00005800 c7ad7540 c7ad7540
00001000 00000001 00005800
[   12.562500] 7e60: 00000000 02000200 00000002 00000000 00005800
7fffefff 00000001 c7ad7540
[   12.562500] 7e80: c7add2a0 c7b67020 c7af79e0 c7ad7540 c7add2a0
01000000 00000000 00000000
[   12.562500] 7ea0: 00000000 c016c020 c7b67020 00000000 c7ad7540
00000000 00000000 02000000
[   12.562500] 7ec0: 00000014 c89e6000 000080d2 c7ad7540 c89e6000
c7add2a0 00000000 c89eb6ac
[   12.562500] 7ee0: c7b46000 00000000 00000003 c016cff4 c7ad7540
c7add2a0 00000000 c7a5e820
[   12.562500] 7f00: 00000014 c017a618 c7ad7540 00000000 00000000
c016fee0 c7aac2f0 c7aa8640
[   12.562500] 7f20: c7aa24b0 40186f40 40186f40 00000000 be82bb20
c7a5e820 40186f40 00000003
[   12.562500] 7f40: c0009388 c01703d8 ffffffff 00000003 00000000
00000000 00000000 00000000
[   12.562500] 7f60: be82bb20 00000003 40186f40 c0078684 c7acb6a0
00000003 40186f40 c7acb6a0
[   12.562500] 7f80: be82bb20 c00786f4 00000003 00000000 be82bb20
be82bb20 40186f40 00000003
[   12.562500] 7fa0: 00000036 c0009200 be82bb20 40186f40 00000003
40186f40 be82bb20 00000000
[   12.562500] 7fc0: be82bb20 40186f40 00000003 00000036 ffffffff
0001442c ffffffff 00000003
[   12.562500] 7fe0: b6ef5ec4 be82bae0 000098ec b6ef5f08 60000010
00000003 27ffe831 27ffec31
[   12.562500] [<c0068130>] (slob_alloc.clone.18+0x174/0x1b4) from
[<c0068374>] (kmem_cache_alloc_node+0x28/0x64)
[   12.562500] [<c0068374>] (kmem_cache_alloc_node+0x28/0x64) from
[<c01798c0>] (ubi_add_to_av+0x318/0x3fc)
[   12.562500] [<c01798c0>] (ubi_add_to_av+0x318/0x3fc) from
[<c016c020>] (create_vtbl+0x1cc/0x258)
[   12.562500] [<c016c020>] (create_vtbl+0x1cc/0x258) from
[<c016cff4>] (ubi_read_volume_table+0xe0/0x1f0)
[   12.562500] [<c016cff4>] (ubi_read_volume_table+0xe0/0x1f0) from
[<c017a618>] (ubi_attach+0x54/0xac)
[   12.562500] [<c017a618>] (ubi_attach+0x54/0xac) from [<c016fee0>]
(ubi_attach_mtd_dev+0x1bc/0x474)
[   12.562500] [<c016fee0>] (ubi_attach_mtd_dev+0x1bc/0x474) from
[<c01703d8>] (ctrl_cdev_ioctl+0xd8/0x168)
[   12.562500] [<c01703d8>] (ctrl_cdev_ioctl+0xd8/0x168) from
[<c0078684>] (do_vfs_ioctl+0x270/0x2ac)
[   12.562500] [<c0078684>] (do_vfs_ioctl+0x270/0x2ac) from
[<c00786f4>] (sys_ioctl+0x34/0x54)
[   12.562500] [<c00786f4>] (sys_ioctl+0x34/0x54) from [<c0009200>]
(ret_fast_syscall+0x0/0x2c)
[   12.562500] Code: e1a0200b ebfffe5b e250a000 1a000000 (e7f001f2)
[   12.562500] ---[ end trace 473f0aad0098fe9c ]---


>
>> After that, I can have a OOPS right away, but sometimes not.
>> but if I run someting (top for exemple) I get an oops then.
>> So, the memory is beeing corrupted somewhere, but I couldn't find out
>> exactly where.
>
> If you could somehow reproduce this with nandsim, it would make it easy
> for me to find the bug.
here it is:
[    0.921875] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[    0.929687] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[    0.937500] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[    0.953125] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[    0.960937] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[    0.968750] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[    0.976562] NAND device: Manufacturer ID: 0x98, Chip ID: 0x39
(Toshiba NAND 128MiB 1,8V 8-bit), page size: 512, OOB size: 16
[    0.992187] flash size: 128 MiB
[    0.992187] page size: 512 bytes
[    0.992187] OOB area size: 16 bytes
[    1.000000] sector size: 16 KiB
[    1.000000] pages number: 262144
[    1.007812] pages per sector: 32
[    1.007812] bus width: 8
[    1.007812] bits in sector size: 14
[    1.015625] bits in page size: 9
[    1.015625] bits in OOB size: 4
[    1.023437] flash size with OOB: 135168 KiB
[    1.023437] page address bytes: 4
[    1.031250] sector address bytes: 3
[    1.031250] options: 0x42
[    1.039062] Scanning device for bad blocks
[    1.242187] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
[    1.250000] 0x000000000000-0x000008000000 : "NAND simulator partition 0"

# flash_erase /dev/mtd0 0 8192
Erasing 16 Kibyte @ 7ffc000 -- 100 % complete
# ./ubiattach -m 0
[  152.718750] UBI: attaching mtd0 to ubi0
[  153.054687] UBI: scanning is finished
[  153.062500] UBI: empty MTD device detected
[  153.078125] Internal error: Oops - undefined instruction: 0 [#1] ARM
[  153.078125] CPU: 0    Not tainted  (3.6.0-rc1+ #888)
[  153.078125] PC is at 0xc7aab444
[  153.078125] LR is at ip_local_out+0x28/0x2c
[  153.078125] pc : [<c7aab444>]    lr : [<c01bcab4>]    psr: 60000013
[  153.078125] sp : c7aefa80  ip : 0900800a  fp : c02df6fc
[  153.078125] r10: 00000068  r9 : 00000108  r8 : 00000000
[  153.078125] r7 : c7aefb3c  r6 : c7ac17e0  r5 : c7bb3464  r4 : c7bc0280
[  153.078125] r3 : c7aab308  r2 : 00000525  r1 : 00000000  r0 : c7bc029f
[  153.078125] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[  153.078125] Control: 0005317f  Table: 27b08000  DAC: 00000017
[  153.078125] Process klogd (pid: 324, stack limit = 0xc7aee270)
[  153.078125] Stack: (0xc7aefa80 to 0xc7af0000)
[  153.078125] fa80: c7bc0280 c01be694 c7bc0280 c7bb3464 c7ac17e0
c01dbbe0 c7aefa8c c7ac17e0
[  153.078125] faa0: c7aefc9c c7aefb3c c7bc0280 0900800a 6400800a
c01dd420 00000068 00000008
[  153.078125] fac0: c7aefb5c c7aefb6c 00004040 c7ac17e0 c7ad2780
000000cc 00000060 00000060
[  153.078125] fae0: 00000000 00000000 c01bdd0c 00000000 c7ac198c
00000011 c7ac17e0 00000068
[  153.078125] fb00: c7ac17e0 c7ad28a0 00000000 00000068 c7ad28b8
c0191af8 c7ad28a0 c7ac17e0
[  153.078125] fb20: 00000011 c01db548 00000000 c7ad28a0 c7adb7e4
c01de1c8 0000d203 00000002
[  153.078125] fb40: 00000001 00000000 02110000 00000000 6400800a
0900800a d2030108 0900800a
[  153.078125] fb60: 00000000 00000000 c02cce00 00000000 c7aefbcc
c7aefbb0 00000060 c7aefc9c
[  153.078125] fb80: c7ac17e0 c7ae8960 00000010 00004040 c7aefec8
c01e3bec 00000060 bf000000
[  153.078125] fba0: c7ac22a0 00000060 c7aefc9c c018e1f8 00000000
00000000 00000000 00000001
[  153.078125] fbc0: ffffffff 00000000 00000000 00000000 00000000
00000000 c7ae8960 00000000
[  153.078125] fbe0: 00000000 00000000 00000000 00000000 c7aefc30
00000000 00000000 00000000
[  153.078125] fc00: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[  153.078125] fc20: 00000000 00000000 00000000 00000000 00000000
00011200 01ffffff 00000060
[  153.078125] fc40: c7ac22a0 c02e3208 00000000 c7aefc9c c02e2c50
c004c190 00000000 00000041
[  153.078125] fc60: c02e2c50 00000000 00000001 00000000 bf000000
c7ac25cc c7aefc9c c7bb5004
[  153.078125] fc80: c7ac2ac4 c018e4b0 c7ac22a0 c01fc444 00000060
c01fe03c c7ae8ab8 c7ac25cc
[  153.078125] fca0: 00000010 c7aefcb8 00000001 00000000 00000000
00004040 c7bb5004 00000060
[  153.078125] fcc0: 00000001 c7ac2ac4 00000000 c7ac22a0 00000060
00000001 c7aabec8 c01fc4d8
[  153.078125] fce0: 00000000 00000000 c7aee000 00011200 c7acb6b8
c7ac2ac0 c7ac25c0 c7bc0200
[  153.078125] fd00: c7ac2b34 c7ac2b50 00000001 c7aabec8 c7aefec8
c01fc820 00000000 3b9aca00
[  153.078125] fd20: c7ac25c0 c7ac2ac0 c7bc0200 c01faa90 a40f89aa
00000023 c7bc0200 c7ac2ac0
[  153.078125] fd40: 00000000 00000000 c7ad0000 c01f8168 c7acb6b8
c01f803c 00000012 c7bc0200
[  153.078125] fd60: c7bc0238 c01fe95c c7bc0200 c7aefd94 c7aefdd8
c7aab880 c7ad0000 c01f9264
[  153.078125] fd80: c0229578 c7aefd94 00000000 c01f92c0 ffffffe0
00000000 c7aab880 c7aefdd8
[  153.078125] fda0: c0229578 00000000 00000000 00000000 00000060
c7aee000 c7aefdd8 c7aab880
[  153.078125] fdc0: c7acb6b8 c00c46dc c7aefdd8 c7bc0160 c7ac2020
c00c4d24 c02d48a4 c7acb6b8
[  153.078125] fde0: c7bc0160 00000000 00000020 c7acb7b0 c7bc0160
c7ac2020 c7acb6b0 c00baed4
[  153.078125] fe00: 00008000 c7acb7b0 c7ac0e38 00000000 00000101
c00b66a4 c7aeff00 c7aefec0
[  153.078125] fe20: c7aefe84 00000001 c7aab190 00000001 c7ad0000
c0073528 c7aeff00 c7aeff08
[  153.078125] fe40: c7aeff00 c7aefec0 00000000 00000000 00000000
c7aee000 c7aabec8 c0075048
[  153.078125] fe60: 0002bbb4 00000002 c7bc00c0 00000000 c7aeff78
00000024 ffffff9c 00000000
[  153.078125] fe80: 00000000 c7ac0e38 c7bb4000 c7aeff00 c7bc00c0
00000000 c7aee000 00000000
[  153.078125] fea0: c7aee000 c7aeff78 c7aefec8 c0075588 c7aefec8
00000000 b6ef8990 c02e3208
[  153.078125] fec0: 00000000 00000000 00000000 00000000 00000000
c7aeff78 00000001 ffffff9c
[  153.078125] fee0: c7aeff00 c7bb4000 c7aee000 00000000 0000000a
c00758ec 00000041 c02d2688
[  153.078125] ff00: c7aab190 c7aabec8 0002bbb4 00000002 c7bb4005
c7802800 c7aab190 c7aa9500
[  153.078125] ff20: c7ac0e38 00000101 00000000 00000000 00000000
00000000 00000000 c7af1b68
[  153.078125] ff40: c7af1b60 00000000 00000000 c007fb50 00000000
00000000 00000004 ffffff9c
[  153.078125] ff60: c7bb4000 00000001 c0009388 c00695ac c7aeff90
0000004e 00000000 becd0000
[  153.078125] ff80: 00000024 00000100 00000000 00000000 b6f04eb0
becd67d0 00000005 c0009388
[  153.078125] ffa0: 00000000 c0009200 00000000 b6f04eb0 b6ef8990
00000000 00000054 b6f04eb0
[  153.078125] ffc0: 00000000 b6f04eb0 becd67d0 00000005 b6f05040
00000fff 000a6e38 0000000a
[  153.078125] ffe0: becd6c54 becd6710 b6ebeed4 b6eee76c 60000010
b6ef8990 27ffe831 27ffec31
[  153.078125] [<c01bcab4>] (ip_local_out+0x28/0x2c) from [<c01be694>]
(ip_send_skb+0x8/0x58)
[  153.078125] [<c01be694>] (ip_send_skb+0x8/0x58) from [<c01dbbe0>]
(udp_send_skb+0x180/0x250)
[  153.078125] [<c01dbbe0>] (udp_send_skb+0x180/0x250) from
[<c01dd420>] (udp_sendmsg+0x474/0x67c)
[  153.078125] [<c01dd420>] (udp_sendmsg+0x474/0x67c) from
[<c01e3bec>] (inet_sendmsg+0x60/0x70)
[  153.078125] [<c01e3bec>] (inet_sendmsg+0x60/0x70) from [<c018e1f8>]
(sock_sendmsg+0x80/0xa0)
[  153.078125] [<c018e1f8>] (sock_sendmsg+0x80/0xa0) from [<c018e4b0>]
(kernel_sendmsg+0x3c/0x70)
[  153.078125] [<c018e4b0>] (kernel_sendmsg+0x3c/0x70) from
[<c01fc444>] (xs_send_kvec+0x98/0xa8)
[  153.078125] [<c01fc444>] (xs_send_kvec+0x98/0xa8) from [<c01fc4d8>]
(xs_sendpages+0x84/0x1e8)
[  153.078125] [<c01fc4d8>] (xs_sendpages+0x84/0x1e8) from
[<c01fc820>] (xs_udp_send_request+0x38/0xb4)
[  153.078125] [<c01fc820>] (xs_udp_send_request+0x38/0xb4) from
[<c01faa90>] (xprt_transmit+0xd0/0x1e8)
[  153.078125] [<c01faa90>] (xprt_transmit+0xd0/0x1e8) from
[<c01f8168>] (call_transmit+0x12c/0x194)
[  153.078125] [<c01f8168>] (call_transmit+0x12c/0x194) from
[<c01fe95c>] (__rpc_execute+0x4c/0xfc)
[  153.078125] [<c01fe95c>] (__rpc_execute+0x4c/0xfc) from
[<c01f9264>] (rpc_run_task+0xa4/0xb0)
[  153.078125] [<c01f9264>] (rpc_run_task+0xa4/0xb0) from [<c01f92c0>]
(rpc_call_sync+0x50/0x74)
[  153.078125] [<c01f92c0>] (rpc_call_sync+0x50/0x74) from
[<c00c46dc>] (nfs_rpc_wrapper.clone.6+0x28/0x64)
[  153.078125] [<c00c46dc>] (nfs_rpc_wrapper.clone.6+0x28/0x64) from
[<c00c4d24>] (nfs_proc_getattr+0x48/0x54)
[  153.078125] [<c00c4d24>] (nfs_proc_getattr+0x48/0x54) from
[<c00baed4>] (__nfs_revalidate_inode+0x8c/0x114)
[  153.078125] [<c00baed4>] (__nfs_revalidate_inode+0x8c/0x114) from
[<c00b66a4>] (nfs_lookup_revalidate+0x144/0x2ec)
[  153.078125] [<c00b66a4>] (nfs_lookup_revalidate+0x144/0x2ec) from
[<c0073528>] (lookup_fast+0x1b4/0x260)
[  153.078125] [<c0073528>] (lookup_fast+0x1b4/0x260) from
[<c0075048>] (do_last.clone.41+0x130/0x5cc)
[  153.078125] [<c0075048>] (do_last.clone.41+0x130/0x5cc) from
[<c0075588>] (path_openat+0xa4/0x3d8)
[  153.078125] [<c0075588>] (path_openat+0xa4/0x3d8) from [<c00758ec>]
(do_filp_open+0x30/0x7c)
[  153.078125] [<c00758ec>] (do_filp_open+0x30/0x7c) from [<c00695ac>]
(do_sys_open+0xd8/0x170)
[  153.078125] [<c00695ac>] (do_sys_open+0xd8/0x170) from [<c0009200>]
(ret_fast_syscall+0x0/0x2c)
[  153.078125] Code: 00000000 00000000 00000000 31313a30 (fdd20000)
[  153.078125] ---[ end trace ee2f60ac8ae81fb8 ]---

and another:
# flash_erase /dev/mtd0 0 8192
Erasing 16 Kibyte @ 7ffc000 -- 100 % complete
# ./ubiattach -m 0
[   97.273437] UBI: attaching mtd0 to ubi0
[   97.609375] UBI: scanning is finished
[   97.617187] UBI: empty MTD device detected
[   97.625000] ------------[ cut here ]------------
[   97.625000] kernel BUG at mm/slob.c:331!
[   97.625000] Internal error: Oops - BUG: 0 [#1] ARM
[   97.625000] CPU: 0    Not tainted  (3.6.0-rc1+ #888)
[   97.625000] PC is at slob_alloc.clone.18+0x174/0x1b4
[   97.625000] LR is at slob_page_alloc+0x1a8/0x1d0
[   97.625000] pc : [<c0068130>]    lr : [<c0067c40>]    psr: 60000093
[   97.625000] sp : c7af3e08  ip : 00000000  fp : 01620014
[   97.625000] r10: 00000000  r9 : a0000013  r8 : 00007bb3
[   97.625000] r7 : c0313000  r6 : 00000030  r5 : c040a660  r4 : c02d3908
[   97.625000] r3 : 01620014  r2 : 01620013  r1 : fe9dffec  r0 : 00000000
[   97.625000] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment user
[   97.625000] Control: 0005317f  Table: 27b4c000  DAC: 00000015
[   97.625000] Process ubiattach (pid: 351, stack limit = 0xc7af2270)
[   97.625000] Stack: (0xc7af3e08 to 0xc7af4000)
[   97.625000] 3e00:                   00000030 000000d0 01620014
c7b1c2a0 c7ba5314 00000000
[   97.625000] 3e20: c7ba52c0 c7b1c3e0 00000001 00000001 c7ba5310
c0068374 00000000 c7bae240
[   97.625000] 3e40: c7ba5314 c0174c40 00003e00 c7ad9a60 00000200
00000001 00003e00 00000000
[   97.625000] 3e60: 00000000 02000200 00000002 00000000 00003e00
7fffefff 00000001 c7ad9a60
[   97.625000] 3e80: c7b1c3e0 c7bae240 c7b1c450 c7ad9a60 c7b1c3e0
01000000 00000000 00000000
[   97.625000] 3ea0: 00000000 c01673a0 c7bae240 00000000 c7ad9a60
00000000 00000000 02000000
[   97.625000] 3ec0: 00000014 c89ca000 000080d2 c7ad9a60 c89ca000
c7b1c3e0 00000000 c89cde7c
[   97.625000] 3ee0: c7af2000 00000000 00000000 c0168374 c7ad9a60
c7b1c3e0 00000000 c79315c0
[   97.625000] 3f00: 00000014 c0175998 c7ad9a60 00000000 00000000
c016b260 c7aac3f0 c7aacc50
[   97.625000] 3f20: c7aa7020 40186f40 40186f40 00000000 bedd1b20
c79315c0 40186f40 00000003
[   97.625000] 3f40: c0009388 c016b758 ffffffff 00000000 00000000
00000000 00000000 00000000
[   97.625000] 3f60: bedd1b20 00000003 40186f40 c0078684 c7b36600
00000003 40186f40 c7b36600
[   97.625000] 3f80: bedd1b20 c00786f4 00000003 00000000 bedd1b20
bedd1b20 40186f40 00000003
[   97.625000] 3fa0: 00000036 c0009200 bedd1b20 40186f40 00000003
40186f40 bedd1b20 00000000
[   97.625000] 3fc0: bedd1b20 40186f40 00000003 00000036 ffffffff
0001442c ffffffff 00000000
[   97.625000] 3fe0: b6f7bec4 bedd1ae0 000098ec b6f7bf08 60000010
00000003 27ffe831 27ffec31
[   97.625000] [<c0068130>] (slob_alloc.clone.18+0x174/0x1b4) from
[<c0068374>] (kmem_cache_alloc_node+0x28/0x64)
[   97.625000] [<c0068374>] (kmem_cache_alloc_node+0x28/0x64) from
[<c0174c40>] (ubi_add_to_av+0x318/0x3fc)
[   97.625000] [<c0174c40>] (ubi_add_to_av+0x318/0x3fc) from
[<c01673a0>] (create_vtbl+0x1cc/0x258)
[   97.625000] [<c01673a0>] (create_vtbl+0x1cc/0x258) from
[<c0168374>] (ubi_read_volume_table+0xe0/0x1f0)
[   97.625000] [<c0168374>] (ubi_read_volume_table+0xe0/0x1f0) from
[<c0175998>] (ubi_attach+0x54/0xac)
[   97.625000] [<c0175998>] (ubi_attach+0x54/0xac) from [<c016b260>]
(ubi_attach_mtd_dev+0x1bc/0x474)
[   97.625000] [<c016b260>] (ubi_attach_mtd_dev+0x1bc/0x474) from
[<c016b758>] (ctrl_cdev_ioctl+0xd8/0x168)
[   97.625000] [<c016b758>] (ctrl_cdev_ioctl+0xd8/0x168) from
[<c0078684>] (do_vfs_ioctl+0x270/0x2ac)
[   97.625000] [<c0078684>] (do_vfs_ioctl+0x270/0x2ac) from
[<c00786f4>] (sys_ioctl+0x34/0x54)
[   97.625000] [<c00786f4>] (sys_ioctl+0x34/0x54) from [<c0009200>]
(ret_fast_syscall+0x0/0x2c)
[   97.625000] Code: e1a0200b ebfffe5b e250a000 1a000000 (e7f001f2)
[   97.625000] ---[ end trace 8743f692af56986c ]---
Segmentation fault

yet another one:
# ./ubiattach -m 0
[  159.718750] UBI: attaching mtd0 to ubi0
[  160.031250] UBI: scanning is finished
[  160.031250] UBI: empty MTD device detected
[  160.656250] UBI: attached mtd0 (name "NAND simulator partition 0",
size 128 MiB) to ubi0
[  160.664062] UBI: PEB size: 16384 bytes (16 KiB), LEB size: 15872 bytes
[  160.671875] UBI: min./max. I/O unit sizes: 512/512, sub-page size 256
[  160.679687] UBI: VID header offset: 256 (aligned 256), data offset: 512
[  160.687500] UBI: good PEBs: 8192, bad PEBs: 0, corrupted PEBs: 0
[  160.695312] UBI: user volume: 0, internal volumes: 1, max. volumes count: 92
[  160.703125] UBI: max/mean erase counter: 0/0, WL threshold: 4096,
image sequence number: 1661313839
[  160.710937] UBI: available PEBs: 8028, total reserved PEBs: 164,
PEBs reserved for bad PEB handling: 160
[  160.718750] UBI: background thread "ubi_bgt0d" started, PID 327
UBI device numb[  160.742187] Unable to handle kernel paging request
at virtual address 5af0c7b4
e[  160.750000] pgd = c0004000
r[  160.750000] [5af0c7b4] *pgd=00000000
0[  160.757812] Internal error: Oops: 5 [#1] ARM
[  160.757812] CPU: 0    Not tainted  (3.6.0-rc1+ #890)
[  160.757812] PC is at unlink_anon_vmas+0x2c/0x18c
[  160.757812] LR is at free_pgtables+0x28/0xa0
[  160.757812] pc : [<c0063a38>]    lr : [<c005b118>]    psr: 80000013
[  160.757812] sp : c7ab9eb0  ip : 00000880  fp : c0291e0f
[  160.757812] r10: b6eee000  r9 : 00100100  r8 : 5af0c7b4
[  160.757812] r7 : 6b30c7a5  r6 : c7abd8e0  r5 : 00000000  r4 : c7abfb7a
[  160.757812] r3 : c7abfb82  r2 : 00200000  r1 : 00008000  r0 : c7abd8a8
[  160.757812] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[  160.757812] Control: 0005317f  Table: 27ae4000  DAC: 00000015
[  160.757812] Process ubiattach (pid: 325, stack limit = 0xc7ab8270)
[  160.757812] Stack: (0xc7ab9eb0 to 0xc7aba000)
[  160.757812] 9ea0:                                     c7abd8a8
c7abd8a8 00200000 c7abd788
[  160.757812] 9ec0: 00000000 00001000 c7ab9f08 c7abd8a8 c7abd8a8
b6eee000 00000000 c005b118
[  160.757812] 9ee0: b6eee000 c7ad5600 c7ac82a0 c7ad5600 00000000
c7ac82d4 c0009388 c7ab8000
[  160.757812] 9f00: 00000000 c006024c c7ac82a0 00000001 00000000
c0008ea0 c78f27e0 00000000
[  160.757812] 9f20: 00000400 c7b36000 c78f27e0 c7ac82a0 00000001
c7ab8000 c78f27e0 c7ac82a0
[  160.757812] 9f40: c7ac82a0 00000000 c7ac82a0 00000000 00000000
c0014bd4 c7ac82a0 c7ac8000
[  160.757812] 9f60: 00000000 c0019914 c7ac8000 0000003d c7a46780
c7ac8000 00000000 00000001
[  160.757812] 9f80: 000000f8 c001af2c 00000000 00000000 b6f5c2ec
c001b0d0 b6f1e98c c001b10c
[  160.757812] 9fa0: 00000000 c0009200 b6f1e98c 00000000 00000000
00060d4c 00060d24 00000000
[  160.757812] 9fc0: b6f1e98c 00000000 b6f5c2ec 000000f8 00000000
00000000 b6f6ff70 00000000
[  160.757812] 9fe0: b6f5bebc be80bbf0 b6f42820 b6efb23c 60000010
00000000 00000000 00000000
[  160.757812] [<c0063a38>] (unlink_anon_vmas+0x2c/0x18c) from
[<c005b118>] (free_pgtables+0x28/0xa0)
[  160.757812] [<c005b118>] (free_pgtables+0x28/0xa0) from
[<c006024c>] (exit_mmap+0xcc/0x19c)
[  160.757812] [<c006024c>] (exit_mmap+0xcc/0x19c) from [<c0014bd4>]
(mmput+0x38/0xa8)
[  160.757812] [<c0014bd4>] (mmput+0x38/0xa8) from [<c0019914>]
(exit_mm+0xe8/0xec)
[  160.757812] [<c0019914>] (exit_mm+0xe8/0xec) from [<c001af2c>]
(do_exit+0x1d0/0x2c4)
[  160.757812] [<c001af2c>] (do_exit+0x1d0/0x2c4) from [<c001b0d0>]
(do_group_exit+0x84/0xb0)
[  160.757812] [<c001b0d0>] (do_group_exit+0x84/0xb0) from
[<c001b10c>] (sys_exit_group+0x10/0x18)
[  160.757812] [<c001b10c>] (sys_exit_group+0x10/0x18) from
[<c0009200>] (ret_fast_syscall+0x0/0x2c)
[  160.757812] Code: e59fb158 e59f9158 ea000028 e5948004 (e598a000)
,[  160.984375] ---[ end trace a5ec5c26278be2bc ]---
 [  160.992187] Fixing recursive fault but reboot is needed!
total 8192 LEBs (130023424 bytes, 124.0 MiB), available 8028 LEBs
(127420416 bytes, 121.5 MiB), LEB size 15872 bytes (15.5 KiB)

as you can see, the oops is not always at the same place, and does not
happened at the same moment
BUT something important I forgot to tell:
# flash_erase /dev/mtd0 0 8192
# ubiformat /dev/mtd0
# ubiattach -m 0
If I do a ubiformat after the flash_erase, I don't have an oops.

> We renamed all scan functions recently, so AFAICS you are not using the
> latest UBI code-base. How about picking the latest back-port tree?

Did the same thing, with the new UBI code, same result, once those are
not freed, I don't get oopses anymore.
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 64b9c56..6b9d6d8 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -340,8 +340,8 @@ retry:
         * of this LEB as it will be deleted and freed in 'ubi_add_to_av()'.
         */
        err = ubi_add_to_av(ubi, ai, new_aeb->pnum, new_aeb->ec, vid_hdr, 0);
-       kfree(new_aeb);
-       ubi_free_vid_hdr(ubi, vid_hdr);
+//     kfree(new_aeb);
+//     ubi_free_vid_hdr(ubi, vid_hdr);
        return err;

 write_error:

> This is strange, I think these 2 frees are all-right, I think the
> root-cause is somewhere else.
Yes, I didn't see neither the problem with those.
It's like the new_aeb and vid_hdr structs are still used after being
freed, but I couldn't find out where.

But once again, as I can't boot with a vanilla kernel or linux-ubi
kernel, I can't guarantee that this bug comes from UBI and not from
somewhere else.


here is the "minimal" .config I used:
CONFIG_ARM=y
CONFIG_SYS_SUPPORTS_APM_EMULATION=y
CONFIG_GENERIC_GPIO=y
CONFIG_HAVE_PROC_CPU=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_GENERIC_BUG=y
CONFIG_HAVE_IRQ_WORK=y
CONFIG_EXPERIMENTAL=y
CONFIG_BROKEN_ON_SMP=y
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_KERNEL_LZO=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_HAVE_GENERIC_HARDIRQS=y
CONFIG_GENERIC_HARDIRQS=y
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_SPARSE_IRQ=y
CONFIG_KTIME_SCALAR=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
CONFIG_TINY_RCU=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_HOTPLUG=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_COMPAT_BRK=y
CONFIG_SLOB=y
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_ATTRS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_RT_MUTEXES=y
CONFIG_BLOCK=y
CONFIG_MSDOS_PARTITION=y
CONFIG_IOSCHED_NOOP=y
CONFIG_DEFAULT_NOOP=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_MMU=y
CONFIG_ARCH_AT91=y
CONFIG_HAVE_AT91_DBGU0=y
CONFIG_AT91_SAM9_ALT_RESET=y
CONFIG_AT91_SAM9G45_RESET=y
CONFIG_SOC_AT91SAM9=y
CONFIG_SOC_AT91SAM9X5=y
CONFIG_ARCH_AT91SAM9X5=y
CONFIG_AT91_PMC_UNIT=y
CONFIG_MACH_AT91SAM_DT=y
CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
CONFIG_CPU_ARM926T=y
CONFIG_CPU_32v5=y
CONFIG_CPU_ABRT_EV5TJ=y
CONFIG_CPU_PABRT_LEGACY=y
CONFIG_CPU_CACHE_VIVT=y
CONFIG_CPU_COPY_V4WB=y
CONFIG_CPU_TLB_V4WBI=y
CONFIG_CPU_CP15=y
CONFIG_CPU_CP15_MMU=y
CONFIG_CPU_USE_DOMAINS=y
CONFIG_ARM_THUMB=y
CONFIG_MULTI_IRQ_HANDLER=y
CONFIG_VMSPLIT_3G=y
CONFIG_PREEMPT_NONE=y
CONFIG_AEABI=y
CONFIG_OABI_COMPAT=y
CONFIG_HAVE_ARCH_PFN_VALID=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_PAGEFLAGS_EXTENDED=y
CONFIG_VIRT_TO_BUS=y
CONFIG_NEED_PER_CPU_KM=y
CONFIG_ALIGNMENT_TRAP=y
CONFIG_UACCESS_WITH_MEMCPY=y
CONFIG_USE_OF=y
CONFIG_ARM_APPENDED_DTB=y
CONFIG_ARM_ATAG_DTB_COMPAT=y
CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER=y
CONFIG_AUTO_ZRELADDR=y
CONFIG_FPE_FASTFPE=y
CONFIG_BINFMT_ELF=y
CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
CONFIG_HAVE_AOUT=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_INET_LRO=y
CONFIG_BQL=y
CONFIG_HAVE_BPF_JIT=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_MTD=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_UBI=y
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_PROC_DEVICETREE=y
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_DEVICE=y
CONFIG_OF_NET=y
CONFIG_OF_MDIO=y
CONFIG_OF_MTD=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_RAM=y
CONFIG_SCSI_MOD=y
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
CONFIG_MII=y
CONFIG_ETHERNET=y
CONFIG_HAVE_NET_MACB=y
CONFIG_NET_CADENCE=y
CONFIG_MACB=y
CONFIG_PHYLIB=y
CONFIG_DAVICOM_PHY=y
CONFIG_INPUT=y
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_LIBPS2=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
CONFIG_UNIX98_PTYS=y
CONFIG_SERIAL_ATMEL=y
CONFIG_SERIAL_ATMEL_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCTRL_AT91=y
CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_ARCH_REQUIRE_GPIOLIB=y
CONFIG_GPIOLIB=y
CONFIG_OF_GPIO=y
CONFIG_SSB_POSSIBLE=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_HAVE_FB_ATMEL=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_HID=y
CONFIG_HIDRAW=y
CONFIG_HID_GENERIC=y
CONFIG_USB_ARCH_HAS_OHCI=y
CONFIG_USB_ARCH_HAS_EHCI=y
CONFIG_RTC_LIB=y
CONFIG_CLKDEV_LOOKUP=y
CONFIG_FILE_LOCKING=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_PROC_FS=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_ROOT_NFS=y
CONFIG_LOCKD=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_PRINTK_TIME=y
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_STRIP_ASM_SYMS=y
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_INFO=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_ARM_UNWIND=y
CONFIG_DEBUG_USER=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IO=y
CONFIG_CRC32=y
CONFIG_CRC32_SLICEBY8=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_DMA=y
CONFIG_DQL=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
