Received: from asav1.lyse.net ([213.167.96.68])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAncf-0002mr-Ur
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 07:52:55 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050901114438.GA694@wohnheim.fh-wedel.de>
References: <20050901100535.GA30932@wohnheim.fh-wedel.de><1125573176.30825.1
	7.camel@localhost.localdomain><20050901114438.GA694@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset=ISO-8859-1
Date: Thu, 01 Sep 2005 13:52:35 +0200
Message-Id: <1125575555.4884.9.camel@localhost.localdomain>
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

> > What do you think?
>=20
> I think that most users don't want JFFS2 to run in WORM mode.  And for
> those users, failing on every write is actually better.  They notice
> the problem right away, not just after a while.

But who mounts a *tiny* JFFS2 volume except those that will be using it
as a WORM drive?

This group of users could well be even tinier than those that want WORM
drives.=20

My conclusion:

Make it a WORM drive if it is too small to support read/write many
times.

> People that want WORM mode are the minority and therefore should be
> the ones that are inconvenienced.

I agree with this principle, but my assumptions are different than
yours, hence I'm currently leaning towards a different conclusion.


--=20
=D8yvind Harboe
http://www.zylin.com
