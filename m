Date: Wed, 12 Jan 2005 18:43:53 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112184059.GL25638@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501121843120.12973@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<1105554479.17853.287.camel@tglx.tec.linutronix.de>
	<20050112184059.GL25638@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Wed, 12 January 2005 19:27:59 +0100, Thomas Gleixner wrote:
> >=20
> > Missing error
> >=20
> > There is another type of error, which came up lately with AND FLASH. If
>                                                            ^^
> You mean NAND, right?
Think AG-AND flashes. I'm not know much about this technology either.=20

>=20
> > you leave a block untouched in a range of blocks and erase/program the
> > surrounding blocks, then the untouched block is likely to have bitflips=
=2E
> > GC likeliness to GC clean blocks from time to time will cover this, but
> > if you have a big number of clean blocks you might get into trouble.
> >=20
> > A strong argument for using seperate partitions for static and dynamic
> > data.
>=20
> Wouldn't that also require a DMZ of some size between static and
> dynamic data?  For example, 4MB static, 1MB unused, rest dynamic?
>=20
> J=F6rn
>=20
> --=20
> If you're willing to restrict the flexibility of your approach,
> you can almost always do something better.
> -- John Carmack
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
