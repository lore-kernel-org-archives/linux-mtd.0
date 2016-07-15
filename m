Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNxmJ-0008Ow-SR
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 07:43:21 +0000
Date: Fri, 15 Jul 2016 09:42:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: weiyj_lk@163.com, Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, "Cooper Jr., Franklin" <fcooper@ti.com>, Wei Yongjun
 <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: nand: omap2: fix return value check in
 omap_nand_probe()
Message-ID: <20160715094256.54c10642@bbrezillon>
In-Reply-To: <20160714160539.GB120073@google.com>
References: <1468498005-10664-1-git-send-email-weiyj_lk@163.com>
 <20160714160539.GB120073@google.com>
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

On Thu, 14 Jul 2016 09:05:39 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Jul 14, 2016 at 12:06:45PM +0000, weiyj_lk@163.com wrote:
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > 
> > In case of error, the function dma_request_chan() returns ERR_PTR() and
> > never returns NULL. The NULL test in the return value check should be
> > replaced with IS_ERR().
> > 
> > Fixes: aa7abd312c11 ('mtd: nand: omap2: Support parsing dma channel
> > information from DT')
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>  
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> Boris,
> 
> The affected commit is in your pull request, which I might review/pull
> today. I'll just plan on applying this on top, unless you'd prefer to
> fixup and resend.

Nope, you can apply it directly on top of my pull request (unless you
find other things to fix and want me to send a v3).

Thanks,

Boris
