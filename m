Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144awz-0004Cl-00
	for mtd-list@infradead.org; Sat, 09 Dec 2000 03:45:29 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144awy-0004Cf-00
	for mtd@infradead.org; Sat, 09 Dec 2000 03:45:28 +0000
Date: Fri, 8 Dec 2000 13:21:43 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Vrabel <dvrabel@arcom.co.uk>
cc: <mtd@infradead.org>
Subject: Re: cfi_cmdset_0001.c: do_write_buffer: wrong length
In-Reply-To: <3A30F3FE.5C9781CD@arcom.co.uk>
Message-ID: <Pine.LNX.4.30.0012081303110.6716-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 8 Dec 2000, David Vrabel wrote:

> Hi,
>
> In cfi_cmdset_0001.c do_write_buffer writes an incorrect length to the
> chip
>
>     cfi_write(map, CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),
> cmd_adr);
>
> which with 1 x16 chip in x8 mode eg on the SBC-MediaGX (buswidth == 1;
> interleave == 1;
> devicetype == 2) works out as
>
>     cfi_write(map, CMD(len/2-1), cmd_adr); <-- Fails
>
> When it should be
>
>     cfi_write(map, CMD(len-1), cmd_adr); <-- Works
>
> Should it it be?
>     cfi_write(map, CMD(len/map->buswidth-1), cmd_adr);

No.  This will break the case where the interleave isn't 1.

Hmmm... Will it?

Euh...  Each time I get around this question I get confused...

Does someone have the data sheet nearby? (I don't ATM)...  What should the
lenght be if a x16 chip is used in x8 mode?  bytes/sizeof(char) or
bytes/sizeof(short)?

On a 2 x16 arrangement you have buswidth=4, interleave=2, devicetype=2.  In
that case it should be len/4 - 1.

Maybe you are right after all.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
