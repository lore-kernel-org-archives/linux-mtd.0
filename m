Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HSHZ-0006gh-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jun 2002 17:44:41 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g5AGidN01698
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jun 2002 12:44:39 -0400
Received: from [10.0.0.20] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 17HSHX-00069w-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jun 2002 12:44:39 -0400
Subject: JFFS2 on 2.2.18
From: Chris AtLee <catlee@canada.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-Oq02ZFX2ky+EKkg+eREg"
Date: 10 Jun 2002 12:44:38 -0400
Message-Id: <1023727479.20089.26.camel@geb>
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

--=-Oq02ZFX2ky+EKkg+eREg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I've had some success getting MTD and JFFS (v1) working on my 2.2.18
system.  I've been trying over the past few weeks to get JFFS2 up and
running.  I've got it to the point where the kernel can read a jffs2
partition, but I really have no idea how to get writing to work.  The
mechanism for writing seems completely different in 2.2.x than in 2.4.x

Any pointers?  Is anyone else working on this?

Cheers,
Chris



--=-Oq02ZFX2ky+EKkg+eREg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9BNd2oOgacgDd/cQRAkENAKCjcckiPgrdPA3JtJsRl7dQyVo+PQCeL7oj
FeLbBB83qpQvIgpJ8kfwIWo=
=GIGc
-----END PGP SIGNATURE-----

--=-Oq02ZFX2ky+EKkg+eREg--
