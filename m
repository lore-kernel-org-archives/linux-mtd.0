Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144Td9-00020e-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 19:56:31 +0000
Received: from yellow.csi.cam.ac.uk ([131.111.8.67] ident=exim)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144Td8-00020Y-00
	for mtd@infradead.org; Fri, 08 Dec 2000 19:56:30 +0000
Message-ID: <3A313CE7.DFF1BC4E@cam.ac.uk>
Date: Fri, 08 Dec 2000 19:56:23 +0000
From: "D. Vrabel" <dv207@cam.ac.uk>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
CC: mtd@infradead.org
Subject: Re: cfi_cmdset_0001.c: do_write_buffer: wrong length
References: <Pine.LNX.4.30.0012081303110.6716-100000@xanadu.gn.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Nicolas Pitre wrote:
> 
> On Fri, 8 Dec 2000, David Vrabel wrote:
> >
> > In cfi_cmdset_0001.c do_write_buffer writes an incorrect length to the
> > chip
> >
> >     cfi_write(map, CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),
> >         cmd_adr);
> >
> > Should it it be?
> >     cfi_write(map, CMD(len/map->buswidth-1), cmd_adr);
> 
> No.  This will break the case where the interleave isn't 1.
> 
> Hmmm... Will it?
> 
> Euh...  Each time I get around this question I get confused...
> 
> Does someone have the data sheet nearby? (I don't ATM)...  What should the
> lenght be if a x16 chip is used in x8 mode?  bytes/sizeof(char) or
> bytes/sizeof(short)?
> 
> On a 2 x16 arrangement you have buswidth=4, interleave=2, devicetype=2.  In
> that case it should be len/4 - 1.
> 
> Maybe you are right after all.

Time to compile a big list of all the arrangements of chips and the
resultant buffer write length...

So far we have:

device type  interleave  bus width    buf write len
2 (x16)      1           1 (x8)       len/1-1
2 (x16)      1           2 (x16)      len/2-1
2 (x16)      2           4 (x32)      len/4-1

So far it len/buswidth-1...

David Vrabel


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
