Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I13Ix-00074e-7q
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 12:45:19 -0400
Subject: Re: sync() takes minutes while erasing
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20070620162950.GB1789@lazybastard.org>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
	<1182350992.2969.128.camel@gentoo-jocke.transmode.se>
	<1182355744.14977.41.camel@weaponx.rchland.ibm.com>
	<1182356796.2969.140.camel@gentoo-jocke.transmode.se>
	<20070620162950.GB1789@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Jun 2007 18:45:13 +0200
Message-Id: <1182357913.2969.145.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-20 at 18:29 +0200, J=C3=B6rn Engel wrote:
> On Wed, 20 June 2007 18:26:36 +0200, Joakim Tjernlund wrote:
> > On Wed, 2007-06-20 at 11:09 -0500, Josh Boyer wrote:
> > >=20
> > > jffs2_write_super is called during unmount.  If there are blocks pend=
ing
> > > on the erase list, it's better to erase those now before the unmount =
is
> > > completed.  Saves some time on the next mount.
> >=20
> > No, not if the reboot/unmont is suspended for minutes just because jffs=
2
> > wants to finish erasing. It doesn't save you much, if anything, at
> > remount either.
> >=20
> > The erasing in context is just something that needs to be done at some
> > point but it don't have to happen now.
>=20
> In case you need an example:
>=20
> $ flash_eraseall /dev/mtd0
> $ time mount mtd0 /mnt -t jffs2
> $ time umount /mnt
>=20
> Depending on device size, this will take some seconds for mount and some
> minutes for umount.  Spending minutes to save some seconds on next mount
> hardly sounds sensible.
>=20
> J=C3=B6rn

Exactly,=20
David where are you? You havn't been active for a long time.
Is there any reason to keep as is?

 Jocke
