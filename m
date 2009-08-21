Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeNI7-0002Fy-58
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 06:08:04 +0000
Date: Fri, 21 Aug 2009 08:07:53 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] Orion NAND: Make dword load asm volatile to avoid GCC
	optimizing it away
Message-ID: <20090821080753.5a8be5c8@marrow.netinsight.se>
In-Reply-To: <alpine.LFD.2.00.0908201204320.6044@xanadu.home>
References: <20090714164135.65e91b91@marrow.netinsight.se>
	<alpine.LFD.2.00.0907141236160.3138@xanadu.home>
	<20090819094535.558dc0df@marrow.netinsight.se>
	<alpine.LFD.2.00.0908191037310.6044@xanadu.home>
	<20090820091953.2b149fbb@marrow.netinsight.se>
	<alpine.LFD.2.00.0908201204320.6044@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Aug 2009 12:14:47 -0400 (EDT)
Nicolas Pitre <nico@cam.org> wrote:

> > Yes, it works fine with 4.3.3 and 4.4.1 with this change. So the
> > updated patch can be found below. I belive the early clobber should be
> > there though, since (from the ARM architecture reference manual):
> > 
> >   If <addressing_mode> performs base register write-back and the base
> >   register <Rn> is one of the two destination registers of the
> >   instruction, the results are UNPREDICTABLE.
> > 
> > it works fine without the early clobber as well, but I'd feel more safe
> > having it in.
> 
> But this isn't the case here.  We don't perform any writeback.
> You get a writeback when you have an addressing mode of the form:
> 
> 	insn	rd, [rn, rm]!
> 	insn	rd, [rn, #off]!
> 	insn	rd, [rn], #off
> 
> but not with:
> 
> 	insn	rd, [rn, #off]

OK, I'm still a beginner on the ARM architecture, so thanks for the
explanation!

> Still the early clobber shouldn't have any adverse effect either, unlike 
> the memory clobber.
> 
> Acked-by: Nicolas Pitre <nico@marvell.com>
> 
> Unless the MTD guys are going to pick this patch and push it to Linus 
> soon I'll carry it in the Orion git repo.

Great, thanks!

// Simon
