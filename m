Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DDDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00JupD4UWmXyguzADeU7F86+4PGvfxIpNCEcT+8PDXY=; b=Z+mBKvJbYKXRGD
	gaBhkr8hIc+d2IKJb5sHabgjB0zPTVXIaDBqJzsKuY5UL2cz+RYxpyjVXpkkn/DVn7UjPBiJYlQGy
	bjhHAlZFTgbUO2uxDwpcwO6+UJO4s1kxOfok+rIMNc9/jEPRUY4umBNKGq9Jq3fRuuqDm4CPkhwLA
	z3xE1Lc1iD4nfQl3Pcs0w6yD4ZDo+AiEPocp/8sjfadvqChRAKEavuO/WIvKupRWu/9CC087DNt5j
	leuG8NPFn14oaPB38AKcgkaLCgtXfEBjmuHzN/eljXcE+Rl5bPaz9DoQJxXLOIB6tpkjOgbxgzAlx
	ErWTDgtLL5j09/YWhfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqqi-005ch6-6q; Tue, 03 May 2022 11:37:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqqf-005cfy-Kb
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 11:37:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gh6so32957393ejb.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QVp3RkrsZjknN37lAxJZhaR2zOHWGKJGvjIrozmrcSE=;
 b=tLQIXAep+KkODb2kR+H3gzQ6jOvCX3R6P+mOUJCrE1CJ6CpXrCtUbTQ0KpW4ygvB20
 W9go6Cj1n8KEishC2RUv6sjlqCg6Orly2xx3FECOPACCBFqVdsNaud4d71tdKyw7J9B+
 EAa79rJ4Sntra6vgOkRMew7unZedgmc3lm18k871vDFf8Pl5T4pRmCwTfj/DuRBtPa5f
 AP9l4RG7FcTQ29MDY0mMFQlzlkCIOt3XG2avd10re0f5jn+jY0aDETvIM6hdYZhW9bUy
 iHg4ZntHsvderHpMV5R97DTwIj6wIVWwZd6vgelRAFH27QW+GW0pqgmdV036LoBDvA0r
 SYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QVp3RkrsZjknN37lAxJZhaR2zOHWGKJGvjIrozmrcSE=;
 b=ibyWyBynm2Y54a3qcqTc1dAL/KrYw13pvXcZY6avyE3NTdaQPkIIJ7z9FyP8+H6YUd
 DjQmY9wLNV4w6ZhDZ1YI157xYWne5goETwCJ9NnuNuqD9s7YTmH/3FkFCGPQXlbmD3qe
 2BA17xjl1HTy6DfCZHeZ6hvsFrrE+hufJWz7oaPu+K0aHG121OvjBlEcEt3Sg9OsX8rQ
 1egHecvTDYPSC1YfBaklP/ehlmqKLmQAdPAD2zYs9FB7+npsiM2n0lFfxJK2qJO2YAbe
 wr2rxHyMZl2vPN2C9yAHoaq/C+POCCmRHkqWc/BERtkWFQ7S3CusJINmUgv+JzSLJSwu
 o55g==
X-Gm-Message-State: AOAM533n2EbId8vVN9OYF43FaZijSry0hmiVDR9IsWgJJG9haD9INISJ
 zbWb6XgQKIJ5zqg1scMSA/mR/A==
X-Google-Smtp-Source: ABdhPJzxvzxgUY0kSWz6s201m+ymj+wkPW3O8HI9frx8YpxBCkivKl1bsuIkyh+cfHW9VMvSQH2zmw==
X-Received: by 2002:a17:906:c1d6:b0:6d6:e0a3:bbc7 with SMTP id
 bw22-20020a170906c1d600b006d6e0a3bbc7mr15490136ejb.484.1651577864342; 
 Tue, 03 May 2022 04:37:44 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 zd7-20020a17090698c700b006f3ef214dfesm4569152ejb.100.2022.05.03.04.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 04:37:43 -0700 (PDT)
Message-ID: <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
Date: Tue, 3 May 2022 13:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>, arnd@arndb.de,
 cai.huoqing@linux.dev, christian.koenig@amd.com, devicetree@vger.kernel.org,
 gengdongjiu@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
 mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net, p.yadav@ti.com,
 rdunlap@infradead.org, richard@nod.at, robh+dt@kernel.org, sboyd@kernel.org,
 soc@kernel.org, sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
 vigneshr@ti.com, xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501173423.2473093-2-hanetzer@startmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_043745_744343_87B02A38 
X-CRM114-Status: UNSURE (   9.50  )
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

On 01/05/2022 19:34, Marty E. Plummer wrote:
> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> generates clock and reset signals used by other module blocks on SoC.
> 
> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> ---
>  drivers/clk/hisilicon/Kconfig             |   8 ++
>  drivers/clk/hisilicon/Makefile            |   1 +
>  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
>  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++

Bindings go to separate patch. Your patchset is unmerge'able.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
