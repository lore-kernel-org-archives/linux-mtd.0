Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF4CC4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 06:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24g6WF1Htpj0NGQFkmu8egvogmUd7r/qXJfiqKU/H98=; b=HY7HrGtlkJeUlR
	nBKibsqb+O4N3baR9c47D3TLzb6ACXAnvjHi/+sNfm59LkLWN321M3YfmGRA5zmPo9m8hrtQR6d7f
	oXQKsBImt4lrdQo5BjAO43LIm3WjMPWawaeZTLKnWyec0Ta2JLHIM7zlZp0UgNEu0cBPkpB/zdfoP
	FWZdey/gEYE0VzQ8asXrXmzCbMTPXMbNJ3ytiA+KdS6TqAcSAaitXyTtTXvzKZ1hZkwaUqyrgdUsK
	SinhVd3zG3XEvd8IxySYT62y7tRgOy9UjXXPmA/kLacNnU5HcOqJyV1tL3dGp2kSqOyOI8sxGkXyK
	E6X0refDjtdtTIJnxcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynOJ-0000000CHoP-35eg;
	Mon, 22 Apr 2024 06:43:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynOG-0000000CHnp-3uZC
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 06:43:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41a7820620dso1437045e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 21 Apr 2024 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713768178; x=1714372978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPvL4iKAh8EMRrWGhZ4Kx+fWBqS9MQHGS0oDFyItitE=;
        b=VVznh6PxLEVhF6XDuWtgnseLjm2mNb0SMlWzxif7bEXrFITWyawHLp7R8GocyPIvvh
         AZE491AihLhspAjphzoPtaDBIhwyDZHUDA8d8QU1oAsdUZPLx1xA3fYVqpudfPb/J7oe
         5/5CxJNzVS+FVLAsPM2QuttVQp3hJqItayiiIuhGaasINmkxzmwc7qpzrnf9uEW7N+3X
         cYK2/S1jOyxJQuLlwSHrPduLGO8RjD8aHC8AajW2o8gKlAUw+zHPH6nNWDTbL6wIXNN+
         mvSx1gJWmHzhkS9uAxwfTApFIcy6geHi4w/youNelHXCsfIMuJ6COYzMO9Iw0VETjpsi
         Ab8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768178; x=1714372978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPvL4iKAh8EMRrWGhZ4Kx+fWBqS9MQHGS0oDFyItitE=;
        b=vBsy0H3yBk8vqUgCxISZJ0vhYT08rhlUCt+tAMBXywKF3CSyHEooKZF/mIQMJ7oipu
         lUo6pjZqa2E3C/keXV7qCanCFCejAZFG8i0OcBQybTvzNJ3OLe//oKl/GfQ32db+HzOc
         C4N89pCk02D2+RNfHRDHz0/BVyIVNi0c5Kpg7jP5noSsPKAMBmvKLFdXx0A7XEwj6WrP
         pjg1NbSrLQU1f/FGszxr4LTvJr6veArZDCwlhRuIoO9fHG9SSjHdspOfxS/EzOmLOEIP
         gcV/yOdOZrrhYKPa+vYpghtHYh+O4SOQ6gjo2eAsv0vciQvNy6dZurjZVD/1jZkwrZW3
         AHRw==
X-Forwarded-Encrypted: i=1; AJvYcCUuyNRMc1x4YBWlsJkomX1g8vqU7Rm/faf64YZcx1ELmX4iAMKDeo3wbLJNtKP0ypqfCZIyLv7NlCD+umlrjfQeDDMaAr+vdz6v34KoJw==
X-Gm-Message-State: AOJu0YxQ36RFCckLUmOiGRZP2VWcUHF6Ew9PZbc0FDO1J14i1/iq1VwX
	sZiiH3VD96DGrhDXv+nTL1ctnBMy1sZDSz1FxddFqc652oQ64gxd/P9KQUTO0gHBn5Wr+Rb8VpK
	G
X-Google-Smtp-Source: AGHT+IGQHa0Bt9yZK33Ud0O7Ofrtd7OS2UlZDk4os8laOOr7Q7vEbiDq8lBjlyf3QFF1SDPR3MBzBw==
X-Received: by 2002:a05:600c:4f10:b0:41a:1b3f:b465 with SMTP id l16-20020a05600c4f1000b0041a1b3fb465mr3255435wmq.26.1713768177943;
        Sun, 21 Apr 2024 23:42:57 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b0041a5b68ea32sm2191668wmb.27.2024.04.21.23.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:42:57 -0700 (PDT)
Message-ID: <f1cc8da4-db4e-47b0-b1e9-d3b153fa655f@linaro.org>
Date: Mon, 22 Apr 2024 07:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: introduce support for displaying
 deprecation message
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-7-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240419141249.609534-7-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_234301_079306_577C1ED2 
X-CRM114-Status: UNSURE (   5.00  )
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



On 4/19/24 15:12, Michael Walle wrote:
> +	if (info && info->deprecation_version)

and here you won't need to check for info again

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
