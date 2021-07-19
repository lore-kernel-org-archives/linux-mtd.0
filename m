Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2254BC07E9B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 13:50:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E906108B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 13:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E906108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMm9CP7XWt50x8uZPUo6hEFA4/RupaGQiRlYBAvwXFY=; b=IPVUzxsEbAidAu
	wPzECM02vgZFa2hZEH4mJ8RyvTpYXnzNE+lKL7GuYVncRbYkFHVcGCIaKrLBehnELjCRz+NUajFJ3
	meoTMpek+2jBLRs5j651ex+lqd84bPNhLVieRvgvaLlM+k1v6mYTKiDqFLoU5sJDuvauzHcafPhaq
	a/ZO1BS1hede6FOuslGGLiJOtysvypo/Yr3yf90erPZDPo+KZ5cRw8g7XghE309DDrjDo7cLfDL44
	/Umw0h/jiJ9I5apsc/LIJ+W1q7QdcMsMdjgAjOYyKXZIA6Zgv2CmmIFbL/brfyc+ieHl05yq18IDJ
	00gX7Dgxk+isBeRMMt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5TdS-009n66-Ir; Mon, 19 Jul 2021 13:48:42 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Tce-009moY-I0
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 13:47:54 +0000
Received: by mail-io1-f48.google.com with SMTP id z9so19939006iob.8
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 06:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=nB7ZbOI4FSqOXAkmTXEXRF7DouorW1hBCYJ08VwaO2s=;
 b=A4ZruBls6/hKkXD2RjecQAr0Kd8PKe5Do1mVkTmN025uEHvuUxS9YPfhlzQ/gozzrg
 YZvozce1Udzwo1W5BibyeZaS2vz19RrhDHRl6HQrSJwqWpmpUi3oXYcvlWaidz7G0l1p
 x+CZ0fJ2j6IgySs7tzTv2dszSQ1ekbpxCVCyf95CgGU3Frvcw8ZPrBqpjbyY7zYB84ML
 pfbKhGM8bRTkyYHNSrwTKWi46KZqr4yKBu5XaEprr7MGDAHROS9Fb8e4EE+MniH/Gaqj
 NGrIhWytuFTMCh0YmP7bij5LH93wu5jiVR7JQ+l0CK0vNhRnhNlH33lm2CQy9hQqOQgv
 N81Q==
X-Gm-Message-State: AOAM530RccayRnboeJ9/G0K3gjTm2+SuM3LrzHyJPSxEvYfNWEFtMcLd
 5wxoyltN3gBPvNo9z9x69Q==
X-Google-Smtp-Source: ABdhPJwl5Zs9DRWfyfq3WglySNJdiDOiGOS0fbLkd5bzj2ohOzH+U0VYjM83iptp+U9oi5SI107XyQ==
X-Received: by 2002:a05:6602:10e:: with SMTP id
 s14mr19479252iot.52.1626702472026; 
 Mon, 19 Jul 2021 06:47:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m1sm10882067iok.33.2021.07.19.06.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 06:47:51 -0700 (PDT)
Received: (nullmailer pid 1811204 invoked by uid 1000);
 Mon, 19 Jul 2021 13:47:28 -0000
From: Rob Herring <robh@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210718004125.733-1-a-nandan@ti.com>
References: <20210718004125.733-1-a-nandan@ti.com>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nand: Convert to DT schema format
Date: Mon, 19 Jul 2021 07:47:28 -0600
Message-Id: <1626702448.437777.1811203.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_064752_683733_E10A09DB 
X-CRM114-Status: GOOD (  13.66  )
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

On Sun, 18 Jul 2021 00:41:25 +0000, Apurva Nandan wrote:
> Convert spi-nand.txt binding to YAML format with an added example.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>  .../devicetree/bindings/mtd/spi-nand.yaml     | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml: spi-flash@1: $nodename:0: 'spi-flash@1' does not match '^flash(@.*)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/spi-nand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml: spi-flash@1: 'rx-sample-delay-ns' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/spi-nand.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1506558

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
