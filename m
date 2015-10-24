Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zq12Y-0001sf-At
 for linux-mtd@lists.infradead.org; Sat, 24 Oct 2015 15:47:31 +0000
Received: by igbkq10 with SMTP id kq10so51083916igb.0
 for <linux-mtd@lists.infradead.org>; Sat, 24 Oct 2015 08:47:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
Date: Sat, 24 Oct 2015 13:47:09 -0200
Message-ID: <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
From: Fabio Estevam <festevam@gmail.com>
To: Yuan Yao <yao.yuan@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Han Xu <b45815@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 23, 2015 at 5:53 AM, Yuan Yao <yao.yuan@freescale.com> wrote:

>  /*
> + * R/W functions for big- or little-endian registers:
> + * The qSPI controller's endian is independent of the CPU core's endian.
> + * So far, although the CPU core is little-endian but the qSPI have two
> + * versions for big-endian and little-endian.
> + */
> +static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem *addr)
> +{
> +       if (q->big_endian)
> +               iowrite32be(val, addr);
> +       else
> +               iowrite32(val, addr);
> +}

I suggest you to implement regmap support for this driver instead.

Take a look at drivers/watchdog/imx2_wdt.c for a reference.

Then you only need to pass 'big-endian' as a property for the qspi in
the .dtsi file and regmap core will take care of endianness.
