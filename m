Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GSRZ-0001WW-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 21:06:05 +0000
Message-ID: <3A5CCEDA.407726CF@colubris.com>
Date: Wed, 10 Jan 2001 16:06:34 -0500
From: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, nico@cam.org
Subject: Re: CFI problems with 32bit bus and 4 devices
References: <Pine.LNX.4.30.0101102011550.13913-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> Sorry, mea culpa. I'd forgotten - or just didn't realise this arrangement
> was used. How did {amd,cfi}_send_gen_cmd() send a command to all four
> chips? With two separate 32-bit writes?
> ...
> Technically, I think this setup would fit into the original model as
> buswidth == 8, and we should be using read64/write64 for accesses to the
> flash.

Bus width is still 32 bits and you can access all 4 chips with one read or
write operation.  CFI commands are 8bit wide.

It's just the CFI offset that moves, according to the device type (8 bit, 16
bit or 32 bit), the mode the device is in (a 16bit or 32 bit device can
operate in 8 bit mode) and the number of devices sitting on the bus (or the
bus width).

Although using buswidth == 8 in that specific case may work in that specific
case, you would read 4 bytes too many, which are invalid addresses for
16bit/32bit CFI devices in x8 mode (I guess nothing bad happens by reading
those but you never know).

cfi_send_gen_cmd() uses the interleave and device_type information and
therefore was and is still doing "the right thing" (tm).

-Stephane




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
