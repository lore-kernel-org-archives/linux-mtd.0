Received: from frodo.info.uniroma2.it ([160.80.84.124]
	helo=sackville.theshire.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPkA4-0007gP-Pv
	for linux-mtd@lists.infradead.org; Mon, 17 May 2004 16:36:16 +0100
Date: Mon, 17 May 2004 17:37:58 +0200
From: Cristiano Paris <paris@disp.uniroma2.it>
To: linux-mtd@lists.infradead.org
Message-ID: <20040517153758.GA9992@sackville.theshire.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
Subject: Low-level access to USB pendrive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi everyone,

I know that the external interface to usb flash pendrives is implemented
as a block device. I also know that this is a logical organization of the
underlying flash memory. The question is: is it possible to access the
flash memory directly bypassing this "logical-to-physical" mapping layer?

Thanks

Cristiano

----
Web: http://www.disp.uniroma2.it/users/paris/

Public PGP/GnuPG key
pub  1024D/32CA6D54 2004-01-23 Cristiano Paris (RHPK) <c.paris@email.it>
     Key fingerprint = 3BFD 9884 230A 1F17 391C  1434 80CB 2C7A 32CA 6D54
----

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAqNxWgMssejLKbVQRAihfAJ9eJH8ls8m6HoU7OR/Up+QWG60NdQCgyfWe
Z+WEHAUElRmWKOj+dmV2TC4=
=YIgQ
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
