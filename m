Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A10C0219B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDWDrCY5ZAvYv/+UwnYnZGZLWnVEgaYGzvl/P3juzeE=; b=HhaVO7rVE/Jquk
	xk+PMiqSBaLzbHTzOHkpsl1X3VkVv3fgOSH1BB8Pi38jfRF3dRurN95IgTm3gFItTOvXXxix0sQ5u
	hB7cNVPkLpN59YxyVKTbTS9OzO2N5rCDeCbsa3cMhJzXacc+J2xuh/XMxFthbyreFgkhAibxByJH7
	7yUCqgeg9kRafO9LFEQZnEct0xRmPlqFDmdHcKKVdyN1GtZg8rJ0OoAy/tV92HYnbEiCjsMPk3GBY
	JDuNhDi1KO0b3SybpcIOSHUSmnaxDTCs7sVqDgY/O/DDT3f7RRXqdMq7hns2xqlLYQJVgIJQ7uV7p
	sjeEPfXeWVDp6E+3PxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL4P-000000097JK-3VQY;
	Fri, 07 Feb 2025 09:54:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL30-0000000970a-2q1x
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 09:53:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436341f575fso21449985e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2025 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738921997; x=1739526797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI5le2m9MtRic21XlVw4VlPIjEEeUg5523fwZbcDp5A=;
        b=T43Wav8jXgAoebd54meKSe8tks9V4Yc3Ov+THG10hrpj6zgD//0kTnBCVfuihahi5c
         CUACZIu8hNfvPvGcFvwq+PbyM0aMIrkz6Y6C+D1R4BwBkJRXJ2XBD/p3QCXruL9TJogo
         ETrlc/6RYfuIP18ryfZ8nK3qFteuiFPrDBZRoi2xS7j902e/A7cgVU/w68Lf1h878Weo
         430DO2Dihs326iurr4Il4PI741YqwZ1YwExDlameyvt5zp+6jyFTG3i567naCgwN/6Z6
         xjwlhEe55NGt5uWvYgFnEUjLMHpMiSdzpccgbc0cgnNJ87D5C60ikcN9vqS4Ya7uEPU3
         8dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921997; x=1739526797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HI5le2m9MtRic21XlVw4VlPIjEEeUg5523fwZbcDp5A=;
        b=PTxWTDUgD7CaUir1y+sA+Dmirq/4wuFF33WE+dcE3zJHLVxnRvc+EjRCcy4CvzUXO+
         XS43pWPu6T9DoJARKubPBhAbsJILjPqmmSpLU1YBoCepmOuR8xu9y2iB19o6WOoXM64k
         Uo0D89aZQZw3E2LW+3nwnX1BAZpkf6f/tmO+69duwT27OMI905cfjFWSzXtGrttSEny8
         BqUHiTo0Fx/HQ+VIWkv6xOVoWIfj2Zh6JuF0Krq9d6y3dWkP9M816ortNjz3nt4vBOiB
         tTsi6IzyYJrBx0AmFwvZF23tXV3QJo2FDtSb61RUNDU4nePI1W/XF2BbPX1ZxiUuES87
         Woag==
X-Forwarded-Encrypted: i=1; AJvYcCXZT827Qw84N06QYLD+MjCHmreYIHIDItQyz9JKR0N9kRifEg/8yg+TIrZjMklrFCAqu2YbPJzM1AQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgTfhaEwWiOPQ854/omNa9YEIkrihP11P6t7b+VZW6vF8dfDzq
	ieHAGU8PFKND8U1+2nGCmlrzZj9IS2pj6R7URtOX29sQ0/lPxd1P7aUDkA9kkSQ=
X-Gm-Gg: ASbGncsxhQTNSWCCU7goVoJGZ9zfyQsdzufhCMyBcoNjeUny/6o1YIWuMixz8f4m4gV
	Q2SHmGgKK6bYXvnAX4HpJsZRAxma+V8N5Mh2i6NDGz7HNh4MzV8Gh/EXeMtO7CUwMBW8FwCMX22
	Dy2ucSWSTHmKyV4lJn5PAIPucJOU5lNx6jQmpdqTtesnkWRPfxc5SW3wrcACKlrNdnwuUeC61NR
	ONaFYAKM1LWLfEweLxLBNBlfg6Sjrrlpg/OMsL7TiiOwan4XiDnhlWYVL+MC114ZuSoHWURUSRr
	O/wTtMgh7uSVzB52lm/Le7rM
X-Google-Smtp-Source: AGHT+IF/jd4MqZAtMmh1k6zAEYsukyGyHjp1fzUdIn8Rugzvkd2nBmHJEjdc1jWM+2m1hRsz4VyZjg==
X-Received: by 2002:a05:600c:384c:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4392497d1d9mr24860505e9.4.1738921996824;
        Fri, 07 Feb 2025 01:53:16 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4592sm83239435e9.32.2025.02.07.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:53:15 -0800 (PST)
Message-ID: <9f8cefc7-12e9-4c1f-9e4d-e810a3eaecd1@linaro.org>
Date: Fri, 7 Feb 2025 09:53:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
To: Michael Walle <mwalle@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
 <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
 <23d2dd5b30cf25090ef947f9bb984d95@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <23d2dd5b30cf25090ef947f9bb984d95@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_015318_729492_E0BEB1FF 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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



On 2/7/25 9:23 AM, Michael Walle wrote:
> Hi,
> 
>> On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>
>>> Due to incorrect values in the 4-BAIT table for these two flash IDs,
>>> it is necessary to add these two flash IDs with fixups.
>>>
>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> It would be nice to have some kind of references of the part
> numbers in the commit message/subject ;)
> 

Yes, I agree. Cheng can update when sending v2 and still keep my R-b.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
