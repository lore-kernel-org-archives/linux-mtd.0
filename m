Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92A6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Hy9Ip0GYr3Dn3NIRoRK3YTe/BemsdsNuqo5iPBMmus=; b=rma2WThgxCn5+llyyxIuXS0rKe
	OVDOgWqo7OaXMYFMRC/US059eQSHvh4sce0JKu+iifLIlzL1j3Q5Ri2soaSZ8htF9h2T3UvGb521c
	JsiZ1aKeZfLsUqu4cZAA2QlpyPcs7W3k//Y4gj+JjAgFSbjupsL4y6iGo7Mx2RV2pSCYDmiMP4X1o
	ndM2NqC6IzJprkkXPIJRZzrdt/7LQ15f5nr6kWqDg8JMC7Vr//Q/gAKXtBhLAppG8DrL5mCgrmD10
	5Qf1nsx6RUjIj9dNpWdwehqJAVA2uAIuet4F9nNpqxqTzBWEmRwY+A7wdFL1zoNrrO9mzfzwA4ZZr
	FodlnpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK3pG-004PWy-92; Tue, 15 Feb 2022 19:49:26 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3pC-004PUZ-EJ; Tue, 15 Feb 2022 19:49:24 +0000
Received: by mail-io1-f52.google.com with SMTP id h5so1576185ioj.3;
 Tue, 15 Feb 2022 11:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=KXSZwObXwXhyqBUgs8Dj2mGzNepAgJtQoKeKbytKAUc=;
 b=jSJuKIov59fmf7zwG9ohe2i2cRB4Slboy8SZkT92Flc3rIgU0vgbhpDPMe8RIr367o
 oA/WWOEVh2yQTR6ZMDwstx0Zuo/CUleZfu3cOxBNWjYEipRvremp8gOhh74nuFZlLKOH
 AhUkMMLy+sw0q1Z+qn5FwlTgyo9hf2tahPyf1nf9vTls8eXzmcsvZkUsFE6Lf8wELLPh
 1g0z4egUSM0gyG6lNkFHk9/3HZaV7mFDvmMlb+sBpU6HkRBWgXWUAWgxU5VlfTFt+Z5l
 od0RlxahIP2sH5XmnkLAQeEhyaibxmokml7yiIPv4YuImF5DIeMuCkoWIyUH1rg3YVjP
 PSug==
X-Gm-Message-State: AOAM531rarUa7tHrT2YgWOWc2ShRiMqEwivBAyVnX+Wx19v04fWD3DoR
 tMJ+tfj3aI1I4XKxYh5psA==
X-Google-Smtp-Source: ABdhPJw4dH7aOt4PpzLwO7VCfIbho2N2cLTRW+nmzH1+8BgDGfbcmPlRXiw84CD6uvuop7GaxBvJ4Q==
X-Received: by 2002:a05:6638:37a1:: with SMTP id
 w33mr301609jal.73.1644954560908; 
 Tue, 15 Feb 2022 11:49:20 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h12sm6014113ild.44.2022.02.15.11.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:49:20 -0800 (PST)
Received: (nullmailer pid 3813672 invoked by uid 1000);
 Tue, 15 Feb 2022 19:49:18 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Pratyush Yadav <p.yadav@ti.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org
In-Reply-To: <20220214094231.3753686-3-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-3-clg@kaod.org>
Subject: Re: [PATCH 02/10] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Tue, 15 Feb 2022 13:49:18 -0600
Message-Id: <1644954558.088844.3813671.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_114922_521140_ECB7FC6F 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: multipart/mixed; boundary="===============3617279867956677703=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3617279867956677703==
Content-Type: text/plain

On Mon, 14 Feb 2022 10:42:23 +0100, Cédric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dt.yaml: example-0: spi@1e620000:reg:0: [509739008, 196, 536870912, 268435456] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dt.yaml: spi@1e620000: reg: [[509739008, 196, 536870912, 268435456]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1592369

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============3617279867956677703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3617279867956677703==--
