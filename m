Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F8C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7LPa7bIO1hdOEUWudOyj1K6MK4ShrIS6+gIrPwIsxA=; b=wSCYQjE4w+Rggv
	ZDuf9nJC5xQu60lPpHN9YJG//zEuuU3sf8EB0h3ted06GrNjqaKW5BZiKycBO3Cb02c1kdwMYEOEh
	MEa0X7qHFAKLZJRytjCiWgEO28qBQ8JJqB39sLuM2erXtBXDKVmmle6U3E9f+YoJ6voISh1deNyBA
	ULc951+uHY20Iv8dFRiT39M5kGbixujIme0GIT/F737RsIAZTYa0RmCA+SRcApjaw0dz3IpntP1vF
	gg+mSA2y+6Tp09Su3JxFX3EeHeihH59yBwrkwB3xopaxPhB9cPu3hp0PqsKJUxTugNBv6xnr4yipi
	yv1u97ZtG05qgXa90phA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdcV-00000009CKy-1KAQ;
	Fri, 21 Jun 2024 12:43:59 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdcT-00000009CKG-1SCM
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 12:43:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a6f177b78dcso210295466b.1
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2024 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718973835; x=1719578635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58qxmm/t3zau3gvpFhApfDkOSkGoEMC5DQ3Arc2tulg=;
        b=ByFUniZYUK0BiqkP8QSzhXHrHdfSewa7aeyZA2dBm6FCmmzHX3MkBXs85BZqlpIjVQ
         /UeDClxlcW16f5IVo8ouz6s8jjurW9xmErvJWR09gauD1ABnJ2xGW1Yl3wGC810uCLqU
         u0jFs5PVPsoIefFFEys9Qz+sGFYmvIntSAx5tE7sJ9AzBS81cDtANuwWbrwifI+SzkNx
         /QcxHYXj7kVmpoyUdpB528dR2AlmOxxUifzapfMmNowMC2NNqzHRB8Y3CsG39get4j8k
         084xre+RWJ4ypfh+xQyhPNb0C/2rNGZWKy+bTi94xAAwvAyMGqLgEioHel3evmWMMeS6
         4IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973835; x=1719578635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58qxmm/t3zau3gvpFhApfDkOSkGoEMC5DQ3Arc2tulg=;
        b=cXXCqkBAnNKnTDSaBsLhUXslED4quCnBLLINlUxjEyuNyImUzIE3osA6p/pevegaIn
         yWAsM6qxCH/eeOcqk+ZRXUdfctN39DNgw3kpp4lVIEVPzHkwuOjFQ4bbwT8N2CxgxODa
         LebE1jFq0/WTudRo2yEib/XTgsGjgFlYWXFGJ27hWZGMtDBzcfKUiudadDki7qQ2KxsL
         me50hJQ/TN6hAI0iOlGYl0Fgc+P6wGdhzgJcRSal5Cg+1NrX6lpF69GpvNyUvYFrs0SO
         Bb5646i7wub5Hmtsi8Vo57UyXpLJXaNuNnEZ5n6HTXGaKcs0Vgtt9pf7+D+VfNsa88K2
         dH8g==
X-Gm-Message-State: AOJu0Yw8CpU7G+0GIp1fP9P3nU2GT5LbAq4+Ut1KjRANao7tLAiMUTQD
	W3Y2J3nvofMmezznf5+WmI4GkKHd1cgXnzoX95zPEMb5VY+lJ0xQJX3KAaVVhmE=
X-Google-Smtp-Source: AGHT+IEJfI1YxYhiHTZGeDyNtn7lcMGcyPL3K88HQ37hx8DhxxKPIoLvSrmIiONOLGTArC1CQoe3xg==
X-Received: by 2002:a17:906:1cd9:b0:a6f:1b3a:8898 with SMTP id a640c23a62f3a-a6fab60b9c7mr422650366b.2.1718973835355;
        Fri, 21 Jun 2024 05:43:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:60c0:a760:7f1f:9088:c2be:1cb0? ([2a02:8071:60c0:a760:7f1f:9088:c2be:1cb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b47fsm80772566b.59.2024.06.21.05.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:43:54 -0700 (PDT)
Message-ID: <cb70c6c8-7e84-4b3c-97e0-1fbbcf88fda8@linaro.org>
Date: Fri, 21 Jun 2024 13:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: fix w25q128 regression
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Esben Haabendal <esben@geanix.com>, Hartmut Birr <e9hack@gmail.com>
References: <20240621120929.2670185-1-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240621120929.2670185-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_054357_443268_6FA3BF3D 
X-CRM114-Status: GOOD (  14.65  )
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



On 6/21/24 1:09 PM, Michael Walle wrote:
> Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> removed the flags for non-SFDP devices. It was assumed that it wasn't in
> use anymore. This wasn't true. Add the no_sfdp_flags as well as the size
> again.
> 
> We add the additional flags for dual and quad read because they have
> been reported to work properly by Hartmut using both older and newer
> versions of this flash, the similar flashes with 64Mbit and 256Mbit
> already have these flags and because it will (luckily) trigger our
> legacy SFDP parsing, so newer versions with SFDP support will still get
> the parameters from the SFDP tables.
> 
> Reported-by: Hartmut Birr <e9hack@gmail.com>
> Closes: https://lore.kernel.org/r/CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com/
> Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> As mentioned this is for fixing the regression and a proper fix will
> make use of the TRY_SFDP (or whatever it will be named) mechanism.
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
