Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EXLv-0004FX-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 13:56:19 +0000
Message-ID: <3A55D27F.C1E734C2@inn.ericsson.se>
Date: Fri, 05 Jan 2001 14:56:15 +0100
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Russ.Dill@asu.edu, mtd@infradead.org
Subject: Re: Supported flash memory
References: <978636488.3a54cec86af09@webmail2.asu.edu> <2842.978696346@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Russ.Dill@asu.edu said:
> >  Besides footprints, pinouts, etc, my other concern is software. The
> > logical combination would seem to be blob/mtd. What flash products are
> > known or probable to be compatible with this combination, what should
> > I look for to attempt to assertain compatibilty? Does blob/mtd work
> > transparently with a 16bit or 32bit ROM bus?
>
> The MTD code ought to work with any CFI-compliant flash chip from Intel or
> AMD, and with a few others too. In most combinations of bus size /
> interleave.
>

I have a custom made flassh module,so-dimm (72 pin), that I want to use but
don't know if  I can .

The module can have up to 16 chips. (AMD)
Every chip has a to be in 8 bit mode.
The address range is divided into 8 chip select, giving a 16 bit data bus.
Thus I can't do any other access than 16 bit and always activate two chip's.

Also, we make them with a version that has a boot block (different block
size) but I think MTD can handle that or ?
I don't see any problem switching over to a version with all block the same
size.


>
> I don't know about blob, but RedBoot should support most of the flash
> setups you're likely to encounter, too.
>

Why do the boot code need to support flash? Flash looks like a ordinary ROM
for everything not knowing the magic sequence.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
