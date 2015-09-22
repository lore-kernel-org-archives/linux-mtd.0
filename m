Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeB7W-00035h-2k
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 00:07:42 +0000
Received: by padbj2 with SMTP id bj2so5339321pad.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 17:07:21 -0700 (PDT)
Date: Mon, 21 Sep 2015 17:07:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, sergey.senozhatsky@gmail.com,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/39] mtd: nandsim: drop null test before destroy
 functions
Message-ID: <20150922000718.GK31505@google.com>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
 <1442146532-9100-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442146532-9100-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 13, 2015 at 02:14:54PM +0200, Julia Lawall wrote:
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied patches 1 and 36 to l2-mtd.git
