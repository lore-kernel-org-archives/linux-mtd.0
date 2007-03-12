Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQeL9-00013k-VI
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 02:49:06 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: Does mtd support two-plane page program for nand flash?
Date: Mon, 12 Mar 2007 19:53:58 +1300
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
	<20070309114246.GA4897@lazybastard.org>
	<91b24a870703112149ucba512ahc8976d0f10a6e625@mail.gmail.com>
In-Reply-To: <91b24a870703112149ucba512ahc8976d0f10a6e625@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200703121953.58185.manningc2@actrix.gen.nz>
Cc: =?iso-8859-1?q?J=F6rn?= Engel <joern@lazybastard.org>,
	Marteo Tim <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 12 March 2007 17:49, Marteo Tim wrote:
> MLC NAND Flash has already become the mainstream flash for
> large-capacity on the market. But due to its low writting speed, there
> will be introduced more parallel writting features such as multi-bank,
> interleave, etc. So I think it is very necessary to modify MTD
> structure to support multi-plane & interleave feature for speed
> issure.

Multi-plane flash predates MLC and has been here for a while.

MLC is a bit slower, but  bigger overheads come from ECC. For example, Micr=
on=20
suggests using at minimum BCH to give 4 bits per 512-byte correction for ML=
C=20
whereas they suggest only a minimum of 1-bit per 512 bytes correction for=20
SLC.

>
> It is a good method to shield the details of flash type by composing
> two or more page as a large page.=20
This approach works, but also forces you to have more bad blocks than you'd=
=20
have otherwise. MLC will tend to have more bad blocks than SLC.

If you know how data is going to be written thern there are other=20
possibilities (eg. buffering up pages and writing them in parallel).

> Although it will be more slower for=20
> small segment data read/write. But for large-capacity flash,
> continuate writting speed maybe is more concerned.

I think anyone really wanting speed probably writes their own drivers anywa=
y=20
(well that's what people woho are most interested in speed tell me=20
anyway :-)).

=2D- Charles


>
> Regards,
> marteo
>
> 2007/3/9, J=F6rn Engel <joern@lazybastard.org>:
> > On Fri, 9 March 2007 10:09:37 +0200, Adrian Hunter wrote:
> > > OneNAND DDP does this too (google: onenand "2x program")
> >
> > Thanks!
> >
> > > I presume the possibility exists to have the driver pretend that the
> > > page size is twice as large and there are half as many erase blocks.
> > > It would have to map the addressses accordingly - and everything
> > > else would have to be willing to accept a 4KiB page with 8
> > > subpages and 128 bytes of oob.
> >
> > That would be the quick way to get extra bandwidth.
> >
> > Interleaving writes to both planes can also help latency.  It is
> > possible to write to one plane while the other is erasing.  It is
> > possible to do two writes in parallel.  Keeping things seperate would
> > keep writesize and erasesize low.  And by combining two or more planes,
> > the slowest of them always decides how long a write/erase will take.
> >
> > So in the long run, I would prefer to keep planes seperate and add
> > intelligence to filesystems, LogFS in particular.
> >
> > J=F6rn
> >
> > --
> > It does not matter how slowly you go, so long as you do not stop.
> > -- Confucius
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
