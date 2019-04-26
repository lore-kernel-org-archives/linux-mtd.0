Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0C8C43219
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 22:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69CC2206E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 22:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gvWO/ChX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69CC2206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vdhy1i9u5nxw4dBIxiGrMApoXlHrWaEsSGk7AUFE/lw=; b=gvWO/ChXRHSoC2
	36YAaEEeMnmSXAHDNgQyPqyJC29r478xVcLNqmDcQGwtKKScou/f7PMNBM6nKpYaWi1gMWXaj7kdD
	91Ix4pyyBgXzMFip2pzMEsN9974oDw+dxPRtEdDD2SucjPNcb6MY6AJQX9iKOPzU6+AxOLN32yJxv
	oQY9W7Xa84V/+dBMuvuPxJONaR1a598graKunI9PmaFWFac3zFkk9X3kN0oq2TbGwpiW3fRypaowt
	uX7ei+5TQMHtVen7S8ZxzF2WWgmAmhzikiqanthGW8zSJ/f8nl+4HS7RoMN93mFaZ6LkOec3tdzzi
	25F/PcSNUGsT6H+9hVNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK9XJ-00060X-J6; Fri, 26 Apr 2019 22:41:41 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK9XH-000609-CP
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 22:41:40 +0000
Received: by mail-oi1-f196.google.com with SMTP id k6so4204286oic.4
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 15:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PsdEdDTbsz+N7C5OSHpzo5ojKTZZOZ+w3y29AXWU3a0=;
 b=ntMCOowH46AcLHk6XV0rdYTHbiV4mNGkvIiIsZT1iQI0T7GQvVVmwXzmOHl+O7ehqG
 1kF1D9CKtmtKUcdYSD70Buq04x82ysojbS4lmf2HlCOAHB1ETuLj9dRnnOpbiGzSLwwW
 YlQlxwpzATeWR6mCbuK6oXcM9rAxtyyhyS6RyQo1Srxu5mW9Js0FPCD/s6oND2N8l94v
 UX7MeKJzy4A13gvPzY8AR3VjGLLdkOi9He0ZDDOZiMeHjtddmJ7MhgjY/kklJb/yrWe4
 gIbjMmmpt7b0M53bIk8RJmyxm416CvtCJN+9UxK9OHTI1xLKTsMKHK6Aj41P5+hs1pJt
 7HMA==
X-Gm-Message-State: APjAAAXIcI3XB2Rn/7n90XT8jASoeboXudnK9W51bIb+0ZHDNVrUoake
 FrZG//juqhcdmGfQ3/x8Fw==
X-Google-Smtp-Source: APXvYqzzmEbC/NuD5L8a9Vj0ZUk4s85sFCjNd6YoWDJUPGt8PPb+Skw3FBdVQPhaSCv3ksmJRDcfww==
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr9098222oih.154.1556318497952; 
 Fri, 26 Apr 2019 15:41:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f16sm3915279otq.15.2019.04.26.15.41.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 15:41:36 -0700 (PDT)
Date: Fri, 26 Apr 2019 17:41:36 -0500
From: Rob Herring <robh@kernel.org>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 4/4] dt-bindings: mfd: Document Macronix MX25F0A
 controller bindings
Message-ID: <20190426224136.GA636@bogus>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-5-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555320234-15802-5-git-send-email-masonccyang@mxic.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_154139_423120_5EF26008 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, juliensu@mxic.com.tw,
 christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org,
 marcel.ziswiler@toradex.com, lee.jones@linaro.org, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmal.com, liang.yang@amlogic.com, dwmw2@infradead.org,
 zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 05:23:54PM +0800, Mason Yang wrote:
> Document the bindings used by the Macronix MX25F0A MFD controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/mfd/mxic-mx25f0a.txt       | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> new file mode 100644
> index 0000000..7f3e0f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> @@ -0,0 +1,51 @@
> +Macronix MX25F0A MultiFunction Device Tree Bindings
> +----------------------------------------------------
> +
> +MX25F0A is a MultiFunction Device with SPI and raw NAND, which
> +supports either spi host controller or raw nand controller.
> +
> +Required properties:
> +- compatible: should be "mxic,mx25f0a"
> +- #address-cells: should be 1
> +- #size-cells: should be 0
> +- reg: should contain 2 entries, one for the registers and one for the direct
> +       mapping area in SPI mode.
> +- reg-names: should contain "regs" and "dirmap"
> +- interrupts: interrupt line connected to this MFD controller
> +- SPI controller driver:
> +		- clock-names: should contain "ps_clk", "send_clk" and
> +			       "send_dly_clk"
> +		- clocks: should contain 3 entries for the "ps_clk", "send_clk"
> +			  and "send_dly_clk" clocks
> +
> +- Raw nand controller driver.
> +		- nand-ecc-mode = "soft";
> +		- nand-ecc-algo = "bch";
> +
> +Example:
> +
> +	mxic: mx25f0a@43c30000 {
> +		compatible = "mxic,mx25f0a";
> +		reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
> +		reg-names = "regs", "dirmap";
> +
> +		/* spi */
> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send_clk", "send_dly_clk", "ps_clk";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		flash@0 {
> +			compatible = "jedec,spi-nor";
> +			reg = <0>;
> +			spi-max-frequency = <25000000>;
> +			spi-tx-bus-width = <4>;
> +			spi-rx-bus-width = <4>;
> +		};
> +
> +		/* nand */

Don't you need a nand child node? I'm not sure how that's going to work 
as you are already using the number space (i.e. reg) for SPI CS number 
and you can't really mix number spaces within a node level.

> +		nand-ecc-mode = "soft";
> +		nand-ecc-algo = "bch";
> +		nand-ecc-step-size = <512>;
> +		nand-ecc-strength = <8>;
> +	};
> -- 
> 1.9.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
