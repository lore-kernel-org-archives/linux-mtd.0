Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11Dw1h-0002eN-00
	for mtd@infradead.org; Mon, 9 Aug 1999 21:28:10 +0100
Date: Mon, 9 Aug 1999 14:28:05 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
In-Reply-To: <E11DvSw-0005kV-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990809141509.30444B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 9 Aug 1999, David Woodhouse wrote:

> Soon, I'm intending to merge Alexander Larsson's 'flash.diff' for onboard 
> CFI-compliant memories. Volunteers to do that would be appreciated, because it 
> would let me concentrate on completing the DiskOnChip and NFTL code.

I've looked around your new bundle and it looks pretty good, if anyone
wants to add the CFI probing routing it fits very nicely into the mapped.c
file, instead of using the flash_jedec routine, a very similar routine
that does CFI probes needs to be written. 

I'm not sure the two AMD chips I use support CFI, anyone know off hand?

Also, using David's driver as the base driver kinda mucks things up - he
uses a different erase mechanism with different meanings, and has some
weird cruft from PCMCIA in there.

Porting the PCMCIA driver and the slram driver to use the mapped interface
would save alot of code as well, compare:

blue{jgg}/tmp/mtd-19990809/kernel#wc -l slram.c octagon-5066.c
    210 slram.c
    205 octagon-5066.c

For such a simple device that is quite needlessly long. (mapped already
implements ram devices)
 
I miss devfs support too :<

Also, do your new NFTL and FTL drivers work over normal block devices?

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
