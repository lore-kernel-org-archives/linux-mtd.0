Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144M08-0007rz-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 11:47:44 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144M07-0007rt-00
	for mtd@infradead.org; Fri, 08 Dec 2000 11:47:43 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A30AA56.AEFBBF6E@arcom.co.uk> 
References: <3A30AA56.AEFBBF6E@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: Requesting module even when it's compiled in 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 08 Dec 2000 11:47:40 +0000
Message-ID: <8785.976276060@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
> 	request_module[cfi_probe]: Root fs is not mounted
> It shouldn't be looking for a module should it (since it is compiled
> into the kernel)?

The new inter_module_xxx stuff means the command set drivers need 
initialisation - just exporting a symbol is no longer enough.

I've just added the necessary initcalls to mtdcore.c


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
