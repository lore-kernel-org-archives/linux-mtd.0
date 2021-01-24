Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4210DC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 06:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA3B229C7
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 06:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DA3B229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TR1kJwlA4IaWv4q4rpMD7/r+lVq9dh5Qr6tRq34gTVI=; b=s4yieidTiIRgzeI23FRHv2kMH
	+OHgkOVxmmOaIKqKNztG5B79zpvZUeZOt9sZPe41wYxvTRoLThcS/NYPCstISvs7tFbcI/RlJSSJe
	7rN07q5zS1cM66LvvrdGeQUcNqHUSCoh97PORX0TEbdmKluKxZrxIwsH0XbPysDhcEBobap29xph7
	9lWpgmx+HM6dU2nckeAWzbEWVA8qKGNNMwDMk1eztGy+Ac0asXtU0jnd/nNePdfhlzzfRkVpscydf
	6G7p/tD01EWPxx9mJD/7OgsN6UqbfLgohm6TlFec+NkN51SH10T9fk5tRzcy5mKwweHGbWRk6Bm2Z
	oeRYuK4bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3Yds-0006G9-Nf; Sun, 24 Jan 2021 06:12:56 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3Ydp-0006FA-2H
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 06:12:54 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10O6ChD4067966;
 Sun, 24 Jan 2021 00:12:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1611468763;
 bh=0W/Kr/XIyJ6HhmZWJT65dAKuRxo1FokxhDmLbaR6eFE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=J3dN7Cl8Y68LfS8nyWIcWVeSglBrag8JEcenCpx3SfqtrWx8duDH2EDsSpUz07N09
 QxLQeQ795pEZwQ64/a6i8edHULMJFDEaIwRT/cCbKa5k3tDFa+OkWJC57yrKi4NeKT
 HyoL5jmiOuBF0FdXhdR8Z2zU6U+VikKClffr7kKo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10O6ChkL082358
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 24 Jan 2021 00:12:43 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 24
 Jan 2021 00:12:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 24 Jan 2021 00:12:43 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10O6Ceih120955;
 Sun, 24 Jan 2021 00:12:41 -0600
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
To: <Tudor.Ambarus@microchip.com>, <yaliang.wang@windriver.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
Date: Sun, 24 Jan 2021 11:42:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_011253_273558_5DFB32AE 
X-CRM114-Status: GOOD (  24.34  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

 Hi, Yaliang

On 1/23/21 11:15 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Yaliang,
> 
[...]
>> +static int spi_nor_s25fl_l_sr_ready(struct spi_nor *nor)
>> +{
>> +	u8 *sr = nor->bouncebuf;
>> +	int ret;
>> +
>> +	ret = spi_nor_read_sr(nor, sr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/**
>> +	 * P_ERR and E_ERR bits are located in the Status Register 2
>> +	 * of Cypress FL-L series chips.
>> +	 */
>> +	ret = spi_nor_s25fl_l_read_sr2(nor, &sr[1]);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (nor->flags & SNOR_F_USE_CLSR && sr[1] & (SR_E_ERR | SR_P_ERR)) {
> If checking other manufacturer datasheets, would you please check if
> CLSR is used by any other manufacturer?
> 

This is limited to certain subsets of Cypress/Spansion flashes.

>> +		if (sr[1] & SR_E_ERR)
>> +			dev_err(nor->dev, "Erase Error occurred\n");
>> +		else
>> +			dev_err(nor->dev, "Programming Error occurred\n");
>> +
>> +		spi_nor_clear_sr(nor);
>> +
>> +		/*
>> +		 * WEL bit remains set to one when an erase or page program
>> +		 * error occurs. Issue a Write Disable command to protect
>> +		 * against inadvertent writes that can possibly corrupt the
>> +		 * contents of the memory.
>> +		 */
>> +		ret = spi_nor_write_disable(nor);
>> +		if (ret)
>> +			return ret;
>> +
>> +		return -EIO;
>> +	}
>> +
>> +	return !(sr[0] & SR_WIP);
>> +}
>> +
>>  /**
>>   * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
>>   * for new commands.
>> @@ -546,7 +628,19 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>>   */
>>  static int spi_nor_sr_ready(struct spi_nor *nor)
>>  {
>> -	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
>> +	int ret;
>> +	const struct flash_info *tmpinfo = nor->info ? nor->info : spi_nor_read_id(nor);
>> +
>> +	if (IS_ERR_OR_NULL(tmpinfo))
>> +		return -ENOENT;
>> +
>> +	if (!strcmp(tmpinfo->name, "s25fl064l")
>> +			|| !strcmp(tmpinfo->name, "s25fl128l")
>> +			|| !strcmp(tmpinfo->name, "s25fl256l")) {
>> +		return spi_nor_s25fl_l_sr_ready(nor);
>> +	}
> 
> No, we can't accept flash name comparisons in the SPI NOR core.
> If CLSR and RDSR2 are just spansion specific, we can provide a sr_ready
> function pointer that can be filled by spansion flashes. Or some other
> method depending on the CLSR and RDSR2 exposure through other
> manufacturers.
> 
> Ideally one would skim through at least 2 - 3 datasheets from each
> manufacturer available in SPI NOR. Preferable each datasheet from
> a different manufacturer family. Unfortunately I'm not aware of any
> standard that describes all the supported SPI NOR commands.
> If you find this overwhelming, I can share the workload with you,
> but at best effort. If you go through this by yourself, please
> save the name of the datasheet flashes that you go through.
> 

Agree with Tudor. There is quite a bit of variation even within
Cypress/Spansion devices. S28 series of flashes have these error bits
within SR1 register. See: https://www.cypress.com/file/513996/download

So, this cannot be in SPI NOR core.

spi_nor_xread_sr(), spi_nor_fsr_ready() and spi_nor_clear_sr() are all
vendor/family specific and should be moved to appropriate vendor
specific drivers.

Would highly appreciate it, if you could fix these up as part of your
current work. Thanks!

Regards
Vignesh

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
