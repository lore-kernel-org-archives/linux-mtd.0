Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30959C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCrAiLIu4FWuWN5ZDab6c6QvbCLxyLHg0ZKIEkRTqlU=; b=skjLAmd4CPmABl
	qwKq34njhXUipBrdsVMQ/j/YIdmwZQQFPfL/3FjPpz6kkWHNCVdXWOlFLZbl4b/puYo2wUsevE28n
	u2iCefuUbrB5KBj2ZW5GWDT0tMu0HuSjV5kqOt/9oyliJz5sdd+3DHsRoRGJL2VIGMYDvnAYpz3Bg
	nFIqfPIYis/yikSleb2jWJkUw0a9QGQLUhY7ZGfmhYU1q8yG6rRal3cf2YpKB/yzt0puCIHungRrb
	tpEIXRgL1v7S+aB6NWNkM0he9yG+NP8Hn+4J4pOoicQ+9Zc2qVCP7qk4w+AljFRT8ATxfwJBRY0EY
	UDKZTj+k+dBAzfEKjrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jIM-000jvn-B0; Tue, 05 Jul 2022 14:12:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jIB-000js7-G7
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 14:12:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id e12so20769518lfr.6
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=96uT2/xHI+gJvTeOzSVEvKEVuYL1WzZK+F5WRMOqgPU=;
        b=EgHA5JrPLft/X3CFmcSgTwtTvECDveakN/2eQwLizukZ1zwsResj9IHMN3FSmmNZqH
         5esk68KrdSVQGMTMFYDbvKW8hYaxKcvG0DBhIN+03JfXtTRd4Xb/Eg5EWC6cuHTq73rL
         jjTDdg0IDX4s+Y2Cr8LRrseVutTmDARy/lobgDKmKk9vQanpAxXEuEzAQU/HEG/tw+J5
         /6h5DDeXqawo434PwFTi9OcOBTEVHxswPjQEzOwB8CuCRE7eLhx9/NsJJ7d2maK9ekQ6
         CjVey19X3C1BavDYQ8HPLTDw2tVIOKNNklPMaqfkKplUCccgSYePn/a0/JFdi5eQJjsr
         Rjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=96uT2/xHI+gJvTeOzSVEvKEVuYL1WzZK+F5WRMOqgPU=;
        b=JIGvMcmCcB++aH53d38rNtC/MPLZ0SHrecr/oWxlKR/M9xMxe7j+cWSxnA5ZwPMwsK
         D9T7teXDlnali5QW8de4RmWnsVGobJPL05XE/QoiT//52XbZbd2yKy23H9y0L8HLUABq
         i49dxHvHA0LEZ8NsIUwg9nDvB16z9ivcGisvgGFTxkwZyNJyTZMgvO2ZhrsR2Ov3W5dU
         23UPknSM25DrD/JkN93ml/XbetSVgYCX9IjNeN3imq4VowyiSube0x7X+fOUvZKQBz75
         FQIpUrbF9cVfuNJg9gRLoaHqBRlqZaqmzccUTWpVvhvBp27FEcmHwbgvAOVvhg2Kt683
         iPDg==
X-Gm-Message-State: AJIora+I9f6GYpSJKMBpQcybK7ntloPavfOyaSvABX2oVUdQEPj0d8+A
	rdbYpxHzNR7CPBm3+81/eVP4dg==
X-Google-Smtp-Source: AGRyM1ucI0R96J38sx4KrEcjCZdRo4b5u4rRdvgJC2EhgCpkX68hj/jPkm7aCy/l7c0q04uk3jbg7g==
X-Received: by 2002:a05:6512:224d:b0:47f:7812:d135 with SMTP id i13-20020a056512224d00b0047f7812d135mr21506046lfu.29.1657030360658;
        Tue, 05 Jul 2022 07:12:40 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id v6-20020a056512348600b00478f2f2f043sm5719610lfr.147.2022.07.05.07.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 07:12:39 -0700 (PDT)
Message-ID: <be521f90-97ce-c61d-d7d6-8f2bde24d824@linaro.org>
Date: Tue, 5 Jul 2022 16:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Han Xu <han.xu@nxp.com>
Cc: Bough Chen <haibo.chen@nxp.com>, ashish.kumar@nxp.com,
 yogeshgaur.83@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, singh.kuldeep87k@gmail.com,
 tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, festevam@gmail.com,
 dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 zhengxunli@mxic.com.tw
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_071243_588985_919C898D 
X-CRM114-Status: UNSURE (   9.99  )
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

On 05/07/2022 16:06, Michael Walle wrote:
> 
>>>
>>> I think you could use here clock cycles or clock phase, but then it 
>>> has to be obvious
>>> it is that unit.
>>
>> Hi Krzysztof,
>>
>> Let me clarify it, in the document a term "delay cell" was used to
>> descript this register bit. Each delay cell equals "1/32 clock phase",
>> so the unit of delay cell is clock phase. The value user need set in
>> DT just number to define how many delay cells needed.
> 
> Then should the unit be "-degrees" and the possible range 0-180?

Thanks. We don't have it documented currently, but the unit seems
reasonable.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
