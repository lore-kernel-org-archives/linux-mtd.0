Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977FDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 May 2022 03:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XztEBhUvLXpxzLrCsHZPUnnTps72ZBMBMM1UdlxNVq4=; b=0Jv8wBvYfJK/bQ
	ZRByzvpV912HrcSsUOoVxR/ntXOw3VlifzmjuT/j75oz/zWvMShuWjJir/B1g31MVICk0ABLrpGQl
	Xe5X+bn6mdwAPDBvy0Ls7+M/W3ov8CY5wkRrFWAJ3xtTQlZh2tp3T9YzCQCzFN/vzM4YFgXor6WZ0
	/x9EATymxJTfFXqlrvAja6XoQGr3Ar2XnvJxCwLZPGaTyGcabxSFLR6xI7Sp6SABmcNz34FGrHKwl
	WpFc2ovrxGs+A8V2gy/sYWUvKwa36039kuDUI60v+XhDms3R64aiT8SHrbi0VihE3Aa9lj+d0lmGU
	6zatzSblnmCkUHD4z6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQUZ-00GTo7-IB; Fri, 27 May 2022 03:18:23 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQUO-00GTmX-26; Fri, 27 May 2022 03:18:13 +0000
Received: from [10.28.39.121] (10.28.39.121) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 27 May
 2022 11:18:05 +0800
Message-ID: <0fc9fc39-a4e2-85fc-ba46-5ab825e6fcbf@amlogic.com>
Date: Fri, 27 May 2022 11:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/4] mtd: rawnand: meson: refine resource getting in
 probe
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
	<bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-4-liang.yang@amlogic.com> <7hzgj48dj4.fsf@baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <7hzgj48dj4.fsf@baylibre.com>
X-Originating-IP: [10.28.39.121]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_201812_152945_E5B75F44 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On 2022/5/27 0:27, Kevin Hilman wrote:
> [ EXTERNAL EMAIL ]
> 
> Liang Yang <liang.yang@amlogic.com> writes:
> 
>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> 
> Patch should have a changelog.ok, i will add it.
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> 
>> ---
>>   drivers/mtd/nand/raw/meson_nand.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
>> index cc93667a1e7f..6e50387475bb 100644
>> --- a/drivers/mtd/nand/raw/meson_nand.c
>> +++ b/drivers/mtd/nand/raw/meson_nand.c
>> @@ -1378,7 +1378,6 @@ static int meson_nfc_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct meson_nfc *nfc;
>> -	struct resource *res;
>>   	int ret, irq;
>>   
>>   	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
>> @@ -1395,8 +1394,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
>>   
>>   	nfc->dev = dev;
>>   
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	nfc->reg_base = devm_ioremap_resource(dev, res);
>> +	nfc->reg_base = devm_platform_ioremap_resource_byname(pdev, "nfc");
>>   	if (IS_ERR(nfc->reg_base))
>>   		return PTR_ERR(nfc->reg_base);
>>   
>> -- 
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
