Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135ntc-0001eX-00
	for mtd-list@infradead.org; Sat, 24 Jun 2000 12:14:44 +0100
Date: Sat, 24 Jun 2000 12:16:03 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Patrick Higgins <phiggins@transzap.com>
cc: mtd@infradead.org
Subject: Re: Possible error in doc_write_ecc
In-Reply-To: <Pine.LNX.4.21.0006231320560.14889-100000@phiggins.transzap.com>
Message-ID: <Pine.LNX.4.21.0006241159450.1089-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 23 Jun 2000, Patrick Higgins wrote:

> Basically, higher levels would just call mtd_info.read() and accept the
> results as valid, unless an error value is returned. 

I've always been fairly unhappy about the ECC interface. The idea was not
so much to allow different hardware to provide the same ECC methods, but
to allow them to provide different ones, and to give the user access to
the generated ECC information so it can be stored in a sensible place.

If we make the DiskOnChip hardware driver silently write the generated 6
bytes of ECC data to the 'correct' area in the flash after a page write,
that's fine while we're using NFTL on it, but what if we're using
something different, like JFFS?

JFFS-on-NAND is going to have to have some kind of ECC mechanism defined,
and it may not be identical to the way that the DiskOnChip works. We may
calculate our own ECC data and store them in the out-of-band area, in
which case we definitely don't want the DiskOnChip driver to have already
written something in that area.

The current setup isn't particularly nice, but I think we do need
_something_ in that place - we can't really just let the hardware driver
write whatever it likes into the flash automatically.

> They really shouldn't have to worry about what the hardware did or
> didn't do to try to correct the error, but only with the results.

If the hardware had to correct bit errors, it may not be able to correct
them next time, and many MTD users will want to mark that block of flash
as bad and never use it again. 

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
