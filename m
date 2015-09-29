Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZginF-0007La-Qr
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 00:29:18 +0000
Received: by pacfv12 with SMTP id fv12so192299785pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 17:28:57 -0700 (PDT)
Date: Mon, 28 Sep 2015 17:28:55 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Peng Fan <van.freenix@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: blktrans: fix multiplication overflow
Message-ID: <20150929002855.GR31505@google.com>
References: <1441978907-19520-1-git-send-email-van.freenix@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441978907-19520-1-git-send-email-van.freenix@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 11, 2015 at 09:41:47PM +0800, Peng Fan wrote:
> In drivers/mtd/mtd_blkdevs.c:
> 406	set_capacity(gd, (new->size * tr->blksize) >> 9);
> The type of new->size is unsigned long and the type of tr->blksize is int,
> the result of 'new->size * tr->blksize' may exceed ULONG_MAX on 32bit
> machines.
> 
> I use nand chip MT29F32G08CBADBWP which is 4GB and the parameters passed
> to kernel is 'mtdparts=gpmi-nand:-(user)', the whole nand chip will be
> treated as a 4GB mtd partition. new->size is 0x800000 and tr->blksize is
> 0x200, 'new->size * tr->blksize' however is 0. This is what we do not want
> to see.
> 
> Using type cast u64 to fix the multiplication overflow issue.
> 
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
> 
> Changes V2:
>  use type cast to avoid build break for platforms which does not support 64 bit multilplication.

Thanks, pushed to l2-mtd.git
