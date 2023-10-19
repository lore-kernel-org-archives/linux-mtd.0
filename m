Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CE4CDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 01:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cATCHY6I2yLBVVsFVL+5hcNVu7wwI/Cp0D50A8+MZQQ=; b=I2ydwTzFJ9xgcsv0l7wdnr1mjC
	HW+pYkg+0QLo/p6bU/w6SqbGaG9gX4kSgHQNQGPNYnbTSl6lqkMRoyFLwww8GFPV+oF0IImrnLdy0
	SBr2NZwNqD+YvqOKGgp94816uK86mbZkozxJdXgyOFQB0PCP/+0Af21AOCDKIXvrries4P4Sc/sef
	nGNcPpJkkW9Aa31cfQn7rdSdWse0Wb08NEMYnKGBnLjsO/25fvsqWG0qx4s2YWbagO42Kkgeb22Sf
	HGyt670v50aPjBtqdhK/QuY1/GmTARKqEQI4e4TK46C7EtDcgcFcCeeKaFgE0iHsr6Nz47X0cVS0G
	VOwif/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHnp-00G3wV-04;
	Thu, 19 Oct 2023 01:26:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHni-00G3vs-0q
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 01:26:18 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S9qh11GNJzNp24;
	Thu, 19 Oct 2023 09:22:09 +0800 (CST)
Received: from [10.67.110.164] (10.67.110.164) by
 kwepemm000014.china.huawei.com (7.193.23.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 19 Oct 2023 09:26:08 +0800
Subject: Re: [PATCH] mtd: powernv_flash: check return value of
 devm_kasprintf()
To: Michael Ellerman <mpe@ellerman.id.au>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <u.kleine-koenig@pengutronix.de>,
	<tudor.ambarus@linaro.org>, <robh@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>
References: <20231018092728.315071-1-yiyang13@huawei.com>
 <874jin76ou.fsf@mail.lhotse>
From: "yiyang (D)" <yiyang13@huawei.com>
Message-ID: <0aa58cef-182a-ba75-d362-822d434c67d3@huawei.com>
Date: Thu, 19 Oct 2023 09:26:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <874jin76ou.fsf@mail.lhotse>
X-Originating-IP: [10.67.110.164]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_182614_490942_B6DC89EF 
X-CRM114-Status: GOOD (  12.05  )
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

On 2023/10/19 9:16, Michael Ellerman wrote:
> Yi Yang <yiyang13@huawei.com> writes:
>> The devm_kasprintf() returns a pointer to dynamically allocated memory.
>> that will return NULL when allocate failed.
>> Fix it by check return value of devm_kasprintf().
>>
>> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
>> ---
>>   drivers/mtd/devices/powernv_flash.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
>> index 66044f4f5bad..b305e555ddbf 100644
>> --- a/drivers/mtd/devices/powernv_flash.c
>> +++ b/drivers/mtd/devices/powernv_flash.c
>> @@ -207,6 +207,10 @@ static int powernv_flash_set_driver_info(struct device *dev,
>>   	 * get them
>>   	 */
>>   	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
>> +	if (mtd->name) {
> 
> That seems like the wrong check?
> 
> cheers
> 
You're right, I'm fixing this in v2 patch.

Thanks,
Yi Yang

>> +		dev_err(dev, "failed to allocate mtd->name\n");
>> +		return -ENOMEM;
>> +	}
>>   	mtd->type = MTD_NORFLASH;
>>   	mtd->flags = MTD_WRITEABLE;
>>   	mtd->size = size;
>> -- 
>> 2.25.1
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
