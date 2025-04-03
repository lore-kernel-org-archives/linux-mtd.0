Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A34AC3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gC1qQBYTPgD/+7gbskJlo01hseOQMi6QqgfkvyeMcbo=; b=3AVWbg/eHjsq6P
	1oq7oRcMzKfZy5/aakrWntQO++QWQGNlw4eipaeEWk6OqofC1cRq+iiNFYNaf+sHaSuzBrtFTnJET
	Lxk247COQoLydy3yJj6guKHo4aAtHl1mL7GsCsakEsKeY3m/f4RlDunZankmCIQ41xiI5gxQ0qgbe
	0uZSvUzBmMD6CFVeSCys6tm11Jz+m4+FTZPrKiWdYWz6otANOXJdxPfUaTKl+ppe8xlRJwyXqs2m3
	0IqF9GqarhvSoREqSN4pVR2j/WEIV7udM/b2rNx+tmpMMb+tFybnDggNqDOKPQj/Abb7OB+fPvJY6
	5fXBuQ9q44N3RuMo6zPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Heb-00000008XqV-2PBd;
	Thu, 03 Apr 2025 10:18:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HBu-00000008S5S-0JI4
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:48:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-399737f4fa4so478610f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743673732; x=1744278532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Psp9hh/unXclzKLtQPwrGIUeNhodK6mFG+ltXehZxM=;
        b=NyfiVrJI7SrleBQpk1FlErWMrAnjd7gc97iulQn/8QIGA4DkctaceGUsMRPrNf4+9r
         fi5gSU0kuufbAiN3IiAA3o5QcGhIBXkvbvAe6rtGaj+Yg/yKdayV1+yTHZHa4M6CVgO0
         Eie8IhuapnEQrmv6gR/xKfAd8oiMnM1j70YGuJyv0/Zc9WtRSOW1psxYexHKqza9NTky
         jNGH5NfJbK9nlPzth3/p5NC494854joZBV2tMwTwdCroglYYOTvDIJocE/DUlIZuHhhB
         ml3+nMwUuF6F6S8aKc5rvDROI+XY503KOuYivZWdcPla+s/oekbLx9LwwNyfdOe0acXL
         dd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673732; x=1744278532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Psp9hh/unXclzKLtQPwrGIUeNhodK6mFG+ltXehZxM=;
        b=NzNzc1TIu+g/Ca2mMZCdzzMs/zShIq3X4NNpetzv7KUP7MRlWsm3599hJAMc4ATdvF
         RLdfoEaGU6ZKkYHejBcF4SelK5vPC6AlFuEEMthVClYj2NIs6a6IAWYMf7ZhjobIJ+Fk
         4rJ5goEDA5fRGUJUs9hhKpJvKC9856MHup7bjsVN+a0CR1lFEfUIBeiEbGPe3aJ/ChjT
         jNJo4vVrcn6SVsSUyYbfl+i5qjQrSYnb6hul9vaVQgsEinEVmZ3fbna0yUu53mrezSmw
         IFdSq6r9fSxxVX1YGyoU4YpCpdmOsEpwz1TGPTXYnConY7oVIs+FcAxwzUxWkM7PPvAm
         4NCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeciATtOyMcfV4q7Vspfha2R6skvlQq85dowHXmOQMskYXFOdB2I/o6ZxVYTNt7/Stv0SA//KLZDw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxH4jbOPH3h0QokkjDxrEzPRweP2LQcTFkwXoE5tw0wMADHYHfR
	lVLYo85api5Rkydmyjy4vYuuLVTpNPSYRa7to9AjeG4MiSEgTyXWQC0t9JvktVY=
X-Gm-Gg: ASbGncto/zqK7NZEZAlAVwBcyZuSc6VinUWcmQhvch5i4uHSlGs0CmHVdyk010h8wRe
	5B+rnOu0jnfxm1VxSP+kIed9LSOZ0wADpnjfrpUAxcj2vGytB1LxV9WTrER0KtEqA9H3q1jJkNo
	yWUQ6Mt9cnEstdGMMF0VsnCsJmIFOu+LtLQWsjXdEzHTsyjGZ5NrknjDZvWyXgpQEWmQiDHe0oc
	S7cUF7Q/kgiNpxAuDfCky5zW3iyoygVgjTi5+LG+LR1OAND9lZ8k9BvOz7Ahl6Luge5aWIz3Ukh
	YoZZtD6jZfzVk1/outxuN+C5GztmLvMCdCKfuBsbcYgOgcruS2PMQQ==
X-Google-Smtp-Source: AGHT+IF+EMQjdfUWsTac/ovnxYjZzhDsNs9ysnYZoiG5v9tCt9Pm/x1O8yqeEMQfzytKgbQ5jjGzWQ==
X-Received: by 2002:a05:6000:1aca:b0:391:1458:2233 with SMTP id ffacd0b85a97d-39c120cb5b1mr16167141f8f.11.1743673732414;
        Thu, 03 Apr 2025 02:48:52 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968a1sm1340663f8f.11.2025.04.03.02.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:48:51 -0700 (PDT)
Message-ID: <3078c954-7863-4d32-aa03-3dc75a129592@linaro.org>
Date: Thu, 3 Apr 2025 10:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
 <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
 <871puaqz6m.fsf@bootlin.com>
 <5463acad-ee29-45de-9d22-16eb7947002c@linaro.org>
 <87cydty6aq.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87cydty6aq.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_024854_139553_CA3BB502 
X-CRM114-Status: GOOD (  17.03  )
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



On 4/3/25 9:53 AM, Miquel Raynal wrote:
> Hello Tudor,
> 

Hi, Miquel!

> On 03/04/2025 at 07:19:15 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 4/2/25 5:57 PM, Miquel Raynal wrote:
>>> Hello Tudor,
>>>
>>> First, thanks a lot for the time spent reviewing, much appreciated.
>>>
>>> On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>
>>>> Hi, Miquel,
>>>>
>>>> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>>>>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>>>>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>>>>
>>>> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
>>>> in the supported ops.
>>>
>>> That's true, but single modes are literally always supported, so it is
>>
>> literally, meaning from experience I guess, or is it mandatory that
>> dual, quad or octal dtr to imply single dtr as well? That's fine either
>> way, just curious.
> 
> Yes, I do not know any chip not supporting single SDR mode, just because
> we need a common ground to perform the discovery? The core would anyway
> not be ready for such chips if they were about to come.

okay

> 
>> Does quad dtr imply dual dtr? And octal dtr imply quad dtr and dual dtr?
>> If so, then maybe name it by the maximum IO dtr supported.
> 
> Unfortunately not. Chips supporting quad may also support dual, but not
> always. These chips flagged 'dual_quad' indeed support both. However in
> this particular case, octal chips do not support dual or quad
> opcodes. Hence my idea to name the variants about what is supported,
> behind 1S opcodes.

sounds good. It's common in SPI NOR too to have octal/single dtr but no
dual or quad dtr.

> 
>> btw, not strictly related to this patch, but for the overall
>> architecture picture, why do the SPI NAND flashes need to define their
>> supported ops? SPI NORs for example are capable of discovering their
>> supported ops by parsing at runtime some SFDP tables that describe most
>> of the flash parameters and setting. I see SFDP standard (jesd216g)
>> mentions SPI NAND devices as well. Have you or anybody else played with
>> SPI NANDs SFDP?
> 
> Not at all! SPI NANDs commonly advertise a parameter page which is way
> more succinct, but no SFDP table.

okay, the ONFI table I guess.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
