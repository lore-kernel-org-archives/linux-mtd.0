Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adMCR-00060H-Dq
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 18:17:40 +0000
Received: by mail-pf0-x230.google.com with SMTP id 129so18329620pfw.1
 for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2016 10:17:18 -0800 (PST)
Date: Tue, 8 Mar 2016 10:17:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 dwmw2@infradead.org, matthias.bgg@gmail.com, robh@kernel.org,
 daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Message-ID: <20160308181715.GJ55664@google.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160308172437.6eccce05@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 08, 2016 at 05:24:37PM +0100, Boris Brezillon wrote:
> On Wed,  2 Mar 2016 12:00:12 -0500
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
> > +static void mtk_nfc_hw_reset(struct mtk_nfc_host *host)
> > +{
> > +	unsigned long timeout = MTK_RESET_TIMEOUT;
> > +	struct device *dev = host->dev;
> > +	u32 val;
> > +
> > +	/* reset the state machine, data fifo and fdm data */
> > +	mtk_nfi_writel(host, CON_FIFO_FLUSH | CON_NFI_RST, MTKSDG1_NFI_CON);
> > +	timeout += jiffies;
> > +	do {
> > +		val = mtk_nfi_readl(host, MTKSDG1_NFI_MASTER_STA);
> > +		val &= MASTER_STA_MASK;
> > +		if (!val)
> > +			return;
> > +		usleep_range(50, 100);
> > +
> > +	} while (time_before(jiffies, timeout));
> 
> You may want to use readl_relaxed_poll_timeout() (even though there's
> no way to specify a range).
> This comment applies to all the places where you're implementing this
> kind of loop.

What's more, this timeout loop (and probably many of the others) is
wrong. You need to do one last status check before declaring a timeout,
since the device may become ready while you're sleeping. It's the same
problem as we've resolved here:

http://git.infradead.org/l2-mtd.git/commitdiff/9ebfdf5b18493f338237ef9861a555c2f79b0c17
Subject: "mtd: nand: check status before reporting timeout"

readl_relaxed_poll_timeout() gets this right, of course.

> > +
> > +	dev_warn(dev, "nfi master active after in reset [0x%x] = 0x%x\n",
> > +		MTKSDG1_NFI_MASTER_STA, val);
> > +};

While we're at it: you have a stray semicolon after your function
definition.

Brian
