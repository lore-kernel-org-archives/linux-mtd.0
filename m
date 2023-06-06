Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5839C83003
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 20:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8n6duxpXMoJ12UwwGhMtK8zErsCkaDXd6t7NGr1Xc8=; b=R1CLT7HnQ4P7mq
	7/DSRKnZqdLyGs0V6fmsGNHmlUpF+KzOkOiU/nkrXklIVfPJSqT3nGpvZV8PojbNjEyKPLhelnMOh
	atMJXHCnaHFuIlbf0A5298e9uiq9ClKpigCUsfNkvfQ1Nspwo76slmf2HQ88lu7U13YJy3Ku93Wl6
	wV1uFbN4OyXBHuRLH/5LwPRvqZyoZJvv5RVgUD+KyflAmH3fKhoH5ajTYtKwOe/StELdj5D7GqRTj
	ub2G82VAXj4pev2crYRTkfZOouJjcoKHI1B2m9s6uU+1m87BVrIxmrywzoMqpcC+/ejGrEVyseHgF
	1LKKs+A2ub2YL2T/nfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6d2X-0036D3-1y;
	Tue, 06 Jun 2023 20:12:25 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6d2T-0036Bp-0A;
	Tue, 06 Jun 2023 20:12:22 +0000
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-33b22221da6so483455ab.1;
        Tue, 06 Jun 2023 13:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686082339; x=1688674339;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oTi+J4/KlqfIRDKD6li2U1FfODcCfumrK5ycv6/faOA=;
        b=POkR6UpG4PcGyWtHPjL+eIMOd2ucpVbBoo6aF9kQ7KsFfMuo5Fz8+7vGjoVAJfot4p
         PlL9/p+wd3NfVI6Y5Ui/D8TlJInXITQCCCs6Mo5GjmPSeA4WOkanqkycGu9bkN7ei1Jk
         jN/JfwS3sUcPaaeHn4Umiu/vyPPlx8BaRZzlJB5FvnvnJ39jblFfLgr1eN1wziwADX6a
         NvRTJ/R6UsebYX1g+S48SojR0Yb6PC89sWVig4nX7Lt4y3t0ijYZpZ80eAWIF5Jzal+V
         95rL++VVpIv0vZA8yEw/2vvtgfRFXu/ImkiG34htGjCxaoPRWyS/ku8fOHmxAPL9gfxX
         mGkA==
X-Gm-Message-State: AC+VfDz8KF2QJwLcIElWfgL4QJexfcJE2lNkYJo+OMs/varrFv1SxC1g
	iAhkpscGn7jsCYYHGlrtbp9F3ZP6zw==
X-Google-Smtp-Source: ACHHUZ4/dvwbcy01BSUtuPxen2FdLAX+HOYoKuxbwugA8+RyXNtv6V1MfDRHfuJMMh2dINX0gXQ+sQ==
X-Received: by 2002:a92:dac5:0:b0:335:908b:8f5 with SMTP id o5-20020a92dac5000000b00335908b08f5mr4291681ilq.10.1686082338996;
        Tue, 06 Jun 2023 13:12:18 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m11-20020a924a0b000000b0033d2eba1800sm3283987ilf.15.2023.06.06.13.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 13:12:18 -0700 (PDT)
Received: (nullmailer pid 1540120 invoked by uid 1000);
	Tue, 06 Jun 2023 20:12:16 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, kernel@sberdevices.ru, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, oxffffaa@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
Message-Id: <168608233614.1540103.8185199247808319074.robh@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Date: Tue, 06 Jun 2023 14:12:16 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_131221_088283_6423BB0A 
X-CRM114-Status: GOOD (  13.16  )
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


On Tue, 06 Jun 2023 22:35:07 +0300, Arseniy Krasnov wrote:
> Add description of 'nand-rb' property. Use "Fixes" because this property
> must be supported since the beginning. For this controller 'nand-rb' is
> stored in the controller node (not in chip), because it has only single
> r/b wire for all chips.
> 
> Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
nand-rb: size (5) error for type uint32-array
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.example.dtb: nand-controller@ffe07800: nand-rb: b'true\x00' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606193507.35024-1-AVKrasnov@sberdevices.ru

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
