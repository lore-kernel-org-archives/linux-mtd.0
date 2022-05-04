Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A6C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvJ3TzAyHdlcctiPBzsvZRkHAcpU38FMYPdIKpS2z3k=; b=JdxIwTFQWbG+ly
	k2bCHziDZSvEn6RKtoix+5ZmY6IGiDM2Vs8ITVb7BkPpm4Cpz4k+2qx0SlKjseJpKVftNC3dpjLTs
	08jyMcsi5pXTfBHoX2kCtev6dz1Jy5LDpj5iOwlXa8ZCyZV4VdLa/gfZUGeSSLdZRxtiAnL9+lIG9
	rS+bM2B6dSmrxo1AGDT1LIvtugfFT7X014El+Q7zC6YfySVzPWydTk6Ck/oEgitmzC2b40vs/TIn4
	yqgXgQX0CKiuPe9FoxyPyk5LlKMia+kLOEZxvkh3Bxne8aRGA6TK4lhEGz9QFxwUCQzK9aHoVlJWb
	OgZN4+R6/CtrQ4Y5zP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLey-00CZPr-DG; Wed, 04 May 2022 20:31:44 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLev-00CZOY-NS
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 20:31:42 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-ed9a75c453so2357658fac.11
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 13:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+GJhEibm6sfq+JdSCxkElhUgA8eadFPm7j/iCqOF+VM=;
 b=0VKm89IU0yXt93KxGvMQvHbOMIiYMG69zg9eP1eJOpKeaYH67pjJVBMyryF0yfLWX3
 4TJjpJCA4heKt7W2LO3A8oD/eXwullSt3mv7SxiSAllmLqxFVurP7b3FxV/iYC+0a4bi
 hRO/sGmIqdB5Ddv9p7uEDpgCDQA/zE1rHObnMuRaaycQSscOlByR8wa9uSIozSbqcPau
 T1UGkYUPUcobk0BrFe49qfA3Tbhet5VU+I2h2+QSkViYyKw+KqAchwHpcq/BbnOqcg3T
 IsYBsw6P3kt/w/HUWSu6UlXdmFNqJUR/2WBgQLwRYngoGbOrbs7NutWQyuB87Ax3Oh2D
 WiEQ==
X-Gm-Message-State: AOAM532KTI+pkWb2ow6sDDV2m+ZWP4rrSFFwPgBZz3xec6RqFNDEriY9
 bZe+eZgPuo5zsIGpaxqLSA==
X-Google-Smtp-Source: ABdhPJzf5wa3VE2Z7BWReg5pDcHZOn+75YroPHZGKL5Xku3QI4YKBc2pheB/DFPOUbdniXBgUoIFhw==
X-Received: by 2002:a05:6870:a788:b0:de:c1c1:ac07 with SMTP id
 x8-20020a056870a78800b000dec1c1ac07mr690242oao.68.1651696300163; 
 Wed, 04 May 2022 13:31:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00325cda1ffb8sm4665980oih.55.2022.05.04.13.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:31:39 -0700 (PDT)
Received: (nullmailer pid 2175935 invoked by uid 1000);
 Wed, 04 May 2022 20:31:38 -0000
Date: Wed, 4 May 2022 15:31:38 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Pratyush Yadav <p.yadav@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org,
 Gareth Williams <gareth.williams.jx@renesas.com>, devicetree@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: renesas: Fix the NAND controller
 description
Message-ID: <YnLiqlWKriAAlszN@robh.at.kernel.org>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
 <20220429105229.368728-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429105229.368728-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133141_798853_3909ADFD 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

On Fri, 29 Apr 2022 12:52:27 +0200, Miquel Raynal wrote:
> Add the missing power-domain property which is needed on all the
> RZ/N1 SoC IPs.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/renesas-nandc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
