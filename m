Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97819C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:47:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65659206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qcby8cDN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65659206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2a95tgJ+BoGmEYIeODmmX+qLtMnwoPl647j+1FR6B1I=; b=qcby8cDNMsbuO6
	WlUTqEdqRkT/Kv+y2pjSi9t9cT3nD2QZOVQzKm3/sHYUBTrUz7hpD+p2RKcvQmADRHjeBlVpaWGIu
	LzwC+123tmX19g5wKtUz1L6JG+3tgap0M1xSgSy8vF3fbdfvXkw1+/2thOcw+nfvsCvsxVijf4/Xs
	VFyuv2wNcC3arBKbX7P5he3n7sd0ntfWwF+oMBkR+0+DHaH/rGZaplwcL+pV/u0PdpDu+Hj7aBhvD
	wDXFP4ksasWjgv1JpTq77X54ThUH3QJUdtDBSYhHcOjrDKXojRlfAEvPUf17abCcP5bthePFKzak+
	RarIWZKEC5IIcwn4pBnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTK1P-0008Ht-UK; Tue, 28 Apr 2020 06:47:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTK1N-0008HI-22
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:47:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 100B62A121D;
 Tue, 28 Apr 2020 07:47:07 +0100 (BST)
Date: Tue, 28 Apr 2020 08:47:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200428084704.5e04232a@collabora.com>
In-Reply-To: <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com>
 <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_234709_226276_03D2767C 
X-CRM114-Status: GOOD (  15.70  )
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
 masonccyang@mxic.com.tw, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 tglx@linutronix.de, qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 28 Apr 2020 14:40:58 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
> On 28/4/2020 2:27 pm, Boris Brezillon wrote:
> > On Tue, 28 Apr 2020 14:17:30 +0800
> > "Ramuthevar, Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> Hi Miquel,
> >>
> >>      Thank you very much for the review comments and your time...
> >>
> >> On 27/4/2020 11:51 pm, Miquel Raynal wrote:  
> >>> Hi Ramuthevar,
> >>>      
> >>>>> +static int ebu_nand_probe(struct platform_device *pdev)
> >>>>> +{
> >>>>> +	struct device *dev = &pdev->dev;
> >>>>> +	struct ebu_nand_controller *ebu_host;
> >>>>> +	struct nand_chip *nand;
> >>>>> +	phys_addr_t nandaddr_pa;
> >>>>> +	struct mtd_info *mtd;
> >>>>> +	struct resource *res;
> >>>>> +	int ret;
> >>>>> +	u32 cs;
> >>>>> +
> >>>>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> >>>>> +	if (!ebu_host)
> >>>>> +		return -ENOMEM;
> >>>>> +
> >>>>> +	ebu_host->dev = dev;
> >>>>> +	nand_controller_init(&ebu_host->controller);
> >>>>> +
> >>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> >>>>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
> >>>>> +	if (IS_ERR(ebu_host->ebu_addr))
> >>>>> +		return PTR_ERR(ebu_host->ebu_addr);
> >>>>> +
> >>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> >>>>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
> >>>>> +	if (IS_ERR(ebu_host->nand_addr))
> >>>>> +		return PTR_ERR(ebu_host->nand_addr);
> >>>>> +
> >>>>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);  
> >>>>
> >>>> CS ids should be encoded in the reg property (see [1]).  
> >>>
> >>> Is it your choice to only support a single CS or is it actually a
> >>> controller limitation?  
> >>
> >> Yes , its controller limitation to support only one CS  
> > 
> > I'm pretty sure that's not true, otherwise you wouldn't have to select
> > the CS you want to use :P.  
> 
> At a time it supports only one chip select.

Yes, like 99% of the NAND controllers, but that doesn't mean you can't
support multi-CS chips. All you have to do is attach an array of
ebu_nand_cs to your ebu_nand_chip (as done in the atmel driver I
pointed to). nand_operation.cs tells you which CS (index in your
ebu_nand_cs array) a specific operation is targeting, and you can pick
the right MMIO range/reg value based on that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
