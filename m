Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b2pY-00014R-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 15:59:56 +0000
Date: Thu, 8 Mar 2001 09:49:43 -0500 (EST)
From: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Oh, the many joys of MTD... 
In-Reply-To: <12369.984062580@redhat.com>
Message-ID: <Pine.LNX.4.21.0103080945140.7891-100000@penguin.theopalgroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 8 Mar 2001, David Woodhouse wrote:
> jacobs@penguin.theopalgroup.com said:
> >  My first questions is likely something fairly basic.  I've read over
> > much of the MTD source and it seems that many of the erase and write
> > functions do not deal with concurrent access and CPU cache issues.
> > What happens when a {read,write,erase} request comes in for a sector
> > that is being {written,erased}?
> 
> See the state machine in cfi_cmdset_000[12].c. We wait until the operation 
> which is currently in progress has completed. Theoretical support for 
> interruption of erases and writes is there, but it's not yet implemented.

That seems to be a feature of the cfi_cmdset_* but not of jedec.c,
amd_flash.c, among others.


> > Also, is it assumed that the memory mapped for MTD devices will not be
> > cached by the CPU?  If so, is it feasible to add support.  If not,
> > where is code to flush/update the cache after a write or erase
> > operation? 
> 
> It's assumed that it won't be cached, you are correct. 

If a flash device was cached then writes should be fine, correct?  Erase
operations would require Writing 0xFF to erased sectors should make the
cache coherent, right?

-Kevin

--
Kevin Jacobs
The OPAL Group - Enterprise Systems Architect
Voice: (216) 986-0710 x 19         E-mail: jacobs@the
Fax:   (216) 986-0714              WWW:    http://www.theopalgroup.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
