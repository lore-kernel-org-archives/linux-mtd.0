Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11E7p0-0002x5-00
	for mtd@infradead.org; Tue, 10 Aug 1999 10:03:50 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 10 Aug 1999 10:03:49 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11E7oz-0006h9-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  I've looked around your new bundle and it looks pretty good, if
> anyone wants to add the CFI probing routing it fits very nicely into
> the mapped.c file, instead of using the flash_jedec routine, a very
> similar routine that does CFI probes needs to be written. 

> I'm not sure the two AMD chips I use support CFI, anyone know off
> hand?

Probably. Try it and find out. The CFI spec is on Intel's web site:
	http://www.pentium.com/design/flcomp/technote/cfi_1_1.htm

> Also, using David's driver as the base driver kinda mucks things up -
> he uses a different erase mechanism with different meanings, and has
> some weird cruft from PCMCIA in there.

Yeah - the idea is that the PCMCIA drivers will be able to use this MTD layer 
when (if) Linus incorporates in into the standard kernel. However, I'd like to 
keep as much of the hardware-specific details _out_ of the MTD layer as 
possible - that's why you'll notice I've moved your mfr and id codes out of 
the struct mtd_info into your own private structure. So if there's PCMCIA 
'cruft' that doesn't need to be there, we can remove it.

Some extra complexity is required for the erases, though, to allow timer-based
operation and retries. I didn't really pay much attention to erases as I pulled
this lot together though - just used what I had last time. So feel free to
point out anything that's not right.


>  Porting the PCMCIA driver and the slram driver to use the mapped
> interface would save alot of code as well, compare:

PCMCIA driver? I haven't started on that yet. If the mapped driver supports 
pageable windows, then the DiskOnChip 1000 driver can use it too. 

> blue{jgg}/tmp/mtd-19990809/kernel#wc -l slram.c octagon-5066.c
>     210 slram.c
>     205 octagon-5066.c

I thought the octagon-5066 driver was yours and already used the mapped 
interface.

> For such a simple device that is quite needlessly long. (mapped
> already implements ram devices)

Yeah - there's definitely scope for removing the redundancy there. The aim of 
this release was mainly to pull all our work together into one codebase, to 
give us a starting point. 

>   I miss devfs support too :<

Sorry, I couldn't test it, and couldn't be sure not to screw it up as I've 
never got round to installing devfs. If you give me a patch which puts it 
back into all the drivers, I'll put it back in.

> Also, do your new NFTL and FTL drivers work over normal block devices?

No. NFTL cannot work over a block device, and can't easily work over most 
memory devices either - you need NAND flash, which has 'out of band' data. 

FTL doesn't either - but there's little need for FTL on block devices. FTL 
_provides_ a block device, not an actual mounted filesystem. So if you want to 
take a duplicate copy of an FTL system, you duplicate the block device not the 
underlying structure.

I'm not sure that running FFS2 from a block device is going to work in the 
long term either - you need access to internal MTD stuff like the erase 
mechanism and erasesize, etc. Your comments in the block device driver and in 
the FFS2 code seem to support that point of view.





> Porting the PCMCIA driver and the slram driver to use the mapped
> interface would save alot of code as well, compare:

> blue{jgg}/tmp/mtd-19990809/kernel#wc -l slram.c octagon-5066.c
>     210 slram.c
>     205 octagon-5066.c

> For such a simple device that is quite needlessly long. (mapped
> already implements ram devices)
>   I miss devfs support too :<

> Also, do your new NFTL and FTL drivers work over normal block devices?
> 



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
