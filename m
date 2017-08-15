Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhVob-0003h4-Mw
 for linux-mtd@lists.infradead.org; Tue, 15 Aug 2017 06:59:03 +0000
Received: by mail-wr0-x234.google.com with SMTP id m57so421210wrm.5
 for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2017 23:58:39 -0700 (PDT)
Date: Tue, 15 Aug 2017 07:58:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/9] mfd: tmio: Add partition parsers platform data
Message-ID: <20170815065835.jcuweb377lqioddc@dell>
References: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
 <1502743720-28672-4-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1502743720-28672-4-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Aug 2017, Andrea Adami wrote:

> With the introduction of sharpslpart partition parser we can now read the
> offsets from NAND: we specify the list of the parsers as platform data, with
> cmdlinepart and ofpart parsers first allowing to override the part. table
> written in NAND. This is done in the board files using this driver.
> 
> Thus, we need to extend tmio_nand_data to consider the partition parsers.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  include/linux/mfd/tmio.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
