Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A32C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 19:59:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38CB120811
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 19:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gcYjgdi0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MV4wnmG4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38CB120811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=+W3qkNX7nHYtcUxiFlsOEl1dvx7UzIh8CVzx7P4gI2k=; b=gcYjgdi0aI5X4H
	848+UGm++bSwSKeDIqSBqlhBNZxsqaTKkY12g4Yhpo5ris29OVC5YVF9xwPZI+gIxCvKYIZx2YaSY
	O1ZDy9p7fg0taGh4dPxcZHvGMrqIHYXgLGLN15+qpN/urtI/VRKKrWtgFs+BKz8hWwzjVD3nBFQ2N
	BA9HcJrJW8iSj0yLiUUkMJxujAt0hS3IE7g1scF+xmX4Q0jofA537FtynmIJdpqMzKybKUTFj/Iu9
	Q2lidEG3lFHSUNGq/Gp+RQpeQZBfe2jdWJDLLynWY9Hfkwn+gsnEYjmlw+3rOpZbla1I5ccds1Ulk
	jNhQcQn8092SjWNTBQeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9bBc-0001by-2L; Thu, 28 Mar 2019 19:59:40 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9bBZ-0001bF-0O
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 19:59:39 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1C960806CB;
 Fri, 29 Mar 2019 08:59:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1553803171;
 bh=KyVf0XPYe/Sq2CeY/TstCYgQb42lVq35x7WJh3kz4AE=;
 h=From:To:CC:Subject:Date:References;
 b=MV4wnmG48tgxSpWpN+i9c/XAPIud2US33ZPG3nVR8XWPC5yFiBoVrQFz300pPWNEf
 aINXu2DwRJH/tLydoJNXAdXx22imQCxFIS9hauQmbu10ig0RrC+QnSg772xDNz1w54
 TG5Pytig9cVhr96cjpEi5HC78pWi/v4yD8L3AdJmtePhRkxTtx2OpgMTSZW36fny31
 8fFBMmZO9j6PeHTz2DqQIblOjtk8aCigGj1l5VLj0sNZ22Oe6ZTCtO5+q1HCByNlB5
 mpYST/a00kFUXPuQ7W7XdSabau4FsxQISG8wuOo6NDQQVdcmCQ1O5c7kdS1i2TNOqk
 N0s3r5wtSDvaw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5c9d27a20000>; Fri, 29 Mar 2019 08:59:30 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Fri, 29 Mar 2019 08:59:30 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 29 Mar 2019 08:59:30 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/2] mtd: maps: physmap: Store gpio_values correctly
Thread-Topic: [PATCH 1/2] mtd: maps: physmap: Store gpio_values correctly
Thread-Index: AQHU5RsQWH5zn2hVsUSt8KG5kvMGiw==
Date: Thu, 28 Mar 2019 19:59:30 +0000
Message-ID: <1ab4e2f0c6d4404895877ecf539504bd@svr-chch-ex1.atlnz.lc>
References: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
 <20190328040217.1895-2-chris.packham@alliedtelesis.co.nz>
 <20190328093228.5ab79718@collabora.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_125937_645168_778B90BB 
X-CRM114-Status: GOOD (  10.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28/03/19 9:32 PM, Boris Brezillon wrote:
> On Thu, 28 Mar 2019 17:02:15 +1300
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> 
>> When the gpio-addr-flash.c driver was merged with physmap-core.c the
>> code to store the current gpio_values was lost. This meant that once a
>> gpio was asserted it was never de-asserted. Fix this by storing the
>> current offset in gpio_values like the old driver used to.
>>
>> Fixes: commit ba32ce95cbd9 ("mtd: maps: Merge gpio-addr-flash.c into physmap-core.c")
> 
> You miss
> 
> Cc: <stable@vger.kernel.org>
> 

I wasn't sure. As the original commit said there are no in-tree users of 
  addr-gpios so maybe no-one else noticed. I'll wait for any other 
comments and send a v2 with a Cc for stable.

>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
>> ---
>>   drivers/mtd/maps/physmap-core.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
>> index d9a3e4bebe5d..21b556afc305 100644
>> --- a/drivers/mtd/maps/physmap-core.c
>> +++ b/drivers/mtd/maps/physmap-core.c
>> @@ -132,6 +132,8 @@ static void physmap_set_addr_gpios(struct physmap_flash_info *info,
>>   
>>   		gpiod_set_value(info->gpios->desc[i], !!(BIT(i) & ofs));
>>   	}
>> +
>> +	info->gpio_values = ofs;
>>   }
>>   
>>   #define win_mask(order)		(BIT(order) - 1)
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
