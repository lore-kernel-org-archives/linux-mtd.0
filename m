Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7CeC-0006WC-0f
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 01:05:08 +0000
Message-ID: <5588B07E.4080404@huawei.com>
Date: Tue, 23 Jun 2015 09:03:58 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: Re: [PATCH 0/2] mtd: nandsim: fix error handling
References: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ping. Any comments are appreciated :)

thanks,
Sheng

On 6/17/2015 4:45 PM, Sheng Yong wrote:
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
> 
