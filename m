Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFF6C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:40:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E4FB20578
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXKakBsF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E4FB20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/fmMzLNu0iH2wi2Ii9z66IPI1tgRasC133kzwuVVyzA=; b=jXKakBsFOZ3AKEJAjQu5j7BkX
	Gbd/gVgcctOAW+AYW89Ng/xN72blK7iGXALxKAFei+MZhQDu8ntTX+H7OirBLWnea/nHidIGj4vuE
	CM4jeUU6sLH3T1jdgS/oBzK+TOSdIfYYNtD0nEQlRxXn70rDHzhbgocF/RG4OC0wvQ0UK4uxcztl4
	NYM83q0pmoYKpdWi6KTqGKv1QWyg7fIMJ0xp1BtL2NnXALS4r3o2nk7lfFGwqinVtFcv53XoX+T0m
	ytZ0h0d2KdipinkmmapfOogKA9CbRFsR2cf4RPwKPRGZPWEvc/qvhrhvZDSQyVXGnHycV5yGxbe4E
	hAL287H4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA68R-0007gL-O6; Mon, 24 Aug 2020 06:39:15 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA68J-0007dm-Nw; Mon, 24 Aug 2020 06:39:08 +0000
Received: by mail-wr1-f68.google.com with SMTP id x7so1394766wro.3;
 Sun, 23 Aug 2020 23:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4XWaFvWmHT/RUrBudpI26Cm6Fut1CRVWYNLopidhfR0=;
 b=QiwQc7iumnVsBtjsW/3Vm9h1jZ+GtmGjGKHOMjDFM8sxQNHmHT2QpWPK0Z5N4JoHpB
 lIfwG9x1XOkJEEARIxSHruvmlgHpaYDU+M+CDl5Dcy7RF2KLaQg23Eom9lCIp45SopL7
 X6KnQ/5VfQxQfRH6VzBdpFQv1ndW/9b6GxKHts1M1oyiWeQFNFPi3bZldLgWKU9G8bQ/
 w8/RatGDikLaF8WPEIl2Xzb7M5CVnvaV/YMeIoN/ZftgJJhqVWfI2OrLSzcvJY4H8Jr3
 S7iggYS+pWNtZJXodbDYvzHUde6p4J9Cu2i7ugFcB5xozIu6m/YypBn7Om5/zLLgIPDn
 kfFw==
X-Gm-Message-State: AOAM530jDSscIdTIVBq5JN+8jF/6Cf3alILe6Av6Vh32Nuv1+xzLty+g
 zB2bGJ24COQf6rFmEF3a0wQ=
X-Google-Smtp-Source: ABdhPJyewo/egAIaWx2hIan9ejp0R57MKJAQtZl2+4y1UgdN/eYHM6xy28KSddVF059VY/eXTpmMmg==
X-Received: by 2002:adf:fc52:: with SMTP id e18mr4402374wrs.185.1598251145633; 
 Sun, 23 Aug 2020 23:39:05 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id u7sm21278681wrq.89.2020.08.23.23.39.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Aug 2020 23:39:05 -0700 (PDT)
Date: Mon, 24 Aug 2020 08:39:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 07/22] dt-bindings: serial: fsl-imx-uart: imx-pwm: Add
 i.MX 8M compatibles
Message-ID: <20200824063902.GB2497@kozik-lap>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-7-krzk@kernel.org>
 <20200824054601.GF13023@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824054601.GF13023@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_023907_855016_F24D43C0 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Anson Huang <Anson.Huang@nxp.com>, linux-gpio@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 07:46:01AM +0200, Sascha Hauer wrote:
> 
> The subject contains a "imx-pwm", presumably from the last patch.

Ah, copy-paste. Thanks for pointing this out.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
