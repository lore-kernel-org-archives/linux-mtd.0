Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEFBC35280
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 21:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668A120857
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 21:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbhEPjlg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668A120857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzl69TN1oLPsqKY8B2WjLofTdgjwbgZgY6a82UiG/Uw=; b=GbhEPjlgoZTGX0
	mAstp/f5nm/JTe93gGdIvtRgqytjQ6yKFKeRYzAqSR3NpV6aYjZZHymLexM1k+Tncq0TbJIVU/HTo
	BeeTtpTzHvL0fwb1rAnSGC28su4yaMIa/JJek0VDCixolz0B3O2O3BxBKXKqKgkr+fA1zliTz34Px
	pRYu6BH7OJBX15Euidz24NBbhEDOLkIZUXZePVYBw6vapb+byL7iVcQZmBDIvdXtYQusnDRQtm10q
	NoGgS0slm/ZcRntQn6iB+uuqwJjoeo7Kndgq+q+f3ll3IBgqz3SHovTaIbkfgESboNw1pLgdZ05pk
	MZ8KdAwgQ3XQiMmS36ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUdAt-0003Qx-Gx; Fri, 01 May 2020 21:26:23 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUdAM-0002rP-Ip
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 21:25:52 +0000
Received: by mail-ot1-f67.google.com with SMTP id j4so3631380otr.11
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2020 14:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IODh8vaskvY8EIkReJH8wMEH0J80lOImbjARnLzzvcQ=;
 b=fCAYdp2MVPTmC6oGcqz1Bm55rV4c7AcGCOYT/l7PDNefQQJjcrvRpjc0pNHXfpptmz
 Pd8Pu+xoz6faJim3XlGGrNfMCx5eZNyP6SUmclDwB9IyQpOw0U6/w+JAyCelTgY3ITaf
 3fwlOt+UubF2oKqxOThe5HNc7I6aKvYj8v+A/gA0fF98PqCtKg3LQ4TlXOKLKLQmFkUG
 ZkJjVl9U7Gm/2cr0E+kAjwI+uNZzq3G/rYecOPYDGUaTgJ1Trc5HDBgZWl/ppUfg0IWL
 mhEAtt5Flbg/gSdQy4JpCC2JcP1HHx5nz5rWwJb8QAF8IhDyxBs0eWXC9A6YXeHoBHUc
 DxXQ==
X-Gm-Message-State: AGi0PubwHlBKN3UD3VJo7yecoVInTLrwvt490J3Ddp0eKiqtK7unFX7v
 PQIM/tsWOob+QHaEP/EhrBegB6M=
X-Google-Smtp-Source: APiQypK6GnwgIp5q8Fl8YttocWPKhKXxC4m7JVG3OzxdYotva83r0Pcn/EVz6ZtR+YXkGyZH07amqQ==
X-Received: by 2002:a9d:7f04:: with SMTP id j4mr5397739otq.185.1588368349023; 
 Fri, 01 May 2020 14:25:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b19sm269926oii.1.2020.05.01.14.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 14:25:48 -0700 (PDT)
Received: (nullmailer pid 25490 invoked by uid 1000);
 Fri, 01 May 2020 21:25:48 -0000
Date: Fri, 1 May 2020 16:25:48 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
Message-ID: <20200501212547.GB15294@bogus>
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
 <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_142550_674901_F4D5A898 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 11:47:25PM +0300, Sergei Shtylyov wrote:
> Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
> HyperFlash connected to the SoC to be accessed via the external address
> space read mode or the manual mode.
> 
> Document the device tree bindings for the Renesas RPC-IF found in the R-Car
> gen3 SoCs.
> 
> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - rewrote the bindings in YAML.
> 
>  Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++

Not where we normally put SPI flash controllers...

>  1 file changed, 88 insertions(+)
> 
> Index: linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> ===================================================================
> --- /dev/null
> +++ linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0)

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/renesas,rpc-if.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Reduced Pin Count Interface (RPC-IF)
> +
> +maintainers:
> +  - Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> +
> +description: |
> +  Renesas RPC-IF allows a SPI flash or HyperFlash connected to the SoC to
> +  be accessed via the external address space read mode or the manual mode.
> +
> +  The flash chip itself should be represented by a subnode of the RPC-IF node.
> +  The flash interface is selected based on the "compatible" property of this
> +  subnode:
> +  - if it contains "jedec,spi-nor", then SPI is used;
> +  - if it contains "cfi-flash", then HyperFlash is used.
> +
> +allOf:
> +  - $ref: "/schemas/spi/spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        renesas,r8a77980-rpc-if # device is a part of R8A77980 SoC
> +	renesas,r8a77995-rpc-if # device is a part of R8A77995 SoC

Not valid yaml with tab and not valid json-schema as 'enum' is a list 
(needs '-').

> +      - enum:
> +        renesas,rcar-gen3-rpc-if # a generic R-Car gen3 device
> +
> +  reg:
> +    items:
> +       - description: RPC-IF registers
> +       - description: direct mapping read mode area
> +       - description: write buffer area

Wrong indentation.

> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: dirmap
> +      - const: wbuf
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":

^flash@... if you're that restrictive.

> +    type: object
> +    properties:
> +      compatible:
> +        oneOf:
> +          - const: cfi-flash
> +          - const: jedec,spi-nor

enum is better than oneOf+const.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a77995-sysc.h>
> +
> +    spi@ee200000 {
> +      compatible = "renesas,r8a77995-rpc-if", "renesas,rcar-gen3-rpc-if";
> +      reg = <0 0xee200000 0 0x200>,
> +            <0 0x08000000 0 0x4000000>,
> +            <0 0xee208000 0 0x100>;
> +      reg-names = "regs", "dirmap", "wbuf";
> +      clocks = <&cpg CPG_MOD 917>;
> +      power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +      resets = <&cpg 917>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      flash@0 {
> +        compatible = "jedec,spi-nor";
> +        reg = <0>;
> +        spi-max-frequency = <40000000>;
> +        spi-tx-bus-width = <1>;
> +        spi-rx-bus-width = <1>;
> +      };
> +    };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
