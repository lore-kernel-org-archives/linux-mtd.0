Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157CZG-0004NJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 09:52:03 +0100
Date: Tue, 5 Jun 2001 10:57:29 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: acceptable chip driver limitations
Message-ID: <20010605105729.A26674@crystal.2d3d.co.za>
References: <20010605104201.A26328@crystal.2d3d.co.za> <25630.991730918@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <25630.991730918@redhat.com>; from dwmw2@infradead.org on Tue, Jun 05, 2001 at 09:48:38 +0100
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

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David!

> >  Is it allright if my chip driver read/write's only accept 32-bit to/
> > from/len's?
>=20
> > I.e. if I return with -EINVAL if somebody tries to read/write a single
> > byte or tries to read from a non-dword boundary, is that acceptable or
> > should the driver cater for word/byte read/writes as well?
>=20
> Leave them NULL. You can't return an error value from them - there's no=
=20
> possible value you can return that isn't a valid return from an actual re=
ad.
>=20
> They should never get called is the buswidth doesn't match them.

No, I'm talking about mtd->read() and mtd->write. Surely they can return
errors? If not, what about physical write/read errors?

--=20

Regards
 Abraham

Visit beautiful Vergas, Minnesota.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HJ75zNXhP0RCUqMRAtarAJ9RZw+JFqu6JlskWQju7eH/c/ydfACfVQDJ
zTDb+TLZsfrpk0k/LWMU7B4=
=VebP
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
