Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W2vi-0000Tv-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 21:05:38 +0000
Message-ID: <3A958586.676CD231@danielind.com>
Date: Thu, 22 Feb 2001 15:32:54 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n ot r
 egister block device!
References: <3A956709.18E409D@danielind.com>  <30724FF712DFD2119E6200104B2448920119744C@mail1> <29886.982847889@redhat.com> <7651.982868422@redhat.com> <3A95742C.FE1CDBE0@danielind.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Success!! Well sort of ;)

After a terrible hack of explicitly calling rd_load() again at the end of
init_mtdblock(), forces the ramdisk stuff to look for the compressed root
file system again. This time it
finds it (now that mtdblock has registered the block device) enabling the
root file system to be loaded and be mounted!

This proves for sure that that is the only issue left to boot compressed root
file systems off raw flash. Once we figure out how to force init_mtdblock()
to be linked in
before the ram disk stuff, we would be set.

David? :_)

Vipin





Vipin Malik wrote:

> Nope, doesn't work. Already tried that this morning (along with declaring
> physmap.o as an OX_OBJS).
>
> Vipin
>
> David Woodhouse wrote:
>
> > vmalik@danielind.com said:
> > >  the ramdisk driver cannot find the mtdblock device registered when it
> > > tries to load the compressed f/s image from flash.
> >
> > Hmmm. drivers/mtd is later than drivers/block in the link order. Try
> > changing that in the toplevel Makefile.
> >
> > --
> > dwmw2
> >
> > To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
