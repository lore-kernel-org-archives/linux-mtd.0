Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E363C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 15:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1939A20866
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 15:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GPbb5YME";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GdYurZf9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=126.com header.i=@126.com header.b="YGbUuNOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1939A20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=126.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7yevUCMVK+ZwYUPlhsBW01Ovq4M/o4ECrGhY/5vtCM=; b=GPbb5YMESYQYcD
	+eA6UbqoDEYETSwk0lRJuiVc9yIzRkTVOCHuH8+AvynHAM3YHnu7XOx1BXKMgPoJ1cvWKWOj0+nNH
	ZsT87zr1WwxXq8X6X457/byCGHC++m54OJaMArkl9lJn6r4IbzMKarCithSJy7uFXbFeuPuZnV6g3
	INewoRjugfIgg3qrAHy9wFBZb5WvOYvKvlso8V6JWpUiQl6tu1cju7wyMEwVkq1oJ5pgHVxoAsdKD
	mkbex8JnizeDchzzAzKhqWJBwDomS2Dh/6D/ZiYQSI9G21VkY6QCw7aUkmehlK2WQZteeD4c6qJHU
	Z0lvdr6eKVAVjtoMqonQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8o2L-0008Hr-Rq; Tue, 26 Mar 2019 15:30:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8o2J-00087l-Gl
 for linux-mtd@bombadil.infradead.org; Tue, 26 Mar 2019 15:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JcoOMmZXsRi5JyZ2RXd43rhwGeOt+JTLh9aetNu0lb0=; b=GdYurZf9a7U782TF6uQ2Ns5iIV
 kQZsL5uSU2S/B7o2FbwqVw75jZ6a/pZlJTsGFgcAzYDORQGrJcKczM9pb6+JlVXo1G1ji/CHHykro
 sbIPFukN3koDuZ4EEcAV2/Y6ld0/C71JCTo/ybYzo/6hn0+nFtCyO+UuGMgoHnslv02BxvVly6AXq
 1lrR2UgcJD6+BQq6KnZJ0hdOgHRAFwtYorwkCc8/xxkUOzONSSXFo7JU3yz91NKRIRcEARqRV7HlN
 2ACjjJzYEQkT4GBrxClHaUTMSJM6kctMRIxfSzdcYjZ0f0O/dOa/wAFqfQU5XBCla2p9KRrugfngP
 Afy9SGVg==;
Received: from m15-29.126.com ([220.181.15.29])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8nsw-0007mj-5e
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 15:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=b0/RK
 zzp+5oKOQQwWeV+adVheJakuAyEinAyTntq0/E=; b=YGbUuNOozUbuiOdpwD/e5
 ga6JNJKtnYUGgrmWve8vtDrQ8dEY+Vj/+RrGCATCUAoE7MI1ZlCLePLOZgKetGry
 y8k10ariH5BnPq6vjTB+4fgvb3XxVUVjeElyZu4pAyX/TDlyg84WW6E10dGiO1cw
 fdYKnNKr8K67x47CHEXm0I=
Received: from liuxiang_1999$126.com ( [222.209.19.73] ) by
 ajax-webmail-wmsvr29 (Coremail) ; Tue, 26 Mar 2019 23:20:44 +0800 (CST)
X-Originating-IP: [222.209.19.73]
Date: Tue, 26 Mar 2019 23:20:44 +0800 (CST)
From: "Liu Xiang" <liuxiang_1999@126.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re:Re: [PATCH v2] mtd: spi-nor: Return error when nor->addr_width
 does not match the device size
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
In-Reply-To: <823dcd3f-8b9f-15c5-a072-06625120766e@ti.com>
References: <1552484753-3393-1-git-send-email-liu.xiang6@zte.com.cn>
 <823dcd3f-8b9f-15c5-a072-06625120766e@ti.com>
MIME-Version: 1.0
Message-ID: <209ad144.9c0a.169ba96e2ad.Coremail.liuxiang_1999@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: HcqowADXTelNQ5pccQ0MAA--.9976W
X-CM-SenderInfo: xolx5x5dqjsiqzzzqiyswou0bp/1tbiZhuDsFpD5zoPcgABs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_152106_711549_9D34F4E0 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Liu Xiang <liu.xiang6@zte.com.cn>, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org




Hi, Vignesh






At 2019-03-19 13:22:15, "Vignesh Raghavendra" <vigneshr@ti.com> wrote:
>Hi,
>
>On 13/03/19 7:15 PM, Liu Xiang wrote:
>> In some is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
>> is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
>> means that 3-Byte only addressing. But the device size is larger
>> than 16MB, nor->addr_width must be 4 to access the whole address.
>> An error should be returned when nor->addr_width does not match
>> the device size in spi_nor_parse_bfpt(). Then it can go back to
>> use spi_nor_ids[] for setting the right addr_width.
>> 
>> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 6e13bbd..63933c7 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -2811,6 +2811,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>  	}
>>  	params->size >>= 3; /* Convert to bytes. */
>>  
>> +	/*
>> +	 * If the device exceeds 16MiB, addr_width must be 4.
>> +	 * addr_width == 3 means the Address Bytes we are
>> +	 * reading from BFPT is wrong.
>> +	 */
>
>JESD216 standard does not mandate flash devices >16MiB to always support
>4 byte addressing opcode. So, its okay for flash vendor to support
>>16MiB flash with 3 byte addressing and Bank/extended address register.
>
>> +	if (params->size > 0x1000000 && nor->addr_width == 3)
>> +		return -EINVAL;
>> +
>
>Assuming only DWORD1[18:17] bits are wrong, then returning from here
>would mean we miss parsing Sector Erase settings, Quad Enable
>Requirements etc from BFPT which is kind of bad.
>I suggest to move the fix to[1], addr_width indicated in flash_info
>struct of the device can take precedence over SFDP.
>
>[1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/spi-nor.c#L4106

Boris has added a fixup function, do you think this is more better:

static int
is25lp256_post_bfpt_fixups(struct spi_nor *nor,
			    const struct sfdp_parameter_header *bfpt_header,
			    const struct sfdp_bfpt *bfpt,
			    struct spi_nor_flash_parameter *params)
{
	/*
	 * IS25LP256 supports 4B opcodes.
	 * Unfortunately, some devices get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY  
	 * from BFPT table for address width. We should fix it.
	 */
	if (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK == 
		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
		nor->addr_width = 4;

	return 0;
}

static struct spi_nor_fixups is25lp256_fixups = {
	.post_bfpt = is25lp256_post_bfpt_fixups,
};


>
>
>>  	/* Fast Read settings. */
>>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
>>  		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];
>> 
>
>-- 
>Regards
>Vignesh
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
