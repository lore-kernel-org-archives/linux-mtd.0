Received: from stoneboat.aleph1.co.uk ([80.68.88.63])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3kE6-0006x3-6d
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2006 20:22:40 -0500
Date: Tue, 31 Jan 2006 01:14:12 +0000
From: Wookey <wookey@aleph1.co.uk>
To: Sergey Kubushyn <ksi@koi8.net>
Message-ID: <20060131011412.GR22242@xios>
References: <43DDCA1A.2050907@ru.mvista.com>
	<Pine.LNX.4.31ksi3.0601300928120.17650-100000@home-gw.koi8.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31ksi3.0601300928120.17650-100000@home-gw.koi8.net>
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

+++ Sergey Kubushyn [06-01-30 09:53 -0800]:
> On Mon, 30 Jan 2006, Vitaly Wool wrote:
> 
> You guys are creating unneeded entities. There is no need to change the
> kernel for YAFFS2 to work. It can be done with a rather simple mtdiff2.c
> rewrite in YAFFS2 tree that took me less than a day to do. Furthermore, my
> patch is in the list so you can even save that day by simply applying it and
> make the thing work with a _stock_ kernel, right now.

You are wrong. There _is_ a need to change the kernel (MTD interface), in
order to fix this problem properly. Your patch is a useful hack to work
around a problem, but it is not a real long-term solution. 

One of the significant advantages of free software is that it is always
possible to get to a real engineering solution, not bodge in some hack to
satisfy marketing and release schedules. Clearly there are disadvantages in
working towards this proper solution (a clean and correct interface), which
you list below (it takes longer, it doesn't necessarily solve the problem
for older versions of Linux/MTD), but it is still better than not solving the
problem, and putting in a workaround forevermore.

This has been explained before, and it's tiresome that you still don't seem
to understand, so I'm having to explain it again.

see:
http://www.aleph1.co.uk/pipermail/yaffs/2005q4/001589.html
(the definitive history and explanation of why AUTOPLACE makes sense)

I also listed all the significant relevant threads I could find in this message:
http://lists.aleph1.co.uk/pipermail/yaffs/2006q1/001811.html

> You're taking a long path instead adding unnecessary functionality to Linux
> kernel. 

The functionality is not unnecessary. It was specified back in 2003 when
the AUTOPLACE support in MTD for NAND for first worked out, but never
actually made it into MTD. This was a mistake, but it took time to come to
light, and realise its significance.

It is sensible to have a mechanism in MTD (AUTPLACE) that allows MTD clients
to use the oob area without knowing the detailed layout of the data stored
in there, given the incompatible requirements of different hardware and
software ecc mechanisms, and different technologies and filesystems.

It is obviously not sensible to implement this mechanism in a way that allows
reading and writing of data+oob but not oob only, which is the current state
of afairs. For a filesystem like YAFFS, which is designed to read/write the
oob without having to also read the coresponding data, this omission is
serious. 

As you say, your patch is a useful workaround for the time being, for which
we are grateful, but its existence does not mean that a proper solution is
not needed.

If you still cannot see this then please re-read the relevant YAFFS and MTD
threads, or just accept that all the other important players in both YAFFS
and MTD development disagree with you. It does not help anyone for you to
keep repeating the same assertion that your way is right and our way is
wrong. You have at least been reasonably civil this this time round, for
which I am grateful, but you are still being part of the problem rather than
part of the solution, because we are having to repeat old arguments rather
than doing something more constructive. 

> There is another unnecessary complication -- your CVS MTD changes would go
> into something like, say, 2.6.22 kernel and they would not fit into the
> older ones. That means that everybody will be forced to switch to a newer
> kernel that is not such an easy task for those who use highly customized
> kernels they are happy with. E.g. ARM architecture underwent quite a
> substantial changes after 2.6.12 so it is NOT just a matter of easy patch
> fitting into a new kernel, it's quite a rewrite.

You are correct that this is a problem. I hope it will not be too difficult
to use the new OOB autoplace with older kernels. If not then people will
have to make do with some other solution, such as your patch. But not-fixing
it for even longer would not improve matters. We were hoping this would be
done a year ago, but sometimes things don't go the way one would like.

> Unfortunately enough for YAFFS it's not driven by a reason or common sence,
> personal likes and dislikes are ruling here... Somebody got insulted so he
> rejects all reasonable arguments just because they come from a person he
> doesn't like. 

Nope, that's simply untrue. Everyone involved apart from you is persuing (or
waiting eagerly for) the correcting of the MTD API because _it is the right
technical solution_. It has nothing to do with the fact that many people
here think you are a tiresome idiot that I should ban from the list. I have
not done that because I think civil discussion is important, and I still
hope that one day you will understand this issue properly and stop calling
us names.

> That might be fine for preschool kids, but we're supposedly
> professionals here, aren't we? 

We are, and we should behave as such. We should look at the design; read the
discussion and consider the arguments; understand the benefits of
modularity, hiding details behind stable interfaces, and design for the long
term. We should know the difference between a quick-and-dirty fix and proper
design. We should remain polite at all times, and we should accept a
majority descision even if we don't agree with it.

Now can you please drop this pet peeve so I don't have to explain this
_again_ in 3 months time?

Wookey
-- 
Aleph One Ltd, Bottisham, CAMBRIDGE, CB5 9BA, UK  Tel +44 (0) 1223 811679
work: http://www.aleph1.co.uk/     play: http://www.chaos.org.uk/~wookey/
