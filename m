Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9AFC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/dPCF8NvzG3LzOAEPJh5BBixT0VA5kMNYTnStfamtc=; b=J0IEQFB8Yw8Kzv
	QKgycQp7H92QUT/mKhEld1NryUUP3gtWzNgeeaEVQKJVz4HEB9+q8Sun1g6YSONG88eAaz5ZHX94E
	HrLD3mgi0UYSHAubig0PyHYqApcINkex1kd2hEpVe0ehyKwAZinqX0gk/gngjH7RvvWPHNfAa7bMs
	yqB9TZm74Zb7ppkxkddKwWPn3YXdAxNG0yDyS00WXO7NtcTjcRSog1Yn+J1k3qYhkK8sTLGj9ye7R
	C0gT3t2cCrr8yy90qXIPwtigcxS8OlxpksrOjropmIgNSD3RX3quzvsAL1RUbkvQYvfyO83N2QRMa
	BfK28luqla5+6c/SsI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7svd-00AxAQ-0d; Wed, 21 Dec 2022 06:50:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7svX-00Ax2Z-VD
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 06:50:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id y16so13988136wrm.2
        for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2022 22:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3DtQUdn5yG8C3edbDeOK2NMVM1cqCLWe0A5+U54eM4=;
        b=pgqp3sYgI0M2y0TLRjzoFFM/5rxF4gkCBlezPnjShaxGBb39t7uWWapYEzhh3ZuOdB
         DqlaarruN8SdkiwbO3z9OmoCsj07wvdHXWjH9OZmIvUu2VgeZbTw2BZYhgKT1t/T6147
         cjzOjcdrBNMo1G2UIqkGp3o/l92YwMMX+GBT42W07QEn25bV9MNZun2QsSQlObsFYTSc
         kCFKO80yY+LhokCaqch1jmWEP+Ff4PJCThkr0cuvMd5NmdOdlfjOTnXvw/1DPcsBTWJJ
         A7IwVaAnT6RDRfUY1ntnMBplgoIF5Klb6KUCVImaffNSNB2ViJyqVCYJlgshKwtr0QYI
         x1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3DtQUdn5yG8C3edbDeOK2NMVM1cqCLWe0A5+U54eM4=;
        b=kPAjm20wqztcUZQ2axJKCGJ1cXqmxlK9H4u3aOUU7ZEi4AX5yXSN2tHVp+JwDrxgQk
         QBOHcVvYoJL9almSHOdyVfhDEL2RWigWd6ebY4Uca89hsCMbOopg8RWHABZaFqluldB/
         cMG7g6XucF2szBA1WkIlZP1asR1IyNdCrlxZMRpLM+byhM9DLC+SppiVQfakxo5IYGTY
         eYVSRnjiqe7MTTxT16BLdtjr+u6l1InVKhlk/+A+BNG5MsghQLeX/eAl8vCslaCRJzbo
         7e1tW1SCpa0XGyF7DyVnLbg772whGMsGh5bKg2eBonXy/54L9vuM9nONC6lSp2Kn6p/B
         up3A==
X-Gm-Message-State: AFqh2krs9m3jSQSOZrP478WGHg4yL1TJM7m3PjER3FzMZ8diInoBFqyQ
	UlmdkCgUgkug0pd/MFSg2WlRnw==
X-Google-Smtp-Source: AMrXdXth8YVxu/eVaNR55QfF/dyr7TzuzV6+kGR9hoc4Qpo+Qp8xSopCCpRvF2Wi2pqThcWKuwXA4w==
X-Received: by 2002:adf:e54f:0:b0:242:7fd6:1c82 with SMTP id z15-20020adfe54f000000b002427fd61c82mr278418wrm.16.1671605402105;
        Tue, 20 Dec 2022 22:50:02 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id d11-20020adff84b000000b002425787c5easm14324294wrq.96.2022.12.20.22.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 22:50:01 -0800 (PST)
Message-ID: <026225c6-f17f-e9da-b7c0-5d3473a97e89@linaro.org>
Date: Wed, 21 Dec 2022 08:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221220141352.1486360-1-arnd@kernel.org>
 <cae6328b-5204-a1ab-810d-8fb64e466453@linaro.org>
 <20221220165701.5696df1a@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221220165701.5696df1a@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_225008_108224_D4D41805 
X-CRM114-Status: GOOD (  13.20  )
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



On 20.12.2022 17:57, Miquel Raynal wrote:
> Hi Tudor,
> 

Hi,

> tudor.ambarus@linaro.org wrote on Tue, 20 Dec 2022 17:44:49 +0200:
> 
>> Hi, Arnd,
>>
>> On 20.12.2022 16:13, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
>>> fails to build, as it includes the shared CFI header:
>>>
>>> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>>>      62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
>>>
>>> linux/mtd/spi-nor.h does not actually need to include cfi.h, so
>>> remove the inclusion here to fix the warning. This uncovers a
>>> missing #include in spi-nor/core.c so add that there to
>>> prevent a different build issue.
>>>
>>> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> Looks good to me. I'll let the linux-0day bot run over it and apply it
>> once -rc1 is out.
> 
> The issue sometimes produces build errors, shall I send it through a
> fixes PR instead?
> 

Yes, that I was thinking about.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
