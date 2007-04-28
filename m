Received: from smtp-ext.int-evry.fr ([157.159.11.17])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hhl71-0007L4-8y
	for linux-mtd@lists.infradead.org; Sat, 28 Apr 2007 07:29:13 -0400
Received: from mini.int.alphacore.net (florian.maisel.int-evry.fr
	[157.159.41.36])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-ext.int-evry.fr (Postfix) with ESMTP id 769DE8D169C
	for <linux-mtd@lists.infradead.org>;
	Sat, 28 Apr 2007 13:27:52 +0200 (CEST)
From: Florian Fainelli <florian.fainelli@telecomint.eu>
To: linux-mtd@lists.infradead.org
Subject: Finding ERASE_INFO from a Flash datasheet
Date: Sat, 28 Apr 2007 13:24:49 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6495452.p9haGUtxyf";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200704281324.50082.florian.fainelli@telecomint.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart6495452.p9haGUtxyf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

I am using a box which has a SST 39VF6402B flash [1] driven by jedec. This=
=20
flash is not yet referenced in the Linux kernel, and once I got the right=20
erase informations, I will submit a patch to add it.

=46or the moment, I have defined 4 strictly identical erase informations :
ERASE_INFO(0x2000, 256), which makes me avoid this message "Sum of regions=
=20
(400000) !=3D total size of set of interleaved chips (800000)". I am pretty=
=20
sure these informations are completely wrong.

If anyone has some clues about this, I will be glad finishing my patch ;)

Thank you very much in advance.

[1] : http://www.sst.com/downloads/datasheet/S71288.pdf
=2D-=20
Cordialement, Florian Fainelli
=2D--------------------------------------------

--nextPart6495452.p9haGUtxyf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.3 (GNU/Linux)

iD8DBQBGMy8Cmx9n1G/316sRAv0wAJ9LnYJjAdllrUtOgci1vEHqe1C8sQCeLxF/
MzdR0h0UGSHPSGDa+x9nfHc=
=yLwk
-----END PGP SIGNATURE-----

--nextPart6495452.p9haGUtxyf--
