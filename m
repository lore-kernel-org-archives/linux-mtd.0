Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED2CD11DD
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2024 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Il9UDVU8cyUw7q/iQFvc49lE+SMLPyl3QHJBdwm9lzA=; b=CHGkhk8ZUh99bM
	u9uTbnc3PicyCewl6anRmtz7YJQh34omhPja9kF6Rqq5t4alIkdcG7R3+i6sb0dolJXNy835dmtc9
	/eeks39cVMQOctDA+jr1RksDGWl2cc240zZH0lafsdR3ASLuMH7zKMkD8OkxNbAFulmKhYYHcfSYr
	hruYc7BuXUKmkPEd7EhJQsBLF4F3VJdTdZnTGhcJmOWk7Z6wZH4Asd2twcB5EBj+UB5PS1CbBF+i7
	0G0OLqHuo9A+O6JnDB+K5SwU7vEWOVgyh9MWSQcZBZyV4RDTRe0Qhz3ORcHarRDaQgBRjaThP5M3X
	zEm8NecgQzFWlbMTzusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBfT-00000000TZv-1R0n;
	Fri, 29 Mar 2024 12:49:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBdP-00000000STQ-1YEP
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 Mar 2024 12:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GpEMLYAFIcPLXy8ORDoBI86Ex7kDadKVjlkWpRyMmO0=; b=VgMxNQlYYAhsGq5vFonRozz6vm
	F/RRGhxlSDag/F207EM0+k3HvPZkluL5xHupfdgd4pQw6Hf3xYXbqsiy1hu3FZ0+68QmKGhNqJ8rC
	bSgc7p9SVfQut+TkBYLCA0GVRj/MAonP3/OJuT7NoBDfZtwwCbbhW6MZ8suq4RkK2ELd+zxRbrMTQ
	h1OQa0dfw9DckAzhUaN+3tKqSPLJBmvq1wLL/DJCSu2gc84+5WcixwvEpHdvR+qBqAn5fp3Fy8wfb
	Bcyx7K1hgE7xw2G8eUI8uGy5WKzIz/8PZhW8V1mvjQotvyIeJST2vpfE2QLw8chJUII1BBP7Y/ygK
	oSdZD5Aw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBdM-00000001Zby-1JVP
	for linux-mtd@lists.infradead.org;
	Fri, 29 Mar 2024 12:47:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-415523d9824so2521675e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2024 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711716418; x=1712321218; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GpEMLYAFIcPLXy8ORDoBI86Ex7kDadKVjlkWpRyMmO0=;
        b=J4vaiBWlfOZGzp4isprX0G4OzrLY1hiwdMzu+cLXOmR8mHnlirI9zWMHSw/rn5SdRq
         9X32IV7727yUCXqI9nvK3tIwpuUwD2R4+tSf0+IEjS1Qu2PWCqWXS1wXWTtar45RzhFZ
         O1MXFhIOJ0NAheuL6vtCR3H+5LELgO/DiCsQwc0BZVMIupIgMfcyeC7RXB+PvpgursT4
         MBKzt27hFp9qo2bXsENP0KTR0CXDeIua+E7zZ9brUaQ2xNnhvYl+C1WHcTNw8qlG4ddA
         cGXI+k/n6B50yWuQpON09QqulHSJ2ulAOvxLjBUwEclCiaAXd6YZVgKtNUutHHNHWlkK
         6/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711716418; x=1712321218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpEMLYAFIcPLXy8ORDoBI86Ex7kDadKVjlkWpRyMmO0=;
        b=usy+Y54nyDZCVSlb6cj+qbKtm4dp9H4cDVzzbbXsTnXPK2l45lI43P8TgYPNxAYuEY
         j2TiLXjrmXTDX6pVr4Z5MM6SXCyWxjsVRZUsmr0hDQ3kyviPJjCSLhhN9dEYKxYdv5kL
         GOParyHEluzSgGPTiPaK7B+CO9yNJLHNCEV3FT66eea9zp5ElJBuN9vMd+Npse1dDR6p
         oxHLcsmZqcRNsAjTlnRAuTD38B9Mkyqgjy4MeQquSwSY4c9I1cHk+95xeN6gBQp1yAT7
         XAEZxILmwgzLG5akr3vsAO2hb1QNUdbqyQooIMqaiLjBVsjrhFpbVxFnLLW4t7WUnXVb
         VJIA==
X-Forwarded-Encrypted: i=1; AJvYcCUFJWZhahiEvsEU2dMWa5yU92QXJpa0RnxCWI3AiWlFj63UA0oRuZLY9xrWGvM+8hRMuvqUo/YQRMi7pZ3kj7H4hWa8NdS52lrg5PGf7Q==
X-Gm-Message-State: AOJu0Yyv8IIScJ7r1sk37Ur3Pu5CoS01JEE9D1+4lJy33EwXaZWSCtgn
	aUvtWk3kV6R6YrsiuOH9PpGSEeJXl7LXSRKN5ixLrnDqbs9LFFUCFTUiPwWnUdk=
X-Google-Smtp-Source: AGHT+IGaLfRLZOjQlzfHPXGvqq0b0oycpx9hVo3wIKjyPtH/FXBwjXElidFR6x69Jr6aVZQTPWY3eQ==
X-Received: by 2002:a05:6000:1964:b0:33d:5a6f:a856 with SMTP id da4-20020a056000196400b0033d5a6fa856mr1745147wrb.30.1711716418583;
        Fri, 29 Mar 2024 05:46:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id r7-20020adfab47000000b0033e43756d11sm4142761wrc.85.2024.03.29.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 05:46:58 -0700 (PDT)
Message-ID: <3f26157d-d79e-43a4-b61c-5da5aed9adcf@linaro.org>
Date: Fri, 29 Mar 2024 13:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] spi: add auxiliary device for intel dg spi
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
 <20240328122236.1718111-2-alexander.usyskin@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328122236.1718111-2-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_124700_504768_B003F79A 
X-CRM114-Status: GOOD (  10.67  )
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
> Add auxilary bus device structure for
> Intel Discrete Graphics SPI device.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  include/linux/intel_dg_spi_aux.h | 27 +++++++++++++++++++++++++++

There is no user of this header. Please add it in the patch which uses it.

It will also justify why you use this or other subject prefix. Now, it
looks just wrong: it's not a patch for spi.

If it was a patch for spi, then:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
