Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17106C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF632206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4yVZYQR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IUKC5jCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF632206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJuasDBH2+lx5hZHt3xsblshLBQxzeLiM5gcFZEmSVM=; b=s4yVZYQRHfR+dB
	C7EM54eOuHMl+2W9I6NcgWqo/8hjLZivERG838zqedlGUdfi8fx9rJs4cN5xK4TbNQu31A7pcI38S
	oTjY1AjaFC9/pjUxajzsjha/udLLTtNP7onW+ew66XRYX8Hr0esS02v+sV2zVDcQST1jbnURxUnId
	wBFhmgNfgUSknLVtkTkVtzhaw4s4eQVDiVUs4NGrtMgo3InnXyPCFYayBoTHqgkpoMoEcd3s8kTlK
	idu48bh0P/7bAtvq6izkSA7Y7vCLiec7uxVwXxOr1HV/t12G82YhA6mwPkSXICacGf2qu+sL77Cmp
	Ey/ssX3PTDs34Xhp4IZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4pn-0005zF-0X; Thu, 01 Aug 2019 06:45:07 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4pk-0005PP-Lt
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:45:06 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x716ivrT070548;
 Thu, 1 Aug 2019 01:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564641897;
 bh=7klj/oxvN3FoRHz8lsnRzWDOpkLfDASFSU6JxyhjCzE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IUKC5jCnFKMk9KcJ79PKFMHteVNz7xUBnHAf/imbfaGqTPCcPS4SG5QvIUuDp96A3
 r3WjjpT3+BrxAkOxIPSJvC22zmIr0bts9TTSsmoKamzJQCRGH8aultvp0KzjgtvI22
 P9CZKFzpLdaY5DsE2bnuUl8xwf7L7B3fLpsx9bzc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x716iulm106677
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 01:44:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 01:44:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 01:44:56 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x716irJi115628;
 Thu, 1 Aug 2019 01:44:54 -0500
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: always use bounce buffer for
 register read/writes
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20190801043052.30192-1-vigneshr@ti.com>
 <20190801043052.30192-2-vigneshr@ti.com>
 <20190801074647.792479c1@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d057db47-64a6-01ca-2ccb-d57c532213d4@ti.com>
Date: Thu, 1 Aug 2019 12:15:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801074647.792479c1@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234504_806034_CF2B3372 
X-CRM114-Status: GOOD (  18.24  )
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

Hi Boris

On 01/08/19 11:16 AM, Boris Brezillon wrote:
> On Thu, 1 Aug 2019 10:00:50 +0530
> Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> spi-mem layer expects all buffers passed to it to be DMA'able. But
>> spi-nor layer mostly allocates buffers on stack for reading/writing to
>> registers and therefore are not DMA'able. Introduce bounce buffer to be
>> used to read/write to registers. This ensures that buffer passed to
>> spi-mem layer during register read/writes is DMA'able. With this change
>> nor->cmd-buf is no longer used, so drop it.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>> v3: new patch
>>

[...]

>> @@ -2180,11 +2179,13 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>>  	u8			id[SPI_NOR_MAX_ID_LEN];
>>  	const struct flash_info	*info;
>>  
>> -	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
>> +	tmp = nor->read_reg(nor, SPINOR_OP_RDID, nor->bouncebuf,
>> +			    SPI_NOR_MAX_ID_LEN);
>>  	if (tmp < 0) {
>>  		dev_err(nor->dev, "error %d reading JEDEC ID\n", tmp);
>>  		return ERR_PTR(tmp);
>>  	}
>> +	memcpy(id, nor->bouncebuf, SPI_NOR_MAX_ID_LEN);
> 
> Why not directly including the change you have in patch 2 (id is a
> pointer that points directly to ->bouncebuf) so you can get rid of this
> memcpy() here?
>

Ok will do that in next version.


>>  
>>  	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>>  		info = &spi_nor_ids[tmp];
>> @@ -4121,6 +4122,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	nor->read_proto = SNOR_PROTO_1_1_1;
>>  	nor->write_proto = SNOR_PROTO_1_1_1;
>>  
>> +	/*
>> +	 * We need the bounce buffer early to read/write registers when going
>> +	 * through the spi-mem layer (buffers have to be DMA-able).
> 
> You should probably extend this comment in patch 2 to explain why 4k
> should be enough for regular read/write operations.
> 

Will update

> The patch looks good otherwise.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 

Thanks for the review!

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
