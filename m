Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA625C61CE8
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KWLw79tqKyBG29TDAYKHVZQ9lxx4Ivdt7el/Me8rsQ=; b=GTP7X/XHwHYDKW
	x6tZJXFCNFsXoOiTJup5aYMK4ecImD9BWTBaarVxyFZYQ1Cv4JdJNb1PhF6a+qe88r6J9YZHxQqHl
	oIxTUWhOB/JATCBOPskJrUZfImADCWjb9ZyYFihum7a3Tqr21tdh8PNZcuZ8Ks0abd7JLkX/IYn5B
	Vj+QLvI7iQYpWNreN3Phh0zYJjgiOgGbN6ushA0xaZy3nZCMcoMoTBitDDN4/ptVnvbtT6U4tLAav
	EZ3lQdguUUJJAxBfR6Mj6CBm//G6hJCWhsp9dxobj/9JK8sjwsjDZABx54Zwc+FhdYqEOBrhHSsZj
	foI/b8UhkqHYLZe3uXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPc7E-0000000CPCa-3ILl;
	Thu, 12 Jun 2025 07:12:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPc7C-0000000CPC7-2OEE
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 07:12:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-742c3d06de3so876864b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2025 00:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749712366; x=1750317166; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgn7QcDTxClMZ/7hIchp6dD06DoeI6xy/UUqpaSAsaY=;
        b=Sfnt+GyRvG9uhnQwEMJEVROOF6I9FgQcYxJnzvKJVY/f7Zf3HA/wXNbJwF+iD/6nkO
         PX7FfzMqeKd7TnEPvrT9XCtqtLKKlzQuZ19DlI3V2HV2GCb2b4yeKZrNHlNLjmJ8rVat
         1g1oVu9OQOX9U1N+TQkZUUH4OjwcY4RnGzfNpC0G7T6SRafVm2ydGuQWsM1L/d987Da4
         gkZjCEtGyOeV63Dpfc4MWt0mc/p/kNFvhw2qYNsgCAbfCKy/CYWnJtsBZErvY5yZMdvu
         0h45cworkxL+X31dl2NowyWx4JHjaTSRzZppjVFz2OlpMK8nyUAxNwQtGsBHxx4UbDDb
         0Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712366; x=1750317166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgn7QcDTxClMZ/7hIchp6dD06DoeI6xy/UUqpaSAsaY=;
        b=IVsgY03F50WCpZXcaWoVIXNKTcMoVitICorstTd8btKE3bXZdYE2wGl3SfcrfFvO1E
         9ItLnocmljA1oWoJpRadxxWfM6ZQiVGVBNrr94nJuwg3rWewn4LmksYj1DP7C3HetSOI
         ktB6hiT8T1VU6vf9ifRBZ2LlHOCxuzoWjEd1XAJ817ySb/3S7dBlz4AUSC/zFRrAHCYS
         ICtmrc85Pa+DBe/s8jWINHzJ+LgSTzutA7Fs+FnpMXIbuofkxwPKb4aTYTpgcvyJoyMA
         ku5J4EiHtyFhspP5m/Zh3fOEDmhgc/3p2XPJukDNfAx7aSWZxe/Aw/r6L7MHVOkcp9R5
         5fJg==
X-Forwarded-Encrypted: i=1; AJvYcCV6MfSfIoixJ5AI3jKVowRrzI/gEQH9nIUJnmLApDrxAuDtfuCWr+cbdKro8SF4muKm2gWJPhQT1Ms=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Pwfe7DoNpKUh7M3FdgCZYnhHAYjnf4+bUmIt7vUPGLNL6HVg
	q+VLcOVdl3JhPhZOjEh4m4eDIUmoo+bAcC2IN+zfY2Cpi4ngUZKdTYbd
X-Gm-Gg: ASbGncuHFNBjA/wDCe/7nfl7twuQGBMmQpxlZdlVrie199fVoKJx1+1PekyjazNA7ZV
	wYh/BVjglMkrTM5abbhwbTv1R7gtjJocZEHT+vE+acjnOCU0+1Q+tLlqJ4QMd01rFBeYqGdcXAm
	I6r1LZDzJ1Zb8jU9FxcWtotuQXjiU9VUEY40lR71Bo9EmDVJLvlX3ZnIYLK0J5kt1YbiL82EAZM
	r9z19VtMVoVzmSwS5oC/ZW+hJ+wgYys96wZKgBiR8XA8nkNZJHSEBoSzpsyF3xMdGrEsbHcKgiU
	8kf4ToNc3uQOoc9f6OdJw8iPaY9g7D+ORVDuV/qKFYqwF2qsB0hiK+Ak+jM0uDOcsJKvbdDWJJN
	AEZBYCE20aWpwoalAco2dhIkaLvWJScfz8dxOKAA/rXl4xkEG
X-Google-Smtp-Source: AGHT+IF1b6I1n++T5N4mojz9evE8kNdWlqqlWfPd8DPA9XCgCOHNPhh7enKFh1xVQ7vnggPNl6j1hA==
X-Received: by 2002:a05:6a00:138d:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7487c207d4emr3476376b3a.4.1749712365772;
        Thu, 12 Jun 2025 00:12:45 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a0eeb6sm725498b3a.167.2025.06.12.00.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:12:45 -0700 (PDT)
Message-ID: <b0888f34-0bf4-423c-b09c-5614fe62a854@gmail.com>
Date: Thu, 12 Jun 2025 16:12:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode
 for SEMPER
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20250605085535.17963-1-Takahiro.Kuwano@infineon.com>
 <0b0cc45f-e6c0-4020-9324-758cb815400b@linaro.org>
 <c1088cb5-2f12-4dd1-b3cd-42e4709ef05d@gmail.com>
 <b00fb746-b4c6-4a84-90f3-700ab77fb335@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <b00fb746-b4c6-4a84-90f3-700ab77fb335@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_001246_613828_B47CF1AD 
X-CRM114-Status: GOOD (  13.73  )
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

On 6/12/2025 4:04 PM, Tudor Ambarus wrote:
> 
> 
> On 6/12/25 8:01 AM, Takahiro Kuwano wrote:
>> On 6/10/2025 12:19 AM, Tudor Ambarus wrote:
>>> Hi, Takahiro,
>>>
>>> On 6/5/25 9:55 AM, tkuw584924@gmail.com wrote:
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>
>>>> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
>>>> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
>>>> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
>>>> and function.
>>>>
>>>> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/spansion.c | 29 +++++++++++++++++++++++++++++
>>>>  1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>> index bf08dbf5e742..9162b9297ce8 100644
>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>> @@ -17,6 +17,7 @@
>>>>  
>>>>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>>>>  #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
>>>> +#define SPINOR_OP_CYPRESS_EX4B	0xB8	/* Exit 4-byte address mode */
>>>>  #define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
>>>>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>>>>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>>>> @@ -58,6 +59,13 @@
>>>>  		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
>>>>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))
>>>>  
>>>> +#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
>>>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
>>>> +					   SPINOR_OP_CYPRESS_EX4B, 0),	\
>>>
>>> I wonder if it would make sense to have per vendor opcodes. Updating the
>>> set_4byte_addr_mode() method wouldn't be needed in this case, you would
>>> just need to use some nor->vendor->ops->ex4b opcode, right?
>>>
>> Do you mean introducing new vendor opcodes structure into nor or
>> nor->params?
> 
> something like that. Maybe not right now, but something to have in mind
> if we keep seeing vendor specific opcodes that are different than the
> usual (BFPT-described?) ones.
> 
Understood, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
