Received: from office.ubiquisys.com ([88.96.204.222] helo=ubiquisys.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOVuK-0006vI-Ob
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 11:01:21 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: U-boot and UBI
Date: Thu, 31 Jul 2008 12:01:18 +0100
Message-ID: <094A73044298734FB7D58CAAA319E1D6FEFC5F@UBIQ-SERV1.ubiquisys.local>
In-Reply-To: <4890AC5A.5010803@largestprime.net>
References: <094A73044298734FB7D58CAAA319E1D6FA5EEE@UBIQ-SERV1.ubiquisys.local>
	<4890AC5A.5010803@largestprime.net>
From: "Nigel Hathaway" <Nigel.Hathaway@ubiquisys.com>
To: "Bernard Blackham" <bernard@largestprime.net>
Cc: pgssgp <pradep@gmail.com>, linux-mtd@lists.infradead.org,
	u-boot-users@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernard,

> Nigel Hathaway wrote:
> > Hoping to avoid re-inventing the wheel....
> >=20
> > It would seem that there are a number of people who are
independently
> > porting UBI to U-Boot.
>
> I expressed interest in doing so at the time but nothing happened
about=20
> it unfortunately. I can't speak for anyone else though.
>
> Bernard.

In the short term we've found a way to get round having to UBI and hence
porting it to U-Boot (we have a NOR/NAND combination, and we've gone for
the NAND as entirely jffs2).

However, the next spin of our product will use entirely NAND flash: it
will use an SoC which has an internal ROMboot and can load U-Boot
directly from NAND flash. We will have to go to UBI then (starting
development early 2009).

I have been playing around with a board from Olimex: the SAM9-L9260 (it
has an Atmel AT91SAM9260 on it). This has a ROMboot with U-Boot in NAND
flash. The board I am using has an interesting feature: the block which
U-Boot is configured to use for storing its environment just happens to
be a bad block, so I can't change and store the U-Boot environment
parameters on it.

Either the U-Boot that comes pre-flashed into the board (v1.2.0) is
misconfigured, or that version of U-Boot has failed to take into account
the possibility of the scenario described. Either way, there would
appear to be some work to do to get U-boot up-to-date with Linux MTD
state-of-the-art.

Nigel
