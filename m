Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KKvB-0004nb-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 16:29:29 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g5IFTSV11929
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 11:29:28 -0400
Received: from [10.0.0.20] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 17KKv9-00038L-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 11:29:27 -0400
Subject: JFFS & MTDBLOCK
From: Chris AtLee <catlee@canada.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-/j0GPjdIqrF0dTar/TgO"
Date: 18 Jun 2002 11:29:27 -0400
Message-Id: <1024414167.9366.9.camel@geb>
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

--=-/j0GPjdIqrF0dTar/TgO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Just re-reading the mtd-jffs HOWTO to see if I can glean any additional
information from it and I noticed the paragraphs that read,

"You must use (for all practical purposes that involve writing) JFFS on
raw flash MTD devices. This is because JFFS provides a robust writing
and wear leveling mechanism. See FAQ for more info.

If you only want the file-system to be writable while you're developing,
but will ship the units read-only, it's acceptable to use the MTDBLOCK=20
device, which performs writes by reading the entire erase block, erasing
it, changing the range of bytes which were written to, and writes it
back to the flash. Obviously that's not something you want happening in
production, but for development it's OK."

I'm not sure that I understand what this means...

Does it mean that for production units where you want the filesystem to
be writeable you should use JFFS on a non-MTDBLOCK device?

Or does it mean that using a filesystem other than JFFS for writing to a
MTDBLOCK device is probably a bad idea?

Thanks,
Chris




--=-/j0GPjdIqrF0dTar/TgO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9D1HXoOgacgDd/cQRApDyAJ9n4jCsc/okKy9RKQkVQdn7SPhHggCgyJNL
zr4xYILSZDCmazbFOtvQLG4=
=92FN
-----END PGP SIGNATURE-----

--=-/j0GPjdIqrF0dTar/TgO--
