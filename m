Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SCAw-0004Ml-PS
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2003 09:50:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Luca Contini <luca.contini@mediaenabling.com>
In-Reply-To: <006801c334a8$3aa7c750$a970a8c0@topo>
References: <006801c334a8$3aa7c750$a970a8c0@topo>
Message-Id: <1055839872.2233.68.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 17 Jun 2003 09:51:12 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Please help, nftl question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-06-17 at 09:12, Luca Contini wrote:
> Hi all,
> does anybody know wich is the role of the nftl in the nand flash driver
> stack?
> I konw there ere for layers:
> 1. File system layer (e.g. JFFS2 or DOS-FAT)
> 2. MTD
> 3. Nand generic driver
> 4. Hardware specific driver
> 
> where can the nftl be located in the stack?

You are confused about the file system layer.

See http://www.linux-mtd.infradead.org/tech/mtd-upper-layers.fig 
(there's a JPEG for the xfig-challenged at 
 http://www.linux-mtd.infradead.org/~dwmw2/mtd-upper-layers.jpeg )

Atop the MTD layer there is _either_ a real file system such as JFFS2 or
YAFFS, which uses MTD devices directly and presents itself as a file
system to the operating system, or there can be a 'translation layer'
which is a kind of pseudo-filesystem which pretends to be a standard
disk drive. The translation layer could be FTL, NFTL, INFTL or the very
simplistic 'mtdblock'. The translation layer registers a block device
with the Linux block layer, and on top of that you can mount 'normal'
file systems such as cramfs, ext3 and FAT (and all the others).

Also, you can access the 'translated' block devices through their device
nodes (/dev/ftl*, /dev/nftl*, /dev/mtdblock*), and you can access the
MTD devices directly to issue read/write/erase commands via the
/dev/mtdX character device nodes.

See http://www.linux-mtd.infradead.org/tech/mtd-upper-layers.fig 
(there's a JPEG for the xfig-challenged at 
http://www.linux-mtd.infradead.org/~dwmw2/mtd-upper-layers.jpeg )

I've omitted the lower layers. The whole point of the MTD code is that
you shouldn't need to consider the devices and the 'users' of those
devices in the same breath. If you have a question about what's _below_
the 'Linux MTD layer' level, ask it separately. It's actually a little
messier and more fluid.

> is nftl a filesystem or a low level driver?

No. :)

-- 
dwmw2
