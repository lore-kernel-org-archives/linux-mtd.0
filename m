Date: Thu, 16 Dec 2004 18:42:02 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041216175331.GA6788@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0412161827540.8020@phoenix.infradead.org>
References: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
	<20041216175331.GA6788@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
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

On Thu, 16 Dec 2004, [iso-8859-1] J=F6rn Engel wrote:

And several other aspects:
 For the nodes common header which is only 8 bytes long it is reasonable=20
to use very very simple CRC.
 For the node headers (next after common header, see jffs[23].h) we may=20
possibly try to use crc16 since it is also not very long.
 For direntry node data (name of direntry) which is not longer than 255=20
symbols (at least currently) we may also use crc16 I guess.
 The inode data is <=3D PAGE_SIZE (mostly 4K) may be something more strong.
 Other node's data, like summary or ICP (they not exist yet but I hope are=
=20
going to appear) may have longer length, but anyway, restricted by JFFS2=20
erasable block size. This may be protected by something more strong...

Frankly speaking, I'm not expert in the CRC issues. May be somebody may=20
concieder this issue more formal way, using some criterias, etc... May be=
=20
it is possible to evaluate the probability if CRC "misses" somehow for=20
typical NOR/NAND if we know data leghtes ... ?

> On Thu, 16 December 2004 15:45:00 +0100, Joakim Tjernlund wrote:
> > > On Thu, 16 Dec 2004, Joakim Tjernlund wrote:
> >=20
> > > > 2) Consider another checksum algorithm. Crc32 is very expensive
> > > >    and JFFS2 suffered severely in the early days. Now that crc32 is
> > > >    very optimized that problem is less visible, but crc32 is still
> > > >    expensive. Maybe an Adler32 checksum is good enough or a crc16?
> > > IMHO, NAND/ECC NOR are additionally protected by ECCs so that sounds=
=20
> > > reasonable. NORs are reliable, so that is reasonable too, IMHO.
> >=20
> > Exactly.
>=20
> I'd vote against adler32 and in favor of crc16 or crc24.  Crc24 would
> be slightly safer, but still much faster than crc33 (crc32 is a
> misnamer, actually).
>=20
> Code should be something like this for crc24:
>=20
> u32 crc24(void *m, size_t len)
> {
> =09u32 ret=3D0;
> =09char *s=3Dm;
> =09size_t i;
> =09for (i=3D0; i<len; i++) {
> =09=09ret <<=3D 8;
> =09=09ret +=3D s[i];
> =09=09ret %/ 0xfffffd
> =09}
> =09return ret;
> }
>=20
> Completely untested, written from scratch just now.  But apart from
> the bugs, it should be reasonably fast.
>=20
> J=F6rn
>=20
> --=20
> Fancy algorithms are buggier than simple ones, and they're much harder
> to implement. Use simple algorithms as well as simple data structures.
> -- Rob Pike
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
