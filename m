Date: Thu, 13 Jan 2005 16:16:35 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050113161302.GD18864@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501131614000.17331@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
	<20050113154037.GC18864@wohnheim.fh-wedel.de>
	<1105631350.26551.204.camel@hades.cambridge.redhat.com>
	<20050113161302.GD18864@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Thu, 13 January 2005 15:49:09 +0000, David Woodhouse wrote:
> > On Thu, 2005-01-13 at 16:40 +0100, J=F6rn Engel wrote:
> > >=20
> > > 2) Last node per erase block is a special endmarker node, similar to
> > >    cleanmarkers.
> > >=20
> > > 3) During unmount, an endmarker is written to the end of all
> > >    partially-filled erase blocks.
> >=20
> > This ties in quite nicely with the checkpointing where such a per-block
> > 'endmarker' would contain a summary of what the mount code would glean
> > by reading through that eraseblock.
>=20
> Sounds like "design makes sense, please send patches". :)
>=20
> Would this also allow us to use adler32/adler32r as checksum
> algorithm?
IMHO:
Keeping CRC at the end still makes sence.

>=20
> J=F6rn
>=20
> --=20
> Write programs that do one thing and do it well. Write programs to work
> together. Write programs to handle text streams, because that is a
> universal interface.=20
> -- Doug MacIlroy
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
