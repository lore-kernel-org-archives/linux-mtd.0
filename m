Date: Wed, 19 Jan 2005 15:51:14 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050119153233.GD26711@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501191537440.8174@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
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

On Wed, 19 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Wed, 19 January 2005 15:27:53 +0000, Artem B. Bityuckiy wrote:
> > >=20
> > > Something like this?
> > >=20
> > > int jffs3_write_with_checksum(void *data, ...)
> > > {
> > > =09...
> > > =09if (mtd->write_with_checksum)
> > > =09=09return mtd->write_with_checksum(data, ...);
> > > =09mtd->write(data, ...);
> > > =09mtd->write(checksum(data), ...);
> > > }
> > >=20
> > > J=F6rn
> > Can't get it - What is the goal? Some advandages?
>=20
> As you explained, Joakim's proposal doesn't always make sense.
> Basically, if the underlying drives uses DMA, there is no point.  If
> it does memcpy(), then it's faster to checksum/copy in a single loop,
> rather than do both things individually.
>=20
> With the above code, an mtd driver can supply a converged
> checksum/copy method, but doesn't have to.  If it doesn't, we do
> regular copy (through mtd->write) and checksum instead.
>=20
Hmm. Don't know if this good.

In case of network CRCs are always needed and the algorithm is the same.

In our case MTD is not dedicated to JFFS2. It is consceptually wrong to=20
implement this on MTD layer. This implies one more operation to drivers...=
=20
And then one may want to use another checksum algorith.... Implement yet=20
another operation? Doubts... (even understanding that this may lead to=20
better performance...). Thinking more needed.

> J=F6rn
>=20
> --=20
> The wise man seeks everything in himself; the ignorant man tries to get
> everything from somebody else.
> -- unknown
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
