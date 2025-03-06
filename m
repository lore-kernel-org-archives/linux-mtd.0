Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C830C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGPKvd9x6SG4C09AhFQJQsjhCG0UEDjoaBpZMMA4yB0=; b=LJ52WJ72d0OrMr
	nAZo0yaK5TvTPkJNZqmQjfjoPX/4b4VfqNB3rNHtw65UzqEL3BfGD/Zg+UkUHtS1XyVO3bKLSrAlC
	R1VMc8IOkezFzp3mvNYzQ04Jkv2jkriKoP0c8Idg4kkiCLLS4NEYknix0c96Id1g8kunW0ZK1Slmq
	3UiYSMisWikknGANQHzQix284eKYo2JUNgJ2zc66XW51/T33lD3LNrbtDAuoTQ9qBm52cVxebzrZJ
	wBTDYwpXSD8YKJQg+SddsO6pqwQrUjsV8y2kbZvBvy5t94uog2MKDDN+m27M0GPNKpcmzN9YDbPKV
	W48M5csjRzaa8Jh9BjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ph-0000000Ae33-3fOt;
	Thu, 06 Mar 2025 10:25:13 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Pe-0000000Ae24-3Ba3
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 10:25:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abf4802b242so96157266b.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256709; x=1741861509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLWrZGopc1llq2o6mz+/LpPRuF1EYQ3+w22gIXnfQZU=;
        b=k/B66fJaQT8B66iXXeuFJ0bugDT580oGY+1PQM47f4ftXRH1MSveDqPacxVLYdqA77
         VbiEIEPUdFqhbrltr+ECi/ILtA+A+uwMsy+ew81B9wjXqQyH0OQ/3TLrs6R3m7eVjpif
         u1V+4fEyRaghbTbJdgPrl+jbyG/vQrYpIaUKUC5hAaF+2qO8Lk4SQMkKm+wEzxAXWQQZ
         EXjHHBxUpR5GkvtCMolvQQZqTPJ071iDFIwmBYtvrNQdsM63fJsdoNuBgx0x75bxwQuT
         j+hqgrxfMivVU3osaNoFCOzeL+9n6+CF+GCiwoOHcBQr+QJdNLPqa+8K8NuYPnrg2cEb
         FqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256709; x=1741861509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLWrZGopc1llq2o6mz+/LpPRuF1EYQ3+w22gIXnfQZU=;
        b=iWJ4ePiQdu4UXIIMb5/dnxkfFUe0ZO+kCewsyeaQ1g5ca+i3qW+bEuoXKYio2ZTox7
         kJRLeU538L3OBTRYCMWyeZcVsjCPPZFPN8cTKN13g0OUA1178QTaIR/5b9PsYiRW5SLW
         2wdoizOe89hjjKYeFU1+90R7px9MnaqqIP9uXLtxf5heTPHz0sZFrlDBbCpCKQseB9L8
         D22eqAGsHoohYOY4Q/Z+9Hv3QTpROQ9m6WDUhCcp8n+zI9nOwYm+w9aVkLxBFAXt2RbS
         pAED8yeC/d59cjybCjin0dJ/ehPZaNykunCQp0kCQI5roTpPNyiN06AhFJZhrJrku+XE
         +6nA==
X-Forwarded-Encrypted: i=1; AJvYcCVTLL/SahSpFQ+ohf0JRSf136fEX2lzpL29KkNCqWwVbeEvDn4bu2qk2e1HYgbqUnqZ3A/1/vfPXi4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIc+oENsakRyRDDlNBVHpFInyHmq0BcA4+F2zcw2QoiMjCC7Hp
	hu4gOQADbTWokbhoH/ug9KZEkaH23bG2sXh7H+SDXdR6WTDJhRUPwD1grpCJ9iQ=
X-Gm-Gg: ASbGncvJz1yvJOY42s5OKYG3ELsciE2vtzm99QzPhh75BJGqLpFD+Vmpy0rhENBplkB
	sC5ETsFhIJbqWtRjaaBMviHskLHoO99uAlxavOegVkbC3A0E6WHOdZbBpwgtZxeTh8VGrSzlt6r
	blutl9udld5XmoyQgdK8znEhkCUkVBDrOdkqEn8E9FuSKrPoTYGUSvKuhX1e7H7fwhz698PRPgP
	HkHyj3wz+ZiFsfcDt9nXvn9JKcBa1j8mzHOrrQa4K8ksDTV76cCfJWcKrsAJ00HrVk1K3ZYJqPp
	F6gAFTAI8lKKA+Z/hMpxVRqL38bdSANmpH4L4i+1GX4msxuUZ9znCQ==
X-Google-Smtp-Source: AGHT+IHUGWEiwQC6801t/SsksIivDurhGhtf2WEcc6AHliejR5ii7CkK7jgZY/WsUoqpIN2na7URLw==
X-Received: by 2002:a17:906:6a03:b0:ac1:fa6f:4941 with SMTP id a640c23a62f3a-ac20d8bc686mr577199666b.13.1741256709009;
        Thu, 06 Mar 2025 02:25:09 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a6af7sm722156a12.33.2025.03.06.02.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:25:08 -0800 (PST)
Message-ID: <d6a1dc96-deea-4071-b087-703d30ab6269@linaro.org>
Date: Thu, 6 Mar 2025 10:25:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CYRS17B spi-nor flash support in ubi/ubifs
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Bacem.Daassi@infineon.com, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
References: <b6fc44aa-0a7e-422b-87c0-b33afaac1ea2@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b6fc44aa-0a7e-422b-87c0-b33afaac1ea2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_022510_834192_F76C596A 
X-CRM114-Status: GOOD (  12.35  )
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

+ Pratyush & Michael

On 3/6/25 6:34 AM, Takahiro Kuwano wrote:
> Hello,

Hi!

> 
> Infineon introduced a SPI-NOR flash chip named CYRS17B [1], which has untypical
> features comparing to others SPI-NOR flash chips. I would like to ask you to
> share your thoughts about possibility of UBI/UBIFS support this flash chip.
> 
> Features different from typical SPI-NOR flash are:
>   #1 Inverted erase polarity. The data after erase is 0x00 instead of 0xFF.
>   #2 Larger erase block size, 1MB (or 8MB). Typical SPI-NOR has 4KB to 256KB.
>   #3 Larger program page size, 2KB. Typical SPI-NOR has 256B or 512B page.
>   #4 Programming partial page initiates internal page erase.

Details on #4 from datasheet:
```
For programs of less than 2048 bytes, the bytes of the addressed page
that are not part of the user input data will be read from the Flash
memory, ECC corrected and re-written to the Flash.
'''

> 
> Obviously, #1 is the biggest obstacle as UBI/UBIFS (and all other Flash File
> Systems) are designed with an assumption, "0xFF as erase (blank) state".

I think you shall inform the upper layers of the inverted erase polarity
so that they can act on it.
> 
> #2 means there are less number of PEBs. I think this affects storage efficiency.

Of course. There's no point in having UBI dealing with 8 PEBs. Given my
comment on #4, I think we shall consider PEBs at 2K and treat the 1 MB,
8MB, and full chip erase as optimizations (partial/full chip erase) to
the implicit page erase. The implicit page erase becomes the smallest
eraseblock possible.
2 KB Page Programming -> 64 KBps
1 MB, 8MB or full chip erase -> 47.5 MBps

> 
> #3 and #4 seems not to be matter, if I configure UBI minimum IO size to 2KB to
> avoid partial page programming.

No, please don't.

Also, you also need to inform the upper layer that's no point in doing
an erase before programming, so that they don't first program inverted
erase state and then program again the actual data to write. This can be
done in a single step by your flash.

I think this is the only choice you have on putting a filesystem on this
SPI NOR. Curious whether the other guys agree.

Cheers,
ta

>  
> [1] https://www.infineon.com/dgdl/Infineon-
> CYRS17B512_512_MB_64_MB_SERIAL_NOR_FLASH_SPI_QSPI_3-DataSheet-v07_00-
> EN.pdf?fileId=8ac78c8c8fc2dd9c01900eee733d45f3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
