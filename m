Received: from cpe-144-132-145-175.nsw.bigpond.net.au ([144.132.145.175] helo=fuego.linuxaus.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LY0k-0001k4-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 00:40:14 +0100
Received: from beamer.servat.com (beamer.servat.com [192.168.1.6])
	by fuego.linuxaus.com (Postfix) with ESMTP id 95B2E82BA
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 09:40:09 +1000 (EST)
Subject: Trying to boot linux off a 2MiB M-Sys DoC2000 chip
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-g5NpPqoX3JecIgxrQrwU"
Date: 22 Jun 2002 09:40:09 +1000
Message-Id: <1024702809.32427.8.camel@beamer.servat.com>
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

--=-g5NpPqoX3JecIgxrQrwU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

For the last couple of weeks I've been getting closer and closer to
booting a kernel from my 2MiB DoC. :)

I managed to get grub installed onto the DoC yesterday (very exciting
stuff), and I have a ext2 partition (about 1.8MiB in size)

My question is, how do I configure grub to know how to boot off the DoC?
I can get it to boot off an IDE HDD (root hd(0,0); kernel /boot/bzImage;
boot) but how would grub know how to access the DoC's kernel?

Would doc-lilo be a better alternative?

Thanks in advance for any help!

Regards,

Gonzalo.



--=-g5NpPqoX3JecIgxrQrwU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9E7lZvTbSWKMx8O4RAtiCAKCjyMOAWRrbjbZyJaWwtaXuBlQ9iQCgzS8R
+yD2iH1rhj9Lw/7xKrhpZws=
=7xig
-----END PGP SIGNATURE-----

--=-g5NpPqoX3JecIgxrQrwU--
