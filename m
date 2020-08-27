Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A76AC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 07:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2461F2075B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 07:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NutGmnBR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NLCjbjog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2461F2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IzDigFhSjKdNzyNF16UpNvJZ+BGThre9wTpq1M1zJgU=; b=NutGmnBRNTb0CEouq4cjNT1jq
	YFu/ESCV90cHMkP0eaNQ25AhmT3/HN+yEgVCFjqQMBLynOdnHG8TvpX1SS9qImhOaARdEmzO9eqQc
	5rUlrjHf7rD2jyAj6CajpJykEHr5YpmsUcf0SS2k6FPA7VeTBWtkiatgehqWRV/1Wm9Afctq+VHMW
	V7uN+BfuRlXmTSORwSjDm1UmZ3aF1xon97DuHatp91Pt2aU5LQQak05Gl2qFQnPqhXBbw0p+lglBX
	+MhQcYXoCp7ql2wBygGaYacTGLcfyP4+w5xRohfC+/TpGNPKeEkN/93ioMC0rmHI2zyUTYwgqCc8X
	z4wiy+IJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBBxn-0003ba-8r; Thu, 27 Aug 2020 07:04:47 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBBxk-0003b1-AN
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 07:04:45 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R74WgK042393;
 Thu, 27 Aug 2020 02:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598511872;
 bh=260MNsf+sBTxKFsAR396C3Ut4B0Gn9sQVV96H1/dwCY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NLCjbjog8okMnENPNR3UYZPVyOn5CS5JvV//y37cuZrWRaCVJKxi/ZCMebULpbl4i
 rqTnakoUmAbTcKUvYMHPvHN9ImhsxO+H6L9x9kldAsbAwS/IFfHm4Dy90ZOH+l5dFt
 uiOD57c9Q/wMO3k2qnd58psQYZ4NABqC8BuCRvSM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R74WQH004470;
 Thu, 27 Aug 2020 02:04:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 02:04:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 02:04:31 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R74Riu008885;
 Thu, 27 Aug 2020 02:04:28 -0500
Subject: Re: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
To: Jan Kiszka <jan.kiszka@siemens.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>, "Jin, Le
 (RC-CN DF FA R&D)" <le.jin@siemens.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-6-vigneshr@ti.com>
 <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
 <8cebd31a-2366-4584-b1d1-faa30c18ed6a@ti.com>
 <dbba9f0c-4621-2d58-8fb8-4cbe788558f9@siemens.com>
 <eff1b49e-e392-8887-b3a0-3caedc5b81cc@siemens.com>
 <8995f5c5-bd6a-c0e5-1e4f-1744aedd2bcd@siemens.com>
 <5e215c3c-5603-a796-9dea-13b7c2840ed0@ti.com>
 <c090b23a-488f-6eb3-206b-a7678b70a4e2@siemens.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ed61022e-4141-9ae3-d24b-e60e42ae58e3@ti.com>
Date: Thu, 27 Aug 2020 12:34:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c090b23a-488f-6eb3-206b-a7678b70a4e2@siemens.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_030444_468992_38721BD7 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: marex@denx.de, Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 8/26/20 7:01 PM, Jan Kiszka wrote:
> On 26.08.20 14:18, Vignesh Raghavendra wrote:
>> On 8/26/20 3:42 PM, Jan Kiszka wrote:
>>> On 24.08.20 19:20, Jan Kiszka wrote:
>>>> On 24.08.20 14:49, Jan Kiszka wrote:
>>>>> On 24.08.20 13:45, Vignesh Raghavendra wrote:
>>>>>>
[...]
>> Also, there seems to be DMA mapping related issue, that was always present in 
>> older driver as well. Could you see if diff [2] fixes the issue?
>>
>> [2] Use DMA device for mapping:
>>
>> ---><8---
>>
>>
>> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
>> index b9739ae919340..a546aa4598758 100644
>> --- a/drivers/spi/spi-cadence-quadspi.c
>> +++ b/drivers/spi/spi-cadence-quadspi.c
>> @@ -901,6 +901,7 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
>>  {
>>         struct cqspi_st *cqspi = f_pdata->cqspi;
>>         struct device *dev = &cqspi->pdev->dev;
>> +       struct device *ddev = cqspi->rx_chan->device->dev;
>>         enum dma_ctrl_flags flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
>>         dma_addr_t dma_src = (dma_addr_t)cqspi->mmap_phys_base + from;
>>         int ret = 0;
>> @@ -917,8 +918,8 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
>>                 return 0;
>>         }
>>  
>> -       dma_dst = dma_map_single(dev, buf, len, DMA_FROM_DEVICE);
>> -       if (dma_mapping_error(dev, dma_dst)) {
>> +       dma_dst = dma_map_single(ddev, buf, len, DMA_FROM_DEVICE);
>> +       if (dma_mapping_error(ddev, dma_dst)) {
>>                 dev_err(dev, "dma mapping failed\n");
>>                 return -ENOMEM;
>>         }
>> @@ -952,7 +953,7 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
>>         }
>>  
>>  err_unmap:
>> -       dma_unmap_single(dev, dma_dst, len, DMA_FROM_DEVICE);
>> +       dma_unmap_single(ddev, dma_dst, len, DMA_FROM_DEVICE);
>>  
>>         return ret;
>>  }
>>
> 
> That seems to help! Wasn't able to reproduce the issue with this applied
> so far.
> 

OK, great... I will post this patch soon once I finish a bit more
testing... Thanks!


Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
