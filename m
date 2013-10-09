Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTsFm-0000BG-K4
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 11:48:36 +0000
Date: Wed, 9 Oct 2013 08:48:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org, Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 0/2] pxa3xx: Data buffer dynamic allocation
Message-ID: <20131009114803.GA31294@localhost>
References: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Brian Norris <computersforpeace@gmail.com>,
 Tawfik Bayouk <tawfik@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 04, 2013 at 03:30:36PM -0300, Ezequiel Garcia wrote:
> As part of my work to support the NAND controllers in Armada 370/XP SoC
> here's a tiny set of patches to replace the currently data buffer allocation
> based in a hardcoded buffer size, into a dynamic scheme.
> 
> We first use kmalloc to request a 256 bytes (big enough for the ONFI paramater
> page) and then re-allocate (either with kmalloc or using DMA allocators) using
> the detected page size.
> 
> The first patch is required to perform the initial NAND operations (READID
> and friends) using programmable I/O since the DMA buffers are not ready
> at such early stage.
> 
> The second patch performs to actual dynamic allocation and it's exactly
> the same patch I sent a few weeks ago:
> 
>   http://patchwork.ozlabs.org/patch/275982/
> 
> Daniel: Can you test these two If they look fine we can add them now,
> being an improvement to the driver pxa3xx beyond the Armada 370/XP effort.

Daniel: sorry to bother, any luck testing this?

Brian: do you think the fix might be OK?

I'll include this in my future patchset for pxa3xx-nand, but if these
two look OK, I think we can just merge them now.

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
