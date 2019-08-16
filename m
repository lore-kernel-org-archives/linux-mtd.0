Return-Path: <SRS0=cvjG=WM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D902FC3A59D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2019 21:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC0420644
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2019 21:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXdUCajQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC0420644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu1eHrrf0cZizmEf5IMUHo6dMdVXrR5MMPesqD60v9k=; b=SXdUCajQojJOUt
	HX9NxfbCo7QSEbfgG51zwr2NMP4EEEqiIkMUOmEHku6xjQ3Ib9WypZ+5OywCvddoBp+GIi9hNrs6v
	LzRT62KIsqfyytx9U9o6TlGZjizdroloME1TL43HlgXP+8Z/DBObjhKrnCYaLSLAJ7rn953W07179
	MGV7kIYqP2fZuSwd+JGXr2cuZMslgrwWIEHuw6iOJIDTcGn39v1uLCJRHebFEN3uoUQbT1psMRc0u
	vcJxHkolC3ULJQzzR4JtB5wuYlXJP7iiZF6sEhK9obZr9iJl3UHmSnS5YnIa+5P8YhG40lkJ/bmzg
	QIL9KBkvKIWS//z2PpSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyjob-00053V-G6; Fri, 16 Aug 2019 21:31:17 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyjoX-00052W-MP
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2019 21:31:15 +0000
Received: by mail-oi1-f195.google.com with SMTP id b25so1804669oib.4
 for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2019 14:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cSkX6HP4edadRsvUTh8Dt4dFym0rz2BKxLaGaU9X7YM=;
 b=Q2ImSPJURtAvhMwC4k44zwMNL9xA5zulUx8IkyQR5RTazKpn6uwntEbLS0CZ3veYh1
 wriM0zYNBi1AT9yKDJ6odzpNkuaTchyQEaSHyN2bGwBXgv5mRiD0XPhilPK2owjw240r
 AErJt94zIM+smgPx2zNDW2UD7H+Zrsd2AgYdrzAhQoOJJiUk8tRpxsoL75zcXIus26L4
 0QyKDuwx+BnPhy0qXw/k6/PLJdr5c8lIEQQfV/erftfb6uSVJsR7IByq3Uw8liT5T3Sz
 p5CZTvzCUd4QVArEhx7K55PoMQF89bcgkP6P+3n3CL+9gkY27dyBLCCGL7mG1b5h3xxz
 /6ew==
X-Gm-Message-State: APjAAAUJGZal2C1iM27ySAU9wB+2qCvz9dsr9+v3YPS8I7t0W5960Z97
 dIpX84Wn/amtAToOLTnM+A==
X-Google-Smtp-Source: APXvYqwDR1yRX3MltSlvOjGpTB3EIJ6urfPfNJ66nUknHQOqKgdVOdgii6jtPM4lhLFSAfXNMXxzrA==
X-Received: by 2002:aca:fc14:: with SMTP id a20mr6589631oii.156.1565991072842; 
 Fri, 16 Aug 2019 14:31:12 -0700 (PDT)
Received: from localhost ([2607:fb90:1cdf:eef6:c125:340:5598:396e])
 by smtp.gmail.com with ESMTPSA id q9sm1802485oij.5.2019.08.16.14.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 14:31:11 -0700 (PDT)
Date: Fri, 16 Aug 2019 16:31:10 -0500
From: Rob Herring <robh@kernel.org>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v5 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Message-ID: <20190816213110.GA31192@bogus>
References: <20190725145804.8886-1-piotrs@cadence.com>
 <20190725145955.13951-1-piotrs@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725145955.13951-1-piotrs@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_143113_734720_C13ABCE6 
X-CRM114-Status: GOOD (  22.63  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 25, 2019 at 03:59:55PM +0100, Piotr Sroka wrote:
> Document the bindings used by Cadence NAND controller driver
> 
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
> ---
> Changes for v5:
> - replace "_" by "-" in all properties
> - change compatible name from cdns,hpnfc to cdns,hp-nfc
> Changes for v4:
> - add commit message
> Changes for v3:
> - add unit suffix for board_delay 
> - move child description to proper place
> - remove prefix cadence_ for reg and sdma fields
> Changes for v2:
> - remove chip dependends parameters from dts bindings
> - add names for register ranges in dts bindings
> - add generic bindings to describe NAND chip representation
> ---
>  .../bindings/mtd/cadence-nand-controller.txt       | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> new file mode 100644
> index 000000000000..423547a3f993
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> @@ -0,0 +1,50 @@
> +* Cadence NAND controller
> +
> +Required properties:
> +  - compatible : "cdns,hp-nfc"
> +  - reg : Contains two entries, each of which is a tuple consisting of a
> +	  physical address and length. The first entry is the address and
> +	  length of the controller register set. The second entry is the
> +	  address and length of the Slave DMA data port.
> +  - reg-names: should contain "reg" and "sdma"
> +  - interrupts : The interrupt number.
> +  - clocks: phandle of the controller core clock (nf_clk).
> +
> +Optional properties:
> +  - dmas: shall reference DMA channel associated to the NAND controller
> +  - cdns,board-delay-ps : Estimated Board delay. The value includes the total
> +    round trip delay for the signals and is used for deciding on values
> +    associated with data read capture. The example formula for SDR mode is
> +    the following:
> +    board delay = RE#PAD delay + PCB trace to device + PCB trace from device
> +    + DQ PAD delay
> +
> +Child nodes represent the available NAND chips.
> +
> +Required properties of NAND chips:
> +  - reg: shall contain the native Chip Select ids from 0 to max supported by
> +    the cadence nand flash controller
> +
> +
> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
> +generic bindings.
> +
> +Example:
> +
> +nand_controller: nand-controller @60000000 {

space                              ^

> +	  compatible = "cdns,hp-nfc";
> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
> +	  reg-names = "reg", "sdma";
> +	  clocks = <&nf_clk>;
> +	  cdns,board-delay-ps = <4830>;
> +	  interrupts = <2 0>;

You need #address-cells and #size-cells here.

With those fixes,

Reviewed-by: Rob Herring <robh@kernel.org>

> +	  nand@0 {
> +	      reg = <0>;
> +	      label = "nand-1";
> +	  };
> +	  nand@1 {
> +	      reg = <1>;
> +	      label = "nand-2";
> +	  };
> +
> +};
> -- 
> 2.15.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
