Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC294C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 21:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C8461027
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 21:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1C8461027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOJr7Wxp39fu0S4Kd4ibDS0O663XTn19RL7ysLNCcUY=; b=phMVbLwwXp9293
	NR61NfByHIAAZfnsbixIHMa+kWeN3ncyZu3xx/+Dc3cr5P7FnEEv00oQoTfLo4rlCatRQiqG1AtDk
	u6StETomk91Z+W7217XvIWiDd5Z9mvwwjRDlzzsjLNNP2RmvsLc0/+yjKa70yJl/lW+OHfDsSexLz
	6aAJIMECo2S7utF4ShzK8dawkJZI6UBvC5g5h/JEkEr/h90DiXDs8uEFD3Lf35fdzz2USfCvIhccF
	aqiDiaYga9D3TDtvWAQ6XDJ4TrZ2NjjHFteKu2uOImJ7jn557/C/FO890q/Z1P/pdeJ2vSef/4YeP
	fah2XKVQife/F5RBTqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYxim-004EWD-Rm; Fri, 08 Oct 2021 21:48:04 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYxik-004EVe-Ca
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 21:48:03 +0000
Received: by mail-oi1-f172.google.com with SMTP id o4so15434338oia.10
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 14:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z6zpljNARaGHtMTY8U/C/Gg2k98fznp34I6cu4S6oKY=;
 b=a1mGm/A/rljT/rLxzFeHaThzCHvv9Yf0pRFdO/Ih5UvGye2PNauL+iLIGAwt7BHTZ7
 u5VIrMaFPKSn/GxkKNFmGUTOTBR77iZivpTFKK1E9jA6n8LzNrwvAMdkDx5oxkqc04qs
 VymwNfOEnl/tMZ5IpiLXbvFL5o6zjPFKhTnoX7O5a4LRTLJpiBBdXUJy0KloCQaH4dhz
 tUMP27ZAW8XGYwN1gDEuAzYCu22VmfkQ+jEl4IOhSOvG0WiDYxEOXAzPVO+CQFmPtEm7
 gNHTUfAlDhUl4xUF6pFYH6L9Bpimku5mghDpT+OG42mNWHh00n0HUTEqg8tt0tSqJHhC
 65Fg==
X-Gm-Message-State: AOAM530h9ZCxaeo6nMYYwHavsmIUYB0XufKTFP0aIEhrx1A+v2UX1i75
 h5Kan6R1HBuF1ndiBdmf3A==
X-Google-Smtp-Source: ABdhPJwN6oUmR44GNmTiOfpQO6Lr/nsoWADh8JwxBTNvETEEo6KpwBwFga3dvo/t5qqpV60sNu7g0A==
X-Received: by 2002:a05:6808:bc5:: with SMTP id
 o5mr7019964oik.129.1633729679930; 
 Fri, 08 Oct 2021 14:47:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a13sm141625oiy.9.2021.10.08.14.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:47:59 -0700 (PDT)
Received: (nullmailer pid 3372749 invoked by uid 1000);
 Fri, 08 Oct 2021 21:47:58 -0000
Date: Fri, 8 Oct 2021 16:47:58 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, jaimeliao@mxic.com.tw,
 juliensu@mxic.com.tw, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 03/10] dt-bindings: vendor-prefixes: Update Macronix
 prefix
Message-ID: <YWC8jgI74FgTudSD@robh.at.kernel.org>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211008162228.1753083-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_144802_456804_34BB4241 
X-CRM114-Status: GOOD (  17.46  )
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

On Fri, Oct 08, 2021 at 06:22:21PM +0200, Miquel Raynal wrote:
> When looking at compatible prefixes, Macronix is sometimes referred as
> mxicy:
> - mxicy,mx25r1635f
> - mxicy,mx25u6435f
> - mxicy,mx25v8035f
> - mxicy,mx25f0a-spi
> and sometimes as mxic:
> - mxic,multi-itfc-v009-nand-controller
> - mxic,enable-randomizer-otp
> 
> It looks like the more up-to-date way is mxic so declare this prefix and
> mark the other one as deprecated.

mxicy is more widely used with flash parts. There's not a single dts 
file with 'mxic' which only seems to be some nand controller.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b868cefc7c55..013a87850cd5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -758,8 +758,11 @@ patternProperties:
>      description: Mundo Reader S.L.
>    "^murata,.*":
>      description: Murata Manufacturing Co., Ltd.
> +  "^mxic,.*":
> +    description: Macronix International Co., Ltd.
>    "^mxicy,.*":
>      description: Macronix International Co., Ltd.
> +    deprecated: true
>    "^myir,.*":
>      description: MYIR Tech Limited
>    "^national,.*":
> -- 
> 2.27.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
