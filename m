Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BC6C33CA9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567F2207FF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R6q4Dwr7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567F2207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ud+FgIlcdsC2nUd4jlLQPYMXexLzKANSsgR24c8zbE=; b=R6q4Dwr7jvxive
	d7Xq+kbkzjjW7/qc+G1F/LAHdWhmHT+91aN9Bg2dfCYHElnovz+puWFCZcyQrqxVtexi/kb/AMxET
	ZgQNaWtd74JHqbgGR2KkaWoeeYy/juc54t7gSK3oftERc20e8PwE3decD4a5JPs4D/PpJscInUAIB
	rtg34Utliktd82g/0c1oCPYr9fRD7rcPsNf0AM46sBg1CwJpbqR/otZMATdcsqIxhCc1iLTTxizm1
	modEFD4jKppeZqIRyQkGy3L2py7tqiAE9998McXq6FMizV3sEv8d2r4gO+gLee0h27rg8jW8uvfox
	sNd/w6xUlUdcpadERTHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irA2E-0006vS-Tk; Tue, 14 Jan 2020 00:26:18 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irA1W-0006Fs-0o
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 00:25:36 +0000
Received: by mail-ot1-f65.google.com with SMTP id p8so10835985oth.10
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 16:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/2uIWxQRw2ac2zDhobeFtImF06Kett0ywn6nB0mPlAo=;
 b=ujf3Qq7iwWiJxoBzZQLDARx8F+OFyRWgUieyyK+13kszK5/8wS3ul36AP/vKVJTtqO
 AeRPWE/qjs3r6nNHoUMHgtXlEBuI9cPZM4d/ujerLkwdeojiqW8Zhk2IoWePyJntMLnF
 LQF9l/JyJl49lt5PTHo/PXLkpSEGJ3hzMV0CIGSNbvEJ7BvVm7+oAa+suVHju4xJORwu
 2hsU8SHbhlF3QzS13F7jRHIcS2DAujkmU9dnp7tYn9F2jTPp8PTbaLMVnYXT1Hg9qz3/
 zpXVIlxO78dTlRuPIZgznP+nvgiWtSFklMHlhbWRUWCULIdW+7IE6ifhkblAUk9Ua8Cb
 ju8Q==
X-Gm-Message-State: APjAAAVB9SZE0bRsAbLgbR5u7n2dvcBvUtXhTeEgyP/yBkdOzKyYbywT
 1nG+OlpzbJiTrh0OPoEEPEhz4Jw6CQ==
X-Google-Smtp-Source: APXvYqz4u61HAs6+y3VoIABgpPwwosvlymYXXUiHK1FBZ1zNAtMnIGeVV9dlM1kHWhGuwj5q56xhjw==
X-Received: by 2002:a9d:7dc9:: with SMTP id k9mr15143579otn.117.1578961532713; 
 Mon, 13 Jan 2020 16:25:32 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f142sm4062151oig.48.2020.01.13.16.25.32
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 16:25:32 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 221ab2
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 18:16:59 -0600
Date: Mon, 13 Jan 2020 18:16:59 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 08/17] dt-bindings: atmel-nand: add
 microchip,sam9x60-pmecc
Message-ID: <20200114001659.GA11452@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-9-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-9-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_162534_201933_A42827A2 
X-CRM114-Status: UNSURE (   9.24  )
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

On Fri, 10 Jan 2020 18:18:00 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-pmecc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
