Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPb03-0000wj-FS
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 04:03:01 -0500
Subject: Re: JFFS2 OOPS in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173379047.3461.482.camel@pmac.infradead.org>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Mar 2007 10:02:51 +0100
Message-Id: <1173430972.26465.20.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 18:37 +0000, David Woodhouse wrote:
> On Thu, 2007-03-08 at 18:44 +0100, Joakim Tjernlund wrote:
> > Got another board too that has an identical OOPS, but prints 
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> > {0040,4001,00000044,00000000}
> > Just before the OOPS, here is the full OOPS:
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> > {0040,4001,00000044,00000000}
> > ------------[ cut here ]------------
> > kernel BUG at fs/jffs2/readinode.c:376! 
> 
> Can you make it print the flash offset of the offending node, and the
> header contents (like the 0040,4001,00000044,00000000 above) before
> dying? Then reproduce with CONFIG_JFFS2_FS_DEBUG=1 and show me the full
> output.
> 

Added this:
static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref, struct jffs2_unknown_node *un)
{
+	if (ref_flags(ref) == REF_UNCHECKED) {
+		JFFS2_NOTICE(" ref_flags(ref) == REF_UNCHECKED at %#08x. {%04x,%04x,%08x,%08x}\n",
+			     ref_offset(ref), je16_to_cpu(un->magic),
+			     je16_to_cpu(un->nodetype),
+			     je32_to_cpu(un->totlen),
+			     je32_to_cpu(un->hdr_crc));
+	}
	/* We don't mark unknown nodes as REF_UNCHECKED */
	BUG_ON(ref_flags(ref) == REF_UNCHECKED);
and CONFIG_JFFS2_FS_DEBUG=1

Got this trace:
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
{0040,4001,00000044,00000000}
JFFS2 error: (137) __jffs2_dbg_dump_node: wrong common header CRC.
JFFS2 notice: (137) read_unknown:  ref_flags(ref) == REF_UNCHECKED at 0x3aa6c6c.
 {0000,0000,00000000,00000000}
------------[ cut here ]------------
kernel BUG at fs/jffs2/readinode.c:383!
Oops: Exception in kernel mode, sig: 5 [#1]

NIP: C00D149C LR: C00D1670 CTR: C00FAB00
REGS: cfec7d50 TRAP: 0700   Not tainted  (2.6.20)
MSR: 00029032 <EE,ME,IR,DR>  CR: 22028022  XER: 00000000
TASK = cff32090[137] 'jffs2_gcd_mtd6' THREAD: cfec6000
GPR00: 00000001 CFEC7E00 CFF32090 00000072 0210EBCC FFFFFFFF C0113E14 C024211C 
GPR08: 00000000 00000000 00000000 C0240000 22028042 C0A89688 C01D0000 C01D0000 
GPR16: C01D0000 00000000 C01D0000 CFE2BC24 CFEC7E14 CFEC7E10 CFF66A0C 00000000 
GPR24: 000009B0 CFEC7EA0 CFF66A00 CFF13000 CFE2BC3C 00000001 00000000 C07EA6C0 
NIP [C00D149C] jffs2_do_read_inode_internal+0x1a0/0x1198
LR [C00D1670] jffs2_do_read_inode_internal+0x374/0x1198
Call Trace:
[CFEC7E00] [C00D1670] jffs2_do_read_inode_internal+0x374/0x1198 (unreliable)
[CFEC7E90] [C00D24EC] jffs2_do_crccheck_inode+0x58/0xb4
[CFEC7F00] [C00D6BD4] jffs2_garbage_collect_pass+0x1a8/0x880
[CFEC7F50] [C00D89A8] jffs2_garbage_collect_thread+0xa8/0x178
[CFEC7FF0] [C000FF70] kernel_thread+0x44/0x60
Instruction dump:
7f880000 419e04b0 38000000 6000e002 7f880000 419e06b0 801c0004 70090003 
418201c4 70090003 7c000026 54001ffe <0f000000> 61092000 b13f0002 a11f0002 
 VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 128k init
jffs2_lookup()
jffs2_read_inode(): inode->i_ino == 3
[JFFS2 DBG] (1) jffs2_do_read_inode: read inode #3
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #3 nlink is 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #3

[SNIP] alot of output

 Jocke
