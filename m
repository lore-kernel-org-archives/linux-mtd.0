Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8955ACA1002
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAPrDvG84Z/VLig7FWsMW2TJRwgInCkF7a2qY3wC7D4=; b=fk+JtHihnyeTjX
	kHezI3MEcmlC7YwORGMwVGRWQzYF5xHcJm/Ah5UwV6cg9o7YAPwNhSp0mWrB6vTD4YJwvYoTyEwDQ
	PcbKL+zV4qY+/q5/UCHBrwILiNfkysfkW1KNhgK8JbwfihsDRDgOR3XsftirDJbn2mNMXnHaqSX3u
	lr3Y3b+v9sE8KOIh0bbIHsBlbvcrXW9/4dnJ0MtGczGLKeSlq5qNT3ngG2j6Z8WFCGuFjaJess+ZL
	Hdbs8b0QjySEqDf5n1UV0WWo16SjPB30EMz6PXGhZ7tGeGCNvNlMfvYtInIAj5OiCRuZPKD/1zzp/
	bOisH0hHEuVm7DPi8AGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCoz-0000000CwCu-3Qxc;
	Thu, 04 Sep 2025 16:28:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA7p-0000000Bvi6-42DZ
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 13:35:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so5077805e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2025 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992940; x=1757597740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts7F9KH5ZUtAV3eFTPnD4ApkUPnB+DSSD84QPmcRSHo=;
        b=CWTsWaSita6cT89WfRcaLtt/R6hgecnbIjYgkSY6jIORA7nczU2E6zL7jn6srRRp59
         gVxzLRNcoNWTM/VV3yiRGtdGbGfdVYIIGNG/mOiPSMUw4749+36LZTUrDJmiagU3pfgd
         yctY5wT74ckl/ENZW+9LVy5/Na8gAK+7Ok73dUgNHRZEmj61nAnn621odyENV9EcARBk
         /uZkmOHyvcNu6+2VWMDqYz/7JDW1zOjirVsr8rkoZaoZW3bluQGZqWNZABbJToXQw38G
         Fy9TJFqseB0sHd02KHToTGhz/1Iz390yRnA2bXNADAbkI2ew0mxyRamIqnkbPZuhdt5e
         Jm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992940; x=1757597740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts7F9KH5ZUtAV3eFTPnD4ApkUPnB+DSSD84QPmcRSHo=;
        b=OBcKRKaajcNHZ8+9yD1UmJjkSprVL8ZIEIaV8luik90jNhjwJI/YfrFzqOLiS+i+MB
         fPfY65JVnXx38f1J9a2Y/rez+6tKZXBEkpdKM3bjRCmoG8crcVFIOQP++iey8c/k/5LO
         oBepOPWEahKN4CAVJxhkJ4FbpZisFAjI/S8mu1BKiIgbGtxU1gUY5+ITcFvA3iGVmb97
         aGIHuf3E9th74+YgnbdpLC0ZyaO2DUzq5ARiR11N3P8h8mVt3jymoPWwh/D59EEEw1Ml
         rmzLon8sFfAzFXouHigixgDghFeOT1wzSV7MS0DrmQHjbtzMSxsN9+yVaIVbh3oo2CH9
         6nMw==
X-Gm-Message-State: AOJu0YyE20gdrWh0MmYFONf3En2diEGY+S4K8D+23vqw+tw/PoL+08vm
	Kb7AlINov7KQuXIwOsXZ2MCoz5S/2EZIYFx5VUug4f0s590p9UbQdh0syA3tBfU2zOk=
X-Gm-Gg: ASbGncv5FJzT4ni3t+KfSU9OuV3kBscCzynyzU0+SZ9x29lCIj925DzuXDqPT4atPuW
	PhMq/fNNTMJ0NwUYzieBz14GLjYzhN+6qUvKFzQhQ4gr1gPk7raLsLlA2Wg5nEHhz2+80rJNVQK
	LjVsqjwf2VYiuSb6OkcH9cJ6FGOZSB8nj54cZuRLh+kiKPZgcY377UdrEUUGOQcNj7fIcxeq/hx
	jnLCuukzWpERXKTNBg9gyBZM1js70yUtbv+p8M+vELpqPAyE4bPYwiuUqAXCOZuQRQEX9Y5bow1
	iTff+BfTuJt7SNlzdU6mkVc/oViLQMA3CjEi3+Z3AQILfokNNN2UMLhP2zE1yeCNK7EFHhaXLZH
	s+laRtqxk0G+mlHmjING7zXalaS6LmJk3
X-Google-Smtp-Source: AGHT+IE1nUiihSeVtcjexfaVaspPPiD19Kl/JDFihVARfiPUJVO2IQmMgm5+rACynonb45+j6ZD7CQ==
X-Received: by 2002:a05:600c:1e8f:b0:45b:8067:d8ac with SMTP id 5b1f17b1804b1-45b8553362bmr139743805e9.13.1756992940021;
        Thu, 04 Sep 2025 06:35:40 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c5c89f2sm100601555e9.14.2025.09.04.06.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 06:35:39 -0700 (PDT)
Message-ID: <ec2b808f-4303-4a32-9a53-f5b9dfb57520@linaro.org>
Date: Thu, 4 Sep 2025 14:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Modify addr_mode_nbytes for DTR
 mode
To: Santhosh Kumar K <s-k6@ti.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 praneeth@ti.com, p-mantena@ti.com, a-dutta@ti.com, u-kumar1@ti.com
References: <20250904131309.3095165-1-s-k6@ti.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250904131309.3095165-1-s-k6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_063542_040219_A447B018 
X-CRM114-Status: UNSURE (   8.79  )
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

Hi, Takahiro,

Would you please review this patch?

Thanks!
ta


On 9/4/25 2:13 PM, Santhosh Kumar K wrote:
> The nor->params->addr_mode_nbytes parameter defines the address byte
> count for the current addressing mode. When transitioning between SDR
> and DDR modes, this parameter must be properly updated to maintain the
> correct addressing behavior. So, implement the necessary updates to
> nor->params->addr_mode_nbytes during both DDR mode enablement and
> disablement operations to ensure address byte counts remain consistent
> with the active transfer mode.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
