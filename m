Date: Wed, 12 Jan 2005 18:45:58 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112184304.GM25638@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501121844300.12973@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501121833250.10617@phoenix.infradead.org>
	<20050112184304.GM25638@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

On Wed, 12 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Wed, 12 January 2005 18:33:33 +0000, Artem B. Bityuckiy wrote:
> >
> > Hmm. I think about the intermediate stage. I mean that block is good at=
=20
> > one moment, and it is bad at another moment. But *when* it become bad? =
Is=20
> > this only during erase? If so, you're probably right. But I'm not sure.=
 Is=20
> > there some stage when block still contain crucial data, but is already=
=20
> > bad? If it is, CRC will cach this.
>=20
> According to the paper, all but soft errors only occur during erase
> and write.  So we're safe ...
>=20
> ... or Toshiba lied to us.
>=20
Still not sure. This is not standed explicitly...
To be honest, I would be happy if you are right - this would simplify=20
things.

> J=F6rn
>=20
> --=20
> The only real mistake is the one from which we learn nothing.
> -- John Powell
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
