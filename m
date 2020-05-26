Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DA1C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 23:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E57220707
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 23:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKsF+T/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E57220707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjS5WPPQHURN8Yf0nm/U+UDle9QASLgGbdqBxdZDdbs=; b=RKsF+T/bbw63Cq
	KpzgeYz5yNlPi8+7s4pSq9vTQ0GosfkmW/zw+MrD3GZwuw6lXPEpTo+oLowFxa8S5tu7f5jpNFbpL
	LGssMQIKKh20n0vjirIMq++uwN0ZSvFzqTvsdQMgscL6zwJyQgcMvKp6gLMom0waTzRDhTInEgeq2
	I2RdpwmVr4PwoScw1d21FGURo7jn+9qTlzu3w7aVpVd+bVV9JW5sFxyzNT+BOs8rnfaILcmsDDc76
	4dXLTtTVPZvUAdjlZZeeS4rO6LcdlpYQJ7llI/hypn3wbQ7NdXoaZEjQ46Hu08nca9wht2eG4k0PT
	70yS6nXZqY5OvAgcMVLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdiiY-00025l-JW; Tue, 26 May 2020 23:10:42 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdiiV-00025R-CS
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 23:10:40 +0000
Received: by mail-il1-f194.google.com with SMTP id v11so4844756ilh.1
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2020 16:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HUD3rjABkK3M27L+kA+MnFzFlbgVQzxxYdxT/UpzDIs=;
 b=rAZQTTWRxg5g45Y9u9MMoPIOM2+Hl1ABJQu5XAX6fikBKO05c0UsTipiZggTzrr4Zl
 qvxiRVQ0rP0a1q1mEzL99nFu2QjaZnppWh62tJqQLk6OC6qWYXKbcx8b1wm11rgtL3nU
 zK6V2m8CafQL05dMnw3zstFsQf2XvbRha4iv4YvKCbFYkOl3DTvsvz+KXWP692UgDa6X
 ADZ2+bhJ2PEzt146jS1giJ/4awX7jmJyj11RPwHVAiBxUxS80TlwVhBsep04vfWaPjn3
 ylp/TemOmpmjhCcvFuBekYoGtaYN5ApCofhMPkAmDtijddMEvuahJzuISMYdMciaatfS
 HcYg==
X-Gm-Message-State: AOAM530dbMXxMmtShUE6h76Z9HLcEjvu7Gd0jE9fPF0DGR9mCe1QCceB
 fY9V84kEZyrp+FPXE85z+Q==
X-Google-Smtp-Source: ABdhPJzl6/femhNIHHcB6mqYv4S6Wy0fd7JX2rGbnyjPMraH4XkZEhvB4z3x9VNEOcYtda/eoLMnIA==
X-Received: by 2002:a92:5b99:: with SMTP id c25mr1401204ilg.42.1590534638721; 
 Tue, 26 May 2020 16:10:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j90sm698788ilg.70.2020.05.26.16.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 16:10:38 -0700 (PDT)
Received: (nullmailer pid 569321 invoked by uid 1000);
 Tue, 26 May 2020 23:10:37 -0000
Date: Tue, 26 May 2020 17:10:37 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RESEND v5 14/21] dt-bindings: mtd: Add the nand-ecc-placement
 property
Message-ID: <20200526231037.GA568048@bogus>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-15-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526195633.11543-15-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_161039_420955_B9E91924 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 21:56:26 +0200, Miquel Raynal wrote:
> Placement is where the ECC bytes are expected.
> No value means the controller can do whatever it desires (default is
> to put ECC bytes at the end of the OOB area). Alternative placement is
> "interleaved" (also sometimes referred as "syndrome") where data and
> OOB are mixed.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mtd/nand-controller.yaml:  while scanning a plain scalar
  in "<unicode string>", line 64, column 11
found a tab character that violates indentation
  in "<unicode string>", line 65, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/mtd/nand-controller.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/mtd/nand-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1298408

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
