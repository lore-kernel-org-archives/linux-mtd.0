Received: from smtp1.int-evry.fr ([157.159.10.44])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IfiyM-0006L5-97
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 22:20:09 +0100
Received: from smtp-ext.int-evry.fr (smtp-ext.int-evry.fr [157.159.11.17])
	by smtp1.int-evry.fr (Postfix) with ESMTP id B5B9A8E6F07
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Oct 2007 23:19:24 +0200 (CEST)
Received: from mini.int.alphacore.net (fbx.alphacore.net [82.241.112.26])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-ext.int-evry.fr (Postfix) with ESMTP id 21254D0E31B
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Oct 2007 23:19:24 +0200 (CEST)
From: Florian Fainelli <florian.fainelli@telecomint.eu>
To: linux-mtd@lists.infradead.org
Subject: Design of plat_ram
Date: Wed, 10 Oct 2007 23:09:45 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2579417.dI1OEVthVk";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200710102309.51185.florian.fainelli@telecomint.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2579417.dI1OEVthVk
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

I was wondering why the generic platform RAM driver was not extended alread=
y=20
to support ROM and probe using the command set supplied with platform data ?

Thank you very much in advance for your answer.

--nextPart2579417.dI1OEVthVk
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQBHDT+fmx9n1G/316sRAs5rAJ49QQQfCrw8dvaY4ryps7ILo7c40gCfaphm
QcZSJQzslekuGzstDCp+UC4=
=jAyB
-----END PGP SIGNATURE-----

--nextPart2579417.dI1OEVthVk--
