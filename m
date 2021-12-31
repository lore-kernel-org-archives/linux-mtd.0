Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFCDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Dec 2021 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2FZDu/8h70LLB7hsWdxOyth6mA5o2szp2iwJSkaiHY=; b=Abpzcu5LMlC8ng
	WBbefDpFLiPtw/A4NAMT6ZJ+1/uqDTX3zdycAbWBPE1+nusUPCNZnPvsD8lw3ryoXYR9ewJHuaPpR
	GteC5HpLQYgufqj0WhKZIuKtzB9pxRjg4qTHi1pSPKf9pwXOUr/b/xdflvpdbWToIIEr9O+sfgDhl
	MA4YA+ugKwVFAuRdVnDNhe9FB5nKJzsMwDiKFhO098x4EqdfBckHiml46imacwI9kVvkv8pexu6vl
	MrlLyXGtFdcTOW/HEEhPtLKXSTvHzA8EUVmxeksRHYxyEMOxHqPpQch5SFh31ONbAoS0VTkkn20Rc
	/FniM1t/APZzXMJt9Zkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Dvz-005qPc-FM; Fri, 31 Dec 2021 09:10:47 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Dvt-005qPD-Kg
 for linux-mtd@lists.infradead.org; Fri, 31 Dec 2021 09:10:44 +0000
Message-ID: <a187ec1b-3bae-659d-86c5-4e2b3403eca4@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1640941835;
 bh=gMbPY8Oe5zSNU6NKbJbod9q1W9E388K2kul6vGwPF7c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZCSniXkZm14+f4KZJVE3eKyoUIagvGmvd5nBNjFK1gVYei1kLWOEXmPlhu69f5iB8
 ddrYAGCb+bBw7fwtAZY2jUla5blZW5GubIsgOMJ/zbhNH7MCQFHtfLQUZh64U5UWid
 mpT1f4CHmN302dz8tfvE6Xx5redtnq0956d9J4LIGy17FEMmav+7u38JDQ3Q8596PA
 hZKG9g9yY1zKvLrCbhjobs74MlNF0Lk9mWnFpxObRpceap4Jx+hmelr2y+GAQtOkNc
 q/tuA8cNkFQWPdUqY4cZVaMEKzUNZPqhZFDgABl/UMZRf4tjhZmVGmPpFs3FKxL68w
 ZxPgmVEXwLrgA==
Date: Fri, 31 Dec 2021 10:10:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: mail@david-bauer.net
References: <20211227091638.177917-1-vincent@systemli.org>
 <20211227091638.177917-2-vincent@systemli.org>
 <0db13110-ee6f-2e02-abf9-d5b9eecafcb4@microchip.com>
From: Nick <vincent@systemli.org>
In-Reply-To: <0db13110-ee6f-2e02-abf9-d5b9eecafcb4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_011042_056121_500A0DD7 
X-CRM114-Status: GOOD (  17.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I looked now through all datasheets I found and the sizes of the status 
register. However, I did not find any datasheet for the "mx66l1g55g".
However, I am not sure if I maybe miss something to see if 
"SNOR_F_HAS_16BIT_SR" is supported. I only looked at the status register 
size.

It is also now merged in OpenWrt, so maybe we wait some time and see if 
someone complains?
https://github.com/openwrt/openwrt/commit/83b5fbddf28e943e8c90b4099a1e36d158f5995c

Otherwise, I documented my findings:
mx25l512e: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7398/MX25L512E,%203V,%20512Kb,%20v1.4.pdf 
(slide 13)
mx25l2005a: 8bit 
https://www.macrogroup.ru/sites/default/files/uploads/mx25l2005_3v_2mb_v1.9.pdf 
(slide 12)
mx25l4005a: 8bit 
https://pdf1.alldatasheet.com/datasheet-pdf/view/267913/MCNIX/MX25L4005A.html 
(slide 11)
mx25l8005: 8bit 
https://pdf1.alldatasheet.com/datasheet-pdf/view/267915/MCNIX/MX25L8005.html 
(slide 11)
mx25l1606e: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7465/MX25L1606E,%203V,%2016Mb,%20v1.9.pdf 
(slide 18)
mx25l3205d: 8bit 
https://pdf1.alldatasheet.com/datasheet-pdf/view/267908/MCNIX/MX25L3205D.html 
(slide 19)
mx25l3255e: 8bit 
https://www.application-datasheet.com/pdf/macronix/mx25l3255em2i-10g.pdf 
(slide 22)
mx25l6405d: 8bit 
https://datasheet.octopart.com/MX25L6405DZNI-12G-Macronix-datasheet-8325093.pdf 
(slide 19)
mx25u2033e: 8bit 
https://datasheetspdf.com/pdf-file/792587/MACRONIX/MX25U2033E/1 (slide 21)
mx25u3235f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7438/MX25U3235F,%201.8V,%2032Mb,%20v1.6.pdf 
(slide 31)
mx25u4035: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7295/MX25U4035,%201.8V,%204Mb,%20v1.4.pdf 
(slide 19)
mx25u8035: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7295/MX25U4035,%201.8V,%204Mb,%20v1.4.pdf 
(slide 19)
mx25u6435f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7411/MX25U6435F,%201.8V,%2064Mb,%20v1.5.pdf 
(slide 31)
mx25l12805d: 8bit 
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf 
(slide 13)
mx25l12855e: 8bit 
https://datasheetspdf.com/pdf-file/653682/MacronixInternational/MX25L12855E/1 
(slide 17)
mx25r1635f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7595/MX25R1635F,%20Wide%20Range,%2016Mb,%20v1.6.pdf 
(slide 30)
mx25r3235f: 8bit 
https://www.digikey.de/en/datasheets/macronix/macronixmx25r3235f20wide20range2032mb20v16 
(slide 31)
mx25u12835f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7656/MX25U12835F,%201.8V,%20128Mb,%20v1.9.pdf 
(slide 31)
mx25l25635e: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7331/MX25L25635E,%203V,%20256Mb,%20v1.3.pdf 
(slide 18)
mx25u25635f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7410/MX25U25635F,%201.8V,%20256Mb,%20v1.5.pdf 
(slide 33)
mx25u51245g: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7874/MX25U51245G,%201.8V,%20512Mb,%20v1.3.pdf 
(slide 27)
mx25v8035f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7432/MX25V8035F,%202.5V,%208Mb,%20v1.4.pdf 
(slide 29)
mx25l25655e: 8bit 
https://datasheetspdf.com/pdf-file/843325/MACRONIX/MX25L25655E/1 (slide 18)
mx66l51235f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf 
(slide 34)
mx66u51235f: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7674/MX66U51235F,%201.8V,%20512Mb,%20v1.1.pdf 
(slide 34)
mx66l1g45g: 8bit 
https://www.macronix.com/Lists/Datasheet/Attachments/7857/MX66L1G45G,%203V,%201Gb,%20v1.5.pdf 
(slide 37)
mx66u2g45g: 
https://www.macronix.com/Lists/Datasheet/Attachments/7884/MX66U2G45G,%201.8V,%202Gb,%20v1.1.pdf 
(slide 27)

On 12/29/21 15:08, Tudor.Ambarus@microchip.com wrote:
> On 12/27/21 11:16 AM, vincent@systemli.org wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Nick Hainke <vincent@systemli.org>
>>
>> Macronix flash chips seem to consist of only one status register.
>> These chips will not work with the "16-bit Write Status (01h) Command".
>> Disable SNOR_F_HAS_16BIT_SR for all Macronix chips.
> Hi, Vincent!
>
> Have you checked all the existing macronix flash_info entries and determined
> that neither of them support SNOR_F_HAS_16BIT_SR? Per manufacturer settings
> are a bit sensible because we can't predict what manufacturers are doing with
> new flash designs and whether they'll respect their "legacy" flash settings or
> not. Thus I'm a bit reluctant in adding per manufacturer settings.
>
> Cheers,
> ta
>
>> Tested with MX25L6405D.
>>
>> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on
>> lock()/unlock()")
>>
>> Signed-off-by: David Bauer <mail@david-bauer.net>
>> Signed-off-by: Nick Hainke <vincent@systemli.org>
>> ---
>>   drivers/mtd/spi-nor/macronix.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index f07b59a4120a..d530ab0b3b13 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -94,6 +94,7 @@ static void macronix_default_init(struct spi_nor *nor)
>>   {
>>          nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>>          nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
>> +       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>>   }
>>
>>   static const struct spi_nor_fixups macronix_fixups = {
>> --
>> 2.34.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
