Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD76C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ProUifPTLOA7pjXDZdtykBRWl2y3x6SUTyW8LNoHNdw=; b=B2hAOqPEk2T+nz
	mZx2aW8E1Tlm1tbeLfPvPXHuRQTHjHpo5kdAye3KjIr598nm6e7x4s2v+np6JsF9PXkqz4w84KgyU
	t3wa1JkjIUzXFDNc8OUZmepm1v1bJ86ocDdRWbKJO/EH2vCpFVXlGGQ+YsZgM7vjIVtpqkoW3BcTs
	dLfrNCKuUkLwMD0EtFucMq1tUjqzOGm27Zb6+PqpFLINYrmxsMlbCCL7NvADTJ0ZL81u/jux0FXAo
	MfFR53xcexlKb0NJpECZF57/uRou9G3dwMqIig6rM1lzQYc56ZFGLuZU2mtUnFyTza34+Nrap+1rs
	dF9fDMurKWV4Yf/ypm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeeh-00CfTE-Ej; Wed, 23 Nov 2022 01:34:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeeV-00CfPP-Bs; Wed, 23 Nov 2022 01:34:16 +0000
Received: by mail-pg1-x52f.google.com with SMTP id h193so15507943pgc.10;
        Tue, 22 Nov 2022 17:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0o+4E907Zvvy6ni+QZQIz8xU1g4Q1COgvbgTOREnlPc=;
        b=hm7Jpy1qREkOXLdAWvAMk4d1oXJ4z39uVk6vVyHKQn0eiACmSjnmVu7+6OjCgem/Nj
         kIC38x4waRshCgVXkata3W3e+zYStDSXXa+t5TCqFTf+YGEaJ0BXaE2iJ5CtShcple2O
         iwGh1BBp3Yhs+WBZuM41+XKvZLKvIQ57B1cHClHhYA/rIet45eATH+Q1t1VffM+nGEC/
         NDtdh2cBSDnIS/UrQQME9RN7DUtHUWpEEKXZ/b0KvJ1Jm7ZGdb8CejVl0zVYrURNmyZV
         oz7vGFvTG3kFnf0zzHDMzJrbdT1rboYq6lrpnWNVWFdZLGnPVJ5ugRoImnF/aGQwpm7m
         jIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o+4E907Zvvy6ni+QZQIz8xU1g4Q1COgvbgTOREnlPc=;
        b=38v7rd7bUbHJupFBQffKYaR/xfE6t5Mhjrgv5xDshjGBls4o5gR2h4WDJoI0d3RzFC
         VgOz3INdUPS8tNgklcZlfjeg+AtNZIFnfqTgfZWWDD3EJntbWjHV3bFxOPasQ9kAdD3y
         O46NRGsJpo+oZFIala3jqeghJ1lmBvrjVZ4SEAecpcWGbKIrT5fQXVJ+3lHv0Wo1jhaW
         ms+Ls0veGrEmYhoeXyLwbSp+faR75lY97qICdqmpuHCGO7GBzKuAVAasAuKFaKJ/mn3L
         fGIhW8aOZPf6jsLVePaKzF//0U1uE0xKPwfDOzey+srhkM0aF/WCq3c1883BmoatxjEP
         4b3w==
X-Gm-Message-State: ANoB5pleMrJCPtLScpDlT5fM5N4H15Yjp4qnRAURZfwzbsNBH5kqvrP6
	U24ql5g94MwGx9YY0QzGyj0=
X-Google-Smtp-Source: AA0mqf4fIComKK9aDbVNdnJistSL4pHYNFA0hnYz4EKVMEmSoZO0zdR4co1U6hu9d1BpJRYGfXKZAA==
X-Received: by 2002:a63:f00d:0:b0:458:f364:b00e with SMTP id k13-20020a63f00d000000b00458f364b00emr7084885pgh.577.1669167254077;
        Tue, 22 Nov 2022 17:34:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902684600b001892af9472esm4174053pln.261.2022.11.22.17.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 17:34:13 -0800 (PST)
Date: Tue, 22 Nov 2022 17:34:08 -0800
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
Subject: Re: [PATCH v2 4/9] dt-bindings: drop redundant part of title (end)
Message-ID: <Y314kIVvP+p2RIzp@google.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_173415_459758_06F40F76 
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

On Mon, Nov 21, 2022 at 12:06:10PM +0100, Krzysztof Kozlowski wrote:
>  .../devicetree/bindings/input/pine64,pinephone-keyboard.yaml    | 2 +-
>  .../devicetree/bindings/input/touchscreen/chipone,icn8318.yaml  | 2 +-
>  .../devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml | 2 +-
>  .../devicetree/bindings/input/touchscreen/silead,gsl1680.yaml   | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
