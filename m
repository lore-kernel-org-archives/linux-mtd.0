Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZVMr-0000dD-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 10:31:41 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZVMq-0000d6-00
	for mtd@infradead.org; Thu, 14 Sep 2000 10:31:40 +0100
Message-ID: <39C09BE8.62322A9B@arcom.co.uk>
Date: Thu, 14 Sep 2000 10:35:36 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: sbc-mediagx
References: <E13ZFNG-00020Z-00@pearl.tao.co.uk> <32401.968863402@passion.cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> dg@tao-group.com said:
> >  * The device claims to see only 8MB of my flash medium.
> 
> Odd. Please send the kernel's output while it's probing. How big _is_ the
> flash?

Yeah. I know.  It's not finding the second chip since
chip_size*interleave=8Mibyte*2=16Mibyte

I could really do with a solution to this...

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
