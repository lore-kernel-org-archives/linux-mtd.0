Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e0He-0007XD-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 22:02:15 +0000
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Pushing code to 2.4.x
References: <Pine.LNX.4.44.0301292135120.4791-100000@imladris.demon.co.uk>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 29 Jan 2003 15:34:11 -0700
In-Reply-To: <Pine.LNX.4.44.0301292135120.4791-100000@imladris.demon.co.uk>
Message-ID: <m34r7ry49o.fsf@lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse <dwmw2@infradead.org> writes:

> On 29 Jan 2003, Eric W. Biederman wrote:
> 
> > What is the plan for keeping the kernel and the CVS tree more or less in
> > sync?
> 
> It goes in cycles...
> 	1. I sync to Marcelo/Linus
> 	2. People commit changes.
> 	3. Those changes stabilise and I become happy with them.
> 	4. I plan to find time to sync to Marcelo/Linus again.
> 	5. People bitch at me because it's out of sync.
> 	6. I say "I'll find some time soon, honest".
> 	7. Red Hat finds me more 'real work' to do just when I thought
> 	   I'd got some slack some in the Engineering Schedule.
> 	8. People bitch at me some more.
> 	9. I eventually get round to it.

That sounds about right.  Things similar things tend to happen here
but as the mtd stuff becomes more real work, and the volume goes
up it is easier to find the time...

> > There are currently some large divergences, to the point there are some
> > chips that I can use the cfi_cmdset_0002.c from the stable 2.4.x kernel
> > mtd tree but not from the recent CVS tree.
> 
> That's a bit of a bugger -- because I sent the CVS code to Marcelo this 
> week :) Care to enlighten us on the problems you've seen?

Primarily these are the chips from SST.  In particular the Roms used
on the old tyan s2466 motherboards.  Currently we are working on
a port to PMC flash chips, which is what that board is using now.  I didn't
look closely at the time, but we should be able to retest and figure
out what is going on. 

> > For the short term I can release and maintain patch where everything works,
> > the question is what should my long term strategy be.
> > 
> > A) Push to the MTD cvs repository and let David Woodhouse push to Marcelo.
> 
> As you've observed, there's a lag involved with this. If you're willing to
> help reduce that I'm happy.

I am certainly willing to look at that.
 
> > B) Push to the MTD cvs repository and push directly to Marcelo.
> 
> This is fine by me assuming the following:
> 
> 	1. You commit to CVS first and then send to Marcelo, including
> 	   the appropriate $Id$ changes so I know which version 
> 	   Marcelo was last sync'd with.
> 	2. You Cc me.
> 	3. Your changes are correct for both 2.4 and 2.5. I don't care
> 	   if they're tested, as long as they're correct :)
> 	4. You merge changes from Marcelo's tree into CVS too, before
> 	   sending it back to him.
> 
> > With LinuxBIOS becoming a fully supported product I expect to continually
> > have more board and more little rom chips that I am making certain work.
> 
> For new map drivers, and new IDs for the chip drivers, please do commit to 
> CVS and send to Marcelo simultaneously. I'm perfectly happy with
> that.

O.k. Then I will do that.  It sounds like a reasonable procedure.
It might be someone else doing the legwork but it that will definitely
be the plan.

Eric
