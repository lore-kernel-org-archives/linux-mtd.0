Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BC3ECAAA3
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Aug 2022 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCRUWFf270xDFjWoGF6RF6F2Nj138/DMNw8Rd5uAyiw=; b=bwOapJSP+8PuoZ
	IYwxLZcWD56OopgG4utNgrSYd5NglPFGF5EzliEhFARGuQRly5QYXwJvBRCo+3flzwFizDSOMPVHq
	7aWqzN28I42mjIyqnZsqATc8EB6d2vHI0V2T/hJzcfCnaXO7Gnu/3kmBoLauW2FdABZjU+US5AkFp
	/uLiAUS27HpKCOkApNpcg4U6EA2wr4hlpsqyJ3egbPgnDG/p+D275tlEFmt8GZ9TEMmhLDvmgSKTX
	tB4Mva8uFuIthYWAawoYPIhrxTHWGcP2b8EoO4VfVnQbUTa/RzTRsRtq6KWEYz2HSG+DS1fkVKj6O
	TwGKr8awwwiV20AISNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbqG-007eXF-7z; Fri, 26 Aug 2022 16:05:56 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbq1-007eB1-Fo; Fri, 26 Aug 2022 16:05:43 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-11d2dcc31dbso2593877fac.7;
        Fri, 26 Aug 2022 09:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=Bt46CA3gkhtjHQtX98/khRB3Yq8EzK753ZbUa2Xb1R4=;
        b=oBY9YXEUS83g1bUU/0IGnWupGPOjgJT6oH+iYdAuBblbpKaGxxkECEZIfXCum8vWT6
         2mcHxfg7k+PfCPynGzCajvPJyFoVwIWjL7EN/q5XR2yj6eCO1oVZWOvtRJyxXaat/ans
         y7LoAsWPT95m8E6S/FXNgwc5ihJOA2Xgs7dQwp1f87KsJfprz3esRvBjdGEmcRwJM0xT
         cseN+C6q/wY2E8rm6wvU3DaslqsqVYU5kgssrGhi1XBaPicXJCsCtK/WpOwRrBG3CfH3
         uv2oTJkzCZ/E9Z80TlQZ8Da3zQmm8Xvx1/lzf4EOvperzRSekSkNy5YquSV6iPoA5j7L
         r7oQ==
X-Gm-Message-State: ACgBeo3qs2dyAZJtcB1E8vYvbPoiPsF5Zo9QoQBHZ3ERwHRKpha9jTxB
	M5T7kHXXXTOC6UcQFPcQSg==
X-Google-Smtp-Source: AA6agR5qo/Htznv740wYaz6ZBJU7DWuY9xkifeqYbjUccJ1C8uL4cnUGayiUfnbXUI+6wiQlGYSgNw==
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id n4-20020a056870348400b0011e44653d9bmr2311584oah.46.1661529939549;
        Fri, 26 Aug 2022 09:05:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y16-20020a056870429000b0010bf07976c9sm1465908oah.41.2022.08.26.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 09:05:39 -0700 (PDT)
Received: (nullmailer pid 3267073 invoked by uid 1000);
	Fri, 26 Aug 2022 16:05:31 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-arm-kernel@lists.infradead.org, =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20220825214423.903672-10-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc> <20220825214423.903672-10-michael@walle.cc>
Subject: Re: [PATCH v1 09/14] dt-bindings: nvmem: add YAML schema for the sl28 vpd layout
Date: Fri, 26 Aug 2022 11:05:31 -0500
Message-Id: <1661529931.067130.3267072.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_090541_546342_87E56B13 
X-CRM114-Status: GOOD (  12.11  )
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

On Thu, 25 Aug 2022 23:44:18 +0200, Michael Walle wrote:
> Add a schema for the NVMEM layout on Kontron's sl28 boards.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/mtd.example.dtb: otp-2: compatible:0: 'kontron,sl28-vpd' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/mtd.example.dtb: otp-2: compatible: ['user-otp'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/mtd.example.dtb: otp-2: '#address-cells', '#size-cells', 'mac-address@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

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
