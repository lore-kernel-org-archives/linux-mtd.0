Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D64C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYuFm4doNQKdQrGiYS0jMWN9QSUNd5ZbaG1wtAMt+MA=; b=rAGlyVAilPYSbZ
	kpM9pXlBjQ32huG9GgWs9oQz7h2wGOqN/Vn3RiaI+L4f4IIMrLUCWHhbuFDZw5fquknu70gygJGyw
	7/Fim7Y5VkypSLFD66fgcooAkYc8mVhe2HgrYCpuc1tZaqpaf+WRRebL/iPHmDWyeS9k870XquYzx
	U36p427bq8gUawJ3GMivcGVeaHmTZj9cCURBDA1KqL25AA6NoCmQ+EmLinXZdYQYr/BDbrV4pkN32
	w7hJmO/VLmooJvs6zZIbxWhYSwl8jH1VoIxF4a00U5JaPr/dlVSUg3Ha+VaO8hTwfryh/SboE9ZBG
	g08hRWMgxmsRGWM5dK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okY2L-00F3Yy-N9; Mon, 17 Oct 2022 21:52:41 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okY2I-00F3Xx-Tg
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2022 21:52:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id q19so17956743edd.10
        for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2022 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uSPRz8L/x4zaIZvnlFWanqPgSXzF0IQCjxAcmNys1g=;
        b=jir+oHr3Q9WQMzdUUsFeyKsTp9eGK+7u3wYck3PtVLmIUbzs5E5nEf3DpwGZrZs2Br
         ZXmNAE9XwORdNHrl4iwZEQlucKx5hNwG8HT6SdtdDNaf0fC8np+umLJY8eiD15BIiwsg
         Fd4sO1OOcdrilA4YJiklioGU71+CqAGZxGcAWEOjISPlKQLutST4Jq9b+rr2/MHC2Erl
         lkSmKrCEtEHlPCF+r55P+m1dzuZpTSb1qxat5AZqAHJ6z76QFhc/BqKCXc5LZgLD4kXy
         6gV5ORwVSnuPsIfafIKg9R/K7RjuVMYv4ktvnbJUmm75ZHuCsKrMuxwZeDRBl5H3zhEd
         8tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uSPRz8L/x4zaIZvnlFWanqPgSXzF0IQCjxAcmNys1g=;
        b=O37+TCPCOg9fhvNhknBRswVUpjdoEGJqOgb2waU2yDg6YVB6Dskc87RrHVyexZnJBX
         U5voRODaDSKKJ2aKPhEKkfdz9bRKkh/mIdxlIhi0JYX/iwWa/E0Wedu1m3+zvw9t0ycZ
         O2sHtd0VAzIcbmiur84RPxGYaDcWdbZ5OusenZJK0n/L1b9gRJqnXSgSSM6GHz48+oMc
         bVcCsPJhnoN6gSX1yA/FkhH6f71vUOSZ+GpYeNxUJzbtUPNjSXdHI6RKUerovg/fP9qu
         iDrd2mvzwzdv8gQFLAezj9+wqBg2WsIx5rCnPjVkdu08vicxUQK0doPqgo8SqpqFB8bB
         fPAA==
X-Gm-Message-State: ACrzQf1tLeBejx/0XWoTnsOpXvcGtODBF64OkQhXjjlk/TKCSRiztRRg
	EAsyxu9w1q4eHu8DdPptS6A=
X-Google-Smtp-Source: AMsMyM6/0V6fJjsPg/7cBjPLzZwNUZ7XVH0KICpkLIBx14ASkwjhFB2jHNNopC8sMq+N2YGDHy5GSQ==
X-Received: by 2002:a05:6402:90a:b0:458:ca4d:a2f8 with SMTP id g10-20020a056402090a00b00458ca4da2f8mr12098159edz.230.1666043555727;
        Mon, 17 Oct 2022 14:52:35 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id c7-20020aa7d607000000b0045d74aa401fsm3929612edr.60.2022.10.17.14.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 14:52:35 -0700 (PDT)
Message-ID: <d98dd483-70b9-4bd1-0463-9e3343576955@gmail.com>
Date: Mon, 17 Oct 2022 23:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v5 3/3] mtd: core: introduce of support for dynamic
 partitions
To: "han.xu" <han.xu@nxp.com>, Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Axboe
 <axboe@kernel.dk>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-4-ansuelsmth@gmail.com>
 <20221017195820.ve6c3zj2civkswm6@umbrella>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20221017195820.ve6c3zj2civkswm6@umbrella>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_145239_029623_B28D3B3E 
X-CRM114-Status: GOOD (  26.74  )
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

On 17.10.2022 21:59, han.xu wrote:
> On 22/06/06 05:14PM, Ansuel Smith wrote:
>> We have many parser that register mtd partitions at runtime. One example
>> is the cmdlinepart or the smem-part parser where the compatible is defined
>> in the dts and the partitions gets detected and registered by the
>> parser. This is problematic for the NVMEM subsystem that requires an OF node
>> to detect NVMEM cells.
>>
>> To fix this problem, introduce an additional logic that will try to
>> assign an OF node to the MTD if declared.
>>
>> On MTD addition, it will be checked if the MTD has an OF node and if
>> not declared will check if a partition with the same label is
>> declared in DTS. If an exact match is found, the partition dynamically
>> allocated by the parser will have a connected OF node.
>>
>> The NVMEM subsystem will detect the OF node and register any NVMEM cells
>> declared statically in the DTS.
>>
>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>> ---
>>   drivers/mtd/mtdcore.c | 49 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 7731796024e0..807194efb580 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -546,6 +546,54 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>   	return 0;
>>   }
>>   
>> +static void mtd_check_of_node(struct mtd_info *mtd)
>> +{
>> +	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
>> +	struct mtd_info *parent;
>> +	const char *mtd_name;
>> +	bool found = false;
>> +	int plen;
>> +
>> +	/* Check if MTD already has a device node */
>> +	if (dev_of_node(&mtd->dev))
>> +		return;
>> +
>> +	/* Check if a partitions node exist */
>> +	parent = mtd->parent;
>> +	parent_dn = dev_of_node(&parent->dev);
>> +	if (!parent_dn)
>> +		return;
>> +
>> +	partitions = of_get_child_by_name(parent_dn, "partitions");
>> +	if (!partitions)
>> +		goto exit_parent;
>> +
>> +	/* Search if a partition is defined with the same name */
>> +	for_each_child_of_node(partitions, mtd_dn) {
>> +		/* Skip partition with no label */
>> +		mtd_name = of_get_property(mtd_dn, "label", &plen);
>> +		if (!mtd_name)
>> +			continue;
>> +
>> +		if (!strncmp(mtd->name, mtd_name, plen)) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!found)
>> +		goto exit_partitions;
>> +
>> +	/* Set of_node only for nvmem */
>> +	if (of_device_is_compatible(mtd_dn, "nvmem-cells"))
>> +		mtd_set_of_node(mtd, mtd_dn);
>> +
>> +exit_partitions:
>> +	of_node_put(partitions);
>> +exit_parent:
>> +	of_node_put(parent_dn);
>> +}
>> +
>>   /**
>>    *	add_mtd_device - register an MTD device
>>    *	@mtd: pointer to new MTD device info structure
>> @@ -651,6 +699,7 @@ int add_mtd_device(struct mtd_info *mtd)
>>   	mtd->dev.devt = MTD_DEVT(i);
>>   	dev_set_name(&mtd->dev, "mtd%d", i);
>>   	dev_set_drvdata(&mtd->dev, mtd);
>> +	mtd_check_of_node(mtd);
>>   	of_node_get(mtd_get_of_node(mtd));
>>   	error = device_register(&mtd->dev);
>>   	if (error)
> 
> NXP GPMI NAND controller with 6 cmdline partitions meets refcount underflow
> with this patch. The of_node_put(parent_dn) doesn't work with cmdline parser and
> causes the issue.

Can you try:

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 18aa54460d36..0b4ca0aa4132 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -562,7 +562,7 @@ static void mtd_check_of_node(struct mtd_info *mtd)
  	if (!mtd_is_partition(mtd))
  		return;
  	parent = mtd->parent;
-	parent_dn = dev_of_node(&parent->dev);
+	parent_dn = of_node_get(dev_of_node(&parent->dev));
  	if (!parent_dn)
  		return;



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
