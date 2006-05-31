Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FlLmR-0008JL-1M
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 04:10:23 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060530185017.GG26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Wed, 31 May 2006 12:09:42 +0400
Message-Id: <1149062982.32620.67.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
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

On Tue, 2006-05-30 at 20:50 +0200, Jörn Engel wrote:
> Again, Artem won't like this.  But this time I would like to see
> better objections than before.  Just to show how silly they are:
> 
> 	"*you* should prove why it is useless, not me"
> That is what these patches are doing.  I remove every existing user of
> mtd->type and thereby prove that mtd->type was useless in this
> particular case.  When I'm finished and have dealt with every case,
> the proof is complete.
> 
> 	"i want to print a type of flash my JFFS2 file system is
> 	working on"
> Show me the code.  If you have out-of-tree patches that may collide
> with my work - tough luck.  I have out-of-tree patches as well and as
> long as they are not merged, it is _my_ duty to deal with any breakage
> created by other's changes in the kernel.  That has always been the
> general rule and for a good reason.

Please, stop this, there is no reason for greening. You was several
times said about my real reasons. This was just an answer for your "I
don't want to delve into your explanation, I just let David judge".

Once more.

1. Having an mtd->field field and capabilities flags a bad idea. Why?

1a: Who initializes this mtd->flags field? If I want to add 20 new
capabilities, how many places do I have to change? As many as there are
drivers in MTD? Insane.

2a. In general, the capabilities thing is application-dependent. And it
must stay in application's area, not deep in drivers.

3a: If I'm a user of MTD, and I want to add 20 new capability, do I have
to change MTD itself? It's not my business to do this.

4a. How wide is the mtd->flags field? 32 bits? So, you restrict me by 32
capabilities? And if I need more, I have to combine the existing ones?
Why is it better then using mtd->type?

So, this is not an extensible solution.

2. OK, what do you offer instead (the question nobody asked yet)?

Forget about mtd->flags. Leave alone mtd->type. Add an
include/linux/mtd/flash_capabilities.h header which looks like this:

/* If the flash allows to clear individual bits */
#define mtd_can_clear_bits(mtd) (mtd->type == MTD_NORFLASH)
/* If the goat may be milked */
#define mtd_can_milk_a_goat(mtd) (bah)
....
etc.

So, you have your set of capabilities. You use this header in JFFS2 and
clean it up. Your task is solved.

If I want to add a new flash type, I fix the flash_capabilities.h
header. If I add a new capability - I fix the header as well. I don't
get my dirty forepaws into other drivers. It's extensible.

To put it differently, I offer to add the capabilities stuff as a thin
layer over MTD, not to jab it deeply into the MTD core.

3. It's difficult to understand what is MTD_GENERIC_TYPE stuff. In
reality, this is just a temporary junk, which is supposed to go later.
But temporary junk usually tends to stay forever. I can't understand why
you cannot avoid introducing it. 

4. OK, if you still think that mtd->flags is better, please, go ahead.
After all, it may be fixed later if needed. And may be I'm just wrong.
But, please, do it without this strange MTD_GENERIC_TYPE stuff. Why
can't you?

5. Introducing capabilities and removing mtd->type are 2 completely
different activities. No need to mix them, IMO.

I appreciate your work, and offer another way to do this. I think it is
better, and didn't so far hear any good argument against it. Thanks for
reading this :-)

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
