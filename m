Received: from moutng.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S0rd7-0002Kh-07
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 09:39:57 +0000
From: "Nigel Hathaway" <nigel.hathaway@node-h.com>
To: <linux-mtd@lists.infradead.org>
Subject: UBIFS kernel oops
Date: Fri, 24 Feb 2012 09:39:42 -0000
Message-ID: <000201ccf2d8$3cb7adb0$b6270910$@node-h.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-gb
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are seeing the following:

Oops[#1]:
Cpu 0
$ 0   : 00000000 00000001 00000001 87a0cac8
$ 4   : 000000d4 00000000 000000a0 00000000
$ 8   : 000000b0 80103fd8 00000001 805b75e0
$12   : 00000000 8053c370 81000000 00000000
$16   : 87218000 00000000 000000d4 ffffffe4
$20   : 000000a0 00000000 00000001 ffffffff
$24   : 00000000 00415b60
$28   : 87a14000 87a15b30 87a15b50 80261170
Hi    : 000147e6
Lo    : 66678550
epc   : 801081ec rt_mutex_lock+0x18/0xa0
    Not tainted
ra    : 80261170 make_reservation+0x9c/0x4b8
Status: 1000ff03    KERNEL EXL IE
Cause : 00800008
BadVA : 000000e4
PrId  : 59019381 (MIPS 24Kc)
Modules linked in: iptable_nat nf_nat_dlna nf_conntrack_dlna nf_nat xt_IMQ
iptable_mangle ip_tables xfrm_user xfrm4_tunnel ipcomp xfrm_ipcomp esp4 ah4
gtp nodeh_helper ledtrig_netdev ledtrig_timer ledtrig_default_on
ledtrig_heartbeat leds_gpio led_class lm75 percello_mac_filter percello_f8
percello_read_fsm percello_AES fle_driver dpr percello_frame_cap
percello_dsp percello_dma percello_mmap percello_logger percello_syscall
procfs_util
Process pdflush (pid: 124, threadinfo=87a14000, task=87a0cac8, tls=00000000)
Stack : 87217b80 00000004 0000005e 87125598 000000a0 801c084c 0000000e
0001b800
        0000005e 87218184 8721812c 000000b0 00000000 87a15b64 000000b0
00000001
        87218000 870f4380 000000a0 00000000 00000000 8754f600 00000000
00000000
        00000001 80261b68 00000000 00000001 805ef6b0 87218038 8109f4a0
802db07c
        00026cff 00000000 87218000 80279db8 805ef6b8 00000080 8753e0e0
87218000
        ...
Call Trace:
[<801081ec>] rt_mutex_lock+0x18/0xa0
[<80261170>] make_reservation+0x9c/0x4b8
[<80261b68>] ubifs_jnl_write_inode+0x60/0x248
[<8026952c>] ubifs_write_inode+0xc0/0x10c
[<802653c0>] ubifs_writepage+0x220/0x250
[<8019671c>] __writepage+0x18/0x80
[<801974b8>] write_cache_pages+0x258/0x4d4
[<801977d0>] do_writepages+0x78/0x80
[<801e9700>] writeback_single_inode+0xa0/0x428
[<801ea1b8>] generic_sync_sb_inodes+0x4a0/0x65c
[<801ea4a0>] writeback_inodes+0x7c/0x130
[<80197fb8>] background_writeout+0xd0/0x140
[<80198c70>] pdflush+0x158/0x28c
[<8014afc8>] kthread+0x84/0x8c
[<8010c72c>] kernel_thread_helper+0x10/0x18


Code: 7c420400  1040000c  00000000 <c0820010> 14400005  00000000  00600821
e0810010  102000b0
Disabling lock debugging due to kernel taint

The kernel version is 3.6.31.12 with real-time extensions (patches) compiled
with "mips-linux-gnu-gcc (Sourcery G++ Lite 4.4-303) 4.4.1"

We have seen this posted before here:

http://lists.infradead.org/pipermail/linux-mtd/2011-December/038852.html

For us, UBIFS is not read-only. Any ideas what could be causing this and/or
whether such an issue has been fixed in later kernels?
