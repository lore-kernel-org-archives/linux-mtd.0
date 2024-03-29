Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1DFC6FD1F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2024 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVVrY+Ljw+BQwOubkTvlU3fZ1oRMwPDb9nt4pYUYcF4=; b=XMXl6TDR+7Y+iv
	l9p5SirFQb9TFLM6HE+hvyHaMyhO2KZuySXr9XEUyB4xwdYOVYCbZOY3sGL51WBZd+w8+EOnDh3do
	S105YhSv8NXzNSGoZOaA7ljiksDd0uLAWyRiVHinJpidYzt3UHSihd0UupmOAcxnjWihPl6Nca92P
	oJ3SD98BVUZKca5X2+RVLuXrGVEGdJn31msWp/yco75khtM87tVlPUjuWFMI7LsrNkQ10AHCpLV7i
	IkQtu0gX2op0hPVpMrl3LDwfoPzIycedReAtWjQBLidcN+boOX0VonIoY9G05jG0KpudIg+deGWZP
	kU2ScYjWtJKNpG5fN/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBeY-00000000TBZ-0FQo;
	Fri, 29 Mar 2024 12:48:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBcw-00000000S9C-2HfJ
	for linux-mtd@lists.infradead.org;
	Fri, 29 Mar 2024 12:46:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-41549a9dcbaso8788425e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2024 05:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711716387; x=1712321187; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8YeHNiYgpqUA3csFyXBWArlvGAsCek/IygYY4/XO2cs=;
        b=Qo5TFQJQR1KevY4CJCEUqkXIfR2DQGaSOJrAERK0wM2vDE0EyQq2OKw1Gul5qpNJQU
         bPA+ATWD8b2meskpnxMms+IGTBlzSx3qu+ACWZPpBfx63+GZMV59K7lbazHKqWSpUaRr
         RhUS2oYriAbZGPj4KU2Q72F/POwVg77Y2zQKfqAuhfPUPl9dDSaRtj2wsWSZuZ69N2Bb
         elliZsVeoc8+mCf1Bwt0CIlmZFbBpJzmoCJOYG2p8rA01kq3skZxcanlbJJWAlEnHmBw
         Jcf5PWnHNCVZ0+Tw8UYMgSbdVVDhoLzDR6tFtrHdO80/z+zrENGurqOyCo0jI/cf11h/
         3RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711716387; x=1712321187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YeHNiYgpqUA3csFyXBWArlvGAsCek/IygYY4/XO2cs=;
        b=muHmL4kCfEq1GQLiprZPsh9Vvn7OB2UkDhijDdnHMmGdP83rTYhrKoodCnEWYn6hRu
         LLKQVUxAOfkk3bBrDkbaacAhRevnBLECQV70O7I5x2ZOMHW2Ybq8uruuTi6sAhA4/Ez+
         7hQeX0sZdGpcwfY9YS8PPhkwguM4hTtttsfZV9mB8J4skOi6+3OrGByWsJtsp1xk+X1p
         NDUwB+RL57HMjr7o3+2d65NakhnxVVQIWN1ISgWAIhc8cYFTxG9SNXlLeq21poBon+6X
         3/P5E93aMmd8VQ5BUoV37FDJyLb+HBqoqR2R+CsBeJmJRfCPWsaN4sH1O+jO1IS6Udf2
         en7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh7U9k37sAMoECihJyKkpFOvqcesL8g9vOn4WT67FTcHQAOzNBJTP6Sd+nv7mjPBkNnU+xYYORB6bxvvEyNQ9QwhfDggH/NmbuAQLr/w==
X-Gm-Message-State: AOJu0Yx1cDDEHzS1ADm2amHwvq3zmwraRf8Yy9w5qnBkZmYbwSleaOQN
	2YUle/tgk3bhDqmNBYLHXkkUKFAiTFSBu7LSsAYdF5noTh75vAROrBWgnI+dEdI=
X-Google-Smtp-Source: AGHT+IFtw5PuV4+gGgZdA7zkX5FtNKwKbv8VnKOgfpHlS3eKIL/8rN2QtfMdOJQ/0OoWPWz52UnDUw==
X-Received: by 2002:a05:600c:5114:b0:414:1eb:301a with SMTP id o20-20020a05600c511400b0041401eb301amr1355434wms.28.1711716387142;
        Fri, 29 Mar 2024 05:46:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id fs11-20020a05600c3f8b00b004146dd6bfe2sm5279154wmb.47.2024.03.29.05.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 05:46:26 -0700 (PDT)
Message-ID: <9b7a0699-936d-46b3-abf2-f11131b699d0@linaro.org>
Date: Fri, 29 Mar 2024 13:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/xe/spi: add on-die spi device
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
 <20240328122236.1718111-13-alexander.usyskin@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328122236.1718111-13-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_054636_122329_ECE91822 
X-CRM114-Status: GOOD (  11.93  )
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

On 28/03/2024 13:22, Alexander Usyskin wrote:
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  5 ++
>  drivers/gpu/drm/xe/xe_spi.c          | 78 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_spi.h          | 15 ++++++
>  5 files changed, 102 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_spi.c
>  create mode 100644 drivers/gpu/drm/xe/xe_spi.h


...

> +
> +void xe_spi_fini(struct xe_device *xe)
> +{
> +	struct intel_dg_spi_dev *spi = &xe->spi;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	/* Only the DGFX devices have internal SPI */
> +	if (!IS_DGFX(xe))
> +		return;
> +
> +	dev_dbg(&pdev->dev, "removing xe-spi cell\n");

No need for simple functions entry/exit messages. There is already
infrastructure for this. Drop.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
