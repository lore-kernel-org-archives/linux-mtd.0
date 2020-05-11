Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C051C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 17:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F1302070B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 17:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NK8XJKfD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Ke9DXfek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F1302070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7igZk70AknNHFhWtuvNqnFgKsgearzBMMCfaVjdkXz0=; b=NK8XJKfDB9tgaZUabz8KT5Ckf
	JkKOM1NL567DkDhgUgFGbOHLApEsm0EvGzb0aYh91ELaUWRhFEKvxkWlAi9IvgSf4w8rgUD2PPYRF
	gd8PLTsw56T9EJ3hS2WlWTxreUtGI3YqoDdfQ3uTCFpnbQY14zKk88EgkJapYae9a3wPr+Dgx2haM
	x3olvSCEn6OoY5f5DwRhnnGpT4L3S29+Dck2rItuLvUKVAld3vy1DxMC0zKHKqaVTWaBpz/Wc60J5
	ZjrI0XbkMgp/v2jEqFdfnsm/tAPLopnCmdYuwdtxEEKWkbTwME+czR6l3kg7GjAKxc7dPJ37lDpcS
	Ko8YYiADQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYBpu-0002Z3-KV; Mon, 11 May 2020 17:03:26 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYBpl-0002Nx-Ns
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 17:03:20 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BH2cN5022580; Mon, 11 May 2020 19:03:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=fFdqkgz+ckOPjK+uqXh+/8VdlvCd7D/N0JciZfq7ZBY=;
 b=Ke9DXfekgW9O2wxAbld+LitkUu2LweglTH5nnuqdIy4Gbw8pjvDazRZPPF2CYMU6qWW5
 /UKJUP6OPVy8/GMrJ6/mja+mtG6/Trdi6yy483eHxgL2XGpJKCkKjyjOA2F/hijTQVLS
 EfKqs8HreakZM04VQo0EbFgWDoU22Em26e+BUBx8aej8F4lwuMBNoG7VX+063GjiFGqF
 dHA89acv/HqTPM+bxHlRIyInwpJmAzLJXOumER5WFPmJ1tGiILf1P2ABtvyIZxxdqk3t
 MBoUhN7oVq53xJUkgSuOfCA4ntZajw74EAWQpNYWtr7oKNpagkyPLweQiongJy8FcmR6 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgua1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 19:03:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE57510002A;
 Mon, 11 May 2020 19:03:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4DBB2B76B4;
 Mon, 11 May 2020 19:03:02 +0200 (CEST)
Received: from [10.211.5.64] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 19:02:56 +0200
Subject: Re: [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get resources from
 parent node
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13> <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
 <20200511135926.3e5c622d@xps13> <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
 <20200511145855.35c6abfb@xps13> <6f822f79-18f1-5308-16cc-b31f0be80d5a@st.com>
 <20200511164524.3f94ba31@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <f09690bf-f985-d60d-7805-6dad00b19b66@st.com>
Date: Mon, 11 May 2020 19:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511164524.3f94ba31@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_08:2020-05-11,
 2020-05-11 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_100318_237756_717B9EAB 
X-CRM114-Status: GOOD (  28.33  )
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

On 5/11/20 4:45 PM, Miquel Raynal wrote:
> Hi Christophe,
> 
> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> 2020 16:19:47 +0200:
> 
>> Hi Miquel,
>>
>> On 5/11/20 2:58 PM, Miquel Raynal wrote:
>>> Hi Christophe,
>>>
>>> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
>>> 2020 14:47:09 +0200:
>>>    
>>>> Hi Miquel,
>>>>
>>>> On 5/11/20 1:59 PM, Miquel Raynal wrote:
>>>>> Hi Christophe,
>>>>>
>>>>> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
>>>>> 2020 12:21:03 +0200:
>>>>>     >>>> Hi Miquel,
>>>>>>
>>>>>> On 5/11/20 11:18 AM, Miquel Raynal wrote:
>>>>>>> Hi Christophe,
>>>>>>>
>>>>>>> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
>>>>>>> 11:11:19 +0200:
>>>>>>>      >>>> FMC2 EBI support has been added. Common resources (registers base
>>>>>>>> and clock) are now shared between the 2 drivers. It means that the
>>>>>>>> common resources should now be found in the parent device when EBI
>>>>>>>> node is available.
>>>>>>>>
>>>>>>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>      >>>> +
>>>>>>>> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
>>>>>>>> +{
>>>>>>>> +	u32 i;
>>>>>>>> +	int nb_resources = 0;
>>>>>>>> +
>>>>>>>> +	/* Count the number of resources in reg property */
>>>>>>>> +	for (i = 0; i < pdev->num_resources; i++) {
>>>>>>>> +		struct resource *res = &pdev->resource[i];
>>>>>>>> +
>>>>>>>> +		if (resource_type(res) == IORESOURCE_MEM)
>>>>>>>> +			nb_resources++;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
>>>>>>>> +	if (nb_resources % 3)
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>> +	return true;
>>>>>>>> +}
>>>>>>>
>>>>>>> This function looks fragile. Why not just checking the compatible
>>>>>>> string of the parent node?
>>>>>>>      >>
>>>>>> Yes, it is another way to check that we have an EBI parent node.
>>>>>>
>>>>>> In this implementation, I was checking the number of reg tuples.
>>>>>> In case we have 6, it means that the register base address is defined in the parent node (EBI node).
>>>>>> In case we have 7, it means that the register base address is defined in the current node (NFC node).
>>>>>
>>>>> Yes, I understand what you are doing, but I kind of dislike the logic.
>>>>> Relying on the number of reg tuples is something that can be done (I
>>>>> used it myself one time), but I think this is more a hack that you do
>>>>> when you have no other way to differentiate. I guess the proper way
>>>>> would be to look at the parent's compatible. If it matches what you
>>>>> expect, then you can store the dev->of_node->parent->dev somewhere in
>>>>> your controller's structure and then use it to initialize the clock and
>>>>> regmap. This way you don't have to move anything else in the probe path.
>>>>>     >>
>>>> OK, I will check the compatible string of the parent device using of_device_is_compatible API in v5.
>>>> In case of the parent is found, I will add it in the structure of the controller (dev_parent).
>>>> I will rely on this field only to get the common resources (the register base address and the clock) in the NFC node or in the EBI node.
>>>
>>> I had something slightly different in mind: what about setting a
>>> default value to this field as being the controller's device itself.
>>> This way, once it is set to either the parent device or the device
>>> itself, you can use it "blindly" in your devm_clk_get/regmap_init calls?
>>>    
>>
>> I will try to explain what I have in mind.
>>
>> I will add a new field in the structure of the controller (not called dev_parent but cdev)
>> struct device *cdev;
>>
>> Then, at probe time, this field will be assigned:
>> nfc->cdev = of_device_is_compatible(dev->parent->of_node, "bla bla") : dev->parent ? dev;
> 
> That's what I had in mind. Maybe you'll have to use
> dev->of_node->parent though, I think they are not equivalent.
> 
>>
>> For the clock, it will be
>> nfc->clk = devm_clk_get(nfc->cdev, NULL);
>>
>> For the register base, I need to replace:
>> res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> mmio = devm_ioremap_resource(dev, res);
>> if (IS_ERR(mmio))
>> 	return PTR_ERR(mmio);
>>
>> nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
>> if (IS_ERR(nfc->regmap))
>> 	return PTR_ERR(nfc->regmap);
>>
>> nfc->io_phys_addr = res->start;
>>
>> With:
>>
>> ret = of_address_to_resource(nfc->cdev->of_node, 0, &res);
>> if (ret)
>> 	return ret;
>>
>> nfc->io_phys_addr = res.start;
>>
>> nfc->regmap = device_node_to_regmap(nfc->cdev->of_node);
>> if (IS_ERR(nfc->regmap))
>> 	return PTR_ERR(nfc->regmap);
>>
>> I expect that you were thinking about something like this proposal.
> 
> This means the regmap has already been initialized, can you make sure
> it is actually the case? What if the probe of the EBI block happens
> next, or is deferred? (maybe you'll get a -EPROBE_DEFER, which is fine
> then). Please try booting with the EBI node but without the EBI driver
> and see if this is handled gracefully.
> 

In case we have an EBI node, the NFC node will be a child node of the 
EBI node.
The EBI driver will first be probed, getting all its resources and then 
it will populate all its children node (including the NFC node if this 
one is enabled). If the EBI driver is deferred because of getting one of 
its resources has failed, none of its children will be probed. They will 
be probed later when the EBI driver will succeed to get all its 
resources and will then populate all of its children.

In case we have the EBI node without its driver, none of its children 
will be populated, so the NFC node will not be probed.

Here is an exemple of the bindings proposal:
     fmc: memory-controller@58002000 {
       #address-cells = <2>;
       #size-cells = <1>;
       compatible = "st,stm32mp1-fmc2-ebi";
       reg = <0x58002000 0x1000>;
       clocks = <&rcc FMC_K>;
       resets = <&rcc FMC_R>;

       ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
                <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
                <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
                <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
                <4 0 0x80000000 0x10000000>; /* NAND */

       psram@0,0 {
         compatible = "mtd-ram";
         reg = <0 0x00000000 0x100000>;
         bank-width = <2>;

         st,fmc2-ebi-cs-transaction-type = <1>;
         st,fmc2-ebi-cs-address-setup-ns = <60>;
         st,fmc2-ebi-cs-data-setup-ns = <30>;
         st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
       };

       nand-controller@4,0 {
         #address-cells = <1>;
         #size-cells = <0>;
         compatible = "st,stm32mp15-fmc2";
         reg = <4 0x00000000 0x1000>,
               <4 0x08010000 0x1000>,
               <4 0x08020000 0x1000>,
               <4 0x01000000 0x1000>,
               <4 0x09010000 0x1000>,
               <4 0x09020000 0x1000>;
         interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
         dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
                <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
                <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
         dma-names = "tx", "rx", "ecc";

         nand@0 {
           reg = <0>;
           nand-on-flash-bbt;
           #address-cells = <1>;
           #size-cells = <1>;
         };
       };
     };

Regards,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
