Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBC9C83004
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C62206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dwPOSmP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9C62206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCCR8YpiAMxgogZqBVi3ZKvO9X4v1rX6OxNeUalBH4Q=; b=dwPOSmP1rfrehW
	zoC6lq9I9Zw6eSzU5laavv4BI2NIQI+IShSYeM3FXCfBZ4ZbEXMFdZULN8luaRx7OaxWGQ9qGJ5BX
	F8MjzHaXapo69DyoOr+gOssBxQWl7F/cDEMaatgg/Kuh1V9mq5UMLY4xMjNU7LpDHfhngcDxGWXd4
	1R04JPCoFYarre6erl7QIHXq2NpuUQoBwnGVqVAXNn6W3puzFbnLBA+M3yhcrpaAfqzhAk7vdVpnJ
	oPE3+RjNaK++ii9XyaQhnlDwjyGicuHzjWOWskBufXf+MJuHRY1x9B8HnrUagWiZeIZa5YOIxTV7T
	WdR1r+F+v1FhuXs2isPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTK4p-0002f9-NX; Tue, 28 Apr 2020 06:50:43 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTK4n-0002ei-Rc
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:50:43 +0000
IronPort-SDR: PDO4uW/T6fpTNiTw1OTtbCPoGJMOPBK7y5tMmyzImgBUlWZ1mpq/VXmuxCH6CeRSpLcuOazzvt
 j27hFrimnagA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 23:50:41 -0700
IronPort-SDR: qBH1RyAmnBgQYi/MRH91glO2akW96oT18OTSmcxvz2OqdEf5EIj8JoKwMQc1ApE/L5eV1rb0fI
 kEAMVUGjr/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="293775405"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 27 Apr 2020 23:50:41 -0700
Received: from [10.214.149.60] (vramuthx-MOBL1.gar.corp.intel.com
 [10.214.149.60])
 by linux.intel.com (Postfix) with ESMTP id E6E585802C8;
 Mon, 27 Apr 2020 23:50:36 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
 <20200428084704.5e04232a@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
Date: Tue, 28 Apr 2020 14:50:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428084704.5e04232a@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_235041_947696_888B7764 
X-CRM114-Status: GOOD (  16.09  )
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
 masonccyang@mxic.com.tw, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 tglx@linutronix.de, qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 28/4/2020 2:47 pm, Boris Brezillon wrote:
> On Tue, 28 Apr 2020 14:40:58 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>> On 28/4/2020 2:27 pm, Boris Brezillon wrote:
>>> On Tue, 28 Apr 2020 14:17:30 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> Hi Miquel,
>>>>
>>>>       Thank you very much for the review comments and your time...
>>>>
>>>> On 27/4/2020 11:51 pm, Miquel Raynal wrote:
>>>>> Hi Ramuthevar,
>>>>>       
>>>>>>> +static int ebu_nand_probe(struct platform_device *pdev)
>>>>>>> +{
>>>>>>> +	struct device *dev = &pdev->dev;
>>>>>>> +	struct ebu_nand_controller *ebu_host;
>>>>>>> +	struct nand_chip *nand;
>>>>>>> +	phys_addr_t nandaddr_pa;
>>>>>>> +	struct mtd_info *mtd;
>>>>>>> +	struct resource *res;
>>>>>>> +	int ret;
>>>>>>> +	u32 cs;
>>>>>>> +
>>>>>>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
>>>>>>> +	if (!ebu_host)
>>>>>>> +		return -ENOMEM;
>>>>>>> +
>>>>>>> +	ebu_host->dev = dev;
>>>>>>> +	nand_controller_init(&ebu_host->controller);
>>>>>>> +
>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>>>>>>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
>>>>>>> +	if (IS_ERR(ebu_host->ebu_addr))
>>>>>>> +		return PTR_ERR(ebu_host->ebu_addr);
>>>>>>> +
>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>>>>>>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
>>>>>>> +	if (IS_ERR(ebu_host->nand_addr))
>>>>>>> +		return PTR_ERR(ebu_host->nand_addr);
>>>>>>> +
>>>>>>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);
>>>>>>
>>>>>> CS ids should be encoded in the reg property (see [1]).
>>>>>
>>>>> Is it your choice to only support a single CS or is it actually a
>>>>> controller limitation?
>>>>
>>>> Yes , its controller limitation to support only one CS
>>>
>>> I'm pretty sure that's not true, otherwise you wouldn't have to select
>>> the CS you want to use :P.
>>
>> At a time it supports only one chip select.
> 
> Yes, like 99% of the NAND controllers, but that doesn't mean you can't
> support multi-CS chips. All you have to do is attach an array of
> ebu_nand_cs to your ebu_nand_chip (as done in the atmel driver I
> pointed to). nand_operation.cs tells you which CS (index in your
> ebu_nand_cs array) a specific operation is targeting, and you can pick
> the right MMIO range/reg value based on that.

Agreed, sure I will add that and update next series of patches .

Thanks! a lot Boris

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
