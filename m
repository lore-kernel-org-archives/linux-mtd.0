Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch3Mm-0005g5-5w
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 05:05:13 -0500
To: =?iso-8859-1?q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
References: <20041221210916.00C8CA00096@mail.murgatroid.com>
	<m33bxzvyl7.fsf@maxwell.lnxi.com>
	<20041222085921.GA31282@wohnheim.fh-wedel.de>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 22 Dec 2004 03:05:06 -0700
In-Reply-To: <20041222085921.GA31282@wohnheim.fh-wedel.de>
Message-ID: <m3y8fqtzql.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: Christopher Hoover <ch@murgatroid.com>,
	'Linux MTD' <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@wohnheim.fh-wedel.de> writes:

> On Tue, 21 December 2004 19:47:00 -0700, Eric W. Biederman wrote:
> > jffs2 is only a solution on large NOR flash parts.
>=20
> True.  I've been meaning to scale jffs2 down, but never found the
> time.

I keep trying to scale my flash chips up but that is non-trivial
on commodity motherboards :)

Until jffs2 is an effective solution on the very small flash
parts there will be a use for variable size flash blocks.

The flash parts I typically work with are 256KiB to 1MiB.
Usually with most blocks at 64KiB, although some variants have 4KiB
blocks.

On a 4KiB flash I could probably afford to not use a spare flash block
or two.   For the common case of 64KiB I don't see how I could leave
an entire flash block unused.  Which is the very hard part of scaling
jffs2 down to the tiniest systems.

> The other way around, blockmtd.c.  Which is a cleaned up version of
> blkmtd.c.  It turns a block device into an mtd device, not vice versa.
> Name is confusing, so if you have a better one...

block2mtd ?

> Both emulations have valid uses:

Agreed.

> > > > 5 does, but is horribly ugly and noone cares enough to clean it up.=
=20
> >=20
> > If it ain't broke don't fix it.  Besides I have trouble seeing how 500 =
lines
> > of code can be horribly ugly.=20=20
>=20
> o read-only devices that confuse every single new user

Agreed.  The read-only devices are silly.

> o #define MAX_KMALLOC_SIZE 0x20000
> o FIXME: This _really_ needs to die. In 2.5, we should ...

I see more problems with where the code wanted to go, as indicated
by those comments than with where the code is now.  Probably
allocating a single buffer page and calling down into the mtd device
layer multiple times.  I have trouble seeing the benefit
of making it a zero copy interface.

But none of this counts as horribly ugly in my book.  Just
warts that may benefit from being cleaned up.

Some of the current IB stacks count get a lot closer to horribly ugly.
Several hundred lines of global variables in one file I count horribly
ugly.  At 500 lines I can see ugly code, but it is hard to write
something that is a disaster that is that small.  The obfuscated C
contest shows you can do it but we certainly don't have that.

> >=20
> > If Christopher is reading this right I agree that killing variable
> > erase sizes across the board is a very bad idea.
>=20
> He isn't.
>=20
> To finally lift all the confusion:
> This is about the blockmtd driver, nothing else.  Said driver takes a
> block device and turns it into an mtd.  And for an bd-based mtd, there
> is _no_ point in having complicated erase regions.
>=20
> For regular flash, I consider them to be silly as well, but there are
> so many silly things that people like.  Let them have fun, as long as
> noone gets hurt.

Agreed.

So have your fun with block2mtd and I won't worry about it.

Eric
