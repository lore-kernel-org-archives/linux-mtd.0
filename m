Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7C1C33CA9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:25:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 512A62080D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jC1nDWmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 512A62080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JlOiT25ZCVM3r30CoXhRZqMqiIpkLq2QCYf4iU3kJ0=; b=jC1nDWmKR21Zjb
	VeyQzMIN0p9uND6GPNEy2ONL+XzAUG+Zw+usx258JHXv4xcsQir+YweyaTQ4UMRaSrk4dolgsL8uX
	83OJFkfKWvK1adZkHFx+ni0Nrc1iva/WNfCJEZeP4PEGURFxazdCNGV6lxUgi+5VMsxy02+cwGwHK
	Ap2UxFUeHagy/veSfWwdTIt1XLkqwq3y77ABovyonevQHZnmjm9F9KDsvFtZT3MNL5tHog9V8E+i6
	2OAP2JAgNLNTkpgzAriJ6XCdP4CRmScg/lWlV+TcPj1CtGAA76rTxsaIEbjrVzP/E1d0oepJtCAFc
	V+8WjKGv5ewtiOSsFDNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irA1L-00065G-2s; Tue, 14 Jan 2020 00:25:23 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irA1F-0005yI-9k
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 00:25:18 +0000
Received: by mail-ot1-f65.google.com with SMTP id r9so10841250otp.13
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 16:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z4zWbyVluCegWLV1bmjQGYNlUCTLZBFCektijqCqk8g=;
 b=oyAU3Ogn8qFvFKXsUapvpqi7VxxnjUjQ5ZcBG0nSNMM8nvDQ/JHx1z2YK4R5ghLCn6
 gWq+2rnckQEcek4rYUECj+1+0LvkjNXdthlJ6ochsjQvZk8vH2BKYHQiZs21uCHLcwWT
 GeomAAa5gLS0S9c7wnJ5bmGlqreb4Z9zcjREFJ9wJTwL8WEZ85lQ4dssUgkiZg30p2p9
 oBTMpWkrRNJ0KPnfpO3MpxlC8mJyUzfy4Ku4V0Xg2/9LCmH2SJWj863R4C8/6qJ1kvMS
 nlZGLATPCfKOl67OA4Y2DEvmW3igb7ZaiIm7JdZSmjY/0JQoZC6y1ojtn+PNl6nLoD/o
 SFXw==
X-Gm-Message-State: APjAAAWpHIRq06eIW/pS1hkUlYErvot5zpdUboPeA01P5RU+6nmKrtPQ
 mSAGKJUiv6DSRxodOByP2BIMkCDSYQ==
X-Google-Smtp-Source: APXvYqwvjAqQqoCUsPV4rJzsMt+YMyTDPA69O+KIbIm+wvsUwBl4x34zR4mz31ldA526EZCWOZ9b1Q==
X-Received: by 2002:a9d:7090:: with SMTP id l16mr15544392otj.187.1578961515851; 
 Mon, 13 Jan 2020 16:25:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm4071455oih.55.2020.01.13.16.25.14
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 16:25:15 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219d0
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 18:20:42 -0600
Date: Mon, 13 Jan 2020 18:20:42 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 11/17] dt-bindings: atmel-gpbr: add
 microchip,sam9x60-gpbr
Message-ID: <20200114002042.GA17036@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-12-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-12-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_162517_378443_D7062EF5 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
 linux-can@vger.kernel.org, robh+dt@kernel.org, mkl@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it,
 richard.genoud@gmail.com, nicolas.ferre@microchip.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, knaack.h@gmx.de,
 dmaengine@vger.kernel.org, eugen.hristev@microchip.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jan 2020 18:18:03 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-gpbr to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-gpbr.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
