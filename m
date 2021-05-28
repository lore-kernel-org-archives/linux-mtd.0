Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B21C4708C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 16:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81313613D4
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 16:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81313613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z16TYf/e8DMFgCJSD4sGPp4DkQwj0IHblDwRitdDfOY=; b=4UyzkUIWeFU1G8
	pDTrP1LMt1yzTXezLXdyXbMz4IKjcurbOlhbKTbb8Pl58lOeqXFzDUtu4GoTXbzxvYWgDIILd16kE
	Rg18LGY6dW3jtr+vigo5xVM9+biVGS+M/vm7zR4DSo5BAM3+NXhayxKW77eXfV0LWXR69ZpZaXf0Y
	04ARikT/4J0f3hfollhqDIH1DYN9RiKVHiJK5uOK7cB5dE4pS8SW3THiWAVriey7SA5za4w0qgrIr
	g3SI4fDs6tbA3sd0ku8yMVOy6htRGyUC1aRR7Iuqe+2wM3Gu2OsdQalbFNS6Awqfk9ETKJVk9YQjN
	HT6Dul9zRQCKk58EOmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmfFI-00GxFO-Fo; Fri, 28 May 2021 16:22:00 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmfFE-00GxAx-NK
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 16:21:58 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so1059145ool.1
 for <linux-mtd@lists.infradead.org>; Fri, 28 May 2021 09:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eOXPQ48/DXVLMOpoDbToX5Y11nDnIWdQtOvWb3iJBV8=;
 b=GBO2VbuPC0aYQqf4VB2yGqwW9GHNacgoS8YpIeOQyMGqPLXh/oT+LQFck/aDf5MFJR
 JlasP3rumUu9HRO5UFYXRnWJCACXj2uO++bFLntABjZ4IYfL+kpBzO2vV82vhW89vYEY
 mc+gBogOlhShRjddjgJXJyiQVS+ILpOwQHynD3JkMIl6T2upc1c37dnT7zmNJvxu8L7R
 PGdJemKpJPO28LlhchlA3XI6ULacQVTbXRGfpvpm2gJnuf/XXnStepwRiJhodFdzx/m7
 Cf74l5rjQq/jzeuDsk4V2wsltS4bPH/L4C11XVbkY4UEP1jRBqGu1VshQ+gwHL7r7Gwq
 A6lA==
X-Gm-Message-State: AOAM530Clpu9RGsZwe1vHpwHjSsstejCQojDuBE6kvW2msC1Elu5s65p
 vPwUQ9iSbMokNPGCwiBjoJcMJ7SxlA==
X-Google-Smtp-Source: ABdhPJyPlDwwdt8cwOPHjYqDx51qPFnU39rXzfFZt4NHP1klQ0MpX6ssBEjK1u5zsW02weskmbzdmQ==
X-Received: by 2002:a4a:b4cd:: with SMTP id g13mr7530007ooo.4.1622218913320;
 Fri, 28 May 2021 09:21:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l23sm1202791oie.52.2021.05.28.09.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 09:21:51 -0700 (PDT)
Received: (nullmailer pid 3720613 invoked by uid 1000);
 Fri, 28 May 2021 16:21:50 -0000
From: Rob Herring <robh@kernel.org>
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
In-Reply-To: <20210528072351.1639575-2-hs@denx.de>
References: <20210528072351.1639575-1-hs@denx.de>
 <20210528072351.1639575-2-hs@denx.de>
Subject: Re: [PATCH v1 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
Date: Fri, 28 May 2021 11:21:50 -0500
Message-Id: <1622218910.743539.3720612.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_092156_802345_F044E481 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, 28 May 2021 09:23:50 +0200, Heiko Schocher wrote:
> The Microchip 48l640 is a 8KByte EERAM connected via SPI.
> Add devicetree bindings documentation.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
> I must admit that I created the file
> 
> Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> 
> by hand, looking into other yaml files...
> 
> Is there a way to check such a file to its correctness?
> 
>  .../bindings/mtd/microchip,mchp48l640.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 33, in check_doc
    for error in sorted(dtschema.DTValidator.iter_schema_errors(testtree), key=lambda e: e.linecol):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 723, in iter_schema_errors
    meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
KeyError: '$schema'
make[1]: *** Deleting file 'Documentation/devicetree/bindings/processed-schema-examples.json'
Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 38, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 587, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 568, in process_schema
    DTValidator.check_schema(schema)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 738, in check_schema
    meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
KeyError: '$schema'
make[1]: *** [Documentation/devicetree/bindings/Makefile:62: Documentation/devicetree/bindings/processed-schema-examples.json] Error 1
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1485038

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
