Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HyZPl-0001T1-A1
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 16:26:04 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'Jörn Engel'" <joern@logfs.org>
Subject: RE: [PATCH] Fix hanging close for /dev/mtd
Date: Wed, 13 Jun 2007 22:25:54 +0200
Message-ID: <018401c7adf9$0b396040$0e67a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20070613175831.GC24502@lazybastard.org>
Cc: 'David Woodhouse' <dwmw2@infradead.org>,
	'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: J=F6rn Engel [mailto:joern@logfs.org]=20
> Sent: den 13 juni 2007 19:59
> To: Joakim Tjernlund
> Cc: J=F6rn Engel; Linux MTD mailing list; David Woodhouse
> Subject: Re: [PATCH] Fix hanging close for /dev/mtd
>=20
> On Wed, 13 June 2007 19:16:31 +0200, Joakim Tjernlund wrote:
> > >=20
> > > I can see two sane alternatives.
> > >=20
> > > /*
> > >  * An MTD driver may return from mtd->write() calls=20
> before the data has
> > >  * safely been written to the medium.  Any amount of=20
> dirty data may be
> > >  * cached by either the driver or the device.  If a=20
> filesystem depends
> > >  * on the data being safely on the medium, it has to=20
> explicitly call
> > >  * mtd->sync().
> > >  */
> > >=20
> > > /*
> > >  * Mtd->write() and mtd->erase() methods may only return=20
> if the data has
> > >  * been safely written to the device.  Special care needs=20
> to be taken
> > >  * for devices that support caching.
> > >  */
> > >=20
> > > My tendency is to favor the first variant.=20
> >=20
> >    Me too.
> >=20
> > >  Block2mtd already implements
> > > it.  And if we went for variant two, mtd->sync() would be=20
> pointless and
> > > should get removed.
> > >=20
> > > Now to the bug report:
> > > JFFS2 must call mtd->sync() for its various sync=20
> routines.  If mounted
> > > with -o sync or for files opened with O_SYNC, it has to=20
> call that after
> > > every write.  If nothing else, it is currently broken on=20
> block2mtd.
> >=20
> > Sure, but for NOR flash this sync can be a NOP, right?
>=20
> Actually, no.  After dwmw2 explained things in irc, I finally=20
> understand
> the original meaning of that method.  It is supposed to wait until any
> erase suspend (or program suspend) has finished.  You can view erase
> suspend as a form of caching and erase as a form of writing.

Yes, I see that. Then it will enable writes/erases again.

>=20
> If we wanted to avoid the cost without paying in reliability, we could
> add an argument to sync().  Sync(now) would have the current=20
> semantics.
> Sync(five minutes ago) would require that any writes/erases=20
> started more
> than five minutes ago must be safe.  It add quite a bit of complexity,
> though.  Maybe not worth it.

Still don't get what sync will do for you in mtdchar context. All
mtd writes are synchronous and will be in flash without sync. So
what extra function does it get you on NOR flashes?

David, you are most welcome to explain this on the list also and
comment on my latest patches.

 Jocke
