Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7834CCD1292
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2024 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5KCN+O2claxdLJmrR/rdwKnkrG/29v2wGVsesIiUbw=; b=a+KYLqhzn1/x8h
	naLAHYKgVtoFZ1e1ZEaPhfd6+huz9OxfmXhnd6nMwM6Kp3cexT66OY5WOMMhewQyEGHUWehM7gZ/N
	etn+18YKiVOtQj/1eAWELyUXiyl9zoF6f8mGtqaa+R7m19xXXAbMJlbsOpBUKVxxUe9FMyjv6caLM
	dGLoyUA2ko+T3nTu7cFQ8WqMb/k1tsWWzgy/m9TH/VZmNoB8iOcGAYsBjqXwO0vfMzocPRgLi/7tH
	udjidgQJ9F9dyaX180a7T20YXAiHiv+2M2pvgun9qMvb8Ow7TB8cYhpejxZYpajsZoafVHvhvYAjx
	6yZ0v0/rjUjzEGQSaOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXfM-0000000DJI0-0q7s;
	Sun, 07 Apr 2024 18:54:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXfJ-0000000DJH1-0rch
	for linux-mtd@lists.infradead.org;
	Sun, 07 Apr 2024 18:54:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-516d16db927so3679103e87.0
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712516090; x=1713120890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SRHNe6DXwYeiXKNaWOEzea5rcgNzeKm7MchGtxqe2UU=;
        b=SSFQJrwC+/N69sIO7eyznamQ/P9vfD4ty6h63/gCzoCyBtR4Wkdb9M5IEvPora5Znk
         snuI5L5vHo4stTo6NSii27ik/vXOseKIyR0kBXfDk2Nqv9xO3hIHGv8v1a0b3+XocvfG
         RVPPju7TtVT/4IpXk+pEAPROyjVlMup0LDk/WiWun7N84MrJt4fc24UbUTNnv5yLSaxW
         c70wmE/mnG7dIP4xjaaD0/yFuPx9N2liAyB4e+ucNO6nmZwLan5Bjq1AUHGlZgkYyJJq
         7Zw0CEuGYuoWJXGkcWPgloAt1EYSjxKhm9+DVylAyyD2SvR+K8VfQXA7mKFixxwMMy+U
         77qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712516090; x=1713120890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRHNe6DXwYeiXKNaWOEzea5rcgNzeKm7MchGtxqe2UU=;
        b=pPMu6CgdBn6qXL9FDUGNQmjkPAKWB/HMUMfGtQphebsp8q4C/LQCDepSNTXn+ChP4Y
         VSqa1LGsJ0ojaMkizwvVi054s2qj2Bi1F0JfNfLUf6rH/7c/SvbzDf03YBjStkY7tpKA
         V0k9wQYbsFu+vUUpUgvPG8mPLq7qyf50H1wdbVnTJws1TVWLj45cCcU/EXFAu9fb1HMq
         V6C9HJl+Q9UzxiRahTPhIXlACn7xWh6RWP592K9z5f5JJW2hv7CWDzBWrIuJhVlPEoW1
         v8iMbiriBq48K0KCVVUFMFdLxgw7yf5lnR9B1syxLp5yZRFWQordlFbfv89VAfGU6Zrs
         xwag==
X-Forwarded-Encrypted: i=1; AJvYcCUD7Kbo00UQBNrQaAYt10vhmXnGtGVE9g907U4X0A6U663wj/H8xdhZuQAcRjt/Rwkyuun3+4zjypwaTQivHRzO684orx0FJ6etKb98Ew==
X-Gm-Message-State: AOJu0YwvyKO+cQS2H54S5ytPcn5g1/47WIVSP7tU4ijAn/YRoIoGu4he
	p0D5+KrwgIDwkFzOHSldaw8ZuQ0Lp1O7y6sZN5jsutxXjmXYDK6vMIwWcYAnn9Q=
X-Google-Smtp-Source: AGHT+IEmKcP0onwipRC3csletl2FBdeGskT7hj2FjZDw8XOdg3PxvMTcQ4g0TuxnzJAZ39wimZLiyA==
X-Received: by 2002:ac2:5302:0:b0:516:7739:354c with SMTP id c2-20020ac25302000000b005167739354cmr4475280lfh.58.1712516090055;
        Sun, 07 Apr 2024 11:54:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id q23-20020a170906b29700b00a4a3807929esm3435350ejz.119.2024.04.07.11.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 11:54:49 -0700 (PDT)
Message-ID: <5fe5396e-c628-49e1-bec3-770847f061e5@linaro.org>
Date: Sun, 7 Apr 2024 20:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] spi: spi-qpic: Add qpic spi nand driver support
To: "Alex G." <mr.nuke.me@gmail.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, andersson@kernel.org, konrad.dybcio@linaro.org,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 neil.armstrong@linaro.org, daniel@makrotopia.org, arnd@arndb.de,
 chris.packham@alliedtelesis.co.nz, christophe.kerello@foss.st.com,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-4-quic_mdalam@quicinc.com>
 <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_115453_460927_30513C48 
X-CRM114-Status: GOOD (  11.75  )
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

On 07/04/2024 19:48, Alex G. wrote:
> On 3/8/24 03:17, Md Sadre Alam wrote:
>> Add qpic spi nand driver support. The spi nand
>> driver currently supported the below commands.
>>
>> -- RESET
>> -- READ ID
>> -- SET FEATURE
>> -- GET FEATURE
>> -- READ PAGE
>> -- WRITE PAGE
>> -- ERASE PAGE
>>
>> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
> 
> For the entire series:
> 
> Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index bc7021da2fe9..63764e943d82 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -882,6 +882,14 @@ config SPI_QCOM_QSPI
>>   	help
>>   	  QSPI(Quad SPI) driver for Qualcomm QSPI controller.
>>   
>> +config SPI_QPIC_SNAND
>> +	tristate "QPIC SNAND controller"
>> +	depends on ARCH_QCOM || COMPILE_TEST
> 
> Here, it needs to 'select QPIC_COMMON`. Otherwise it can run into 
> unresolved symbols:
> 
> : drivers/spi/spi-qpic-snand.o: in function `snandc_set_reg':
>   drivers/spi/spi-qpic-snand.c:56:(.text+0x484): undefined reference to 
> `qcom_offset_to_nandc_reg'

No, do not select user-visible symbols. If you observe such issues then
either stubs are missing or depends on.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
