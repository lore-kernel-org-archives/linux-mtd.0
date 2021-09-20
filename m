Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF162C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 19:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5F061205
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 19:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A5F061205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YfHpLfgG15pHhtb9j8p7k5Ctf6N8RvB6q2MV1Pgn5A=; b=3gP/fFBxjEq7mf
	nSxliZUGE4/ChGLFaqOY5M/CYwU6cR3w1CsfrpQ/3ni7Vk87fcMgUBaYC3dxsZesB79IZ4i1Tek+2
	c9zh57TiASbkBd5Jr7YPolFMAsmuri8E2mBifFMLXhYh0McyPK12EvQSbkfHsukK1De+U4yauElXZ
	FVV5Ie2twOcrHsemdO8BwbloYfw2h9R/niZswzaSWQ06dI7beQ7Yoea8TQzKdKRulkTkdEbmFvAVW
	SNVtM6LWiZzXUT0lO9FLrnrsudDWH75j0kd60T/n09XOWbumbrhyOSIYBymOOLHcEwX2OhNgKc0C9
	pdS0Nk7Sb3Ju1sqWpA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSOwQ-002vCF-05; Mon, 20 Sep 2021 19:27:02 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSOwM-002vB1-ED
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 19:26:59 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 t2-20020a4ae9a2000000b0028c7144f106so6235996ood.6
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 12:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=8RDZosyarrVHJMRIOrOYWRs07UC95UsBIK16bZM00bU=;
 b=cXA9hL6wUqWbBxzCbw3Yp5iE6Zdmbq3v1JS0qTaKTPT4n6T7uqjTGUKUx3DVTi8I1s
 +lUcr+pNti4JqqYzJyRoKWX+jxmiEuX9DbHF4+iclDZ15Y7yazlZDjbCCXZ3bPeF/WNs
 zAZDYanm8Nbvuy9uupWMvRndhu/Sw88nAOZoCu9yitb3I8A8zqU4d7uVio5h+n7s7dIQ
 MNRnlkzOSxmN8thkUM7T5I62CrRr/cz+9eJVALBKjQ4en0fJ/EPte1ybld3mqszx7t3a
 nWbk3174yjubFExVjrQBrur94tQ2p1KSWOE2U1UFI/GpgAHn1G3tcwz3hyvhUH34gm3S
 rS9Q==
X-Gm-Message-State: AOAM532bkXOyXFRxJsDSGcowmXDLnP3hmIBUA9fg213xZJTW29wjtimC
 n4L7bpZ6cJcr7VHoDmEnsw==
X-Google-Smtp-Source: ABdhPJxUCxd0cnnhBxoTHwKVzXGKJSzPZe/6gN7UIs+ewnpW2DHKak1OfYaEYrgDm+4SjMcJ3aAkMw==
X-Received: by 2002:a4a:6412:: with SMTP id o18mr13727649ooc.79.1632166017034; 
 Mon, 20 Sep 2021 12:26:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bj27sm3222072oib.58.2021.09.20.12.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:26:56 -0700 (PDT)
Received: (nullmailer pid 586175 invoked by uid 1000);
 Mon, 20 Sep 2021 19:26:55 -0000
From: Rob Herring <robh@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-mtd@lists.infradead.org, michael@walle.cc, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20210920142713.129295-2-a-nandan@ti.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
Date: Mon, 20 Sep 2021 14:26:55 -0500
Message-Id: <1632166015.061759.586174.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_122658_522208_5D8474AE 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon, 20 Sep 2021 19:57:12 +0530, Apurva Nandan wrote:
> Convert spi-nand.txt binding to YAML format with an added example.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>  .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml: spi-flash@1: $nodename:0: 'spi-flash@1' does not match '^flash(@.*)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/spi-nand.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1530166

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
