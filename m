Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13LnzI-00019P-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 15:34:44 +0100
Received: from polaris.uk.insnet.net ([194.177.174.245])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13LnzG-00019J-00
	for mtd@infradead.org; Mon, 07 Aug 2000 15:34:42 +0100
Received: from pasanda.cygnus.co.uk (dns.cygnus.co.uk [194.130.39.3])
	by polaris.uk.insnet.net (8.9.3/8.9.3) with SMTP id PAA18224
	for <mtd@infradead.org>; Mon, 7 Aug 2000 15:33:35 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <398EC83C.D9F4AE57@arcom.co.uk> 
References: <398EC83C.D9F4AE57@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: 2nd CFI chip detection fails sometimes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Aug 2000 15:33:30 +0100
Message-ID: <6467.965658810@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  The line marked error causes problems because it can put the flash
> chip into an error state preventing correct detection.  We need some
> way of knowing if it's RAM before we do the write.  Suggestions
> welcome! 

We should probably only put back the original value if we completely fail 
to probe the device, _AND_ if it appears to be behaving like RAM (i.e. if 
the contents of the address are exactly what we wrote to it.

Alternatively, we could accept the fact that we overwrite some bytes in a 
RAM chip when we unload and reload its driver, and just not bother to write 
back those bytes at all.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
