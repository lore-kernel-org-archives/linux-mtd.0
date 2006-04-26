Received: from s20.s20avahost.net ([207.44.250.61])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FYlZC-0002Ii-RB
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 11:04:38 -0400
Message-ID: <62862.136.182.2.222.1146063871.squirrel@www.westnelson.net>
In-Reply-To: <20060426142928.GH29108@wohnheim.fh-wedel.de>
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
	<625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
	<2349.136.182.2.222.1146057120.squirrel@www.westnelson.net>
	<20060426142928.GH29108@wohnheim.fh-wedel.de>
Date: Wed, 26 Apr 2006 10:04:31 -0500 (CDT)
From: "Peter Buelow" <pete@putzin.net>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Unlocking Intel flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Wed, 26 April 2006 08:12:00 -0500, Peter Buelow wrote:
>> >
>> I was afraid of this. Will this kernel patch cleanly, or at least with a
>> reasonable amount of effort?
>
> [ Would be nice if you only quote relevant lines, as I did. ]
>
> We only support non-ancient kernels - within reason, this is free open
> source support, not an enforcable contract between companies.  2.4.17
> is definitely ancient, so you are on your own.
>
> This is a fairly frequent question.  Maybe we should answer it in the
> FAQ.  Basically, your company decided not to upgrade to a recent
> kernel.  Most likely, they are afraid to introduce instability, but
> legal questions could be involved as well.
>
> There is a price tag attached to this decision, though.  Noone will
> care a lot if your kernel breaks.  So you are on your own with
> whatever problems you might have.  You could try to reproduce the same
> problem with a recent kernel.  If you can reproduce it there, we will
> care and try to fix it - in the current kernel.  Porting the fix back
> into your kernel is your problem and we don't care anymore.
Ah for life to be so black and white. While you are absolutely correct,
I'm not asking for a bug fix. My assumption is that age is the problem,
not implementation bugs. My hope was that someone would point out
something I missed that would magically cause it to work.
>
> So now you know the disadvantages of ancient kernels and can tell your
> management about them.  They may decide to keep the old kernel and
> deal with the problems.  That is fair as long as we are not bothered
> by this.  Or they might decide that our (and other's) advice is
> valueable enough to bite the bullet and upgrade to a recent kernel.
>
Unfortunately, my hands are tied on the kernel. That's life when you have
get a reference platform from a large nameless chip manufacturing company
in the largest state in the southwest US. They want to sell chips, the SW
is an afterthought most of the time and as such, we get what we get and
try to make the best of this. Anyway, we're going to investigate
backporting a newer 2.4 version and see what happens. I'm crossing my
fingers, but I promise not to bother you anymore than asking a few
questions on this list about how things work or the like.

> Something like that.
>
> Jörn
>
> --
> Why do musicians compose symphonies and poets write poems?
> They do it because life wouldn't have any meaning for them if they didn't.
> That's why I draw cartoons.  It's my life.
> -- Charles Shultz
>
>
>


-- 
"Knowledge is in every country the surest basis of public happiness."
George Washington (State of the Union address, 1790)
--
Pete
