Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E73D5B87F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzCiTBtP3VJARdBA6BXnSz+rJSEpxVNYKBzEZ+ih9ME=; b=BpOV1zFb/01Akl
	GpKrQSVdxWqyQJcU3cK7/1gGDtU0ulRca94KkTsgVW3TMAjHOg74Ue968Kg4wL/ZkWBKMe81K+jEp
	+eqzxrxQdR9FouOJjlBdtg2ZNbBpaI9aA7pcbw06RB2gil4Hw42YOkSJmpHE3yBRomBIJ1QoZIf2Y
	/86eoWgfRLWDZz7g+CeL5KcjfFiqcah97aCeZrbhhVRGpzLp/h88YAvfTJgeySrCFJXsQdoTUprZn
	+3OuWTYRFl9xH+rCGAfDhU04mpAIF5WbYGeXiBQeJtMF22nHWCuOQ44tWECQljm1myIH0lZ5IKz16
	IshUVkh6hDp6+RletTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fqa-0000000DNoQ-0qkx;
	Tue, 29 Oct 2024 06:36:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fow-0000000DNZp-3KLk
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 06:35:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so3576718f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2024 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730183712; x=1730788512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGmWguF7wto3ubSTB9eGE9Fa2Zb2k0XycKxxaDv+zCk=;
        b=wfP3PRxQ1abdjKygaNGJ9md2/wZhjUBsUerCRFxhbQMwKfHAr81AqgDJz+XuG8yFSD
         LZ2ama6EF+blUuV545U9npbdgccaJM1schmlXu9/65sYNnJ2kCROpFL4q2kvxeYGFub6
         LzyVS4O5hAY49Go/xheqG3Lt0bx6oPRHhPELlfbW3NhONsLcFXATWutXYNuq+QKLXaik
         SXN4PwhMXuPUmtY4liR3TiZ63wP2FdV3YdOaN39Y0vvuw8gZGBbsYf6gv1CnadqvBU9A
         8+ybEGpyf505sDj6yJPuEwk+ffreT5WZ3H21MEMOQ+Xmu7HR2mtOZJuPQVUcejh+nZqr
         3ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730183712; x=1730788512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGmWguF7wto3ubSTB9eGE9Fa2Zb2k0XycKxxaDv+zCk=;
        b=dSqmGAhbs4W/wV2x9/vOEktJyJ/di+Bi2goImxXEkYkUHziq+C4mxkt7T0G0Y1sKrL
         tfyVxf3jBCr1JQluFYdomAulaaOUAz3W0Zp3DSCDpzctdIosFAWmw1ThUPywhBY3nG3s
         LCkYlqZ/Dr64LZKyP95SBff8vZ6aKVoC0WR1q63sQXrtz7BK21eBqtiCzvaDseg43JNj
         ZZJd3m1WV53OmoD99uNY+zJr1J+uFq5exK3GGDPKf0kvkOIxG//4Y8XqwFLyu96U2Ei9
         kkuOLA+EAKWRnUV16/CxDjndqSb7hNKT7HHAHbPX3VzN+yDQU8PzWilvrO5UBJHcindH
         G7hA==
X-Gm-Message-State: AOJu0Ywuj1DmceVXYFUnU9QaHRaN5LZxgfPig+0/lLODNh6HiEGA7O1d
	S3dWR6hnYLPF2OAQzOIAnDON/gBQmDpSKEVuhTMfYJ5nnNWc4r3EoWi9jshIZQI=
X-Google-Smtp-Source: AGHT+IGxj96uvuoQOa/k6xLtZvRpxvyjCrAdeB52b2mJkIZWiWOsgfuAxw3Jj1MvCjKhES6LQdaIEQ==
X-Received: by 2002:a05:6000:a90:b0:37d:3eec:6214 with SMTP id ffacd0b85a97d-380611f579dmr7898417f8f.50.1730183712539;
        Mon, 28 Oct 2024 23:35:12 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4e56csm11540408f8f.65.2024.10.28.23.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:35:12 -0700 (PDT)
Message-ID: <bbb8f8c0-3676-4846-b4d3-70e1c533b66d@linaro.org>
Date: Tue, 29 Oct 2024 06:35:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: atmel: provide .size to the at25ff321a
 entry
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241018-at25ff321a-v1-1-c8380f80c289@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241018-at25ff321a-v1-1-c8380f80c289@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_233514_858334_D9725C2C 
X-CRM114-Status: GOOD (  14.94  )
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



On 10/18/24 10:57 AM, Marcus Folkesson wrote:
> Set size of the flash for the at25ff321a entry.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/mtd/spi-nor/atmel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 45d1153a04a07b7c61f46b117311b24ab695038f..cc7217e96d0139a06d46f10e35c545f604464b3c 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -214,6 +214,7 @@ static const struct flash_info atmel_nor_parts[] = {
>  	}, {
>  		.id = SNOR_ID(0x1f, 0x47, 0x08),
>  		.name = "at25ff321a",
> +		.size = SZ_4M,

The flash size is retrieved from SFDP. BTW size of zero triggers SFDP
parsing, see spi_nor_needs_sfdp().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
