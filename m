Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324BAC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 18:04:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16EB652AB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 18:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16EB652AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WExRyS1rupEFzz5ruEzauqvqrKNDxEBqqACVL3JM1Dg=; b=I4Okk+TB5OzB1qiQNPf7p0IOy
	+zvV6rBE8VLIHEhpmD0HAUZjV4xZQECi9sktegR2QUr7bWhsZoRMY2MXbudgxMuYX4i2GY6NHXcqu
	L2dz2vlYUTJVq5FfvMJNSoGyKh/JRzFW/jaGwRyx8O5L06XzopvIAFHnLFBz3Sw23DvErTfSX5/Ai
	hUJrq4PW7eQ8BD6eb8oFCRa+Vfm4pI+NrNgIifQpLywvUGs2gtIDsxLN70fQDsqsod+k5Xl/Xqp09
	EdQuWNlUCPgSW/QHCFtS25vazrOy6JspD4TT6pte0Rsf/3q0VhtlWXW6QU/TNzXTDAQ4Je3yB1Lxo
	+8T6sQUgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJKEC-001aIY-AP; Mon, 08 Mar 2021 18:03:36 +0000
Received: from mars.blocktrron.ovh ([2001:41d0:401:3000::cbd]
 helo=mail.blocktrron.ovh)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJKE8-001aFp-Dk
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 18:03:34 +0000
Received: from [IPv6:2003:e5:3f05:2d00:77cc:c84:87e:ce4f]
 (p200300e53f052d0077cc0c84087ece4f.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f05:2d00:77cc:c84:87e:ce4f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id B6D0526B31;
 Mon,  8 Mar 2021 19:03:30 +0100 (CET)
Subject: Re: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 shuhao.mai.1990@gmail.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20210213151047.11700-1-mail@david-bauer.net>
 <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
From: David Bauer <mail@david-bauer.net>
Message-ID: <e9626369-dc44-8f64-606b-88098157bc7a@david-bauer.net>
Date: Mon, 8 Mar 2021 19:03:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_180332_664617_53EBD40E 
X-CRM114-Status: GOOD (  23.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 3/8/21 6:50 AM, Tudor.Ambarus@microchip.com wrote:
> On 2/13/21 5:10 PM, David Bauer wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
>> sectors as well as block protection and Dual-/Quad-read.
>>
>> Tested on: Ubiquiti UniFi 6 LR
>>
>> Signed-off-by: David Bauer <mail@david-bauer.net>
> 
> David, I'll take Shuhao's patch because he sent it first:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20210208075303.4200-1-shuhao.mai.1990@gmail.com/

Fine with me, I have not found this patch :)

> 
> Would you make an incremental patch on top op Shuhao's, to add the
> locking support?

Sure, It's necessary for the board (UniFi 6 LR), as the bootloader locks the flash on boot.

I'll send a new patch for the lock support.

Best
David

> 
> Shuhao, can you please test the locking ops with mtd-utils?
> 
> 
>> ---
>>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> index e5dfa786f190..49d0d7993368 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -95,6 +95,10 @@ static const struct flash_info winbond_parts[] = {
>>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>         { "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
>>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +       { "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024,
>> +                           SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ |
>> +                           SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>> +                           SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> 
> Looks good. Let's put these flags in some king of order:
> 
> SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
> SPI_NOR_4BIT_BP
> 
> Cheers,
> ta
> 
> 
>>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>>  };
>> --
>> 2.30.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
