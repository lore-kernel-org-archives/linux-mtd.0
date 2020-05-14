Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666BFC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 01:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB8F2065C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 01:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JmnWRpPQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BB8F2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjNZW8c98TLAQVgVwgFyxDcExqLHD0voQF5ynxUAFjA=; b=JmnWRpPQZr5F2g
	eboflXlNTepjz+5Kd0xU+2upKHhjgmqvXpL71Ofsj1P7gY/Of7vTTXjs5wWkCgxxEgjaYhtd7hZJz
	lYkY9xoz+LVAz2UR4/uf8Ti0ZE3vsK1tcYp8N3tvZKK1IAbNmTjwXbEN2fNu1vEycWPxD5YBCapgF
	0MoUh09SRuAkcfFJAy5Z4hqa5Gz4YjcWJd9OZIoP8FJ0GYONaFAz2SLULwRQqGO54wljATVSeeZHo
	Enas1guaeQxzN0MwKKmu+sC9A9BzKslsr4H18DW7mS0p2QSPT/0ic67xQuc/vGHtqHXPOa10oRMzt
	e+93T1xXpwRwhMbcZs2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ2Ge-0001Nn-3D; Thu, 14 May 2020 01:02:32 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ2Ga-0001NO-UR
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 01:02:30 +0000
IronPort-SDR: WX2ORI+5EFlbN7DR5Yvdu+M/GMGvkV02q1oUgptRO8zDHTaoGKVhaSpwpb06GK9/CL4ENX5/Cu
 ThVM51rS/2WA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 18:02:27 -0700
IronPort-SDR: vejgvzA8ElnatyBbGq5Yk3x7aJmddwFE43yalkoKiZyRJVGbZCjtnvH7KN49EAuDbWO+QSQmWh
 CP+RQZsvJIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,389,1583222400"; d="scan'208";a="409887144"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 18:02:27 -0700
Received: from [10.249.66.53] (vramuthx-mobl1.gar.corp.intel.com
 [10.249.66.53])
 by linux.intel.com (Postfix) with ESMTP id 0D32E580646;
 Wed, 13 May 2020 18:02:19 -0700 (PDT)
Subject: Re: [PATCH v6 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513153405.GS185537@smile.fi.intel.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9d3fc773-d7ed-f2cd-808e-78748c43b81b@linux.intel.com>
Date: Thu, 14 May 2020 09:02:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513153405.GS185537@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_180228_991986_29DC5759 
X-CRM114-Status: GOOD (  16.62  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Andy,
On 13/5/2020 11:34 pm, Andy Shevchenko wrote:
> On Wed, May 13, 2020 at 06:46:15PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> This patch adds the new IP of Nand Flash Controller(NFC) support
>> on Intel's Lightning Mountain(LGM) SoC.
>>
>> DMA is used for burst data transfer operation, also DMA HW supports
>> aligned 32bit memory address and aligned data access by default.
>> DMA burst of 8 supported. Data register used to support the read/write
>> operation from/to device.
>>
>> NAND controller driver implements ->exec_op() to replace legacy hooks,
>> these specific call-back method to execute NAND operations.
> 
> ...
> 
>> +static int ebu_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ebu_nand_controller *ebu_host;
>> +	struct nand_chip *nand;
>> +	struct mtd_info *mtd;
>> +	struct resource *res;
>> +	char *resname;
>> +	int ret, i;
>> +	u32 reg;
>> +
>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
>> +	if (!ebu_host)
>> +		return -ENOMEM;
>> +
>> +	ebu_host->dev = dev;
>> +	nand_controller_init(&ebu_host->controller);
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);
> 
> devm_platform_ioremap_resource_byname
> 
>> +	if (IS_ERR(ebu_host->ebu))
>> +		return PTR_ERR(ebu_host->ebu);
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);
> 
> devm_platform_ioremap_resource_byname
Thanks for the review comments
As Boris suggested , split into 2 API's.

> 
>> +	if (IS_ERR(ebu_host->hsnand))
>> +		return PTR_ERR(ebu_host->hsnand);
>> +
>> +	ret = device_property_read_u32(dev, "nand,cs", &reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get chip select: %d\n", ret);
>> +		return ret;
>> +	}
>> +	ebu_host->cs_num = reg;
>> +
>> +	for (i = 0; i < MAX_CS; i++) {
>> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   resname);
> 
> if res is NULL?
Noted.
> 
>> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);
>> +		ebu_host->cs[i].nand_pa = res->start;
>> +			if (IS_ERR(ebu_host->cs[i].chipaddr))
>> +				return PTR_ERR(ebu_host->cs[i].chipaddr);
> 
> Something happened with ordering / indentation along these lines...
Noted.
> 
>> +	}
>> +
> 
>> +	for (i = 0; i < MAX_CS; i++) {
>> +		resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", i);
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   resname);
> 
> if res is NULL?
Noted.

Regards
Vadivel
> 
>> +		ebu_host->cs[i].addr_sel = res->start;
>> +		writel(ebu_host->cs[i].addr_sel | EBU_ADDR_MASK(5) |
>> +		       EBU_ADDR_SEL_REGEN, ebu_host->ebu + EBU_ADDR_SEL(i));
>> +	}
> 
>> +	return ret;
>> +}
> 
> ...
> 
>> +static int ebu_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
>> +
> 
>> +	if (ebu_host) {
> 
> How it can be NULL here?
> 
>> +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
>> +		nand_cleanup(&ebu_host->chip);
>> +		ebu_nand_disable(&ebu_host->chip);
>> +
>> +		if (ebu_host->dma_rx || ebu_host->dma_tx)
>> +			ebu_dma_cleanup(ebu_host);
>> +
>> +		clk_disable_unprepare(ebu_host->clk);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
