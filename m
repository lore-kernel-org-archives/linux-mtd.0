Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IhaIX-0004s8-NN
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 01:28:40 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: mtd support for large NAND
Date: Tue, 16 Oct 2007 13:27:15 +1300
References: <200710110911.58596.manningc2@actrix.gen.nz>
	<1192087361.21337.3.camel@sauron>
	<49eab5c80710120136m557b0df1ye3bd4e04d345d222@mail.gmail.com>
In-Reply-To: <49eab5c80710120136m557b0df1ye3bd4e04d345d222@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200710161327.15290.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 12 October 2007 21:36:09 falls huang wrote:
> Hello !
>
>   How can I simulate a large nandflash(>4G) in linux PC ? I want to
> take a look at it, but I don't have any develop-board that has 4G

There are a few problems you face here. Firstly, mtd does not support >4G=20
which will need fixing.

Secondly, even if your system has > 4G it might not be all simultaneously=20
accessible and you will need to use highmem as a way to do temporary mappin=
gs=20
to access this memory.

I might be tempted to try do this using some sort of userspace driver then=
=20
just backing the driver with regular files (eg. 8x1G files to simulate 8G o=
f=20
NAND).


>
> On 10/11/07, Artem Bityutskiy <dedekind@infradead.org> wrote:
> > On Thu, 2007-10-11 at 09:11 +1300, Charles Manning wrote:
> > > Last I looked (2.6.23), mtd_info is limited by a u32 size field to
> > > 4Gbytes of flash. That's no longer very large and is limiting some
> > > applications.
> > >
> > > Is anyone working on this?
> >
> > Yeah, the problem is known, but nobody is working on the fix AFAIK.
> >
> > --
> > Best regards,
> > Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=
=90=D1=80=D1=82=D1=91=D0=BC)
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
