Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC2FC34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 11:11:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE4D2173E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 11:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eu/LeEO/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NlA81kG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE4D2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gE6xEk+J8hDxyztk8HDeH4XGV6hr5K7o/6x3uUpX2I0=; b=Eu/LeEO/k2P0/RmxiztuWGRb3J
	KgzoBqyPQp5sxo3xZqQJrmPtJ9CllMwUDrFIUB2NCsCET0sLd/cBqeVj3LE+/XrCvhhw1btp4jZUl
	9EvLBPz/Qg2ghaSFhXhyY5CqZDzGONRH/kINBXvFdHujdoVONLMnHfBimrJQ/ALQ31pu4GXnnEcDm
	+r0l+fefKjkEhf53PTTSXfYS+Jb6n3h3PW/3oHLhU36uQeXHol/K0m0lJdKOO/qKooAfYnYH27a0u
	9tXxdRdtScZfUQejnxeDO3hLoe2CODbv/H9XtxI/nN1t/ZiiQ3VV+KKnbJ6JUK7QVQIMq7AB9Ltzg
	f6pD7gKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j40mr-0006m0-L1; Tue, 18 Feb 2020 11:11:33 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j40mo-0006lJ-AF
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 11:11:32 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IBBK75088560;
 Tue, 18 Feb 2020 05:11:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582024281;
 bh=fmRfaaGmQAhtEAzHt+zAAmiTjXifLEvmXqrKSGHq+0c=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=NlA81kG3qrX8KicySesEUivTaa4HZT2ECt+rYLZI2AYriJ4r7KfwGrSHDbvwdP1s6
 EzhuGKY20gu7w9pKNliboCwLfqlVYkKAQHdiotvw6BmT0SooWfG3Bl/mTVxye1GVwO
 P/I9XJE06QGoT6Qxq50rucWgiquTePALf9breUC0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IBBKlI085576
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Feb 2020 05:11:20 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 05:11:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 05:11:20 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IBBH1C038767;
 Tue, 18 Feb 2020 05:11:18 -0600
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
 <eed17a25-e21c-b493-98e8-e25150216731@de.bosch.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <aef44eb7-78df-8505-ad37-d67fd499532e@ti.com>
Date: Tue, 18 Feb 2020 16:41:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <eed17a25-e21c-b493-98e8-e25150216731@de.bosch.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_031130_495011_6CD2B5F1 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 18/02/20 12:42 pm, Behme Dirk (CM/ESO2) wrote:
> Hi Vignesh,
> 
> On 18.02.2020 05:00, Vignesh Raghavendra wrote:
>> Hi Sergei
>>
[...]
>>
>> Looking around, there seems to be more than one SPI controllers, apart
>> from Renesas, which also support SPI NOR and HyperFlash protocol within
>> a single IP block. E.g.: Cadence xSPI controller [1]. Therefore, we need
>> a generic framework to support these kind of controllers.
>>
>> One way would be to extend spi_mem_op to support above template along
>> with a new field to distinguish SPI NOR vs HyperFlash protocol. HyperBus
>> core can then register a spi_device and use spi-mem ops to talk to
>> controller driver.
>> So, I suggest making Renesas RPC-IF backend a full fledged spi-mem
>> driver (instead of driver/memory) and use extended spi_mem_op to support
>> HyperFlash.
> 
> 
> From Renesas Hyperflash user point of view, I wonder if a two step
> approach would be possible and acceptable, here?
> 
> Being a user of the Renesas Hyperflash, I want a driver for that. And,
> of course, I want it "now" ;)
> 
> So I wonder if it would be a valid option to have a functioning Renesas
> Hypeflash driver, first. And in a second step abstract that in a more
> generic way to support additional controllers. While in parallel having
> a functional driver for the Renesas people, already.
> 

AFAICS, the backend driver is not merged and is still in RFC phase.
Therefore I don't see any benefit of two step approach here. Besides
you'll have to throw away this new driver (hyperbus/rpc-if.c) entirely
later on.

How difficult is it to rewrite backend to be spi-mem driver? There is
already has a spi_mem_ops frontend implementation, so I don't see much
of an issue.
Extending hyperbus core to use spi-mem should also straight forward
Would involve moving this patch into core file.

> Is the support for [1] a more or less theoretical one, at the moment? Or
> are there users of that which need support "now", too?
> 

Its not theoretical, I do see patches for xSPI controller here:
https://patchwork.kernel.org/cover/11354193/

So, its best to sort this out now so as to avoid possible backward
compatibility issues (especially with DT bindings)

Regards
Vignesh



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
