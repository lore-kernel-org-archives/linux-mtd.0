Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W28G3-0003Mb-3W
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 23:46:28 +0000
Date: Sat, 11 Jan 2014 23:43:53 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/4] mtd: nand: kill the the
 NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE for nand_buffers{}
Message-ID: <20140111234353.GO15937@n2100.arm.linux.org.uk>
References: <1387555350-989-1-git-send-email-shijie8@gmail.com>
 <1387555350-989-4-git-send-email-shijie8@gmail.com>
 <20140111233937.GF1992@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140111233937.GF1992@norris-Latitude-E6410>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Huang Shijie <shijie8@gmail.com>, s.hauer@pengutronix.de,
 akinobu.mita@gmail.com, josh@joshtriplett.org, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 11, 2014 at 03:39:37PM -0800, Brian Norris wrote:
> When you move this after nand_scan_ident(), you forgot to move all the code
> that uses dmabuf and dmabuf:
> 
>         /* Set up DMA address */
>         cafe_writel(cafe, cafe->dmaaddr & 0xffffffff, NAND_DMA_ADDR0);
>         if (sizeof(cafe->dmaaddr) > 4)
>                 /* Shift in two parts to shut the compiler up */
>                 cafe_writel(cafe, (cafe->dmaaddr >> 16) >> 16, NAND_DMA_ADDR1);
>         else
>                 cafe_writel(cafe, 0, NAND_DMA_ADDR1);
> 
>         cafe_dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
>                 cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
> 
> This code needs to stay after the point where you actually allocate the buffer.

You may wish to evaluate generated code differences between the above and
implementing it like this:

	u64 dmaaddr = cafe->dmaaddr;

	cafe_writel(cafe, dmaaddr, NAND_DMA_ADDR0);
	cafe_writel(cafe, dmaaddr >> 32, NAMD_DMA_ADDR1);

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
