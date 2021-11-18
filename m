Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528E7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 22:24:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1526561139
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 22:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1526561139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtavN46JESenslYDoODWSyrB0TmJ6Xk0vTcvah2oYzY=; b=r8mAzLhprVu2iU
	aMjaESI5J6/Evjw8u/HPQOwCMEkhR5OXZcBtJVxL/2g2h64bD/g6TtL1GY5iK30ipKW4GQNveKaFa
	BLiovur1nYrGtQ9dYFhc0nZvqNF+I0lBqi9QSrKnlpoMEOi1c81F05iiSfJZhZabBnhTcGJSXx8ly
	GCd6nbf+lXoYOcTNQG6Qz5DepVkyUGD9mFSORbpR13wiVoZqPCheXsYgiBaCNSXVgjYQH3Ca0/K3C
	Qa2cJrQlYmLTD4PpH0y7LRspVcdxhQZPXpkgDylxe/Z+A/KqFVtBPdKTRSBfzuLg9+wsav/ppPlsC
	dbdEdJZRSJamOVfXqP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnpow-008xhv-R4; Thu, 18 Nov 2021 22:23:54 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnpou-008xh9-63
 for linux-mtd@lists.infradead.org; Thu, 18 Nov 2021 22:23:53 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso13531220otg.9
 for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2021 14:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zzrLG1dp1sDs7fna1qV6Y2VpWnTsqTBbMcn4hdUaAzY=;
 b=t7ui+uFpKm/6krel47aJozbBpWTQ8yt4uHVgR+Y6Ra/dZpX2es+m8zVmHyW09c+Pp4
 I9GF+dOndj+NIaHuOU+fg43NWlUQIokAZ+rjgF9a93wVMH+mjMtEJiGE/sjfAiDgcOOQ
 bKpCP2PTW+gKdKV8okWlO7LsqJDiuScpCtuypFN32nsV+rFH8ugXKpiLFF5Q3TeClHXx
 upNH+y4LHW8d9jlAvagbQhLqS9rTTcREsRfck4BIF6oRvszrL1D0pLPUOIGvHYy2/gm8
 b0b/3WlfDo2sTLmx+2UQQSntkkdEoABoSRdBFSFHMK+2fM4hoBeBvVz3nWg6VMU6tW/n
 xc4g==
X-Gm-Message-State: AOAM530TOmIFrnr0+Cv427IVP05xqWXpRpCIHUn2pot+hfEUUsuKwTAP
 MrDZTmGXGEfn7QP9a42WKBOAxx6CiA==
X-Google-Smtp-Source: ABdhPJz5Z1YFMtbLnWkXmfMCsB7VO8FlPE/OAwfQ2S8cQOJtOZwMIcvu48+SzOghBsFb28Sw1iQ2ug==
X-Received: by 2002:a9d:2077:: with SMTP id n110mr520097ota.261.1637274231192; 
 Thu, 18 Nov 2021 14:23:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e14sm253782oow.3.2021.11.18.14.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:23:50 -0800 (PST)
Received: (nullmailer pid 1864953 invoked by uid 1000);
 Thu, 18 Nov 2021 22:23:49 -0000
Date: Thu, 18 Nov 2021 16:23:49 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: mtd: spi-nor: Add a reference to
 spi-peripheral-props.yaml
Message-ID: <YZbSdarZL7VmcT8B@robh.at.kernel.org>
References: <20211109181911.2251-1-p.yadav@ti.com>
 <20211109181911.2251-4-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109181911.2251-4-p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_142352_255712_0FE69548 
X-CRM114-Status: GOOD (  16.06  )
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

On Tue, Nov 09, 2021 at 11:49:11PM +0530, Pratyush Yadav wrote:
> The spi-peripheral-props.yaml schema contains peripheral-specific
> properties for SPI controllers that should be present in the peripheral
> node. Add a reference to that so its constraints are followed.
> 
> additionalProperties: false cannot be used since it marks the controller
> properties as unknown. Use unevaluatedProperties: false instead. This
> has the side effect of allowing extra properties that are not specified
> in the schema. The alternative is to list all the controller properties
> in this schema but that would mean every peripheral binding would have
> to repeat the same set of properties for each controller.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v3:
> - s/slave/peripheral/g
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
