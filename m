Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K7GYT-0001Dq-Eg
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 21:11:30 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH] respect CFLAGS/CPPFLAGS from build environment
Date: Fri, 13 Jun 2008 17:11:21 -0400
References: <1213220948-30156-1-git-send-email-vapier@gentoo.org>
	<20080613105153.31449aa5@vader.jdub.homelinux.org>
In-Reply-To: <20080613105153.31449aa5@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart19264379.aOgVsq2rXm";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200806131711.21891.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart19264379.aOgVsq2rXm
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 13 June 2008, Josh Boyer wrote:
> On Wed, 11 Jun 2008 17:49:08 -0400
>
> Mike Frysinger <vapier@gentoo.org> wrote:
> > diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
> > index 0394eee..062cc32 100644
> > --- a/ubi-utils/Makefile
> > +++ b/ubi-utils/Makefile
> > @@ -2,7 +2,6 @@
> >  # Makefile for ubi-utils
> >  #
> >
> > -OPTFLAGS :=3D -O2 -g -Wall
> >  KERNELHDR :=3D ../include
> >  DESTDIR :=3D /usr/local
> >  SBINDIR=3D/usr/sbin
> > @@ -10,8 +9,10 @@ MANDIR=3D/usr/share/man
> >  INCLUDEDIR=3D/usr/include
> >
> >  CC :=3D $(CROSS)gcc
> > -CFLAGS :=3D -I./inc -I./src -I$(KERNELHDR) $(OPTFLAGS) -Werror \
> > -	-Wwrite-strings -W -std=3Dgnu99 -DPACKAGE_VERSION=3D\"1.0\"
> > +CFLAGS ?=3D -O2 -g -Werror
> > +CFLAGS +=3D -Wall -Wwrite-strings -W
> > +CPPFLAGS +=3D -I./inc -I./src -I$(KERNELHDR) \
> > +	-std=3Dgnu99 -DPACKAGE_VERSION=3D\"1.0\"
> >
> >  PERLPROGS =3D mkpfi ubicrc32.pl
> >
> > @@ -26,7 +27,7 @@ vpath   %.c ./src
> >  	$(CC) $(LDFLAGS) -g -o $@ $^
> >
> >  %.o: %.c
> > -	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
> > +	$(CC) $(CPPFLAGS) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$(shell basena=
me
> > $<).dep
>
> Should either remove the unconditional -g here, or not specify it in
> the default CFLAGS above, correct?

moving -g in both Makefiles to the default CFLAGS makes the most sense to=20
me ... i just figured someone liked it the way it was and i didnt really ca=
re=20
to fight em for it.
=2Dmike

--nextPart19264379.aOgVsq2rXm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJIUuJ5AAoJEEFjO5/oN/WBW2QQAMaw/z0mAdVGszg+mPHUjPl8
PqIHhMPd0L+YV9JNq4EIxgW9SCZ95Xddf8FDBdOsu5Qu6UtKB0jDVv62Gs+r6CDd
kCX4hI43XTgfcdzdYLHOkdGLBfSrL2WAc/5MnmzpRWeZeje4diBz7TCpM3j/j9RX
6EZg5/ohKoPtRJR1IMSOK0UFrjP8VgGrIHzWezB+G9k/xLvlHfqzqgWdc9zMcdHg
qB3H18rRg1hDZtxW95XFoSz5A+8bv/okQXVgqBFxKqQbYQuG9PAwktXRbFxGQxVb
FM/nMdzfVvTOSndrSrM73H9Pf3CUPz4dzriaIhc7QpXP3yl4r+E7EXdcqyXGd0Wb
2n4ckMVPDCl8pZiF8y+kjCkR2rk0fUnqnjq7L78zjulj/cQrO7/bEbTz/i/5yTuc
KCzLS5krAAW81/PiDRd21gRMePpb6cKTEbWzMRsP7c1S/Nuet22uHF5baSssNkta
glZQnjyYOaTAvUANP/MPPWyQpg9OSOBL8yMdPXzWq+tdNFOW3QDWVItRe4l6dTpg
CTwqWx6DFte7v1C2r94V67ZFtPgj337GEQpELolMNNS4mkA4rGdbbChyOG73JEvY
aHzwNdIQfCy0Ka5QPjHOVaHwDikND3AC1MRQ+6KSyR96wO3Yp9oG4WMpTFhfjGiw
R0j25eVzAIuxr+oYIFg+
=m3Fn
-----END PGP SIGNATURE-----

--nextPart19264379.aOgVsq2rXm--
