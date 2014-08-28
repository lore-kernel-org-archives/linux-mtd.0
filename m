Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XN8Kb-00063A-M6
 for linux-mtd@lists.infradead.org; Thu, 28 Aug 2014 22:38:15 +0000
Received: by mail-vc0-f178.google.com with SMTP id la4so1640809vcb.23
 for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2014 15:37:52 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 28 Aug 2014 15:37:52 -0700
Message-ID: <CAE2F3rC0Pm+xoJeBmU3Qoq25QoQ2ME1n+SHJHq9R3OA+uDPYPA@mail.gmail.com>
Subject: ubifs_dump_node must bounds check ubifs_ch->len
From: Daniel Mentz <danielmentz@google.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe that ubifs_dump_node() must bounds check ch->len in the
UBIFS_DATA_NODE case. It currently does not which resulted in a crash
on a system. See below.

This is the source code as it stands today:

int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
print_hex_dump(KERN_ERR, "\t", DUMP_PREFIX_OFFSET, 32, 1,
                               (void *)&dn->data, dlen, 0);

For some reason, ch->len was 47. UBIFS_DATA_NODE_SZ appears to be 48,
so dlen got assigned -1 which is then coerced into a size_t. Since
size_t is unsigned, it effectively passes 0xFFFFFFFF to
print_hex_dump().

[   23.873556] UBIFS: recovery needed
[   25.530459] UBIFS error (pid 772): ubifs_check_node: bad node length 47
[   25.537102] UBIFS error (pid 772): ubifs_check_node: bad node at
LEB 246:621328
[   25.547138]  magic          0x6101831
[   25.550833]  crc            0xdbc28925
[   25.554594]  node_type      1 (data node)
[   25.558629]  group_type     0 (no node group)
[   25.562998]  sqnum          736111
[   25.566409]  len            47
[   25.569485]  key            (7202, data, 816)
[   25.573854]  size           4096
[   25.577091]  compr_typ      1
[   25.580089]  data size      -1
[   25.583159]  data:
[   25.585181]  00000000: 31 18 10 06 42 3c b0 0d 70 3b 0b 00 00 00 00
00 30 10 00 00 01 00 00 00 22 1c 00 00 31 03 00 20

This is the backtrace from a different crash caused by the same bug:

[  166.638230] Unable to handle kernel paging request at virtual
address c52fd000
[  166.645490] pgd = bdaa4000
[  166.648212] [c52fd000] *pgd=3db9a811, *pte=00000000, *ppte=00000000
[  166.654563] Internal error: Oops: 7 [#1] PREEMPT SMP
[  166.659544] Modules linked in: pfe(O)
[  166.663245] CPU: 0    Tainted: G           O  (3.2.26 #4)
[  166.668671] PC is at hex_dump_to_buffer+0x14c/0x1f0
[  166.673566] LR is at hex_dump_to_buffer+0x45/0x1f0
[  166.678374] pc : [<8417e410>]    lr : [<8417e309>]    psr: 20000133
[  166.678378] sp : bdef7bb8  ip : 842dd804  fp : 00000000
[  166.689896] r10: 00000020  r9 : c52fd000  r8 : 00000020
[  166.695137] r7 : 00000020  r6 : 00000083  r5 : bdef7c1c  r4 : 00000000
[  166.701684] r3 : bdef7c1f  r2 : 00000003  r1 : 00000000  r0 : 00000020
[  166.708234] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb
Segment user
[  166.715566] Control: 50c53c7d  Table: 3daa404a  DAC: 00000015
[  166.721329] Process mount (pid: 772, stack limit = 0xbdef62f0)
<snip>
[  167.018746] [<8417e410>] (hex_dump_to_buffer+0x14c/0x1f0) from
[<8417e513>] (print_hex_dump+0x5f/0xb8)
[  167.028100] [<8417e513>] (print_hex_dump+0x5f/0xb8) from
[<8414e3cf>] (dbg_dump_node+0xdf3/0x1218)
[  167.037107] [<8414e3cf>] (dbg_dump_node+0xdf3/0x1218) from
[<84136a41>] (ubifs_check_node+0x1dd/0x214)
[  167.046451] [<84136a41>] (ubifs_check_node+0x1dd/0x214) from
[<8413bd13>] (ubifs_scan_a_node+0x7f/0x158)
[  167.055965] [<8413bd13>] (ubifs_scan_a_node+0x7f/0x158) from
[<8413c0cd>] (ubifs_scan+0x41/0x22c)
[  167.064870] [<8413c0cd>] (ubifs_scan+0x41/0x22c) from [<8413cbf7>]
(ubifs_replay_journal+0x72f/0x1200)
[  167.074211] [<8413cbf7>] (ubifs_replay_journal+0x72f/0x1200) from
[<8413411f>] (ubifs_mount+0xe97/0x18b8)
[  167.083821] [<8413411f>] (ubifs_mount+0xe97/0x18b8) from
[<84099fef>] (mount_fs+0xb/0x78)
[  167.092040] [<84099fef>] (mount_fs+0xb/0x78) from [<840a9dc7>]
(vfs_kern_mount+0x37/0x60)
[  167.100251] [<840a9dc7>] (vfs_kern_mount+0x37/0x60) from
[<840aa09d>] (do_kern_mount+0x21/0x88)
[  167.108983] [<840aa09d>] (do_kern_mount+0x21/0x88) from
[<840ab1d5>] (do_mount+0x481/0x4d0)
[  167.117366] [<840ab1d5>] (do_mount+0x481/0x4d0) from [<840ab58f>]
(sys_mount+0x5b/0x84)
[  167.125408] [<840ab58f>] (sys_mount+0x5b/0x84) from [<8400cdc1>]
(ret_fast_syscall+0x1/0x44)
[  167.133878] Code: 0b8b f10b 0b02 e01d (f819) 0001
