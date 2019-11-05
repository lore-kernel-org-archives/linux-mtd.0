Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0DFC5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 16:04:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A48214B2
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 16:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBQY6zSr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A48214B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l997bPQIJElNs7RUM3665Vp6rsslKSBl9IO7LLkPMaY=; b=bBQY6zSrlU/3fexWvDy3TlR1p
	JD5WxSJtblPsVIrzpg/9x3Vc9AmEBDaN7s9cdQ5dXn7Lwjw9DTc9gLsu+y61BN3jpfqty7WwQCv2N
	qw1JbqjE+Z9iN/n/YIqo+kmsdiWHXYNdf0xlismGRlbiVWbUZ532CFgwBfh0GmHQa2Mlxf+bMYAjb
	jkeafEhYbNXh0rkrfbULsGEbMzgjD+EO+nUZcSEbKcmHfsnGAqLIWKfR1aFcLxZxRm610CHoUw6eR
	Myp+3BLE7lWhDZxTP3hgkmkdmgVfL/9PWWRZmL9IfBTaivmpPJ7nlfe9uXaS/C9gjqYUndxFwUh3Q
	GMfSBhGlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS1Jj-0003C9-In; Tue, 05 Nov 2019 16:04:27 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS1Jf-00039b-U0
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 16:04:25 +0000
Received: from LHREML711-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id B003DAE6B949189B4146;
 Tue,  5 Nov 2019 16:04:10 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML711-CAH.china.huawei.com (10.201.108.34) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 Nov 2019 16:04:10 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 5 Nov 2019
 16:04:09 +0000
Subject: Re: [PATCH 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Mark Brown <broonie@kernel.org>
References: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
 <1572886297-45400-3-git-send-email-john.garry@huawei.com>
 <20191104192406.GH5238@sirena.co.uk>
 <855a67dc-1356-a763-e374-540f6ac400ab@huawei.com>
 <20191105110504.GA4500@sirena.co.uk>
From: John Garry <john.garry@huawei.com>
Message-ID: <da389dda-ab38-1e68-557e-ac8c83f4ecd8@huawei.com>
Date: Tue, 5 Nov 2019 16:04:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191105110504.GA4500@sirena.co.uk>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_080424_116889_A5D315EE 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com,
 fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/11/2019 11:05, Mark Brown wrote:
> On Tue, Nov 05, 2019 at 10:58:39AM +0000, John Garry wrote:
>> On 04/11/2019 19:24, Mark Brown wrote:
>>> On Tue, Nov 05, 2019 at 12:51:36AM +0800, John Garry wrote:
> 
>>>> +		if (len) {
>>>> +			u32 val;
>>>> +
>>>> +			val = __raw_readl(host->regbase + CMD_DATABUF(words));
>>>> +
>>>> +			to += words * 4;
>>>> +			for (i = 0; i < len; i++, val >>= 8, to++)
>>>> +				*to = (u8)val;
>>>> +		}
>>>> +	} else {
>>>> +		for (i = 0; i < DIV_ROUND_UP(len, 4); i++) {
>>>> +			u32 val = __raw_readl(host->regbase + CMD_DATABUF(i));
>>>> +			int j;
> 
>>> The more usual pattern for these would be to do some unaligned accesses
>>> for the start/end of the buffer to get to alignment and then transfer
>>> the rest as aligned data.
> 
>> Yeah, I understand you, but for that I would need to generate multiple
>> transactions in the driver, and I wanted to keep 1x transaction per
>> spi_controller_mem_ops.exec_op call.
> 

Hi Mark,

>> So maybe I can do some trickery in my adjust_op_size method to generate
>> these multiple transactions: a. any unaligned start data b. the 32b-aligned
>> data b. unaligned end. I think that the HW should be able to handle that.
> 
> Right, that's what I was expecting.
> 

So that should work for xfer data commands, but generally the read/write 
reg commands in the SPI NOR layer would not use 
spi_mem_adjust_op_size(), like spi-nor.c:spi_nor_read_id(), as an example.

For these, I should be able to guarantee start alignment (since the 
buffer is kmalloc'ed), but not end alignment, so would still require 
4-byte + single byte copies for these.

Thanks,
John


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
