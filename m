Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B67C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 15:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C16C20671
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 15:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mkRKqsg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C16C20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdBYWD85kSXWo42ljfV/lL+BHCXZsrgwcnYphIuF7Y0=; b=mkRKqsg0LHh+nE
	KK7VGNGwzl6FjRsOt2DuT+rbVVQVOt/olGOLyEz18E3o6GnQHMue0wFAUjVTRXAAuG/qHkwoChlUt
	9FBqiXaoLPxrM1lECwIqufnJ7K9VeqN+MvAz4q+lj176Qair0Ul1Kxb1iDDTV55FtvBs0P4uwc8bK
	TJcrCc3tUrXYksOXAOhqoRD5O8R/J+SuSIxQwSvff600sozonuDS9XuRy0k9QNxp1K8kCB/ktNyUJ
	yhm/WPlpZSvXwrf9Wbt+rtRSYAUAFaC36jBCruiJjWcZmmV2rl7Q5jRVQ5/2XKfYwUgHlcW2O+CkE
	A5wabOy0d01zrZUbuCZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYtOc-0008R2-Hv; Wed, 13 May 2020 15:34:10 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYtOZ-0008QA-5t
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 15:34:08 +0000
IronPort-SDR: SKZj+7yD4F7MfreC43fkC+hfYVCWRVp/ZooeORgrqeoPCgKND5/HZFWav6GqvQIwtEtUR2drAF
 taOL2M9Geajw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 08:34:06 -0700
IronPort-SDR: vy2lgmYe9rC6VKwtymuZYskMIG1nHjtOprrt8bbbkB+37IzrVJhAjSdT4L/bg8ZbBCzNykt+4f
 Eb3d8mkGjR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; d="scan'208";a="463977187"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005.fm.intel.com with ESMTP; 13 May 2020 08:34:02 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1jYtOX-006Rw5-7D; Wed, 13 May 2020 18:34:05 +0300
Date: Wed, 13 May 2020 18:34:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v6 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200513153405.GS185537@smile.fi.intel.com>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_083407_228959_59BED58C 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 13, 2020 at 06:46:15PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
> 
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
> 
> NAND controller driver implements ->exec_op() to replace legacy hooks,
> these specific call-back method to execute NAND operations.

...

> +static int ebu_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ebu_nand_controller *ebu_host;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	struct resource *res;
> +	char *resname;
> +	int ret, i;
> +	u32 reg;
> +
> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> +	if (!ebu_host)
> +		return -ENOMEM;
> +
> +	ebu_host->dev = dev;
> +	nand_controller_init(&ebu_host->controller);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource_byname

> +	if (IS_ERR(ebu_host->ebu))
> +		return PTR_ERR(ebu_host->ebu);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource_byname

> +	if (IS_ERR(ebu_host->hsnand))
> +		return PTR_ERR(ebu_host->hsnand);
> +
> +	ret = device_property_read_u32(dev, "nand,cs", &reg);
> +	if (ret) {
> +		dev_err(dev, "failed to get chip select: %d\n", ret);
> +		return ret;
> +	}
> +	ebu_host->cs_num = reg;
> +
> +	for (i = 0; i < MAX_CS; i++) {
> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   resname);

if res is NULL?

> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);
> +		ebu_host->cs[i].nand_pa = res->start;
> +			if (IS_ERR(ebu_host->cs[i].chipaddr))
> +				return PTR_ERR(ebu_host->cs[i].chipaddr);

Something happened with ordering / indentation along these lines...

> +	}
> +

> +	for (i = 0; i < MAX_CS; i++) {
> +		resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", i);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   resname);

if res is NULL?

> +		ebu_host->cs[i].addr_sel = res->start;
> +		writel(ebu_host->cs[i].addr_sel | EBU_ADDR_MASK(5) |
> +		       EBU_ADDR_SEL_REGEN, ebu_host->ebu + EBU_ADDR_SEL(i));
> +	}

> +	return ret;
> +}

...

> +static int ebu_nand_remove(struct platform_device *pdev)
> +{
> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
> +

> +	if (ebu_host) {

How it can be NULL here?

> +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
> +		nand_cleanup(&ebu_host->chip);
> +		ebu_nand_disable(&ebu_host->chip);
> +
> +		if (ebu_host->dma_rx || ebu_host->dma_tx)
> +			ebu_dma_cleanup(ebu_host);
> +
> +		clk_disable_unprepare(ebu_host->clk);
> +	}
> +
> +	return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
