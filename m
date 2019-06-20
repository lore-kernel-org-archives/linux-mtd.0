Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B82C43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 00:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2510E2147A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 00:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVAqV0MH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2510E2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bSxhiJ5Ok+4Z6BCiiu/FGONossC0TCVVxEW8XYy68I=; b=iVAqV0MH/gTijf
	NNZktc9DH+bf6UcfJWgAVDdQzDkWCURO2DrXC452MJHjSMhQh9srjfZvZyeYRZI1EZKRbgo8viDl2
	FQkmFs0+QB5V7ddlZgFTFxkL2KCix2bdyADnvUReqzzK/5LUYZiJstVbDAEJbEekCf0ttOLu/dMxh
	EevDi4/gpeEk7kn2A7HVIjfxTHuw+PQ6cGP4lplNLogjJwKFhtF7rVTLQuZALsVCOM9a7IXxi9yiZ
	EkelEkebaqCooepdc2grIJgMr+nd8UbOpmZmuw3UJ2W3rJSGXHA3V+7+kfoFcobpZUGw3l4qGkxAc
	Lr5Tpd25z3he0c9eXN6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdl81-0002n5-3A; Thu, 20 Jun 2019 00:40:37 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdl7x-0002mM-6i
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 00:40:35 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07499032|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.0487576-0.000955636-0.950287;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07391; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=15; RT=15; SR=0; TI=SMTPD_---.Enf4VU1_1560991224; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.Enf4VU1_1560991224)
 by smtp.aliyun-inc.com(10.147.40.26); Thu, 20 Jun 2019 08:40:25 +0800
Subject: Re: [PATCH] mtd: spinand: fix error read return value
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>
References: <1560950005-8868-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190619154611.3bfc007b@collabora.com>
 <99279437-54a6-c81d-aad2-231009f18cfc@kontron.de>
 <20190619181832.6f467279@collabora.com>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <4e8296fb-ff61-9319-99b5-aaa80025ccc6@allwinnertech.com>
Date: Thu, 20 Jun 2019 08:40:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190619181832.6f467279@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_174033_837804_2C001700 
X-CRM114-Status: GOOD (  15.52  )
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
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

hi Boris Brezillon,

Sure, i will adjust the commit message and send again right now.

On 2019/6/20 AM12:18, Boris Brezillon wrote:
> On Wed, 19 Jun 2019 14:02:14 +0000
> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> 
>> On 19.06.19 15:46, Boris Brezillon wrote:
>>> Hi liaoweixiong,
>>>
>>> On Wed, 19 Jun 2019 21:13:24 +0800
>>> liaoweixiong <liaoweixiong@allwinnertech.com> wrote:
>>>   
>>>> In function spinand_mtd_read, if the last page to read occurs bitflip,
>>>> this function will return error value because veriable ret not equal to 0.  
>>>
>>> Actually, that's exactly what the MTD core expects (see [1]), so you're
>>> the one introducing a regression here.  
>>
>> To me it looks like the patch description is somewhat incorrect, but the 
>> fix itself looks okay, unless I'm getting it wrong.
>>
>> In case of the last page containing bitflips (ret > 0), 
>> spinand_mtd_read() will return that number of bitflips for the last 
>> page. But to me it looks like it should instead return max_bitflips like 
>> it does when the last page read returns with 0.
> 
> Oh, you're right. liaoweixiong, can you adjust the commit message
> accordingly?
> 
>>
>>>>
>>>> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
>>>> ---
>>>>   drivers/mtd/nand/spi/core.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
>>>> index 556bfdb..6b9388d 100644
>>>> --- a/drivers/mtd/nand/spi/core.c
>>>> +++ b/drivers/mtd/nand/spi/core.c
>>>> @@ -511,12 +511,12 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>>>>   		if (ret == -EBADMSG) {
>>>>   			ecc_failed = true;
>>>>   			mtd->ecc_stats.failed++;
>>>> -			ret = 0;
>>>>   		} else {
>>>>   			mtd->ecc_stats.corrected += ret;
>>>>   			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>>>>   		}
>>>>   
>>>> +		ret = 0;
>>>>   		ops->retlen += iter.req.datalen;
>>>>   		ops->oobretlen += iter.req.ooblen;
>>>>   	}  
>>>
>>> [1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/mtdcore.c#L1209
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>  

-- 
liaoweixiong

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
