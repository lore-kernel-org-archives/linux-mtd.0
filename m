Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FeT6-0004HJ-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 16:12:04 +0100
Date: Fri, 21 Jul 2000 17:03:07 +0100 (BST)
From: David Woodhouse <dwmw2@alpha1.cygnus.co.uk>
To: Trevor Woolven <trevw@zentropix.com>
cc: David Woodhouse <dwmw2@infradead.org>, MTD <mtd@infradead.org>
Subject: Re: building M-Sys DOC driver as a module
In-Reply-To: <39781EAE.58A56DA3@zentropix.com>
Message-ID: <Pine.LNX.4.21.0007211654230.22633-100000@alpha1.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 21 Jul 2000, Trevor Woolven wrote:

> Ok, IMHO using an initrd doesn't actually cost you too much, the bulk
> of it is used to store the kernel which has to go somewhere, right? I
> haven't done a comparison on the relative sizes of a kernel with the
> driver compiled in vs one without to measure what the difference is
> but that would be quite a simple thing to do - especially if space was
> getting tight.

initrd requires block deive support. I want to cut that entirely, too.

> I agree that there's a bit of a waste having a DOS
> partition on the DOC to boot syslinux from but neither LILO nor GRUB
> are perfect either.

LILO should be OK now, with the new bootloader protocol which prevents it
from stomping on the EBDA. Grub will hopefully be driving DoC directly,
very soon.

> 
> I agree that getting JFFS on DOC is a good thing but when will it
> happen? 

As far as I know, it should work now, but it doesn't use the ECC. You only
get the normal JFFS checksumming, and I haven't yet modified it to cut
down the number of writes.

> I don't see the M-Systems driver being the driver of choice in
> the long run, most people would much rather use a GPL one and that's
> where MTD wins big time!
> 
> All I'm doing is a short-term fix for expediency.

This is a very useful thing to do, I agree.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
