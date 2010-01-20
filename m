Received: from scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXjfJ-0005aa-6N
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 23:08:50 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: Is it an atomic operation for writing a page in NAND flash
Date: Thu, 21 Jan 2010 12:08:25 +1300
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<20100120162303.YKHV13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
	<Pine.LNX.4.64.1001201729070.32263@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1001201729070.32263@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201001211208.25933.manningc2@actrix.gen.nz>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	David Parkinson <parky_dw@ntlworld.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 January 2010 05:35:09 Ricard Wanderlof wrote:
> On Wed, 20 Jan 2010, David Parkinson wrote:
> > At 14:54 20/01/2010, Ricard Wanderlof wrote:
> > >...
> > >The end result is that you can't say "if the ECC says it's ok, the data
> > >hasn't been corrupted" (which you could with a CRC).
> > >...
> >
> > Apologies for nit-picking (and small digression), but a CRC is no
> > guarantee either.  Whilst error correcting codes have additional
> > information so that small errors can be corrected both CRCs and ECCs
> > work in the same way in detecting likely errors in the communications
> > channel.  (It's all maths and statistics....).

While you might be technically and theoretically correct, in practical terms 
CRC is a copper-bottomed guarantee when compared with ECC.

A 32-bit CRC is very difficult to randomly spoof. An ECC is extremely easy to 
spoof with random errors. The difference is in the order of millions.

The best protection for getting good NAND writes/erases is to make sure you 
don't launch a programming (write/erase op) unless you know power is good. If 
your system has a "power OK" flag then check it before doing the write.

Don't wire the WP pin to hardware power fail flags either since a falling WP 
will abort the current write.


>
> You are right of course. Indeed, any mapping of N bits to n bits (where N
>
> > n) must result in a number of bit patterns for N which map to identical
>
> bit patterns for n. Still, CRC's used for data checking are designed so
> that the different bit patterns for N that map to the same n n are
> reasonably different from each other, so that a CRC is unlikely to show a
> correct result if there has been a 'typical' failure on the channel. At
> least the ECC algorithm used for mtd has is not intended for that level of
> error detection; it is optimized for correcting single-bit errors.
>
> > A side question here is have the check algorithms been matched to the
> > characteristics of the MTDs?  For example a weakish radio signal is
> > likely to have errors randomly distributed across the message.  With
> > a magnetic disk drive the errors are likely be caused by a blemish on
> > the surface and therefore will come in bursts.  Some algorithms will
> > be better than others in the respective cases.

Actually radio errors are often bursty due to interference. The electric fence 
clicks I get here knocks out a few adjacent bits.

>
> The algorithm used in mtd comes from Toshiba I think and was
> originally designed for an old 256 page flash of theirs. But I would think
> all 1-bit-error-correction ECC's are basically the same.

This still treats the pages as blocks of 256 bytes so if you have a 512-byte 
page it will be treated as two 256-byte ECC regions.
>
> I don't know, but I think the basic premise is that bit errors are rare,
> and when they do occur, they will be single bit errors occurring in random
> places. Indeed, the algorithm used seems to be ideally suited to this
> case.

It depends...

For MLC flash you can expect quite a few errors which is why there has been a 
shift to multi-bit ECC for these.  If you have, say, 4-bit ECC then you might 
choose to treat 2 or less errors as "no error".

There are basically two types of multi-bit ECC: RS and BCH. RS is more suited 
to "burst" errors like you'll see on CD or radio. BCH is more suited to 
random errors.

>
> /Ricard
