Received: from asav1.lyse.net ([213.167.96.68])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAn0I-0001pf-R4
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 07:13:44 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050901100535.GA30932@wohnheim.fh-wedel.de>
References: <1125480492.18626.42.camel@localhost.localdomain><20050901100535
	.GA30932@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset=ISO-8859-1
Date: Thu, 01 Sep 2005 13:12:56 +0200
Message-Id: <1125573176.30825.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > 	/* When do we let the GC thread run in the background */
> > =20
> > 	c->resv_blocks_gctrigger =3D c->resv_blocks_write + 1;
>=20
> Minor stuff: You indentation is broken.

Will fix of course. What emacs mode should I use for indentation? :-)

> If you changed the patch to add a mount option for the WORM case and
> check for the mount option instead, this might go in.  Looks like it
> could be useful.

I prefer it the way it is now. There are less options to read up on and
document.

W.r.t. documentation it would possibly call for a footnote that the
JFFS2 disk will only support read/write many times if it is large
enough. If it is too small, it only supports Write Once Read Many.=20

What do you think?


--=20
=D8yvind Harboe
http://www.zylin.com
