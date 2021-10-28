Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D39C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D821610CA
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D821610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBiUepaNdIq3Sgi22rX6E3hQ9wR1BvqHQ5bDzkbJtUg=; b=KAypUW0cDX/8J3
	iG/rnQ/Vzh4tpFo07v7pgEXSI7lvrgdQLWqfgN+7KX7/CHa5JDBaaEr2MxBkiBDNH5RDPSTx0EL7B
	GI3rrH1lTBGyBgKh1knSFLgizFoWW4mGO+2G+kXEJ1ecW2pievf++81guDeDm1hmiVIGOG/jPO2ws
	+ctDsXR33a/FzptATOuJ0mGttNqFPnduvWUxfLnGNFsS3tc45gkwf1G30+eM8d5e1O+pYoRL6fR5W
	Cqr+tA6VSb5w+RRwH4nlVKHrn5/ve10BKsVXdLDBBLgENVlVKjmFnL4iBFeG4ZWgZJ1Sw9Q8pGybh
	F/+e/m6c2qBO+cQRKaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgCwu-0098Gd-KS; Thu, 28 Oct 2021 21:28:36 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgCws-0098G4-Bv
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:28:35 +0000
Received: by mail-oi1-f170.google.com with SMTP id q124so10261033oig.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UbQ3X7BD6qpgtn540MLFzrLrimBO17bm2/cyxoaaA+k=;
 b=bhESGk4ay0NN/RgOp2eiI57CqYVAOOufbREZdPyHa5xoojDPZDzkOg0mh6D+JWJnHc
 FDo9Nov3qHNK8ckE3vGM5PmMTODtydZu3j2swlIgAoSc/QxOAp6UrV9UT6GBKwihNl0X
 I1bNd3NKgs1PjY80Jp+ai89n6aQzgreF0pGSs6iQepzSK4wZ4Cw5i4ctxXEFOBw1jXfp
 HfR35JjkQH3nd9y5Wa3Bpxp6Aa4TAQgYBANYUaHuJly1nQ4GveYUhUZwPYjRWMYhcivb
 HOQEX8KWB/4956+sA8YEiLnFjsU9HYFGkyuhK3Z52PHypE2dgbmYPW2i/Houbx5edeiD
 c3DQ==
X-Gm-Message-State: AOAM530GV3syw7MSxF55k7L8MSU0kIWHM9SW53gvQJtXXVjV4u9IC/y+
 J+T1cj6OGe4aEognxPd1rQ==
X-Google-Smtp-Source: ABdhPJyGQdpbdp9+nSux0RGdftKN1RUp3rufQfJSKzdQIJX4Kd5pHVOiVZw6cP3YM+RToI8p67J7VQ==
X-Received: by 2002:aca:280c:: with SMTP id 12mr10593329oix.93.1635456511984; 
 Thu, 28 Oct 2021 14:28:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r44sm1512242otv.39.2021.10.28.14.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:28:31 -0700 (PDT)
Received: (nullmailer pid 617930 invoked by uid 1000);
 Thu, 28 Oct 2021 21:28:30 -0000
Date: Thu, 28 Oct 2021 16:28:30 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>
Subject: Re: [PATCH 04/18] dt-bindings: mtd: spi-nand: Convert spi-nand
 description file to yaml
Message-ID: <YXsV/l+/vU1fBanY@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_142834_438171_2AE2A599 
X-CRM114-Status: GOOD (  11.90  )
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

On Wed, Oct 20, 2021 at 04:27:55PM +0200, Miquel Raynal wrote:
> Let's get rid of spi-nand.txt by converting it to yaml schema. While at
> converting this file, let's actually pull all the generic properties
> from nand-chip.yaml which might apply to a SPI-NAND chip.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 ----
>  .../devicetree/bindings/mtd/spi-nand.yaml     | 27 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
