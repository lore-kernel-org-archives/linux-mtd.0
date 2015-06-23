Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7WEP-0006i9-Np
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 21:59:50 +0000
Received: by pdbci14 with SMTP id ci14so15670546pdb.2
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jun 2015 14:59:27 -0700 (PDT)
Date: Tue, 23 Jun 2015 14:59:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Subject: Re: [PATCH 0/2] mtd: nandsim: fix error handling
Message-ID: <20150623215917.GP4917@ld-irv-0074>
References: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, richard@nod.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 17, 2015 at 08:45:11AM +0000, Sheng Yong wrote:
> These 2 patches fix error handling when nandsim initialization fails.
> 
> In alloc_device(), if creating slab memory fails, free_device() will try
> to destroy the slab memory without checking if it exists.  PATCH 1 fixes
> it.
> 
> If something goes wrong in init_nandsim(), it calls free_device() before
> returning. However, the caller of init_nandsim() - ns_init_module() - also
> does the cleanup by calling free_nandsim(). This causes double free. PATCH
> 2 fixes it.
> 
> Thanks,
> Sheng
> 
> Sheng Yong (2):
>   mtd: nandsim: fix free of NULL pointer
>   mtd: nandsim: fix double free
> 
>  drivers/mtd/nand/nandsim.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)

This series doesn't apply cleanly to -next. Please rebase on either
linux-next.git or l2-mtd.git:

http://www.linux-mtd.infradead.org/source.html

Thanks,
Brian
