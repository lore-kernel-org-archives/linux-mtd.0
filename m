Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7650EE95A8E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 06:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rb+S2+AqiIKeGw971NP4yXaDUy97uVLwzhfuK0/Bwds=; b=UJorf77rGSCSjC
	wx5xd+PDH3apAbflGOzTVBH9GHDiAy9EKvYbjixsfDlL07ajG+DQ01nqoyOhXNUBltn1wfupy+14m
	5L97lS4Dst0XoJxPMiMAZq0+2jfXjnfJbSLCeVCiOyuDUljq36wH3XJBf3k8j0tIU7jyxtnKwbyGA
	m+pJE7/fIPTAM65VUo3ANkljLFOKSKldPEvRFoZwNDAMc6sF3tZlx9BeAeErzPr8j/n9PfgVHnPxw
	0RvaoZHadpvt1qlBI+Xmf1VwHViIIwR2QKiYVBUz983ssMcniVVyUMroEY5BN0FES0P4z5pm0kk+z
	qv6WXEH3feQxEtyLYTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpjWN-009pTR-33;
	Mon, 09 Oct 2023 06:13:39 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpjWK-009pSM-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 06:13:38 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c131ddfc95so51747281fa.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Oct 2023 23:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696832013; x=1697436813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiJrsvnGPRobXrJdTj89DsFn8NcM56fCbscmDol6QNw=;
        b=RRd6UODz6CFpvgYu9aKkCdHZnsIif/9RDSeo5kYN6k5vhzDP8bIDlwcnX09ip3WXBc
         QQq5P0QarXy3h3exEztIWe8fqtHlamSiR/uZACXm636XXXzZPPuAbsSI6+1Z6SSzqZWp
         deXId18/hjTDLMMOAAgLOwF7UbLTYnAsrMgMANFUtxznhX6O3lkHAKjbztMjLTDVQS1P
         Bo+yICDX4L4TGJqqyyA/ZGeV0jrFVuxzDxSmH1HKM8uWYwI9RNzkqMkqIb++4uyBry/0
         d5miQ/HxXYstMyap3lvlxBKboda5bk23Ylp1HOgVFtWG1iQLk+rA09rHWF57cHMzqaBJ
         mABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696832013; x=1697436813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiJrsvnGPRobXrJdTj89DsFn8NcM56fCbscmDol6QNw=;
        b=K7m4Qxd8qw8b50dxuLBiKhsYxHoMxb8AUlBOm9EkxXc0t4ptD+j0A+vP2cswuu5p59
         /clXBvuV8vTTAVs+DfxoBobOaPjgl1FUTxitjEOli+3ogjdriBx3FLOqvFMyXVd65nXi
         1ouKe3hXu2gy7ZyGWova0oK4sMcYI68RY49j2nPCRsxZk9t1sdD0ZY6Y9PrK/aZIMZnv
         yhLmiy+UE0Tu3/ti7/U9KegxyxQV90QkW+6WDfhCz23z/nxrll+MD0HCe8KiCOqf/orl
         LE5U+dM9phkcZjl7bWxQ9O17pzZr2gvzr1VQpSbY+mgaESbjbTZbLI+K6/5NJDA/+ssx
         84AQ==
X-Gm-Message-State: AOJu0YyAr4WCba0gd0eELFlAL5RXFU5uI48wIom6fGVugpVdvFFqAoIR
	d7Kw0AGjOiQ9PrCApvxzxQKB5w==
X-Google-Smtp-Source: AGHT+IFdWs4OfmCoxzdj2dCucyWYWCYqIEoYeEeWYDec3XNZFrslG2PBfDbIwzzEUEGgbycu1HUtAQ==
X-Received: by 2002:a05:6512:522:b0:501:bf30:714c with SMTP id o2-20020a056512052200b00501bf30714cmr13379172lfc.24.1696832013002;
        Sun, 08 Oct 2023 23:13:33 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id az41-20020a05600c602900b004068495910csm12327762wmb.23.2023.10.08.23.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:13:32 -0700 (PDT)
Message-ID: <2e3ce75d-7e2d-4e62-8660-48a41074c20c@linaro.org>
Date: Mon, 9 Oct 2023 07:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
 <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
 <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
 <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
 <eb2a9138-a76e-4b1e-e001-315149c4dabd@leica-geosystems.com>
 <f0a7acb3-00b5-433d-af5c-724a509fb816@linaro.org>
 <bc76767e-00c1-47ca-9a27-2aa7d2a262f6@linaro.org>
 <b9b7bb93-fe23-34dd-6a30-b1b0d792861f@leica-geosystems.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b9b7bb93-fe23-34dd-6a30-b1b0d792861f@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_231336_177804_F8FEB8AF 
X-CRM114-Status: GOOD (  19.14  )
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



On 10/6/23 17:09, SHUKLA Mamta Ramendra wrote:
> 
> 
> Hello Tudor,
> 
Hi!

> 
>> On 10/6/23 14:33, Tudor Ambarus wrote:
>>>
>>> Hi,
>>>
>>> Thanks for the debugging info.
>>>
>>> On 10/6/23 11:30, SHUKLA Mamta Ramendra wrote:
>>>
>>> cut
>>>
>>>> --------------------------------------------------------
>>>>
>>>> IMO, HAS_16BIT_SR flag is causing lock/unlock failure,
>>>> since BP bits are calculated wrong then.
>>>>
>>>> I tested also for a case where I don't parse SFDP and
>>>> reverted the condition in  micron_st_nor_default_init()
>>>> for 16BIT Status Register Flag. And lock/unlock fails with
>>>> same log as Non-working case.
>>>>
>>>> And this mt25qu512 has 8-BIT SR as typical micron-st flash.
>>>>
>>>
>>> Indeed, the problem is that HAS_16BIT_SR gets set when it shouldn't have
>>> to. This means that the BFPT table of the flash is wrong and we should
>>> fix the parsed settings via a post_bfpt hook.
>>>
>>> Does the following fix your problem?
>>>
>>
>> here it is again, this time compile tested:
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>> b/drivers/mtd/spi-nor/micron-st.c
>> index 4afcfc57c896..20f76e278095 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -180,6 +180,18 @@ static const struct flash_info micron_nor_parts[] = {
>>          },
>>   };
>>
>> +static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
>> +                               const struct sfdp_parameter_header
>> *bfpt_header,
>> +                               const struct sfdp_bfpt *bfpt)
>> +{
>> +       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>> +       return 0;
>> +}
>> +
>> +static struct spi_nor_fixups mt25qu512a_fixups = {
>> +       .post_bfpt = mt25qu512a_post_bfpt_fixup,
>> +};
>> +
>>   static const struct flash_info st_nor_parts[] = {
>>          {
>>                  .name = "m25p05-nonjedec",
>> @@ -405,10 +417,10 @@ static const struct flash_info st_nor_parts[] = {
>>          }, {
>>                  .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>>                  .name = "mt25qu512a",
>> -               .size = SZ_64M,
>> -               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ |
>> SPI_NOR_QUAD_READ,
>> -               .fixup_flags = SPI_NOR_4B_OPCODES,
>> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> SPI_NOR_4BIT_BP |
>> +                        SPI_NOR_BP3_SR_BIT6,
>>                  .mfr_flags = USE_FSR,
>> +               .fixups = &mt25qu512a_fixups,
>>          }, {
>>                  .id = SNOR_ID(0x20, 0xbb, 0x20),
>>                  .name = "n25q512a",
>>
>> cut
> 
> 
> Thanks. Yes, this post  BFPT fixup resolves lock/unlock issue and
> I don't see HAS_16BIT_SR flag in params.

Good. Please send some patches addressing all that we discussed until now.
> 
> 
> Datasheet is public: 
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211 
> 
I'll take a look later today.

Cheers,
ta
> 
>>> If yes, please add some prints in sfdp.c to determine where it's set,
>>> either in BFPT_DWORD15_QER_SR2_BIT1 or BFPT_DWORD15_QER_SR2_BIT1_NO_RD
>>> Is the datasheet for this flash public? Would you send me a link to it
>>> please?
>>>
>>> Cheers,
>>> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
