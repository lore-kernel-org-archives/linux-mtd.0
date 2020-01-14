Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB7EC33CA9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA052080D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pzw7CSee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA052080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3AH/VPSxUTtxNCeDY3cuUjyty8AoTZhs1srJvqC9lA=; b=Pzw7CSeeREVH4D
	LLqyt+yK8Ay0/tTW7sjEVF2up4y66HwxVnLsCa+UCUqrXijn+QraJIgci02HkSrazhfOODybyWXb9
	JSovP9w8BCnPqqOpCj4rWuOXevXjdKJHet2wltu8xFcQuTd6Ugm8jnG7LwS2Q6H7hZ1F4DMup4bZH
	PBfCd6VkvmwdyAxRowNvDM2yI47crn7u8l5fGNv7WsTp3Te5NIulCOiUFtdYEIm6iud5ZJvV+Z6xb
	Lg9E+SbCsQvmuirfF0SCmJ0X5Nj3Dyrdrgrzk04/R36KQEoYWRU/5ipJc288WPLeA6kRwzQ5LLzQg
	BU/0Gy06PYNpJ4F4YB2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irA0S-0004G7-3j; Tue, 14 Jan 2020 00:24:28 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irA0J-00047C-9r
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 00:24:20 +0000
Received: by mail-oi1-f196.google.com with SMTP id z64so10197550oia.4
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 16:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fTr7T7GJceLoLFzB5OjtrxDOobOt56IiyvMJHYGzl0w=;
 b=ER8lMY3pOvBHkoAL47kEBAz/QHOrk741Ic2s+wnUOHQR2Fu/CdsHwsSwdguh8uQG2T
 3YB66YqfoCtedEqDXGFsarVaGhJ6xNS6SijKatNvWuT/GKazAykjEuV/4O3eCPHSIPZ1
 qpTuwCLQBFHwW3uoeiqBNC79TcUOi70g3sVEk3sslS84z/Wko4RuIGqAOzTNIgKg34K7
 59h3ULL6rKZ96/cHnMp+PpyI9hZbuxQpl7+uCzEf3zPL2YX9kvD0Hdg/rjOfAX374GEO
 bblzDprayAEkg8zpmfCR6gEXGDmiSbaY69gR7iotPYARveqmp/50p/QvRitHM88tXGVo
 PCyA==
X-Gm-Message-State: APjAAAVlWr9xlJOmYd91CKb6iR3XfT/N8cClAhYS/u6po+xFlVLLMiZ2
 UroxylpLl3TMcIO1D3VcNke7zKL1sw==
X-Google-Smtp-Source: APXvYqw+lVhAC6gGl23VwSKU+oXvxUeDjsygYEa+DXpzzNBw6qPdRBL1sDDDAiyyecfJ1JmbsVAnvw==
X-Received: by 2002:a05:6808:b13:: with SMTP id
 s19mr13941014oij.119.1578961457944; 
 Mon, 13 Jan 2020 16:24:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l82sm4071551oib.41.2020.01.13.16.24.16
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 16:24:16 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 223ddc
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 18:24:15 -0600
Date: Mon, 13 Jan 2020 18:24:15 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 13/17] dt-bindings: atmel-usart: remove wildcard
Message-ID: <20200114002415.GA18336@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-14-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-14-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_162419_338098_9EDEEF2F 
X-CRM114-Status: GOOD (  14.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pmeerw@pmeerw.net, miquel.raynal@bootlin.com,
 lee.jones@linaro.org, linux-rtc@vger.kernel.org, lars@metafoo.de,
 richard@nod.at, ludovic.desroches@microchip.com, wg@grandegger.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 tudor.ambarus@microchip.com, radu_nicolae.pirea@upb.ro,
 linux-can@vger.kernel.org, mkl@pengutronix.de, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it,
 richard.genoud@gmail.com, nicolas.ferre@microchip.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, knaack.h@gmx.de,
 dmaengine@vger.kernel.org, eugen.hristev@microchip.com, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 06:18:05PM +0200, Claudiu Beznea wrote:
> Remove chip whildcard and introduce the list of compatibles instead.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-usart.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-usart.txt b/Documentation/devicetree/bindings/mfd/atmel-usart.txt
> index 699fd3c9ace8..09013c49f6cc 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-usart.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-usart.txt
> @@ -1,10 +1,11 @@
>  * Atmel Universal Synchronous Asynchronous Receiver/Transmitter (USART)
>  
>  Required properties for USART:
> -- compatible: Should be "atmel,<chip>-usart" or "atmel,<chip>-dbgu"
> -  The compatible <chip> indicated will be the first SoC to support an
> -  additional mode or an USART new feature.
> -  For the dbgu UART, use "atmel,<chip>-dbgu", "atmel,<chip>-usart"
> +- compatible: Should be one of the following:
> +	- "atmel,at91rm9200-usart"
> +	- "atmel,at91sam9260-usart"
> +	- "atmel,at91rm9200-dbgu"
> +	- "atmel,at91sam9260-dbgu"

Should be:

"atmel,at91rm9200-dbgu", "atmel,at91rm9200-usart"
"atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart"

>  - reg: Should contain registers location and length
>  - interrupts: Should contain interrupt
>  - clock-names: tuple listing input clock names.
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
