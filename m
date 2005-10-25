Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUTPF-000203-66
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 14:20:22 -0400
Received: by zproxy.gmail.com with SMTP id 13so574494nzn
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2005 11:20:16 -0700 (PDT)
Message-ID: <6934efce0510251120x30b29008ocdf1c445c5bcd753@mail.gmail.com>
Date: Tue, 25 Oct 2005 11:20:15 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1130247989.16443.3.camel@windu.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
	<1130173789.15275.1.camel@windu.rchland.ibm.com>
	<6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
	<1130247989.16443.3.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/25/05, Josh Boyer <jdub@us.ibm.com> wrote:
> On Mon, 2005-10-24 at 18:00 -0700, Jared Hulbert wrote:
> > Sorry. It took me longer than it should have to track down a P30 part
> > and get it on my machine.  Does this work for you?
>
> No worries.  The patch seems to be working fine on my P30 chips.  I
> don't have any other chips to test on at the moment, but it looks like
> it should work.
>
> Nicolas, could you try it on the chips you have?

FYI - I did try this on L18, M18, and P30.

> >
> > [MTD] CHIPS: fix for P30 cfi parsing
> >
> > Change to the extended cfi table parsing for Intel NOR flash that uses
> > the info in the extended table to 'walk' the table rather than using
> > hard coding for various primary extended query table version numbers.
> > [From: Jared Hulbert <jaredeh@gmail.com>]
> >
> > Index: trunk/drivers/mtd/chips/cfi_cmdset_0001.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- trunk/drivers/mtd/chips/cfi_cmdset_0001.c (revision 8)
> > +++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c (revision 10)
> > @@ -285,7 +285,7 @@
> >                             sizeof(struct cfi_intelext_otpinfo);
> >
> >               /* Burst Read info */
> > -             extra_size +=3D (extp->MinorVersion < '4') ? 6 : 5;
> > +             extra_size +=3D (unsigned int)extp->extra[extra_size+1]+2=
;
> >
> >               /* Number of hardware-partitions */
> >               extra_size +=3D 1;
> > @@ -519,7 +519,7 @@
> >                      sizeof(struct cfi_intelext_otpinfo);
> >
> >               /* Burst Read info */
> > -             offs +=3D (extp->MinorVersion < '4') ? 6 : 5;
> > +             offs +=3D (int)extp->extra[offs+1]+2;
>
> Why (int) here and (unsigned int) above?  Not a big deal, but I'm
> curious.

off is an int, extra_size is an unsigned int.  Though off should
probably be made unsigned as well.
