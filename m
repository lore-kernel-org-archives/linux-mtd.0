Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582CBCF855C
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qde7pch7SApAkwk0q9ZOeK1+dTOsWFnMcZnMb3lXuck=; b=TTUAj4/kvVPJfC
	FJS9D1VSK4CG/7SoetpGtQOcKl3GiiDIa902M55j6SNrGb+GRlU4CQkKJylsMHFBIc/oH40a9QN9+
	NAkis0vAHa9Atu2DxT5/MCY0nY583AhuLcZkHgwNm4ySgfb40uaArbwIssLGCdh38rhWeWtporrRN
	2YEN9acB1sVQBuHGQkVU2P7ocpY+4+NQfWF48+97yYfKle7R6w38r0BwV7ArhGCm+qW0NOrHszQRk
	IteGpYyFTLOXtJ3/O0fSiS4yMpLXADLOMR/lQKENWsoLyTC801tsxpQLhO3VnMdvBypKsVwEKItzZ
	LWAUEYWbpta7IY41LSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM08w-00000006Mhv-2mvB;
	Thu, 20 Nov 2025 08:35:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM08u-00000006MhZ-1fsb
	for linux-mtd@lists.infradead.org;
	Thu, 20 Nov 2025 08:35:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso3214525e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2025 00:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763627750; x=1764232550; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1jSWZCgeAfmjjyjsevv49mjqnEq82g0aMsUmMetKc4=;
        b=qdRoZDlySE4djPOI6zismV5CxY4zBY2Xy11S3DXutBRbdKNtD8KFc344ca52cwgOhs
         1ZnGwI+ZG66on+TviAfk0km3sdN1Sln+JtcBOXi1E3c8zTqOsxxqLoCj29hosUKYgumC
         DONGPBs7zni/sx2s1GL0FKnXc/IAOEd/iYyQu+sHWDTzAt8Mawok95jIvGcouMjtuReK
         Y6a5XHzm3YpjTEu+b73HtV+YoHYT6/tY2Qgrgy2nQOG5lB8UMEjnsjEEvR7v1K7bhecG
         mVPQ3ixaWdqgC5LlFBIsI7kDH3c9H+9J9gAHnkG2SwTB7OmZimb0kE/bUdOw5XbQpXPB
         70Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763627750; x=1764232550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1jSWZCgeAfmjjyjsevv49mjqnEq82g0aMsUmMetKc4=;
        b=p/DVbGwIyXMUEAmRlu8TkYpJDiUXqehSa4IZb7/y+3bYGO315kcS4tYliUkUCizjpu
         0UZOJ0v5YXnbNg/X67eOg96gh+dLWsogNKh5NgqJxgzZQ4ScHEGAdFP+fLDQHoj4VfhR
         pqMhBhnvr4+y48zQrN2dpRc6YEWSVkMG2PIoYDKjzqSqkPp1yy/1QXzh0Jbhvwhvi5HS
         Aw/cLDH7ajXCxxfyq475pPlIxkER4mY5YlybpC0tCN06pLtIVqkZTbsv0+asw0PvryXI
         QLl5Vx72MC1Rj5QhAAEVTWxwVd+nRd3eGS/DEiAbw44P2YtQSlozbEtTfc9AHyum+xsu
         jtuw==
X-Forwarded-Encrypted: i=1; AJvYcCXGnk/Cp+e7EOJ8f82S7lI4rEXR0mP6v6WaiMCsZB3s1Xxf7BHjPSt8DaUhjslEzuAPbfcf6xlVBlo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9oUhDmUIqzHHjjXT8N0YMFsOqLQUQbH+LbkYG+atFBkec2Bxc
	YZrgB3Gq1xF2vaUOYVYAfDrktLY4XW3kqM4Bk9u7UZh7fP4fVPWgeuCC+TTeRxu5atY=
X-Gm-Gg: ASbGncvycFRIC6BNBLHuKHN5WbyUuJ/wxwreazEJ4AFVzDpt/a1M8E3VBvvGoHaj4ST
	mJ34X3qBRoQWTT5uL1XMfJmlEKMJeuQz7W64uW0aYlTV+trTNPST9vG82WyI0PIVcR9pO3pXEap
	h5Xx3kZvV8LGe4YAKCCcwSIKn8RU+Rgu+NKd/0H3b/JY/hDtvL0eWlvzUiFZGcLNLtyfR5plEP0
	jaUt3snrD1YY7qaMzZCs6v9bqpJ+xxEknC8JGWvLdf5QqvJgoVcq/XYVHGpa5JJkI53dQiUC132
	cMWT/HjSGAXp0t7yYy/YfpoCCsL4mNW9UF3P1+5W3tUPW6qvBVznJDjx2y/jGcc1QSllmEZeNJn
	/kmKo2Ka+cY6WxKVH1iuZpmPuI2Og50oxMvQT9j5BgdxdJ9Y61+u0SHUnj8bKTyHkhXdu+NOwzN
	7U6XGRe9ItjKnHkoAj
X-Google-Smtp-Source: AGHT+IF1ZFBDL71uBaSwbhNDatpe1vIJpFPHU6lONyVDyD5pnpwHGngatw+aFLHLdudpyOTvNR4+Tg==
X-Received: by 2002:a05:600c:1d01:b0:475:daba:d03c with SMTP id 5b1f17b1804b1-477b89541d7mr19670195e9.13.1763627750364;
        Thu, 20 Nov 2025 00:35:50 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm4648081f8f.10.2025.11.20.00.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 00:35:49 -0800 (PST)
Message-ID: <81a0af49-9c0c-43e7-9a40-d66ba95c578c@linaro.org>
Date: Thu, 20 Nov 2025 10:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] mtd: spinand: Make use of the operation templates
 through SPINAND_OP()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-10-be42de23ebf1@bootlin.com>
 <5680a2a8-aeb3-4274-a264-4ff658cc9246@linaro.org>
 <87jyzmaqcq.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87jyzmaqcq.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_003552_473620_67870ABA 
X-CRM114-Status: GOOD (  12.10  )
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



On 11/19/25 7:23 PM, Miquel Raynal wrote:
> On 05/11/2025 at 17:28:29 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/31/25 6:26 PM, Miquel Raynal wrote:
>>> index 4afebaf5f0195b9bc617ea1f125f637f76fff9f8..a8fd04a67cfa9925bd68c57539d86e0816b76274 100644
>>> --- a/include/linux/mtd/spinand.h
>>> +++ b/include/linux/mtd/spinand.h
>>> @@ -701,6 +701,93 @@ struct spinand_device {
>>>  			     unsigned int retry_mode);
>>>  };
>>>  
>>> +static inline struct spi_mem_op
>>
>> Do we still do inlines?
> 
> Defining functions in headers like that, I think yes? (static inline,
> not just inline). The full line is something like:
> 
> +static inline struct spi_mem_op
> +spinand_fill_reset_op(struct spinand_device *spinand)
> +{
> 
> So it's not an inline declaration of a variable, but the definition of a
> function (just saying, in case the diff mislead you).

I saw it's a static inline function. Check this please:
https://lore.kernel.org/all/Pine.LNX.4.64.0601021105000.3668@g5.osdl.org/T/#u

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
