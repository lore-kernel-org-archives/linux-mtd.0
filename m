Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgwWo-0003Hh-JM
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 21:47:08 -0500
To: "Christopher Hoover" <ch@murgatroid.com>
References: <20041221210916.00C8CA00096@mail.murgatroid.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 21 Dec 2004 19:47:00 -0700
In-Reply-To: <20041221210916.00C8CA00096@mail.murgatroid.com>
Message-ID: <m33bxzvyl7.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: 'Linux, MTD' <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Christopher Hoover" <ch@murgatroid.com> writes:

> >From J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de] -=20
> > On Tue, 21 December 2004 10:42:07 -0800, Christopher Hoover wrote:
> > > >From J=F6rn Engel -
> > > > I see absolutely no reason for complicated erase reagions.  On the
> > > > user side, everyone but mtdchar effectively ignores it anyway.
> > >=20
> > > I don't grok this.   What about flash with variable-sized=20
> > blocks?  (I have a
> > > board with such flash and code that uses eraseregions.)
> >=20
> > Sure, from AMD or some other compatible manufacturer.  The
> > variable-sized blocks were nice until there were better solutions to
> > the problem, like jffs2.  Jffs2 exists, so they are largely useless.

jffs2 is only a solution on large NOR flash parts.

However I find this conversation confusing.  The patches appear to affect
just mtdblock.c.  Which sounds like it is exclusively the mtd block device.
At which point I don't see a problem with simply removing variable erase
size for the silly block device emulation code.

Now if someone wants to remove something silly the block device emulation
sounds like a fine place to start.  Just to place the silliness on the
other foot.
=20
> Intel C3 flash, too.
>=20
> > 5. mtdchar
>=20
> This is an important case.=20=20
>=20
> The reason embedded systems use flash with variable sized blocks is for (=
in
> the small blocks) parameter stores for bootloaders and applications.
>=20
> I've got several deployed systems that use this technique.  I've seen at
> least one other.

> > 5 does, but is horribly ugly and noone cares enough to clean it up.=20

If it ain't broke don't fix it.  Besides I have trouble seeing how 500 lines
of code can be horribly ugly.=20=20
=20
> This is not a reason to toss it.  We don't capriciously break user space
> interfaces in Linux.
>=20
> Also this:
>=20
> 6. The hook that unlocks locked-on-power-up flash, such as (*surprise*) C3
> flash.  It needs to call unlock with the start address of each block.  It
> needs eraseergions to do that.

If Christopher is reading this right I agree that killing variable
erase sizes across the board is a very bad idea.

Eric
