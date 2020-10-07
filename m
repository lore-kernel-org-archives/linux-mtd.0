Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5856BC4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 07:30:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D558F2083B
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 07:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eu+dSl9I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dknQjF3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D558F2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8t7sA6NSHoFFX6G3iRyMsWPM8j5NcxsdY0ut9XSsaTk=; b=Eu+dSl9ILLmw6QSmec/qR7x4j
	6iR58F1Kggq1ddn4Wr2L+cXF5Js02NkE+5qI5saiuT2F5PRhYFnAPmNI6pCom7RyAbJYJGBO6qVsb
	i3eFOwFfy+5oJikaErSeUWmCvp+vY2AYSJK1sJw1eHajYRHk0r72aAsXWEPcPOnXhPhPvF3aoB1YK
	sh1NodrDYA0aUXKC3KFcyJ1Rjoq6REWB9zw6GO+gPmUON26JfERbvZK1SyOqs7GE1BUDVUlipC+th
	jjYOSuch/Po5xQ++jzHDRNHl/gH/QqXqrLzNdikhRSDtkTwwHARso91k1xyO0P6SzGBSf8jpE6Bum
	TX1j4cvJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ3u5-00044W-DN; Wed, 07 Oct 2020 07:30:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ3u2-00044C-MI
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 07:30:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0977UFOr089215;
 Wed, 7 Oct 2020 02:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602055815;
 bh=mHjIcR1lYuiovBvGBgUKM9WaqJJIFY9E/E3vhVDRG04=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dknQjF3yX4MIJSyZelGKlVAwL57VRNgCvwJWFppFp2S6PnpIWj08U68yVvFlS0UnX
 PlkZmTZUshD7zI+XZ0fKiyxgf4W+LXx/+yNRwIfT+Io88WmlegZJoRww4iMNubN19F
 fyoQfyxuE7frKGxWeUlDCw0PWKqyO11x6F0r+TR8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0977UF2T018810
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Oct 2020 02:30:15 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 02:30:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 02:30:15 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0977Tumg035107;
 Wed, 7 Oct 2020 02:29:57 -0500
Subject: Re: [RESEND PATCH v2] mtd: spi-nor: Fix address width on flash chips
 > 16MB
To: Pratyush Yadav <p.yadav@ti.com>, Bert Vermeulen <bert@biot.com>
References: <20201006132346.12652-1-bert@biot.com>
 <20201006151807.2pckm7ncply7uomc@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <096b2b97-6b6b-a46e-1239-e5d257e80c0b@ti.com>
Date: Wed, 7 Oct 2020 12:59:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006151807.2pckm7ncply7uomc@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_033022_841923_B3A8A3C1 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/6/20 8:48 PM, Pratyush Yadav wrote:
> On 06/10/20 03:23PM, Bert Vermeulen wrote:
>> If a flash chip has more than 16MB capacity but its BFPT reports
>> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
>>
>> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
>> did get set. This fixes that check.
>>
>> Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
>> Signed-off-by: Bert Vermeulen <bert@biot.com>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 0369d98b2d12..a2c35ad9645c 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3009,13 +3009,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>>  		/* already configured from SFDP */
>>  	} else if (nor->info->addr_width) {
>>  		nor->addr_width = nor->info->addr_width;
>> -	} else if (nor->mtd.size > 0x1000000) {
>> -		/* enable 4-byte addressing if the device exceeds 16MiB */
>> -		nor->addr_width = 4;
>>  	} else {
>>  		nor->addr_width = 3;
>>  	}
>>  
>> +	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
> Nitpick:    ^^^^^^^^^^^^^^^^^^^^^^^^ you can drop this part. But its 
> fine either way.
> 

I don't think its a good idea to drop nor->addr_width == 3 check as
nor->info->addr_width is permitted to have a value > 4 (although there
is no such flash today)...

> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
>> +		/* enable 4-byte addressing if the device exceeds 16MiB */
>> +		nor->addr_width = 4;
>> +	}
>> +
>>  	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
>>  		dev_dbg(nor->dev, "address width is too large: %u\n",
>>  			nor->addr_width);
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
