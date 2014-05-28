Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpm2T-0004KW-QA
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 22:09:39 +0000
Received: by mail-pa0-f49.google.com with SMTP id kp14so1865168pab.22
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 15:09:16 -0700 (PDT)
Date: Wed, 28 May 2014 15:09:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Himangi Saraogi <himangi774@gmail.com>
Subject: [PATCH] mtd: bf5xx_nand: use the managed version of kzalloc (Re:
 [PATCH] mtd: Introduce the use of the managed version of kzalloc)
Message-ID: <20140528220912.GE3599@ld-irv-0074>
References: <20140522185848.GA15125@himangi-Dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140522185848.GA15125@himangi-Dell>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>,
 julia.lawall@lip6.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 23, 2014 at 12:28:48AM +0530, Himangi Saraogi wrote:
> This patch moves data allocated using kzalloc to managed data allocated
> using devm_kzalloc and cleans now unnecessary kfrees in probe and remove
> functions. Also, the now unnecessary label out_err_hw_init is done away
> with and the label out_err_kzalloc is renamed to out_err.
> 
> The following Coccinelle semantic patch was used for making the change:
> 
> @platform@
> identifier p, probefn, removefn;
> @@
> struct platform_driver p = {
>   .probe = probefn,
>   .remove = removefn,
> };
> 
> @prb@
> identifier platform.probefn, pdev;
> expression e, e1, e2;
> @@
> probefn(struct platform_device *pdev, ...) {
>   <+...
> - e = kzalloc(e1, e2)
> + e = devm_kzalloc(&pdev->dev, e1, e2)
>   ...
> ?-kfree(e);
>   ...+>
> }
> 
> @rem depends on prb@
> identifier platform.removefn;
> expression e;
> @@
> removefn(...) {
>   <...
> - kfree(e);
>   ...>
> }
> 
> Signed-off-by: Himangi Saraogi <himangi774@gmail.com>

Improved the subject and pushed to l2-mtd.git. Thanks!

Brian
