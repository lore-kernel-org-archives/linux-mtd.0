Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ABFC54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 14:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BDF206DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 14:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8c+mS4+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="BCtdLU1i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BDF206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mqsVaALWib+tVLoXxfWrcoOS1aiu3/a+r0Jskyh+DHs=; b=d8c+mS4+L+6JA9zX9aiJxjmCz
	0BHcatKsjCfXsYgZ01mfRjInCkAkTIdb5OAzFXZAtGfgYfnw5nRiQnJyEQzGtTZPDN1Ddxg17Mb2+
	+y9/PXJ9ggMwFVrwCWiEZCEG+Ctj0x9NEkkjm7v7RB/6XGStxfgVCGP/q7Z1zR6pHP5CLF2+PSI57
	QTpRAMZTSFqstl+BjZBpcWHCPrn0AZ7Wz0b5IqKEQtO0xb6Zk0TTGaRhhwLzIoxolLpFDWCsGO0Zh
	Dh7PY8VnSl7RqUCzEViIN/6x4fbppDTR3z7NJb5FTZmJ4vYZ6CZ6qv/ZrJpRDGXDBiAgKfSsG/NeC
	PYs7Ft5IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY9I1-0004PA-9C; Mon, 11 May 2020 14:20:17 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY9Hn-0002HE-Qw
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 14:20:14 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BEGcGs006570; Mon, 11 May 2020 16:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=S3ukbw9u6FBmyTso7iZC4fMons9sfi9Jz8USWlyYHr4=;
 b=BCtdLU1i1e1sY0kQKq6NHtKCA7Qa6KE+1bPXjU5tWMIsb8NrQePj6yz7jM1GBBs6Sfv7
 ciiTqp7NHfJq0KlVTvGTpF73y4W7fywa7bfaHJgHL0lYQC4EleydGZzpaNbad+n2xdDI
 oYlMatPd4BpLa8J4IqZ/JeVh44pTggoKbITnKLNDkxPc2f6nBEYXc+J565BboL/+//f+
 ZIiyg9kS0sFlKNh9jAPRtonqAYLsXrQr3ycz1Qfxee3MHT7bRSe/rfUbyZSr13RzeYCR
 hWXCayAH68a6IulyYJh+Kk6yB3QGJjUQT938jxvt2NyMxNX72fPUhsRfembY2W7cdgVU FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgtj4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 16:19:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99626100034;
 Mon, 11 May 2020 16:19:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B24D2C38B2;
 Mon, 11 May 2020 16:19:50 +0200 (CEST)
Received: from [10.211.5.64] (10.75.127.50) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 16:19:48 +0200
Subject: Re: [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get resources from
 parent node
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13> <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
 <20200511135926.3e5c622d@xps13> <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
 <20200511145855.35c6abfb@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <6f822f79-18f1-5308-16cc-b31f0be80d5a@st.com>
Date: Mon, 11 May 2020 16:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511145855.35c6abfb@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_072004_476289_4654B8FD 
X-CRM114-Status: GOOD (  22.99  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 5/11/20 2:58 PM, Miquel Raynal wrote:
> Hi Christophe,
> 
> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> 2020 14:47:09 +0200:
> 
>> Hi Miquel,
>>
>> On 5/11/20 1:59 PM, Miquel Raynal wrote:
>>> Hi Christophe,
>>>
>>> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
>>> 2020 12:21:03 +0200:
>>>    
>>>> Hi Miquel,
>>>>
>>>> On 5/11/20 11:18 AM, Miquel Raynal wrote:
>>>>> Hi Christophe,
>>>>>
>>>>> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
>>>>> 11:11:19 +0200:
>>>>>     >>>> FMC2 EBI support has been added. Common resources (registers base
>>>>>> and clock) are now shared between the 2 drivers. It means that the
>>>>>> common resources should now be found in the parent device when EBI
>>>>>> node is available.
>>>>>>
>>>>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>     >>>> +
>>>>>> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
>>>>>> +{
>>>>>> +	u32 i;
>>>>>> +	int nb_resources = 0;
>>>>>> +
>>>>>> +	/* Count the number of resources in reg property */
>>>>>> +	for (i = 0; i < pdev->num_resources; i++) {
>>>>>> +		struct resource *res = &pdev->resource[i];
>>>>>> +
>>>>>> +		if (resource_type(res) == IORESOURCE_MEM)
>>>>>> +			nb_resources++;
>>>>>> +	}
>>>>>> +
>>>>>> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
>>>>>> +	if (nb_resources % 3)
>>>>>> +		return false;
>>>>>> +
>>>>>> +	return true;
>>>>>> +}
>>>>>
>>>>> This function looks fragile. Why not just checking the compatible
>>>>> string of the parent node?
>>>>>     >>
>>>> Yes, it is another way to check that we have an EBI parent node.
>>>>
>>>> In this implementation, I was checking the number of reg tuples.
>>>> In case we have 6, it means that the register base address is defined in the parent node (EBI node).
>>>> In case we have 7, it means that the register base address is defined in the current node (NFC node).
>>>
>>> Yes, I understand what you are doing, but I kind of dislike the logic.
>>> Relying on the number of reg tuples is something that can be done (I
>>> used it myself one time), but I think this is more a hack that you do
>>> when you have no other way to differentiate. I guess the proper way
>>> would be to look at the parent's compatible. If it matches what you
>>> expect, then you can store the dev->of_node->parent->dev somewhere in
>>> your controller's structure and then use it to initialize the clock and
>>> regmap. This way you don't have to move anything else in the probe path.
>>>    
>>
>> OK, I will check the compatible string of the parent device using of_device_is_compatible API in v5.
>> In case of the parent is found, I will add it in the structure of the controller (dev_parent).
>> I will rely on this field only to get the common resources (the register base address and the clock) in the NFC node or in the EBI node.
> 
> I had something slightly different in mind: what about setting a
> default value to this field as being the controller's device itself.
> This way, once it is set to either the parent device or the device
> itself, you can use it "blindly" in your devm_clk_get/regmap_init calls?
> 

I will try to explain what I have in mind.

I will add a new field in the structure of the controller (not called 
dev_parent but cdev)
struct device *cdev;

Then, at probe time, this field will be assigned:
nfc->cdev = of_device_is_compatible(dev->parent->of_node, "bla bla") : 
dev->parent ? dev;

For the clock, it will be
nfc->clk = devm_clk_get(nfc->cdev, NULL);

For the register base, I need to replace:
res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
mmio = devm_ioremap_resource(dev, res);
if (IS_ERR(mmio))
	return PTR_ERR(mmio);

nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
if (IS_ERR(nfc->regmap))
	return PTR_ERR(nfc->regmap);

nfc->io_phys_addr = res->start;

With:

ret = of_address_to_resource(nfc->cdev->of_node, 0, &res);
if (ret)
	return ret;

nfc->io_phys_addr = res.start;

nfc->regmap = device_node_to_regmap(nfc->cdev->of_node);
if (IS_ERR(nfc->regmap))
	return PTR_ERR(nfc->regmap);

I expect that you were thinking about something like this proposal.

Regards,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
