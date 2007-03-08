Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPMfT-0000Do-Bo
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 12:44:45 -0500
Subject: Re: JFFS2 OOPS in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1173375204.26465.8.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 08 Mar 2007 18:44:39 +0100
Message-Id: <1173375879.26465.13.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-03-08 at 18:33 +0100, Joakim Tjernlund wrote:
> On Thu, 2007-03-08 at 18:14 +0100, Joakim Tjernlund wrote:
> > Got a board with that has been powercycle tested while writing to JFFS2
> > FS with the following OOPS:
> > IP-Config: Complete:
> >       device=eth1, addr=192.168.101.172, mask=255.255.255.0,
> > gw=192.168.101.1,
> >      host=L_172_Node, domain=, nis-domain=(none),
> >      bootserver=192.168.1.63, rootserver=192.168.1.63, rootpath=
> > eth0: PHY is Generic MII (ffffffff)
> > ------------[ cut here ]------------
> > Kernel BUG at c00d0a38 [verbose debug info unavailable]
> > Oops: Exception in kernel mode, sig: 5 [#1]
> > 
> > NIP: C00D0A38 LR: C00D09F8 CTR: 00000000
> > REGS: cfe8bd60 TRAP: 0700   Not tainted  (2.6.20)
> > MSR: 00029032 <EE,ME,IR,DR>  CR: 28028048  XER: 20000000
> > TASK = cff107f0[137] 'jffs2_gcd_mtd6' THREAD: cfe8a000
> > GPR00: 00000001 CFE8BE10 CFF107F0 00000000 C07EA6C8 00000000 00000000
> > 00000000 
> > GPR08: C01CF678 01383E70 00000000 00000000 28028084 FC038F43 CFE8BE38
> > CFE8BE2C 
> > GPR16: CFE8BE38 C01D0000 00000000 C0733E70 CFE8BE24 CFE8BE20 CFF29A0C
> > 00000000 
> > GPR24: 00000754 CFE8BEA0 CFF29A00 CFF48000 C0733E88 00000001 C07EA6C0
> > 00000000 
> > NIP [C00D0A38] jffs2_do_read_inode_internal+0x134/0xfe8
> > LR [C00D09F8] jffs2_do_read_inode_internal+0xf4/0xfe8
> > Call Trace:
> > [CFE8BE10] [C00D09D4] jffs2_do_read_inode_internal+0xd0/0xfe8
> > (unreliable)
> > [CFE8BE90] [C00D1944] jffs2_do_crccheck_inode+0x58/0xb4
> > [CFE8BF00] [C00D58C8] jffs2_garbage_collect_pass+0x174/0x6c4
> > [CFE8BF50] [C00D70F4] jffs2_garbage_collect_thread+0xa0/0x11c
> > [CFE8BFF0] [C000FF70] kernel_thread+0x44/0x60
> > Instruction dump:
> > 38000000 6000e001 7f860000 419e03ec 38000000 6000e002 7f860000 419e05f0 
> > 813c0004 71200003 7c000026 54001ffe <0f000000> 60c92000 b13e0002
> > a0de0002 
> >  VFS: Mounted root (jffs2 filesystem).
> > Freeing unused kernel memory: 128k init
> > 
> > If someone can make an guess whats wrong, I would be a happy man
> > 
> >  Jocke
> 
> Adding verbose BUG reporting I see that this happens in 
> fs/jffs2/readinode.c:376!
> which looks:
> static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref, struct jffs2_unknown_node *un)
> {
> 	/* We don't mark unknown nodes as REF_UNCHECKED */
> 	BUG_ON(ref_flags(ref) == REF_UNCHECKED);
> 

Got another board too that has an identical OOPS, but prints 
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
{0040,4001,00000044,00000000}
Just before the OOPS, here is the full OOPS:
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
{0040,4001,00000044,00000000}
------------[ cut here ]------------
kernel BUG at fs/jffs2/readinode.c:376!
Oops: Exception in kernel mode, sig: 5 [#1]

NIP: C00D0A38 LR: C00D09F8 CTR: 00000000
REGS: cfec7d60 TRAP: 0700   Not tainted  (2.6.20)
MSR: 00029032 <EE,ME,IR,DR>  CR: 24028048  XER: 20000000
TASK = cff0db80[137] 'jffs2_gcd_mtd6' THREAD: cfec6000
GPR00: 00000001 CFEC7E10 CFF0DB80 00000000 C07EA6C8 00000000 00000000 00000000 
GPR08: C01CF678 03AA6C6C 00000000 00000000 24028084 C0A89688 CFEC7E38 CFEC7E2C 
GPR16: CFEC7E38 C01D0000 00000000 CFE24C24 CFEC7E24 CFEC7E20 CFF28A0C 00000000 
GPR24: 000009B0 CFEC7EA0 CFF28A00 CFF48000 CFE24C3C 00000001 C07EA6C0 00000000 
NIP [C00D0A38] jffs2_do_read_inode_internal+0x134/0xfe8
LR [C00D09F8] jffs2_do_read_inode_internal+0xf4/0xfe8
Call Trace:
[CFEC7E10] [C00D09D4] jffs2_do_read_inode_internal+0xd0/0xfe8 (unreliable)
[CFEC7E90] [C00D1944] jffs2_do_crccheck_inode+0x58/0xb4
[CFEC7F00] [C00D58C8] jffs2_garbage_collect_pass+0x174/0x6c4
[CFEC7F50] [C00D70F4] jffs2_garbage_collect_thread+0xa0/0x11c
[CFEC7FF0] [C000FF70] kernel_thread+0x44/0x60
Instruction dump:
38000000 6000e001 7f860000 419e03ec 38000000 6000e002 7f860000 419e05f0 
813c0004 71200003 7c000026 54001ffe <0f000000> 60c92000 b13e0002 a0de0002 
 VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 128k init
