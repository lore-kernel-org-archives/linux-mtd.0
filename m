Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vr5R-0000N7-00
	for mtd-list@infradead.org; Wed, 15 Nov 2000 01:10:05 +0000
Message-ID: <3A11E285.1FF18FF7@mvista.com>
Date: Tue, 14 Nov 2000 17:10:29 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Erwin Authried <eauth@softsys.co.at>,
   "'mtd@infradead.org'" <mtd@infradead.org>, ahennessy@mvista.com
Subject: Re: JEDEC support broken?
References: <01C04E3A.C0282520@smithwicks.softsys.co.at> <12128.974207817@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> eauth@softsys.co.at said
> > With several patches, I'm able to compile most of the MTD devices and
> > chip drivers  for uClinux now. There are problems with jedec.c, the
> > compiler complains about  the missing "bank_size" in the "map_info"
> > structure. What's wrong with jedec.c?
>
> It's been half-ported to the map stuff, but not completely. Remove all
> references to bank_size and keep a start offset in the individual flash
> chip structures.

I am using jedec.c after making a few quick changes, ie making
bank_size a static variable and setting to map->size and setting
priv.size to bank_size, fleshing out jedec_probe8() and making a few other
small changes.
I'm using mtdpart.c for partitioning of the flash.    It seems to work fine
but only
because I have one flash chip.    Do you mean to use map->size instead of
bank_size (to spread the individual start offsets over if there are gaps
between chips)  and
start offset instead of bank_fill[0] to skip over gaps in flash_write and
jedec_read_banked?
Also,  is spin_lock support going to be added in jedec.c?




>
>
> > Is there a driver that is able to use a physically mapped flash that
> > doesn't support CFI? I think it would be best to probe for CFI, and
> > then for JEDEC in physmap.c.
>
> Agreed. Let me finish merging the inter_module_xxx() stuff before you do
> that, though.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I have a board that needs support for both cfi and jedec flashes.   So,
the approach
I have taken is to use physmap.c with an array of "physmap_info" structures
that describe the window
address, window size, buswidth and number of partitions for each flash.  I
also use a double array of
mtd_partition structures to divide each flash into partitions (making use
of mtdpart.c).   This allows multiple
flashes to be described in one mapping file so the file is really a
description of a particular board.  There is
a probe for a cfi flash  and if that fails, then a probe for a jedec
flash.    This eliminates the use of
CONFIG_MTD_PHYSMAP_START  (and len and buswidth).   Is this in keeping with
the intent
of the map file?

Alice







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
