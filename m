Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CLgQ-0003m7-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 14:36:43 +0100
Date: Tue, 19 Jun 2001 15:43:14 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: non cfi flash memory
Message-ID: <20010619154314.A17475@crystal.2d3d.co.za>
References: <3B2F4DEA.6839BBD0@inventel.fr> <4395.992957074@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <4395.992957074@redhat.com>; from dwmw2@infradead.org on Tue, Jun 19, 2001 at 14:24:34 +0100
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

> No. You don't need to write a whole driver for it. The existing
> cfi_cmdset_0001 code can driver the chips just fine. All you need to do is
> write a _probe_ routine which can pass control to the existing code, just
> like the cfi_probe does.
>=20
> There's already a hack in the cfi_probe code to find some non-CFI=20
> AMD-compatible chips and use the cfi_cmdset_0002 back end. You want=20
> something similar - but _don't_ add further hacks to the cfi_probe code,=
=20
> make it an entirely new probe routine like the AMD one should probably=20
> have been.

I really think those cfi_cmdset_*.c chip driver modules should be renamed to
something else. It's really confusing since they're not only for CFI chips.

--=20

Regards
 Abraham

The study of non-linear physics is like the study of non-elephant biology.

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

iD8DBQE7L1byzNXhP0RCUqMRAn6bAJwNl3OJSr2XXfeaOVRTfMxnO0ifiwCfYlHn
MZiqei2n9spprjKqUVc2mk0=
=AIEh
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
