Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HVvD-0004zb-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 19:28:47 +0100
Received: from [24.64.25.86] (helo=white.priv.deltatee.com ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HVv9-0004zV-00
	for mtd@infradead.org; Wed, 26 Jul 2000 19:28:45 +0100
Date: Wed, 26 Jul 2000 12:28:27 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: mark.langsdorf@amd.com
cc: mtd@infradead.org
Subject: Re: Jedec.c problems in mtd-20000704
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9EFEF@txexmta8.amd.com>
Message-ID: <Pine.LNX.3.96.1000726122606.30982A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Thu, 20 Jul 2000 mark.langsdorf@amd.com wrote:

> Second, jedec.c (v 1.1) uses several members of the map_info 
> structure that are no longer in the map_info structure.  
> bus_width and band_size exist in the 1.4 version, but only 
> buswidth exists in the 1.5 version.  Is there a suggested way 
> to handle this change?

The jedec stuff is not fully merged in properly yet.. So it doesn't work
without a little help of some sort.

I want to see if I can get back to that, but if you need it then I do not
recommend waiting for me :<

The code *does* work, I have tested it fairly well outside of the linux
environment. The tests I have been doing are on a 32 bit FLASH SIMM with 4
devices interleved together.

I did not write a write routine for anything other than that, but it
should be easy to see how to make a new one, IIRC :>

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
