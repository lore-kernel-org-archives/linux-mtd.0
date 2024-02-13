Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB552C4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO5hxh9ep5/lHbseFpJuhsSNRU9d/v8izTJcOv0KAsc=; b=RowKTS0vN1u9gx
	P0ijL16e3orqtA1P5KWR9fy2I7SdKoz1QBackAa8duAEKYMw5ohyI8PUlz3MzElYCNKuA2D+5WDpV
	YyUVd/7qTw2Vl6Y5zfN5DjxtfX11HX+p2O8w26nBMQfGMpT8KgQfN/Sk6Vua8lnR2+PtWS1t6kvha
	8QF7QmChoVudcan0EIJ9yq8ymKHp7gfsQToBL2Rn1a9fN40na4kkOjIJCimDfW10KR1UbI95Kn5TB
	m3hW+8CrZpyoJ0Tfxe7LIxIJdUU0sIJF0VCsgd/X8pAF8Wzz5fd9RFX6gxxL+ZiL/ySyIFVtm9hvm
	dkigw61TWncJSojv3wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsdw-00000009JBo-0I8G;
	Tue, 13 Feb 2024 13:16:12 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsdp-00000009J9b-3dhs
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 13:16:10 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D9uK7w020791;
	Tue, 13 Feb 2024 14:15:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=TwqBdLRFrC89Gum8bOmwsdD/H4TwxCPDPJBEptKd63w=; b=vB
	jkosKYh6Oa7v4Bwz1I8hHagete7JZT8JIz2i/z+ARGnOjCpM6zkGitH7Ge+dC4dv
	vWmfadSXp2VNn/03uXKU2rSYN3EoFdDODiVvq7LsPCH5bXgwS9pjdKaJXQq0Ey21
	3DyPWdyGfobRBAy53wF2HsXXx+JfXf5mahIQuolL+zwZa+8J+OmL4i5MNGrodI06
	KeE3MTCAnFX7Rf2rCjgiLgeFzpZUDsrytRUmuVqLFoclodR2h+p9nYcav+Md6Wrj
	Ybz0xzDyoilO3Tk/eZ3bDAsSIZaJ8YdfRX6V3V3BkWpnMTfcQoHY2M5W95IvF7hm
	40kIyIn5KQodXc9fxShw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62ktju4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 14:15:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 31FDB4002D;
	Tue, 13 Feb 2024 14:15:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 109E424C458;
	Tue, 13 Feb 2024 14:15:08 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 14:15:07 +0100
Message-ID: <edbb5e6e-44c0-426b-9c97-87ea1eee1b4c@foss.st.com>
Date: Tue, 13 Feb 2024 14:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] memory: stm32-fmc2-ebi: add RIF support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-7-christophe.kerello@foss.st.com>
 <989661f0-f539-43c3-a332-13c0e99ed7b9@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <989661f0-f539-43c3-a332-13c0e99ed7b9@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_07,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_051606_327224_E1B42393 
X-CRM114-Status: GOOD (  27.70  )
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



On 2/13/24 08:52, Krzysztof Kozlowski wrote:
> On 12/02/2024 18:48, Christophe Kerello wrote:
>> The FMC2 revision 2 supports security and isolation compliant with
>> the Resource Isolation Framework (RIF). From RIF point of view,
>> the FMC2 is composed of several independent resources, listed below,
>> which can be assigned to different security and compartment domains:
>>    - 0: Common FMC_CFGR register.
>>    - 1: EBI controller for Chip Select 1.
>>    - 2: EBI controller for Chip Select 2.
>>    - 3: EBI controller for Chip Select 3.
>>    - 4: EBI controller for Chip Select 4.
>>    - 5: NAND controller.
>>
> 
> 
>>   	regmap_update_bits(ebi->regmap, reg, mask, setup ? mask : 0);
>>   
>>   	return 0;
>> @@ -990,6 +1023,107 @@ static const struct stm32_fmc2_prop stm32_fmc2_child_props[] = {
>>   	},
>>   };
>>   
>> +static int stm32_fmc2_ebi_check_rif(struct stm32_fmc2_ebi *ebi, u32 resource)
>> +{
>> +	u32 seccfgr, cidcfgr, semcr;
>> +	int cid;
>> +
>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>> +		return 0;
>> +
>> +	if (resource >= FMC2_MAX_RESOURCES)
>> +		return -EINVAL;
>> +
>> +	regmap_read(ebi->regmap, FMC2_SECCFGR, &seccfgr);

Hi Krzysztof,

> 
> No checking of read value?
> 

No, it should never failed.

>> +	if (seccfgr & BIT(resource)) {
> 
> Then on read failure this is random stack junk.
> 
>> +		if (resource)
>> +			dev_err(ebi->dev, "resource %d is configured as secure\n",
>> +				resource);
>> +
>> +		return -EACCES;
>> +	}
>> +
>> +	regmap_read(ebi->regmap, FMC2_CIDCFGR(resource), &cidcfgr);
>> +	if (!(cidcfgr & FMC2_CIDCFGR_CFEN))
>> +		/* CID filtering is turned off: access granted */
>> +		return 0;
>> +
>> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMEN)) {
>> +		/* Static CID mode */
>> +		cid = FIELD_GET(FMC2_CIDCFGR_SCID, cidcfgr);
>> +		if (cid != FMC2_CID1) {
>> +			if (resource)
>> +				dev_err(ebi->dev, "static CID%d set for resource %d\n",
>> +					cid, resource);
>> +
>> +			return -EACCES;
>> +		}
>> +
>> +		return 0;
>> +	}
>> +
>> +	/* Pass-list with semaphore mode */
>> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMWLC1)) {
>> +		if (resource)
>> +			dev_err(ebi->dev, "CID1 is block-listed for resource %d\n",
>> +				resource);
>> +
>> +		return -EACCES;
>> +	}
>> +
>> +	regmap_read(ebi->regmap, FMC2_SEMCR(resource), &semcr);
>> +	if (!(semcr & FMC2_SEMCR_SEM_MUTEX)) {
>> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
>> +				   FMC2_SEMCR_SEM_MUTEX, FMC2_SEMCR_SEM_MUTEX);
>> +		regmap_read(ebi->regmap, FMC2_SEMCR(resource), &semcr);
>> +	}
>> +
>> +	cid = FIELD_GET(FMC2_SEMCR_SEMCID, semcr);
>> +	if (cid != FMC2_CID1) {
>> +		if (resource)
>> +			dev_err(ebi->dev, "resource %d is already used by CID%d\n",
>> +				resource, cid);
>> +
>> +		return -EACCES;
>> +	}
>> +
>> +	ebi->sem_taken |= BIT(resource);
>> +
>> +	return 0;
>> +}
>> +
>> +static void stm32_fmc2_ebi_put_sems(struct stm32_fmc2_ebi *ebi)
>> +{
>> +	unsigned int resource;
>> +
>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>> +		return;
>> +
>> +	for (resource = 0; resource < FMC2_MAX_RESOURCES; resource++) {
>> +		if (!(ebi->sem_taken & BIT(resource)))
>> +			continue;
>> +
>> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
>> +				   FMC2_SEMCR_SEM_MUTEX, 0);
>> +	}
>> +}
>> +
>> +static void stm32_fmc2_ebi_get_sems(struct stm32_fmc2_ebi *ebi)
>> +{
>> +	unsigned int resource;
>> +
>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>> +		return;
>> +
>> +	for (resource = 0; resource < FMC2_MAX_RESOURCES; resource++) {
>> +		if (!(ebi->sem_taken & BIT(resource)))
>> +			continue;
>> +
>> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
>> +				   FMC2_SEMCR_SEM_MUTEX, FMC2_SEMCR_SEM_MUTEX);
>> +	}
>> +}
>> +
>>   static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
>>   				     struct device_node *dev_node,
>>   				     const struct stm32_fmc2_prop *prop,
>> @@ -1057,6 +1191,9 @@ static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>>   	unsigned int cs;
>>   
>>   	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
>> +		if (!(ebi->bank_assigned & BIT(cs)))
>> +			continue;
>> +
>>   		regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
>>   		regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
>>   		regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
>> @@ -1064,7 +1201,7 @@ static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>>   
>>   	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>   		regmap_read(ebi->regmap, FMC2_PCSCNTR, &ebi->pcscntr);
>> -	else
>> +	else if (ebi->access_granted)
>>   		regmap_read(ebi->regmap, FMC2_CFGR, &ebi->cfgr);
>>   }
>>   
>> @@ -1073,6 +1210,9 @@ static void stm32_fmc2_ebi_set_setup(struct stm32_fmc2_ebi *ebi)
>>   	unsigned int cs;
>>   
>>   	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
>> +		if (!(ebi->bank_assigned & BIT(cs)))
>> +			continue;
>> +
>>   		regmap_write(ebi->regmap, FMC2_BCR(cs), ebi->bcr[cs]);
>>   		regmap_write(ebi->regmap, FMC2_BTR(cs), ebi->btr[cs]);
>>   		regmap_write(ebi->regmap, FMC2_BWTR(cs), ebi->bwtr[cs]);
>> @@ -1080,7 +1220,7 @@ static void stm32_fmc2_ebi_set_setup(struct stm32_fmc2_ebi *ebi)
>>   
>>   	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>   		regmap_write(ebi->regmap, FMC2_PCSCNTR, ebi->pcscntr);
>> -	else
>> +	else if (ebi->access_granted)
>>   		regmap_write(ebi->regmap, FMC2_CFGR, ebi->cfgr);
> 
> So this is kind of half-allowed-half-not. How is it supposed to work
> with !access_granted? You configure some registers but some not. So will
> it work or not? If yes, why even needing to write to FMC2_CFGR!
> 

This register is considered as one resource and can be protected. If a
companion (like optee_os) has configured this resource as secure, it
means that the driver can not write into this register, and this
register will be handled by the companion. If this register is let as
non secure, the driver can handle this ressource.

>>   }
>>   
>> @@ -1124,7 +1264,8 @@ static void stm32_fmc2_ebi_enable(struct stm32_fmc2_ebi *ebi)
>>   	u32 mask = ebi->majrev < FMC2_VERR_MAJREV_2 ? FMC2_BCR1_FMC2EN :
>>   						      FMC2_CFGR_FMC2EN;
>>   
>> -	regmap_update_bits(ebi->regmap, reg, mask, mask);
>> +	if (ebi->access_granted)
>> +		regmap_update_bits(ebi->regmap, reg, mask, mask);
>>   }
>>   
>>   static void stm32_fmc2_ebi_disable(struct stm32_fmc2_ebi *ebi)
>> @@ -1133,7 +1274,8 @@ static void stm32_fmc2_ebi_disable(struct stm32_fmc2_ebi *ebi)
>>   	u32 mask = ebi->majrev < FMC2_VERR_MAJREV_2 ? FMC2_BCR1_FMC2EN :
>>   						      FMC2_CFGR_FMC2EN;
>>   
>> -	regmap_update_bits(ebi->regmap, reg, mask, 0);
>> +	if (ebi->access_granted)
>> +		regmap_update_bits(ebi->regmap, reg, mask, 0);
>>   }
>>   
>>   static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
>> @@ -1190,6 +1332,13 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
>>   			return -EINVAL;
>>   		}
>>   
>> +		ret = stm32_fmc2_ebi_check_rif(ebi, bank + 1);
>> +		if (ret) {
>> +			dev_err(dev, "bank access failed: %d\n", bank);
>> +			of_node_put(child);
>> +			return ret;
>> +		}
>> +
>>   		if (bank < FMC2_MAX_EBI_CE) {
>>   			ret = stm32_fmc2_ebi_setup_cs(ebi, child, bank);
>>   			if (ret) {
>> @@ -1261,6 +1410,23 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
>>   	regmap_read(ebi->regmap, FMC2_VERR, &verr);
>>   	ebi->majrev = FIELD_GET(FMC2_VERR_MAJREV, verr);
>>   
>> +	/* Check if CFGR register can be modified */
>> +	ret = stm32_fmc2_ebi_check_rif(ebi, 0);
>> +	if (!ret)
>> +		ebi->access_granted = true;
> 
> I don't understand why you need to store it. If access is not granted,
> what else is to do for this driver? Why even probing it? Why enabling
> clocks and keep everything running if it cannot work?
> 

CFGR register contains the bit that is enabling the IP. CFGR register
can be set to secure when all the others ressources can be set to non
secure. If CFGR register is secured, then we check that the IP has been
enabled by the companion. If it is the case, PSRAM controller or NAND
controller set as non secure can be used. And, if CFGR register is
secured and the IP is not enabled, the probe of the driver fails.

>> +
>> +	/* In case of CFGR is secure, just check that the FMC2 is enabled */
>> +	if (!ebi->access_granted) {
> 
> This is just "else", isn't it?

Yes, can be "else".

Regards,
Christophe Kerello.

> 
>> +		u32 sr;
>> +
>> +		regmap_read(ebi->regmap, FMC2_SR, &sr);
>> +		if (sr & FMC2_SR_ISOST) {
>> +			dev_err(dev, "FMC2 is not ready to be used.\n");
>> +			ret = -EACCES;
>> +			goto err_release;
>> +		}
>> +	}
>> +
>>   	ret = stm32_fmc2_ebi_parse_dt(ebi);
> 
>>   
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
