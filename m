Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD7DC83F1A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xm9+XrZlrOtH+xLfVOtPYO1mjt4nruWvD5nYvOjuyjo=; b=iI0mKGbRPXkJWD
	45xuXeOq+bS22iPKATpjd+fu4pHIRJktougz7nqhw3VvWPvt7JnQiiv1dgAKr+v614k6zm0obijsn
	bskK7huSAifNxVzyiwguTbZKg4PiV1kDh1/4RRaC022ETZD4glExPNDWJVPgkLAPE8G7+qVIE0ZpJ
	nTTZULHhgWJT5xoN1QvQkRoiNe0dNFuaeraAVBjNdiLeDIpu1NA822DYCEsypNKSqJa7sZUF1CA1S
	fCVi/8qGpWw/IV4T6/O825XaHeOfQvKcIc7UnY/8QOOet8FVJuKqu/SIeZ06R6lHv4oTf6P2QMzWf
	ekHMjXyo61CFZiU0NWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnXf-0000000Gw2M-2uu5;
	Mon, 21 Jul 2025 10:14:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmp1-0000000GoEH-2qMe
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 09:28:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so677681266b.1
        for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2025 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753090114; x=1753694914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/BHaibXouyJJJIITGb7mo1gX1MqrXoOg0xGberIkNQ=;
        b=JNQ7mF+eC2NXzsgwGRpk6InVMmO93b4zR5aiWgxVRHUrYGaD08IJOdoSDcRaEG+A7d
         EgvAk7FscF+/BFeX+wwSyX1MfN6EZ+BhL2YIeA5qiO6EzMNzRVi+Uin2z82gpibIz4Fz
         CzpWH18hHs+z/J5bV7gqKz4aWeNVQeCRcA51IQe6uZKE/q6Z+Zcs6J89eE1JLO0biRur
         6C7LB+GsDSYOxEiSEs3e5YjSY4gfiqjtBZcGRihW8i+65dca7l0VB82AEJFumN1g825X
         Q3Cxjj+DNJcVLaQkF+Ur+nB2qrYQSMd5GOzepL76jxVmy2EEH0/vbzY7ueqG33Oc1jfO
         wV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753090114; x=1753694914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/BHaibXouyJJJIITGb7mo1gX1MqrXoOg0xGberIkNQ=;
        b=nT5tZ62HkUMjDjIguiktzKalrAOpHWrqzJnpOS4HtEn/l9ovKuXAIjwyKFkEgZ53dX
         5oJiOomk6nRa1obqa2/2Nphv0FxNLpoAzcJ4L4/JLUpfmtzueiNpj7CawUJaEqOqfzEj
         hzzjb/gFDMFr+7ZbcTidozTglBEN/ePtgZPIBJv2GLwqvx03dZLCWCEd1MO0WjZpIaMO
         LN/yo3l9ffaXO0CmDKIMFGGSeYzcx63WeJLNPY4LV1rro+oPFEWXkSuRqefeUUNA5wri
         ci3hESHuhhtVBx0IaZd1uDFW5vieRx6VUuTtIlCJX0zt7tNtqDZX6/YyC5KYUJCi857g
         ZRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNzW4/y3ZOaUF7ud5htbjRrVKoeQTogkdjqYNT7Fozcqd9Nd2MFClnMUHFeNcFmEBPBFeaEcjG8aM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/a7LgVQxBGWLquZqNgKlMss0D1lbgyOGF0WFlFmmlEsu0xBb3
	95fe62ALJa2sMKxpf0hqiKeYxCL/bmyDixAxKOEnEBcK2xOwD2A8qTcWh325QlpgHck=
X-Gm-Gg: ASbGncuLBo8K2oiFPe57yQhfzsp51u1iQoiyDQBmrE+LCOuDtG+dc1nTncuoy6ctO0S
	fQtYNvNT6Cd/h4jooApGGYFBH0/xFA/MS5MwkZ27KXL6s0dKYFB4/KvtMVhbm80ZNZmm0nfSLEc
	OmxydlUPzMIMCMjhv9hUXPE6dtkQoLuztR2Yv6jE285GF8/1+n9pySOWwlyLIohIvXh+E9KUsqi
	B8XOboYrYghmCWsiQcAvFbKf7hgFlTXGidLp3BsgxNNWqvtWJ50gJ/9d1r6epey/ID6byQNwyI8
	kQUUmrsp/y0ub1m6VL0Vo7qrT6VMSNqK2/+5H+xMJsVSxRo/dXLlz5lcK0Nu3LsIK4P1oHc2UnG
	d25vqzrNXCMxd4U9oy9dqUaYOO/1Pzpd5
X-Google-Smtp-Source: AGHT+IH5pEjp5OVfP4V6m/xEQhFWCrBNIS/9Wi9bH07cLDhVJAN+xvW7EGjxgLgAepiqHSMv9UiC8A==
X-Received: by 2002:a17:906:d54a:b0:ae0:a590:bc64 with SMTP id a640c23a62f3a-aec6a4e2f0fmr1163437566b.18.1753090113651;
        Mon, 21 Jul 2025 02:28:33 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca5a029sm642550266b.75.2025.07.21.02.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 02:28:33 -0700 (PDT)
Message-ID: <11349679-f1c4-4648-83ec-2292f1c2ae3f@linaro.org>
Date: Mon, 21 Jul 2025 10:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-mtd@lists.infradead.org
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250720195625.413715-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250720195625.413715-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_022835_739918_758A4555 
X-CRM114-Status: GOOD (  18.81  )
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

hiya, Marek,

On 7/20/25 8:55 PM, Marek Vasut wrote:
> Add IDs for Winbond W77Q51NW, 512M-bit Secure Serial Flash Memory
> with Post-Quantum Cryptography, Dual/Quad SPI, QPI and DTR . The
> flash part is similar to W25Q512NWM .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 63a93c9eb917..dcb6c9ec862a 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -343,6 +343,10 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.id = SNOR_ID(0xef, 0x80, 0x20),
>  		.name = "w25q512nwm",
>  		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
> +	}, {
> +		.id = SNOR_ID(0xef, 0x8a, 0x1a),
> +		.name = "w77q51nw",

we concluded that the name is not relevant, as there can be flashes
that update their name or worse, entirely different flashes that use
the same flash ID. So please add the name as a comment, above the flash
definition. See recent flash additions.

Also, we introduced some minimum testing requirements, so that we make
sure that the flash was tested at the time of submission and also to
save the dtb database in case other flashes reuse the flash ID, or
different flavors appear, etc. Please do the tests described at:
https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements

Cheers,
ta


> +		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
>  	},
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
