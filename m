Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143UAz-0003PU-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 02:19:21 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143UAx-0003PO-00
	for mtd@infradead.org; Wed, 06 Dec 2000 02:19:20 +0000
Date: Tue, 5 Dec 2000 21:18:44 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Ollie Lho <ollie@sis.com.tw>
cc: Ian <Relativity@HumanHeuristic.com>, Ronald G Minnich <rminnich@lanl.gov>,
        <mtd@infradead.org>, <linuxbios@lanl.gov>
Subject: Re: Problems with r/w on mtdblock0
In-Reply-To: <3A2D8B4E.BBF15715@sis.com.tw>
Message-ID: <Pine.LNX.4.30.0012052103210.2601-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 6 Dec 2000, Ollie Lho wrote:

> Ian wrote:
> >
>
> > However!  If you *then* do a dd and transfer any_other_file
> > into /dev/mtd0,  the new contents are logically "and"ed with
> > the old contents of /dev/mtd0.  Ie;
> >
> >
> > So if I take a hexdump of the first line of the "doc_loadbios" binary;
> >   #hexdump -v doc_loadbios | more
> >   0000000 457f 464c 0101 0001 0000 0000 0000 0000
> >
> > ..  the first line of my bios image;
> >   #hdexdump -v bios | more
> >   0000000 69b0 80e6 0000 0000 0000 0000 0000 0000
> >
> > .. and  "and" the two;
> >   0110100110110000  = 69b0h
> >   0100010101111111  = 4575h
> >   ================
> >   0100000100110000
> >
> > ... I get the first word displayed by /dev/mtd0 after the dd (see above)
> >   0100000100110000  = 4130h
> >
> > Is /dev/mtd0 supposed to behave like this, or have I just rediscovered a
> > deliberate "feature" ... ?
> >
>
>
> Of course it WILL BEHAVIOR THIS WAY !!!!
>
> The DoC has an NAND flash chip in side. For NAND flash chip
> you can only turn each bit form 1 to 0 by WRITE operation,
> not the other way around. The only way to turn a 0 bit to 1
> is by a ERASE operation.

However using /dev/mtdblock0 should produce the same result as if you wrote
to a disk partition or a file.  The latest MTD block interface always erase
the flash region it is going to write to.  Even for large erase sectors the
code is backing the entire sector, patching the data to write into it and
eventually rewriting the whole sector back.

So doing

	dd if=some_file of=/dev/mtdblock0 bs=512 count=1

or even

	cp foobar.fs /dev/mtdblock1

should just work.  If it doesn't then there is a bug.  It actually works
just fine with NOR flash devices.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
