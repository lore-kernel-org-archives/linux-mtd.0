Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xmto-0000OE-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 09:33:48 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=exim)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12xmtn-0000O6-00
	for mtd@infradead.org; Fri, 02 Jun 2000 09:33:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006021024210.11605-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10006021024210.11605-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Bjorn Wesen <bjorn.wesen@axis.com>,
    Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
    alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Jun 2000 09:33:45 +0100
Message-ID: <28185.959934825@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
> Possibly. But i suppose the real reason is that the current way would
> be the way you normally use it in embedded systems (like those axis
> are doing). You generate your root fs on the build machine, create a
> jffs image and download it into the flash memory of the target system.

Yeah, but it's still not imperative to create the image in one go from mkfs.

We create our Linux (and even NT) workstations by just taking a dump of the
filesystem after installation, and dd'ing that onto the target. That would
work just as well for JFFS.

Either way - once we get it working on NAND flash, and having to map round 
bad blocks, we're going to have difficulties with just dumping an image on
to the flash anyway. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
