Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JeeZ-0006uj-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 17:12:27 +0100
Message-ID: <3986F5D0.AE69B670@colubris.com>
Date: Tue, 01 Aug 2000 12:07:44 -0400
From: Stephane Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Erasing more than one sector at a time?
References: <3985C29C.8F37EBC3@colubris.com> <12989.965121916@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Obviously, my mistake.  I didn't realize I had to have the erase size be a
multiple of a sector size.  Sometimes, I just can't read code properly (an
it wasn't even 3 AM).

Thanks,

-Stephane


David Woodhouse wrote:

> stephane.laroche@colubris.com said:
> >  I'm wondering why the parameter validation at the start of those
> > function specifically prohibits erasing more than one sector.  Is this
> > because the interface is defined this way or is it an oversight?
>
> Unless I'm smoking crack, the CFI command set code _does_ support erases
> longer than one erase block. The three checks which could cause it to
> return EINVAL are:
>         1. start address must be erase-block-aligned
>         2. length needs to be a multiple of erase block size.
>         3. start + length must not exceed the _total_ size of the device.
>
> The DiskOnChip code is different, but that's been/being fixed - depending
> on whether the patch has hit the CVS tree yet or not.
>
> --
> dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
