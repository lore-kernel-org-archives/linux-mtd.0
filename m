Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 195qfR-0005zB-RH
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 18:25:54 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1050513945.1172.265.camel@tubarao>
Mime-Version: 1.0
Date: 16 Apr 2003 11:25:45 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-5vwKRUMdeyvqRGkdTAqa"
Subject: device info in /proc/mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5vwKRUMdeyvqRGkdTAqa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

It's nice that loading the amd76xrom module outputs probe information
about a device manufacturer and chip:

[root@172 2466]# modprobe amd76xrom
Found: PMC Pm49FL004
number of JEDEC chips: 1
amd76xrom chip at offset: 480000

I hoped this same information would be in /proc/mtd - it's not.

[root@172 2466]# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00001000 "AMD76X rom"

Is there someplace where the manufacturer and chip are available other
than in the printk() messages?  It would be nice to be able to query
this information at any time - a specific model of motherboard might
socket a different chip depending on cost/availability and I'd like to
be able to track which BIOS flash chip is being used.

Something like this in /proc/mtd might be nice:

dev:    size   erasesize  name       manufacturer chip chip_name
mtd0: 00080000 00001000 "AMD76X rom" 009d         006e "PMC Pm49FL004"

Am I crazey?  Is this plain wrong?  Does anyone have objections if I
submit a patch?

--=20
Thayne Harbaugh
Linux Networx

--=-5vwKRUMdeyvqRGkdTAqa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+nZIZfsBPTKE6HMkRAp+WAJ9wncqOm1pcI48zKe61b+YhWgZIagCfb89B
hmAponCIeakLtDvLdL07WH4=
=s3PN
-----END PGP SIGNATURE-----

--=-5vwKRUMdeyvqRGkdTAqa--
