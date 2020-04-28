Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3502C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9BC206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CfRl+PEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9BC206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3rmSOHdvfUqSj3bP5mUhtNoFYZ7bkEnkmZ9y4dwzus=; b=CfRl+PEmtj0xC/
	7UyZ/teGXyHW72E9L3AuOvMN01UNwrEXI7Njbv0qSUX5u09scqt2/Fa4YID7Qj4OUFTTjpOiAb34B
	Ni94f6FVk9AQdJqaX6xTHJpgcSGU+iMFAtHZYbXETex79WiDJ71GiCJAbNYakvSUPQHS1v7NvK10J
	3mAG3G1QEZl9ETJacceKMn99GUtKb4HhSs2Sx+17ynjNB/kOiH8CphAx+kV+oQ66mSF526oBB87ER
	KUNCY5nuA7i4k7d/3AWVDUy65brX/Bus4ghyRGU4Nlsy50sTWEljPi/qxQQ/Ju5msvc8P/dCQo0FS
	VEtB0mOStaRzJov5DuGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJix-0001iu-NF; Tue, 28 Apr 2020 06:28:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJiu-0001hz-Nk
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:28:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35D7B2A122C;
 Tue, 28 Apr 2020 07:28:03 +0100 (BST)
Date: Tue, 28 Apr 2020 08:27:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200428082759.25065146@collabora.com>
In-Reply-To: <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com>
 <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_232804_900438_F80D75EC 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx@linutronix.de,
 qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 28 Apr 2020 14:17:30 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Miquel,
> 
>     Thank you very much for the review comments and your time...
> 
> On 27/4/2020 11:51 pm, Miquel Raynal wrote:
> > Hi Ramuthevar,
> >   
> >>> +static int ebu_nand_probe(struct platform_device *pdev)
> >>> +{
> >>> +	struct device *dev = &pdev->dev;
> >>> +	struct ebu_nand_controller *ebu_host;
> >>> +	struct nand_chip *nand;
> >>> +	phys_addr_t nandaddr_pa;
> >>> +	struct mtd_info *mtd;
> >>> +	struct resource *res;
> >>> +	int ret;
> >>> +	u32 cs;
> >>> +
> >>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> >>> +	if (!ebu_host)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	ebu_host->dev = dev;
> >>> +	nand_controller_init(&ebu_host->controller);
> >>> +
> >>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> >>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
> >>> +	if (IS_ERR(ebu_host->ebu_addr))
> >>> +		return PTR_ERR(ebu_host->ebu_addr);
> >>> +
> >>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> >>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
> >>> +	if (IS_ERR(ebu_host->nand_addr))
> >>> +		return PTR_ERR(ebu_host->nand_addr);
> >>> +
> >>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);  
> >>
> >> CS ids should be encoded in the reg property (see [1]).  
> > 
> > Is it your choice to only support a single CS or is it actually a
> > controller limitation?  
> 
> Yes , its controller limitation to support only one CS

I'm pretty sure that's not true, otherwise you wouldn't have to select
the CS you want to use :P.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
