Received: from ironport2-out.teksavvy.com ([206.248.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVVSx-0004go-DK
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 17:58:00 +0000
Message-ID: <4137.128.100.203.197.1219170103.squirrel@128.100.203.197>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417CB7@wpr01.wprmedical.local>
References: <3744.128.100.203.197.1219155830.squirrel@128.100.203.197>
	<3771.128.100.203.197.1219156923.squirrel@128.100.203.197>
	<6B5648EA2E2C2D42AF2FF7691522AD92417CB7@wpr01.wprmedical.local>
Date: Tue, 19 Aug 2008 14:21:43 -0400 (EDT)
Subject: Re: SV: JFFS2 BUG ?
From: "Jesse Malone" <jmalone@jsoft.ca>
To: "Eirik Aanonsen" <eaa@wprmedical.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jmalone@jsoft.ca
Reply-To: jmalone@jsoft.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've re-compiled the kernel with CONFIG_SLUB_DEBUG_ON=y. It doesn't seem
to be giving me more info, though the Ooops is slightly different. This
oops doesn't happen consistently, and I have to reboot many times before
it will reappear. The 2.6.18 kernel that came installed on our atmel
ngw100 board has never displayed any of these oopses. I think on one of my
reboots this problem actually caused some filesystem corruption, there are
a couple of executables that no longer run and tons of jffs2 errors in the
syslog. When I boot with the original 2.6.18 kernel those executables
still fail but the syslog is not full of jffs2 errors. The Ooops and
syslog are below:


Unable to handle kernel paging request at virtual address 6b6b6b70
ptbr = 91dc1000 pgd = 00000000
Oops: Kernel access of bad area, sig: 11 [#1]
FRAME_POINTER chip: 0x01f:0x1e82 rev 2
Modules linked in:
PC is at jffs2_free_tmp_dnode_info_list+0x2a/0x54
LR is at init_object+0x4a/0x4c
pc : [<900a9c16>]    lr : [<9004dffe>]    Not tainted
sp : 91e45e04  r12: 91dfc6a8  r11: bbbbbbbb
r10: 91dfc04c  r9 : 6b6b6b68  r8 : 000000c2
r7 : 91e45e04  r6 : 91dfc688  r5 : 91e45e70  r4 : 00000000
r3 : 91d4ca40  r2 : 91dfc688  r1 : 91e153e4  r0 : 003f8484
Flags: qvnzc
Mode bits: hjmde....g
CPU Mode: Supervisor
Process: jffs2_gcd_mtd3 [342] (task: 91dd7000 thread: 91e44000)
Stack: (0x91e45e04 to 0x91e46000)
5e00:          900aac24 91e45e40 003f8220 0000003b 00000000 00000000 91e45e70
5e20: 91ddb000 91dab900 000002a0 fffffffb 0000026b 91e153d8 00000420 00000000
5e40: 900aac88 91e45e94 91e45e70 91e45eb8 00000000 91dab900 91ddb000 900afe0c
5e60: 91dab900 ffffffff 000080d0 00000000 91dfc5f0 00000000 00000051 00000000
5e80: 00000000 00000000 00000000 900afe0c 91dab900 900ab5e2 91e45efc 91ddb000
5ea0: 91e133fc 00000000 91dab900 91dab900 900afe0c 91dab900 901fe390 00000000
5ec0: ffffe000 91e44000 91dd714c 91dab900 90019412 91e45ee4 901fe360 91dd7028
5ee0: 00000000 9017a28e 91e45f10 901fe360 91dd7000 00000000 ffffe000 900aec90
5f00: 91e45f38 91e133fc 91dab92c 00000000 00000001 91dab900 900afe0c 91dab900
5f20: 90024058 91e45f34 91e44000 91dab900 00000000 9001e9ee 900afeee 91e45fdc
5f40: 91e44000 91dab900 00000000 ffffe000 91e44000 900afe0c 91dab900 007917d7
5f60: 007917d8 007917d9 007917da 007917db 007917dc 007917dd 007917de 007917df
5f80:  00000000 00000000 00000000 00000000 9001f900 900afe0c 91dab900
Call trace:
 [<900aac24>] jffs2_get_inode_nodes+0xd3c/0xd7c
 [<900aac88>] jffs2_do_read_inode_internal+0x24/0x7d8
 [<900ab5e2>] jffs2_do_crccheck_inode+0x3a/0x70
 [<900aec90>] jffs2_garbage_collect_pass+0x138/0x52c
 [<900afeee>] jffs2_garbage_collect_thread+0xe2/0x108
 [<9001f900>] do_exit+0x0/0x438

---------------------------------------------------
and the syslog:

jffs2_scan_dirent_node(): Name CRC failed on node at 0x0022b0f8: Read
0x4fb14de
f, calculated 0x00be2612
eth0: link up (100/Full)
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #115 to
5532
bytes failed because it only had 2754 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #121 to
2529
bytes failed because it only had 253 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #128 to
5504
bytes failed because it only had 398 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #134 to
5480
bytes failed because it only had 4224 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #140 to
10100
 bytes failed because it only had 4204 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #144 to
4978
bytes failed because it only had 3973 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #149 to
4507
bytes failed because it only had 1779 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #154 to
6161
bytes failed because it only had 3888 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #159 to
7717
bytes failed because it only had 2391 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #163 to
4617
bytes failed because it only had 2112 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #167 to
4870
bytes failed because it only had 4529 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #172 to
10586
 bytes failed because it only had 4608 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #175 to
14527
 bytes failed because it only had 4679 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #177 to
12541
 bytes failed because it only had 11425 bytes to start with!
iptables[378]: segfault at 00000018 pc 000066a0 sp 7fc7ddd0 ecr 24
dnsmasq[384]: segfault at 0000005c pc 000113e2 sp 7f821e34 ecr 24
eth0: no IPv6 routers present
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #253 to
1161
bytes failed because it only had 930 bytes to start with!
nmbd[420]: segfault at 3175b838 pc 2ab72a66 sp 7ff1bbec ecr 24
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #296 to
78970
4 bytes failed because it only had 786432 bytes to start with!
atmel_spi atmel_spi.0: fifo overrun (733/735 remaining)
JFFS2 error: (342) jffs2_get_inode_nodes: can not read 1056 bytes from
0x008085
00, error code: -5.
bytes failed because it only had 4608 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #175 to
14527
 bytes failed because it only had 4679 bytes to start with!
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #177 to
12541
 bytes failed because it only had 11425 bytes to start with!
iptables[378]: segfault at 00000018 pc 000066a0 sp 7fc7ddd0 ecr 24
dnsmasq[384]: segfault at 0000005c pc 000113e2 sp 7f821e34 ecr 24
eth0: no IPv6 routers present
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #253 to
1161
bytes failed because it only had 930 bytes to start with!
nmbd[420]: segfault at 3175b838 pc 2ab72a66 sp 7ff1bbec ecr 24
JFFS2 warning: (342) jffs2_do_read_inode_internal: Truncating ino #296 to
78970
4 bytes failed because it only had 786432 bytes to start with!
atmel_spi atmel_spi.0: fifo overrun (733/735 remaining)
JFFS2 error: (342) jffs2_get_inode_nodes: can not read 1056 bytes from
0x008085
00, error code: -5.
JFFS2 error: (342) jffs2_do_read_inode_internal: cannot read nodes for ino
297,
 returned error is -5
Returned error for crccheck of ino #297. Expect badness...
Checked all inodes but still 0x129c bytes of unchecked space?
No space for garbage collection. Aborting GC thread

AUTHOR wrote Eirik Aanonsen
>> >
>> > What do you make of this?
>> >
>
> If you are using SLUB have you set the following config:
>
> CONFIG_SLUB_DEBUG=y
> CONFIG_SLUB=y
> CONFIG_SLUB_DEBUG_ON=y ( or slub_debug in the command line )
>
> To see if you get some more information?
>
> ____________________________________________________
>
> Eirik Aanonsen
> SW Developer
> E-mail: eaa@wprmedical.com
> Phone: +47 90 68 11 92
> Fax: +47 37 03 56 77
> ____________________________________________________
>
>
>
>
