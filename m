Received: from ptb-relay01.plus.net ([212.159.14.212])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8IOD-0005Fw-7t
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 08:35:18 -0500
From: Gareth Bult <gareth@linux.co.uk>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050307110413.GD2198@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 07 Mar 2005 13:06:56 +0000
Message-Id: <1110200816.11535.15.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ahh, right, that makes sense.

I re-write a driver so it works properly.

You clean up all the code I've written to the extent that it no longer
works. (was it 22 different patches?)

Code gets submitted to kernel (obviously without testing) and ends up in
the live tree as broken code.

And it it's "my" fault for not checking and fixing all YOUR changes ?!

Right.

Why am I mailing you now?

Well, firstly I have in interest in the integrity of the kernel tree -
I've been working with it and on it since 1991. Secondly, you inserted
my name into your broken code - I do not appreciate this.

What would I like, I would suggest one of;

a.    Fix your changes, TEST, and re-submit to the kernel tree
or
b.    Remove the new driver from the kernel tree

Either way, I would appreciate it greatly if you would remove my name
from your work.

Incidentally, there's nothing wrong with my memory (yet) and I'm still
not interested in working on the mtd driver for exactly the same reasons
as previously mentioned.

Many thanks,
Gareth.


On Mon, 2005-03-07 at 12:04 +0100, J=F6rn Engel wrote:
> On Sat, 5 March 2005 17:26:09 +0000, Gareth Bult wrote:
> >=20
> > A little while back I re-wrote blkmtd.c effectively to provide proper
> > "write" access to jffs2 filesystems mounted on standard Linux block
> > devices.
> >=20
> > The driver seems to have worked well (for me) and after many thousand=
s
> > of downloads of FlashLinux, I've not had any reports of JFFS2 problem=
s
> > or corruption.
> >=20
> > It appears that someone has "cleaned up" this driver and it now appea=
rs
> > as an option in the standard kernel tree for 2.6.11.
> >=20
> > Unfortunately it doesn't appear to work. As soon as you mount a JFFS2
> > filesystem on it and try to write data, corruption sets in resulting =
is
> > a fairly sharp system crash.
> >=20
> > Copying back the source from the original driver I submitted to this
> > list and recompiling the kernel (with a one line change) appears to
> > yield a working system again.
> >=20
> > So, two questions;
> > a.	Did anyone actually test the code after cleaning it up?
> > b.	Were there any life changing improvements that I really
> > 	*need* to make to the original code?
>=20
> Gareth, check your archives.
>=20
> I sent the whole list of cleanup patches to you, you could have simply
> tested them in order and told me which one broke.  Instead you got
> pissed at dwmw2 since he didn't accept your broken mails and
> explicitly told me various times, you didn't care about the driver.
>=20
> The fact that you don't remember me, you don't remember being on Cc:
> when I sent patches to Andrew Morton and now come running back is more
> than a little disturbing to me.  Va snpg, V nz frireyl cvffrq ng lbh!
>=20
> So can we pretty please both swallow our feelings and work
> constructively together?  Or should I merely treat this mail as a bug
> report, go fix it, remove every single line of your code from the
> driver and remove your name afterwards?  Both are valid options, you
> choose.
>=20
> J=F6rn
>=20
--
Linux.co.uk - promoting open source software in the UK
"If you have an apple and I have an apple and we exchange apples then
you and I will still each have one apple. But if you have an idea and I
have an idea and we exchange these ideas, then each of us will have two
ideas." - George Bernard Shaw
