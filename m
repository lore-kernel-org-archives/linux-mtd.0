Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xmnA-0000Ml-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 09:26:56 +0100
Date: Fri, 2 Jun 2000 10:26:41 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>,
        Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
        alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
In-Reply-To: <28127.959934103@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.10006021024210.11605-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Jun 2000, David Woodhouse wrote:

> alex@cendio.se said:
> >  I will look at it tomorrow at work (Haven't had time before). All
> > functionallity should be implemented and work. I haven't done any
> > larger scale testing yet though, so it's definitely experimental.
> 
> Fine. We all know how to get larger scale testing :)
> 
> > There is a bug in the mkfs.jffs program though. It generates too big
> > nodes (which the jffs code can't handle) for files that are larger
> > than 64k.
> 
> I saw the dicussion about this, and was wondering why mkfs.jffs actually 
> populates the filesystem at all. Is it because it's more space-efficient to 
> do it all at once than it would be to mkfs, mount and populate it?

Possibly. But i suppose the real reason is that the current way would be
the way you normally use it in embedded systems (like those axis are
doing). You generate your root fs on the build machine, create a jffs
image and download it into the flash memory of the target system.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
