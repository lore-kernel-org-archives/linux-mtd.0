Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C969C61DB2
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qWRktTOnCb+3s0Ok4BSPPLJcRexq8aBzmc6D3cbVyE=; b=0YOzR/xEvJDYl5
	jieXQXxidifnwWhz47gUjI3z9+lq8wCly1Aib6rjcBjS6MX9sHoq/cbvbVWDF3yxbAacUxRMOfdp7
	z1aggFokGKdeNLPaRSS47Di5k4e2FJQZp4c8WjNORzbd4CdF7Bb/GKCkJ0qAg3ZEsXlHWWWpEEvGF
	nDR7fX3bNrH/IRaeezu0AeG9ZmQeQjumC/8UubimR/l5+bZF9omlNXPyfYB02iyLjmzyKWe1oS2x/
	2SfiDhNRirBSj1GYFEj/QDV2yhM0IDIvVPtP/8S+VFC4d87EdK6h+h832aGtU5i10ImRQjf/ig4tP
	Ixxd/0msRxXemzjJN/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXVe-00000003dHK-2pCu;
	Mon, 09 Jun 2025 08:05:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXUs-00000003d8t-2ILd
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 08:04:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad574992fcaso600631566b.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749456285; x=1750061085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=;
        b=xJVTZBdWvEGaSpw+WhILeKVhu9Ra585RTS9qQdVbCS13A/o3m6N0bfWiPnoFR64Q47
         2XnEFbo+MNAYnULzQHvMBXzf2sPCbwXd7hF2HDAlP+tjDt1+a7LXufyZnliOVa9ZaJwN
         X7QlMTvPC03g2LKJwFEZDwelljS6OHEqaXYHRE1VGsDrkfJgZReGQYLdy778gqfpTL48
         1q5JfFCQSLGJXbdpEyxva8P62lTfmJKLCQ5hihbN8YD2KEuuO0GFIJNFoxy76G/cPJNt
         iJ053bb/mKcjub4VqjO736IIUB0pSwgvuNfb+/emYpgy7X+lBhoXJkjBK/lVkJVtromL
         aSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456285; x=1750061085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=;
        b=YqROlyzYcc1d1bQFjCo8ugLpxiK/JnLOJyK7606oXTVI6pZVgXfYJyZmap0om6/5vH
         151CLWDil3voxPvcNnybcyo499snzXj8LEU3g3Gh+zLLvcz3fl97F9rFhfghsPkJ/DrQ
         asmEFSsAMNWBcChFgg6NscH5N9hWqYS7dUrfAokhhaaQ8Kf8CeWTHDVELasoLyjQQP77
         suyUvDEy143nYZyM7fIexlhTCkfCwxFDRb01Z4mJcGkcAAAnVLJcrS8kh4txSeTM0TlC
         nVTRdHN2Y4nLxR1nGtnn4yMsp4G5jwzVuiCfAk8C/v8dN0Q0R21TYRY+mXaKrEq7KMHR
         EZFg==
X-Forwarded-Encrypted: i=1; AJvYcCX+x2u9z5WIoLaUlXA3JswO8iUUDO7Whjqe8OYMjU2XY75wTAMht0lXcW4FYlGHR/LNyBy/u3Mpalc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu/HhAculdOTRmltAQUysg2bgbL6g/HvdRz2nraKCJ6LG0KXec
	OeVwmkbsJj9d5PKWwt/clWLsF5mUxzlPjUe0u5BCwr3GVjkbnOZ6HrA8QmVXFSRYAxo=
X-Gm-Gg: ASbGncv4uzEsUb0fKn7ggeTXTTo61sw0p95WSpilXCXdGUaq3Iml4ZchF2F3idZHHvp
	W9DYIg6Gzuq2AnI4WCec5dWpE7UjWd2p2KzQsMq0M945kEv0LxYB4MJXTmz2AuQxl3p+yGj3n/4
	b/dZhu+JPQ8Kgz8WFKsUFj4XWrB9JcqgX3GFf5ykpBubDfMLhCRs2Q6mpqGFGtpKDGlM7OU0hTf
	eG4pLLnDu540BviCuK7kMiYZLNDejl+itd9QSNt3QlBEpV+nl/Uiyh8HH9jZtvPjoXtSOLM04bi
	/0KAgxw6bcla/mBz1vNKp+Q0rmxHzUKrHM1EovZdz62cs4jeEBIqffpVFdMEVZI+psbwejuy
X-Google-Smtp-Source: AGHT+IE4MSpOgbuv33HwkCjYoe/XHyfRRWBSdHnwS6XSdQ5vijF74vaQ28Yz93NEa6jYLsO+24PJkQ==
X-Received: by 2002:a17:907:868d:b0:ad6:4e8e:1883 with SMTP id a640c23a62f3a-ade1a917048mr1066441066b.3.1749456284653;
        Mon, 09 Jun 2025 01:04:44 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7552a6sm517919266b.28.2025.06.09.01.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:04:44 -0700 (PDT)
Message-ID: <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
Date: Mon, 9 Jun 2025 09:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: sfdp: parse SFDP SST vendor map and
 register EUI addresses into NVMEM framework
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-2-manikandan.m@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250521070336.402202-2-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_010446_586334_16305BA4 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi,

On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
>  drivers/mtd/spi-nor/sfdp.c  | 161 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |   7 ++
>  2 files changed, 168 insertions(+)

Please find a way to move the vendor specific handling to a vendor file,
don't pollute the core drivers. In what concerns the nvmem idea, I find
it fine. Michael may comment more on it as I think he dealt with a
similar use case in the past.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
