Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xYX1-0006tA-00
	for mtd-list@infradead.org; Thu, 01 Jun 2000 18:13:19 +0100
Date: Thu, 1 Jun 2000 19:13:06 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>,
        Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
        alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]?
In-Reply-To: <27238.959876711@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000601190835.3413A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 1 Jun 2000, David Woodhouse wrote:

> I'm fairly happy with the current state of the MTD code - my remaining
> niggles are lack of certain functionality rather than stupidities in the
> code, so I'm submitting it to Alan in the hope that he'll include it into
> his 2.4.0-test1-ac kernels - after all, it's "only new drivers."
 Yes! Yes!
 
> If I get away with that, it would be nice to get JFFS in too - Alex, is the 
> code in our CVS ready for that or should we hold off for a while longer?

I will look at it tomorrow at work (Haven't had time before). All
functionallity should be implemented and work. I haven't done any larger
scale testing yet though, so it's definitely experimental. There is a bug
in the mkfs.jffs program though. It generates too big nodes (which the
jffs code can't handle) for files that are larger than 64k.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
