Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D40C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vliw4UvqJkXkSb2iqVSQM0Kw8TWAPqxTytKmxWO2d4=; b=nELLKWPksAI1Cv
	CYlJ525w63FPymjrRxP/z9VJ7PJMAAG+1zGp38QEeoHlDYMNj2bkaJHu2lT4c0io+EC9DUw4MK70t
	5dLNGQGePmoCyqtaN5jdEwVHLb7IpydB+JTcRXrs3t+zIaQ5b8II4Vv6f5ouTr8UCq5GhOA5SNJJG
	iH841tDyABYpAcZq8FR0RNKXMhYSNqrjmiozV/GEMPDNqvx6ICxf1iIyUBdcPIJAvF5uwqsb+Tokg
	voaXK5DE8YQSTafmouLXYCOAT+iegMnP1Ez+IojLEmPjLaWj5u7Vli8gi+qNzgw+8Ul2qrTxNRc9J
	b7f62aVNhLyMADbobUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxei3-00Ch7u-Cj; Wed, 23 Nov 2022 01:37:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxehZ-00Cgsl-Tp; Wed, 23 Nov 2022 01:37:27 +0000
Received: by mail-pf1-x42d.google.com with SMTP id g62so15998271pfb.10;
        Tue, 22 Nov 2022 17:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=57QTDQNjua4bD17eBQRGR4QYAKmDZiaeZv3y3ThjHNA=;
        b=AJd4p4Y1GJ2PPHHqMJkt2vAn6ERqJlfv48oiJrZolP8/Sh1CAzdLzBPA6Y9SygNMOB
         ZL09xzKfYY7O9Doh92VB3jb6Ja8HBaQeBTEaB8nC72ZjmyawK/usRw5XgujG3BFx/tAa
         YQzpVS/GviFMu850709iF5BIFlEAro2HnvijgpS0DgkaoVdPf+crlJ8hgf6xE8Hefq+w
         79hHmd2FIBoMnyNG0wJ0UGHjyN8DYJcXF/xPRlPXnE/3S7V0L3QNV1H73/xPNO9zBSaj
         Pg4w7ZIQmKiJxfxA9pfQlebDCPWdCV3XIz9WLiDa5A8wWXQqx8dPEJlxFOfUf9f5WHlm
         xytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57QTDQNjua4bD17eBQRGR4QYAKmDZiaeZv3y3ThjHNA=;
        b=A2T69U9qzJR4Tu12v1CwkrPpeEY1ppqJq/RQLWWcZgt80HYFwyaqchuEhFTbTxiySO
         dA6Cj0q/Zb7FHA6tyeGkeMSZ7greMPkL9lPK7KRF6FZd+wVmh8/zhWICNSxLKU/GeM93
         ZB7WaVUP5gpIgzpyU+B/X6nKoF8TPqJkAdI4rieF+9I3b0ZLQBTCVzlv69kPfZOVZmoY
         XQLm9gJiVL7RmPIhsbgalPa5dRWw7IYyxOkuky+wvl17x20ygeqoaIpGPdGkTJHvHTWF
         oUAlV9qCJR4Efnp0lqgjfqTsd3ej66bg/UY6k+iRBMVd2MkRau/JdLNUgAHTkPIjWr+u
         GCnA==
X-Gm-Message-State: ANoB5pnQH7AhhM0icgmNpO9yeaopkEXSADCMpgBhJuIlpuNlsa6jOa2W
	4gxmKCBTPuXI2FhPGzjrUHQXdoYe/9mduA==
X-Google-Smtp-Source: AA0mqf547JrxZeSVmkQLdlrpalzLSYM74m3LOUHFPzZ3vcYEWkifg+t/S5X1eHUvslK9HNQURfIwrg==
X-Received: by 2002:a63:de14:0:b0:477:4a61:eb99 with SMTP id f20-20020a63de14000000b004774a61eb99mr16322572pgg.48.1669167442801;
        Tue, 22 Nov 2022 17:37:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
        by smtp.gmail.com with ESMTPSA id c4-20020a17090a674400b002189ab866bfsm204545pjm.5.2022.11.22.17.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 17:37:22 -0800 (PST)
Date: Tue, 22 Nov 2022 17:37:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 9/9] dt-bindings: drop redundant part of title (manual)
Message-ID: <Y315Ta+ST067iVmh@google.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_173726_001525_E181BF45 
X-CRM114-Status: UNSURE (   7.83  )
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

On Mon, Nov 21, 2022 at 12:06:15PM +0100, Krzysztof Kozlowski wrote:
>  Documentation/devicetree/bindings/input/fsl,scu-key.yaml        | 2 +-
>  Documentation/devicetree/bindings/input/matrix-keymap.yaml      | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
