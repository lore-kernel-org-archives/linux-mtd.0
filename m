Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140lFC-0003Ee-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 13:56:26 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140lFB-0003EY-00
	for mtd@infradead.org; Tue, 28 Nov 2000 13:56:25 +0000
Received: from smtp.socal.rr.com (sc-24-130-154-218.socal.rr.com [24.130.154.218])
	by laxmls02.socal.rr.com (8.10.1/8.10.1) with SMTP id eASDtGI07945
	for <mtd@infradead.org>; Tue, 28 Nov 2000 05:55:16 -0800 (PST)
Date: Tue, 28 Nov 2000 07:00:07 +0000
From: Shane Nay <shane@agendacomputing.com>
To: mtd@infradead.org
Subject: XIP kernel + MTD polling interest
Message-ID: <20001128070007.E17376@www.easysolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've been working on getting MTD working with the XIP kernel in the Agenda
(dev.agendacomputing.com), and I was wondering if the MTD project was
interested in this.  It's a litte hacky because we can't compile PIC...,
well, I'll explain below.

When the kernel is running in XIP mode, aka, Execute in Place, in flash, in
order to write/query the flash, you need to copy all the stuff you need
while in that mode into memory, and execute it from there.  Which means a
couple of things..., you have to fool the compiler into doing PIC code
without compiling pic and you can't use _any_ kernel functions while the
flash is in query or write mode..., which changes the resulting code into
something rather messy.  This wasn't too bad with the version that's
presently in 2.4, but from the more recent snapshots (which I'm working off
of now), it's quite messy.

In any event, I've gotten successful flash probes via cfi_probe, and gotten
it to dump all the debugging info via print_cfi_ident.  I'm now moving to
working on the intel command set for our chips, and will have an XIPable
version of that towards the beginning of this week, hopefully tomorrow
night.  What I'm really wondering is whether I should move to make patches
off of the present versions of cfi_probe.c, cfi.h, cfi_cmdset_0001.c, or
whether I should just fork them?  (Basically, it follows the same logic, I
just use macros to build copies of functions in memory also the code gets
messy because I can't use else, can't use switch, and can't use return
until the bottom of the function.  Also can't use printk, or any kernel
function while the flash is in query, or write mode)

Anyway, I just wanted to see if this was a goal of MTD, and get a vibe for
the interest on that.

Thanks,
Shane Nay.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
