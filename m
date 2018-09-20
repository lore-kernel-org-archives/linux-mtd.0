Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g34uK-0005GP-B7
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 19:46:37 +0000
Received: by mail-lf1-x144.google.com with SMTP id v17-v6so5552796lfe.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2018 12:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
In-Reply-To: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 20 Sep 2018 21:46:06 +0200
Message-ID: <CAPybu_3oa14VZBCH2ndU9AYNGVj0Pvb7sR6Q=Sb6GdH-J8sLxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] gpio-addr-flash: Support for device-tree and
 cleanup
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ping?

No comments?

Thanks!
On Wed, Sep 5, 2018 at 4:36 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
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
>   mtd: maps: gpio-addr-flash: Add support for device-tree devices
>   dt-binding: mtd: Document gpio-addr-flash
>
>  .../bindings/mtd/gpio-addr-flash.txt          |  46 +++
>  drivers/mtd/maps/gpio-addr-flash.c            | 276 ++++++++++++------
>  2 files changed, 236 insertions(+), 86 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
>
> --
> 2.18.0
>


-- 
Ricardo Ribalda
