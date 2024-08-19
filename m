Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEB0C5320E
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEsAvnpEbxy/rbKFxvmnYKwSI54xFpr8St0WOoN3OCo=; b=UpS62ydECL45Xa
	+5Y68ztVeX1hUg34XsU5Wx8YUUbEadL28QZ4eWOecfgeTPb1auiTurhXLO+5U/z6FPtTigdEGFkra
	JwBwdUZIv2ffEdrRl38J+bCCzlr+aMb2njCX/0lkrYKsYil/0XPsA+xLMAZpNK6QWw6xcX7wH0ujd
	Xm5+8pOhqqIEo1uEPNE2ASN2F+Vg1R283ZbohHbb+MVX1vNuPKZFJSpKQGUJJSOzdZNGedXiQ7hOr
	dfbKEu7UiGxxdXdGQiaIYwdZeAo+W2EchCczcS9hn5j8ZzK3pghXLiY1p9coCY5pu/SL6yw7/WKCU
	pMpFajhLiLJ6VLx1E8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0QP-00000001D6W-2q3s;
	Mon, 19 Aug 2024 11:19:49 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0Ph-00000001CxM-2TVY;
	Mon, 19 Aug 2024 11:19:06 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428243f928cso33391535e9.3;
        Mon, 19 Aug 2024 04:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724066344; x=1724671144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sunZvLa92UkOqmspgUhzvam8WEnzIrC7wUHtIu/3w/s=;
        b=YYniIiwMjORaJB9EqTitjQPNo6BEXHmqocbMlpJ+avoaO6qvlFYAv1gZIjiMy5T7JA
         lMjnpCy2DvQTYwaxSmIRhwubj+oF+0qOpd/VYj1o0zb9S3hgqeylFpg3vXezAsHpYBxj
         5QFZUCF+oYt3VGUX+HBuUrJO9h4WcFoLapKl6qSZtRwhWBgbolMZtR2uQxCa9DcmbpMP
         hXKyZ8NIaCJJhc1tYqT72sJdj1a8d9nLKFGIJxSMWxJsc4QEP7M5+Gju8g2Pyrm7tool
         L/XJ2HxlfIE2/teSeuUkOhOeXMilqzGRdjh897DJA9xXT1ICt/zMIpPVMzDSlVYwhqnZ
         sbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj3USeODSKsEGSzX3S+A3sjl3HiHCNgh3BIcevN2H3LtBUAe5VvAnlJizcH6lSezKQiP/bUBT2LkU9FHtNkrIYYrxTry2L4t4Q8c56Gpp3yDTezOnPNRdkZeOLpDUVNJSxHx5XBNsyUgAGj1tlvITrrzOy
X-Gm-Message-State: AOJu0YxxqVQXViKcGZ2ZzoD3JuVY1ctqmEaIB97LCRfBFcPjVEtYyXuo
	1cWmeIveHVtRd0OVLloD7F+C6ooSTCmQVXunkqhNCvhNFwgXH4Aw
X-Google-Smtp-Source: AGHT+IHaE9BF0jWCsttsJkk+nv01MgngSkrhSoHa6kJlxiNainzPGo+JdtiEbmikHeT4Y6nIhCEvdA==
X-Received: by 2002:a05:600c:3152:b0:427:dae6:8416 with SMTP id 5b1f17b1804b1-429ed7d3583mr63636465e9.36.1724066343511;
        Mon, 19 Aug 2024 04:19:03 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed648f55sm106525695e9.3.2024.08.19.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:19:02 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:19:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, esben@geanix.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-3-hpchen0nvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_041905_658540_42DABE4B 
X-CRM114-Status: GOOD (  21.12  )
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

On Mon, Aug 19, 2024 at 09:20:37AM +0000, Hui-Ping Chen wrote:
> Nuvoton MA35 SoCs NAND Flash Interface Controller
> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
> 12-bit, and 24-bit hardware ECC calculation circuit
> to protect data communication.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
...

> +static int ma35_nand_probe(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int retval = 0;
> +
> +	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand_controller_init(&nand->controller);
> +
> +	nand->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nand->regs))
> +		return PTR_ERR(nand->regs);
> +
> +	nand->dev = &pdev->dev;
> +	chip = &nand->chip;
> +	mtd = nand_to_mtd(chip);
> +	nand_set_controller_data(chip, nand);
> +	nand_set_flash_node(chip, pdev->dev.of_node);
> +
> +	mtd->priv = chip;
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = &pdev->dev;
> +
> +	nand->clk = devm_clk_get(&pdev->dev, "nand_gate");
> +	if (IS_ERR(nand->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
> +				     "failed to find nand clock\n");
> +
> +	retval = clk_prepare_enable(nand->clk);
> +	if (retval < 0) {
> +		dev_err(&pdev->dev, "failed to enable clock\n");
> +		retval = -ENXIO;
> +	}
> +
> +	nand->chip.controller    = &nand->controller;
> +
> +	chip->legacy.cmdfunc     = ma35_nand_command;
> +	chip->legacy.waitfunc    = ma35_waitfunc;
> +	chip->legacy.read_byte   = ma35_nand_read_byte;
> +	chip->legacy.select_chip = ma35_nand_select_chip;
> +	chip->legacy.read_buf    = ma35_read_buf_dma;
> +	chip->legacy.write_buf   = ma35_write_buf_dma;
> +	chip->legacy.dev_ready   = ma35_nand_devready;
> +	chip->legacy.chip_delay  = 25; /* us */
> +
> +	/* Read OOB data first, then HW read page */
> +	chip->ecc.hwctl      = ma35_nand_enable_hwecc;
> +	chip->ecc.calculate  = ma35_nand_calculate_ecc;
> +	chip->ecc.correct    = ma35_nand_correct_data;
> +	chip->ecc.write_page = ma35_nand_write_page_hwecc;
> +	chip->ecc.read_page  = ma35_nand_read_page_hwecc_oob_first;
> +	chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
> +	chip->options |= (NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA);
> +
> +	ma35_nand_initialize(nand);
> +	platform_set_drvdata(pdev, nand);
> +
> +	nand->controller.ops = &ma35_nand_controller_ops;
> +
> +	nand->irq = platform_get_irq(pdev, 0);
> +	if (nand->irq < 0)
> +		return dev_err_probe(&pdev->dev, nand->irq,
> +				     "failed to get platform irq\n");
> +
> +	if (request_irq(nand->irq, ma35_nand_irq, IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
> +		dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
> +		return -ENXIO;
> +	}
> +
> +	retval = nand_scan(chip, 1);
> +	if (retval)
> +		return retval;
> +
> +	if (mtd_device_register(mtd, nand->parts, nand->nr_parts)) {
> +		nand_cleanup(chip);
> +		devm_kfree(&pdev->dev, nand);
> +		return retval;
> +	}
> +
> +	return retval;
> +}
> +
> +static void ma35_nand_remove(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &nand->chip;
> +	int ret;
> +

Where do you release IRQ handler?

> +	ret = mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);
> +	nand_cleanup(chip);
> +
> +	clk_disable_unprepare(nand->clk);
> +
> +	kfree(nand);

NAK, you never tested your code.

> +	platform_set_drvdata(pdev, NULL);

Why? Drop.

> +}
> +
> +/* PM Support */
> +#ifdef CONFIG_PM
> +static int ma35_nand_suspend(struct platform_device *pdev, pm_message_t pm)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +	unsigned long timeo = jiffies + HZ/2;
> +
> +	/* wait DMAC to ready */
> +	while (1) {
> +		if ((readl(nand->regs + MA35_NFI_REG_DMACTL) & DMA_BUSY) == 0)
> +			break;
> +		if (time_after(jiffies, timeo))
> +			return -ETIMEDOUT;
> +	}
> +
> +	clk_disable(nand->clk);
> +
> +	return 0;
> +}
> +
> +static int ma35_nand_resume(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +
> +	clk_enable(nand->clk);
> +	ma35_nand_hwecc_init(nand);
> +	ma35_nand_dmac_init(nand);
> +
> +	return 0;
> +}
> +
> +#else
> +#define ma35_nand_suspend NULL
> +#define ma35_nand_resume NULL
> +#endif
> +
> +static const struct of_device_id ma35_nfi_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-nand" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35_nfi_of_match);
> +
> +static struct platform_driver ma35_nand_driver = {
> +		.driver = {

Messed indentation.

> +		.name   = "ma35d1-nand",
> +		.owner  = THIS_MODULE,

Drop. Please do not upstream some 10 year old code... Use recent code as
template, not 10yo stuff...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
