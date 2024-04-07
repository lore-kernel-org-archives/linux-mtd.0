Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EE0CD128A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2024 18:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ojdnJChI1BUUyJFchYR8GmVM54b0OK6nqrMx/BsZzw=; b=O7AbkAHUjWOaFV
	9W/MtY/0WMzTs/a5yZ91u72MlOotzJlaSLjP1ZFuZU1C2El6lou5wrO6CxChP8HAykQ+C+q/Za2By
	jwrJlcsbuRhzyeyRkBDusknz0UC1ePuiHTk6T+vDWb1oX/zdZbuQpErSfFIVQTErk8XDZjMsQYm8E
	rG12t3vSfmaewya/uodTpWdzRGs9QzuM1BNh/BLUE02UINZF45OAu/CbpIaxUt2iX3r50DMxcJfnr
	+an088NchqTBK1LMaPv15KF/TRimgc4WaZfWtdd8u2l6tYoO3DWz5OBXZys3kYk1PIcGpRzA8yP6l
	ZcMvgR4HLCU+A2Ca9Kng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXj5-0000000DK35-0MxA;
	Sun, 07 Apr 2024 18:58:47 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXj1-0000000DK2Z-3cQ5
	for linux-mtd@lists.infradead.org;
	Sun, 07 Apr 2024 18:58:45 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6e68a30e6a1so1504471a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712516321; x=1713121121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scTTNj2woy/vxyldPj6pFMZnJWGeLMiGwUL3lFw6SWg=;
        b=WiBmEtJ1c1lD3+9k4GVW/ov7XKFCFycD5fhfy2O/0VOpFAHkDMdac1NFX+cVVpXd/8
         CUs3T7aWHkmc4BVoEOBdz27vrveP/2nDi6LiMRKIYmd5aYg+GqT/aUZDrjn1/FaIgToo
         79CBGn1nispR4vNQqqpWZeXpuyVj+YjJXEGwa03PExGt+nz5JwGdk8Vra75/sa3XIe20
         R6D04yPu9Y3lqlr/7BIhPEff3JJc2SahjLZvZLx6fAAUvtG/eYb9Vs9T4Z7iquGMucet
         osebzC9DDwwyctyZC6LtVR9xtZyrJBQQrTnk8pfLVzUUdrE5G+1whewWr1FfCly/IjlS
         Ruqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712516321; x=1713121121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scTTNj2woy/vxyldPj6pFMZnJWGeLMiGwUL3lFw6SWg=;
        b=scqUcEwOnL4Kd26sc0wIuUJis/kSmHLHMgCUZcc5Slk39FRKxV20zDsq3ZZyG9RUqC
         +Y8M4sc1fjKpfUv0BAtcGkQ9Kz1QqYkDCaJM7B7FqtPzEI3S0mkQdz+LEyFS5CLxLL00
         xYL8PByt7OFcTeOStC8blOCUxvpWkOrnG9vYgRd6r3UctSHVXegg8PmGB6G5mRVf1SHM
         QCmKSdVzVSI1TR8VkuKPf8rErZlmTSsXLWjNoxs28nF9Dtp7FigIgNY0S6yPzdhpyuhW
         OrQlAUwyf54t8P8scbaWxyMCfeOnb1hcHKv+sBgwKnmbGdmdNWdwvW0fTv2YjSgWU6qk
         YQHg==
X-Forwarded-Encrypted: i=1; AJvYcCU8hE9kkFO0zoqu3K6JCQhpKB3tJBST6kmW4jv18gQZ/xU6KbCR/NEg3rDLzgcnxu3at38mgbqYiez2JgMLbz23F4ri7OkwTLfOQY/EXA==
X-Gm-Message-State: AOJu0Yyfk/CT+q4jgmcuzfdpz/35pMVpKrDK3bcLJMQ2U/vDbhDI3ozO
	Kfk+Oo1gRaUOKeF2Iqd3oPk3TyG1duHtTSfIzJ8Zjxgwyf7yBv8k
X-Google-Smtp-Source: AGHT+IFG8tDCVi2Hal8zENXLD8XK/N4pT4qILbW/+jIbZ5ynGBiQjUlYTNwzup3agDIiljYWM/Wa6w==
X-Received: by 2002:a9d:6b19:0:b0:6e6:8d2f:4013 with SMTP id g25-20020a9d6b19000000b006e68d2f4013mr3146432otp.8.1712516321474;
        Sun, 07 Apr 2024 11:58:41 -0700 (PDT)
Received: from [192.168.7.110] (c-98-197-58-203.hsd1.tx.comcast.net. [98.197.58.203])
        by smtp.gmail.com with ESMTPSA id e3-20020a0568301e4300b006e66e9ac835sm1156906otj.2.2024.04.07.11.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 11:58:40 -0700 (PDT)
Message-ID: <a0c7ab26-4eb7-42e8-a151-671a9222660f@gmail.com>
Date: Sun, 7 Apr 2024 13:58:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] spi: spi-qpic: Add qpic spi nand driver support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, neil.armstrong@linaro.org,
 daniel@makrotopia.org, arnd@arndb.de, chris.packham@alliedtelesis.co.nz,
 christophe.kerello@foss.st.com, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-4-quic_mdalam@quicinc.com>
 <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
 <5fe5396e-c628-49e1-bec3-770847f061e5@linaro.org>
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <5fe5396e-c628-49e1-bec3-770847f061e5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_115843_944446_44DB61E8 
X-CRM114-Status: GOOD (  11.61  )
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



On 4/7/24 13:54, Krzysztof Kozlowski wrote:
> On 07/04/2024 19:48, Alex G. wrote:
>> On 3/8/24 03:17, Md Sadre Alam wrote:
>>> Add qpic spi nand driver support. The spi nand
>>> driver currently supported the below commands.
>>>
>>> -- RESET
>>> -- READ ID
>>> -- SET FEATURE
>>> -- GET FEATURE
>>> -- READ PAGE
>>> -- WRITE PAGE
>>> -- ERASE PAGE
>>>
>>> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>> ---
>>
>> For the entire series:
>>
>> Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>
>>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>>> index bc7021da2fe9..63764e943d82 100644
>>> --- a/drivers/spi/Kconfig
>>> +++ b/drivers/spi/Kconfig
>>> @@ -882,6 +882,14 @@ config SPI_QCOM_QSPI
>>>    	help
>>>    	  QSPI(Quad SPI) driver for Qualcomm QSPI controller.
>>>    
>>> +config SPI_QPIC_SNAND
>>> +	tristate "QPIC SNAND controller"
>>> +	depends on ARCH_QCOM || COMPILE_TEST
>>
>> Here, it needs to 'select QPIC_COMMON`. Otherwise it can run into
>> unresolved symbols:
>>
>> : drivers/spi/spi-qpic-snand.o: in function `snandc_set_reg':
>>    drivers/spi/spi-qpic-snand.c:56:(.text+0x484): undefined reference to
>> `qcom_offset_to_nandc_reg'
> 
> No, do not select user-visible symbols. If you observe such issues then
> either stubs are missing or depends on.

I apologize for making a bad suggestion. Thank you for pointing it out.

Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
