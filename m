Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14FFC05027
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jan 2023 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR7iD1SWMXelEHpKZjTbc/THAzHHoDvphCCDOV9sdW8=; b=qOzxoh4DJIVySP
	95LmxmEWSEc+ZjRVILn+AJu1GhafMi+6BwwlPnv8SPedkflTccH8BBgOtm2c9qGlb+sg5NWyLnRJE
	F8YQQCgECN4S53s5a5KrVw2lIArvO2Opych8PtKHGvpZjAMwNw+EWNzQeoh86THYzFgJNlnTWkUOz
	DzQm6SoIDusX0rNQVA6HUCUM17dVIXn0GMmI5Ai1WZIaVQOhPRJ4vqG55PG8cmfc8QMSLEOG43g5Q
	M1Ebx+t9YstLi8vhrL7RkDpfTr1NQjjatlIbvCdDFNEbrNCJiqFf2uT+quKMJTT4NeOkaTRTGb1M+
	gusCzusaYQE+rEmim87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM9vN-001fKn-Kq; Sun, 29 Jan 2023 15:48:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM9v0-001fJ3-Ak
	for linux-mtd@lists.infradead.org; Sun, 29 Jan 2023 15:48:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so1027822wms.1
        for <linux-mtd@lists.infradead.org>; Sun, 29 Jan 2023 07:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/1SEXBl/drT6B50+MLoCmrJXk4pQjWe0OUv8/ULGY0=;
        b=bHbAg0NEPiDWyIAfDBCrE9YEnCjl9DimD46s0O9s+iGCLDRWKJDdoXkcdY8Ic/GYqk
         2VhvBr3441g2GYPzGBEuPhINkeJobRkV+fA9OyuJTnTwZZwhDbxZLKrM0WHOwAAj6lI2
         HFwwAC91xT02fgqj+3kiNoArc+FJiJusmsBxIiuKIY7nX5aykzq2ufFKxzYR0sx8dKW/
         czTO6hUOkmOg009ruXF33CHuFXw6olcv/mH7T70GQDJ4txGZSElVEECurqVSKEkvqa/O
         +kWyZBwG3obnXNN4d+fE51z2lLJTXOTyKFmyn2A6Fw8/+hytQ3G1P5MbyVqj8ryt8s1a
         ymUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/1SEXBl/drT6B50+MLoCmrJXk4pQjWe0OUv8/ULGY0=;
        b=XJ+qSEjL1+Pi7YeFYuSsoX/iu0BpL+DrskELGNscpXyfhsLNPs8r/vRMuK5Zxo+Tb9
         KjOp0bImTDBIvJS2r4W6vEycmOCbGhIcNuDFepz8e9KScad2vhHWlPdkmyzE2zZLmJDU
         mexc0XGwSeQrPUi3JZ48X6qxUHdxheIl4SBeeN8efk8nrlr78+B2A20/6cW+dWHC8vIr
         g86nk859sccjN/HxxG1yvr4yz9c06HTtDYU7QoAZUDeUPN+sXWh35VEBiX5wvY5AiEQt
         NPOZ9K3hG35sh6bD3A/z+gY22jMJlihe4yS+GfuW7G1NOivFpG3hj74UKPZmS9vgoWFt
         tTDg==
X-Gm-Message-State: AO0yUKWmsxTKpCsi0FlNnKeKlk0Ri8Jsp1tGW0XcIxDS42Fby+N2b18F
	87RMhnVZMmT0k16f9jVwWAv0oA==
X-Google-Smtp-Source: AK7set+u31EI9YP+CMtlmZ0UQD0fuUfEjQ7CLKD/ky8YiQDj0Mgj7cggU1RQsvg6InTRJdV78D73sg==
X-Received: by 2002:a05:600c:1994:b0:3dc:43cf:7302 with SMTP id t20-20020a05600c199400b003dc43cf7302mr6523633wmq.3.1675007311772;
        Sun, 29 Jan 2023 07:48:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003dc521f336esm2984835wme.14.2023.01.29.07.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 07:48:31 -0800 (PST)
Message-ID: <755d4a78-0b23-a381-c422-d12b0063f06f@linaro.org>
Date: Sun, 29 Jan 2023 16:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] dt-bindings: serial: restrict possible child node
 names
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Marek Vasut <marex@denx.de>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
 <20230127093217.60818-4-krzysztof.kozlowski@linaro.org>
 <CACRpkdbOZLhQ1DTNJowNXF=O-Nvpqcb_A+PwkPWFiUSQUbkR9A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbOZLhQ1DTNJowNXF=O-Nvpqcb_A+PwkPWFiUSQUbkR9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_074834_505696_837E65DE 
X-CRM114-Status: GOOD (  12.62  )
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

On 27/01/2023 14:29, Linus Walleij wrote:
> On Fri, Jan 27, 2023 at 10:32 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> The re-usable serial.yaml schema matches every property with ".*"
>> pattern, thus any other schema referencing it will not report unknown
>> (unevaluated) properties.  This hides several wrong properties.  It is
>> a limitation of dtschema, thus provide a simple workaround: expect
>> children to be only of few names matching upstream usage (Bluetooth,
>> GNSS, GPS and MCU).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Fair enough,
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> However I think V.35 WAN devices (high speed serial network links)
> should actually be using this? They are just some fancy serial port
> after all. Cf
> Documentation/devicetree/bindings/net/intel,ixp4xx-hss.yaml
> 
> No big deal I guess since they are mostly an anarchronism and not
> on the table right now.

intel,ixp4xx-hss is not part of the expansion bus node.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
