Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82108C25B67
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8Es8MLl6W2WiLiEkRWrpE/PoY9rPHZhtSKIlJHCU18=; b=B/UzIpqeTWL0XQ
	vbG5FFqUIvzA03fhYjVunRh8+UJ2ixft9+//pEs33745QHDM8TY1zpc5+FQqnHvhHZT5rbi6Fz76V
	mPo4/SaBl4vTET8A1PkLAT/O0xfKgPf+hkC9rfS6CVJRtq6XcD992C1vNpO5oXVATVRFFtdE6kVYx
	VjVP1ihwAf2Jb7ff7jPEy3fnYiLF7jPAyqg6ZZF1E2AHGsIqxpOdKY029m6gFhwESbhA27VTHMqZk
	1PivNeUkktHlDB8pL0izLnUA8w4jJiBKODfymYy31uPU2zqXmM6cGAqvz1WPf7iWmne1yDZGlT/wH
	+Dz+R06ftn2PUlIxPIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLlL-00GMsS-23;
	Fri, 27 Oct 2023 12:16:27 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLlJ-00GMs4-1O
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 12:16:26 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6cd0a8bc6dcso1237242a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 27 Oct 2023 05:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698408982; x=1699013782;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zrswrci+AEzt+Lvaqj2iVImlscxYXx0xdOCbZrxVg9M=;
        b=gbaYXdZMuDCrRbleEtv5PsxLEKoW2/X6dV+Z6wS85R77g4zQFNDOQJtpbY9pHSbuDW
         14xHVLE4r3iyn73shxCOpfCG9OrTy/Bmy2s39catt/zLKGMqPaEdTLO+zFTWNFiTnwd7
         rwsf27GzUxAfi72voUbquAD0wPecqOX9ozjbTPcfP5fHbDuXs0SJcBvbvbC6P4aoZ4c7
         GZa7sZ62nGfC23ALIOgtALLjL0fI2N71Il1c+uchUf+byA3SHnnvbwVVUGxYjQNhA6f5
         MuFX+PZc/qkK0d683VBY+4pfMDKpvGCSEUYhEMP0RQrs0Yal3lewRUcuPenggLkVI2/z
         vrog==
X-Gm-Message-State: AOJu0YzorYQaABViLT6CDOKBFiE0lEQITRmygeMezUJ0/1C4x4ltXRj9
	DTije51qk+xwAmwbyaQHXQ==
X-Google-Smtp-Source: AGHT+IE33WimAvUGfyRmeqIMMGPByZUgZBCLzFycQZKVOCtqAaouvYrfpPCYF/6Omaj/IZycy0pB3g==
X-Received: by 2002:a05:6830:3149:b0:6ca:c677:4568 with SMTP id c9-20020a056830314900b006cac6774568mr2541269ots.10.1698408982681;
        Fri, 27 Oct 2023 05:16:22 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b8-20020a4aac88000000b00581e7506f2fsm323704oon.9.2023.10.27.05.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:16:22 -0700 (PDT)
Received: (nullmailer pid 2215701 invoked by uid 1000);
	Fri, 27 Oct 2023 12:16:20 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Edward Chow <equu@openmail.cc>
Cc: Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lech Perczak <lech.perczak@camlingroup.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20231027094610.1022114-3-equu@openmail.cc>
References: <20231025052937.830813-1-equu@openmail.cc>
 <20231027094610.1022114-1-equu@openmail.cc>
 <20231027094610.1022114-3-equu@openmail.cc>
Message-Id: <169840889997.2213688.2684630542885176261.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: partitions: Document special
 values
Date: Fri, 27 Oct 2023 07:16:20 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_051625_467578_A41C664C 
X-CRM114-Status: GOOD (  11.68  )
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


On Fri, 27 Oct 2023 17:46:10 +0800, Edward Chow wrote:
> Add examples for special values in linux/mtd/partitions.h.
> 
> Signed-off-by: Edward Chow <equu@openmail.cc>
> ---
>  .../mtd/partitions/fixed-partitions.yaml      | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.example.dtb: calibration@2: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.example.dtb: calibration@2: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231027094610.1022114-3-equu@openmail.cc

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
