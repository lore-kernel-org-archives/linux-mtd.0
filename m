Date: Wed, 19 Jan 2005 15:27:53 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050119152427.GB26711@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
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

> On Wed, 19 January 2005 13:07:39 +0000, Artem B. Bityuckiy wrote:
> > On Tue, 18 Jan 2005, Joakim Tjernlund wrote:
> >=20
> > > Another idea is to calculate the checksum while reading/writing(much =
like
> > > the networking code does). That would probably require support from t=
he MTD layer
> > > and that the checksum is stored at the end of the JFFS3 node.
> > Hmm. How to do this? In case of NAND we issue=20
> > read command and provide buffer, and it is up to driver/hw how to read.=
=20
> > One may use DMA.
>=20
> Something like this?
>=20
> int jffs3_write_with_checksum(void *data, ...)
> {
> =09...
> =09if (mtd->write_with_checksum)
> =09=09return mtd->write_with_checksum(data, ...);
> =09mtd->write(data, ...);
> =09mtd->write(checksum(data), ...);
> }
>=20
> J=F6rn
Can't get it - What is the goal? Some advandages?

>=20
> --=20
> Data dominates. If you've chosen the right data structures and organized
> things well, the algorithms will almost always be self-evident. Data
> structures, not algorithms, are central to programming.
> -- Rob Pike
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
