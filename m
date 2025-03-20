Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9243C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UdH1QsCLFwwiH4HqyMJLMyY1gDAENtW9bS0N0LoTm4=; b=ILPDMAdInf0Va0
	/JdGcXvfhj1NQRoqh2egDiiZzfBxY0bt284pB7hjGOc/7oqO/gHwozXzKRwfvXz9BWSjSKZI9ws8x
	mP27jnoaQzJz6rl5Q0x8nBl3ZZQErqOQIMgjPQAAcIbyj9bZaTBT9i5KvHwO82BggKJLmGBVqorTg
	etSFYD4EJAiwSSXIpXGZmPH8EWEzzwJccALuL7qd5Jqmbx7T+6rgZLnmD+RNNPx+kEw8pvLbcGctb
	51DhFm1rgnGcaFF/h2ssavSKYGkVZvLxe7oTgVBBDWIatItj6QZbvNOWcyfhtYaF/rdhc/5Gm+AyD
	kzDE4sHQXTGf6fnH+bTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvElN-0000000C4ic-0GjE;
	Thu, 20 Mar 2025 12:12:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEcc-0000000C2ax-11LA
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 12:03:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912baafc58so565580f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742472216; x=1743077016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQDLeTVQO60i129NwHZhgyuH4YLDfE0eRqlKn+9+84M=;
        b=rOK6N1Yeuz+u6VduvS8074d/3p5qz1skFTnDQxrkXlsBhyHZxcQzJHGGTDaQPyahOQ
         IUdFu567R/yIjFQcGjsauyNudIAm36qp+Zd5WeFRoWIHdPSeiMjjQ8ywBKvyjeM17wI7
         dFZww5umJevSpX19YealQr5ZUcvKgtSnvfTmvPsAgbcObXUI6szq3vDdDlAFJx8uVUHF
         Oh9TonmbFWKbBBTBQi9pwkEn7VAm77viVe9usgZXl+/Brr/Z6bHO/BRyGnhRAy1QatTM
         E9KJRE96fcUbuIodbKciLKBHbky5U+9IMNjQUAtzpHVrOlMSMIaFhg3hmVdWxCTFEqI1
         Uhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742472216; x=1743077016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQDLeTVQO60i129NwHZhgyuH4YLDfE0eRqlKn+9+84M=;
        b=TFdsH4t/AOIQVQDz6JtlnF8iZ2tcNk1gzTpdmcDjbiCtQDoh/9sDBDw+odgPP5UWZP
         X7Dc4B9Dm8/CgKFB46z0GeCWrEBdoOZhdrGkmkF/glZnKLWRUmAZLQkXl29OsX1/Bm/d
         sxJE4pXL+cX/67R7t66TRlNp9wfaXsutT27RJgFea1vIBC8nG0qExZbNQ2ieLFxTYrNe
         6ufdTb33VXEdUGdWNr4e9vdIAOThkY8rshCDmtbnl+FXEPTkg4G1GApSbahSNBNaWrAs
         IT9llZoIwK07BieGypaEjRxFtKfHK/0dE/t+8i+U+bMw+WcHWoUjrg+67d5Rrm3TWj0q
         TtZg==
X-Forwarded-Encrypted: i=1; AJvYcCUtdf5/Wb4H20HGkPph2VTxmSZQ377jptsDMg7Zq3anTuouHEJDTirLzH4QriwVxvD2B7fWgPLETBM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJF7rVqc7KDxGcIKF/h8PMh6DTJAVUJijDLr/Pf2mCH2jbGBH
	1WLOfe/aAxoka3J380S+xP9yZ7V/gB2sy3EHqVP9EO9EsSo6DDGXp/JU+kq6apc=
X-Gm-Gg: ASbGncvCZashARNpQpz/F7wGPVwpqYzfpE04+DEf7DezwVMIX2SzQ5WAQqbmyL6NNUD
	19Ggou1qu/FIewGvuXZTjyrW5BGNuxDT7rjQkdFWk2NPRL6qmDtAJY4ctJy6uoST7lL5OCIRmhB
	iikfX17XUif+1r804IjPwUosSPKGQAtUUaPYnGrg4IGXubSWzjVAGURqzz6bypDARWYh5xRSemk
	yNuKcLMAekvtDASeDLCufDgNGFF49CE4Ewahc7XKh9wAOEJ7XQOwEERMsjCf+9+rr5Pbqqyzf//
	uOOO12glholfTuSfA6SYsN1gBMub6FV568mtZDk60xf/TfPRRLSWxw==
X-Google-Smtp-Source: AGHT+IEK+xwmyzpLH4fUFYAK8pkY/PJG3xFWTRmMVVaoYGY6Hu+ouzrAyy9TiUC/EdmpUdoPxqvXIQ==
X-Received: by 2002:a05:6000:1fac:b0:391:4835:d8a8 with SMTP id ffacd0b85a97d-399795a7e4cmr3253293f8f.1.1742472216356;
        Thu, 20 Mar 2025 05:03:36 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df402esm23250656f8f.1.2025.03.20.05.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:03:35 -0700 (PDT)
Message-ID: <4d36e51f-323c-451c-afeb-a6e378e3ed53@linaro.org>
Date: Thu, 20 Mar 2025 12:03:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] mtd: spinand: Use more specific naming for the
 reset op
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
 <9004166e-5535-4024-8114-9fdb217407bb@linaro.org>
 <87v7skrgjl.fsf@bootlin.com>
 <f1111d1b-a111-4171-9467-450d90a14c0a@linaro.org>
 <87iko50vvb.fsf@bootlin.com>
 <ba99ef52-0c98-45a9-91e0-4fd205649e00@linaro.org>
 <87msdgvsyc.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87msdgvsyc.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_050338_293586_4E53DD4F 
X-CRM114-Status: GOOD (  20.90  )
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



On 3/20/25 11:31 AM, Miquel Raynal wrote:
> 
>>>> How do you feel about a OP-An-Bn-Cn-transaction-format,
>>>> 	where A, B, C is {1, 2, 4, 8}
>>>> 	n is {S, D}
>>>> 	transaction format is {0,1,2,3}{A,B,C,...}
>>>>
>>>> Care must be taken care of at the transaction format, as I see there are
>>>> a few, depending on the xSPI profile and protocol mode.
>>>
>>> I must admit I really dislike the transaction format abbreviation because
>>
>> I'm not in love with the "transaction format" either.
>>
>>> it is specific to a spec we do not follow and is not explicit. I have a
>>> strong preference towards keeping just "An-Bn-Cn", like I did in this
>>
>> Okay.
>>
>>> series. If people are in doubt, they can check what is in the op, it is
>>> self explanatory. I chose this in the first place because it is more
>>> explicit than just "An" which may feel like a cropped
>>> acronym. Furthermore, most octal capable datasheets I've looked at seem
>>> to use the "An-Bn-Cn" format, even for single opcodes.
>>
>> So for RESET, WREN, WRDI and other opcodes that don't require address
>> and data, are those datasheets referring to these opcodes as 1-1-1 commands?
>> Can you point me to one of these datasheets, please?
> 
> All Winbond datasheets use this convention:
> https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf
> See 7.1.2 Instruction Set Table p.25.
> 

Nice, thanks!

> I checked Macronix and Gigadevice datasheets, they simply never "name"
> these opcodes clearly.

okay

> 
>> In SPI NOR, WREN is just WREN, regardless of the number of lines it is
>> sent on, 1, 4, or 8. How would you model it here, 1-0-0, 4-0-0, 8-0-0
>> using the same opcode?
> 
> I guess, yes.
> 
>>> So unless there are strong arguments against, I'd prefer to keep the
>>> current formatting. TBH, it is not set in stone and can still evolve
>>> later if that's needed.
>>
>> I find the naming scheme An-Bn-Cn good, I'm arguing that it's not needed
>> everywhere, opcode only commands are better off with it, I think.
> 
> Ok, I can drop the -0-0 in this case if you prefer.

Not needed. Just wanted to make sure we have a unified way of dealing
with the protocol modes. Having WREN-1-0-0 and WREN-8d-0-0 is not that
bad after all, it allows you to specify the number of lines directly,
without mangling the op afterwards.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks for the patience. I'll check the other patches next week.
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
