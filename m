Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BlBu7-0005mq-4f
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 15:28:28 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Brad Goodman <bgoodman@acopia.com>
In-Reply-To: <77A9CE908F115440B48104747E2534220D0943@email1.acopianet.com>
References: <77A9CE908F115440B48104747E2534220D0943@email1.acopianet.com>
Content-Type: text/plain
Date: Thu, 15 Jul 2004 13:14:11 -0600
Message-Id: <1089918851.8696.191.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: 2.4.26 MTD Patch
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-15 at 14:32 -0400, Brad Goodman wrote:
> You are correct.
> 
> The patch I made was for the code that appears in 2.4.26 of the kernel.
> 
> The stuff in the newere (2.6.7) kernels is totally different.
> 
> I thought this would be a good patch for the 2.4.27 kernel,

That's a question that gets raised a lot - why is 2.4.x so far behind
the mtd CVS tree.

> if you are
> taking summitions for inclusion in it. If not, the code is not
> applicable
> In the 2.6.x branch.

David Woodhouse is pushing MTD upstream in the next few days.  I'm not
sure if that is both 2.6.x *and* 2.4.x or if it is *just* 2.6.x.  I
imagine that it will only be 2.6.x.  I think that the general feeling is
that the MTD tree has changed so much that it isn't appropriate for 2.4.

I think that reasonable maintenance should be done on 2.4, however.

David, comments?

Brad, you might forward your patch to Marcelo and see what he says about
taking MTD patches from random Joe Developer or if he only wants them
from David Woodhouse.
