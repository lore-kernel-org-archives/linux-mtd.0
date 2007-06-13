Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HySuq-0006SA-RB
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 09:29:43 -0400
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20070613115445.GA24502@lazybastard.org>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
	<1181735052.7065.57.camel@zod.rchland.ibm.com>
	<1181735301.30670.277.camel@gentoo-jocke.transmode.se>
	<20070613115445.GA24502@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jun 2007 15:29:38 +0200
Message-Id: <1181741378.30670.293.camel@gentoo-jocke.transmode.se>
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

On Wed, 2007-06-13 at 13:54 +0200, J=C3=B6rn Engel wrote:
> On Wed, 13 June 2007 13:48:21 +0200, Joakim Tjernlund wrote:
> > On Wed, 2007-06-13 at 06:44 -0500, Josh Boyer wrote:
> > > On Wed, 2007-06-13 at 11:53 +0200, Joakim Tjernlund wrote:
> > > > Figured I should send this on its own.
> > > >=20
> > > > Stracing a process using /dev/mtd shows that
> > > > it sometimes hangs for a long time when pdflush is erasing
> > > > sectors. /dev/mtd* close method calls the mtd->sync method
> > > > which can hang for a long time(minutes).
> > > >=20
> > > > Futher, the sync method "syncs" all flash chips. It should
> > > > only sync the chips that a /dev/mtd* spans.
> > > > Also, the mtdchar/mtdblock drivers does not need to
> > > > call sync for readonly mappings.
> > >=20
> > > So were you going to submit a separate patch for those issues?
> >=20
> > Wow, someone is reading my mails :)
>=20
> I read most of them.
>=20
> In this case you made me wonder.  What is the mtd->sync method supposed
> to accomplish anyway?  mtd->write is synchronous, mtd->erase de-facto
> also is.  So it cannot be a sync in the sense of "flush all dirty data
> to flash and don't return before you're finished".  Or can it?
>=20
> J=C3=B6rn

Yes, this is also my view(for NOR flash, NAND is diffrent).
mtd->erase can be suspended though, but it doesn't matter
in this case. However, I don't know enough to be 100% sure

 Jocke
