Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYd8-0002rC-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:47:06 +0100
Message-ID: <3ADC73B1.1960BC87@daniel.com>
Date: Tue, 17 Apr 2001 11:47:45 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: rob@sysgo.de, Alexander Melichenko <AlexanderM@lrpeople.com>,
 	mtd@infradead.org, mark.langsdorf@amd.com
Subject: Re: Elan SC520 - problem with MTD
References: <3ADC62AE.66B350ED@daniel.com>  <01041716025800.02061@rob> <01041715513200.02005@rob> <19294.987514727@redhat.com> <20801.987515671@redhat.com> <22300.987516491@redhat.com> <5360.987524764@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> vipin.malik@daniel.com said:
> >  Anywhy, why I bring this is up, there is a *nasty* surprise waiting
> > for folks that use the default address of 0x8400000 as programmed by
> > the BIOS shipped with the board.
>
> OK, so it's likely that the two drivers use different addresses just
> because they expect the board to have been set up differently? Is it
> possible to read the current values of these registers and ioremap()
> accordingly? Then we can make it a config option to reprogram them to a
> sane address.

Well, that's assuming that the same regs are used by the different boot
utilities to
decode the FLASH banks. There are 15 different regs to do this job. You
can use any 2!

I guess that it could be done, you run though all 15 and (looking at the
bits) first figure out which
reg is used for the FLASH CS, then which address it's decoding the flash
at.

Urgh!

In a proper system, the physmap.c file is *not* the place to setup
chipselect registers. Like I said,
what I did was a hack to work around some work done by a hardware
challenged software guy ;)

Maybe just the warning that this funny business is going on and some
sample code, normally commented out,
to "fix it"?

Then when one, does one's own init routine and boots straight from flash,
they would have init the FLASH CS registers
to the proper place anyway so one wouldn't need to do this stuff in this
file anyway.

Vipin


>
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
