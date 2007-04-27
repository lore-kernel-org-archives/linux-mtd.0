Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhQlO-00017A-2G
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 09:45:31 -0400
Received: by ug-out-1314.google.com with SMTP id m2so655916uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Apr 2007 06:45:27 -0700 (PDT)
Message-ID: <625fc13d0704270645qcb2a510p76fb97e532a076a1@mail.gmail.com>
Date: Fri, 27 Apr 2007 08:45:27 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Seongsu Lee" <senux@senux.com>
Subject: Re: FAT file system on NAND flash memory
In-Reply-To: <20070426175902.GA21492@pooky.senux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070412134137.GA25860@pooky.senux.com>
	<625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
	<20070426175902.GA21492@pooky.senux.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/26/07, Seongsu Lee <senux@senux.com> wrote:
> On Thu, Apr 12, 2007 at 08:55:23AM -0500, Josh Boyer wrote:
> > On 4/12/07, Seongsu Lee <senux@senux.com> wrote:
> > > Hi,
> > >
> > > In my knowledge, mtdblock.c must be used to use
> > > FAT filesystem on bare NAND flash memories
> > > because NFTL is made only for a specific hardware,
> > > DiskOnChip.
> > >
> > > (Layer 0) VFS
> > > (Layer 1) FAT (or EXT2, EXT3)
> > > (Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
> > > (Layer 3) NAND flash memory driver (vendor specific)
> > > (Layer 4) Physical NAND flash memory
> > >
> > > Please let me know if it is wrong.
> >
> > That layering is correct, but your results will be bad.  mtdblock
> > doesn't handle bad blocks.  So if you have one in the middle of your
> > filesystem, it will break things.  You need some kind of translation
> > layer if you're going to use NAND.
>
> Thank you for the reply.
>
> Just one more question.
>
> Could you tell me the reason that there is no translation layer code
> in MTD for bare flash memories?

Because most users of MTD already handle bad blocks themselves on bare
NAND.  JFFS2, yaffs, etc. all have bad block handling contained within
them.

UBI can be used for things that lack the proper translation
themselves.  JFFS2 can even run on top if a UBI volume.  Perhaps you
should check into that.

josh
