Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76ECC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 12:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B885204FD
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 12:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gEm+Rsp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B885204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Og5DfiXqRZAsF3RNbtMKV3HwA6mTDVWaARmawBm0PxY=; b=gEm+Rsp6gkP+4X
	pgZHyNrvzqf4p64nN+wM8xrR9KuDGQ589hrmsX0ow1/s3K4+YLnoPVk9iaSBRcELuJ8cGArxEWkEf
	PsCgv6s50shVV84114UaAK7a08MBMyM4AVz5K6whWJ96zmMt9paW0C04vMnfA4/Mv1r8QQ9SRsqpT
	EnndtTpR3Q53WT80J7P+TFeefXwr0hP2oYwGmFr2QDer8HxBXoNxJoSQrEbHv/cyXh4HhS1r4VU91
	QOPqUaAkIpKUje6TcU+p30FxkfH0+pmS627XCkuqJgtyA7c9vfb+Zn38yLdbIPnfv9B4iTQRYmNAb
	w1qaXMS/CxkxptmqlcCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfNnW-000619-Om; Mon, 24 Jun 2019 12:10:10 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNnT-0004oq-1K
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 12:10:08 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08198884|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.238094-0.0170177-0.744888; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03311; MF=liaoweixiong@allwinnertech.com; NM=1; PH=DS; RN=13; RT=13;
 SR=0; TI=SMTPD_---.EpQVE7o_1561378197; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.EpQVE7o_1561378197)
 by smtp.aliyun-inc.com(10.147.41.158);
 Mon, 24 Jun 2019 20:09:58 +0800
Subject: Re: [PATCH v2] mtd: spinand: read return badly if the last page has
 bitflips
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Peter Pan <peterpandong@micron.com>, Jeff Kletsky <git-commits@allycomm.com>
References: <1560992416-5753-1-git-send-email-liaoweixiong@allwinnertech.com>
 <d406a968-a489-f457-2bde-1912618879fa@kontron.de>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <6e0a848a-9b26-d9ef-d3bc-6df9efa666a9@allwinnertech.com>
Date: Mon, 24 Jun 2019 20:10:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d406a968-a489-f457-2bde-1912618879fa@kontron.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_051007_251710_FA76D918 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

OK, thanks for your reviewing. I will resend right now.

On 2019/6/24 PM3:37, Schrempf Frieder wrote:
> On 20.06.19 03:00, liaoweixiong wrote:
>> In case of the last page containing bitflips (ret > 0),
>> spinand_mtd_read() will return that number of bitflips for the last
>> page. But to me it looks like it should instead return max_bitflips like
>> it does when the last page read returns with 0.
>>
>> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This should probably be resent with the following tags:
> 
> Cc: stable@vger.kernel.org
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI 
> NANDs")
> 
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

-- 
liaoweixiong

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
