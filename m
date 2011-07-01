Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcgMp-0008KA-N1
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 16:14:56 +0000
Date: Fri, 1 Jul 2011 11:14:49 -0500
From: Scott Wood <scottwood@freescale.com>
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd/nand : don't free the global data
	fsl_lbc_ctrl_dev->nand in fsl_elbc_chip_remove()
Message-ID: <20110701111449.1f6a6f7a@schlenkerla.am.freescale.net>
In-Reply-To: <1309498826.23597.200.camel@sauron>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
	<1309328435.23597.104.camel@sauron>
	<20110629114558.13975519@schlenkerla.am.freescale.net>
	<1309434797.23597.178.camel@sauron>
	<20110630112656.3257116a@schlenkerla.am.freescale.net>
	<1309498826.23597.200.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, b35362@freescale.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 1 Jul 2011 08:40:21 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2011-06-30 at 11:26 -0500, Scott Wood wrote:
> > If the NULL assignment is dropped, consider what happens if the
> > fsl_elbc_nand module is removed then reinserted.  On reinsertion, it
> > will
> > see a non-NULL fsl_lbc_ctrl_dev->nand, and will skip allocating a new
> > one.
> > Then you're referencing freed memory.
> 
> Oh, then this sounds like a separate bug. Removing the module should
> kill everything, and re-inserging the module should have zero
> dependencies on the previous states...

fsl_lbc_ctrl_dev (and thus the fsl_lbc_ctrl_dev->nand pointer) is not part
of the module, it is part of arch/powerpc/sysdev/fsl_lbc.c.  NAND isn't the
only thing that elbc does.  Since there can be multiple NAND chips, which
are separately probed, the first chip (under a lock) creates the NAND state
that is shared among the chips, and the last one removed destroys it.

> Anyway, if you think the original patch is OK, I can put it to my tree.

I think it's OK.  The loop also needs to be removed, so the remove callback
operates only on the particular chip it's called on, but that's a separate
bug.

-Scott
