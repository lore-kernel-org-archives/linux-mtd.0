Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5UmW-0001lt-EN
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 11:49:16 +0000
Date: Thu, 27 Sep 2018 13:47:56 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 0/8] gpio-addr-flash: Support for device-tree and
 cleanup
Message-ID: <20180927134756.6a2e1317@bbrezillon>
In-Reply-To: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
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

On Wed,  5 Sep 2018 16:36:35 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> This patch series does the following:
> 
> 1) Fix bug regarding ioremap size
> 2) Cleanup code to use new APIs
> 3) Simplify numerical operations
> 4) Add support for device-tree devices
> 
> Thanks!
> 
> Changelog v2:
> 
> From Boris Brezillon:
> -Add Fixes and cc:stable
> 
> From kbuild:
> - Fix warnings
> 
> - Rebase
> 
> Ricardo Ribalda Delgado (8):
>   mtd: maps: gpio-addr-flash: Replace custom printk
>   mtd: maps: gpio-addr-flash: Fix ioremapped size
>   mtd: maps: gpio-addr-flash: Use devm_* functions
>   mtd: maps: gpio-addr-flash: Use order insted of size
>   mtd: maps: gpio-addr-flash: Replace array with an integer
>   mtd: maps: gpio-addr-flash: Split allocation in two

I'll apply patches 1 to 6 soon.

>   mtd: maps: gpio-addr-flash: Add support for device-tree devices
>   dt-binding: mtd: Document gpio-addr-flash

Still think we should move to gpio_desc before adding support for
DT.
