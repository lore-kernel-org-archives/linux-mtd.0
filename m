Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W1m4-0008Fm-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 19:51:36 +0000
Message-ID: <3A95742C.FE1CDBE0@danielind.com>
Date: Thu, 22 Feb 2001 14:18:52 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Vipin Malik <Vipin.Malik@daniel.com>, mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n ot r
 egister block device!
References: <3A956709.18E409D@danielind.com>  <30724FF712DFD2119E6200104B2448920119744C@mail1> <29886.982847889@redhat.com> <7651.982868422@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Nope, doesn't work. Already tried that this morning (along with declaring
physmap.o as an OX_OBJS).

Vipin

David Woodhouse wrote:

> vmalik@danielind.com said:
> >  the ramdisk driver cannot find the mtdblock device registered when it
> > tries to load the compressed f/s image from flash.
>
> Hmmm. drivers/mtd is later than drivers/block in the link order. Try
> changing that in the toplevel Makefile.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
