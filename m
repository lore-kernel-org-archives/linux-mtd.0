From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
	<20070307143414.GA16439@lazybastard.org>
	<45F11641.1010507@nokia.com>
Subject: RE: Does mtd support two-plane page program for nand flash?
Date: Fri, 9 Mar 2007 17:37:17 +0900
Message-ID: <00ac01c76226$2860f2b0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-reply-to: <45F11641.1010507@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>=20
> ext J=C3=B6rn Engel wrote:
> > On Wed, 7 March 2007 14:57:02 +0800, falls huang wrote:
> >>     AFAIK , the samsung's nand flash=20
> K9LAG08U0M/K9HBG08U1M/K9MCG08U5M=20
> >> support two-plane page program. For example: The K9LAG08U0M is=20
> >> arranged in four 4Gb memory planes.Each plane contains=20
> 2,048 blocks=20
> >> and 2112 byte page registers. This allows it to perform=20
> simultaneous=20
> >> page program and block erase by selecting one page or=20
> block from each=20
> >> plane. ( refer to the datasheet of K9LAG08U0M)
> >=20
> > Interesting.  I was wondering when devices like this would show up.
> > Do you have a spec for those chips?

NAND: There are also 512B 4-plane and 2KB 4-plane

>=20
> OneNAND DDP does this too (google: onenand "2x program")
>=20
> I presume the possibility exists to have the driver pretend=20
> that the page size is twice as large and there are half as=20
> many erase blocks.
> It would have to map the addressses accordingly - and=20
> everything else would have to be willing to accept a 4KiB=20
> page with 8 subpages and 128 bytes of oob.
>=20

In my understand, If we use the 2x program, we assume physical 2 blcoks =
to logical 1 block in JFFS2 or others.
Since "2x program" writes each bufferram to each block instead of same =
block.
So if we assume 4KiB page, we programe block 0, page 0 and block 1, page =
0, In my opinion, it's not fit for JFFS2.

Thank you,
Kyungmin Park
