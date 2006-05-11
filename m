Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeJpA-0003Lc-Ee
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 18:40:15 -0400
Date: Fri, 12 May 2006 00:39:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Message-ID: <20060511223948.GG14232@wohnheim.fh-wedel.de>
References: <E1FeJBW-0002Du-BX@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1FeJBW-0002Du-BX@pentafluge.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [MTD] Basic NAND driver for AMD/NatSemi CS5535/CS5536 Geode
	companion chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 May 2006 22:59:02 +0100, Linux-MTD Mailing List wrote:
>
> +static int cs553x_device_ready(struct mtd_info *mtd)
> +{
> +	struct nand_chip *this = mtd->priv;
> +	void __iomem *mmio_base = this->IO_ADDR_R;
> +	unsigned char foo = readb(mmio_base + MM_NAND_STS);
> +
> +	return (foo & CS_NAND_STS_FLASH_RDY) && !(foo & CS_NAND_CTLR_BUSY); 

Foo?

> +	/* Initialize structures */
> +	memset((char *) new_mtd, 0, sizeof(struct mtd_info));
> +	memset((char *) this, 0, sizeof(struct nand_chip));

Why the cast?

> +	kfree (new_mtd);

Extra space.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
