Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tgvY-0008Tr-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 05:04:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Marc Singer <elf@buici.com>
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Date: Tue, 24 Sep 2002 15:58:00 +1200
Cc: linux-mtd@lists.infradead.org, yaffs@toby-churchill.org
References: <200209231220.12682.ayalon@tadlys.com> <20020924014556.6EC8B43F2@tiger.actrix.co.nz> <20020924034410.GA18915@buici.com>
In-Reply-To: <20020924034410.GA18915@buici.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020924040150.A1499145FF@dragon.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 24 Sep 2002 15:44, Marc Singer wrote:
> On Tue, Sep 24, 2002 at 12:03:45PM +1200, Charles Manning wrote:
> > Hi
> >
> > I'm considering getting YAFFS working on DOC. I'm trying to gauge
> > interest to prioritise vs other things.
> >
> > If you don't know what YAFFS is, it's a NAND-specific journalling
> > file system. Ask Google for more info.
> >
> > Currently YAFFS works with raw NAND (using software ecc), though
> > some people have patched it to use hardware ecc, so I figure DOC
> > support should be relatively simple.
>
> Do you know how it boots?  Does grub support it?

By "it" I assume you mean YAFFS.

Doing a yaffs-specific bootloader is pretty simple. We have discussed the 
general approach  on the YAFFS list before. At least two people have done 
yaffs bootloaders. One of these might be rolled in with grub. Maybe someone 
else on the yaffs list can answer that.
