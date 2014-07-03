Received: from mail1.bemta7.messagelabs.com ([216.82.254.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2Y7N-0003Hd-6r
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 03:55:30 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, "Voytovich, Mike"
 <mvoytovich@paypal.com>
Date: Thu, 3 Jul 2014 13:55:01 +1000
Subject: RE: ubi_io_read -74 and ubifs_scanned_corruption errors with i.MX28
Message-ID: <EACD232272DA4849B060F0828564D13B0AA3DB913C@ntcex01.corp.netcomm.com.au>
References: <CFC49DF0.A141%mvoytovich@paypal.com>,
 <1404221801.6841.88.camel@sauron.fi.intel.com>
In-Reply-To: <1404221801.6841.88.camel@sauron.fi.intel.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 Jul 2014 23:36:41 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> This problem was brought up many times before, but no one came up
> with a solution so far. Let me provide you some back-ground
> information.
<snip>=20
> One possibility is to make the NAND driver/controller _protect_ the
> empty NAND pages with ECC and correct bit-flips in the empty space,
> just like for written-to pages. Empty NAND pages are those which were
> never written to. If I write all 0xFFs to a NAND page, it is is _not_
> and empty NAND page anymore.
>=20
> This is the preferable solution, but it is not necessarily the easiest
> one and not always possible.

Below is an analysis of the interactions between hardware ECC, driver
and reality with a view towards the erased page problem.

You probably know most of this already, but some may still be useful.
I wanted to write this down for a while, sorry about the length.


Good hardware
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The easy way to deal with the erased-page issue is to have an
ECC controller that produces all-1 parity bits for an all-1 page.

This would mean that there is no distinction between an erased
page and one written all-1, and ECC will correct both the same way.

While ridiculously easy to implement in hardware (constant XOR),
very few real world controllers do it. Pretty much anything more
powerful than a 1-bit correcting Hamming code has lost that property.


Making bad hardware do the right thing
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

The next best thing is to do the above mentioned XOR operation
in the NAND driver. However, this can be made complicated or
impossible by the specific ECC hardware implementation.

Typically, a hardware ECC controller is implemented by listening
on the incoming and outgoing data (and sometimes command)
traffic between the NAND controller and the external NAND chip.

This usually means that the driver resets the ECC controller before
writing a sub-page, writes the sub-page, and then reads the parity
bits from a few registers in the ECC controller. After all parity bits
for all such ECC steps are collected, the driver writes them to the
OOB.

In theory, this would allow the driver to XOR the resulting parity bits
with a constant, chosen such that the parity bits for an all-1 page are
transformed into all-1 themselves.

Some overly helpful ECC implementations force automatic writing
of ecc bits (e.g. Freescale). This leads to crazy layouts like interleaved=

data and parity blocks within the page, with data spilling into the OOB.

On those, there is not much hope to work around the problem, since
the presence of the fully automated mechanism usually implies the
absence of a way to side-load the registers via software instead.

The real trouble (and most hardware bugs) start when it comes to
reading the data.

Again, the ECC controller listens on the bus for the incoming data,
computing on the fly. After a subpage worth of data, it must read
the corresponding parity bits. This results in a syndrome in the ECC
registers which will typically be all-0 for no errors. If there are errors=
,
the location of correctable bit errors can be extracted from the (non-0)
syndrome.

If we have XOR-ed the parity bits during write, we must undo that
operation (another XOR) before the ECC controller gets to see
them.

Some controllers can be fed data directly through the register
interface, in which case it's easy - read the parity bits (OOB) first,
then read the data followed by side-loading the XORed parity bits.

Unfortunately those controllers are rare and most can only read
the parity bits in the data stream directly.


Getting desperate
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Depending on the specifics of the ECC scheme, it can be possible to
transform the incorrect syndrome caused by the XORed parity bits after
the fact, but that usually means rather heavy software calculations in
the case of bit errors.

Worst case, the heavy calculations have to be performed for every
page, errors or not, which almost certainly makes the scheme
impractical - software ECC may be faster.


When all else fails
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In the special case of erased pages, it is possible to fake the above sugg=
estion
without to much effort. This is for situations where we can't massage the =
ECC
controller to operate with the correct parity pattern, and we can't cheapl=
y
fix the last, incorrect ECC steps.

A fully erased, error free page, with an all-1 parity pattern usually repo=
rts
ECC errors. These may be correctable, or, more likely, uncorrectable bit
errors. Of course, even correctable bit errors are bogus in this case.

If there are no actual errors, the syndrome is always going to be the
same, and can be recognised as the specific syndrome of a fully erased pag=
e.
In this case, we simply return the data and ignore the reported errors.

If there is a small number of 0-bits in the erased page, the syndrome will=

be different. We can't recognise them all, but if an error is reported on
read, we can start looking into the data.

The software simply scans the page data for 0-bits. This can be done quite=

efficiently by looking for non 0xffffffff words, etc. If the number of
encountered 0-bits (including parity bits) exceeds to correction power of =
the
ECC, we decide the page wasn't erased and handle the error as normal.

If the number of allowed 0-bits isn't exceeded, we decide that we're deali=
ng
with an erased page with correctable bit errors. We ensure that the read
buffer is now all-1 and report an appropriate number of 'corrected' bit er=
rors
to MTD.

There is a possible failure mode with all this. If there is a valid ECC co=
de
word (data+ECC) which contains less than, say, 4 0-bits, we could
mis-diagnose it as an erased page.

There is a high likelihood that this isn't in fact the case with,
say, a 4-bit ECC implementation. A 4-bit BCH scheme would use 52 ECC
bits per 512 bytes of data. Without detailed knowledge of the specific
implementation, we can estimate the likelihood of the existence of the
above failure mode in a specific implementation as being less than (lots
of handwaving)...

    Number of ECC bits: 52
    Number of possible ECC bit combinations: 2^52
    Number of possible ECC bit combinations with up to 4 0-bits ~ 2*10^5

about 6*10^-11. Rather unlikely.=20

If you want to be sure, there are 'only' about 10^12 possible data pattern=
s
with up to 4 0-bits within 512 bytes. If you have a few flash chips to bur=
n
(and a little time ;-) you could exhaustively test all possibilities and c=
heck
for parity bits having less than the remaining number of 0-bits.


And if that was too complicated...
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

... pick an unused OOB byte or two and always write them as 0 on any write=
.
If those bytes are mostly 1 on read we are dealing with an erased page.

If OOB space is tight, spare bytes or sometimes spare bits are available b=
etween
the ECC blocks as the exact number of ECC bits doesn't always fit into an
exact number of bytes or 16-bit words. If it's just spare bits, chances ar=
e that
they are already written as 0.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
