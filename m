Received: from asav1.lyse.net ([213.167.96.68])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAomX-0004eR-PB
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 09:07:16 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050901125707.GA1623@wohnheim.fh-wedel.de>
References: <20050901120030.GB694@wohnheim.fh-wedel.de><1125578756.4884.10.c
	amel@localhost.localdomain><20050901125707.GA1623@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset=ISO-8859-1
Date: Thu, 01 Sep 2005 15:06:50 +0200
Message-Id: <1125580010.4884.14.camel@localhost.localdomain>
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

> > If I get some indication that there is a consensus from
> > maintainers/committers to add this mount option, I'll go ahead and writ=
e
> > it up.
>=20
> You're asking for too much. :)
>=20
> Most of the time, most people just don't care.  If they actually do
> care and are opposed to your patch, they will speak up.  But you won't
> ever find out before actively trying to merge the patch.

I guess. I'll set aside some time to read up on the mount options for
JFFS2(incidentally I'm using JFFS2 for eCos) and put together a properly
indented & commented patch.

Thanks for the feedback btw, hopefully this will work out.




--=20
=D8yvind Harboe
http://www.zylin.com
