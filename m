Received: from zproxy.gmail.com ([64.233.162.199])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUV0O-00039k-Vu
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 16:02:48 -0400
Received: by zproxy.gmail.com with SMTP id 34so929140nzf
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2005 13:02:42 -0700 (PDT)
Message-ID: <6934efce0510251302k5621409dt863efdc8f3d36eb1@mail.gmail.com>
Date: Tue, 25 Oct 2005 13:02:42 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0510251436590.5288@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
	<1130173789.15275.1.camel@windu.rchland.ibm.com>
	<6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
	<Pine.LNX.4.64.0510251436590.5288@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/25/05, Nicolas Pitre <nico@cam.org> wrote:
> On Mon, 24 Oct 2005, Jared Hulbert wrote:
>
> > Sorry. It took me longer than it should have to track down a P30 part
> > and get it on my machine.  Does this work for you?
>
> I have a problem convincing myself it should work at all.
>
> > --- trunk/drivers/mtd/chips/cfi_cmdset_0001.c (revision 8)
> > +++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c (revision 10)
> > @@ -285,7 +285,7 @@
> >                             sizeof(struct cfi_intelext_otpinfo);
> >
> >               /* Burst Read info */
> > -             extra_size +=3D (extp->MinorVersion < '4') ? 6 : 5;
> > +             extra_size +=3D (unsigned int)extp->extra[extra_size+1]+2=
;
>
> Here you're dereferencing the extra array which (initially) has not even
> been read into memory yet.  It probably only work because it just
> happens that extra_size is not increased enough to bypass the later
> "goto again" which would manage to read the extra data needed and things
> would get back on track at that point.  but that's relying on pure luck.

Yeah. Opps kind of tacky.

> Could you fix that and get rid of the needless cast please?  (extra is
> uint8_t so there is no signedness issues to worry about)

How's this look?

Index: trunk/drivers/mtd/chips/cfi_cmdset_0001.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- trunk/drivers/mtd/chips/cfi_cmdset_0001.c=09(revision 8)
+++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c=09(revision 11)
@@ -285,7 +285,10 @@
 =09=09=09      sizeof(struct cfi_intelext_otpinfo);

 =09=09/* Burst Read info */
-=09=09extra_size +=3D (extp->MinorVersion < '4') ? 6 : 5;
+=09=09extra_size +=3D 2;
+=09=09if (extp_size < sizeof(*extp) + extra_size)
+=09=09=09goto need_more;
+=09=09extra_size +=3D extp->extra[extra_size-1];

 =09=09/* Number of hardware-partitions */
 =09=09extra_size +=3D 1;
@@ -519,7 +522,7 @@
 =09=09       sizeof(struct cfi_intelext_otpinfo);

 =09=09/* Burst Read info */
-=09=09offs +=3D (extp->MinorVersion < '4') ? 6 : 5;
+=09=09offs +=3D extp->extra[offs+1]+2;

 =09=09/* Number of partition regions */
 =09=09numregions =3D extp->extra[offs];
