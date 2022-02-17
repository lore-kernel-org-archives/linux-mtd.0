Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CBFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 04:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSldMYkNl0G8oUiBECNz5c26jlTG9gEaY8uoTviQYbM=; b=vpGeOrwlJcxxaNXEZzVCx/MUxk
	YDIQQfG0I0bI5gH0LMxSjCHqa/2tJ1mpTSREg+qgCBFJQ2i/IdJB9P9xF4DMYNcjQBb78xqKAFBKp
	DkS4TocJs7lPTqVusOKnFGEUBJS7A+B6b/J9tHdxP3+vpTWAXsDmUmI/UzW8oheCdtHqUSItWo0sP
	RRnnGXkOnnZ6nLaeZ/ZTdqcRUKJySv6YnN1tQ82UpfnL2NXR8upMfLQtdF3JkCfiGyyM9jdhNrm3x
	6WoSralghiIlwuhKQn+w77ctWRJ5gGRPUkdSWE55MIq8weZW1twU7l+uHDEg008+rf8eazOkVCy7o
	sO0Djmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKXx5-008sZU-GT; Thu, 17 Feb 2022 03:59:31 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKXx2-008sYq-4R
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 03:59:29 +0000
Received: by mail-il1-f179.google.com with SMTP id d7so1376837ilf.8
 for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2022 19:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QMp03JwfLrGdIz7WkJv38B9CcEHqS5vpZzWHoaVV6vI=;
 b=EQ92ZjkllTVG1/d96e8tixWNHQy01tcz35OCdEbBA/TJzDQlTE8RHASvPlcJEvBqOK
 Ie8PlBvFqA+5E2a1ETB/H0L1f/qS4H+J7616H8n3ICSW31Xot9i8n1egs7xQjui+YXFg
 Aj7cJ+gbJhxDTt8svF/FC0zigkrjRNSSDFEogAVFLycyqq6NiVwPnL/MXCcHh4UB9yZ9
 Ic2skMtNcdv2aPkVZcI0hia0MIL1LjMwXLdM6qCnRW39XsEuw+WILC1gHBUMEUWWj1mP
 XWCCp3bMIJEDGSjKsBJSzOBGuXy6Sw++TAij/I8pVPimp/50GFisFjyQXkRcLk80LwJd
 0tNw==
X-Gm-Message-State: AOAM5306CkGAmAUg3NApsdRzE9eKc6ugtVsGb2vbLhK9aZfnzHSulcNs
 /As+rjssUwI3ggK+UWXvsw==
X-Google-Smtp-Source: ABdhPJyn4QNq6duiajKRbrBRY9gv2AEW1GPnC5BSrD8R7Y3NWxxCyBiwAwR3rysON3OVY139wHnilA==
X-Received: by 2002:a92:dc44:0:b0:2bf:adaa:7a2a with SMTP id
 x4-20020a92dc44000000b002bfadaa7a2amr794786ilq.172.1645070367123; 
 Wed, 16 Feb 2022 19:59:27 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id z13sm1161054iox.21.2022.02.16.19.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:59:26 -0800 (PST)
Received: (nullmailer pid 2266019 invoked by uid 1000);
 Thu, 17 Feb 2022 03:59:23 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <20220216104126.31284-1-zajec5@gmail.com>
References: <20220216104126.31284-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: convert Broadcom's TRX to
 the json-schema
Date: Wed, 16 Feb 2022 21:59:23 -0600
Message-Id: <1645070363.930966.2266015.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_195928_201385_3E7B6753 
X-CRM114-Status: GOOD (  11.35  )
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
Content-Type: multipart/mixed; boundary="===============6259632689382730774=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6259632689382730774==
Content-Type: text/plain

On Wed, 16 Feb 2022 11:41:26 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/mtd/partitions/brcm,trx.txt      | 42 ---------------
>  .../bindings/mtd/partitions/brcm,trx.yaml     | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.example.dt.yaml: partition@200000: compatible:0: 'brcm,trx' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.example.dt.yaml: partition@200000: compatible: ['linksys,ns-firmware', 'brcm,trx'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.example.dt.yaml: partition@200000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.example.dt.yaml: partition@1100000: compatible:0: 'brcm,trx' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.example.dt.yaml: partition@1100000: compatible: ['linksys,ns-firmware', 'brcm,trx'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.example.dt.yaml: partition@1100000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.example.dt.yaml: firmware@100000: 'label', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.example.dt.yaml: firmware@100000: 'label', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1593614

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============6259632689382730774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6259632689382730774==--
