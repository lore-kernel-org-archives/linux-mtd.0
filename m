Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79334C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFD2206A5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uzonXVRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FFD2206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRWsHCIAhirjJvyY6zEM5jfvh6fVdrkKJ2i5mYfCc+c=; b=uzonXVRg1Bd6zq
	JIAeY8vB7qrGrIlSdDxmfCKSGJhUYfvjEx2sHN56oIsf/epOk6NK36omN7ybN61SyoIqs/0RE90Xe
	ft7ROZBEZJUx2TddhpUmLUS9igRWaIS7AhN/B5jhzQJmtUDFQ6iJru5F4FDsQ4gCIIJNJrCj5S4PX
	pghIgoC2o1smnoUCHzylU/cJR/cZbpWxfkLZYoep2AEuVWTFvEdm04V27BtNc8ZUIN9eRIMBBICBY
	4rVIGyQl7SYB42FX5InSYjpUxh70HOBswoBcMAWV75tr7dsAY2hx3QNQaiXsRDthy5Co66BCg79+I
	H8sKpUS7GcTD2qJUgihg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9vz-00052t-1E; Mon, 27 Apr 2020 20:00:55 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9vv-00051t-Bn
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 20:00:53 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 499wcw00Whz1s0RZ;
 Mon, 27 Apr 2020 22:00:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 499wcv5FBWz1r5QD;
 Mon, 27 Apr 2020 22:00:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id UwhZWkhUHdp5; Mon, 27 Apr 2020 22:00:45 +0200 (CEST)
X-Auth-Info: JMpryoad1q4gMYykW9V1aNyztGd9wWfmqkL03f1OojI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Apr 2020 22:00:45 +0200 (CEST)
Subject: Re: [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage all errors
 cases at probe time
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
 <20200427200848.722f4c56@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <3527f3b8-225d-6e5a-dd8a-0421d475f70b@denx.de>
Date: Mon, 27 Apr 2020 21:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427200848.722f4c56@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_130051_701616_FBA30804 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/27/20 8:08 PM, Miquel Raynal wrote:
[...]
>>>>  	/* FMC2 init routine */
>>>>  	stm32_fmc2_init(fmc2);
>>>> @@ -1997,7 +2001,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>  	/* Scan to find existence of the device */
>>>>  	ret = nand_scan(chip, nand->ncs);
>>>>  	if (ret)
>>>> -		goto err_scan;
>>>> +		goto err_dma_setup;
>>>>  
>>>>  	ret = mtd_device_register(mtd, NULL, 0);
>>>>  	if (ret)
>>>> @@ -2010,7 +2014,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>  err_device_register:
>>>>  	nand_cleanup(chip);
>>>>  
>>>> -err_scan:
>>>> +err_dma_setup:
>>>>  	if (fmc2->dma_ecc_ch)
>>>>  		dma_release_channel(fmc2->dma_ecc_ch);
>>>>  	if (fmc2->dma_tx_ch)
>>>> @@ -2021,6 +2025,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>  	sg_free_table(&fmc2->dma_data_sg);
>>>>  	sg_free_table(&fmc2->dma_ecc_sg);
>>>>  
>>>> +err_clk_disable:
>>>>  	clk_disable_unprepare(fmc2->clk);
>>>>  
>>>>  	return ret;  
>>>
>>> I didn't spot it during my earlier reviews but I really prefer using
>>> labels explaining what you do than having the same name of the function
>>> which failed. This way you don't have to rework the error path when
>>> you handle an additional error.
>>>
>>> So, would you mind doing this in two steps:
>>>
>>> 1/
>>> Replace
>>>
>>>     err_scan:
>>>
>>> with, eg.
>>>
>>>     release_dma_objs:  
>>
>> The ^err_ prefix in failpath labels is useful, since it's easily
>> possible to match on it with regexes ; not so much on arbitrary label name.
> 
> I guess so, but is it actually useful to catch labels in a regex? (real
> question)

I find it useful to have a unified way to find those labels, e.g.
err_because_foo:
err_because_bar:
err_last_one:
is much nicer than:
foo_failed:
bar_also_failed:
its_total_randomness:

> Any way I suppose catching ":\n" is already a good approximation to
> find labels?

Not very practical with git grep (^err.*: works nicely though)

>> btw would it make sense to split the first three patches of this series
>> into a separate series ? This rawnand part seems more like an unrelated
>> cleanup.
> 
> As it seems that the MFD discussion can take longer, then I would say
> yes, at least for the cleanup/misc changes part.
Right

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
