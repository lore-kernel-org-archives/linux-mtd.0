Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140mbH-0003aM-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 15:23:19 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140mbG-0003aE-00
	for mtd@infradead.org; Tue, 28 Nov 2000 15:23:18 +0000
Date: Tue, 28 Nov 2000 20:44:36 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Shane Nay <shane@agendacomputing.com>
cc: <mtd@infradead.org>
Subject: Re: XIP kernel + MTD polling interest
In-Reply-To: <20001128070007.E17376@www.easysolutions.net>
Message-ID: <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 28 Nov 2000, Shane Nay wrote:

> I've been working on getting MTD working with the XIP kernel in the Agenda
> (dev.agendacomputing.com), and I was wondering if the MTD project was
> interested in this.  It's a litte hacky because we can't compile PIC...,
> well, I'll explain below.

[...]

> What I'm really wondering is whether I should move to make patches
> off of the present versions of cfi_probe.c, cfi.h, cfi_cmdset_0001.c, or
> whether I should just fork them?  (Basically, it follows the same logic, I
> just use macros to build copies of functions in memory also the code gets
> messy because I can't use else, can't use switch, and can't use return
> until the bottom of the function.  Also can't use printk, or any kernel
> function while the flash is in query, or write mode)

How do you deal with calls to schedule()?  If you can't schedule you must
poll the flash for termination and block all interrupts and say goodbye to
low latency response from the kernel.  If that's not a problem for you then
you might as well get rid of all the state machine code which is there only
for concurent flash access which is impossible in your case since you need
atomic flash operations.  Thus the code can become extremely simple.

IMHO you are better to fork all relevant functions and have the chance to
simplify them rather than trying to stretch the existing code which is
really not designed for such purpose.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
