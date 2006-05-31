Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FlS1m-0005Pp-LW
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 10:50:39 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149062982.32620.67.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 31 May 2006 18:49:57 +0400
Message-Id: <1149086997.32620.101.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-31 at 10:01 -0400, Nicolas Pitre wrote:
> Don't be ridiculous.  There is no way you can find 20 capabilities total 
> for a generic MTD interface.

I'm not sure it can't be the case.

> > 2a. In general, the capabilities thing is application-dependent. And it
> > must stay in application's area, not deep in drivers.
> 
> Not true.  The capabilities are function of the hardware not the 
> application.
OK, I agree with you. It is a function of the hardware. But, the
mtd->flags field anyway becomes application dependent, just because the
number of hardware features is very large, and you introduce only those
flags *applications* need.

Example. Let's consider the AG-AND flash. Some of them have a property
when you erase some eraseblocks, but the neighboring eraseblocks get
slowly corrupted. Is this a flash feature? - Yes. Do you have a flag for
it? - No.

So, the idea is that number of features is potentially high. And there
is a dependency on the application present in a way.

> > 3a: If I'm a user of MTD, and I want to add 20 new capability, do I have
> > to change MTD itself? It's not my business to do this.
> 
> If you want to add new capabilities, you only have to care about users 
> of those capabilities and of course users that worked without them 
> before will just continue to work if they ignore them.
I also have to check if other flashes have these capabilities, and add
it to them if yes. So I have to change drivers.

> > 4a. How wide is the mtd->flags field? 32 bits? So, you restrict me by 32
> > capabilities? And if I need more, I have to combine the existing ones?
> > Why is it better then using mtd->type?
> 
> Who said capabilities have to be only single bits?
> 
> And even if the capability field as you insist to see it has only 32 
> bits, what prevents you from extending it in the unlikely event more 
> bits might be needed?
Isn't it bad to have mtd->flags1, mtd->flags2, etc?

> > So, this is not an extensible solution.
> Artem you're more brilliant than that.
Frankly, I can't get the meaning of this :-(

> > 2. OK, what do you offer instead (the question nobody asked yet)?
> > 
> > Forget about mtd->flags. Leave alone mtd->type. Add an
> > include/linux/mtd/flash_capabilities.h header which looks like this:
> > 
> > /* If the flash allows to clear individual bits */
> > #define mtd_can_clear_bits(mtd) (mtd->type == MTD_NORFLASH)
> > /* If the goat may be milked */
> > #define mtd_can_milk_a_goat(mtd) (bah)
> > ....
> > etc.
> > 
> > So, you have your set of capabilities. You use this header in JFFS2 and
> > clean it up. Your task is solved.
> 
> And the runtime code is both larger and slower.  And the source is 
> even more obfuscated.  Isn't that great?
> 
As to "And the source is even more obfuscated" - I do not understand
this. Why? The same if (can_milk_a_goat()) in both cases. Or do you mean
after gcc -E ? Then yes.

I was telling about a general approach, you're telling about technical
details. Well, if you care about code size and speed, then create
mtd_capabilities.c, call add an init_capabilities() call which is called
on initialization, and have variables for each feature.

#define can_milk_a_goat(mtd) (mtd->priv->can_mlk_a_goat)

The Idea still stays unchanged - it's a thin layer over mtd->type.
Implement it differently.

I still don't see any drawback of this approach. The advantage is that
it'll all be put in one place, and that'll be not the driver who
initialize it.

Finally, I don't really care now much about how capabilities are
implemented, and I wrote this. Implement it your way - fine, it is not
fundamental, I'm just suggesting another approach, may I? I care more
about the MTD_GENERIC_TYPE stuff, which is senseless in my opinion. I
wrote about this, and don't see any reaction.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
