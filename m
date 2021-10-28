Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187FCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA5D60FE3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEA5D60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYYl3fzUVOAuzMGSC3SffMjKzVkebc6XIGW85eOfmTo=; b=lm04B1mJfm3Z5R
	Uj5J5xRFefGmgHC4k89o8tR4o5Y1vLr4ev7nZbWBfugVLg3Ysix5iy4bsosDRVaCHRm1RppMlJVH1
	oqriQdsR8lEnfWOO27Gy1Kt0vibF3O0UUclOULe4y9TNmkyDs1IvRFg7PmzcgrOEIYWDoR8Ak8UM3
	0DvE0nnPJMzJOuUEcR9BA09YABMGOaO0zOR/oDgNzux7vleHqi2SHMrqGS7ZZ/O6dVZjjMuqzLQnm
	XToVv7wufBnSaVqDaL2CEwO1cXZQnUfEDZsvqhmj2W5Fw809ULgW6Qm5rhAX82w+yUJqWFz9/Poie
	l3nFUf7UxEbNtCmYKAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgD0N-0098uE-Gp; Thu, 28 Oct 2021 21:32:11 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgD0K-0098t9-Fr
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:32:09 +0000
Received: by mail-oi1-f178.google.com with SMTP id g125so10256902oif.9
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pV+lYlLAx38YX42772eORjOf2v8z4XTyW8SH1ArbmLs=;
 b=h0VCzEJSbmcMuRVY1+jeO3jf8/bA6IuuZlebspv7VpqaHXeJAFxaisBkvRnVDxtYhk
 nd7D67oPEm5azwUonHnnzVl/ybhqG4i+dof6EbYzDzKGJJhazkdwAq+P0pzD6XEp1d9r
 mLu1nrv6h5pGB+AjLIr/6RJ6mVWSW5x/mRjz7+VVIu23l5Vz7V9cDg+Buc7pWKrBNgaW
 RQ3TrTdfJ74cLU4Ev8IVcPuFdhBwbCvPzNfzOiYYDIDhydLqtZSEq0WlMgp2TrIiR+xE
 R+f0NVXJpinVQtdOJNKvoxFUndXFiyAAgRPZ7vjlvlTOSEWUKbMfiLOTPB3VIcFZrY42
 XpPg==
X-Gm-Message-State: AOAM530T7B1QThCFUCpq3b176iWsOeU7THlgPecXhdxaMilp/9Jp8QHq
 Ven0/NXmZDxvZapL4GTbXg==
X-Google-Smtp-Source: ABdhPJyuxPMrmxNkcdcCEerZo6yZspo2c/4b31BFtQfeY5X28VqH21jX8eIJFihX+OyHXAGdgbwp9g==
X-Received: by 2002:a54:4e8f:: with SMTP id c15mr4927670oiy.113.1635456727512; 
 Thu, 28 Oct 2021 14:32:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h17sm1261392oog.17.2021.10.28.14.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:32:06 -0700 (PDT)
Received: (nullmailer pid 622969 invoked by uid 1000);
 Thu, 28 Oct 2021 21:32:05 -0000
Date: Thu, 28 Oct 2021 16:32:05 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-kernel@vger.kernel.org, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 06/18] dt-bindings: spi: mxic: The interrupt property is
 not mandatory
Message-ID: <YXsW1Q1dh2+e2ONB@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_143208_559442_9CC9864E 
X-CRM114-Status: GOOD (  12.24  )
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

On Wed, 20 Oct 2021 16:27:57 +0200, Miquel Raynal wrote:
> The interrupt property is not mandatory at all, this property should not
> be part of the required properties list, so move it into the optional
> properties list.
> 
> Fixes: 326e5c8d4a87 ("dt-binding: spi: Document Macronix controller bindings")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-mxic.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
