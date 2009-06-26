Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK4Q7-0003BP-36
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 05:56:25 +0000
From: David Brownell <david-b@pacbell.net>
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: query: nand read/write method for 2048 + 64 byte page
Date: Thu, 25 Jun 2009 22:56:16 -0700
References: <200906252128.08460.david-b@pacbell.net>
	<ce9ab5790906252217s1a5a8279l58a2111b3ac79786@mail.gmail.com>
In-Reply-To: <ce9ab5790906252217s1a5a8279l58a2111b3ac79786@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200906252256.16902.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 25 June 2009, vimal singh wrote:
> >  - Second, I believe that you will see some issues if you
> >   try to have ECC cover the OOB too.  Problem being that
> >   the raw_write primitives are used to write OOB data and
> >   they don't believe it will be ECC protected.
> 
> My point is to protect OOB too (other than ECC bytes).
> So, should we implement new OOB area read/write primitives to support this?

It's not so much a case of "can it be done"; you may have
noticed that ECC_HW_SYNDROME can do that.  While that layout
is problematic, it certainly allows for "prepad" data to be
included in the ECC.  For a 2K page, with 7 ECC bytes for
each 512+9 bytes of data, the page layout is

	4 * (512 bytes data + 9 bytes OOB + 7 bytes ECC)

where prepad == 9 ... but such layouts have obvious nasty
characteristics, since you can't DMA the whole 2K of data
in one chunk, and since it clobbers manufacturer bad block
markers.

(FWIW I call such layouts "Infix OOB", where the Out-of-Band
data is actually not out-of-band in the spare area.)


Or if the hardware allows you could just use 521 byte ECC
chunks (8-bit NAND only!) and when you run out of 2K page
buffer, roll directly into the OOB data.  You'd have to
provide i/o methods that manage OOB and ECC data that way,
but that seems like it'd suffice as a driver-specific kind
of override, using ECC_HW and your matching ecclayout.


> And in that case how will we be handling those cases where spare bytes
> are protected by clubbing them with main area bytes to generate ECC?
> (as example in my previous mail)

You haven't addressed my observation that there's software
out there which is going to be writing the OOB data and yet
not expecting it to invalidate the ECC... as in, maybe you
want to change a version byte from 0x0f to 0x10.  That has
the look of a five bit ECC error!  Or from 0x10 to 0x11,
well that's an easily corrected single bit error.

- Dave
