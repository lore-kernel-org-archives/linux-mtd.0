Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF243CCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 15:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+hnkZl3zLlAPsYdFozzpzNpPOihZHT02u+HXVRxS9Y=; b=LASRKvZSaFnhJy
	Vh41HPnslAGkfC3S9FXOiBanDNmaJYgmbbWZkngdI/S3QLEb/EEmHvU5LD5yHTT3Pk4Z4ry7bcLYa
	r44FayJAgq3yYlNLXqKKvhKaAVihjZ0Svn6/T5egfbmpRX4/kBESEjeYlW3p+S6j8Z6as6MRflXCV
	8mq4qBJmd1c5EwJ0nAoxRhr4V6LUCWMPq2n3UVAuCFGW1FxHlGbuiWbzbtPNLdXAAJXq3H2wDMPTv
	8nTsh5/ayLNln8CGAPoSbcyNtjPLI+zWxQDgu2Uqw7CTEIzFAVnJqebZUbcKCWNpUncJhCE/P65FO
	MIa/UIp24OF5Dsm/eQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfXY-0000000Dx5u-08xM;
	Wed, 05 Nov 2025 15:35:16 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfXV-0000000Dx4x-3lMw
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 15:35:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b719ca8cb8dso444932666b.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762356912; x=1762961712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=gBY6DOgaacUOMbCGAiqbokPaVwI9X6bPmGCaekYxfBHtYBeOG1/IwYSRXtdeCo+mDc
         D/bBksRIWSWSdP43GtXbY9igUAHYTlXpTvcQLfGGuXp/oZcMJRXAu1FjWGdZWescKaEX
         BB36d0ABKrJe4fdLFPozGsoJOHT3kaMhcMuDz9eRxerM85jtfGdVn7yRzF6oGBnQ/2l1
         nE3OHcuM5Ru3nqwNpt8SW2z0gB/ZIGOO5+x0/VXCjIbOm5V6+1W40bBiR2Fm4hchs+Y9
         4fpEIJw3Qag5LCW1p5/gecoz8YMm6BLU0NtcqA7fCkKSLRVo5UuiNuPTP4qMSy3zmszJ
         N4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356912; x=1762961712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=rpQxkvht9I+iXZqVNfAnCtFT9gq+38k1lZ2tMqAcOofnc4MQ1giZCt1fV0baOwOPVx
         wgtIEroiXLgQqSQqo9jH8f/PpF60Z/a8AO37J3MLotvXNne+eVnAUSvuqGEIanHblvnP
         9I2kYVcCLQfbEcQ7p8F/sd7JWg+8u9vLV2ndE2R1SYNnH97YRf4M6qA+vyiLqU3V3gZM
         aqQCa1uTMifTwEoJcjPcCDUX0qdoXPa3p9h7DGxrf7hvjzQZApKuXf9QSyLSozTEdm4M
         eR16tLgojLvbXbIB84zRqSvN3A7WJeJw02HkrMaSJv/Acj+Dm0yA+DsYbS9utev/vRMM
         ArNg==
X-Forwarded-Encrypted: i=1; AJvYcCWkeRWkTtEAb/cO2At6GK0gtUmiWDczA0iFfFphux0rA8Z0Y74FbmkGd2LbSCmYetsa7O3jWGiG7uM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxotvCnmuOMaW12ovi+5VFiYuMaDQRVplx+htngT/mJXF7RINCT
	Hd3BcKxxL8lzOUPX6R5DTfetuu8GM8cMVR89JOB/cci/9i2pUr1WSQlMrkyclW+spVn2lCNDJYh
	krlfXo9Tvxg==
X-Gm-Gg: ASbGncsEMFg/HLbdR0VKQ97OogNuNcGVvCwq4d+oduMLgZR1hclcEWhI8iGOYtBlcmx
	7auMsrcgDRiPOKzOP3eZ2oAj9edClvXhL97omd2j/ROAEYb8I1iQrLtYs55k+J6RnT6TkkiTmAt
	WRwmX1oVGPdL9eu0qrZvlNowD8ylCCK7bIfT6c8GBU/Wh5cv6NYQZKlaCnWsByTB6gfp2J7jeKt
	zirQdNkdj+JvjNGR/aHLJEWKzXdazhQg0KM9KiSryunz5xTkwEYxYFdjDYmnXBK7Gx/mepk2/kH
	np/t6xJrXeWuhxPTJaJp84qvs4ZQ0kDGrLUKWjZdrzUzjIm0CPLlL67nLNtWb2KwOeGRJU3Gg17
	HpPMTxbXtvlJa9jK7UIAA6HVo4olIDkj25Xz4lt49m3LmqhRJg9vzmw6cle5kjt303oxgkR/wNK
	bEdP4I5bAw623NpJQj+djK/sw=
X-Google-Smtp-Source: AGHT+IFck5XRDPyHoaLZAuLhkGx4XDGyeWcDyTrgg5x4OYR9WrckK2spEl21YFRwG98d8k3Tyo7H5g==
X-Received: by 2002:a17:907:2daa:b0:b6d:5840:4b43 with SMTP id a640c23a62f3a-b7265400cacmr325257066b.22.1762356911886;
        Wed, 05 Nov 2025 07:35:11 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b726ae98aecsm178597866b.11.2025.11.05.07.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:35:11 -0800 (PST)
Message-ID: <513be88b-a205-4cea-b9ac-fea4da968f91@linaro.org>
Date: Wed, 5 Nov 2025 16:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] spi: spi-mem: Make the DTR command operation macro
 more suitable
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-1-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-1-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_073513_962885_8A6E7C43 
X-CRM114-Status: UNSURE (   4.76  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
