Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zaxj-0000o1-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:57:51 +0100
Date: Mon, 27 Mar 2000 16:57:38 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: Scott Anderson <sanders@mvista.com>, Alexander Larsson <alex@cendio.se>,
        mtd@infradead.org, SeokKuon Kwon <kwonsk@mutech.co.kr>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD 
In-Reply-To: <9932.954168709@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000327165250.31589K-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, David Woodhouse wrote:
> >  The flash is not divided into blocks in our JFFS. The flash is
> > logically a single circular append-only file (but with random access
> > of course). Wear-leveling comes implicitely in that model, since the
> > log-file is circular. 
> 
> When you append to your circular log, you end up eating your tail. What if the 
> erase block you're about to 'eat' doesn't contain any data that needs to be 
> changed. Do you leave it alone and skip it, or do you erase it anyway?

The garbage-collector is invoked when the amount of headroom starts to get
low compared to the amount of redundant areas in the flash. It will start
to erase sectors, and if they contain non-redundant info, it is moved to
the head first. Finn can fill in here in more detail.

As you see it's important that the GC is triggered at the right time. If
you end up with 1 byte head-room before the GC, you cannot move data out
of the way of the sector-erase. 

The parameters of the GC are chosen so they work for us, but they are
subject to tuning of course.

-Bjorn




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
