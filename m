Date: Wed, 22 Dec 2004 16:17:00 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041222160942.GC9783@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
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

On Wed, 22 Dec 2004, [iso-8859-1] J=F6rn Engel wrote:

> On Wed, 22 December 2004 15:56:23 +0000, Artem B. Bityuckiy wrote:
> >=20
> > Preliminarily I'm planning:
> > 1. Use adler32 on headers
> > 2. Leave crc32 on data
>=20
> Why keep crc32?
This is just my IMHO: headers are small and the probability that serious=20
error appear there is lower that the probability of error on data. So it=20
seems we may reduce crc strength for them.

In case of data - I just not sure if it is correct to use weaker=20
algorithm...=20
If somebody compitent may soundly explain why we may reduce CRC strength=20
there...

Anyway, saing zlib not to add adler32 CRC is good idea and I think should=
=20
be done.
=20
> J=F6rn
>=20
> --=20
> Debugging is twice as hard as writing the code in the first place.
> Therefore, if you write the code as cleverly as possible, you are,
> by definition, not smart enough to debug it.
> -- Brian W. Kernighan
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
