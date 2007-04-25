Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hgj7m-0001yv-Vv
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 11:09:44 -0400
Subject: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 25 Apr 2007 17:09:39 +0200
Message-Id: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Got a board form the lab here that OOPS during boot(Linux 2.6.20, powerpc):
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 136k init
Starting Lumentis Main Script: /opt/appl/next is a link
Starting from /opt/appl/cuappl02a-r8a-070425_2/bin
Wed Apr 25 15:25:57 CEST 2007
Starting services: te_server
Unable to handle kernel paging request for data at address 0x0000000c
Faulting instruction address: 0xc00cdc54
Oops: Kernel access of bad area, sig: 11 [#1]

NIP: C00CDC54 LR: C00CDC54 CTR: 00000000
REGS: c0635d40 TRAP: 0300   Not tainted  (2.6.20)
MSR: 00009032 <EE,ME,IR,DR>  CR: 22022042  XER: 20000000
DAR: 0000000C, DSISR: 20000000
TASK = c04bd810[144] 'jffs2_gcd_mtd6' THREAD: c0634000
GPR00: 00000000 C0635DF0 C04BD810 00000000 00002800 00002800 00000000 00000000 
GPR08: C01DB5DC 00008000 2A7D97E9 00000000 22022084 FCE9FEF7 C0635E38 C0635E2C 
GPR16: C0635E38 C01E0000 00000000 00000000 C0635E24 C0635E20 C0235A0C CF456A28 
GPR24: 82022022 C0635EA0 C0235A00 CFF6A800 C0235A10 00000000 00002800 00000000 
NIP [C00CDC54] jffs2_truncate_fragtree+0xc0/0xf0
LR [C00CDC54] jffs2_truncate_fragtree+0xc0/0xf0
Call Trace:
[C0635E10] [C00D1808] jffs2_do_read_inode_internal+0xec4/0x1084
[C0635E90] [C00D1A20] jffs2_do_crccheck_inode+0x58/0xb4
[C0635F00] [C00D55E8] jffs2_garbage_collect_pass+0x174/0x6c4
[C0635F50] [C00D6E00] jffs2_garbage_collect_thread+0xa0/0x11c
[C0635FF0] [C000FF70] kernel_thread+0x44/0x60
Instruction dump:
2f9d0000 7fbfeb78 409effc8 2f9e0000 409e0018 80010024 bb61000c 38210020 
7c0803a6 4e800020 7f83e378 48027009 <8123000c> 2f890000 41beffdc 80030014 

Did some debugging: CONFIG_JFFS2_FS_DEBUG=1 didn't print
anything useful.

Added a litte intrumentation like so:
diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 5a6b4d6..33f526a 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -83,6 +83,10 @@ void jffs2_truncate_fragtree(struct jffs2_sb_info *c, struct 
         * REF_PRISTINE irrespective of its size.
         */
        frag = frag_last(list);
+       if (!frag) {
+          printk(KERN_ERR "frag==NULL\n");
+          BUG();
+       }
        if (frag->node && (frag->ofs & (PAGE_CACHE_SIZE - 1)) == 0) {
                dbg_fragtree2("marking the last fragment 0x%08x-0x%08x REF_PRIST
                        frag->ofs, frag->ofs + frag->size);

and set a BP on the BUG().
Here is some data when stopping the BP:
(gdb) bt
#0  jffs2_truncate_fragtree (c=0xcff56800, list=0xc023d610, size=0x2800)
    at fs/jffs2/nodelist.c:88
#1  0xc00d23dc in jffs2_do_read_inode_internal (c=0xcff56800, f=0xc023d600, 
    latest_node=0xc0635ea0) at fs/jffs2/readinode.c:813
#2  0xc00d25cc in jffs2_do_crccheck_inode (c=0xcff56800, ic=0xcfe6d398)
    at fs/jffs2/readinode.c:971
#3  0xc00d68a8 in jffs2_garbage_collect_pass (c=0xcff56800)
    at fs/jffs2/gc.c:208
#4  0xc00d8650 in jffs2_garbage_collect_thread (_c=0xe)
    at fs/jffs2/background.c:140
#5  0xc000ff70 in kernel_thread ()
Previous frame inner to this frame (corrupt stack?)
(gdb) print *list
$1 = {rb_node = 0x0}
(gdb) 
