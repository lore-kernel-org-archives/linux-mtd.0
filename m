Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E40C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:41:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873B0206A5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K03hgnWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873B0206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6gMHcv7f+gZDKMwcZ9+cd54tzdGcfNhNYnOXbd3ULQ=; b=K03hgnWmmNcV10
	CSj/Jn3BSPzhC0fEfa+iu/geQUMn3I2XVpvBdw9GXUK8yJt8yg8u/AFA0xu9BYGP1R2i5LPH9WTHO
	hIjE7WXPlWDsw8u1DcdcyYdv6KR+1XiW1r+65P4ux0nyw2SDQPVyYu/flzgIFGWFj6pSG8MC4ujqj
	smmD4E9UDc+e3tsDNDhlPmFpuO0bLbv7QiyN79KBfTIJZGlbGiVOLVxPHKY6DswFh9Orr6PcBqroO
	PE3HwiNqcukcM7qS/kNfJTRtg0z6VhSNaHMIUOLazvl+K7seegTWtvggDtXgl1iDkQ4OZxpgbf45g
	Eh0dKhHtXG5ov7ldTbXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJva-0004XZ-C2; Tue, 28 Apr 2020 06:41:10 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJvX-0004WD-MI
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:41:08 +0000
IronPort-SDR: /usn93aJVz9213KCUCoNSf9BASXeP4HEHB0cqIRvPMayWrHS0SCE34hBTclGd5eNKUbhEL/Sxk
 GkkAMFKfbktQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 23:41:05 -0700
IronPort-SDR: wMRNgtHejWu0dVLeBGehFcIgugGTqKfEXBtRJqjkh5bZwf8DaRvztJQcam/FWcmiz8CE/28E6E
 yUywd5ewAT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="459132646"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 23:41:04 -0700
Received: from [10.214.149.60] (vramuthx-mobl1.gar.corp.intel.com
 [10.214.149.60])
 by linux.intel.com (Postfix) with ESMTP id 1E6C9580BC5;
 Mon, 27 Apr 2020 23:40:59 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
Date: Tue, 28 Apr 2020 14:40:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428082759.25065146@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_234107_779530_8A8DD0CB 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx@linutronix.de,
 qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 28/4/2020 2:27 pm, Boris Brezillon wrote:
> On Tue, 28 Apr 2020 14:17:30 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Miquel,
>>
>>      Thank you very much for the review comments and your time...
>>
>> On 27/4/2020 11:51 pm, Miquel Raynal wrote:
>>> Hi Ramuthevar,
>>>    
>>>>> +static int ebu_nand_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	struct device *dev = &pdev->dev;
>>>>> +	struct ebu_nand_controller *ebu_host;
>>>>> +	struct nand_chip *nand;
>>>>> +	phys_addr_t nandaddr_pa;
>>>>> +	struct mtd_info *mtd;
>>>>> +	struct resource *res;
>>>>> +	int ret;
>>>>> +	u32 cs;
>>>>> +
>>>>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
>>>>> +	if (!ebu_host)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	ebu_host->dev = dev;
>>>>> +	nand_controller_init(&ebu_host->controller);
>>>>> +
>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>>>>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
>>>>> +	if (IS_ERR(ebu_host->ebu_addr))
>>>>> +		return PTR_ERR(ebu_host->ebu_addr);
>>>>> +
>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>>>>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
>>>>> +	if (IS_ERR(ebu_host->nand_addr))
>>>>> +		return PTR_ERR(ebu_host->nand_addr);
>>>>> +
>>>>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);
>>>>
>>>> CS ids should be encoded in the reg property (see [1]).
>>>
>>> Is it your choice to only support a single CS or is it actually a
>>> controller limitation?
>>
>> Yes , its controller limitation to support only one CS
> 
> I'm pretty sure that's not true, otherwise you wouldn't have to select
> the CS you want to use :P.

At a time it supports only one chip select.
Thanks!

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
