Received: from mail-bl2lp0203.outbound.protection.outlook.com
 ([207.46.163.203] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wdbwh-00027f-Fb
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 08:57:23 +0000
Date: Fri, 25 Apr 2014 15:59:45 +0800
From: Huang Shijie <b32955@freescale.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
Message-ID: <20140425075943.GA2221@localhost>
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
 <5359C361.9000302@freescale.com>
 <CAC=U0a0OwJe4f4ZC6GBWzrVZ6fF1Lq=QB1E0ZBANww=k7L4cXA@mail.gmail.com>
 <20140425074310.GA2117@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140425074310.GA2117@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 25, 2014 at 03:43:13PM +0800, Huang Shijie wrote:
> On Thu, Apr 24, 2014 at 11:52:41PM -0400, Kamal Dasu wrote:
> > Huang,
> > 
> > "could you show us how do the driver use the highmem buffer?"
> > 
> > This is the stack on a BMIPS platform we are doing a read dma transaction.
> > drv_*  calls are from out of tree nand controller  driver. This
> I can read the driver since it is not in the l2-mtd. :(

s/can/can't/		

> 
> > example shows the driver trying to map
> > highmem virtual address(0xfe1141e0)  for DMA operation passed from
> 
> Which dma api do you use?

In the ARM platform, we use the sg_init_one to initialize the sg.

It can only convert the kmalloc memory, please see the code:

   #define __virt_to_phys(x)	((x) - PAGE_OFFSET + PHYS_OFFSET)

It does a linear convert for a kernel address.
So in the ARM platform, it can _NOT_ support the highmem which is not linear.


I am not familiar with MIPS.

I do not know how the MIPS convert the highmem address.

thanks
Huang Shijie
