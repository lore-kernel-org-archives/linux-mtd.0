Received: from moat.murgatroid.com ([69.17.55.116] helo=mail.murgatroid.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgrFw-0001Qy-0R
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 16:09:21 -0500
From: "Christopher Hoover" <ch@murgatroid.com>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Tue, 21 Dec 2004 13:09:12 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20041221184918.GC10974@wohnheim.fh-wedel.de>
Message-Id: <20041221210916.00C8CA00096@mail.murgatroid.com>
Cc: 'Linux MTD' <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



>From J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de] -=20
> On Tue, 21 December 2004 10:42:07 -0800, Christopher Hoover wrote:
> > >From J=F6rn Engel -
> > > I see absolutely no reason for complicated erase reagions.  On the
> > > user side, everyone but mtdchar effectively ignores it anyway.
> >=20
> > I don't grok this.   What about flash with variable-sized=20
> blocks?  (I have a
> > board with such flash and code that uses eraseregions.)
>=20
> Sure, from AMD or some other compatible manufacturer.  The
> variable-sized blocks were nice until there were better solutions to
> the problem, like jffs2.  Jffs2 exists, so they are largely useless.

Intel C3 flash, too.

> 5. mtdchar

This is an important case. =20

The reason embedded systems use flash with variable sized blocks is for =
(in
the small blocks) parameter stores for bootloaders and applications.

I've got several deployed systems that use this technique.  I've seen at
least one other.


> 5 does, but is horribly ugly and noone cares enough to clean it up.=20

This is not a reason to toss it.  We don't capriciously break user space
interfaces in Linux.

Also this:

6. The hook that unlocks locked-on-power-up flash, such as (*surprise*) =
C3
flash.  It needs to call unlock with the start address of each block.  =
It
needs eraseergions to do that.

-ch
