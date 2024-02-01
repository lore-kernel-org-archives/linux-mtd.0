Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C41FC47DDF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 10:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MILZablF8pXaAsRKd/b5maZ5OCsvHghitK1Q8ElNtnM=; b=1k89Q50Rd1xtpt
	QhNAoJmsLmJV556wgpfEWe2wougW+PZmNG6eMxZ3a5WGaHSmBmYivorpmoEVL7gYZ2zxGPLNZ877z
	jE1VDKU/GTk2m4qvJzm74Y4++iZQCMTzBQlNHGKCHoW6lLNXVZh4hj+nWP/WbAwXJibgL+vzvQx4d
	ZtvBgf8NFMDiLRng0cSTghKbO49c5USLcAuUmgBttfGOvq30gfnuW34W4vA02cfmZ1rqL/7yr6t3L
	blFQcJpuV8bpIzRlgZpPI/JhEnikhKhh0bVgl0jSfYBYxm84XKaOTDDnq1r4geaeBId6Dm+ePiHNN
	D8k95Qmf9Zr2fRyOa1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUax-00000007VdZ-1YPF;
	Thu, 01 Feb 2024 10:46:59 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUat-00000007VYC-2zcQ
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 10:46:57 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4117ln3P012513;
	Thu, 1 Feb 2024 11:46:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=yR3T7Qd/gHHnMMnYrKUioHGTtJWAAP6ehWRW92w/wQo=; b=Md
	/UJuguH4oCMt6H0/usJ/cEF97+nKtbE5oNcTdTO0j2nhpxQ+QkUPKXnXpoXuNKM9
	DtSogsztj6IhzmKHYQMF8AMHM1JiZ+sdORGxtAphJ8fUlyYUpE8k0f19mLQtcs5C
	L8vuUWPDXqfkAuMlNg2BwS0WPtlaVaNFiM5C89r7Ie7iiGC2GOaWiXVrmeOYbdxU
	OA5NOvqztKbwEQPxiF3xhHFldBJQGVzWLmK3n97voxuURw15vYoAbqmySjDHwfOJ
	CQakhXRdEpRSqttf4fs0ipPxB2cBj/oeC57gg+U8Gs3dJYjrFuweDYsuTkvrRyIf
	TsnLBbQH9yTPNCYS0xsw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vwdnp219r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 11:46:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E62DE10005D;
	Thu,  1 Feb 2024 11:46:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D344523C6B9;
	Thu,  1 Feb 2024 11:46:26 +0100 (CET)
Received: from [10.201.20.205] (10.201.20.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 1 Feb
 2024 11:46:25 +0100
Message-ID: <c75f33ce-d7a8-46db-aeab-f4406f3d9cf9@foss.st.com>
Date: Thu, 1 Feb 2024 11:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Raghavendra, Vignesh"
	<vigneshr@ti.com>, <tkuw584924@gmail.com>,
        <linux-mtd@lists.infradead.org>, <sergei.shtylyov@cogentembedded.com>,
        <geert+renesas@glider.be>, Mark Brown
	<broonie@kernel.org>,
        Christophe KERELLO <christophe.kerello@foss.st.com>
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
 <2bcf6646-b7ce-48c9-8a9b-0634c3fb40e9@ti.com>
 <508196d4-a533-47c9-bf6e-5718364c8d54@linaro.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <508196d4-a533-47c9-bf6e-5718364c8d54@linaro.org>
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_024656_396437_2C458784 
X-CRM114-Status: GOOD (  20.06  )
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



On 1/22/24 09:13, Tudor Ambarus wrote:
> 
> 
> On 1/22/24 06:25, Raghavendra, Vignesh wrote:
>>
>>
>> On 1/22/2024 11:41 AM, Tudor Ambarus wrote:
>>> + Sergei, Geert, Mark & linux-spi
>>>
>>> Hi, Sergei,
>>>
>>> On 23.05.2023 07:22, Tudor Ambarus wrote:
>>>> Hi, Takahiro, Vignesh,
>>>>
>>>>
>>>> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>
>>>>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>>>>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>>>>
>>>>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>>>>> can be switched at rutime. The default mode is selected by ordering option
>>>>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>>>>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>>>>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>>>>> set focuses on particular usage that the device is pre-configured as hyperbus
>>>>> mode for compatibility with S26Kx-S.
>>>>
>>>> I'm questioning the overall hyperbus software architecture, not your
>>>> patches per se. IMO hyperbus framework should have been written on top
>>>> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
>>>> address the SPIMEM adoption before adding/accepting new support. Would
>>>> love to hear more from Vignesh.
>>>>
>>>
>>> RPC is the only multi IO SPI controller that's upstreamed and capable of
>>> dealing with hyperflashes, but there are others which are not upstreamed
>>> yet (microchip).
>>>
>>> Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
>>> spi_mem_op`` [2] which could have been avoided if hyperflash driver was
>>> extended with SPI MEM support. This way the RPC hyperbus driver, which
>>> is an SPI controller, could have been moved to drivers/spi.
>>>
>>> Sergei, do you remember why we haven't used SPI MEM for hyberbus since
>>> the beginning? Was it something that we aimed for in a future patch set?
>>>
>>> Thanks,
>>> ta
>>>
>>> [1]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22
>>>
>>> [2]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99
>>>
>>
>> The initial hyperflash predates opening up of HyperBus protocol and
>> inclusion of it in xSPI spec. First gen Flashes followed CFI specification
>> and hence made sense to make use of cfi_cmdset_0002.c
>>
>> We did have a discussion on extending spi_mem to support xSPI profile 
>> 2.0 during the RPC_IF [3] [4].
>>
>> Overall, both Controllers and Flashes have moved away from CFI parallel 
>> flash protocol over to xSPI / SPI NOR flash protocol (profile 2.0), so I 
>> agree with Tudor's assessment that we need to move towards spi_mem in 
>> longer term. So
>>
> 
> Good, thanks Vignesh! I'll study a bit more and let you know about the
> progress on this topic.

Hi All

At STMicroelectronics we got an OSPI block which is supporting both OSPI and HyperBus protocol
similarly to the mentioned RPC-IF.

This means that we intend to split our implementation in 3 drivers as RPC-IF:
  _ backend driver including common source code to OSPI and HyperBus
  _ OSPI frontend driver
  _ HyperBus frontend driver

Following this discussion thread, we are wondering if it will be the right direction to 
choose in order to propose this implementation to MTD mailing list.

Have you an idea about time scale regarding the HyperBus migration over spi-mem ?

Thanks
Patrice


> 
> Cheers,
> ta
> 
>> a) Extend spi_mem_op to support xSPI profile 2.0 transaction template
>> b) HyperBus layer can then either be a adapter from CFI to spi_mem for CFI
>> compliant devices. And  be subsumed completely within SPI NOR for SFDP
>> compliant devices.
>> c) Move the existing controllers over to new framework.
>>
>>
>> [3] https://lore.kernel.org/all/b8224f46-fc2e-de35-0a90-a2a86cacb489@ti.com/
>> [4] https://lore.kernel.org/all/20200220084927.7a411d40@collabora.com/
>>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
