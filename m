Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8c1u-0005ei-Bp
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2005 05:33:35 -0500
From: Gareth Bult <gareth@linux.co.uk>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050307224238.GH26318@wohnheim.fh-wedel.de>
References: <1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<20050307210745.GD26318@wohnheim.fh-wedel.de>
	<1110231980.11310.40.camel@squizzey.bult.co.uk>
	<20050307220138.GF26318@wohnheim.fh-wedel.de>
	<1110234038.11284.62.camel@squizzey.bult.co.uk>
	<20050307224238.GH26318@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 08 Mar 2005 10:33:31 +0000
Message-Id: <1110278011.11697.17.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mmm,=20

would make a lot of sense.

At the end of the day and at the moment, I'm probably the only one using
the new driver so it's really not an issue .. I was really just talking
about "good form" when releasing updates ..

Gareth.

On Mon, 2005-03-07 at 23:42 +0100, J=F6rn Engel wrote:
> On Mon, 7 March 2005 22:20:38 +0000, Gareth Bult wrote:
> >=20
> > > The old driver also got the interface wrong.  In your example, with
> > > just a single device to use, it doesn't matter.  But once you deal
> > > with several devices, the old variant really sucks.  That is why I
> > > changed it (and why I renamed the driver).
> >=20
> > If you were to change the parameter name back to "device", it would b=
e
> > compatible with the old driver. (pretty much) Hence you'd not need to
> > change the name (?)
>=20
> That would work for 99% of all users - those that only use a single
> device and no other parameters like erase size.  For the remaining 1%,
> I don't want to break anything, so the different name should remain.
>=20
> What I could do is introduce a new config option, like
> CONFIG_RENAME_BLOCK2MTD_TO_BLKMTD.  With the option set, the driver
> also accepts the "device" parameter and the kernel module is renamed.
>=20
> Would this work for you?
>=20
> J=F6rn
>=20
--
Linux.co.uk - promoting open source software in the UK
"If you have an apple and I have an apple and we exchange apples then
you and I will still each have one apple. But if you have an idea and I
have an idea and we exchange these ideas, then each of us will have two
ideas." - George Bernard Shaw
