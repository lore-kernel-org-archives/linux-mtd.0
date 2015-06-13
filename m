Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3ed0-00073q-Hc
 for linux-mtd@lists.infradead.org; Sat, 13 Jun 2015 06:09:15 +0000
Date: Sat, 13 Jun 2015 08:08:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roy Spliet <r.spliet@ultimaker.com>
Subject: Re: [RFC] Add DMA RX support for sunxi nand
Message-ID: <20150613080836.1df5a55a@bbrezillon>
In-Reply-To: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
References: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roy,

On Fri, 12 Jun 2015 13:38:47 +0200
Roy Spliet <r.spliet@ultimaker.com> wrote:

> Following are two patches for sunxi nand DMA support. There's a whole phletora
> of reasons why these are marked RFC, including:
> - Sunxi DMA support still needs to be merged upstream
> - Sun7i NAND definitions are not merged upstream
> - No TX support
> - Bounce buffer size is fixed to 8KB, and I have no idea whether this is sane
> - No clustering of DMA requests
> - More hw features that we might want to use
> 
> Some of this can be addressed in follow-up patches, some can't. I'm just
> curious what you think.
> Motivation for sending this out anyway: on my set-up this already improves
> boot time by approx. 4s, or ~10%. This cheers me up on a sunny Friday afternoon
> in the office.

I'm really interested in having DMA support for this driver, but I'm
still wondering why we have such a difference between the non-DMA and
DMA verion, especially since you're now using a bounce buffer allocated
with dma_alloc_coherent (uncached memory region).

I guess all the perf penalty comes from the memcpy_fromio/toio (which
are useless in our case: we don't need a memory barrier after writing
each byte in the SRAM). Can you try replacing them by simple memcpys and
relaunch you tests ?

This being said, I really think the DMA approach can be interesting if
we support the 'page mode', which is able to read one full page with a
single command (and a single DMA transfer) instead of having iterate
over each ECC chunk.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
