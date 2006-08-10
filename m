Received: from the.earth.li ([193.201.200.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GB3jG-0004oF-Ns
	for linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 02:09:26 -0400
Received: from noodles by the.earth.li with local (Exim 4.50)
	id 1GB3eL-0001G5-Af
	for linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 07:04:09 +0100
Date: Thu, 10 Aug 2006 07:04:09 +0100
From: Jonathan McDowell <noodles@earth.li>
To: linux-mtd@lists.infradead.org
Subject: Re: 2.6.18-rc4 jffs2 problems
Message-ID: <20060810060409.GH27094@earth.li>
References: <1154976111.17725.8.camel@localhost.localdomain>
	<20060809093419.GA14187@earth.li>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060809093419.GA14187@earth.li>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 09, 2006 at 10:34:19AM +0100, Jonathan McDowell wrote:
> On Mon, Aug 07, 2006 at 07:41:50PM +0100, Richard Purdie wrote:
> > I previous reported problems with jffs2 on the Zaurus. I tested
> > 2.6.18-rc4 and nothing has changed - I see the following when booting,
> > both with filesystems that work with 2.6.17 and freshly reflashed
> > systems:
> > 
> > Linux version 2.6.18-rc4-.dev-snapshot-20060807 (richard@tim) (gcc version 3.4.3) #1 PREEMPT Mon Aug 7 17:47:07 BST 2006
> > CPU: XScale-PXA250 [69052904] revision 4 (ARMv5TE), cr=0000397f
> > Machine: SHARP Poodle
> > [...]
> > Sharp SL series flash device: 800000@0
> > Using static partision definition
> > Creating 1 MTD partitions on "sharpsl-flash":
> > 0x00120000-0x007f0000 : "Boot PROM Filesystem"
> > NAND device: Manufacturer ID: 0x98, Chip ID: 0x76 (Toshiba NAND 64MiB 3,3V 8-bit)
> > Scanning device for bad blocks
> > Creating 3 MTD partitions on "sharpsl-nand":
> > 0x00000000-0x00700000 : "System Area"
> > 0x00700000-0x01d00000 : "Root Filesystem"
> > 0x01d00000-0x04000000 : "Home Filesystem"
> > [...]
> > Empty flash@0x0054bc5c ends at 0x0054be00
> > VFS: Mounted root (jffs2 filesystem) readonly.
> > Freeing init memory: 100K
> > JFFS2 error: (472) jffs2_get_inode_nodes: short read@0x074e84: 68 instead of 380.
> > JFFS2 error: (472) jffs2_do_read_inode_internal: cannot read nodes for ino 153, returned error is -5
> 
> I'm seeing similar problems on the Amstrad Delta, both with a filesystem
> that works fine under 2.6.16 and a completely clean fs. Like the Zaurus
> this is a NAND device.

A "git bisect" is flagging up 8593fbc68b0df1168995de76d1af38eb62fd6b62
as the problem commit:

commit 8593fbc68b0df1168995de76d1af38eb62fd6b62
Author: Thomas Gleixner <tglx@cruncher.tec.linutronix.de>
Date:   Mon May 29 03:26:58 2006 +0200

    [MTD] Rework the out of band handling completely

J.

-- 
                                            jid: noodles@jabber.earth.li
101 things you can't have too much of : 25
                                            - email.
