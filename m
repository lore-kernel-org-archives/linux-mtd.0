Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNj2k-0005qY-GS
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 15:59:19 +0000
Received: by mail-pa0-x241.google.com with SMTP id q2so4772539pap.0
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jul 2016 08:58:58 -0700 (PDT)
Date: Thu, 14 Jul 2016 08:58:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Teresa Remmet <t.remmet@phytec.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 "Cooper Jr., Franklin" <fcooper@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: omap2: add missing braces
Message-ID: <20160714155849.GA120073@google.com>
References: <20160714095416.739127-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714095416.739127-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 14, 2016 at 11:53:48AM +0200, Arnd Bergmann wrote:
> A bug fix just introduced incorrect behavior in the omap2 nand driver, as
> found by gcc-6.1:
> 
> drivers/mtd/nand/omap2.c: In function 'omap_get_dt_info':
> drivers/mtd/nand/omap2.c:1658:2: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
>   if (!info->elm_of_node)
>   ^~
> drivers/mtd/nand/omap2.c:1660:3: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
>    if (!info->elm_of_node)
>    ^~
> 
> We clearly need to put the indented code into { } braces to get the intended
> behavior.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 3bbca2c54f86 ("mtd: nand: omap2: Add check for old elm binding")

Wow, can't believe I missed that. Squashed into the original patch.

Thanks,
Brian
