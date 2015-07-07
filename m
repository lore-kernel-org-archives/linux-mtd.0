Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCZ1p-000517-PE
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 19:59:42 +0000
Received: by pdbci14 with SMTP id ci14so131277241pdb.2
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2015 12:59:20 -0700 (PDT)
Date: Tue, 7 Jul 2015 12:59:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH V3 0/2] mtd: nandsim: fix error handling
Message-ID: <20150707195913.GF18370@brian-ubuntu>
References: <1435198994-110948-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435198994-110948-1-git-send-email-shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 25, 2015 at 02:23:12AM +0000, Sheng Yong wrote:
> V3:
> Fix compiling error of PATCH 2 because of my silly bindly rebase without
> testing :( These 2 patches are already tested.
> 
> V2:
> Resend the patches against l2-mtd/master.
> 
> V1:
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

Pushed both to l2-mtd.git. Thanks!

Brian
