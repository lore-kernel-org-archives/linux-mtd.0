Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A893FCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcfIlWtq7sfGToQ+2Megcls3XZFN0J4ialhxN0GOZ1I=; b=V/jqhu/IKH+9r5
	Q+lwMJqjFvVgmgIkZCrHBuiy6PIgZRkjyrGqdIHhdvgPenUhP5fLSy5myQHao0Aflzw2MkCFG+Hm+
	T+7HH+SkHCLdZoC39JxRiHi4JIyHN2XWbq97+Eg+ie7yfbX4iUoApvzLlwy+d4la4kzbFRjqZiEeD
	OFIG7OP+mFTjzPeuBDYMb3OfD016C7sOBuQZhBNcCYcJ8+0/ozzx5U4us78R32uWpUol1FHlbGRqv
	ufVkL5xmhjP90VbYC8YOU+2ctOq42q6RAt1mbuyKjFFUvOziS3Vyqq6kqSFxrVRnqgIb3qzb+agQY
	wgAMGt8nMSaHehqlMe3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd2n-0000000GTi5-28lP;
	Mon, 23 Sep 2024 06:59:37 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd0I-0000000GSqq-0H8y
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 06:57:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1ssczs-0000bS-CI; Mon, 23 Sep 2024 08:56:36 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1ssczr-000teD-7N; Mon, 23 Sep 2024 08:56:35 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1ssczr-007QLc-0P;
	Mon, 23 Sep 2024 08:56:35 +0200
Date: Mon, 23 Sep 2024 08:56:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Amit Singh Tomar <amitsinght@marvell.com>
Cc: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, esben@geanix.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <ZvERI9fscLBC09_F@pengutronix.de>
References: <20240920063749.475604-1-hpchen0nvt@gmail.com>
 <20240920063749.475604-3-hpchen0nvt@gmail.com>
 <9245120b-9901-45c3-9a6e-600653f94bba@marvell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9245120b-9901-45c3-9a6e-600653f94bba@marvell.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_235702_110524_BD540D62 
X-CRM114-Status: GOOD (  20.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Amit,

On Mon, Sep 23, 2024 at 01:19:03AM +0530, Amit Singh Tomar wrote:
> Hi,
> 
> > +static int ma35_nand_do_write(struct nand_chip *chip, const u8 *addr, u32 len)
> > +{
> > +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +	dma_addr_t dma_addr;
> > +	int ret = 0, i;
> > +	u32 reg;
> > +
> > +	if (len != mtd->writesize) {
> > +		for (i = 0; i < len; i++)
> > +			writel(addr[i], nand->regs + MA35_NFI_REG_NANDDATA);
> > +		return 0;
> > +	}
> > +
> > +	ma35_nand_dmac_init(nand);
> > +
> > +	writel(mtd->oobsize, nand->regs + MA35_NFI_REG_NANDRACTL);
> > +
> > +	writel(INT_DMA, nand->regs + MA35_NFI_REG_NANDINTEN);
> > +	/* To mark this page as dirty. */
> > +	reg = readl(nand->regs + MA35_NFI_REG_NANDRA0);
> > +	if (reg & 0xffff0000)
> > +		writel(reg & 0xffff, nand->regs + MA35_NFI_REG_NANDRA0);
> > +
> > +	dma_addr = dma_map_single(nand->dev, (void *)addr, len, DMA_TO_DEVICE);
> > +	ret = dma_mapping_error(nand->dev, dma_addr);
> > +	if (ret) {
> > +		dev_err(nand->dev, "dma mapping error\n");
> > +		return -EINVAL;
> Shouldn't this return -ENOMEM or simply ret when there's an error? Also,
> should we consider unmapping the page with dma_unmap_single in that case?

When dma_map_single() returns an error the pages are not mapped, no
need to unmap then.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
