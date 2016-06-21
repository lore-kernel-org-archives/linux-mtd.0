Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFLiV-0000rM-Nu
 for linux-mtd@lists.infradead.org; Tue, 21 Jun 2016 13:27:48 +0000
Date: Tue, 21 Jun 2016 15:27:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, karlzhang@micron.com, beanhuo@micron.com,
 Jiancheng Xue <xuejiancheng@huawei.com>, Peter Pan
 <peterpandong@micron.com>
Subject: Re: [PATCH 02/11] mtd: nand_bbt: introduce BBT related data structure
Message-ID: <20160621152714.0ac4e8c3@bbrezillon>
In-Reply-To: <CAAyFORLMRU+-=YfFJtLubxuwHSwz7xErBSe1eKJHzEWuxGkvwA@mail.gmail.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-3-git-send-email-peterpandong@micron.com>
 <20160325093519.34c3f7fa@bbrezillon>
 <CAAyFORKJzXTSgXvHgNe=AtExs8_9sVNEYMRefYLXDqG7-u-yRg@mail.gmail.com>
 <20160418094444.152042ee@bbrezillon>
 <CAAyFORL_Pqz34-tgz7aBQ3au9RzZwJs6DA-8ROJxK0xtMZnp_Q@mail.gmail.com>
 <20160419093424.27cfc585@bbrezillon>
 <CAAyFORKWTKmBZNx22NaOwHUzH+FW34PNxMuEqejXvBSwru9FoA@mail.gmail.com>
 <20160504223309.2da46b02@bbrezillon>
 <CAAyFOR+-s-4-sMs70D5-NhNgjExXKv4KXLMBsRESQg1+YjvNig@mail.gmail.com>
 <CAAyFORLMRU+-=YfFJtLubxuwHSwz7xErBSe1eKJHzEWuxGkvwA@mail.gmail.com>
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

On Fri, 17 Jun 2016 10:38:27 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> >>
> >> Again, I'm sorry that you had to be the one supporting this transition,
> >> but I don't want to introduce any more quick-and-dirty hacks that we'll
> >> have to maintain until someone decides to tackle the real problem.  
> >
> > No sorry needed. I'd like to do the contribution.  
> 
> I did test on your nand generic patches. And I found two error about nand helper
> functions. Below is my fixing. After my fixing, BBT is functional on
> my platform.
> 

Thanks for testing it (and fixing the implementation). I'll try to send
the series after the 4.8 merge window, unless you want to take care of
it and send a version right now.

> 
> 
> From 2162e8ece4ffa09bb00abe383714a95f4b74aad8 Mon Sep 17 00:00:00 2001
> From: Peter Pan <peterpandong@micron.com>
> Date: Fri, 17 Jun 2016 10:31:59 +0800
> Subject: [PATCH] mtd: nand: fix nand helper function
> 
> nand_page_size() and nand_eraseblock_to_offs() return
> fault value. Fix them.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  include/linux/mtd/nand.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 583eb40..ffee2a7 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -162,7 +162,7 @@ static inline size_t nand_pages_to_len(struct
> nand_device *nand, int npages)
>   */
>  static inline size_t nand_page_size(struct nand_device *nand)
>  {
> -    return nand->memorg.eraseblocksize;
> +    return nand->memorg.pagesize;
>  }
> 
>  /**
> @@ -197,7 +197,7 @@ static inline size_t nand_eraseblock_size(struct
> nand_device *nand)
>  static inline loff_t nand_eraseblock_to_offs(struct nand_device *nand,
>                           int block)
>  {
> -    return (loff_t)nand->memorg.pagesize * block;
> +    return (loff_t)nand->memorg.eraseblocksize * block;
>  }
> 
>  /**
