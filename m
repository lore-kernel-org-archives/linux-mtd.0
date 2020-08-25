Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4A8C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA1C20782
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcAHEJ09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA1C20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tkNsOCwBhpgBpsSoLzmgZVuvGUlrLVsvGBHnDFjkxcg=; b=hcAHEJ09Z7yEBF3yB+DCrlHc8
	tutJCXyC+VDAJihdwaQQk/t4jFStRz0CpUeIJE+AclpNEXQTL59+W/FHfrAMqG974MESauQ7iEABo
	E4xnY9hs2cloFfgpfiIKRkIZs0XZkxLw7dGfW1ptWQx9PYyFKqekfkh7ncw56/sLsAsFwH60Ze1Al
	Onm0Kt9wDUGxQm55zvodkqRQ3XIjMHqSQaHX2jjzoSZ4WK3qMMPbJgM2SusEeC749akYgSLQfSBw1
	cIRgnKF6lWU0Y+Se8ac40Nj5taeqz6rGYmZiGRbBgYzO2cpp317SGdKBehO0DIRcQA9RGSbg4cVFR
	cOuGrJXkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kASlj-0006cy-KE; Tue, 25 Aug 2020 06:49:19 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kASlh-0006cE-0s; Tue, 25 Aug 2020 06:49:18 +0000
Received: by mail-wm1-f66.google.com with SMTP id k20so1056205wmi.5;
 Mon, 24 Aug 2020 23:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xu5xGZSY+yFQgovcXhMUWgqGOjtkm3hsvCXY91EThRQ=;
 b=CnnL8OhvVazcUO8mQheGq/6laSHKjjwRim8leJIYUsEirG9T3Rb0TL0PysGM87cDL5
 8kZOKLm6SWGPutvytwoVJLHfvawwEOx7FpkaZvttJyp0OYzqr4C7/hakaawNONCEcfxe
 aU2W7aDiTbX6RJdcDjC79SLhOONqPYjKBEoaJlx1PjDUkkhrV2giT6LIF35WdliqLoQS
 4/GlHbWd56LjQdBzCQVlfuY5sFHz+is43cFZbKQTt+MCyFtHNuvDwZnUC/42cj/JpVKW
 xcPagmz+zuqpQCFYtU7VuKmZuZQIQP8HnuCd39jKIXzykG3F6KXJBe8I5CzDAYHeN8pL
 OYMQ==
X-Gm-Message-State: AOAM532jcKhHZP9o2v9OaeUm+pTFILotzaWwx7eZfsN3uoibWkXn62Dl
 u3mbyKbzUGXQt9WiNqPu9/c=
X-Google-Smtp-Source: ABdhPJzyAcY2Bw92cGcbfsJuTBwKqDGqGkJGMxEMpfhNk68WOOIS/f1lMDDS8tqHLpAt+d0YVzNPiA==
X-Received: by 2002:a1c:24d5:: with SMTP id k204mr505723wmk.159.1598338152035; 
 Mon, 24 Aug 2020 23:49:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id y10sm283662wro.50.2020.08.24.23.49.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Aug 2020 23:49:11 -0700 (PDT)
Date: Tue, 25 Aug 2020 08:49:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 02/16] dt-bindings: mtd: gpmi-nand: Fix matching of
 clocks on different SoCs
Message-ID: <20200825064908.GA3458@kozik-lap>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-2-krzk@kernel.org>
 <20200825064020.GM13023@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825064020.GM13023@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_024917_114495_6BEB84F7 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Anson Huang <Anson.Huang@nxp.com>, Richard Weinberger <richard@nod.at>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 08:40:20AM +0200, Sascha Hauer wrote:
> On Mon, Aug 24, 2020 at 09:06:47PM +0200, Krzysztof Kozlowski wrote:
> > Driver requires different amount of clocks for different SoCs.  Describe
> > these requirements properly to fix dtbs_check warnings like:
> > 
> >     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
> >  1 file changed, 61 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> > index 28ff8c581837..9d764e654e1d 100644
> > --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx6q-gpmi-nand
> > +              - fsl,imx6sx-gpmi-nand
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: SoC gpmi io clock
> > +            - description: SoC gpmi apb clock
> > +            - description: SoC gpmi bch clock
> > +            - description: SoC gpmi bch apb clock
> > +            - description: SoC per1 bch clock
> > +        clock-names:
> > +          items:
> > +            - const: gpmi_io
> > +            - const: gpmi_apb
> > +            - const: gpmi_bch
> > +            - const: gpmi_bch_apb
> > +            - const: per1_bch
> 
> This enforces this specific order of the clocks given in the dts. The
> clock binding itself doesn't require any specific order, that's what we
> have the names array for.
> 
> Is this really what we want?

Indeed but have in mind that the specific order was there already. This
patch does not address that part, only number of clocks.

Fixing this for any order could be done with patterns. I can work on
that.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
