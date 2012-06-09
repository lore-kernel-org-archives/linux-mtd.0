Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdI6l-0008EW-UZ
 for linux-mtd@lists.infradead.org; Sat, 09 Jun 2012 09:37:24 +0000
Received: by ghbf11 with SMTP id f11so1973920ghb.36
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jun 2012 02:37:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110103191415.GA15176@bicker>
References: <20110103191415.GA15176@bicker>
Date: Sat, 9 Jun 2012 12:37:22 +0300
Message-ID: <CA+_b7DKZ84bMnN6b9TrUNvAQfbEoW-pxOREnWqPZuUH0-NVm9w@mail.gmail.com>
Subject: Re: smatch stuff: mtd/cafe_nand: cafe_device_ready() always returns
 true
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/3/11, Dan Carpenter <error27@gmail.com> wrote:
> Hi David,
>
> cafe_device_ready() always returns 1.  It looks like something else was
> intended but I don't know the code enough to say what should go there.
>

Probably we should just change the | to an &.  I'll send a patch for that.

regards,
dan carpenter

> drivers/mtd/nand/cafe_nand.c +107 cafe_device_ready(3)
> 	warn: condition is always true
>
>    104  static int cafe_device_ready(struct mtd_info *mtd)
>    105  {
>    106          struct cafe_priv *cafe = mtd->priv;
>    107          int result = !!(cafe_readl(cafe, NAND_STATUS) | 0x40000000);
>                                                              ^^^^^^^^^^^^^
> 	This bit is always non-zero because we take the result of
> 	cafe_readl() and do a bitwize or with 0x40000000.  Then the
> 	double negate means that result is always 1.
>
>    108          uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
>    109
>
> regards,
> dan carpenter
>
>
