Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13955C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C14DF2074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PQ5TfyAH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l55CFcoK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C14DF2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJFePotVWryVXHkn0ouD3wHbgFJPEdd8gUunN7hyXBQ=; b=PQ5TfyAHKJoc9J
	MCg45UdS1AtkrUfoKCZ/lzTJ+HGOnufrQ9aeVj5jbaDJN9j1MC3t6v0lSlbsb6rsl0sJkFDWsDa12
	B4ZoVPhhl9jfwPgfQTZhafpvs35VgOvSeS/W+KBorvpJ6wTUne9wkIEo2JeeqparNOKeaEfjEl/44
	20aUDkgoxe/uhVh8FKeHwk4Vb2lO8ReiXXZYAbE0rWPTh4CxlEMHrLOm+pNEt4er1h+ODX/F/nw5d
	s8u6zH9QKrW+KcUkgcLfzCRSbHANipxmrfXfBqv/ME7W8yQah67k+UJGHBqxCb6dUpde6/98lJjt1
	gq2wpJ2CrO7isCxbGL+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfeYG-0007kq-4O; Mon, 01 Jun 2020 07:08:04 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfeYD-0007kW-A2
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 07:08:02 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05177vKN045270;
 Mon, 1 Jun 2020 02:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590995277;
 bh=HujvC9+RO9ZJaECM24aGaK8D8JBb+/kqNVtAgxq9pPk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=l55CFcoKJdXDqmzmZVtq7ZhWprtMMwoVo9BWlss94YxE0W86YSb1BhWbk29trdCxC
 aEzLmuauiBuyrfDEAJsK5fRsYbUSTG6WSVjg61evXUl07ybSEAlxdHet1DadubUAo0
 D+V/6/Yuuv79zH17So/H2EupzTZ67lRtzA0Anr90=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05177vM0089087
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jun 2020 02:07:57 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 02:07:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 02:07:57 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05177rAQ015505;
 Mon, 1 Jun 2020 02:07:54 -0500
Subject: Re: [PATCH v3 8/8] spi: Move cadence-quadspi driver to drivers/spi/
To: <Tudor.Ambarus@microchip.com>, <broonie@kernel.org>
References: <20200601054725.2060-1-vigneshr@ti.com>
 <20200601054725.2060-9-vigneshr@ti.com> <2051214.IORyQiarUF@192.168.0.120>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <2af92a25-02a7-0441-636c-d2853873f4c2@ti.com>
Date: Mon, 1 Jun 2020 12:37:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2051214.IORyQiarUF@192.168.0.120>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_000801_427263_EC7083D8 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: marex@denx.de, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/06/20 12:30 pm, Tudor.Ambarus@microchip.com wrote:
> Hi, Mark,
> 
> On Monday, June 1, 2020 8:47:25 AM EEST Vignesh Raghavendra wrote:
>> From: Ramuthevar Vadivel Murugan
>> <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Now that cadence-quadspi has been converted to use spi-mem framework,
>> move it under drivers/spi/
>>
>> Update license header to match SPI subsystem style
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan
>> <vadivel.muruganx.ramuthevar@linux.intel.com> Signed-off-by: Vignesh
>> Raghavendra <vigneshr@ti.com>
>> ---
>>  drivers/mtd/spi-nor/controllers/Kconfig            | 11 -----------
>>  drivers/mtd/spi-nor/controllers/Makefile           |  1 -
>>  drivers/spi/Kconfig                                | 11 +++++++++++
>>  drivers/spi/Makefile                               |  1 +
>>  .../spi-cadence-quadspi.c}                         | 14 +++++++-------
>>  5 files changed, 19 insertions(+), 19 deletions(-)
>>  rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c =>
>> spi/spi-cadence-quadspi.c} (99%)
> 
> If this patch set looks good to you, would you take it through the SPI tree? 
> If so, I would need an immutable tag, so I can merge back in spi-nor/next in 
> order to fix a small conflict that will appear in drivers/mtd/spi-nor/
> controllers/Kconfig. Vignesh would have to respin this patch on top of v5.7-
> rc1. With this addressed:
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 


I have resent v3 on top of v5.7-rc1 (also applies cleanly on spi tree's
for-next branch):

https://lore.kernel.org/linux-spi/20200601070444.16923-1-vigneshr@ti.com/T/#t

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
