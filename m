Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144MGW-0007xb-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 12:04:40 +0000
Message-ID: <3A30CFBB.E13F8F0@arcom.co.uk>
Date: Fri, 08 Dec 2000 12:10:35 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Requesting module even when it's compiled in
References: <3A30AA56.AEFBBF6E@arcom.co.uk> <8785.976276060@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> dvrabel@arcom.co.uk said:
> >       request_module[cfi_probe]: Root fs is not mounted
> > It shouldn't be looking for a module should it (since it is compiled
> > into the kernel)?
> 
> The new inter_module_xxx stuff means the command set drivers need
> initialisation - just exporting a symbol is no longer enough.
> 
> I've just added the necessary initcalls to mtdcore.c

It works provided the init functions changed from static to extern.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
