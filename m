Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91D7CCD1BE
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 15:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sO7/U/gRgiW71aV0WxJfSUoT3KR9bIlvceDZY3W6Nus=; b=1eSryYdM8EXPib
	5QuExqRKewv0zPmYZzIv28HYblKtciKIlhijAUhJ018JKUL0DM1H0sBAdvjEuXYZIYBrscMOv/b3y
	yaoKM3DDMUbqB21VilC1iorImfW4z1+w5YXlb1bbrWsJoepwgpQhfRih26WX+wC10CRpxrS7/qaph
	B2NufUQ84AZ4Ibq5so4MeEJ45ezXuaulN9v2toJFWBtIfJJtk3kOToySyGHlW/RYl8TxVEYnWzt1r
	dBJAtdAvfjgSgqw8CZeLyfLJgDr+Y9s2uBxD2dCYS/5ofEXfJR9uy0pGFwowOfb+HaGWvsdSVay5B
	Q31LhzBE8ula5IRh1plA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxSP-00000006nBP-2Fp3;
	Thu, 23 Oct 2025 15:42:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxSM-00000006n9g-48fw
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 15:42:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-26d0fbe238bso6982675ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2025 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761234146; x=1761838946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=HgkyiMvsHvzIs2rXuf9mCmaOFRmV9lYUPVeUhHZHUKXJWa071UjyB+DeOs8EtCo7Kx
         AiNV0ffTcuI3kE+IC9VHpIE1tqgN1K+2VIGT9XwdHSXcyzQiJVFtLYblOY5qOqGQBaWh
         Qhd2nfyZjc1nBu6aTPEJm9uLe3sQ4JJkn8EgxXA4RAWualDR4wxDaCjOnin7V2MWJ6Hw
         MgH0N6BI/TTZznFcnfWrM69XrOG/QzP4BVEpbkJZP/5d1qJgljQIp4Cch8/oOTL9LS0T
         zT0SdGczYN04RLLZCrdlayEG+JPEEKl985dGbBjfQTTeELzrEf2nCIgVDZuTyWB9F45O
         DC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234146; x=1761838946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=AnH860Oahl6XcdtBopMijY5CnUHycl5wL5AXVJwmyjMxwQk9/zdfnL3zW6NmzH/aCl
         7tviCEOrNXauFC3P6UhavlSr86zn841vBuiyDbcYsIFBmgegFHNXa2ITRz/Xd/ZgJa89
         7kb+3TdmNJ3PnaRJK+2z+YFLWosUTQ7YYS0YlXGVs56fTifif+/hWBJ6smb090kL97Gv
         gopT7TCj3WjLdWxvRRVVZDfs/AVcVO5E2SOsCbhuDbFGymC7heuJiDfvnQ2uxoar6xVk
         nS5sXj26RFgv050iFsBgO4+GSQJ8Pib4UvUNew2t3MNP9bkICmY+20MThbcn01duYx5H
         VALg==
X-Forwarded-Encrypted: i=1; AJvYcCVW8dbMJrZNEXFlUdZvRsH87EgPrrGmmkSQhU91+JT8K3XmV+/whfFqfT40Xr4pM4Nj6QdUtc//FLY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIGuneD51YKtwSwKlA/UiavyA85VGxUHVmFucnUg9xQ1TK+/7G
	kLKyrzHjYNoYfrP/xCOrScLAP0S08JVIgOx8zXuBoNteo1UTa1YCzyxB
X-Gm-Gg: ASbGncuC2a7vaHEIIjxoUUm4nDomXacZkWVGN8gnY0TSqzeE4cXdMh33VjMdHjMj0/i
	nB7TND0wH2tt4HyzpYsNz4qPJiPifswAr92oxivwmrGL6DV/quDru9LNdGr1IaDjRFJReObU9zj
	YqXsQSzFsR6IpPxkA4RCVqXZveNlzQGtWO7T1+/qyJ+JzTobXDqOiDNVPSvnPJPjt6Djx2H62vO
	Yjdhx+4EwkQWay+MWNNfVr8dM/tDy+uQYm8LWC1OwQMXJ76Azsp1zKOVMS9pBnistohFMcX0chp
	E076Ulg8qfRa0Mc0mQ4uwwehLWV8ZDfIQMQgclpGVltjGG/TaNpijPt3CF15OBhGRkbIUe70VQx
	u5m7DrYmMc5/ZdVxozsiyZ9qSdFkDllfEpxou1vteMjHPcxhCubm8y+SK32mOzlNgFL8xto97dU
	4QZpe2w/bDW+JO
X-Google-Smtp-Source: AGHT+IFivLiKbkP0y2KMH2ZNEJ7GlEhOb9t2a5oI0W2mRRwwxItjHXvAd1GZTuvYOgULd0RdTXOLyw==
X-Received: by 2002:a17:903:1746:b0:290:9ebf:211b with SMTP id d9443c01a7336-290cb07d223mr295078455ad.40.1761234145718;
        Thu, 23 Oct 2025 08:42:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda72ddsm27825615ad.6.2025.10.23.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:42:24 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:42:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <0d01d218-15df-4553-8e84-fef84fde211e@roeck-us.net>
References: <20251023143957.2899600-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_084227_018249_D8536DE4 
X-CRM114-Status: GOOD (  10.95  )
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

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
