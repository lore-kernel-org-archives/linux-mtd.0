Received: from cpe-144-132-147-2.nsw.bigpond.net.au ([144.132.147.2] helo=fuego.linuxaus.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Mr1B-0000QR-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 15:10:05 +0100
Received: from beamer.servat.com (beamer.servat.com [192.168.1.6])
	by fuego.linuxaus.com (Postfix) with ESMTP id 9028F8325
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 00:09:58 +1000 (EST)
Subject: OpenSSH/OpenSSL is too big... any alternatives?
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-xnaIps8yIY0J2szTmWOh"
Date: 26 Jun 2002 00:09:58 +1000
Message-Id: <1025014199.2220.3.camel@beamer.servat.com>
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

--=-xnaIps8yIY0J2szTmWOh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi All

I have a 2MiB DiskOnChip. After installing the kernel, BusyBox, iptables
and a couple of libs from uClibc I only have 400k left of space.
OpenSSH needs to link to OpenSSL and OpenSSL is well over 1MB on it's
own. Is there any alternatives to OpenSSL/OpenSSH that will fit on 400k?

Thanks in advance!

Regards,

Gonzalo.



--=-xnaIps8yIY0J2szTmWOh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9GHm2vTbSWKMx8O4RAkOZAJ4tn0esLxEx1Bp7IOGyhrm1OyXW3ACfRNJi
STAuqC3VdYdxIDNVWczs0Fs=
=oyzy
-----END PGP SIGNATURE-----

--=-xnaIps8yIY0J2szTmWOh--
