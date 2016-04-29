Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw3pc-0005EQ-Hl
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 08:31:25 +0000
Date: Fri, 29 Apr 2016 10:31:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: gpmi: get correct free oob space
Message-ID: <20160429103102.10ca50f7@bbrezillon>
In-Reply-To: <20160413004351.40064fcd@bbrezillon>
References: <1460498793-19431-1-git-send-email-han.xu@nxp.com>
 <20160413004351.40064fcd@bbrezillon>
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

Hi Han,

On Wed, 13 Apr 2016 00:43:51 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Han,
> 
> On Tue, 12 Apr 2016 17:06:33 -0500
> Han Xu <han.xu@nxp.com> wrote:
> 
> > change the way to calculate pagesize to get correct free oob space for
> > legacy_set_geometry function.  
> 
> Are you sure it's safe to expose free OOB bytes in this case? Do you
> know why it wasn't done before?

You did not answer this question. Do you want me to drop this patch. If
that's not the case, can you confirm it does not break platforms that
didn't have those free OOB bytes exposed before this change.

Thanks,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
