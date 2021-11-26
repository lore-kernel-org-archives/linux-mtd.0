Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r36T082fTWPF3uqakWvNlXdWifcUMKqGV2dHg/1PSY=; b=Yl0sGgAfmuMSlS
	7HA4zVIWaAz5QnAHEPJBCZ8RNk8L13nbf9g+//Y/ZltGgyK163uLF5j/HbTLPhpfmY0UL5qOR3hPD
	nQlcrmYiO0uAcJFKfSdKMlEI8TYpJIWNsQamPobdpkXtQyVosuzal5RDgAhh+/hMjwKc+sgabjIVh
	cpmaImSu5icr2C7PTIPaCeGQVoNv1mfD5ixS/5mxq0qsLCQ57QrrHuQLT0iBxTDxiKB/Sqd0HUNv/
	QDOUOCk1lgJroH+/IyJr7aQH/ACud30EO43Ef0DChs23JQ+pfmpFItZZfzF4UYYcJG1xxJh0H+l3f
	NjFeGtWj1CwjEKdd5oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqcVS-00ApF2-FX; Fri, 26 Nov 2021 14:47:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqcVQ-00ApDf-4x
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 14:47:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7FD1E1F46510;
 Fri, 26 Nov 2021 14:47:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637938033; bh=7Hjrs5DDzQftuc72fSu+h83YKub/H8Od0AhrO2w3qFI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MzMYC8T7zcflgKsRx6wkSldtw5GI2aIL7VjrcjicLBMdJeVvZAYGCurU6Rbqvfh7T
 ESx2FCgYo6ECh3C/HQw/59zwz2vLT21ZTshz/2j+hM1IcIdM1XyBGZhkwsl0CuBeGz
 uvWuO3EYo5jT/3zE8TkvGXo+jV67q+OEZpxKS5BKfkpLnaPasnu0QarpNLMS1yeLL8
 JMdtEkZL0QCmfkaPPmC4VwTAyTh9UdKCvFYznKNDzN3PoBsd0nVDQ8sllfkYBlau36
 O5vqySYe1Racfe0EfNMqdawcREl/Y9jYBjn6Fho4DTaSeJ9317mRXUaJQVr7v7FmMI
 x0Ouh7W9f+G0g==
Date: Fri, 26 Nov 2021 15:47:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Boris
 Brezillon <bbrezillon@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 15/20] mtd: spinand: Create direct mapping
 descriptors for ECC operations
Message-ID: <20211126154706.2a528e72@collabora.com>
In-Reply-To: <20211126154223.28c71271@xps13>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <20211126113924.310459-16-miquel.raynal@bootlin.com>
 <20211126151352.3bdd2c1a@collabora.com>
 <20211126154223.28c71271@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_064716_369028_058EB43C 
X-CRM114-Status: GOOD (  20.74  )
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

On Fri, 26 Nov 2021 15:42:23 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > > @@ -866,6 +872,24 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
> > >  
> > >  	spinand->dirmaps[plane].rdesc = desc;
> > >  
> > > +	info.op_tmpl = *spinand->op_templates.update_cache;
> > > +	info.op_tmpl.ecc_en = true;
> > > +	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
> > > +					  spinand->spimem, &info);
> > > +	if (IS_ERR(desc))
> > > +		return PTR_ERR(desc);
> > > +
> > > +	spinand->dirmaps[plane].wdesc_ecc = desc;
> > > +
> > > +	info.op_tmpl = *spinand->op_templates.read_cache;
> > > +	info.op_tmpl.ecc_en = true;
> > > +	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
> > > +					  spinand->spimem, &info);
> > > +	if (IS_ERR(desc))
> > > +		return PTR_ERR(desc);
> > > +
> > > +	spinand->dirmaps[plane].rdesc_ecc = desc;
> > > +    
> > 
> > Direct mappings are not free (they might reserve a piece of MMIO
> > address space depending on the spi-mem controller implementation), so
> > I'd recommend creating those mapping only when strictly needed, that
> > is, when dealing with a pipelined ECC.  
> 
> That's what I tried to do in the first place, but unfortunately the
> direct mappings are instantiated at the time the SPI controller gets
> probed, which happens before the NAND flash being initialized and its
> ECC engine being picked. Hence, at this point, we don't really know what
> engine will be used with this ECC engine. I finally gave up and ended
> up creating 4 dirmaps (per lun). I know it's not optimal and in most
> cases consume more address space than needed but couldn't find a
> better solution yet :/

Why do you have to create the ECC mappings that early? Can't you just
create them after the ECC initialization is done? AFAICT, they won't be
used before that anyway.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
