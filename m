Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D5SE-0006Kj-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 15:29:07 +0100
Date: Thu, 21 Jun 2001 16:35:37 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Vipin Malik <mtd-linux@embeddedlinuxworks.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
Message-ID: <20010621163537.A26714@crystal.2d3d.co.za>
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621155737.A26310@crystal.2d3d.co.za> <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com>; from mtd-linux@embeddedlinuxworks.com on Thu, Jun 21, 2001 at 09:29:06 -0500
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

> Yeah, that "except is not free" means it costs >100K USD (for the=20
> transaction version) if I remember the quote they gave me.

$125K iirc (;

> I guess I should change the name away from a "database", as I really don'=
t=20
> want to do anything more drastic than maybe a linear "recno" type flat fi=
le=20
> database or something very simple. Something that you or I may have=20
> probably implemented anyway to solve our needs to store these config=20
> variables in our respective systems.

That's exactly what I've started writing today (:

> I agree that this functionality should be present in the JFFS2 layer=20
> itself, but have been unable to convince the powers to be.
>=20
> David W. says that he'll entertain a diff -u if we (I) implement the=20
> feature, but I don't think that I have the time or the capability to chan=
ge=20
> JFFS2 to implement this functionality all by myself. Plus the issue of th=
e=20
> blocked access will remain (even if we solve the power fail issue) and th=
e=20
> solution to that may be not be acceptable for inclusion to the regular=20
> JFFS2 fs.

I don't know if merging something like this with jffs2 would solve the
problem like you said. I was more thinking of a completely different user
MTD driver to provide an uncached block device and slap a file system on top
of that. Or we can sync() all the time from the file system.

I have to agree that it's probably better to write a library/utilities first
to do a preliminary thing. That way we'd get a functional thing quite fast
and figure out what we did wrong in the first place.

> Maybe you may want to subscribe to the development list on the=20
> www.EmbeddedLinuxWorks site and we can take this discussion there. I am=
=20

Where do I subscribe?

> looking for user input to define the feature set of this "config system"=
=20
> (not database :) And I want to make it LGPL (if it does become a lib or=
=20
> task) so that users can link to it without releasing the source of their=
=20
> own code.

I'm in the fortunate position of being able to work on this fulltime for
the next week or so, so if we can figure out a useful specification for this
in a short time, I'm really keen on helping to implement this and LGPL/BSD
license is just fine.

> I can't believe that you and I are the only folks that may be interested =
in=20
> this. Maybe there is an existing solution- we just don't know about it- o=
r=20
> other's have not thought about this issue just yet ;)

That's why I mailed here in the first place :P

--=20

Regards
 Abraham

Matrimony is the root of all evil.

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

iD8DBQE7MgY5zNXhP0RCUqMRAindAJ4gW6GKYidrYdShTSghKVi1sHDwpwCeIqQJ
mVbZYvGxUh0lYcIAv6VhZ8I=
=91Pb
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
