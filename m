Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D4rP-0006Ht-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 14:51:04 +0100
Date: Thu, 21 Jun 2001 15:57:37 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
Message-ID: <20010621155737.A26310@crystal.2d3d.co.za>
References: <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>; from vipin@embeddedlinuxworks.com on Thu, Jun 21, 2001 at 08:43:45 -0500
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

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vipin!

> I have started a project to define the features required for this. Please=
=20
> read details at:
> http://www.embeddedlinuxworks.com/articles/db_project.html
>=20
> I need the same thing for my project. I am sure there are others out ther=
e=20
> that need
> this capability for their embedded systems. It would be nice if all could=
=20
> collaborate and come
> up with an open source software that addresses this need.

Exciting stuff. It does address the issues I'm interested in. More
specifically I agree that a driver level system is needed and not a user
layer (otherwise we should be using Sleepycat's db3 which is perfect for
transactional data except that it's not free).

If it's a file system people will actually use it instead of just talk about
it.

Doing this sort of thing properly though is a huge task however and should
be carefully planned.

I'm really interested in helping (if we're talking driver, not user level
process - I don't want to develop a database :P)

--=20

Regards
 Abraham

Don't let people drive you crazy when you know it's in walking distance.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Mf1RzNXhP0RCUqMRAqnOAKCD/qZPl/J7eggwyurMLHUMDngpMwCbB2mE
UCc1zLMvTi2nNflxu/Ud9ZY=
=CZYA
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
