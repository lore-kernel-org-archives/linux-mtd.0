Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wX1Y-0000GR-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 21:56:52 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wX1W-0000GL-00
	for mtd@infradead.org; Thu, 16 Nov 2000 21:56:51 +0000
Date: Thu, 16 Nov 2000 17:09:14 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: <mark.langsdorf@amd.com>
cc: <ahennessy@mvista.com>, <mtd@infradead.org>
Subject: RE: Big Endian/Little Endian headache in cfi_cmdset_0002.c
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F1C0@txexmta8.amd.com>
Message-ID: <Pine.LNX.4.30.0011161705350.31000-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 16 Nov 2000 mark.langsdorf@amd.com wrote:

> > In data writes and reads, endianness should not be a concern
> > except for the unaligned bytes which should follow the
> > cfi_cmdset_0001.c code example instead of the assumption of
> > a particular endianness that exists now in cfi_amdext_write_bytes_32.
>
> 	I'm not sure what you mean - as far as I can tell,
> cfi_cmdset_0001.c does deal with endianness except in 3
> specific incidences, ...

Could you please point them out so I could fix them please?
AFAIK cfi_cmdset_0001.c is completely endian aware.


Nicolas




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
