Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1440Ui-0001cm-00
	for mtd-list@infradead.org; Thu, 07 Dec 2000 12:49:52 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1440Uh-0001cg-00
	for mtd@infradead.org; Thu, 07 Dec 2000 12:49:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A2F87C6.D1376DAD@arcom.co.uk> 
References: <3A2F87C6.D1376DAD@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: CVS + separate kernel => missing patch? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Dec 2000 12:49:48 +0000
Message-ID: <18043.976193388@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  You used to be able to check out MTD from CVS apply a patch to the
> main kernel tree and run mtd/patches/patchin.sh and everything would
> work.

> Is it still possible to do this?  If so where is the patch to do this?

It was out of date and was removed. There's a complete patch on the ftp 
site (the mtd-patch-README file says where).

If you feel like putting an infrastructure-only patch into CVS or on the 
ftp site again, go for it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
