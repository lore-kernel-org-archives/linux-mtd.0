Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b3G4-0001P7-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 16:27:20 +0000
Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b3G2-0001P0-00
	for mtd@infradead.org; Thu, 08 Mar 2001 16:27:19 +0000
Date: Thu, 8 Mar 2001 11:27:03 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
cc: <mtd@infradead.org>
Subject: Re: Oh, the many joys of MTD...
In-Reply-To: <Pine.LNX.4.21.0103080809310.7682-100000@penguin.theopalgroup.com>
Message-ID: <Pine.LNX.4.30.0103081119360.14989-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 8 Mar 2001, Kevin Jacobs wrote:

> Hello everyone!
>
>   I'm new to working on MTD and would like to start by thanking everyone who
> has contributed to it.  Its a fine addition to Linux and has made my life
> much easier.  However, I am having a few problems and was hoping for some
> kinds souls to enlighten me a little.
>
> Let me also say that I am somewhat new to hardware driver development and
> have some rather odd gaps in my knowledge.
>
> My first questions is likely something fairly basic.  I've read over much of
> the MTD source and it seems that many of the erase and write functions do
> not deal with concurrent access and CPU cache issues.  What happens when a
> {read,write,erase} request comes in for a sector that is being
> {written,erased}?

Those are exclusively protected by state machines and locks.  For example,
see the usage of chip->state in cfi_cmdset_0001.c.

> Also, is it assumed that the memory mapped for MTD devices will not be
> cached by the CPU?  If so, is it feasible to add support.  If not, where is
> code to flush/update the cache after a write or erase operation?

The device mapping is done with the ioremap() call which is responsible for
providing a non-cacheable mapping.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
