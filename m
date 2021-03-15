Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E9DC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 09:27:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BED564E33
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 09:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BED564E33
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VZ2af7k1UvNoej6TroirrxaikXWmG5Wwhf2pldHMflI=; b=AkelJLZo9T1Qx1vrvnmhGUdRr
	YnZwJgBXzkouy/k6+xezOZ+yhGKV1twgqym6/EyPtUNJQgmEI+5pIEnw2HpzPM9pMz0pA9PvmPc1E
	xl2UT/CxMBBWGLaLkqOB/513mOSkd8DSSJjMYqyP/wj1MDJoDrHNjjUbaXvrTvPMh4r557l0wpWVF
	mgtSiCOGsqQsunZJTV/sGb7D2dPrKpwJnMUcms0SjR9UDKF+iIPdDE6VAU7iO4gdnKhebPSRWxlM1
	OlWFaadVb9BGaQhd0rE5b9wqzjlbpJAXDMg6ZN5+rs3zwdlREMeD3xTLBBvWKxLZ727tmWBDgKRAT
	z7mXZgdfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLjUo-00FNdA-8I; Mon, 15 Mar 2021 09:26:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLjUe-00FNbV-Kh
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 09:26:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BCAEE2223A;
 Mon, 15 Mar 2021 10:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615800391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHc3wCOGau6Us9gagovvjPm5hO+ZMD2/vqjQHEsoURA=;
 b=lzOMpGLMpCU96GyBAVFfW+dbM+m1N/2YjH1i2xL57Qs6BWwEwNP2Ec74f6MO+hq4sfUHpV
 okDkgRQZGkVgs1ueyTnb/IpwlyL5mNHq8U4hhm3iYWpvL7D9hISizsW0WhVFKwd2f+RVyI
 GpiEtGhSXT5uDwtq4pkt4iMF7LdeuXs=
MIME-Version: 1.0
Date: Mon, 15 Mar 2021 10:26:31 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: winbond: add OTP support to
 w25q32fw/jw
In-Reply-To: <8e7147bb-a9ba-2b4b-abea-69e72ddd82f4@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-4-michael@walle.cc>
 <8e7147bb-a9ba-2b4b-abea-69e72ddd82f4@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2442f8a2e9ed1333fb45e90176200c11@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_092633_009461_2AFA0421 
X-CRM114-Status: GOOD (  19.80  )
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

Am 2021-03-15 09:26, schrieb Tudor.Ambarus@microchip.com:
> On 3/6/21 2:05 AM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> With all the helper functions in place, add OTP support for the 
>> Winbond
>> W25Q32JW and W25Q32FW.
>> 
>> Both were tested on a LS1028A SoC with a NXP FSPI controller.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/winbond.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/winbond.c 
>> b/drivers/mtd/spi-nor/winbond.c
>> index e5dfa786f190..9a3f8ff007fd 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -55,14 +55,18 @@ static const struct flash_info winbond_parts[] = {
>>         { "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
>>         { "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
>>                            SECT_4K | SPI_NOR_DUAL_READ | 
>> SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>> +                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>> +                          OTP_INFO(256, 3, 0x1000, 0x1000)
>> +       },
>> +
>>         { "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
>>                            SECT_4K | SPI_NOR_DUAL_READ | 
>> SPI_NOR_QUAD_READ |
>>                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>         },
>>         { "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
>>                             SECT_4K | SPI_NOR_DUAL_READ | 
>> SPI_NOR_QUAD_READ |
>> -                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>> +                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>> +                           OTP_INFO(256, 3, 0x1000, 0x1000) },
>>         { "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128,
>>                             SECT_4K | SPI_NOR_DUAL_READ | 
>> SPI_NOR_QUAD_READ |
>>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>> @@ -131,9 +135,18 @@ static int winbond_set_4byte_addr_mode(struct 
>> spi_nor *nor, bool enable)
>>         return spi_nor_write_disable(nor);
>>  }
>> 
>> +static const struct spi_nor_otp_ops winbond_otp_ops = {
>> +       .read = spi_nor_otp_read_secr,
>> +       .write = spi_nor_otp_write_secr,
>> +       .lock = spi_nor_otp_lock_sr2,
>> +       .is_locked = spi_nor_otp_is_locked_sr2,
>> +};
> 
> Should we have this in otp.c? It can be shared with gigadevice as well
> as far as I understood.

It should work in principle for both vendors, but I couldn't test it. So
for now, I've kept it private to winbond.c. If there will be OTP support
for other flashes with the same ops, it should be moved.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
