Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b3Ik-0001R5-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 16:30:06 +0000
Received: from [207.206.34.25] (helo=penguin.theopalgroup.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b3Ih-0001Qj-00
	for mtd@infradead.org; Thu, 08 Mar 2001 16:30:03 +0000
Date: Thu, 8 Mar 2001 11:29:09 -0500 (EST)
From: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
To: Nicolas Pitre <nico@cam.org>
cc: mtd@infradead.org
Subject: Re: Oh, the many joys of MTD...
In-Reply-To: <Pine.LNX.4.30.0103081119360.14989-100000@xanadu.home>
Message-ID: <Pine.LNX.4.21.0103081127370.7891-100000@penguin.theopalgroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 8 Mar 2001, Nicolas Pitre wrote:
> > My first questions is likely something fairly basic.  I've read over much of
> > the MTD source and it seems that many of the erase and write functions do
> > not deal with concurrent access and CPU cache issues.  What happens when a
> > {read,write,erase} request comes in for a sector that is being
> > {written,erased}?
> 
> Those are exclusively protected by state machines and locks.  For example,
> see the usage of chip->state in cfi_cmdset_0001.c.

Only cfi_cmdset_* does this.  jedec, amd_flash, etc. do not.

> 
> > Also, is it assumed that the memory mapped for MTD devices will not be
> > cached by the CPU?  If so, is it feasible to add support.  If not, where is
> > code to flush/update the cache after a write or erase operation?
> 
> The device mapping is done with the ioremap() call which is responsible for
> providing a non-cacheable mapping.

Then what does ioremap_nocache do?

-Kevin



--
Kevin Jacobs
The OPAL Group - Enterprise Systems Architect
Voice: (216) 986-0710 x 19         E-mail: jacobs@theopalgroup.com
Fax:   (216) 986-0714              WWW:    http://www.theopalgroup.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
