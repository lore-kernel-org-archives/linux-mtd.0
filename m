Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B84C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973F1206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdiRzFGv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LHrBPEQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973F1206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKblLyRqMbdUp3t6bH3ZLQ4bgYduD/v85EJZ0+UzivA=; b=LdiRzFGvSXh1s+
	EDQKoXOGlsYB7pfcEjYubm39cqdDuHeWjrFVGdAgQG4gTfxfcnh2DeBAp3jPyzeDIdinyedjB0zz6
	q57IEvuIOJyCUcFLIo6lQXwlm9Nh/yG0RgIhgc4uoYLNOjnk4KXp0zfE2KxBlTN17/VWnrQ7olv6j
	FF7cHHuZ3c5Q89kfsaZQ6J8DAGGw+/GO39HbbgdVeJiQ51S1rMSm02Snr1j230eo6Efa5U1OaWlgd
	YozB7DLGUiDZuqXb6/s8nPlV4n7jfKGBT+a8e0gGTIuxtM+HAeSZIIRNexF8eu5PkAZtwIi+aXC3c
	qMo9+GeMPNvaDIQ7u9BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4qa-0006QZ-UW; Thu, 01 Aug 2019 06:45:56 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4qX-0006QD-OH
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:45:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x716jkhw016651;
 Thu, 1 Aug 2019 01:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564641947;
 bh=8TKbs94HSZ1JGcGrZEMzUr93I/PwTVTscVdXayg7r1A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LHrBPEQzzIGrbXU/BiEmrkH1RjpEUvJk6k7cLqJGY2vgs2Kt6mv6F2+ZuSNEdg7vO
 lQUkx74KWBnlNJgI+Yp0oRaWZpWMStEX7V5GeGZMBHOmgluDnUIrMxb3hvfFpo493S
 E9NOua5vEvQdTMZfXJjX5MgyXeFPflWzzJkkDfAI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x716jkk4047146
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 01:45:46 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 01:45:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 01:45:46 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x716jhco016047;
 Thu, 1 Aug 2019 01:45:44 -0500
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: Move m25p80 code in spi-nor.c
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20190801043052.30192-1-vigneshr@ti.com>
 <20190801043052.30192-3-vigneshr@ti.com>
 <20190801075205.3336693b@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <2b3ff784-01dc-ce18-2e3c-183f9bee1d09@ti.com>
Date: Thu, 1 Aug 2019 12:16:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801075205.3336693b@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234553_870811_655BA267 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/08/19 11:22 AM, Boris Brezillon wrote:
> On Thu, 1 Aug 2019 10:00:51 +0530
> Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> From: Boris Brezillon <boris.brezillon@bootlin.com>
>>
>> The m25p80 driver is actually a generic wrapper around the spi-mem
>> layer. Not only the driver name is misleading, but we'd expect such a
>> common logic to be directly available in the core. Another reason for
>> moving this code is that SPI NOR controller drivers should
>> progressively be replaced by SPI controller drivers implementing the
>> spi_mem_ops interface, and when the conversion is done, we should have
>> a single spi-nor driver directly interfacing with the spi-mem layer.
>>
>> While moving the code we also fix a longstanding issue when
>> non-DMA-able buffers are passed by the MTD layer.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>> v3:
>> Simplify register read/write by dropping spi_nor_exec_op() and using
>> spi_mem_exec_op() directly
>> Modify spi_nor_spimem_xfer_data() to drop "enum spi_nor_protocol proto"
>> Fix misc coding style comments by Tudor
>>
>> v2:
>> Add docs for new functions added
>> Add spi_nor_ prefix to new functions
>> Incorporate Andrey's patches https://lkml.org/lkml/2019/4/1/32
>> to avoid looping spi_nor_spimem_* APIs
>>
>>  drivers/mtd/devices/Kconfig   |  18 -
>>  drivers/mtd/devices/Makefile  |   1 -
>>  drivers/mtd/devices/m25p80.c  | 347 -------------------
>>  drivers/mtd/spi-nor/Kconfig   |   2 +
>>  drivers/mtd/spi-nor/spi-nor.c | 632 ++++++++++++++++++++++++++++++++--
>>  include/linux/mtd/spi-nor.h   |   3 +
>>  6 files changed, 604 insertions(+), 399 deletions(-)
>>  delete mode 100644 drivers/mtd/devices/m25p80.c
>>
> 
> [...]
> 
> 
>> @@ -348,6 +530,16 @@ static int read_cr(struct spi_nor *nor)
>>   */
>>  static int write_sr(struct spi_nor *nor, u8 val)
>>  {
>> +	if (nor->spimem) {
>> +		struct spi_mem_op op =
>> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
>> +				   SPI_MEM_OP_NO_ADDR,
>> +				   SPI_MEM_OP_NO_DUMMY,
>> +				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
>> +
>> +		return spi_mem_exec_op(nor->spimem, &op);
>> +	}
>> +
>>  	nor->bouncebuf[0] = val;
> 
> The above line should be moved at the beginning of the function if you
> want the spimem path to work correctly.


Good catch! will send v4 with this fixed


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
