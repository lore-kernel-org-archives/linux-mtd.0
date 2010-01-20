Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXdWX-00033q-9S
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 16:35:21 +0000
Date: Wed, 20 Jan 2010 17:35:09 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Parkinson <parky_dw@ntlworld.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
In-Reply-To: <20100120162303.YKHV13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
Message-ID: <Pine.LNX.4.64.1001201729070.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
	<2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
	<Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
	<20100120162303.YKHV13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 20 Jan 2010, David Parkinson wrote:

> At 14:54 20/01/2010, Ricard Wanderlof wrote:
> >...
> >The end result is that you can't say "if the ECC says it's ok, the data
> >hasn't been corrupted" (which you could with a CRC).
> >...
>
> Apologies for nit-picking (and small digression), but a CRC is no
> guarantee either.  Whilst error correcting codes have additional
> information so that small errors can be corrected both CRCs and ECCs
> work in the same way in detecting likely errors in the communications
> channel.  (It's all maths and statistics....).

You are right of course. Indeed, any mapping of N bits to n bits (where N=
=20
> n) must result in a number of bit patterns for N which map to identical=
=20
bit patterns for n. Still, CRC's used for data checking are designed so=20
that the different bit patterns for N that map to the same n n are=20
reasonably different from each other, so that a CRC is unlikely to show a=
=20
correct result if there has been a 'typical' failure on the channel. At=20
least the ECC algorithm used for mtd has is not intended for that level of=
=20
error detection; it is optimized for correcting single-bit errors.

> A side question here is have the check algorithms been matched to the
> characteristics of the MTDs?  For example a weakish radio signal is
> likely to have errors randomly distributed across the message.  With
> a magnetic disk drive the errors are likely be caused by a blemish on
> the surface and therefore will come in bursts.  Some algorithms will
> be better than others in the respective cases.

The algorithm used in mtd comes from Toshiba I think and was=20
originally designed for an old 256 page flash of theirs. But I would think=
=20
all 1-bit-error-correction ECC's are basically the same.

I don't know, but I think the basic premise is that bit errors are rare,=20
and when they do occur, they will be single bit errors occurring in random=
=20
places. Indeed, the algorithm used seems to be ideally suited to this=20
case.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
