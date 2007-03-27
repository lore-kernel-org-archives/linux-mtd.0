Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWAmH-0006Fh-NI
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 08:27:54 -0400
Subject: Re: [PATCH] Speed up mount for cfi_cmdset_0001 users
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070327115422.GB27290@lazybastard.org>
References: <1174995841.26465.431.camel@gentoo-jocke.transmode.se>
	<1174996173.26465.433.camel@gentoo-jocke.transmode.se>
	<20070327115422.GB27290@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Mar 2007 14:27:52 +0200
Message-Id: <1174998472.26465.438.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-03-27 at 13:54 +0200, J=C3=B6rn Engel wrote:
> On Tue, 27 March 2007 13:49:33 +0200, Joakim Tjernlund wrote:
> > On Tue, 2007-03-27 at 13:44 +0200, Joakim Tjernlund wrote:
> > > This will speed up mount greatly for users of point/unpoint method
> > > like cfi_cmdset_0001. Please Apply.
> > >=20
> > >  Jocke
> >=20
> > Some feedback from the community would not hurt either...
>=20
> JFFS2 mount time on OLPC: ~3300ms

What was the mount time before you applied the patch?

> LogFS mount time on OLPC: ~60ms
>=20
> While your works seems useful, pardon me if I don't care too much about
> JFFS2 anymore. ;)

:) Keep working, hopefully you can do a better GC as well.
Since I only do production system ATM, it will be some time
before I will use LogFS. Does logFS do NAND as well?

 Jocke
