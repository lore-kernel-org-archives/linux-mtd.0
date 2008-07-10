Received: from web33611.mail.mud.yahoo.com ([68.142.198.157])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KH3lj-0003Dx-AR
	for linux-mtd@lists.infradead.org; Thu, 10 Jul 2008 21:33:39 +0000
Date: Thu, 10 Jul 2008 14:26:59 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
Subject: Fw: [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved performance
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <618660.91327.qm@web33611.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Missed that the reply of Thomas was to the list.
Here is my reply.
Don't think I'm going to make it to come with a new version next 2 weeks.

Frans.


----- Forwarded Message ----

> 
> Hi Thomas,
> 
> Thanks for your reply.
> Some response  below.
> 
> 
> 
> 
> > First off, please use a mail client which does line breaks around 78
> > characters.
> 
> Ah ok. Actually I do only use webmail clients nowadays, and the yahoo one indeed 
> truncates quite early.
> Guess this is better (finally got a reason to switch to the new yahoo email 
> format).
> If not, let me know.
> > 
> > Secondly, we only bash advisory resistant repeat offenders :)
> 
> NP. I'll try to do my best to learn.
> 
> > It should go into Documentation/mtd. I read trough it and I want to
> > answer a question you asked there:
> 
> I'll put it there.
> > 
> > > Not too sure why the last invert is
> > > needed, but it happened also in the original code.
> > 
> > We want to have 0xff 0xff 0xff ECC code for a page full of 0xff's
> > (empty flash).
> 
> Ok. Will add that.
> > 
> > > I have included the complete nand_ecc.c file. It was derived from
> > > scratch so a patch would have been much bigger.
> > 
> > At the end, we need a patch anyway.
> 
> Aargh. I feared someone would say so. Reason for distributing the full file was:
> 1. it is smaller
> 2. it is less dependent on the original code (as a patch does require that the 
> original code is exactly the same
> and actually for this it does not matter as long as the API does not change.
> 
> Any suggestion how to best make such a patch?
> (I'm an oldtimer so unless advised otherwise, I'll just use diff -c :-) )
> > 
> > I'm not surprised about the effect of unrolling the loop, but it the
> > benefit depends on the CPU architecture as you have noticed
> > already. I'm curious what the speedup on ARM will be.
> 
> I have an unused NSLU2 which has an ARM on board (ARM5 if I am not mistaken).
> I can see if I can get that one up and running again and test on it as well
> 
> BTW: I also do have an improved version of the current driver, but that one did 
> give much less gain. 
> If you are interested I can sent you that one.
> 
> A lot of the gain also comes from going to one byte at a time, to one longword 
> at a time.
> longword instructions take the same time as byte instructions so this gives 4 
> times the gain.
> Didn't know how to do that in the original code anyway (actually I did not fully 
> understand the original code, but
> maybe I did not try hard enough :-)
> > 
> > I have no real objections to merge that code aside of formal aspects:
> > 
> > 1) Please keep at least a reference to the original authors of the ecc
> > code.
> 
> No problems with that. How do you propose to do that/what is the common 
> convention there.
> Note that I did not reuse any of the original code except the api and part of 
> the copyright message.
> I'm glad to give credit where credit is due. Then again I hate it if people get 
> blamed or so for whatever mistake I made :)
> > 
> > 2) Try to follow Documentation/Codingstyle
> 
> Will have a look at it. Guess one of the issues is that I always use {} whereas 
> the kernel code does not in case
> of an if statement with only one statement. Also I might have done the layout 
> differently.
> > 
> > 3) Create a patch and use scripts/checkpatch.pl on it. The current
> > output is: 
> > 
> > total: 160 errors, 17 warnings, 482 lines checked
> 
> Ouch. Will look at it. I was unaware of this script.
> > 
> > 4) Send it as a patch preferrably inline in the mail.
> 
> Will do. It will probably take a few weeks to do this (I'm leaving for a 2 week 
> vacation saturday early morning :)
> > 
> > Thanks,
> > 
> >     tglx
> 
> My pleasure.
> 
> One other question. 
> As you probably saw from my message or the copyright message I work for Philips.
> As such, the other day I bumped upon a snippet of code for bad block handling 
> for squashfs (or cramfs).
> This code seemed to come from linutronix (so probably even from you), but is not 
> in the official kernel.
> Guess it came to us through NXP (former Philips Semiconductors).
> Is this something to be added?
> (btw: I am not an expert in this area, but when reading the patch it seemed to 
> me that it would be more efficient to either record the bad blocks somewhere or, 
> even better, use the bad block list of the device, instead of testing each block 
> sequentially for being bad).
> 
> Best regards, Frans.



      
