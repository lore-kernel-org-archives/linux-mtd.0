Received: from asav1.lyse.net ([213.167.96.68])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAoSJ-0003iT-Qm
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 08:46:20 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050901120030.GB694@wohnheim.fh-wedel.de>
References: <20050901114438.GA694@wohnheim.fh-wedel.de><1125575555.4884.9.ca
	mel@localhost.localdomain><20050901120030.GB694@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset=ISO-8859-1
Date: Thu, 01 Sep 2005 14:45:56 +0200
Message-Id: <1125578756.4884.10.camel@localhost.localdomain>
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

On Thu, 2005-09-01 at 14:00 +0200, J=F6rn Engel wrote:

> > But who mounts a *tiny* JFFS2 volume except those that will be using it
> > as a WORM drive?
>=20
> People making mistakes.  It is a very important usability issue to
> mark mistakes as such.  Making it appear as if everything is ok and
> having it fail later, possibly days or weeks later, is bad usability.
>=20
> I would agree with you if the user-perceived behaviour was
> *immediatly* and *noticably* different.  But unless people write
> enough data to fill their fs, the difference may go unnoticed.

Sounds good.

If I get some indication that there is a consensus from
maintainers/committers to add this mount option, I'll go ahead and write
it up.


--=20
=D8yvind Harboe
http://www.zylin.com
