Subject: Re: [PATCH (fixed)] Fix infinite loop in INFTL_foldchain()
	in	drivers/mtd/inftlcore.c
From: David Woodhouse <dwmw2@infradead.org>
To: Greg Ungerer <gerg@snapgear.com>
In-Reply-To: <48EC523F.8030305@snapgear.com>
References: <20081007132904.6vvmlioy8co004ko@system.cs.fsu.edu>
	<48EC523F.8030305@snapgear.com>
Content-Type: text/plain
Date: Wed, 08 Oct 2008 11:39:35 +0100
Message-Id: <1223462375.20499.38.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Daniel Rosenthal <danielrosenthal@acm.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-08 at 16:25 +1000, Greg Ungerer wrote:
> Hi Daniel,
> 
> Daniel Rosenthal wrote:
> > I'm having problems with my email client, but I've attached a patch 
> > (both inline and as a regular attachment). This patch fixes a loop that 
> > is potentially infinite in INFTL_foldchain in drivers/mtd/inftlcore.c.
> > 
> > When iterating over a chain in reverse (oldest block first), this patch 
> > correctly marks the PUtable[] entry of the second to last erase block of 
> > a chain as BLOCK_NIL, regardless of whether or not it can format the 
> > last block successfully. Before, the second to last block was only 
> > marked as pointing to BLOCK_NIL if INFTL_formatblock() succeeded on the 
> > last block of the chain, which could potentially result in an infinite 
> > loop if the block was worn out and refused to format.
> > 
> > If there are any problems with this patch please let me know. I can 
> > apply them fine after pulling them from email, but my email client (web 
> > interface) isn't fullproof, so if anybody else has problems, please let 
> > me know. (I can't send it through pine or otherwise due to network 
> > configuration.)
> 
> I haven't looked at this code for quite a while, but your
> reasoning and patch looks right to me. So you have my acked-by.
> 
> Acked-by: Greg Ungerer <gerg@snapgear.com>
> 
> David, I assume you are going to pick this up?

Committed. Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
