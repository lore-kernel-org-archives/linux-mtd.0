Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01E6C5DF62
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 03:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnHl3lWQ38Alt5/xYFkB3RSQcoKbPQ/qaKcFfBdRz+w=; b=08vkWPRzc9tx01yMrQOJRK5xaO
	uIPbai68CxY7fa3ny4ofMWIP0CphHOrhz7Y5/X+PSVIZzIBQj9hx6TFArzF422NLQd0b9MoWH7fJ9
	5Qcy7pR0veCzpsXrzfZ4hlXRDcZayHW5n2oTv8NiHU92uMazCP3fFrl3IXORrRdjTVOW4JOhENjZn
	/8stFWruZcj7//CmmXkSU/bsj9j2SNpVrkjHAmaKBe6frgulHjSLlJfsfoOCNlAf2y7rXoIRkKpVm
	lwTZ1/qP3k/QLPYlIsD9IYy51p4QOHIfzLixkhQhx3dZ07UfHAqblngnMpYP1DhMLYQSSOMLzoQ1t
	5hIP86rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCZ0G-00A2b3-IJ; Wed, 26 Jan 2022 03:29:48 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCYzv-00A2V2-0c; Wed, 26 Jan 2022 03:29:28 +0000
Received: by mail-oi1-f169.google.com with SMTP id w133so8270003oie.7;
 Tue, 25 Jan 2022 19:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DWroU9v+B0oJUaHbfVpIph6/oG0k3TQn8iAd7iCA4ZI=;
 b=fwcyZIJsoYGtyh+BkaTxaPD3iYooIEgA7o2QiBibvn1vSTdzRzRBkd066YH6cCfP+k
 0uCsnzFq7q0+x2mciG4HCf26p9NkEQscanKak+aEEDaBBUVf9xcUCgtjV7a/ZOR8Exfu
 I09gYnjxGt7T8FxNbIac3bScyPIYdXHhvHhHUhU3GAgumuFVwfpv602JYMPgnGLIqSsn
 bTaq/1P237asrBNkDGm4PH9LP7QZCQvzU2iYD6tfYppMutpcEhVE2rMJoByPbVH+ZS3D
 1eBKOmbFikzo1qqCaqIsy5SIxFOVt5SJAMDWY1bjeZayn5+tSFQQohHWscigOWTdFrhu
 iN6w==
X-Gm-Message-State: AOAM532T26fBFS7BPwme2eSwfY5bvxJHMW56+uvWP9xnJVsSKCdVWFvk
 MbCrhlOZAaIcgMKbfqnWvg==
X-Google-Smtp-Source: ABdhPJz0v3qCcz93L/KdRR5wO7FXg9UY5oeER2ADrIk1PCOqzkwXMlAYT9z1NgvpSBjcJoKGffRl5w==
X-Received: by 2002:a05:6808:150b:: with SMTP id
 u11mr536058oiw.211.1643167765208; 
 Tue, 25 Jan 2022 19:29:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w7sm6859202oou.13.2022.01.25.19.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 19:29:24 -0800 (PST)
Received: (nullmailer pid 3724358 invoked by uid 1000);
 Wed, 26 Jan 2022 03:29:18 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-mtd@lists.infradead.org,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frank Rowand <frowand.list@gmail.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Ansuel Smith <ansuelsmth@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Li Yang <leoyang.li@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220125180114.12286-3-zajec5@gmail.com>
References: <20220125180114.12286-1-zajec5@gmail.com>
 <20220125180114.12286-3-zajec5@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: nvmem: cells: add MAC address cell
Date: Tue, 25 Jan 2022 21:29:18 -0600
Message-Id: <1643167758.854851.3724357.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_192927_107999_084AB2CC 
X-CRM114-Status: GOOD (  15.36  )
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
Content-Type: multipart/mixed; boundary="===============2452101856920066411=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2452101856920066411==
Content-Type: text/plain

On Tue, 25 Jan 2022 19:01:14 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This adds support for describing details of NVMEM cell containing MAC
> address. Those are often device specific and could be nicely stored in
> DT.
> 
> Initial documentation includes support for describing:
> 1. Cell data format (e.g. Broadcom's NVRAM uses ASCII to store MAC)
> 2. Reversed bytes flash (required for i.MX6/i.MX7 OCOTP support)
> 3. Source for multiple addresses (very common in home routers)
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/nvmem/cells/mac-address.yaml     | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/cells/mac-address.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/nvmem/cells/cell.yaml: ignoring, error parsing file
make[1]: *** Deleting file 'Documentation/devicetree/bindings/nvmem/cells/mac-address.example.dt.yaml'
schemas/nvmem/cells/cell.yaml: ignoring, error parsing file
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 170, in <module>
    sg.check_trees(filename, testtree)
  File "/usr/local/bin/dt-validate", line 119, in check_trees
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  [Previous line repeated 1 more time]
  File "/usr/local/bin/dt-validate", line 105, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/bin/dt-validate", line 49, in check_node
    errors = sorted(dtschema.DTValidator(schema).iter_errors(node), key=lambda e: e.linecol)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 771, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 229, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 362, in allOf
    yield from validator.descend(instance, subschema, schema_path=index)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 245, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 771, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 229, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 298, in ref
    yield from validator.descend(instance, resolved)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 245, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 771, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 219, in iter_errors
    scope = id_of(_schema)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 96, in _id_of
    return schema.get("$id", "")
AttributeError: 'NoneType' object has no attribute 'get'
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/nvmem/cells/mac-address.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1584227

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============2452101856920066411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2452101856920066411==--
