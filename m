Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NbtY-0004rl-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 16:08:49 +0100
Date: Fri, 20 Jul 2001 17:15:06 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Linus/Russell/any tree merge
Message-ID: <20010720171506.A3170@crystal.2d3d.co.za>
References: <20010720170455.B2757@crystal.2d3d.co.za> <16900.995641665@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <16900.995641665@redhat.com>; from dwmw2@infradead.org on Fri, Jul 20, 2001 at 16:07:45 +0100
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

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David!

> abraham@2d3d.co.za said:
> >  There's some drivers/changes in the CVS tree that imho is much needed
> > in the main kernel tree.
>=20
> I merged quite recently, into 2.4.6. What are you missing, precisely?

My flash driver for LART and Simon Evans' block device emulation driver.
Also, 2.4.6 still have the old sa1100 lart stuff in. I changed almost 2
monts ago when I finished the LART driver.

--=20

Regards
 Abraham

Well, the handwriting is on the floor.
		-- Joe E. Lewis

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7WEr6zNXhP0RCUqMRAg7KAJ9VeVnSoeG9EbdvUWcrvgYRDRxUJwCfbP9I
b1KbUkxIySpmr8kiWtPUwRE=
=HHvT
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
