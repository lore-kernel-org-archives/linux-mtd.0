Date: Sat, 18 Dec 2004 12:23:26 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041217112000.GB10973@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0412181221370.20375@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEGEHCCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
	<20041217112000.GB10973@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Dec 2004, [iso-8859-1] J=F6rn Engel wrote:

> On Fri, 17 December 2004 10:56:22 +0000, Artem B. Bityuckiy wrote:
> >=20
> > > Another idea, calculate the CRC backwards(from the end of the buffer =
to the beginning).
> > > That give better L1 cache behaviour.
> > >
> > Why (may be some URL)? For all archs?=20
>=20
> Sounds rather odd indeed.  Most CPUs I know about either have no
> hardware-prefetch, can only prefetch forward or can prefetch both
> forward and backward.  In either case, calculating the CRC backward
> should either be the same speed or slower than going forward.
>=20
> But I like to learn something new.
Hmm, I'm curious and exploring that too. Take a glimps at=20
http://gcc.gnu.org/projects/prefetch.html
There are some useful references there.

>=20
> J=F6rn
>=20
> --=20
> I've never met a human being who would want to read 17,000 pages of
> documentation, and if there was, I'd kill him to get him out of the
> gene pool.
> -- Joseph Costello
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
