Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bODG5-0003zC-Ry
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 00:15:06 +0000
Received: by mail-pf0-x242.google.com with SMTP id t190so7143548pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 17:14:45 -0700 (PDT)
Date: Fri, 15 Jul 2016 17:14:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: weiyj_lk@163.com
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "Cooper Jr., Franklin" <fcooper@ti.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: nand: omap2: fix return value check in
 omap_nand_probe()
Message-ID: <20160716001442.GB76613@google.com>
References: <1468498005-10664-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1468498005-10664-1-git-send-email-weiyj_lk@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 14, 2016 at 12:06:45PM +0000, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, the function dma_request_chan() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> Fixes: aa7abd312c11 ('mtd: nand: omap2: Support parsing dma channel
> information from DT')
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Applied to l2-mtd.git
