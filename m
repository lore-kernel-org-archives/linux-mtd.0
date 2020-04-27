Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590DFC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:00:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC6820656
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lOsr+BF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC6820656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ip4cTzgfg7CycFFwpra5IskdDKpRtq6vzcswNa+3Sc=; b=lOsr+BF8nONrW2
	WOOBXCZBCcZAQpqD2lsg+E2nGQ+WcwWyUwCu2AdheyN6tIp4OLTTqSV8eJaEitlkcROudVoOiSrhH
	HSAdUM0q2dajISCQsfhEmLLUWwb2d4Cp4KV3wAMGJEUSLKNrtmOx7VfjY/QgnYxjkLyqyeB4XSkJm
	rN7dCc4x9N6lgYAbITOHSCpFgSLxl/kH5JjaUnpYjnkOPK/WnxBzUE/puTE+8O7mmIedgUGglTLVj
	sjWj0oxBOuDaPdwwAjRrnuLOt67zAdG/9eN/yTg9fd1v95uJooLqpc4ONCBzNwe0Qf8WauMNiE3jF
	DAiQNRPp+eR43vJ8CfNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT82l-0004ZU-PJ; Mon, 27 Apr 2020 17:59:47 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT82i-0004YO-Jr
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 17:59:46 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 499sx50vRCz1qsjt;
 Mon, 27 Apr 2020 19:59:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 499sx46dKXz1r5Pw;
 Mon, 27 Apr 2020 19:59:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id cP7Ci3_fzOg3; Mon, 27 Apr 2020 19:59:35 +0200 (CEST)
X-Auth-Info: 3Q/kzkEfkeKb3xddfAmFowML8Maab4nXQx8zhUFn5rA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Apr 2020 19:59:35 +0200 (CEST)
Subject: Re: [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage all errors
 cases at probe time
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christophe Kerello <christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
Date: Mon, 27 Apr 2020 19:59:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427194747.224a2402@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_105944_960446_CA9A5C7C 
X-CRM114-Status: GOOD (  20.80  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/27/20 7:47 PM, Miquel Raynal wrote:
> Hi Christophe,
> 
> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 15 Apr
> 2020 17:57:28 +0200:
> 
>> This patch defers its probe when the expected reset control is not
>> yet ready. This patch also handles properly all errors cases at probe
>> time.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> index b6d45cd..0a96797 100644
>> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> @@ -1967,7 +1967,11 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	rstc = devm_reset_control_get(dev, NULL);
>> -	if (!IS_ERR(rstc)) {
>> +	if (IS_ERR(rstc)) {
>> +		ret = PTR_ERR(rstc);
>> +		if (ret == -EPROBE_DEFER)
>> +			goto err_clk_disable;
>> +	} else {
>>  		reset_control_assert(rstc);
>>  		reset_control_deassert(rstc);
>>  	}
>> @@ -1975,7 +1979,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	/* DMA setup */
>>  	ret = stm32_fmc2_dma_setup(fmc2);
>>  	if (ret)
>> -		return ret;
>> +		goto err_dma_setup;
>>  
>>  	/* FMC2 init routine */
>>  	stm32_fmc2_init(fmc2);
>> @@ -1997,7 +2001,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	/* Scan to find existence of the device */
>>  	ret = nand_scan(chip, nand->ncs);
>>  	if (ret)
>> -		goto err_scan;
>> +		goto err_dma_setup;
>>  
>>  	ret = mtd_device_register(mtd, NULL, 0);
>>  	if (ret)
>> @@ -2010,7 +2014,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  err_device_register:
>>  	nand_cleanup(chip);
>>  
>> -err_scan:
>> +err_dma_setup:
>>  	if (fmc2->dma_ecc_ch)
>>  		dma_release_channel(fmc2->dma_ecc_ch);
>>  	if (fmc2->dma_tx_ch)
>> @@ -2021,6 +2025,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	sg_free_table(&fmc2->dma_data_sg);
>>  	sg_free_table(&fmc2->dma_ecc_sg);
>>  
>> +err_clk_disable:
>>  	clk_disable_unprepare(fmc2->clk);
>>  
>>  	return ret;
> 
> I didn't spot it during my earlier reviews but I really prefer using
> labels explaining what you do than having the same name of the function
> which failed. This way you don't have to rework the error path when
> you handle an additional error.
> 
> So, would you mind doing this in two steps:
> 
> 1/
> Replace
> 
>     err_scan:
> 
> with, eg.
> 
>     release_dma_objs:

The ^err_ prefix in failpath labels is useful, since it's easily
possible to match on it with regexes ; not so much on arbitrary label name.

btw would it make sense to split the first three patches of this series
into a separate series ? This rawnand part seems more like an unrelated
cleanup.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
