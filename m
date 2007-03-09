Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPgPI-0006Ys-FW
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 09:49:23 -0500
Subject: Re: JFFS2 OOPS in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173448490.26465.69.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432194.3461.562.camel@pmac.infradead.org>
	<1173437173.26465.37.camel@gentoo-jocke.transmode.se>
	<1173438908.26465.54.camel@gentoo-jocke.transmode.se>
	<1173448490.26465.69.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Mar 2007 15:49:16 +0100
Message-Id: <1173451756.26465.76.camel@gentoo-jocke.transmode.se>
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

On Fri, 2007-03-09 at 14:54 +0100, Joakim Tjernlund wrote:
> On Fri, 2007-03-09 at 12:15 +0100, Joakim Tjernlund wrote:
> > On Fri, 2007-03-09 at 11:46 +0100, Joakim Tjernlund wrote:
> > > On Fri, 2007-03-09 at 09:23 +0000, David Woodhouse wrote:
> > > > On Fri, 2007-03-09 at 10:02 +0100, Joakim Tjernlund wrote:
> > > > > JFFS2 notice: (137) read_unknown:  ref_flags(ref) == REF_UNCHECKED at 0x3aa6c6c.
> > > > >  {0000,0000,00000000,00000000} 
> > > > 
> > > > Ouch. That CRC is actually "correct". It's why we should have used
> > > > crc32(-1, buf, len) instead of crc32(0, buf, len) from the start.
> > > > 
> > > > Do you have any idea how you managed to get those zeroes on the flash?
> > > 
> > > Not much, our system test did power cycle testing while doing SW
> > > upgrade(lots of writing of files).
> > > 
> > > Tested your patch and now it boots again with this :)
> > > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> > > {0040,4001,00000044,00000000}
> > > JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa6c6c
> > > JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> > > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa517c. 
> > > {0400,4001,00000000,00000004}
> > > JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa28fc
> > > JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> > > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1ef8. 
> > > {0000,0000,00000000,00100400}
> > > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1438. 
> > > {0000,4000,00000000,00000000}
> > > JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa0a44
> > > JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> > > JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa3e84
> > > JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> > > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa3d80. 
> > > {0040,4000,00000000,01000005}
> > > JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa33c8
> > > JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> > > VFS: Mounted root (jffs2 filesystem).
> > 
> > This does not look right, none of the "All zero node header" checks has triggered.
> > 
> > hmm,
> > je32_to_cpu(node->u.totlen) should be !je32_to_cpu(node->u.totlen)
> > 
> > also I think this check should be before the real crc32 check.
> > After that I get:
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> > {0040,4001,00000044,00000000}
> > JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa6c6c.
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa517c. 
> > {0400,4001,00000000,00000004}
> > JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa28fc.
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1ef8. 
> > {0000,0000,00000000,00100400}
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1438. 
> > {0000,4000,00000000,00000000}
> > JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa0a44.
> > JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa3e84.
> > JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa3d80. 
> > {0040,4000,00000000,01000005}
> > JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa33c8.
> > VFS: Mounted root (jffs2 filesystem).
> > 
> 
> The check in scan is rendundant. You will never reach it due to two
> earlier checks:
> 	if (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK) {
> and
> 	crcnode.nodetype = cpu_to_je16( je16_to_cpu(node->nodetype) | JFFS2_NODE_ACCURATE);
> 
> I wonder if JFFS2_NODE_ACCURATE mask bit could be used in readinode.c as well?
> 
>  Jocke

probably better to remove the zero crc32 check and add a:
   if (je16_to_cpu(node->u.magic) != JFFS2_MAGIC_BITMASK)

to make sure it is a JFFS2 node with the added benefit that this will work
when ->point is added too.

 Jocke
