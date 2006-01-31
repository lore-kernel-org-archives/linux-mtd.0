Received: from home-gw.koi8.net ([24.234.115.112])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3lEu-0007lw-PI
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2006 21:27:39 -0500
Date: Mon, 30 Jan 2006 17:26:05 -0800 (PST)
From: Sergey Kubushyn <ksi@koi8.net>
To: Wookey <wookey@aleph1.co.uk>
In-Reply-To: <20060131011412.GR22242@xios>
Message-ID: <Pine.LNX.4.31ksi3.0601301652290.18868-100000@home-gw.koi8.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 31 Jan 2006, Wookey wrote:

> +++ Sergey Kubushyn [06-01-30 09:53 -0800]:
> > On Mon, 30 Jan 2006, Vitaly Wool wrote:
> >
> > You guys are creating unneeded entities. There is no need to change
> the
> > kernel for YAFFS2 to work. It can be done with a rather simple
> mtdiff2.c
> > rewrite in YAFFS2 tree that took me less than a day to do.
> Furthermore, my
> > patch is in the list so you can even save that day by simply applying
> it and
> > make the thing work with a _stock_ kernel, right now.
>
> You are wrong. There _is_ a need to change the kernel (MTD interface),
> in
> order to fix this problem properly. Your patch is a useful hack to work
> around a problem, but it is not a real long-term solution.

You did NOT look into that patch, did ya? It is NOT a hack, it uses proper
MTD API and makes YAFFS follow the specs.

> One of the significant advantages of free software is that it is always
> possible to get to a real engineering solution, not bodge in some hack
> to
> satisfy marketing and release schedules. Clearly there are
> disadvantages in
> working towards this proper solution (a clean and correct interface),
> which
> you list below (it takes longer, it doesn't necessarily solve the
> problem
> for older versions of Linux/MTD), but it is still better than not
> solving the
> problem, and putting in a workaround forevermore.
>
> This has been explained before, and it's tiresome that you still don't
> seem
> to understand, so I'm having to explain it again.

It is NOT a workaround! This is following specs!

> see:
> http://www.aleph1.co.uk/pipermail/yaffs/2005q4/001589.html
> (the definitive history and explanation of why AUTOPLACE makes sense)
>
> I also listed all the significant relevant threads I could find in this
> message:
> http://lists.aleph1.co.uk/pipermail/yaffs/2006q1/001811.html

NO, all that does NOT prove that kernel changes are necessary. That shows
that had those changes were made the life of YAFFS developers would've been a
little bit easier.

> > You're taking a long path instead adding unnecessary functionality to
> Linux
> > kernel.
>
> The functionality is not unnecessary. It was specified back in 2003
> when
> the AUTOPLACE support in MTD for NAND for first worked out, but never
> actually made it into MTD. This was a mistake, but it took time to come
> to
> light, and realise its significance.
>
> It is sensible to have a mechanism in MTD (AUTPLACE) that allows MTD
> clients
> to use the oob area without knowing the detailed layout of the data
> stored
> in there, given the incompatible requirements of different hardware and
> software ecc mechanisms, and different technologies and filesystems.
>
> It is obviously not sensible to implement this mechanism in a way that
> allows
> reading and writing of data+oob but not oob only, which is the current
> state
> of afairs. For a filesystem like YAFFS, which is designed to read/write
> the
> oob without having to also read the coresponding data, this omission is
> serious.

No, it's not. The existing MTD API provides you with the OOB _LAYOUT_ so
you can use those bytes not taken by anything else. It is simple as a
shovel, you only need one additional step to read/write data using that
layout. Everybody else (JFFSx etc) is already doing that. Why YAFFS is so
different and exclusive that it can't do such a trivial thing itself is out
of my understanding. You have a power outlet that everybody else uses
without any problems. One of the prongs in your plug is slightly bent so it
doesn't fit that outlet. Every other intellectual person would've
straightened that slightly bent prong and forgot about the entire issue
forever. But you guys don't wanna do such a simple thing, you're blaming
the outlet!

> As you say, your patch is a useful workaround for the time being, for
> which
> we are grateful, but its existence does not mean that a proper solution
> is
> not needed.
>
> If you still cannot see this then please re-read the relevant YAFFS and
> MTD
> threads, or just accept that all the other important players in both
> YAFFS
> and MTD development disagree with you. It does not help anyone for you
> to
> keep repeating the same assertion that your way is right and our way is
> wrong. You have at least been reasonably civil this this time round,
> for
> which I am grateful, but you are still being part of the problem rather
> than
> part of the solution, because we are having to repeat old arguments
> rather
> than doing something more constructive.

No, I can't understand neither you guys not those "important players"...
I have a strong feeling that it's not for real, that we're in some kind of a
movie like "Hot Shots" where they suffered because their shoe laces were
tied together...

> > There is another unnecessary complication -- your CVS MTD changes
> would go
> > into something like, say, 2.6.22 kernel and they would not fit into
> the
> > older ones. That means that everybody will be forced to switch to a
> newer
> > kernel that is not such an easy task for those who use highly
> customized
> > kernels they are happy with. E.g. ARM architecture underwent quite a
> > substantial changes after 2.6.12 so it is NOT just a matter of easy
> patch
> > fitting into a new kernel, it's quite a rewrite.
>
> You are correct that this is a problem. I hope it will not be too
> difficult
> to use the new OOB autoplace with older kernels. If not then people
> will
> have to make do with some other solution, such as your patch. But
> not-fixing
> it for even longer would not improve matters. We were hoping this would
> be
> done a year ago, but sometimes things don't go the way one would like.

And in the meantime you kept in CVS the source that NEVER EVER worked with
ANY kernel. Nice touch.... Especially with "Everything's fine, we're of
production quality" drumming.

> > Unfortunately enough for YAFFS it's not driven by a reason or common
> sence,
> > personal likes and dislikes are ruling here... Somebody got insulted
> so he
> > rejects all reasonable arguments just because they come from a person
> he
> > doesn't like.
>
> Nope, that's simply untrue. Everyone involved apart from you is
> persuing (or
> waiting eagerly for) the correcting of the MTD API because _it is the
> right
> technical solution_. It has nothing to do with the fact that many
> people
> here think you are a tiresome idiot that I should ban from the list. I
> have
> not done that because I think civil discussion is important, and I
> still
> hope that one day you will understand this issue properly and stop
> calling
> us names.

I'm not calling you names. I simply can't understand why you just won't
untie your shoe laces. I'm not even trying to insult anybody, I genuinely
can't understand. I would've even understood if it were difficult to do, but
it is SUCH a trivial thing that I can't understand it...

> > That might be fine for preschool kids, but we're supposedly
> > professionals here, aren't we?
>
> We are, and we should behave as such. We should look at the design;
> read the
> discussion and consider the arguments; understand the benefits of
> modularity, hiding details behind stable interfaces, and design for the
> long
> term. We should know the difference between a quick-and-dirty fix and
> proper
> design. We should remain polite at all times, and we should accept a
> majority descision even if we don't agree with it.
>
> Now can you please drop this pet peeve so I don't have to explain this
> _again_ in 3 months time?

Yeah, I'd better go for a time being... It's simply unbelievable...

---
******************************************************************
*  KSI@home    KOI8 Net  < >  The impossible we do immediately.  *
*  Las Vegas   NV, USA   < >  Miracles require 24-hour notice.   *
******************************************************************
