Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KhDq-0006R3-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 16:18:14 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g5JFIDV07611
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 11:18:13 -0400
Received: from [10.0.0.20] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 17KhDo-0003Xj-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 11:18:12 -0400
Subject: Updating the root partition
From: Chris AtLee <catlee@canada.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-3Mn8K4fY43sct1KupzRf"
Date: 19 Jun 2002 11:18:12 -0400
Message-Id: <1024499892.9366.31.camel@geb>
Mime-Version: 1.0
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

--=-3Mn8K4fY43sct1KupzRf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I've got linux booting off of a cramfs partition sitting on mtdblock1.=20
Is it possible to overwrite the mtdblock1 partition while linux is
running?  The kernel itself isn't located on the root partition.  I've
tried just copying a new cramfs image to /dev/mtd1 but I get errors on
decompressing next time I try and boot.

Cheers,
Chris



--=-3Mn8K4fY43sct1KupzRf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9EKCzoOgacgDd/cQRAqJrAJ9E56uz/93j4IgB9ZrdrJrG8gqtyACgpNWL
/Bg7P2ggGC6Fc2Y8sG6qFng=
=aWi9
-----END PGP SIGNATURE-----

--=-3Mn8K4fY43sct1KupzRf--
