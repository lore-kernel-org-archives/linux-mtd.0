Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14UX4w-00064A-00
	for mtd-list@infradead.org; Sun, 18 Feb 2001 16:52:54 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14UX4u-000644-00
	for mtd@infradead.org; Sun, 18 Feb 2001 16:52:53 +0000
Date: Sun, 18 Feb 2001 16:52:47 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Bjorn Wesen <bjorn.wesen@axis.com>
cc: Jonas Holmberg <jonas.holmberg@axis.com>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: mtdpart.o 
In-Reply-To: <Pine.LNX.4.21.0102181947510.15064-100000@godzilla.axis.se>
Message-ID: <Pine.LNX.4.30.0102181647200.10666-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Sun, 18 Feb 2001, Bjorn Wesen wrote:

> I'd rather do it in the config.in and have a separate CONFIG for the
> partition support, but as we found out before, it's really boring to fix
> that config.in for all the cases that need the mtdpart support

Heh. Yeah, I agree - it'd be good to do it properly but it's boring :)

> :) Something for Jonas!

I _try_ to delegate stuff but don't actually pay anyone's wages so it's 
not very effective :)

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
