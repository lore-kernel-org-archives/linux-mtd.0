Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajMXc-0005Rq-Ij
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 07:52:23 +0000
Date: Fri, 25 Mar 2016 08:51:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
Cc: Dongsheng Yang <dongsheng.yang@easystack.cn>, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drivers/mtd: make several functions return bool
Message-ID: <20160325085155.7b4bea32@bbrezillon>
In-Reply-To: <20160325063153.GA3319@yaowei-K42JY>
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
 <56F4A87B.5090100@easystack.cn>
 <20160325063153.GA3319@yaowei-K42JY>
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

Hi Yao,

On Fri, 25 Mar 2016 14:31:53 +0800
Yaowei Bai <baiyaowei@cmss.chinamobile.com> wrote:

> On Fri, Mar 25, 2016 at 10:54:51AM +0800, Dongsheng Yang wrote:
> > ccing: Brian and Richard
> > 
> > Hi Yao,
> >     Is that really necessary? I am not sure how much benefit we can
> > achieve from this change.
> > Could you explain more?
> 
> Yes, according to these functions' name, a boolean return value is more
> suitable and matchable.
> 
> Also personally think this change maybe benfit function's return value 
> storage in the stack when called on certain architectures.

At least be honest, and say this is for your patchcount statistics :P.
I'm fine taking the NAND related ones, but please, next time find
something more useful to submit.

Best Regards,

Boris

> 
> > 
> > Yang
> > 
> > On 03/25/2016 10:41 AM, Yaowei Bai wrote:
> > >This series only make several funcitons return bool to improve
> > >readability, no other funcitonal changes.
> > >
> > >Yaowei Bai (5):
> > >   drivers/mtd: mtd_is_partition can be boolean
> > >   drivers/mtd: cfi_interleave_supported can be boolean
> > >   drivers/mtd: map_bankwidth_supported can be boolean
> > >   drivers/mtd: mtd_nand_has_bch can be boolean
> > >   drivers/mtd/nand: nand_opcode_8bits can be boolean
> > >
> > >  drivers/mtd/mtdpart.c          | 6 +++---
> > >  include/linux/mtd/cfi.h        | 6 +++---
> > >  include/linux/mtd/map.h        | 6 +++---
> > >  include/linux/mtd/nand.h       | 6 +++---
> > >  include/linux/mtd/nand_bch.h   | 4 ++--
> > >  include/linux/mtd/partitions.h | 2 +-
> > >  6 files changed, 15 insertions(+), 15 deletions(-)
> > >
> > 
> 
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
