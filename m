Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wXKE-0000M8-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 22:16:10 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wXKC-0000M2-00
	for mtd@infradead.org; Thu, 16 Nov 2000 22:16:08 +0000
From: mark.langsdorf@amd.com
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F1C4@txexmta8.amd.com>
To: nico@cam.org
Cc: ahennessy@mvista.com, mtd@infradead.org
Subject: RE: Big Endian/Little Endian headache in cfi_cmdset_0002.c
Date: Thu, 16 Nov 2000 16:15:22 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> On Thu, 16 Nov 2000 mark.langsdorf@amd.com wrote:
> 
> > > In data writes and reads, endianness should not be a concern
> > > except for the unaligned bytes which should follow the
> > > cfi_cmdset_0001.c code example instead of the assumption of
> > > a particular endianness that exists now in 
> cfi_amdext_write_bytes_32.
> >
> > 	I'm not sure what you mean - as far as I can tell,
> > cfi_cmdset_0001.c does deal with endianness except in 3
> > specific incidences, ...
> 
> Could you please point them out so I could fix them please?
> AFAIK cfi_cmdset_0001.c is completely endian aware.

	My mistake.  That should say "cfi_cmdset_001.c
doesn't deal with endianness except in 3 specific
incidences": setting the erase size (which cfi_cmdset_0002.c
does not currently do correctly right now) and setting 
the Feature Support and BlkStatusRegMask (which 
cfi_cmdset_0002.c doesn't support).
	AFAIK, cfi_cmdset_0001.c handles endianness
appropriately.  It doesn't do much with it, though, and
I wanted to be sure that we should take the same 
approach for cfi_cmdset_0002.c.  Which it looks like
we should - the correct patch is to remove all the
references to endianness.

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
