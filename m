Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F1C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 14:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38D72075C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 14:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OhX0iiQj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=126.com header.i=@126.com header.b="VLZlwQHP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38D72075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=126.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnv1/ufUTA0w8oIeWgj0G/kZQmaznyCm9bNeUMWaj8k=; b=OhX0iiQjR96ehS
	7qqo/6CDpCWIYPe7MYK3CtTLa571TMwZoFU91LH/siX32qKdpp4s1EjxNKO9UQFiOEHlBri/R9LtP
	6jPVSBPBA5/cGTb3F+j68ltnnwzeWFFGvGZOjKt6IgXveMwrE7cA3JLtZdR3+f//eZ6XnG4YCPLsW
	Wx/hzHA86bRWVs7rIY1fNPeHr2PbjtI8E/EXcIcV2k3BZnDDRW/XDNsHwSALk/W/nnuZhj3nEEGyo
	zqLWWg+Xl4RT6iyN34Y1Oy3OXMIk5sqoaDQ+YVqnxSdXdfQYCujEj6ybWQdr8Ya0Ei8LAgAx0kB79
	SEG+maWVkSfv142vkl3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8mxG-0006hC-3Z; Tue, 26 Mar 2019 14:21:30 +0000
Received: from m15-29.126.com ([220.181.15.29])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8mx6-0006g1-Si
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 14:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=n1jzq
 8200DdddCyXM3kjf0pJJmlFhUFeWh8XmCOIek8=; b=VLZlwQHP85mRxB8CtRKEU
 L95sKB7xJGc0bksd65Az3FZjpCQ2t9ClcEEAHXDkt6zoNHBqqp9/wuOHZEud2+kS
 1mvIf00xwPEe+Qxt1cymQUONaKNqTA/9QTio0Um59kOLPXLSPR+V4iOniVf7XEKK
 EJ/14zhKCTaH1/P//fmH94=
Received: from liuxiang_1999$126.com ( [222.209.19.73] ) by
 ajax-webmail-wmsvr29 (Coremail) ; Tue, 26 Mar 2019 22:20:50 +0800 (CST)
X-Originating-IP: [222.209.19.73]
Date: Tue, 26 Mar 2019 22:20:50 +0800 (CST)
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
Message-ID: <7c81cffa.98f1.169ba600d1e.Coremail.liuxiang_1999@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: HcqowAD3_19DNZpc0AgMAA--.33921W
X-CM-SenderInfo: xolx5x5dqjsiqzzzqiyswou0bp/1tbiZgSDsFpD5zMzZwACsK
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_072123_334030_51AA5378 
X-CRM114-Status: GOOD (  13.61  )
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

Thanks for your suggestion. I will send a new patch.






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
