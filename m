Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmijb-0002G0-C4
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 14:42:52 +0000
Date: Wed, 21 Sep 2016 16:42:29 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 02/46] mtd: nand: Provide nand_cleanup() function to
 free NAND related resources
Message-ID: <20160921164229.7488c1ea@bbrezillon>
In-Reply-To: <83ce4313-f63e-3b08-53d7-2d5eb8c97bda@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <8b9dd116b40fb7965a29fe0d051bd8b85e3f036b.1474450295.git.dwalter@sigma-star.at>
 <20160921162521.4b9f83d7@bbrezillon>
 <83ce4313-f63e-3b08-53d7-2d5eb8c97bda@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 Sep 2016 16:38:28 +0200
Daniel Walter <dwalter@sigma-star.at> wrote:

> Boris,
> 
> On 09/21/2016 04:25 PM, Boris Brezillon wrote:
> > Daniel, Richard,
> > 
> > On Wed, 21 Sep 2016 11:44:41 +0200
> > Daniel Walter <dwalter@sigma-star.at> wrote:
> >   
> >> From: Richard Weinberger <richard@nod.at>
> >>
> >> Provide a nand_cleanup() function to free all nand related resources
> >> without unregistering the mtd device.
> >> This should allow drivers to call mtd_device_unregister() and handle
> >> its return value and still being able to cleanup all nand related
> >> resources.
> >>  
> > 
> > Can you check this version?  
> 
> looks good to me.
> I'll incooperate the change in v3 (AFAIR this change will break the last
> patch of the series).

I applied the patch to my nand/next branch [1] (which means it's queued
for 4.9). Rebase your work on top of this branch and you should be good.

Thanks,

Boris

[1]https://github.com/linux-nand/linux/commits/nand/next
