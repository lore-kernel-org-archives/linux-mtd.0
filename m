Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB87AC388F9
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 00:31:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72BF122240
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 00:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ihrwr40w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72BF122240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1kU9X3/ACxeLkhxWV2j1TuxVlGPCX4TKc9ldNvXoLw=; b=Ihrwr40wVqx1mf
	TbJqXPTAQCE52VExyK+BIVnykoigR12y6n/mCQpDP01WlMcfpTbkCzmoPtPJ4SA+UklitY/VHSB2v
	dYtXs8IlZwomVBiJq3No4Z/uF4KNY2b2ZqPLD162Dny2II4/oAhOIH+k/f+tH6R15l3R4M7NQjUoE
	dTBzFCcyOmtpLaDqFSDi97O4eqBPLlxmLWv3tp5+oze/ums1dAySmvtKSJh9TmcMkyCYHMqh10NZf
	aBAv4dZAVEyoDoSAtq2ruJ45FD2K32lhxJmmKA3Yp8+//7uLDa8RofeAW3dPHXPYYv5tx5Nz7TfR9
	Laq0ywkB+ODXGj8zFzIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfuJi-0006Lt-64; Fri, 20 Nov 2020 00:30:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfuJb-0006L5-Ob
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 00:30:21 +0000
IronPort-SDR: 43cl6+vjhIsaqR0GmYnyI8rLiIjf/spjwF2+eVLgY2zdZ9Ze1L65DurUKVs9lZ0DyDcGSjtvdk
 Ajsw5clgNZBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="159159889"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="159159889"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 16:30:08 -0800
IronPort-SDR: RMQWgMWYdT3LeRaF+AA5gw40c5DR1S77RVuHeW0wP13RKdHWx+sSFJh0s97bH3gqpNcEb/SOs7
 Xf51d2XKhnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="369040577"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 19 Nov 2020 16:30:08 -0800
Received: from [10.213.153.3] (vramuthx-MOBL1.gar.corp.intel.com
 [10.213.153.3])
 by linux.intel.com (Postfix) with ESMTP id 3B85F580409;
 Thu, 19 Nov 2020 16:29:53 -0800 (PST)
Subject: Re: [PATCH v8 3/6] spi: cadence-quadspi: Add multi-chipselect support
 for Intel LGM SoC
To: Vignesh Raghavendra <vigneshr@ti.com>, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201119055551.26493-4-vadivel.muruganx.ramuthevar@linux.intel.com>
 <9fc328cc-1f4d-1896-6dde-a107d76e14cb@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <4d0f82a8-f87d-ba75-336f-564d89083732@linux.intel.com>
Date: Fri, 20 Nov 2020 08:29:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <9fc328cc-1f4d-1896-6dde-a107d76e14cb@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_193015_974454_514E2A09 
X-CRM114-Status: GOOD (  24.05  )
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
Cc: cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
 linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

Thank you very much for the review comments...

On 19/11/2020 8:57 pm, Vignesh Raghavendra wrote:
> 
> 
> On 11/19/20 11:25 AM, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add multiple chipselect support for Intel LGM SoCs,
>> currently QSPI-NOR and QSPI-NAND supported.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   drivers/spi/spi-cadence-quadspi.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
>> index d12b765e87be..337778f75d5d 100644
>> --- a/drivers/spi/spi-cadence-quadspi.c
>> +++ b/drivers/spi/spi-cadence-quadspi.c
>> @@ -38,6 +38,7 @@
>>   
>>   /* Capabilities */
>>   #define CQSPI_SUPPORTS_OCTAL		BIT(0)
>> +#define CQSPI_SUPPORTS_MULTI_CHIPSELECT BIT(1)
>>   
>>   struct cqspi_st;
>>   
>> @@ -75,6 +76,7 @@ struct cqspi_st {
>>   	bool			is_decoded_cs;
>>   	u32			fifo_depth;
>>   	u32			fifo_width;
>> +	u32			num_chipselect;
>>   	bool			rclk_en;
>>   	u32			trigger_address;
>>   	u32			wr_delay;
>> @@ -1049,6 +1051,7 @@ static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
>>   
>>   static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
>>   {
>> +	const struct cqspi_driver_platdata *ddata;
> 
> Unused variable?
currently used for this check
if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT) {

next patch will drop it, because the above check to be removed.
> 
>>   	struct device *dev = &cqspi->pdev->dev;
>>   	struct device_node *np = dev->of_node;
>>   
>> @@ -1070,6 +1073,14 @@ static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
>>   		return -ENXIO;
>>   	}
>>   
>> +	ddata  = of_device_get_match_data(dev);
>> +	if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT) {
> 
> I don't see a need for this flag... Controller by default supports
> multiple CS.
Ok.
> 
>> +		if (of_property_read_u32(np, "num-cs", &cqspi->num_chipselect)) {
>> +			dev_err(dev, "couldn't determine number of cs\n");
>> +			return -ENXIO;
>> +		}
>> +	}
>> +
> 
> 
> Entire hunk can be replaced with:
> 
>          if (of_property_read_u32(np, "num-cs", &cqspi->num_chipselect))
> 		cqspi->num_chipselect = CQSPI_MAX_CHIPSELECT;
Noted, thanks!
> 
> 
>>   	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
>>   
>>   	return 0;
>> @@ -1302,6 +1313,9 @@ static int cqspi_probe(struct platform_device *pdev)
>>   	cqspi->current_cs = -1;
>>   	cqspi->sclk = 0;
>>   
>> +	if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT)
>> +		master->num_chipselect = cqspi->num_chipselect;
>> +
> 
> And then this becomes:
> 	master->num_chipselect = cqspi->num_chipselect;
Ok, Noted.
> 
>>   	ret = cqspi_setup_flash(cqspi);
>>   	if (ret) {
>>   		dev_err(dev, "failed to setup flash parameters %d\n", ret);
>> @@ -1391,6 +1405,7 @@ static const struct cqspi_driver_platdata am654_ospi = {
>>   };
>>   
>>   static const struct cqspi_driver_platdata intel_lgm_qspi = {
>> +	.hwcaps_mask = CQSPI_SUPPORTS_MULTI_CHIPSELECT,
>>   	.quirks = CQSPI_DISABLE_DAC_MODE,
>>   };
>>   
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
