Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GNdf-0004fp-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 17:02:47 +0000
Date: Tue, 18 Dec 2001 18:13:27 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Map driver usage 
In-Reply-To: <7139.1008691545@redhat.com>
Message-ID: <Pine.LNX.4.21.0112181738560.2667-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David,

thanks for your response,

On Tue, 18 Dec 2001, David Woodhouse wrote:

> 
> rob@sysgo.de said:
> >  I have a question regarding the usage od the access primitives (e.g.
> > xx_read8(), xx_read16(), xx_copy_from() and so on). In writing a map
> > driver, can one assume that the MTD layer never calls these functions
> > to cross a flash device's block boundary ?
> 
> No. JFFS may do large reads which cross eraseblock boundaries, and the 
> flash driver will translate that directly into a large ->copy_from call.

OK, so if I implement the copy_from call to break the large transfer
into smaller ones if necessary, then I should be safe ?

> 
> > The reason I'm asking is that I am writing a new map driver for a
> > board that has a somwhat strange logical flash layout and I would like
> > to hide that by "shuffling" some of the blocks so that they appear at
> > different offsets. Transforming the offset parameter in the above
> > mentioned functions would be an easy way to do this, but it requires
> > that these functions are never asked to cross an erase block boundary.
> 
> I wouldn't do it in the map driver. Do it in the partitioning layer - 
> that's already mucking around with the offsets anyway.

Yep. Only my problem here is, that I want some physically non-contiguous
blocks to form a single MTD partition. Is that possible with the
MTD partition API ?

Here are some details:

The board's flash map (SSV DIL/Net PC, btw.) looks like this:

    +--------------------------+ 0x00000000
    |                          |
    |    Bootstrap ROM code    |
    |       (15 blocks)        |
    +--------------------------+ 0x000f0000
    | System BIOS #1 (1 block) |
    +--------------------------+ 0x00100000
    |                          |
    | Free for use (e.g. JFFS) |
    |       (15 blocks)        |
    +--------------------------+ 0x001f0000
    | System BIOS #2 (1 block) |
    +--------------------------+ 0x00200000
    |                          |
    | Free for use (e.g. JFFS) |
    |       (32 blocks)        |
    +--------------------------+ 0x00400000

The space actually needed for the bootstrap ROM part may vary
considerably, depending on how the system is configured: it may contain an
etherboot image, in which case a single block would be more than enough,
but it may as well contain a linux kernel with an initial RAM disk, in
which case 15 blocks may not be enough. I would like to be able
to freely configure the size of the  bootstrap ROM part and assign
any space that is not used by it to the "Free for use" part.

My idea was to have the mapping driver implement something
like this:

    +--------------------------+ 0x00000000
    |                          |
    |    Bootstrap ROM code    |                -> /dev/mtd0
    |       (N blocks)         |
    +--------------------------+ configurable
    |                          |
    | Free for use (e.g. JFFS) |                -> /dev/mtd1
    |       (62 - N blocks)    |
    +--------------------------+ 0x003e0000
    | System BIOS #1 (1 block) |                -> /dev/mtd2
    +--------------------------+ 0x003f0000
    | System BIOS #2 (1 block) |                -> /dev/mtd3
    +--------------------------+ 0x00400000

(where /dev/mtd{2,3} would be disabled by default to keep
people from inadvertadly erasing their BIOS.)

Could I do this with the MTD partition layer ? If so, is there
an example I could look at for some hints ?

Thanks for any help

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
