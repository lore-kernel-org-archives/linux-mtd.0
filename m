Date: Wed, 22 Dec 2004 16:46:24 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEKEKMCPAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.58.0412221646090.30689@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEKEKMCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Dec 2004, Joakim Tjernlund wrote:

> > On Wed, 22 Dec 2004, [iso-8859-1] J=F6rn Engel wrote:
> >
> > > On Wed, 22 December 2004 15:56:23 +0000, Artem B. Bityuckiy wrote:
> > > >
> > > > Preliminarily I'm planning:
> > > > 1. Use adler32 on headers
> > > > 2. Leave crc32 on data
> > >
> > > Why keep crc32?
> > This is just my IMHO: headers are small and the probability that seriou=
s
> > error appear there is lower that the probability of error on data. So i=
t
> > seems we may reduce crc strength for them.
>=20
> Maybe, but it is the data CRC that costs. I don't think you will notice
> the difference if you just change the header CRC to Adler32.
True...
>=20
> >
> > In case of data - I just not sure if it is correct to use weaker
> > algorithm...
> > If somebody compitent may soundly explain why we may reduce CRC strengt=
h
> > there...
> >
> > Anyway, saing zlib not to add adler32 CRC is good idea and I think shou=
ld
> > be done.
>=20
> Yes, that one is independant of what CRC algorithm we choose.
>=20
>  Jocke
>=20
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
