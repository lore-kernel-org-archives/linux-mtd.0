Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COzYt-0004zu-JN
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2004 09:23:05 -0500
From: Ian Campbell <icampbell@arcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 02 Nov 2004 14:23:01 +0000
Message-Id: <1099405381.18481.41.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: hitting BUG_ON() at fs/jffs2/nodemgmt.c:580
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I seem to be hitting a BUG_ON() in jffs2_mark_node_obsolete(), the code
in question is part of the support for merging adjacent obsolete nodes.

	if (ref->next_phys && ref_obsolete(ref->next_phys) ) {
		struct jffs2_raw_node_ref *n = ref->next_phys;
		
		ref->__totlen += n->__totlen;
		ref->next_phys = n->next_phys;
                if (jeb->last_node == n) jeb->last_node = ref;
		if (jeb->gc_node == n) {
			/* gc will be happy continuing gc on this node */
			jeb->gc_node=ref;
		}
		BUG_ON(n->next_in_ino); <<--- HERE
		jffs2_free_raw_node_ref(n);
	}

The kernel output when the bug is hit is:

        kernel BUG at /home/icampbell/devel/kernel/arm/2.6/fs/jffs2/nodemgmt.c:580!
        Unable to handle kernel NULL pointer dereference at virtual address 00000000
        pgd = c3bb4000
        [00000000] *pgd=a3a81011, *pte=00000000, *ppte=00000000
        Internal error: Oops: 807 [#1]
        Modules linked in: pcmcia pxa2xx_cs pxa2xx_core pcmcia_core rfcomm l2cap bluetooth ds1307
        CPU: 0
        PC is at __bug+0x40/0x54
        LR is at schedule+0x4d0/0x564
        pc : [<c0023c10>]    lr : [<c018d9f0>]    Not tainted
        sp : c3befe30  ip : c3befd88  fp : c3befe40
        r10: c3d15614  r9 : c3befe64  r8 : c3c82400
        r7 : c02c21c0  r6 : c3befe5c  r5 : 00000000  r4 : 00000000
        r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000001
        Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
        Control: 397F  Table: A3BB4000  DAC: 00000015
        Process cardctl (pid: 1185, stack limit = 0xc3bee190)
        Stack: (0xc3befe30 to 0xc3bf0000)
        fe20:                                     c3d15604 c3befe98 c3befe44 c00c4248
        fe40: c0023bdc c3befe5c c3befe64 c3befe58 c00c660c c00c396c 00000030 0000000c
        fe60: 3908c001 c0011985 0000002f f244f9b1 c3f70220 c39cb220 c3e25c44 e66810d6
        fe80: c3c82400 c3c82400 c3a9ad08 c3befebc c3befe9c c00c20ac c00c3c34 00000000
        fea0: c398f3e0 c39cb220 00000000 c3b227d0 c3beff1c c3befec0 c00c14d8 c00c2020
        fec0: 00000007 0150eb78 00000000 00002000 00000002 00000007 c3af87fc c3b227f8
        fee0: 00011488 0150eb78 217da882 217da882 0000fe00 c3b227f8 00002180 c3af87fc
        ff00: 0fe00000 c02b6000 c3bee000 c3af87fc c3beff3c c3beff20 c007e7ec c00c0f90
        ff20: c3af87fc 00002180 0000fe00 c3beff40 c3beffa4 c3beff40 c007e944 c007e740
        ff40: c3ad890c c02a5360 e66810d6 00000007 c02b6010 00000000 00000000 00000000
        ff60: c030d2e0 00000001 c3beffac c3beff78 c0025b20 c00d7cf4 401385d0 c000fb0c
        ff80: 00000000 befffd94 00012fb8 0000000e c001ef04 befffd48 00000000 c3beffa8
        ffa0: c001ed80 c007e7fc 00000000 c0025a00 befffd94 00002180 0000fe00 000000fe
        ffc0: 00000000 befffd94 00012fb8 0000fe00 00000000 00013158 befffd48 00000003
        ffe0: 000000fe befffd2c 000091a8 400ddd4c 60000010 befffd94 00000000 00000000
        Backtrace:
        [<c0023bd0>] (__bug+0x0/0x54) from [<c00c4248>] (jffs2_mark_node_obsolete+0x620/0x6e4)
         r4 = C3D15604
        [<c00c3c28>] (jffs2_mark_node_obsolete+0x0/0x6e4) from [<c00c20ac>] (jffs2_add_fd_to_list+0x98/0xc8)
        [<c00c2014>] (jffs2_add_fd_to_list+0x0/0xc8) from [<c00c14d8>] (jffs2_mknod+0x554/0x5a8)
         r8 = C3B227D0  r7 = 00000000  r6 = C39CB220  r5 = C398F3E0
         r4 = 00000000
        [<c00c0f84>] (jffs2_mknod+0x0/0x5a8) from [<c007e7ec>] (vfs_mknod+0xb8/0xbc)
        [<c007e734>] (vfs_mknod+0x0/0xbc) from [<c007e944>] (sys_mknod+0x154/0x1c4)
         r7 = C3BEFF40  r6 = 0000FE00  r5 = 00002180  r4 = C3AF87FC
        [<c007e7f0>] (sys_mknod+0x0/0x1c4) from [<c001ed80>] (ret_fast_syscall+0x0/0x2c)
        Code: 1b0044bb e59f0014 eb0044b9 e3a03000 (e5833000)
        
I have output with CONFIG_JFFS2_FS_DEBUG=1 but something seems to be
triggering the mailing list filters so I will supply it later if this
gets through.

I have version 1.109 of nodemgmt.c (from 2.6.10-rc1-bk11 snapshot). Any
idea where I should be looking?

Ian.
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
