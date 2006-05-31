Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlT69-0006Kf-3b
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 11:59:11 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J050047I0EFQQ00@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 31 May 2006 11:59:04 -0400 (EDT)
Date: Wed, 31 May 2006 11:59:03 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1149086997.32620.101.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0605311105170.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149062982.32620.67.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
	<1149086997.32620.101.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 May 2006, Artem B. Bityutskiy wrote:

> On Wed, 2006-05-31 at 10:01 -0400, Nicolas Pitre wrote:
> > Don't be ridiculous.  There is no way you can find 20 capabilities total 
> > for a generic MTD interface.
> 
> I'm not sure it can't be the case.

Last time we enumerated less than 10 parameters that would cover more 
than 90% of all cases in a clean and obvious way.  One is 
mtd->block_write_size.  For most NOR flash this is 1.  For Sibley this 
is 1024.  For ECC NOR I think it is 16.  For NAND it is another value. 
Etc.  Why should that value be determined _each_ time at runtime based 
on mtd->type using your macro proposal while it can be directly obtained 
from mtd->block_write_size?

This also means that JFFS2 can use:

	if (mtd->block_write_size > 1)
		use_wbuf();

while your proposal would require the equivalent of:

	if (mtd->type == SIBLEY || mtd->type == NAND ||
	    mtd->type == DATAFLASH || mtd->type == ECC_NOR || ... )
		use_wbuf();

And yet wbuf() still doesn't know how big the buffer should be. Don't 
you see the difference?

And if a driver for another type of flash is added to the kernel then it 
only needs to initialise its own value for mtd->block_write_size and 
JFFS2 will just work with no change.

Whereas with your own view the fact that mtd->type is set to GOAT_FLASH 
then you need to modyfy _all_ users of the MTD interface so they learn 
to also consider mtd->type == GOAT_FLASH and to hardcode its buffer size 
which might well be yet another value like 8192.

Isn't that obvious enough that the mtd->type method is suboptimal and 
obfuscates the code?  What do you not get at this point?

> > > 2a. In general, the capabilities thing is application-dependent. And it
> > > must stay in application's area, not deep in drivers.
> > 
> > Not true.  The capabilities are function of the hardware not the 
> > application.
> OK, I agree with you. It is a function of the hardware. But, the
> mtd->flags field anyway becomes application dependent, just because the
> number of hardware features is very large, and you introduce only those
> flags *applications* need.

So?  What's the problem?

> Example. Let's consider the AG-AND flash. Some of them have a property
> when you erase some eraseblocks, but the neighboring eraseblocks get
> slowly corrupted. Is this a flash feature? - Yes. Do you have a flag for
> it? - No.

Why not?

> So, the idea is that number of features is potentially high. And there
> is a dependency on the application present in a way.

If you need to support completely fubar flash then of course the 
capability model may not cover them adequately and you might have to 
bastardize the application code based on

	if (mtd->type == FUBAR_FLASH)
		do_this_fubar_hack();

But this is maybe 10% of the cases.  The other 90% will fit in the 
generic model just fine.

> > > 3a: If I'm a user of MTD, and I want to add 20 new capability, do I have
> > > to change MTD itself? It's not my business to do this.
> > 
> > If you want to add new capabilities, you only have to care about users 
> > of those capabilities and of course users that worked without them 
> > before will just continue to work if they ignore them.
> I also have to check if other flashes have these capabilities, and add
> it to them if yes. So I have to change drivers.

You don't _have_ to.  Again, if the code worked fine without knowledge 
of a given capability before then the addition of support for a given 
capability won't break those who don't advertise that capability.

But if we consider your own view, the addition of a new MTD _user_ 
require that the author of that new module knows about all flash types 
currently provided by MTD and cope with each of their specific 
characteristics which should be deduced from mtd->type.  If instead it 
only needs to cope with mtd->block_write_size to use that same example 
again then things are much simpler for both user module authors and 
flash driver authors.

> > > 4a. How wide is the mtd->flags field? 32 bits? So, you restrict me by 32
> > > capabilities? And if I need more, I have to combine the existing ones?
> > > Why is it better then using mtd->type?
> > 
> > Who said capabilities have to be only single bits?
> > 
> > And even if the capability field as you insist to see it has only 32 
> > bits, what prevents you from extending it in the unlikely event more 
> > bits might be needed?
> Isn't it bad to have mtd->flags1, mtd->flags2, etc?

Why not?  In fact it can be made into a structure bit field that the C 
language already supports rather well.

	struct MTD_blah {
		...
		int can_do_x : 1;
		int can_DO_Y : 1;
		INT CAN_DO_Z : 1;
		...
	}

ONce set those bits are always read-only so no locking issues, etc.

> > > So, this is not an extensible solution.
> > Artem you're more brilliant than that.
> Frankly, I can't get the meaning of this :-(

I'm sorry for you then.

> > > 2. OK, what do you offer instead (the question nobody asked yet)?
> > > 
> > > Forget about mtd->flags. Leave alone mtd->type. Add an
> > > include/linux/mtd/flash_capabilities.h header which looks like this:
> > > 
> > > /* If the flash allows to clear individual bits */
> > > #define mtd_can_clear_bits(mtd) (mtd->type == MTD_NORFLASH)
> > > /* If the goat may be milked */
> > > #define mtd_can_milk_a_goat(mtd) (bah)
> > > ....
> > > etc.
> > > 
> > > So, you have your set of capabilities. You use this header in JFFS2 and
> > > clean it up. Your task is solved.
> > 
> > And the runtime code is both larger and slower.  And the source is 
> > even more obfuscated.  Isn't that great?
> > 
> As to "And the source is even more obfuscated" - I do not understand
> this. Why? The same if (can_milk_a_goat()) in both cases. Or do you mean
> after gcc -E ? Then yes.

You have to dig into another header file to know what can_milk_a_goat() 
actually means in the context of MTD, especially since, according to 
you, this capability is always derived from mtd->type.

> I was telling about a general approach, you're telling about technical
> details. Well, if you care about code size and speed, then create
> mtd_capabilities.c, call add an init_capabilities() call which is called
> on initialization, and have variables for each feature.

I care about a general approach that [surprise surprise] also allows for 
obvious code from a readability point of view and produce small and fast 
runtime code.

> #define can_milk_a_goat(mtd) (mtd->priv->can_mlk_a_goat)
> 
> The Idea still stays unchanged - it's a thin layer over mtd->type.
> Implement it differently.

I'm glad you say yourself that it is an extra (IMHO unneeded) layer over 
mtd->type.

> I still don't see any drawback of this approach.

It is an extra layer over mtd->type.  That's the drawback.

> The advantage is that
> it'll all be put in one place, and that'll be not the driver who
> initialize it.

This is nonsense.  It is like saying that all architectures Linux 
supports should be merged into one directory instead of arch/arm, 
arch/alpha, etc.  After all the code in those architecture 
subdirectories is used by the same kernel scheduler.

> Finally, I don't really care now much about how capabilities are
> implemented, and I wrote this. Implement it your way - fine, it is not
> fundamental, I'm just suggesting another approach, may I?

You do so without ever acknowledging the disadvantages your approach has 
over the other one which is disconcerting.

> I care more
> about the MTD_GENERIC_TYPE stuff, which is senseless in my opinion.

And I agreed with you on that point already.  Did you miss it?

> I wrote about this, and don't see any reaction.

Do you ignore everything I wrote not addressed to you directly?


Nicolas
