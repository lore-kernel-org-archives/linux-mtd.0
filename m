Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C73C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fk3Fn6hJaBSrQfm+w49MPTNW2Gcxjb/AV7ViM+0YUA=; b=YtTMQl9nfYCkTiX5cYNPqd9aao
	VgYy934wOsccjHO6h9uw7ZxPNJEwW+M+TeC9xBtv15fRDjwWqKgr3N/YkC0O+mk/TFKXLqc90CFUI
	QzJ4lmPwfq3bmvJf2J1s07d8Vz8qABzTAYVgEm2Jup6meBFW31qsSYA6cwQZc9vfXBe9ckyizoUHs
	W6FHy+ssEvV8x7zeIwvVqww6VJLJ33TAiU/cFHuSsmYCBVsNHE1STRN95StM1m7Q3FQvnnOWtZgMQ
	oCbowuhmPHTXB6bVeHU7Qp7rtDgho0GUEh0og1J1YhZMffU3BXdZi6fPBWYVnZGx5qcK7Osi6ng8L
	lr9bIYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlY3e-001X2h-V1; Mon, 02 May 2022 15:33:55 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlY3P-001Wum-KS; Mon, 02 May 2022 15:33:44 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 c5-20020a9d75c5000000b00605ff3b9997so4754108otl.0; 
 Mon, 02 May 2022 08:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=SDazvwLtmD7iGR4/3qNdCTkP7LG5uBpWcYwGTxEc+2A=;
 b=tBC9E5ZeehfokEbZfYKqO79+ACkja5YUtH1MQrqxoN6Ow3GQywuXWPEBEFAvy/dfz6
 pEXAqPQlC0TFzUiXqIJOQ9jD3IWPzDtkfaKKM4QvV6dlrkXJp+pOGP60CRq/3/FTpY03
 t6zj8OeEBVhNz6AuRWWYHuJGiRHNKucR8FB81pvaZdcxh9J/DrJ3My57Yw8hCYPIdL9l
 zZcBP5GH7TEyM8Op8ffSVC3WYF6V2MJ2o8H5K0nFA8tXfEpsAtVs7bYXCRvky2FWeyaZ
 sCVS3aoY77aRoOlPplIFmzY8T456/rL2I3fwhleNJ/yFaNzAeQrmAh/I7oWgL/sFfKxk
 1EZw==
X-Gm-Message-State: AOAM530wiy1PLPWy8kepQJaJgWIwtWu6dL55ACteKpS4ciyVOKjUBN0G
 6nlrLUE7nkRUBwz/xPM1Cw==
X-Google-Smtp-Source: ABdhPJyxhjWaL+KKrChyj8rFPZzTPAip2KUS5CJwmjTl5l+jgv7N6SL8bT0V7zetu7j4JXX4QkkOKg==
X-Received: by 2002:a9d:491c:0:b0:605:c207:1f6b with SMTP id
 e28-20020a9d491c000000b00605c2071f6bmr4416443otf.41.1651505617521; 
 Mon, 02 May 2022 08:33:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a11-20020a4a9b0b000000b0035ec65ac944sm3482696ook.16.2022.05.02.08.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:33:37 -0700 (PDT)
Received: (nullmailer pid 1161769 invoked by uid 1000);
 Mon, 02 May 2022 15:33:29 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-kernel@vger.kernel.org, Tao Ren <rentao.bupt@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
In-Reply-To: <20220502081341.203369-3-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
 <20220502081341.203369-3-clg@kaod.org>
Subject: Re: [PATCH v5 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Date: Mon, 02 May 2022 10:33:29 -0500
Message-Id: <1651505609.452113.1161768.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_083339_708878_09FB63CE 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Type: multipart/mixed; boundary="===============3441870265772484049=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3441870265772484049==
Content-Type: text/plain

On Mon, 02 May 2022 10:13:32 +0200, Cédric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>
> Tested-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml:62:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 52, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 49, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 62, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml:  while scanning a block scalar
  in "<unicode string>", line 49, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 62, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml: ignoring, error parsing file
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============3441870265772484049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3441870265772484049==--
