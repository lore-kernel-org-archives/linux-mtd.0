Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CJW5-0003eO-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 12:17:54 +0100
Date: Tue, 19 Jun 2001 13:24:27 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
Message-ID: <20010619132427.B7581@crystal.2d3d.co.za>
References: <3B2E2C7A.F997FDEE@inventel.fr> <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl> <20010618143104.A3715@crystal.2d3d.co.za> <3B2E2C7A.F997FDEE@inventel.fr> <29895.992882600@redhat.com> <20010619093319.D10532@crystal.2d3d.co.za> <3B2F3346.44C57BCE@inventel.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <3B2F3346.44C57BCE@inventel.fr>; from xde@inventel.fr on Tue, Jun 19, 2001 at 13:11:02 +0200
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

--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xavier!

> > Just btw, if you're looking for an Intel probe routine for the 28F160 c=
hips,
> > look at the lart driver - I implemented one there which works for 28F16=
0 and
> > 28F800 chips (but then again you could probably use the entire driver a=
s is
> > as it should work with all 28F{800,160} chips.
>=20
> where is it located in lart sources (blob, kernel...) or what is the
> file you're talking about in mtd/maps/

The lart driver is in mtd/devices/lart.c - You'll have to check it out of
the MTD CVS tree, it's not in the kernel yet.

The maps driver I was talking about is mtd/maps/sa1100-flash.c, but you
won't find any 28F160xx stuff in there.

--=20

Regards
 Abraham

Advice is a dangerous gift; be cautious about giving and receiving it.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LzZrzNXhP0RCUqMRAjijAJ45AGOy6Mo2IxoF0LMlguqNoCbq3gCeNOU1
2HWz3DG1NIBheLhOMFS0oME=
=kLUj
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
