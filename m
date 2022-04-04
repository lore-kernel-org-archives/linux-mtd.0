Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF45C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIAvJKbT+EkzRo1mGJ3/XqEWGV8IrHPtAjRUQZk5dew=; b=y0o1LX6TEEftZh
	ZMtXNFF54lBgbEQ4IkqVNrufMtyAwzVqaUjRBK1SjalLtxZUIJ+nR2PQOXZyRFwYTCH7LlmAgJsVY
	CWC34w5d1LwqBZ4zdEA15bnmBHWarhfFBxayb6hQWmp89py8BwMQaipg7w7SkzQa4XgvWnNfpvEuy
	7ZaKuSK/4Xsfa5uq30VIed5tjlSxHOVM/acXjDDCq6ygUzhILiHw0VHxudqZ2aufcpUwPgPbkhvL0
	Ro19xMtg5QCHjlVgcTEsHQH9Dp2nb934xi242SlfsUjq327I4TCyS8K22A5MvJDHG1DlOrytFXP+R
	pdidp7ShdCbz5A0gEjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPGp-00FkAC-Sg; Mon, 04 Apr 2022 16:09:36 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPGI-00Fjsm-Te; Mon, 04 Apr 2022 16:09:05 +0000
Received: by mail-oi1-f173.google.com with SMTP id b188so10505617oia.13;
 Mon, 04 Apr 2022 09:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=cezylBcNKJIb7u3t+c6rzI4fkWol+SJJy81HJ0NVukk=;
 b=h5O0pZvxsnagPx9mBRwJlyxQvOX8HQzvEb3paDEXiKgkkdHTUP5VJSWhZRW4nXV2Xr
 VrMqmF7J6k1k4ziiea/m9xIbqulvaRpBDGkgZYqinAlFnZWe/HqkdduoLisz+7o5nyOT
 iwOe73bVdtN7iz0YjZSnp5GILzTPiLRq58JgKMk06gxQPE5EwtxcG3wYrQjjGNGxO5x3
 /5nbI5xHzm36PHU60Uxz/gTkW8TQvhuyWlQ8ISqsY6u0T5DEl8wPoioYoC4b46DXCb90
 L4HxLPRdeKyF3zBzXCRU+ZepGcUy4ZYfZQVQj1qwwlW0SMIUPQc5P0O3tyBLHrlZBlfD
 ZKWg==
X-Gm-Message-State: AOAM5323XunKj4ik2a84oDETTtqlQfxTHsCS5tI7EZtVW7Tf9N1scikt
 2Gp+IY4O0SJuZx08mDo+ig==
X-Google-Smtp-Source: ABdhPJxu7q0HR0nZflSaNkabmyqrbGx7Kocd4s/sq7R0bRlhaws0t4qgX1Nk2HPeARa/X2rziRYFcw==
X-Received: by 2002:a05:6808:ecb:b0:2f7:41cc:21b9 with SMTP id
 q11-20020a0568080ecb00b002f741cc21b9mr10234348oiv.156.1649088540993; 
 Mon, 04 Apr 2022 09:09:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m65-20020acabc44000000b002ed13d0fe6fsm4309194oif.23.2022.04.04.09.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:09:00 -0700 (PDT)
Received: (nullmailer pid 1436950 invoked by uid 1000);
 Mon, 04 Apr 2022 16:08:58 -0000
From: Rob Herring <robh@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Roger Quadros <rogerq@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mediatek@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org
In-Reply-To: <20220404131818.1817794-5-gch981213@gmail.com>
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Date: Mon, 04 Apr 2022 11:08:58 -0500
Message-Id: <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090903_017899_7C71C2E9 
X-CRM114-Status: GOOD (  12.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 04 Apr 2022 21:18:17 +0800, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> Changes since v1:
>   1. add a blank line between properties in dt binding doc
>   2. rename ecc-engine to nand-ecc-engine for the generic properties
> 
> Change since v2: none
> 
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dt.yaml: spi@1100d000: 'ecc-engine' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dt.yaml:0:0: /example-0/soc/spi@1100d000/flash@0: failed to match any schema with compatible: ['spi-nand']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
