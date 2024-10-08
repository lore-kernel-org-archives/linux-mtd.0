Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B36CED274
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=eVKOlqwSwcuo8E
	O9JhTyCUUJiIBFLzZnsZDdDjHp9cZUPLZEWScwozT/dH9CMqxM+Y78NYNawUBNYIv6ZxNgBF5skj9
	pREBkcxXmdVA6grTqByQxV1XamoS7FHDYrdw+SQolqunR9GCVlY/XHuRK0SOxuBRHvmnfJL1Ndziq
	IPV3hZT180B1W71Wt/k8Js/CGUCyMAYbWGW5fmnZi+5eFbrA7a2xztqyHxn5CHXL6lNGdGO4GtdyD
	0Hey+XW8weO4/auyzO89x+iOgx6tfEnrNvRHuxzSA9oYstJGLZ20caXtbXR68OLdrXkiXrMnlwtk9
	OZl7QvKjn1mXdZWKDFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4H5-00000004k3F-3kXL;
	Tue, 08 Oct 2024 07:04:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4D2-00000004jSs-3boW
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 07:00:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so45913715e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1728370838; x=1728975638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=Xm1esq7xpXlBfdVI5ygSL4jJRaNKCGnFNi2Gs7YaGZpS51XVV+Mlz4UdMtL1fEVlYP
         zhrm5R2LyhwJKlUmk/71lhkncLnbB8QAlQO/9fDCH4sax7vP74lfAHBC858ATWTOtI8D
         051/i/99o3ThSx37wgy7FPXB5YpHPoL/5nI957tRCfJFr2WNiT9CbNDOMJ/pyF7KpR3s
         jvWkJVhFs7WibnsMApvPDcBm/f48BjffbcJv4vttLfi9s6d0GNE5I4C+jZaqpqVB6s7s
         OD5/QqE0YIh0d262U3bCVWYKyw+rRsfB+i9pygb0TjO5BwM5m7mBhElW9TkzCxypGw6d
         zTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370838; x=1728975638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=gTKsK+TDNCgxKsgQBeD+OIico4ccnHkuUekPyzp9ZmEjSLDHAR5BhEyFrXiIFbPkAc
         sNNiKpabcKD+b4eIgvBZYFJUmDieh2al/g99bZeXVT9C85I5u8FJhHY9jqDrkfQ6X+0L
         447xJSeIEz1YQ1iO+wpTnRA6KvCa5vAF8ErUEkJf0BtfyUO8GU4MsrEq4GLBzUwr0PE9
         9rV2A9u3e14rcFeGCAbyLiOdZ/jeV/il4x/H9njQEne8lW9pD0MfwOgtToytkk/LjLF8
         0TzIBmoWsZVGHanXhTEPGaiiqJYwxvDMwUADHjj4567EF/Y/BdNumEga7jWu0lphfft2
         L0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUQLoBWit/P5JTkp5nwPXTQJ57jH8NJdm4aXktnpfV15aHlzvLPQr/aKNAqtwxrlvvUbGoeTW646C8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcMcsBkgsrovMqNi2NMzPlGGkEltASAiwrUhIbo6W1YPoGRVzz
	pAj5zB5MSBLHZfE1+MfjhyY42UMdTGEnK4WkdHQ1HZrbzg7pUmOuo4nhghxKtdo=
X-Google-Smtp-Source: AGHT+IHPLH2PiitS4jaxj7eOUfbF+Bam/6JA9XokexYx2XjzO86WdRP0Zv8LIqeAotq8EK/ZaoZ/rQ==
X-Received: by 2002:a05:600c:4684:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-42f85aef159mr89588385e9.27.1728370837941;
        Tue, 08 Oct 2024 00:00:37 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a205absm115274535e9.19.2024.10.08.00.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:00:37 -0700 (PDT)
Message-ID: <c4f2b009-aa89-4ce9-a0dd-188528e280bb@sigma-star.at>
Date: Tue, 8 Oct 2024 09:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils 00/10] New options for hardening continuous read
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
 Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_000041_225585_10888169 
X-CRM114-Status: UNSURE (   5.17  )
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

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
