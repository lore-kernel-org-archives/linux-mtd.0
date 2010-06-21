Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OQiYC-0002rb-8e
	for linux-mtd@lists.infradead.org; Mon, 21 Jun 2010 15:04:41 +0000
Date: Mon, 21 Jun 2010 17:04:34 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Reed Solomon FAQ
Message-ID: <alpine.LFD.2.00.1006211604160.4290@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "Ghorai, Sukumar" <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got repeatedly questions like the following about Reed Solomon
codes:

> Say we have allocated 8bytes in spare area to store the ECC for 512
> bytes data. And we have to correct upto 4-bit in 512-byte data. And
> would you please let me know how to configure the rs-lib for the
> same? Say we are using the 8-bit data(symbol).

It's impossible to use 8bit symbol width for 512 byte data.

      m = number of bits per symbol
      n = code length in symbols up to 2^(m-1)
      k = original data length in symbols
      r = n - k = number of redundant symbols
      t = 1/2 (n-k) = error correction capability (number of symbols)

So for this use case we get for the kernel rs lib:

   k = 512

So for 512 byte data we need a symbol width of 10. The rs lib in the
kernel handles this in the encode/decode_rs8 functions by expanding
the 8 bit FLASH data to 10 bits internally.

   m = 10

If we can store 8 byte == 64bit of redundant symbols in the spare
area, so the number of redundant symbols is:

   r = 64/10 = 6

And the resulting code lenght is:

   n = k + r = 518

So the max. number of correctable symbols is:

   t = 1/2 * 6 = 3

That might be up to 24 bit of corrected data, when the errors are not
scattered over more than 3 bytes on FLASH.

If errors happen on 4 or more different FLASH bytes, they are
uncorrectable.

The 518/512 (10 bit symbol width) code is the optimum which can be
achieved for 512 byte FLASH read/write chunks with 8 byte of spare
area usage.

To correct 4 symbols in a 512 byte data chunk we need at least 8
redundant symbols, which means 80 bit == 10 bytes storage size in the
spare area.

> Is it possible to correct 4-symbols, by max 9-byte parity?

Yes, but that requires that the 512 byte data is converted into a
serialized bitstream w/o symbol width expansion so 9 bit symbol width
can be used.

    m = 9
    k = 456 [ 512 * 8 / 9 rounded up ]
    r = 8 [ 72 / 9 ]
    t = 4

Such modes are only useful when both the encoding and the decoding are
done in hardware, as serializing / deserializing for the software
en/decoder is making the already slow software RS even more horribly
slow.

As a side note: software RS encoding/decoding is performancewise a bad
idea in general.

Thanks,

	tglx
