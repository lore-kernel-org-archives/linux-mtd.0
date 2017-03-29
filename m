Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ct7eL-0006r0-E9
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 07:04:11 +0000
Date: Wed, 29 Mar 2017 09:03:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: <yamada.masahiro@socionext.com>
Cc: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <marek.vasut@gmail.com>, <computersforpeace@gmail.com>,
 <thorsten.christiansson@idquantique.com>, <laurent.monat@idquantique.com>,
 <dinguyen@kernel.org>, <artem.bityutskiy@linux.intel.com>,
 <grmoore@opensource.altera.com>, <ejo@pengutronix.de>,
 <chuanxiao.dong@intel.com>, <mhiramat@kernel.org>,
 <jaswinder.singh@linaro.org>, <robh@kernel.org>, <linux@armlinux.org.uk>,
 <masahiroy@kernel.org>
Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170329090340.4a9bc2b9@bbrezillon>
In-Reply-To: <bafe698596034dee9c48b19e832c143b@SOC-EX02V.e01.socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
 <20170327100039.480b8d8d@bbrezillon>
 <831da313d194457db7bd02fd8ea5b291@SOC-EX02V.e01.socionext.com>
 <20170328095907.76d02ce9@bbrezillon>
 <bafe698596034dee9c48b19e832c143b@SOC-EX02V.e01.socionext.com>
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

On Wed, 29 Mar 2017 03:22:01 +0000
<yamada.masahiro@socionext.com> wrote:

> Hi Boris
> 
> > -----Original Message-----  
> > > The current situation violates [A].  
> > 
> > Do you have a real failure that is proven to be caused by mis cache
> > line alignment, or are you just speculating?  
> 
> No real problem.
> Rather, I am following the line 226 of DMA-API.txt
> "Warnings: Memory coherency ...".
> 
> 
> In my case, the cache line is 64 byte (for ARM),
> But this does not really matter for the reason
> nand_buffers is only touched at initialization as you mentioned.
> 
> 
> [B] is a real problem for me
> because Denali DMA engine requires >4byte alignment.
> 
> 
> 
> 
> So, I can replace the git-log in the next version:
> 
> "
> Some NAND controllers are using DMA engine requiring a specific buffer
> alignment. The core provides no guarantee on the nand_buffers pointers,
> which forces some drivers to allocate their own buffers and pass the
> NAND_OWN_BUFFERS flag.
> 
> Rework the nand_buffers allocation logic to allocate each buffer
> independently. This should make most NAND controllers/DMA engine
> happy, and allow us to get rid of these custom buf allocation in NAND
> controller drivers.
> "

Yep, sounds better to me.

Thanks,

Boris
