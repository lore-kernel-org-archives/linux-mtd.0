Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CD4C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:31:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3777610FB
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3777610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLOoTVc2f9H7OREmzOPdkRQzaLZb/OyByUZJbIewi8Q=; b=m8Vtsgh0k3BSiB6lL1DEp8yeHA
	aIbwn4dBVn4G7rN3nkq0dO0lNwyJZ0tveTRuX+5JAGQlVUUIb1sZvG0bCkPAzjY78/PddCalayRlz
	FfR28oo7+Ou4drISoPCQ0JcZSrRJdDLuW4UDtEKccZ4GiB1AXgH0kwL2dzj866kH2MkR9gyfztnTk
	RuJgaGyae59UJWJ0fVnn8SJ6ZEACI2R4Ycbp68Uzr948GE/pcoh89Mx9zNf+5/VDZtt0hLMQec2V4
	ttSndRmk1nbokR/1rsLQb7GZtQ1vGp8fS1qsRDLG2iB7sGFnWkCoJzENnBpCrvRtF9ppPPj2KAyAI
	ZMhLFMfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTEL-0034zg-3z; Fri, 16 Apr 2021 18:30:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTEH-0034z5-Ky
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 18:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7ik3lAidwtHhkf3Xyj/o6l3nqO/bT8lkQxD5nRQd/OU=; b=j8Nfr3jW6crkTxapnz3PdHNuNw
 cmI60zy8Qw945OQkEHZbQhr/yyhBNlQz5NrkTtum4/+swOl4ndUVUquf0slCT1xxntdmI8z8L/+zV
 J4KA/yNfb1VyDq9mjatDg8DuFTwlZhMUuhjRdwiqU5oVCTlge2E/T7sT5IJpG/mVH24PS+kt9GTpP
 R4UYIIabK8lnzLlR1D+xM7WuHf3qPiRIIkLQjJwY+eU01sqIQdrWCdoQKywMakKRQU9JcBa0yBKBD
 ZtELIlOxenzFh5wycfh3oTDFujAUkWDSbrytfrhr9ofb6rY8QgZ1vYDz44ck6hk7ebCQj3ErllJ65
 cUk1m+rg==;
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTEC-009cs0-H1
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 18:30:08 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 5-20020a9d09050000b029029432d8d8c5so641675otp.11
 for <linux-mtd@lists.infradead.org>; Fri, 16 Apr 2021 11:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=7ik3lAidwtHhkf3Xyj/o6l3nqO/bT8lkQxD5nRQd/OU=;
 b=lz0ujpGsvHm3VRkCUjsuhi1eZjefanq4cGl7CS/Sqy33r/tWoDaFhmQcXBe54GqgNV
 F0g29ORS8xUKU5He5LrI+hp++myrZRp5MfNeIhoPyZNwZ2+/fYsDn1itqD/G4bZUfMZm
 eNM5zG/1I67E/8CdUlrKmFjmoidq4XJhMe9BOTxzZiAxKntp26fbp6APgMi7VYgxIuN0
 M/4dzyEDwe2fArKhCP1ISSz4HCWj//iWeeiXxgRS7cbp1YCKVCId5OZjNyM2oJMams9m
 +jZ6v7uQb/C3OKoAm2ulYODjI6H5sWEDdv8E6SHZ040Y7qFvDXSTnhjsY2twRrbbSeH8
 p36Q==
X-Gm-Message-State: AOAM5332wavUPBr4lg5KoNuTWwtONWeNcRWzo1kBiYJIDeLYDjAVXZQr
 Nb7XNNcIDVyUdevM1pRIiQ==
X-Google-Smtp-Source: ABdhPJyaDUF531HINEkRNssuyylOYZJ7EjNyx/ySlLTGLQp/KWESkd5iadSSQJqG3VD/Utr1tGu1xw==
X-Received: by 2002:a9d:30c6:: with SMTP id r6mr4697946otg.270.1618597803154; 
 Fri, 16 Apr 2021 11:30:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s131sm1480363oib.14.2021.04.16.11.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:30:02 -0700 (PDT)
Received: (nullmailer pid 3708339 invoked by uid 1000);
 Fri, 16 Apr 2021 18:30:01 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>
In-Reply-To: <20210416114928.27758-4-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
 <20210416114928.27758-4-michael@walle.cc>
Subject: Re: [PATCH 3/5] dt-bindings: mtd: add OTP bindings
Date: Fri, 16 Apr 2021 13:30:01 -0500
Message-Id: <1618597801.604723.3708338.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_113004_588681_49A16393 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, 16 Apr 2021 13:49:26 +0200, Michael Walle wrote:
> Flash devices can have one-time-programmable regions. Add a nvmem
> binding so they can be used as a nvmem provider.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since RFC:
>  - added missing "$"
>  - dropped first example
>  - use real device compatibles
> 
>    Please note, that this will lead to an error without patch 4/5, which
>    introduces that property for the jedec,spi-nor. Should I keep it
>    seperate or should I squash that patch into this one?
> 
>  .../devicetree/bindings/mtd/mtd.yaml          | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/mtd.example.dt.yaml: flash@0: 'otp-1', 'otp-2' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

See https://patchwork.ozlabs.org/patch/1467024

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
