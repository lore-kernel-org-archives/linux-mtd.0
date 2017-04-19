Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0rlP-0005Gw-Nk
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 15:43:29 +0000
Received: by mail-wr0-x242.google.com with SMTP id o21so3742133wrb.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 08:43:07 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] mtd: dataflash: Replace pr_debug, printk with
 dev_* functions
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
 <20170419152305.17226-3-andrew.smirnov@gmail.com>
Cc: cphealy@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.or
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2033d520-c908-0d89-e17f-b55f7210b69d@gmail.com>
Date: Wed, 19 Apr 2017 17:33:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170419152305.17226-3-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/19/2017 05:23 PM, Andrey Smirnov wrote:
> Lion's share of calls to pr_debug in this driver follow the pattern of
> pr_debug("%s <message>", dev_name(<dev>), <arguments>), which should
> be semantically identical to dev_dbg(<dev>, "<message>", <arguments>),
> so replace such occurencies to simplify the code.
> 
> Convert the small minority of pr_debug that do not follow pattern from
> above to use dev_dbg as well, for the sake of consistency.
> 
> Convert similar patter of printk(KERN_ERR, "%s: ...", dev_name(...),
> ...) to use dev_err instead.
> 
> No functional change intended.
> 
> Cc: cphealy@gmail.com
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Cc: linux-kernel@vger.kernel.or
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

btw where is 1/6 and 2/6 ?

-- 
Best regards,
Marek Vasut
