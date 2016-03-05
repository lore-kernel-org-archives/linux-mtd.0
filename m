Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac2ZQ-0002aR-JO
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 03:07:57 +0000
Received: by mail-pa0-x22f.google.com with SMTP id fl4so44770635pad.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 19:07:36 -0800 (PST)
Date: Fri, 4 Mar 2016 19:07:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: fix dmaengine initialization
Message-ID: <20160305030733.GQ55664@google.com>
References: <1455316144-14464-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455316144-14464-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 11:29:04PM +0100, Robert Jarzmik wrote:
> When the driver is initialized in a pure device-tree platform, the
> driver's probe fails allocating the dma channel :
> [  525.624435] pxa3xx-nand 43100000.nand: no resource defined for data DMA
> [  525.632088] pxa3xx-nand 43100000.nand: alloc nand resource failed
> 
> The reason is that the DMA IO resource is not acquired through platform
> resources but by OF bindings.
> 
> Fix this by ensuring that DMA IO resources are only queried in the non
> device-tree case.
> 
> Fixes: 8f5ba31aa565 ("mtd: nand: pxa3xx-nand: switch to dmaengine")
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Applied to l2-mtd.git
