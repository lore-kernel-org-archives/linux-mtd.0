Subject: Re: JFFS2: Kernel 2.6.24.2 Ooops during excessive write test
From: David Woodhouse <dwmw2@infradead.org>
To: Martin Creutziger <martin.creutziger@barco.com>
In-Reply-To: <1207549813.6505.8.camel@KARCLT0275>
References: <1206973072.6190.16.camel@KARCLT0275>
	<679044850803310823x10ac1f9dg7de6ed531c7d01b6@mail.gmail.com>
	<1207035371.6252.7.camel@KARCLT0275>
	<1207549813.6505.8.camel@KARCLT0275>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 11:12:06 +0100
Message-Id: <1208945526.9212.770.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Damir Shayhutdinov <lost404@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-07 at 08:30 +0200, Martin Creutziger wrote:
> > On Mon, 2008-03-31 at 19:23 +0400, Damir Shayhutdinov wrote:
> > > Hi!
> > > 
> > > 2008/3/31, Martin Creutziger wrote:
> > > >
> > > >  I am doing some excessive write tests on a PPC405EP running kernel
> > > >  2.6.24.2 at the moment. At irregular intervals, the "space accounting
> > > >  superblock info" gets "screwed" and I'd like to know why this happens
> > > >  and if it is fixable. 
> > > 
> > > Can you test this patch with your system?
> > > http://lists.infradead.org/pipermail/linux-mtd/2007-November/019866.html
> 
> Hi again,
> 
> that did not work out well. Although the volume did not fill up any
> more now (df -k shows 556k used, which is ok), the oops still occured.

I believe this should be fixed now. The above patch was _almost_
correct, but not quite.

The original problem was that we were misaccounting the size of the
clean marker when we marked a newly-erased block.

The above-referenced patch simply adjusted for that error, rather than
fixing it at source -- but it left a small period of time where the
superblock counts weren't correct and the appropriate locks weren't
held.

Our paranoid debug code didn't actually detect the incorrect counts
(I've since made it do so, by adding up the counts for each eraseblock
and comparing them with the totals in the superblock). But because of
the lack of locking, there was an even smaller period of time where the
superblock counts weren't even _consistent_, which we _did_ check for.

Looking at your log, I'm fairly sure that you're seeing another thread
go through that check during that time when the counts were
inconsistent. I see output from the thread in
jffs2_erase_pending_blocks(), interleaved with another thread hitting
the BUG(), with a discrepancy of precisely 12 bytes (the size of a
cleanmarker).

Thus, I believe it should be fixed by commit 014b164e, which I'll be
adjusting for the semaphore->mutex conversion and submitting to stable@
for inclusion in 2.6.24.x and 2.6.25.1 shortly:
http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=014b164e

-- 
dwmw2
