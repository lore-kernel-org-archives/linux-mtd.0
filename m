Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14meUh-0007Fb-00
	for mtd-list@infradead.org; Mon, 09 Apr 2001 17:26:23 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14meTg-0007FT-00
	for mtd@infradead.org; Mon, 09 Apr 2001 17:25:20 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id SAA25910
	for <mtd@infradead.org>; Mon, 9 Apr 2001 18:24:31 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Mon, 9 Apr 2001 18:24:54 +0200
Message-ID: <005c01c0c111$9c9f8a40$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <7657.986564737@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all

I have RPX CLLF (very similar to RPX Lite) with similar Flash setup as
below.
I have modified rpxlite.c so it will set up 5 partitions on that flash
and it appears to work, but when I do a cat /dev/mtd0 or cat /dev/mtdblock0
which is an erased partition I get the following pattern:
81ff81ff81ff81ff .....
for the whole partition instead of fffffffffffff ...

Any ideas?

 Jocke

-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of David Woodhouse
Sent: Friday, April 06, 2001 15:46
To: Brett Carswell
Cc: 'mtd@infradead.org'
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus



BrettC@nulec.com.au said:
> I have four flash chips in parallel on a 32 bit bus so my impression
> is that I have an interleave of 4, a device type of 1 (8 bits) and a
> buswidth of 4 (32bits).

I believe that for 29LV160 chips, the device type should be X16, as that
determines the addresses to which the CFI commands must be sent, rather than
X8, which is merely the mode in which the chip happens to be configured at
the moment.

> However, the CFI probe is detecting the flash chips as device type 2
> (16bit).

That's what I'd expect. They _are_ 16-bit devices, even though you're using
them in 8-bit mode.

> This is fine except when the second address for the write
> command is generated as 0x1550  (0x2AA << 8) instead of 0x1554 (0x555
> << 4).

This stuff makes my head hurt :)

Thinks... Numbering CPU address lines by _byte_ addresses, A0 and A1 don't
exist. A2 is driving the 'A-1' line (aka D15 in word mode) of the flash
chip, presumably. A3 is driving the A0 line, etc. Right? Remembering that
the flash chip address lines are numbered by word (16-bit) addresses.

So to put 0x555 on the real address lines of the chip, we need to put
(0x555 << 3) == 0x2AA8 onto the CPU's address bus. And to put 0x2AA on the
real address lines of the chip, we put (0x2AA << 3) == 0x1550 onto the
CPU's address bus.

Ignoring the fact that you wrote '<<' when you meant '*', why do you think
we should be using the address 0x1554 (== 0x555 << 3)? What am I missing
this time? :)

0x1554 would be asserting the 'A-1' line of the flash chips. Why would you
want to do that?

> I'm trying to work out whether the detection or the program
> address generation is wrong or whether by interpretation of buswidth,
> interleave etc is wrong.

The address generation seems right. What exactly is going wrong, and where?

To confirm:
 buswidth: obvious. (4 bytes)
 interleave: Number of devices accessible through a single bus-width access
(4)
 device type: _Device_ type (2). You ignore the 'A-1' line because the magic
	addresses still need to be on the 'A0' line and above, so you still
	have to do the multiplication by this number.

At one time, I was under the mistaken impression that
buswidth == interleave * devtype. That's not necessarily true.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
