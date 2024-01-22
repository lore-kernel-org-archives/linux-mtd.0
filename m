Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5F5C4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 06:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRelTiBBgW7NgSbq2aIbxsOogM3G6uxSMMKeVQP7Jec=; b=HXIlOU6Oc7b2a+
	7mULE5gXTLRstcHBqUJN7YetR4FEF5uE84dIlC7cD93vlw8kygfEwK+wqagVU2JsHQ6sfdZmDyddL
	Agk0iQgiWH9qkIL1v4WoF03LxRBPwrMKEpJHuwA6sqKOc0C7sagN5NsbbL5zyqIZtjahKmg68wV62
	Pmr47V9SizQxGp7eeoUpuIldM09eNVUtn7Cgcz48R7IyqSorflZjm0MWZvnLqQl89haF9te+eRztS
	DidykXIKynkp6pNFT9Qb3csx7RSYy05qSuM7+gxPHeobKGJMqBaEv0T+pZ/d947plPpKK6nF9rRaq
	P07ZLZz/JRBBhmh2P+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnkS-00AjQG-36;
	Mon, 22 Jan 2024 06:25:32 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnkN-00AjO2-2b
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 06:25:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40M6P8HR026640;
	Mon, 22 Jan 2024 00:25:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705904708;
	bh=HekASX/GPRHpln1iVnp7EtQIyKsxhK6Hf5kOxzBtZdk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U5/RmE6qmwsqCm8esPiYu9NfQBMIe6WwZc7R3wDqEBwiTMj7+yPWkUo7i02JW3DEl
	 5kmCopEtQ2auYJoeeeONY5eWNdGcrYvr8VImSStdgU/0CNE5b5Wqm+kfF14cmITrdK
	 KkhEgR8ZBzRfddgNM77gntecX721bgGu2dSpLNWo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40M6P87n019083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jan 2024 00:25:08 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 00:25:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 00:25:08 -0600
Received: from [172.24.22.63] (lt5cg1457vgj.dhcp.ti.com [172.24.22.63])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40M6P2Ow113644;
	Mon, 22 Jan 2024 00:25:03 -0600
Message-ID: <2bcf6646-b7ce-48c9-8a9b-0634c3fb40e9@ti.com>
Date: Mon, 22 Jan 2024 11:55:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
To: Tudor Ambarus <tudor.ambarus@linaro.org>, <tkuw584924@gmail.com>,
        <linux-mtd@lists.infradead.org>, <sergei.shtylyov@cogentembedded.com>,
        <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <d-gole@ti.com>, <Bacem.Daassi@infineon.com>,
        Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>,
        Boris Brezillon
	<boris.brezillon@collabora.com>,
        "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
 <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
Content-Language: en-US
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_222527_946619_9FB7AA83 
X-CRM114-Status: GOOD (  18.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 1/22/2024 11:41 AM, Tudor Ambarus wrote:
> + Sergei, Geert, Mark & linux-spi
> 
> Hi, Sergei,
> 
> On 23.05.2023 07:22, Tudor Ambarus wrote:
>> Hi, Takahiro, Vignesh,
>>
>>
>> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>>
>>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>>> can be switched at rutime. The default mode is selected by ordering option
>>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>>> set focuses on particular usage that the device is pre-configured as hyperbus
>>> mode for compatibility with S26Kx-S.
>>
>> I'm questioning the overall hyperbus software architecture, not your
>> patches per se. IMO hyperbus framework should have been written on top
>> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
>> address the SPIMEM adoption before adding/accepting new support. Would
>> love to hear more from Vignesh.
>>
> 
> RPC is the only multi IO SPI controller that's upstreamed and capable of
> dealing with hyperflashes, but there are others which are not upstreamed
> yet (microchip).
> 
> Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
> spi_mem_op`` [2] which could have been avoided if hyperflash driver was
> extended with SPI MEM support. This way the RPC hyperbus driver, which
> is an SPI controller, could have been moved to drivers/spi.
> 
> Sergei, do you remember why we haven't used SPI MEM for hyberbus since
> the beginning? Was it something that we aimed for in a future patch set?
> 
> Thanks,
> ta
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22
> 
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99
> 

The initial hyperflash predates opening up of HyperBus protocol and
inclusion of it in xSPI spec. First gen Flashes followed CFI specification
and hence made sense to make use of cfi_cmdset_0002.c

We did have a discussion on extending spi_mem to support xSPI profile 
2.0 during the RPC_IF [3] [4].

Overall, both Controllers and Flashes have moved away from CFI parallel 
flash protocol over to xSPI / SPI NOR flash protocol (profile 2.0), so I 
agree with Tudor's assessment that we need to move towards spi_mem in 
longer term. So

a) Extend spi_mem_op to support xSPI profile 2.0 transaction template
b) HyperBus layer can then either be a adapter from CFI to spi_mem for CFI
compliant devices. And  be subsumed completely within SPI NOR for SFDP
compliant devices.
c) Move the existing controllers over to new framework.


[3] https://lore.kernel.org/all/b8224f46-fc2e-de35-0a90-a2a86cacb489@ti.com/
[4] https://lore.kernel.org/all/20200220084927.7a411d40@collabora.com/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
