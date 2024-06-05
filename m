Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC9C27C52
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rR5LGhuu0qRCUGwFxaI3nCTBSK4SSNYBEWOUH1kL1mU=; b=PH6qLuuFfi5dCa
	sLMmn6sH42LqEoYPH18GV9Os2BVNDsPrOqc3IbNIwBhMBX17NQPLKYTyGA+VT01WsFmTYYEei7n0M
	+KMz+5zTCY8tiQ9X1u4UEQoGEloz1FQBXX2WTCq0FQYKFBHXPXMgxun+PehCsn8yFR6S+QUk/JpgI
	9Wu0Oko+FHIAIRE1HXG29TQMqdo4EVbwEzpYkLWnQ6rUimFCB31VF5zAGGX5ZMIuCILUEjmti6rCx
	JqKQe9jFRo68nBOPZG+377gEpKvD/FkVJVZ1F3wE93O4wTpSsohhxzqmIC+sb2jaB2If9BI0yjcar
	Uc6YhBwJ6wLrBjNsRMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv7S-000000077ZG-2qdh;
	Wed, 05 Jun 2024 18:12:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv7O-000000077VG-0Ub1
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:12:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-421396e3918so2076075e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717611128; x=1718215928; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=VgM3J3q2yThUY27nsWhcY5Ya6Lenmu20kJ+hUIFdFC+7cLAKZhNHspnbbS8/JEhT9k
         ieMGOXhsZfmoRyLaKbG0E2dqtzQBxxwx04dMok4ca4SNgtGJ5u1iuIcnAvplDSAF5EVS
         yrj7j6sXGLHaAjWVKtm1u24bly60NCrLhsFrablzaWR2YuchX8YmBbZEPBqFEm4TpfK7
         9Guj9T+CX7dozhFU6qiZZPMdzD54QLjtZ4ils3ABfQEqNGwMe6M0w0E3RpyRQrKlcZ5Z
         7aTqdfO8urgcGRAVIZitmuDMX/qNqD6NPOA5cmAPd6rijD1ksf/+aGIkd1o3D/DQUy8e
         HzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717611128; x=1718215928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=IQBhTRkkn9cs9b/OGz7Y6+MOcjHWzArBQTilXCjlj63nXfcBuTgnqoDSbmn0Juzx5Q
         FdAjffakPovDnZ22WIvATnh+q0GE4BhBPzXsLP7UcG+3v00UbAkplnyzlx7QqpMZ2ZI/
         tWGTXLiIBjoCYoNKeGukMtS3f1CC7jMxXW1qPeBAtOVBDKhwU9eI8X2PGV5QShV65Ock
         68Tr6h+PmgJcdwidMFG7BQVE9YbMAO+axt8mPdkqYupZFzWM2uUDfryoFrRFkPzKFV/e
         MPTc/Wp7fd7znHvfTZvaWuOXIA3dfQKljaGiGsAs1ourOgHGJuVsP2JFH7fdxRajl+xv
         WWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmJLmLP/K+l5reaUxd6R2ahpO6kWs6jfAwSJ2SoIMGlCsRg+cDwPxA1w+2f80/eojwnk8v03tc2ZNlMT4Ug9NEi70p3N+r9yQ5/2A30Q==
X-Gm-Message-State: AOJu0Yyo06gsGg4Uncyks2YEuH3fPAV8miyE5mMpLjUkTMSBTy4YjQOf
	CiwQQjCXZefHpmGTf5ovxbrXYadA2SK64H0YfZ/aZuWBD33ErS8KZCWUeOcD1CY=
X-Google-Smtp-Source: AGHT+IEvaA8Q5QYjqCVUDlFHwF6aq9tSqiBZFVHoOS8pIX0aZ0OJo7FFt2ruymdqoNfkRUE1c/CDUw==
X-Received: by 2002:a05:600c:4e92:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-421562ccd31mr34249765e9.10.1717611128459;
        Wed, 05 Jun 2024 11:12:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c68sm15224191f8f.56.2024.06.05.11.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 11:12:07 -0700 (PDT)
Message-ID: <d7cfe53e-533a-4c39-b4d8-cdbee3617294@linaro.org>
Date: Wed, 5 Jun 2024 19:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
To: Joy Chakraborty <joychakr@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_111214_180104_B1388EAF 
X-CRM114-Status: UNSURE (   7.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/06/2024 18:59, Joy Chakraborty wrote:
> Currently the nvmem core change is picked on
> https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next
This patch is reverted due to next build failures.

Please resend the series with this included.


--srini

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
