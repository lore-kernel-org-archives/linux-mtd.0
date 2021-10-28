Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8624C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE72560E8F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE72560E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOdbgsuacFPSfBwxb4SrsrnUfcX/+KJTaWmikmLoKWc=; b=yLv0xzdVH05Vr1
	8LNsQgwfwR8lzf2ekqlFUIO4MdC4CMPsH85QzH8BJ/IVslfEWddg1TbwNZ+fgjULuvI+GCKhx32Ha
	pVAFmzkiN/TSYgZgF9Hum3oDbtWdBdu3eK9VAmBB0vnMDvRM32QIgTFV9tEnxtxJjPnaOZTMoUk6d
	mFlKt7jdotFN2ntp2hAxsnlf5fcrgzDuY60H2LX4cbOo3jvs0L0XRf9Prlzf/SaR5SFukehljxq8e
	JYttR3UfotiKAWrtm2uV8yFfFfmFr1sqmfDyKA1/BU2jzMjkSe4rY2XsiWl3DPbT+UztiTydlZSGS
	y8uKNPJn4edalPZq09Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgCul-0097xQ-2w; Thu, 28 Oct 2021 21:26:23 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgCui-0097wm-F8
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:26:21 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so10546658ote.8
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dshGJTXKhxAlRxDf0FyX5GlWtlY3Ecc9O706tlW+d0s=;
 b=I11K+6KQ3oO0hiGwyKsMB2m+u5sIfj307Ruq2Myw0C+mirEIg9XBt25Qz4VwRBsP3s
 wBDuXr8AchKqLazBZZediB7QFxdozLicBdenD+YgmFvQU8XwQ6s2VlETfiHfOA+1tOuB
 dbXBv+TzSyBHFt/vDIefv11hpD/foH/avrDsN6Cb7o/ERcIMr3xd2JKg5oNzsCIN5xMg
 7CBt2UHdfAy24WJKEfHSqIBjoCvm1RFV6htYUqta9M92pTZB3Yk8cN2Xr/7VhjmxSEoU
 UTTUWHkNMAOnoln2DtrqWvKLp/L/oG5nFyRC1c4rER7B6Dq8IPjZfMKJ/opns4RK13sh
 Mvog==
X-Gm-Message-State: AOAM5327SFDGXbgJcTmCRzo+bY3Br7+xKKYNHX7sE6A3mY7xczRAym3N
 9aGuSVCpELCfy2ZZSdMufA==
X-Google-Smtp-Source: ABdhPJy3nAR6IwXfr5ce0NJ1RbxUXtRHrIb5BQhVH6kbqcnF6WXBWOQHEeB1ZutHwDV4jQn45hpiTQ==
X-Received: by 2002:a9d:1c8f:: with SMTP id l15mr5525992ota.337.1635456379145; 
 Thu, 28 Oct 2021 14:26:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i13sm1345977oik.6.2021.10.28.14.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:26:18 -0700 (PDT)
Received: (nullmailer pid 614889 invoked by uid 1000);
 Thu, 28 Oct 2021 21:26:17 -0000
Date: Thu, 28 Oct 2021 16:26:17 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 02/18] dt-bindings: mtd: nand-controller: Fix a comment
 in the examples
Message-ID: <YXsVeTmJBWnrWysb@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_142620_528322_2E2DDEEB 
X-CRM114-Status: GOOD (  12.34  )
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

On Wed, 20 Oct 2021 16:27:53 +0200, Miquel Raynal wrote:
> The controller properties should be in the controller 'parent' node,
> while properties in the children nodes are specific to the NAND
> *chip*. This error was already present during the yaml conversion.
> 
> Fixes: 2d472aba15ff ("mtd: nand: document the NAND controller/NAND chip DT representation")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
