Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W0u8-0007rp-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 18:55:52 +0000
Message-ID: <3A956709.18E409D@danielind.com>
Date: Thu, 22 Feb 2001 13:22:49 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Vipin Malik <Vipin.Malik@daniel.com>, mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n ot r
 egister block device!
References: <30724FF712DFD2119E6200104B2448920119744C@mail1> <29886.982847889@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Vipin.Malik@daniel.com said:
> > But isn't the same init calls method used to init the stuff in the
> > 2.4.x series of kernels. So it's not just a 2.2.18/19 issue.
>
> Yes, but it works in 2.4, and it doesn't in 2.2.18. So we might as well just
> use the 2.2.17 method in 2.2.18 instead of a hacked-up version of the 2.4
> method.

Has anyone really tried this in 2.4.x ?
I've been playing all morning with the 2.4.1 kernel trying to get the physmap.o
__init stuff to run before the rd_load() and
just can't seem to get it done.

the ramdisk driver cannot find the mtdblock device registered when it tries to
load the compressed f/s image from flash.

Help!

Vipin


>
>
> > Vipin P.S. Did you look at the 2nd patch to inode-v23.c that I sent
> > yesterday (to fix the partial page write stuff)?
>
> Yeah - looks good, thanks. Can you commit it?
>
> --
> dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
