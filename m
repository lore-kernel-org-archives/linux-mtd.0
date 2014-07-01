Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1yFT-0005vv-Bh
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 13:37:28 +0000
Message-ID: <1404221801.6841.88.camel@sauron.fi.intel.com>
Subject: Re: ubi_io_read -74 and ubifs_scanned_corruption errors with i.MX28
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: "Voytovich, Mike" <mvoytovich@paypal.com>
Date: Tue, 01 Jul 2014 16:36:41 +0300
In-Reply-To: <CFC49DF0.A141%mvoytovich@paypal.com>
References: <CFC49DF0.A141%mvoytovich@paypal.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Mon, 2014-06-16 at 20:13 +0000, Voytovich, Mike wrote:
> [   28.266307] 00000000: ffffffbf ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................

The problem is here - there is a bit-flip in the empty space, notice
that all the bytes are "f" and one is "b".

This problem was brought up many times before, but no one came up with a
solution so far. Let me provide you some back-ground information.

Flash consists of erasable blocks, which we call 'eraseblocks', or
"LEBs" in UBI/UBIFS

UBIFS writes data to LEBs sequentially, from the beginning to the end.

UBIFS has the "journal", which is essentially a set of LEBs which UBIFS
has to scan during mount. These LEBs contain the data that were written
to the file-system last.

In case of a clean unmount, the journal is empty. There are data only in
case of a power cut.

Power cuts cause unfinished writes, so the journal may contain corrupted
nodes, and UBIFS is trying to be very careful about them - it detects
them and drops them.

Corrupted nodes may also appear for other reasons, not because of power
cuts. E.g., just faulty media, worn-out media, radiation, unstable power
supply, etc.

All the corruptions caused by power cuts are not fatal, and UBIFS should
be able to recover from all of them. The non-power cut corruptions are,
in contrast, fatal, and UBIFS has no way to automatically recover from
them.

UBIFS tries hard to distinguish between these 2 types of corruptions.
The power cut-related corruptions may only happen in the end of the
journal, because UBIFS writes sequentially. Namely, power cut-related
corruptions may only be at the end of the last written journal LEB. And
the corruption may span only 1 write unit, because UBIFS writes 1 write
unit at a time. For NAND flash write unit is usually 1 NAND page, which
is 2KiB in your case.

Scanning works like this. We take the first journal LEB and read each
UBIFS node one-by-one from the very beginning. This continues as long as
CRC matches and everything is fine.

If we find a corrupted node (CRC mismatch), we drop it, and we drop
everything else in this write unit. And we expect that the area _after_
this write unit contains _only_ empty space. Simply because UBIFS starts
with empty LEBs.

If there is something else but not just empty space the write-unit
containing corrupted nodes, then someone wrote something there, and the
corrupted node is not at the end of the journal, but somewhere in the
middle. And this means we are dealing with some other type of
corruption, not a corruption caused by a power cut. And we just refuse
mounting.

Now what is empty space? For current UBIFS it is the space at the end of
an LEB containing only "0xFF" bytes, and nothing else. This worked well
in the past, but does not always work nowadays.

In your case you have a single bit-flip in the empty space. UBIFS
detects it, and says that there is a corruption in an area which should
only contain empty space, and it refuses mounting.

How could this be fixed. We discussed 2 possibilities at this forum in
the past.

One possibility is to make the NAND driver/controller _protect_ the
empty NAND pages with ECC and correct bit-flips in the empty space, just
like for written-to pages. Empty NAND pages are those which were never
written to. If I write all 0xFFs to a NAND page, it is is _not_ and
empty NAND page anymore.

This is the preferable solution, but it is not necessarily the easiest
one and not always possible.

The other way is to change UBIFS's definition of empty space. Make UBIFS
be aware of bit-flips in empty space. Make UBIFS allow for a number of
bit-flips there, and this number would depend on the how strong is the
ECC. This would be a much much less plausible solution, because
_architecturally_ it breaks layering. Today we have the MTD layer taking
care of all the bit-flip stuff for upper layers. But this solution would
make UBIFS kind of duplicate MTD efforts, and have its own additional
bit-flip logic. But hey, if there is a good reason, why not?

HTH.

-- 
Best Regards,
Artem Bityutskiy
