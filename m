Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140n1l-0003hf-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 15:50:41 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140n1j-0003hY-00
	for mtd@infradead.org; Tue, 28 Nov 2000 15:50:39 +0000
Date: Tue, 28 Nov 2000 08:53:54 +0000
From: Shane Nay <shane@agendacomputing.com>
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest
Message-ID: <20001128085354.L17376@www.easysolutions.net>
References: <20001128070007.E17376@www.easysolutions.net> <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com>; from nico@cam.org on Wed, Nov 29, 2000 at 01:44:36 +0000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> 
> How do you deal with calls to schedule()?  If you can't schedule you must
> poll the flash for termination and block all interrupts and say goodbye
> to
> low latency response from the kernel.  If that's not a problem for you
> then
> you might as well get rid of all the state machine code which is there
> only
> for concurent flash access which is impossible in your case since you
> need
> atomic flash operations.  Thus the code can become extremely simple.

Schedule? :-) Obviously can't do it, as you noted.  Yes, latency goes down
the drain, the flash chips are actually pretty fast on write, and okay on
erase.  Basically the plan is to kill any erasing of blocks, and have a
cleanup program that re-does the entire thing in one locked up motion.

> IMHO you are better to fork all relevant functions and have the chance to
> simplify them rather than trying to stretch the existing code which is
> really not designed for such purpose.

Well, we've come up with a better way (well, Mike Klar did from linux-vr)
to take care of weird c code, and allow everything to be normal.  (Special
elf sections, and twiddling with the linker script)  But in terms of
skipping around schedule.., it's not really a big deal.  You're right
though, it is an opportunity to slim down the code, and keep weird macros
out of MTD.  I was just thinking XIP kernel with flash stuff might be
usefull for MTD as a general thing, because people might want to take this
tact with various types of chips, etc.  I'm just going to finish the code,
and let you guys decide whether it's worth it to have it in MTD.  If it's
not worth it to have it as part of the files that are already in MTD, then
I can submit a seperate set of XIP versions of probing, etc.

Thanks,
Shane.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
