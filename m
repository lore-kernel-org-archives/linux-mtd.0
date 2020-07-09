Return-Path: <SRS0=tdsA=AU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CABC433DF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jul 2020 20:07:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068B820720
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jul 2020 20:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xrtyoTjK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068B820720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sCq7h3Zd8Hy5Pqyjz+7RQe2e7hdlwvkjJxm4bSgFOhE=; b=xrtyoTjKQmmMYyH+M+155wDWE
	J+eCazrZ6tY/UBjV3pbvsHRNVEdEI4N9KV2gIbQMjSj7ulxBYG1h37JFz5IaftnVPI/SoYbMe2ik+
	mIZFRQa1EgOXTfnuuCxWV0b4gxe/fl2YtWXooelHgeU69I4Hj12G8v2Xz5LlgqEMIypbi//fJ1d7Z
	9NlEkMBnOw4AQDu0E9THnO1zzmTWADgiY+PrE2/ZuxusHLj3p8iT3R4PP5o6f0nixBvkGQCKSbJSO
	HUi/4qMmvwA1HgKrcPGac5Yds2vJSKW4T33hk18H4TdxB6lsIMlnKn5TNdQrMtCyAi1Q97EhMoLjq
	5EcNGqXlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtclR-00033d-Di; Thu, 09 Jul 2020 20:03:25 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtclO-00032a-EJ
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2020 20:03:23 +0000
Received: by mail-io1-f65.google.com with SMTP id q8so3656326iow.7
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jul 2020 13:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xVnLYByyzlTsmGIoIT0Rn0lgHoJ1iurwkE/MAFpFY+8=;
 b=LFWk90aVZ6fo/yAumcDFBW4q9QCksQGOkONIDDDeA3PenAbt9Evn+oM0bVjousBGCe
 0pyGcBRrHaCR6oY9dDuQXy4EO+uQFdzNtKg1onKxueGeeepbnXDXJ6CPu7CjgZ7KbiKo
 wcjNHy31scF7LsFOXtU2/YSqxvBI7SqCjIWhiNIPMOCptojOGc2A/EXeJ6vW68enG/d/
 QdWegjqr8lfU5NUOiHgjquHqBBX9kbVaSOGF3wJmT5s9vpcF2moxBjl61vmmV1UdWMJ5
 IzNBW5QS0+oiXMlcpkEdD1zGQP/kyk2sjlpQuLhBE2+150GhzDnLLCpsORjI0oD2/eYG
 iYyg==
X-Gm-Message-State: AOAM531sqv8iBNVNZ3InkYTp80iTwmPXeW1bXrx3PjyXlRTFJcDffjkk
 di2XMsw2xPUlN4DoMaKANSEIKE419g==
X-Google-Smtp-Source: ABdhPJy+ynC+nQTZHPsV15rOCIFh8rjSW8zvvSkqfq488KMdusP1oC+YKGtEndupVeqX++KTWFxjsQ==
X-Received: by 2002:a05:6638:11cb:: with SMTP id
 g11mr10581396jas.14.1594325001836; 
 Thu, 09 Jul 2020 13:03:21 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id p9sm2389323ilc.78.2020.07.09.13.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:03:21 -0700 (PDT)
Received: (nullmailer pid 799772 invoked by uid 1000);
 Thu, 09 Jul 2020 20:03:19 -0000
Date: Thu, 9 Jul 2020 14:03:19 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v12 2/2] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200709200319.GA799550@bogus>
References: <20200630072822.26828-1-miquel.raynal@bootlin.com>
 <20200630072822.26828-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630072822.26828-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160322_773754_35B6F487 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jun 2020 09:28:22 +0200, Miquel Raynal wrote:
> Document nand-use-soft-ecc-engine and nand-no-ecc-engine properties.
> The former is here to force software correction, the latter prevents
> any correction to happen.
> 
> These properties (along with nand-ecc-engine) are supposed to be more
> accurate than the current nand-ecc-modes wich is very misleading and
> very often people think it is mandatory while the core should be
> relied upon to decide which correction to handle.
> 
> nand-ecc-mode was already inacurate, but it becomes totally
> problematic with setups where there are several hardware engines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
