Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HyWSc-0008M4-Q1
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 13:16:48 -0400
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20070613142926.GB24502@lazybastard.org>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
	<1181735052.7065.57.camel@zod.rchland.ibm.com>
	<1181735301.30670.277.camel@gentoo-jocke.transmode.se>
	<20070613115445.GA24502@lazybastard.org>
	<1181741378.30670.293.camel@gentoo-jocke.transmode.se>
	<20070613142926.GB24502@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jun 2007 19:16:31 +0200
Message-Id: <1181754991.30670.325.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-13 at 16:29 +0200, J=C3=B6rn Engel wrote:
> [ Putting David on Cc:.  This is a bug report for JFFS2 ]
>=20
> On Wed, 13 June 2007 15:29:38 +0200, Joakim Tjernlund wrote:
> > On Wed, 2007-06-13 at 13:54 +0200, J=C3=B6rn Engel wrote:
> > >=20
> > > In this case you made me wonder.  What is the mtd->sync method suppos=
ed
> > > to accomplish anyway?  mtd->write is synchronous, mtd->erase de-facto
> > > also is.  So it cannot be a sync in the sense of "flush all dirty dat=
a
> > > to flash and don't return before you're finished".  Or can it?
> >=20
> > Yes, this is also my view(for NOR flash, NAND is diffrent).
> > mtd->erase can be suspended though, but it doesn't matter
> > in this case. However, I don't know enough to be 100% sure
>=20
> At the very least that method needs better documentation than:
> 	/* Sync */
> 	void (*sync) (struct mtd_info *mtd);
>=20
> I can see two sane alternatives.
>=20
> /*
>  * An MTD driver may return from mtd->write() calls before the data has
>  * safely been written to the medium.  Any amount of dirty data may be
>  * cached by either the driver or the device.  If a filesystem depends
>  * on the data being safely on the medium, it has to explicitly call
>  * mtd->sync().
>  */
>=20
> /*
>  * Mtd->write() and mtd->erase() methods may only return if the data has
>  * been safely written to the device.  Special care needs to be taken
>  * for devices that support caching.
>  */
>=20
> My tendency is to favor the first variant.=20

   Me too.

>  Block2mtd already implements
> it.  And if we went for variant two, mtd->sync() would be pointless and
> should get removed.
>=20
> Now to the bug report:
> JFFS2 must call mtd->sync() for its various sync routines.  If mounted
> with -o sync or for files opened with O_SYNC, it has to call that after
> every write.  If nothing else, it is currently broken on block2mtd.

Sure, but for NOR flash this sync can be a NOP, right?

 Jocke
