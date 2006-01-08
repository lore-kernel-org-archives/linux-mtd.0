From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060108002457.GE3774@stusta.de>
References: <20060107220702.GZ3774@stusta.de>
	<1136678409.30348.26.camel@pmac.infradead.org>
	<20060108002457.GE3774@stusta.de>
Content-Type: text/plain
Date: Sun, 08 Jan 2006 00:38:54 +0000
Message-Id: <1136680734.30348.34.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] no longer mark MTD_OBSOLETE_CHIPS as BROKEN and
	remove broken MTD_OBSOLETE_CHIPS drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-01-08 at 01:24 +0100, Adrian Bunk wrote:
> > 1. Precisely when were these chip drivers marked obsolete?
> 
> Since kernel 2.4.11-pre4, released Thu, 4 Oct 2001 20:47:23 -0700.

Good. That's when they were first marked 'theoretically obsolete', at
least. Now, when did they _actually_ become obsolete, and why?

> > 2. What was the reason for marking them obsolete?
> 
> The changelog says:
>  - David Woodhouse: large MTD and JFFS[2] update

I didn't ask who; I knew that. I asked you _why_. Admittedly, I happen
to know that too - but I want to know if _you_ know it.

Since you've taken it upon yourself to decide the timescale of the
removal, surely it's reasonable to expect that you do actually know what
you're removing and why it's obsolescent?

> > 3. What are the factors which led you to conclude that _now_ is the time
> > to actually remove them?
> 
> http://lkml.org/lkml/2005/12/12/43

That's also an insufficient answer. Why now? What are the factors you
weighed up in favour of removal, and against it? I assume you gave it
some serious consideration?

> > 4. What are the factors which led you to _remove_ the map drivers which
> > currently use the obsolete chip drivers, rather than taking the obvious
> > alternative solution for those map drivers?
> 
> It seems that for one and a half years noone considered it a problem 
> that they were no longer available...

Even if the chip drivers in question really been unavailable for that
period of time, rather than merely hidden behind an extra config option
-- people with embedded systems are often slow to update. That isn't
really sufficient reason for removing those map drivers rather than
taking the obvious alternative solution. You do know enough about the
code you're changing to know what that alternative solution is, right?
 
-- 
dwmw2
