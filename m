Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xoCt-0001Ae-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 10:57:35 +0100
Date: Fri, 2 Jun 2000 10:39:27 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>,
        Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
        alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
In-Reply-To: <28494.959938499@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.10006021038400.756-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Jun 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> > > We create our Linux (and even NT) workstations by just taking a dump
> > > of the filesystem after installation, and dd'ing that onto the target. That
> > > would work just as well for JFFS. 
> 
> > That doesn't work well in a factory producing thousands of cameras a week.
> 
> You don't have to create the image over and over again - it's no harder to 
> use 'dd' than it is to use 'mkfs', surely?

The mkfs.jffs just creates a file that you copy to the flash. It doesn't
work directly on the flash-memory.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
