Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SbRj-00018s-PK
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2003 12:49:47 +0100
Message-ID: <027f01c33590$8f177db0$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <006801c334a8$3aa7c750$a970a8c0@topo>
	<1055839872.2233.68.camel@passion.cambridge.redhat.com>
Date: Wed, 18 Jun 2003 13:55:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Thank you David.
One more question: I want to put a vfat filesystem on top of nftl (actually
i'd like to read from a smartmedia formatted with fat12 by a digital
camera).
Should I create a dev node (e.g. nftla) using major number 93 (the one
corresponding to nftl driver) and format this device befor mounting it?
thank you very much again

Luca



----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Luca Contini" <luca.contini@mediaenabling.com>
Cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Sent: Tuesday, June 17, 2003 10:51 AM
Subject: Re: Please help, nftl question


> On Tue, 2003-06-17 at 09:12, Luca Contini wrote:
> > Hi all,
> > does anybody know wich is the role of the nftl in the nand flash driver
> > stack?
> > I konw there ere for layers:
> > 1. File system layer (e.g. JFFS2 or DOS-FAT)
> > 2. MTD
> > 3. Nand generic driver
> > 4. Hardware specific driver
> >
> > where can the nftl be located in the stack?
>
> You are confused about the file system layer.
>
> See http://www.linux-mtd.infradead.org/tech/mtd-upper-layers.fig
> (there's a JPEG for the xfig-challenged at
>  http://www.linux-mtd.infradead.org/~dwmw2/mtd-upper-layers.jpeg )
>
> Atop the MTD layer there is _either_ a real file system such as JFFS2 or
> YAFFS, which uses MTD devices directly and presents itself as a file
> system to the operating system, or there can be a 'translation layer'
> which is a kind of pseudo-filesystem which pretends to be a standard
> disk drive. The translation layer could be FTL, NFTL, INFTL or the very
> simplistic 'mtdblock'. The translation layer registers a block device
> with the Linux block layer, and on top of that you can mount 'normal'
> file systems such as cramfs, ext3 and FAT (and all the others).
>
> Also, you can access the 'translated' block devices through their device
> nodes (/dev/ftl*, /dev/nftl*, /dev/mtdblock*), and you can access the
> MTD devices directly to issue read/write/erase commands via the
> /dev/mtdX character device nodes.
>
> See http://www.linux-mtd.infradead.org/tech/mtd-upper-layers.fig
> (there's a JPEG for the xfig-challenged at
> http://www.linux-mtd.infradead.org/~dwmw2/mtd-upper-layers.jpeg )
>
> I've omitted the lower layers. The whole point of the MTD code is that
> you shouldn't need to consider the devices and the 'users' of those
> devices in the same breath. If you have a question about what's _below_
> the 'Linux MTD layer' level, ask it separately. It's actually a little
> messier and more fluid.
>
> > is nftl a filesystem or a low level driver?
>
> No. :)
>
> --
> dwmw2
>
>
>
