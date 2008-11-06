Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kxz5z-0004vJ-30
	for linux-mtd@lists.infradead.org; Thu, 06 Nov 2008 07:15:59 +0000
Subject: Re: ubinize corrections
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <490EB956.5050700@nokia.com>
References: <20081102142315.453628de.merrij3@rpi.edu>
	<490EB956.5050700@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Nov 2008 09:13:43 +0200
Message-Id: <1225955623.26460.20.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, "J. Scott Merritt" <merrij3@rpi.edu>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-11-03 at 10:41 +0200, Adrian Hunter wrote:
> J. Scott Merritt wrote:
> > Dear list,
> >=20
> > I believe that I have stumbled upon two problems with the latest versio=
n
> > of ubinize.c in mtd-utils - one serious, and one not so serious.
> >=20
> > - First, the easy one: At line 457, I believe that we should be printin=
g
> > args.subpage_size rather than ui.min_io_size.
> >=20
> > - More seriously, I believe that the "flags" field in the ubigen_vol_in=
fo
> > structures is not being properly initialized.  Line 494 allocates memor=
y
> > for these structures with malloc, so they are not cleared to zero.  The
> > read_section function updates the flag field if the AUTO-RESIZE flag is
> > specified, but does not otherwise initialize or clear it.
> >=20
> > I reckon the latter problem could be repaired either with calloc, or by
> > modifying read_section to more directly set/clear the flag.
> >=20
> > Thanks, Scott.
>=20
> I agree.  Here's the patch:

Pushed, thanks for the report and the patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
