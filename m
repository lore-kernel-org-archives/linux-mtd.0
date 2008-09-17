Received: from mta23.gyao.ne.jp ([125.63.38.249] helo=mx.gate01.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KfyU4-0008LD-5w
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2008 14:58:24 +0000
Date: Wed, 17 Sep 2008 23:57:32 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
Subject: Re: [PATCH] mtd: sh_flctl: add support for Renesas SuperH FLCTL
Message-ID: <20080917145731.GA31104@linux-sh.org>
References: <48C62D1E.7020906@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48C62D1E.7020906@renesas.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 09, 2008 at 05:00:30PM +0900, Yoshihiro Shimoda wrote:
> Several Renesas SuperH CPU has FLCTL. The FLCTL support NAND Flash.
> This driver support SH7723.
> 
> Signed-off-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>

> +	flctl->reg = ioremap(res->start, res->end - res->start);
> +	if (flctl->reg == NULL) {
> +		printk(KERN_ERR "%s: ioremap error.\n", __func__);
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
You have an off-by-1 here, this wants to be res->end - res->start + 1.

Other than that, it looks ok to me at first glance.

Acked-by: Paul Mundt <lethal@linux-sh.org>
