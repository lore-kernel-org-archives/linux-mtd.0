Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dNa-0006AJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:29:47 +0100
Date: Wed, 6 Jun 2001 15:35:13 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd_info->write
Message-ID: <20010606153513.A9850@crystal.2d3d.co.za>
References: <F1BED55F35F4D3118C0F00E0295CFF4D99548A@mail.mediatrix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D99548A@mail.mediatrix.com>; from fgiasson@mediatrix.com on Wed, Jun 06, 2001 at 09:25:33 -0400
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

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic!

> I am almost sure that you have to validate the erase state of the sector =
you
> want to write to.  For example, I use cfi_amdstd_write function, and
> absolutely no validation is made in that fonction for this.

You mean the user process/module has to, not the chip driver? I'm writing a
chip driver and I want to know whether the chip driver is responsible for
the checking.

I noticed the other chip drivers (like you say here) doesn't so I'm assuming
I don't have to but I just want to make sure.

> > If the data is all ones ("1"), it has been erased.   If not, it has not.
>=20
> Yes, I know, but I want to know whether I have to check if that's the case
> or not.
>=20
> > Can you safely assume in the MTD write function that the blocks on which
> the
> > data is have been erased or do you actually have to do some error check=
ing
> > and return with -EINVAL if you discover that it's not been erased?

--=20

Regards
 Abraham

Chemistry professors never die, they just fail to react.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HjGRzNXhP0RCUqMRAimLAJ9OMiCJq6WirVWRx9IIY3XY/sLQxQCfagSF
H/QznttsprYxfG2xNNPsUYw=
=F3T3
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
