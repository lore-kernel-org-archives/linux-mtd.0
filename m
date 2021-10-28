Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE48C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB8E610A4
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CB8E610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKBt2HZ9TkjtEOmpV1/sOf8yzBQU4z52TQsQ7B10dyI=; b=QgPht4yySWc9RU
	HSLY5MFPzUb1jEe8eM7JbmGDDwBCNrf4f5mIgx53PMkabLtHOk/QJn2cmwGjuHsniWCmgLZgBgbTX
	akkm9Uwd991FQWaJ+d03Dy37WjTf8kAXJqEsla6EYqtA/gVUCR0EOaXJ5X99Zrcb32bzBzbwxdaOw
	RDsvjSxmqKR1qArHLcqUbB0jXyUmGZzOdUsI2n04oqUPQRhVxn2Yt0CFdqME369kwFqrAKX38PJ6b
	Iity2UcbWP3JiqbS5PM4hafxauvORBl0krSAsaj/GwxsUrRusHJCAHLGP4Wi9BE0bEHQNfYlgicoH
	Kf+mSNYjD/9thvkUOQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgCty-0097tJ-Oa; Thu, 28 Oct 2021 21:25:34 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgCtv-0097sq-O4
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:25:32 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so10496437ote.13
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q+wb9pAO3Q7/CorDpYBYPsQ7RQNJbzYpLrTDXU36ZuM=;
 b=wOVp3tZRiJKRqu6QO9xaMfgVH3zwgwPFDRbYG2arBGi0WsysRIwMlvXsndEnz7hUcL
 aZhFSVjDT8uwGCFHgsm4zfyvfWYY7a/YM09O8Q16iNbXL64yrtzHw1zyDHgdHvVVeb78
 WXUIovPo/J3G0qNStJhHJQA1WCy8sXNvTZIt0Hk2El3gPR0J3Ffc7dl9T7ZkAyoD+oKQ
 54EW0XvwNsu5WpQQS0cxpvzAfWRm8Do900xrX09tQcj5N0CgfssdyaOU9J/NPkWiyctF
 G5tMSSPK2yVafg0xBb+gTA25jmZKuH1JxuDG+GFcGxo4Y8895V4a68hISlCNWTlNW8fR
 X4TQ==
X-Gm-Message-State: AOAM531g0USfjlw6M8az7VK/6YCAjnxrKMuI2guEL7JjwfEpzhk9/vTD
 tDcs8W8cND5f6NOGxDszwg==
X-Google-Smtp-Source: ABdhPJypFdc9331gl6AA1rnDnur8ut7w6EDbKwn/w23/osjkVNOViyhLs596mXdi0yYiX4C5Pu/1oQ==
X-Received: by 2002:a05:6830:232b:: with SMTP id
 q11mr5660195otg.164.1635456330441; 
 Thu, 28 Oct 2021 14:25:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z8sm1248084oof.47.2021.10.28.14.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:25:29 -0700 (PDT)
Received: (nullmailer pid 613503 invoked by uid 1000);
 Thu, 28 Oct 2021 21:25:28 -0000
Date: Thu, 28 Oct 2021 16:25:28 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Jaime Liao <jaimeliao@mxic.com.tw>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>
Subject: Re: [PATCH 01/18] dt-bindings: mtd: nand-controller: Fix the reg
 property description
Message-ID: <YXsVSIuS0/LOqnUH@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_142531_811359_68DF4746 
X-CRM114-Status: GOOD (  12.60  )
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

On Wed, 20 Oct 2021 16:27:52 +0200, Miquel Raynal wrote:
> The reg property of a NAND device always references the chip-select(s).
> The ready/busy lines are described in the nand-rb property. I believe
> this was a harmless copy/paste error during the conversion to yaml.
> 
> Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
