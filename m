Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKSUW-0007X5-7O
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 17:19:18 +0000
Date: Thu, 30 Nov 2017 18:18:47 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171130181847.0bbc58b5@xps13>
In-Reply-To: <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
 <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean,

+Boris (NAND maintainer).

> >> Yes, but i don't think the arbiter have any affect in the nand
> >> controller. Bit 12 in NDCR register is marked reserved in the
> >> datasheet. =20
> > Be careful with that. I recently enabled 64-bit platforms featuring
> > this NAND controller. After hours of digging because it was not
> > working, I set this bit by adding this property like in any other
> > device tree and it worked. I am not telling that it will solve your
> > issue, mostly not, but this is something you should be careful
> > about. =20
> I have tried with arbiter enabled, no different behaviour observed.

Ok.

> >>>> (I only see the timeouts if I remove the nand-on-flash-bbt) =20
> >>> The nand-on-flash-bbt will read some of the last pages in you NAND
> >>> chip where a bad block table is supposed to be and derive from
> >>> that whether a block is bad or not. So this does only one read. I
> >>> guess you should have at least one timeout there? =20
> >> Maybe, but the flash is fine we are running a rootfs in the NAND
> >> chip. =20
> > So you can safely use the content of the NAND chip? Without any
> > timeout neither with reads nor writes? Can you try the mtd-utils
> > from [5]: nanddump/nandwrite or nandpagetest?
> >
> > Also, can you isolate the line that produces the timeouts?
> >
> > [5]http://www.linux-mtd.infradead.org/ =20
> Yes the NAND chip is working fine and stores our data.
>=20
> It is the command NAND_CMD_READOOB that causes it to timeout.

Ok, I had a look at the nand_cmdfunc() function which is, I suppose,
the one that is in use (because you are using 2k pages) but I could
not see anything obvious. Is your setup special in some way?

Could you enable dynamic debug by adding "#define DEBUG" *before* all
#includes at the top of the pxa3xx_nand.c driver? It should display all
register accesses. Also, can you read the content of NDCR and NDSR when
it timeouts?

Thanks,
Miqu=C3=A8l
