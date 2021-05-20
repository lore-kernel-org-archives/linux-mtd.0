Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273C4C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 00:19:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C1B3610CD
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 00:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C1B3610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppMTMMv85No/JfTV8NG2DMMmIaAki4qCWnMqEO6FX3U=; b=CCgKFu7JWcrv2YKTq1nDzqmA0n
	7QXGk0FHD8+fzOKLKfjktdRROlt8b+4q9M5RGJAKMp48wtBbRS3orwfm+xYX129J7MQMoq8YRl2LK
	a2hGKN1O/gFbu8Pto2j8ECaFsVc6RavNBw68xzIvaNKmuX8ZTrmayBGGheB5n4aHb74AcoI6NPT1y
	KO+pHMi+zkczwAHp5d8RCYC0BXr7sZ5HgDV9CBRNweJSQs0nbULQ4oI5FZE5y684G79uDDuevvG4l
	bbC9VVxJa5lOdX8vP2+N6BoBBfwVSsIv09lrMB+7KQpnJp5QyYjhq5pU7k5GXVLT+KC6nHUJGfNON
	2Cd0c3+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljWOg-005R9s-Ku; Thu, 20 May 2021 00:18:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljWOL-005R7q-F0
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 00:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PUl1f4Nr+76KwblutPrM8yHeRx7+a2+oq+0sa4fdqeY=; b=gJ+eGYT9LiBZe0KkVs+Dv3eAaI
 7iXCH+NIGSV9tOYBlPp42IUSnVaG/gbFrKcQuO6+VnCVX8cYwx7TUSX1ssYCXjrrLSVuAobIo0165
 Oj1yqNzYuuy1UNY6vE6UxVy+H7QJf6R2P1lEoZggEGR3GZBwBxgT9lfMDY7TzUig7arLE6aQ36BgN
 P3drdAdHJJpMNUw5kRkib8T2e6le8Y4H8RaX5OvSaZzwU0oBdN5o9L36TwgRPWLcONefIHMiw3ajS
 EqqLP+gmjJUPemJnby40yEQUNHt5wjb8ZESaQO1zHYOaNdU+lmBHfXpW8b4f/UQOnRMX+Pz6tBXRO
 KGHynVSw==;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljWOF-00FrcA-Ge
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 00:18:20 +0000
Received: by mail-oi1-f175.google.com with SMTP id c196so6603429oib.9
 for <linux-mtd@lists.infradead.org>; Wed, 19 May 2021 17:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PUl1f4Nr+76KwblutPrM8yHeRx7+a2+oq+0sa4fdqeY=;
 b=fPJSW4p3by2DuPjZoSjV1v1drR9nlIn6ApTEUL7nQ1AiCHDmc9+8SJnWqqsNSWQT/0
 8rEBQ3ptXinFHhe5wOhYNQss5jiLu223nLaln2in54UZQMqjZcfAPsTnbuFgXgkrXHgI
 ZZlrGKzxB/dckz0dPayIDYyiVNzl1+50fZWrvFMKrCfkNH72G8D2ScmKqO4VRRKo+0RV
 u80VF8pQn2hJdw2r6cHcsExlDeupf4rFOOgyt8SUolyMI3IB5AktkeRBOFfo63+M3sZs
 0DO5+g/HDksBc3xXl9BmCzhy9asjB7A1ZoyXR9XYxkCwmdIqx+8t+ncBYpmLGWrBJZKQ
 fWTg==
X-Gm-Message-State: AOAM530wnmGZ0zpLdDyO9Sl8G3lPgEqrINLRXDguGyLZOdR7S/1CBbIj
 XTY58HmlRoq2BKiCOeCs9w==
X-Google-Smtp-Source: ABdhPJyJ9mXSNJkPJogWolUElO1VBqD1ZH2eAdz+cSznysld0mz66FY+Q01GxNyC+2k3IKIR1LrGLg==
X-Received: by 2002:aca:428b:: with SMTP id p133mr1402859oia.22.1621469894617; 
 Wed, 19 May 2021 17:18:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l141sm260330oib.44.2021.05.19.17.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:18:13 -0700 (PDT)
Received: (nullmailer pid 3946400 invoked by uid 1000);
 Thu, 20 May 2021 00:18:10 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Goud <sgoud@xilinx.com>, Helmut Grohne <helmut.grohne@intenta.de>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Michal Simek <monstr@monstr.eu>,
 linux-mtd@lists.infradead.org
In-Reply-To: <20210519182636.1110080-11-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-11-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v20 10/19] dt-binding: memory: pl353-smc: Convert to yaml
Date: Wed, 19 May 2021 19:18:10 -0500
Message-Id: <1621469890.781438.3946399.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_171815_683279_A3DB5D5C 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

On Wed, 19 May 2021 20:26:27 +0200, Miquel Raynal wrote:
> Convert this binding file to yaml schema.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../memory-controllers/arm,pl353-smc.yaml     | 124 ++++++++++++++++++
>  .../bindings/memory-controllers/pl353-smc.txt |  46 -------
>  2 files changed, 124 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> 

Look at other primecell bindings. You need a custom 'select'.



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml:26:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml:28:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: $nodename:0: 'watchdog@66090000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,sp805' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: reg: [[1711865856, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dt.yaml: watchdog@66090000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: $nodename:0: 'spi@e0100000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl022' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: #address-cells:0:0: 2 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: #size-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: reg: [[3759144960, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: 'clock-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: 'clocks' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-pl022.example.dt.yaml: spi@e0100000: 'dma-names', 'dmas', 'm25p80@1' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: $nodename:0: 'serial@80120000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl011' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: reg: [[2148663296, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/serial/pl011.example.dt.yaml: serial@80120000: 'dma-names', 'dmas' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: $nodename:0: 'cti@20020000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,coresight-cti' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: reg: [[537001984, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20020000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: $nodename:0: 'cti@859000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: compatible: 'oneOf' conditional failed, one must be fixed:
	['arm,coresight-cti-v8-arch', 'arm,coresight-cti', 'arm,primecell'] is too long
	Additional items are not allowed ('arm,primecell' was unexpected)
	'arm,coresight-cti-v8-arch' is not one of ['arm,pl353-smc-r2p1']
	'arm,coresight-cti' is not one of ['arm,primecell']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: reg: [[8753152, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@859000: 'arm,cs-dev-assoc', 'cpu' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: $nodename:0: 'cti@858000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,coresight-cti' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: #address-cells:0:0: 2 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: #size-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: reg: [[8749056, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@858000: 'arm,cti-ctm-id', 'trig-conns@0', 'trig-conns@1' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: $nodename:0: 'cti@20110000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,coresight-cti' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: #address-cells:0:0: 2 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: #size-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: reg: [[537985024, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/coresight-cti.example.dt.yaml: cti@20110000: 'trig-conns@0', 'trig-conns@1', 'trig-conns@2' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: $nodename:0: 'mmc@5000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl180' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: reg: [[20480, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@5000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: $nodename:0: 'mmc@80126000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl18x' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: reg: [[2148687872, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'dma-names', 'dmas', 'max-frequency', 'st,sig-dir-cmd', 'st,sig-dir-dat0', 'st,sig-dir-dat2', 'st,sig-pin-fbclk', 'vmmc-supply', 'vqmmc-supply' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: $nodename:0: 'mmc@101f6000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl18x' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: reg: [[270491648, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@101f6000: 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'full-pwr-cycle', 'max-frequency', 'st,sig-dir-cmd', 'st,sig-dir-dat0', 'st,sig-dir-dat2', 'st,sig-dir-dat31', 'st,sig-pin-fbclk', 'vmmc-supply' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: $nodename:0: 'mmc@52007000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl18x' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: reg: [[1375760384, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: clocks: [[4294967295, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: 'arm,primecell-periphid', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'interrupt-names', 'max-frequency', 'resets' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: $nodename:0: 'timer@fc800000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,sp804' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: reg: [[4236247040, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: clocks: [[4294967295], [4294967295], [4294967295]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: clocks: Additional items are not allowed ([4294967295] was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: clock-names:1: 'apb_pclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: clock-names: ['timer1', 'timer2', 'apb_pclk'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: clock-names: Additional items are not allowed ('apb_pclk' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/arm,sp804.example.dt.yaml: timer@fc800000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: $nodename:0: 'mailbox@2b1f0000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,mhu' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: reg: [[0, 723451904, 0, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: clocks: [[4294967295, 0, 2, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b1f0000: '#mbox-cells' does not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: $nodename:0: 'mailbox@2b2f0000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,mhu-doorbell' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: reg: [[0, 724500480, 0, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: clocks: [[4294967295, 0, 2, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dt.yaml: mailbox@2b2f0000: '#mbox-cells' does not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: $nodename:0: 'mailbox@2b1f0000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,mhuv2-tx' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: reg: [[0, 723451904, 0, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: clocks: [[4294967295, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f0000: '#mbox-cells', 'arm,mhuv2-protocols' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: $nodename:0: 'mailbox@2b1f1000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,mhuv2-rx' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: reg: [[0, 723456000, 0, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: clocks: [[4294967295, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: clock-names: ['apb_pclk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dt.yaml: mailbox@2b1f1000: '#mbox-cells', 'arm,mhuv2-protocols' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: $nodename:0: 'serial@100000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl011' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: reg: [[1048576, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: 'clock-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: 'clocks' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: serial@100000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: $nodename:0: 'mmc@80118000' does not match '^memory-controller@[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: compatible: 'oneOf' conditional failed, one must be fixed:
	'arm,pl18x' is not one of ['arm,pl353-smc-r2p1']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: #address-cells:0:0: 2 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: #size-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: reg: [[2148630528, 4096]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: clock-names:0: 'memclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: 'ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dt.yaml: mmc@80118000: 'bus-width', 'non-removable', 'vmmc-supply', 'wifi@1' do not match any of the regexes: '.*@[0-9]+,[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.example.dt.yaml:0:0: /example-0/memory-controller@e000e000/nand-controller@0,0: failed to match any schema with compatible: ['arm,pl353-nand-r2p1']

See https://patchwork.ozlabs.org/patch/1481117

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
