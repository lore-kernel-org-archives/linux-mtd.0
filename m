Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A2C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Nov 2021 23:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/XYxwiyvquhq58b9bJNOZsM+P3nHBZdGYAy6FT0IlA=; b=DcJh1GTZ/M9EyO
	GXgqcq0DZcZTOb1u2/ym55bOgCXMsFiG3GsVwEQZ8Yx+dh3GVovBXWOEn/yJs4gNjchfc+zZ7cVRe
	fqkQT8fL1ngwxNSs880Bph+Zm+PYB113f9GRaHBzGM0UdgNb0RR/yoc9NJCn/QjeXJ/ZQ/aaGAiBi
	JgIivqGcx6Z2de5bOK0y6U7nyGqEEeOtDilJ6Hyrv7dw59Q2KZM5uCTySGmZd+0wRlEyrTg0lBVY7
	OfNl2Fvyf9a/Hq/vR824FLsMK5O2mkkzUxTEmUZxKpkdgukudYJ98GdUGpDl0b2ICM+wvqGWYf2we
	rjlxE9nq1p2t7P1ScJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr6t9-00EbhA-N7; Sat, 27 Nov 2021 23:13:47 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr6t0-00Ebgg-Gq
 for linux-mtd@lists.infradead.org; Sat, 27 Nov 2021 23:13:39 +0000
Received: by mail-oi1-f182.google.com with SMTP id be32so26395975oib.11
 for <linux-mtd@lists.infradead.org>; Sat, 27 Nov 2021 15:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=NHj7bPxI6fq1N93RbHviuq859RaSpvvAa3Q1mOwEKtc=;
 b=ns3Q85+Xbn+EpSTmvceZ8mrvrrJIQLomFEZ/qC5RNx4ln+H9zoZ8SqOBYMpHHhz15m
 tWYjkEQcPc3Jvm3todLkHmJVhrMQ7RaHuKrWQ0N8PcaiqPST1z34naObYO/myTWqwsf/
 btWr4Bu9kWO0YrEhUL2qGkL0Ilrm8WpP+dHjsXP7fGrghBj/Yuqz7RQXMHmCMIh0el9f
 e3VcW8pA0ZtZa/80U0cDqq+NMn4o87JC3gOu9TVPrcUCWLkvgnJKPHrYHjmDD8QQAgk5
 GdEPUcpvfZ60gTLw9dp//EPk+2O4/dxBSZgapoMK6g0BhgWBkvc9QlXCYdFXuxVl9tUP
 +zvg==
X-Gm-Message-State: AOAM532PdbmWIRW65scZ7hixo2XeW4JVy3FfnE9//oRXl+2EAvmS9D8Q
 zffjwHmW3MdNashWwSfu6w==
X-Google-Smtp-Source: ABdhPJwAYQLRS1w5wIjJjByV/RMDaS4Nmwr980kCT4ajWNcu05VSEMfU6uzQlEU5RDZEhtt577Vmkg==
X-Received: by 2002:a05:6808:44:: with SMTP id
 v4mr31905725oic.123.1638054817351; 
 Sat, 27 Nov 2021 15:13:37 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e14sm1696635oow.3.2021.11.27.15.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 15:13:36 -0800 (PST)
Received: (nullmailer pid 1973543 invoked by uid 1000);
 Sat, 27 Nov 2021 23:13:22 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>
In-Reply-To: <20211126163450.394861-6-miquel.raynal@bootlin.com>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-6-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 5/5] spi: dt-bindings: Add an example with two stacked
 flashes
Date: Sat, 27 Nov 2021 16:13:22 -0700
Message-Id: <1638054802.100671.1973542.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_151338_579282_3DA10E68 
X-CRM114-Status: GOOD (  11.71  )
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

On Fri, 26 Nov 2021 17:34:50 +0100, Miquel Raynal wrote:
> Provide an example of how to describe two flashes in eg. stacked mode.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/spi-controller.example.dts:40.23-45.15: Warning (spi_bus_reg): /example-0/spi@80010000/flash@2,3: SPI bus unit address format error, expected "2"

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1560255

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
