Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDF7C04AA7
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 06:49:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D8C2084E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 06:49:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eHeuxaWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D8C2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h88c+NcKnW1RZM3VyQlneZLXTfVb4vlwPncVXU58eHU=; b=eHeuxaWMj8hBce
	+mkpJbb9rTNpzMI1YIlZQq0I34NjK8Jx2K1vWh8WV3Sg2ukSXPdiVJsB/NdwkDo4DZtzefHMdKuEq
	WYOIU/BxPXicTws8WTqtcSqFLHaNCvbFd1CGeIrnwibXmZMZ29k/JELXCuhLgDpd3j3xRoTR0FW4U
	nbNN+SDKx4ORetRMYbaESZzcVTqc+keXpXISMS7AzttA+sBzm6bkauOMcTPtKC2mfePqKXl6UHSOe
	chZYugPcqP11A7IWAINToOK8oj4yJLV3YH1LwN1f01A6JD9bz0bivpL50Lb//jADgjmQ0SPryB7bb
	sGEsfZpOO4K+NCoIy8Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQnj6-0007MY-Eg; Wed, 15 May 2019 06:49:20 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQnj3-0007M3-GX
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 06:49:19 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id A8E1024D8E90;
 Wed, 15 May 2019 08:49:12 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 15 May
 2019 08:49:12 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 15 May 2019 08:49:12 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Marek Vasut <marek.vasut@gmail.com>, Jeff Kletsky <lede@allycomm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spinand: Add #define-s for page-read ops with
 three-byte addresses
Thread-Topic: [PATCH v2 1/3] mtd: spinand: Add #define-s for page-read ops
 with three-byte addresses
Thread-Index: AQHVCp+gSJvETC1sqUWniiGRN7WTKKZrlQUAgAAIzoA=
Date: Wed, 15 May 2019 06:49:12 +0000
Message-ID: <efcbdd61-d60e-a5d1-9f91-f8f747fadecf@kontron.de>
References: <20190514215315.19228-1-lede@allycomm.com>
 <20190514215315.19228-2-lede@allycomm.com>
 <355bcf8d-bce6-1b82-0f57-539c8d9b6cac@gmail.com>
In-Reply-To: <355bcf8d-bce6-1b82-0f57-539c8d9b6cac@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <0FF76DAAB784ED4D817389ECCA7528A9@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: A8E1024D8E90.ACE6F
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, lede@allycomm.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_234917_878754_CCE41BA2 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 15.05.19 08:17, Marek Vasut wrote:
> On 5/14/19 11:53 PM, Jeff Kletsky wrote:
>> From: Jeff Kletsky <git-commits@allycomm.com>
> 
> That #define in $subject is called a macro.
> 
> Seems this patch adds a lot of almost duplicate code, can it be somehow
> de-duplicated ?

We could add another parameter naddr or addrlen to the 
SPINAND_PAGE_READ_FROM_CACHE_XX_OPs and pass the value 2 for all 
existing chips except for GD5F1GQ4UFxxG which needs 3 bytes address length.

This would cause one more argument to each of the macro calls in all 
chip drivers. As long as there are only two flavors (2 and 3 bytes) I'm 
not sure if this really would make things easier and also this is "only" 
preprocessor code.

So anyways, I would be fine with both approaches, Jeff's current one or 
one with another parameter for the address length.

By the way: Jeff, you didn't carry my Reviewed-by tag to v2. So I will 
just reply again to add the tags.

> 
>> The GigaDevice GD5F1GQ4UFxxG SPI NAND utilizes three-byte addresses
>> for its page-read ops.
>>
>> http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/
>>
>> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>
>> ---
>>   include/linux/mtd/spinand.h | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>> index b92e2aa955b6..05fe98eebe27 100644
>> --- a/include/linux/mtd/spinand.h
>> +++ b/include/linux/mtd/spinand.h
>> @@ -68,30 +68,60 @@
>>   		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>>   		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>>   
>> +#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(fast, addr, ndummy, buf, len) \
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
>> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>> +		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>> +
>>   #define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
>>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>>   		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>>   		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>>   		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>>   
>> +#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(addr, ndummy, buf, len)	\
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>> +		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>> +
>>   #define SPINAND_PAGE_READ_FROM_CACHE_X4_OP(addr, ndummy, buf, len)	\
>>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
>>   		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>>   		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>>   		   SPI_MEM_OP_DATA_IN(len, buf, 4))
>>   
>> +#define SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(addr, ndummy, buf, len)	\
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
>> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>> +		   SPI_MEM_OP_DATA_IN(len, buf, 4))
>> +
>>   #define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(addr, ndummy, buf, len)	\
>>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
>>   		   SPI_MEM_OP_ADDR(2, addr, 2),				\
>>   		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
>>   		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>>   
>> +#define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP_3A(addr, ndummy, buf, len) \
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
>> +		   SPI_MEM_OP_ADDR(3, addr, 2),				\
>> +		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
>> +		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>> +
>>   #define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(addr, ndummy, buf, len)	\
>>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
>>   		   SPI_MEM_OP_ADDR(2, addr, 4),				\
>>   		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
>>   		   SPI_MEM_OP_DATA_IN(len, buf, 4))
>>   
>> +#define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP_3A(addr, ndummy, buf, len) \
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
>> +		   SPI_MEM_OP_ADDR(3, addr, 4),				\
>> +		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
>> +		   SPI_MEM_OP_DATA_IN(len, buf, 4))
>> +
>>   #define SPINAND_PROG_EXEC_OP(addr)					\
>>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
>>   		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>>
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
