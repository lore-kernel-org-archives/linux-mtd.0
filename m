Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HVwa-00050a-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 19:30:12 +0100
Received: from [24.64.25.86] (helo=white.priv.deltatee.com ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HVwX-00050S-00
	for mtd@infradead.org; Wed, 26 Jul 2000 19:30:10 +0100
Date: Wed, 26 Jul 2000 12:29:50 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <dwmw2@alpha1.cygnus.co.uk>
cc: mark.langsdorf@amd.com, mtd@infradead.org
Subject: Re: Jedec.c problems in mtd-20000704
In-Reply-To: <Pine.LNX.4.21.0007211646360.22633-100000@alpha1.cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000726122859.30982B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Fri, 21 Jul 2000, David Woodhouse wrote:

> Change bus_width to buswidth as necessary, and remove the bank_size
> altogether, or make it an extra argument to the _probe() routines rather
> than putting it in the struct mtd_info.

The JEDEC code has to refer to bank_size so it either goes into the main
structure or the private structure. All banked chips need that number so
IMHO you might as well make it common.

Check out the banked read routine to see why.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
