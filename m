Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Kh9R-0006QV-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 16:13:41 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g5JFDeV06450
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 11:13:40 -0400
Received: from [10.0.0.20] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 17Kh9P-0003Xe-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 11:13:40 -0400
Subject: Problems unlinking files
From: Chris AtLee <catlee@canada.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-LjXStSukzdh4/OYc7li4"
Date: 19 Jun 2002 11:13:39 -0400
Message-Id: <1024499619.9366.25.camel@geb>
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

--=-LjXStSukzdh4/OYc7li4
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've noticed some problems with unlinking files with JFFS2 in my linux
2.2.18 port.  After unlinking a file, it doesn't appear in the directory
listing, but if I do an 'ls' on the unlinked file, I can still get
information on the file.  I can still read and write to the file, but it
refuses to show up in the directory listing. After I unmount the JFFS2
partition and remount it the file isn't there at all.

Any ideas?  I'm sure I must have deleted something important getting
everything working with linux 2.2.18.

Thanks,
Chris

--=-LjXStSukzdh4/OYc7li4
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9EJ+joOgacgDd/cQRAhKYAJ4+MNJtf6AgX/0mWGXI2IKThAxBVACeJAdc
fp90Q4fLpFIo1beawwSYxZc=
=sAdA
-----END PGP SIGNATURE-----

--=-LjXStSukzdh4/OYc7li4--
