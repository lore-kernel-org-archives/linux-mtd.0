Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B935AC31E49
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 14:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 857D620679
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 14:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AsgzUn6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 857D620679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBFRnl7ASusOq2NFZSgioeALZ8Lzm9RkwB/J6FQzt9o=; b=AsgzUn6JT9vYhF
	bbtAucxptZdw+o8PDpbgT/xWAjkr/ieGQnDH/4B3gLvUUo3kFgmkY6Cs0urs+4nr78Oh0Gn4zxI7/
	VrGukltCXUpj4MQNniyVPGcdEP6BLRIm55gt9/ZWjbHDYNAzvqxZRe9WsSJDIgDonvZJJFnmjur2v
	KO2dFsfGUnPIK/fwNRIrPCFoLnuMZ8hXKsj6jSHWwucDVFvlsW1K5KANwXoo2Jo5hWrMmZKwE2J+r
	2psxlq0uMETzXL7bYDGoDGZZM4SWGVP3+Ccg4Hw+gfuDvG2T5UMTDs8kGg8rh73ZP+Snzsk8Z6Oc5
	y5au+gm/5fH5vsry127A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdbAQ-0003f8-LK; Wed, 19 Jun 2019 14:02:26 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdbAM-0003dw-PR
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 14:02:25 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id AC1FB67A5A7;
 Wed, 19 Jun 2019 16:02:15 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 19 Jun
 2019 16:02:15 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 19 Jun 2019 16:02:15 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@collabora.com>, liaoweixiong
 <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH] mtd: spinand: fix error read return value
Thread-Topic: [PATCH] mtd: spinand: fix error read return value
Thread-Index: AQHVJqDuYWC929vPOUKAUCynvqWA3aai2+yAgAAEfAA=
Date: Wed, 19 Jun 2019 14:02:14 +0000
Message-ID: <99279437-54a6-c81d-aad2-231009f18cfc@kontron.de>
References: <1560950005-8868-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190619154611.3bfc007b@collabora.com>
In-Reply-To: <20190619154611.3bfc007b@collabora.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <15DD44F8384FA94BAC65908A2BFF103D@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: AC1FB67A5A7.A231B
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, boris.brezillon@collabora.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 frieder.schrempf@exceet.de, gch981213@gmail.com,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, peron.clem@gmail.com,
 peterpandong@micron.com, richard@nod.at, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_070223_157369_C515F01F 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 19.06.19 15:46, Boris Brezillon wrote:
> Hi liaoweixiong,
> 
> On Wed, 19 Jun 2019 21:13:24 +0800
> liaoweixiong <liaoweixiong@allwinnertech.com> wrote:
> 
>> In function spinand_mtd_read, if the last page to read occurs bitflip,
>> this function will return error value because veriable ret not equal to 0.
> 
> Actually, that's exactly what the MTD core expects (see [1]), so you're
> the one introducing a regression here.

To me it looks like the patch description is somewhat incorrect, but the 
fix itself looks okay, unless I'm getting it wrong.

In case of the last page containing bitflips (ret > 0), 
spinand_mtd_read() will return that number of bitflips for the last 
page. But to me it looks like it should instead return max_bitflips like 
it does when the last page read returns with 0.

>>
>> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
>> ---
>>   drivers/mtd/nand/spi/core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
>> index 556bfdb..6b9388d 100644
>> --- a/drivers/mtd/nand/spi/core.c
>> +++ b/drivers/mtd/nand/spi/core.c
>> @@ -511,12 +511,12 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>>   		if (ret == -EBADMSG) {
>>   			ecc_failed = true;
>>   			mtd->ecc_stats.failed++;
>> -			ret = 0;
>>   		} else {
>>   			mtd->ecc_stats.corrected += ret;
>>   			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>>   		}
>>   
>> +		ret = 0;
>>   		ops->retlen += iter.req.datalen;
>>   		ops->oobretlen += iter.req.ooblen;
>>   	}
> 
> [1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/mtdcore.c#L1209
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
