Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B1AC33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 23:44:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C072080D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 23:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIio+bzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C072080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYH3UeTEfLD7L0UIXJFeHdd/B/04AZDhwmNjCcKz6G8=; b=AIio+bzqqls3fK
	zjNXNfKaXtWR4tY9TME2r06ofKJOz77bzEUaAr8bS2jVZlwekwJPB/CUaRkX0KhSU57/d8/Py1a0J
	MWY0R53uViUJcoY8R4d0anZ+pKrrc+TOjqnih+zfws65BExO3RCTPxngQKo01bQwwgZWnte1zB717
	aJBLXV9gnpQ8/wXpiiSswSD8FBrjo3vpGZSG8FKkAhWUJr0ynOKvTNa8SKI8CngC0FUG8gix0GpZt
	Hy9xXpVSBzGwoNtkoKDT+/wgExlL1U4KNvx5OfN2aIS0H4U/cfg4hsj/27sra0dUtGulEkbo8RTXl
	KJzvgjpdQQwmqjkPgo4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9Nu-0005G1-3v; Mon, 13 Jan 2020 23:44:38 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9Nr-0005FV-H8
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 23:44:36 +0000
Received: by mail-oi1-f195.google.com with SMTP id d62so10058305oia.11
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 15:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T2alnzvz8KAPkt6TNZdOKsvg51Cv8nSh38BXX535N54=;
 b=McHaEC2NW5yJ7V7yiBVi89MyvqBHZke96empiJKzSD0S1dtDQU08nOSMfdzmEpcbw+
 r9Lnx3dByRW09bYDUHLjNzO1MjU2o2wZqItW3LPG+qy1zgEdl1W+9Im36HlXn93TwKKE
 lwC9lmEOITpKodMy4tseiguVh2wuMPn7yonsbKiBN5KtXDDCQR39k6w8WFQme77HJyV0
 ivUeGrO1HgW/vSmwkM1DW/9HT/W0/OOhp5/AntoPcMT1RTguLjG1Z7YlyEgeUktb0JdR
 PTuhNXqjsCPfNxsJAOF/SRACks3jDNLFLq4/PvkME0xFDjfEEZtXGy/eECKiWrpaFuUO
 Aldw==
X-Gm-Message-State: APjAAAWOsvmWCl8XFyLwy5T1AWM1oUdr6I/H6JrmSK7jV4foqJ+C2Ank
 FgQGiESp8rQ/5UEVRp1wJDm6B2lmHw==
X-Google-Smtp-Source: APXvYqx5yUoedjDFBfE/YoZY1XC5VBnhtEWFMNWQ5CysZAbMPZeWCewTa1CdTOgt1eshbmGY9v1qag==
X-Received: by 2002:a54:4895:: with SMTP id r21mr15263170oic.107.1578959074690; 
 Mon, 13 Jan 2020 15:44:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h7sm4674296otk.56.2020.01.13.15.44.33
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 15:44:34 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 221ac9
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 17:25:02 -0600
Date: Mon, 13 Jan 2020 17:25:02 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 04/17] dt-bindings: atmel-tcb: add microchip,sam9x60-tcb
Message-ID: <20200113232502.GA31265@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-5-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_154435_570362_CE279CC3 
X-CRM114-Status: GOOD (  13.53  )
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

On Fri, Jan 10, 2020 at 06:17:56PM +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-tcb to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-tcb.txt b/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> index c4a83e364cb6..cf0edf5381c9 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> @@ -1,6 +1,6 @@
>  * Device tree bindings for Atmel Timer Counter Blocks
> -- compatible: Should be "atmel,<chip>-tcb", "simple-mfd", "syscon".
> -  <chip> can be "at91rm9200" or "at91sam9x5"
> +- compatible: Should be "atmel,at91rm9200-tcb", "atmel,at91sam9x5-tcb",
> +  "microchip,sam9x60-tcb", "simple-mfd", "syscon".

How many valid combinations are there? 1 with 5 strings? List one valid 
combination per line.

>  - reg: Should contain registers location and length
>  - #address-cells: has to be 1
>  - #size-cells: has to be 0
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
