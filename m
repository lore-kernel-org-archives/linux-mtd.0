Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuPJA-0008Ba-S3
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2005 01:08:44 -0500
To: Jared Hulbert <jaredeh@gmail.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
	<6934efce05011214553465438@mail.gmail.com>
	<1105631437.15265.12.camel@weaponx.rchland.ibm.com>
	<6934efce050113103077c06b4d@mail.gmail.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 27 Jan 2005 23:08:36 -0700
In-Reply-To: <6934efce050113103077c06b4d@mail.gmail.com>
Message-ID: <m3651iw0ez.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert <jaredeh@gmail.com> writes:

> > Guess we'll have to agree to disagree then :).  All I know is that I
> > want to be damn sure that the data I'm returning isn't totally screwed.
> > Call me paranoid.  A checksum is the only way I know of doing that.
> 
> Paranoid :)

Only insane programmers are not paranoid.

> To humor those of us willing to take our chances trusting the media
> won't go bad, would it be possible to architect JFFS3 such that
> disabling the checksumming or stripping it out is possible with out
> too much pain?

But checksums protect against more than the reads going bad.  They
also protect against writes going bad.  With large volumes of use
write errors are almost a certainty, with NOR.  And if you miss the
fact that the error happens.  And a single bad write is especially
painful if you are writing compressed data.

If you just need reads something like romfs, or isofs tuned for from a
NOR flash chip is probably better.

Eric
