Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmAzc-00039P-IZ
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 01:36:37 +0000
Received: by pabws5 with SMTP id ws5so6706114pab.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 18:36:15 -0700 (PDT)
Date: Tue, 13 Oct 2015 18:36:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH 1/2] mtd: fsl-quadspi: fix printk() format warning for
 size_t
Message-ID: <20151014013613.GF107187@google.com>
References: <1444682116-4708-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444682116-4708-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 12, 2015 at 01:35:15PM -0700, Brian Norris wrote:
> Seen when compile-testing on non-32-bit arch:
> 
>     CC      drivers/mtd/spi-nor/fsl-quadspi.o
>   drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_read':
>   drivers/mtd/spi-nor/fsl-quadspi.c:873:2: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t' [-Wformat=]
>     dev_dbg(q->dev, "cmd [%x],read from 0x%p, len:%d\n",
>     ^
> 
> Also drop the '0x' prefixing to the '%p' formatter, since %p already
> knows how to format pointers appropriately.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Han Xu <han.xu@freescale.com>

Pushed both to l2-mtd.git
