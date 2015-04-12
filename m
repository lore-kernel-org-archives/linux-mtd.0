Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhNbd-0003tb-9A
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 19:31:46 +0000
Date: Sun, 12 Apr 2015 21:31:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: Add simple read disturb test
Message-ID: <20150412213120.0414fee5@bbrezillon>
In-Reply-To: <551D6BDA.6000606@nod.at>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <20150402160451.GF32500@ld-irv-0074> <551D6BDA.6000606@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Thu, 02 Apr 2015 18:18:34 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 02.04.2015 um 18:04 schrieb Brian Norris:
> > On Thu, Apr 02, 2015 at 04:13:46PM +0200, Richard Weinberger wrote:
> >> This simple MTD tests allows the user to see when read disturb happens.
> >> By reading blocks over and over it reports flipped bits.
> >> Currently it reports only flipped bits of the worst page of a block.
> >> If within block X page P1 has 3 bit flips and P6 4, it will report 4.
> >> By default every 50th block is read.
> > 
> > Didn't read through this much yet, but why do we need another in-kernel
> > test that coul (AFAICT) be easily replicated in userspace? The same goes
> > for several of the other tests, I think, actually. But at least with
> > those, we have a history of keeping them around, so it's not too much
> > burden [1].
> 
> I've added the test to drivers/mtd/tests/ because it fits into.
> As simple as that.
> 
> > Brian
> > 
> > [1] Although there are some latent issues in these tests that are still
> > getting get worked out (e.g., bad handling of 64-bit casting; too large
> > of stacks; uninterruptibility). The latter two would not even exist if
> > we were in user space.
> 
> uninterruptibility got solved by my "[PATCH] mtd: Make MTD tests cancelable" patch.
> 
> But if we want to kill drivers/mtd/tests/ I'll happily help out.

I'd vote for that solution too.
I've looked at in-kernel mtd tests, and I'm pretty sure they can all be
done in userland.
This would prevent any kernel crash caused by buggy test modules.  

> Where shall we move these tests into? mtd-utils?

I guess so, but I'll let Brian answer that one.
How about dispatching them in mtd-utils' tests/ directory (some of them
are NAND related tests, so creating a tests/nand would make sense,
and others are more generic).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
