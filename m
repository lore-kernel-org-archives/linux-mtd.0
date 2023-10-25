Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9A4C0032E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwnQgFMUIxn5Tsae6BeZdFhdEw0VPky+Zzg83f0SaEU=; b=vRkKn5lML0sFtq
	iHp+R/Cm8ClVszrU0yx393cx3BWPcT7UeXYy24SOEmeQC8kkRvYBfZ7NMamUniWvdJSTxdzynu7Kv
	NyV1y5PIkRwiWux3i018zGuogiyIsNLf2DmSrFxFaQ66aR6IKNNlnDhTFZbAfaPGRnoE1fj3cSzdl
	IojdFutZXpMI+PdxJpSTHkM1hkrh62lfrjyClexh2Pa3e8CDWtQLB1YfVLulIT3YHY/5S4ttq4koF
	htKdaz40LeyORUUvmDlL08SQb3yFip8FH/fuJKFxM9Cb4vLRQG3Yl1zPupKGVzNB0Rpy4qVESZfuu
	2B/jIfJDv6QA26dusONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvd4O-00CJhF-1m;
	Wed, 25 Oct 2023 12:33:08 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvd4L-00CJgr-0R
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 12:33:06 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b2e72fe47fso3736590b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 05:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698237184; x=1698841984;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8CPemYXBUDg57/WVb4vOz03sRB1TRQWESGKykqWrHzg=;
        b=HD3AuM/USDPigEKnjyXPHRrK1aSvn38+ZXa7XUpMgMCDIJaSrOGwYgu9Sjl11etnxA
         XBE3KhLXKPRTca5iykbsODKSurh6LhnMla3xEzlFmIeALryKfqwXiws4ppJqWqpCXufU
         GiJJpZiA8KuT+kdr5E0pgPbcsqM+RLV5zD1PCvavSStUZC1v9GmTH1wTIwIEhLzJ5GaN
         SM7C+VNYyJYhVCPlE/KdnsegT5PVDCBowXq/gGk/L9fDkho3qN4Ip5RjXcgbjtuKiQZt
         sqBO/j3deRly3MXYkbgAuMZSWzw9zpCSjlsnxwpmPZmR605kMSrFBKRiNuuhqOSqAJNR
         biLA==
X-Gm-Message-State: AOJu0YznhxQPmo/Qg8GWcFGoXlwb8UZUxFInK6tgtewLpdivktWCDX94
	wHokzsT/LThjif+c884mKw==
X-Google-Smtp-Source: AGHT+IGFRmvPp4komL3PmPB+n4EaJxfBNyiGvm6AYFq8mhHjHNqEKyiOmK8UKYdLkHWzvM0ogmXGug==
X-Received: by 2002:a54:4581:0:b0:3a8:ccf0:103f with SMTP id z1-20020a544581000000b003a8ccf0103fmr16717681oib.3.1698237184122;
        Wed, 25 Oct 2023 05:33:04 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n12-20020aca240c000000b003afe584ed4fsm2356547oic.42.2023.10.25.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 05:33:03 -0700 (PDT)
Received: (nullmailer pid 3559498 invoked by uid 1000);
	Wed, 25 Oct 2023 12:33:02 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Edward Chow <equu@openmail.cc>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20231025052937.830813-1-equu@openmail.cc>
References: <20231025052937.830813-1-equu@openmail.cc>
Message-Id: <169823714202.3554834.10341623302238023195.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd-partitions: Export special values
Date: Wed, 25 Oct 2023 07:33:02 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_053305_173164_6AD268BE 
X-CRM114-Status: GOOD (  21.85  )
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


On Wed, 25 Oct 2023 13:29:37 +0800, Edward Chow wrote:
> There are special "offset" and "size" values defined and documented in
> linux/mtd/partitions.h:
> 
> // consume as much as possible, leaving size after the end of partition.
> 
> // the partition will start at the next erase block.
> 
> // the partition will start where the previous one ended.
> 
> (Though not explicitly, they are compared against variables in uint64_t
> in drivers/mtd/mtdpart.c, so they had better be considered as such.)
> 
> // the partition will extend to the end of the master MTD device.
> 
> These special values could be used to define partitions automatically
> fitting to the size of the master MTD device at runtime.
> 
> However, these values used not to be exported to dt-bindings, thus
> seldom used before, since they might have been only used in numeric form,
> such as "(-1) (-3)" for MTDPART_OFS_RETAIN.
> 
> Now, they are exported in dt-bindings/mtd/partitions.h as 32-bit cell
> values, so 2-cell addressed should be defined to use special offset values,
> such as "MTDPART_OFS_SPECIAL MTDPART_OFS_RETAIN" for MTDPART_OFS_RETAIN in
> linux/mtd/partitions.h. An example is added to fixed-partitions.yaml.
> 
> Signed-off-by: Edward Chow <equu@openmail.cc>
> ---
>  .../mtd/partitions/fixed-partitions.yaml      | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  2 ++
>  include/dt-bindings/mtd/partitions.h          | 15 ++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 include/dt-bindings/mtd/partitions.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.example.dts:225.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231025052937.830813-1-equu@openmail.cc

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
