Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQIm2-0002td-AP
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 18:00:27 +0000
Received: by mail-pa0-x229.google.com with SMTP id uo6so87361254pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 10:00:05 -0800 (PST)
Date: Mon, 1 Feb 2016 10:00:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: add register access debug
Message-ID: <20160201180003.GG19540@google.com>
References: <1453753785-9635-1-git-send-email-robert.jarzmik@free.fr>
 <20160129144707.GB1437@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160129144707.GB1437@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 29, 2016 at 11:47:07AM -0300, Ezequiel Garcia wrote:
> On 25 Jan 09:29 PM, Robert Jarzmik wrote:
> > Add verbose debug for register accesses. This enables easier debugging
> > by following where and how hardware is stimulated, and how it answers.
> > 
> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > ---
[...]
> 
> With verbose debug enabled, it looks like this:
> 
> [..]
> [   99.909883] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():793 nand_readl(0x0014): 0x1
> [   99.909896] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():843 nand_writel(0x1, 0x0014)
> [   99.909902] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():857 nand_writel(0x300d3000, 0x0048)
> [   99.909909] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():858 nand_writel(0x60000, 0x0048)
> [   99.909915] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():859 nand_writel(0x0, 0x0048)
> [   99.909921] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():863 nand_writel(0x820, 0x0048)
> [   99.910037] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():793 nand_readl(0x0014): 0x2
> 
> Maybe it would look clearer with:
> 
> [   99.910037] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():793 nand_readl(0x0014) = 0x2

Seems reasonable. I made that change myself, and applied it to
l2-mtd.git.

> But if you feel it's just bikeshedding then:

Maybe :)

> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks!
