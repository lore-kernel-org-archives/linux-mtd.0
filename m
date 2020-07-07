Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F506C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 09:34:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CAE82065F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 09:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K1Q8gQP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CAE82065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YGCSMakWstm2rvjHOV+nuYnbM3cY93f/4575phKso1s=; b=K1Q8gQP1PvaeudHMYXbkxjb8o
	85VjkD2C1U+eFTJuMip19D1rHJw7d+1gjjeVAWvXTYW4P+BDWElrWsjBJ0hjvPzzLaHXXG1Yy3401
	jt+BKDomRaFlssRlAR88an7wUFSt0niiFSXoJZoqvVvlaLzWntrQXwgc8nZXS75ICCe7nti+2mY88
	6h/lpep1YS7rOLhddjY3+H3sW2yAhe3bjitjtsCLOd6Xaqly7c9bhqYDPXL3Xbp7HPDlX49MW2rHb
	RI/e2IxoNJBfLC/UpGsXE6jNuoO6GHaJLdWcyh/JS4G2A4ynGWROn4WUsOOmU7MvG9MN9PQXJzO+v
	HVgIlfjLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsjyb-00082A-MJ; Tue, 07 Jul 2020 09:33:21 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsjyY-00081j-Rt
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 09:33:19 +0000
Received: by mail-oi1-f193.google.com with SMTP id l63so32940345oih.13
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2020 02:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VB02tOgm4x0vvWinn0yzASS1J5cK/IPzRsdpTAQ4rQk=;
 b=iTUwupa31oRYKBwq/wPICKzlWvQMmHds985EdYc1nAM5uMBeECSH4yT6wbHCGL0LSA
 etRQuBj+mk2TWr6vWfNIUoW8B9imRcyBJgVoubUEAdIvwXdwya8+ArKvybjiZnrArh0l
 YEXnKeyc6mlARaRsUtbrKKjftwUrBWx3bLsLWacSTs3xYCqRAOqAXIwISIaV0+bZqfTg
 LobxaNHqiFZOoAz1Ns30xTkMEZ2qCB3wTi8Ba7X9aSWcYm4eKE8s+KJCulfCJw7AeonI
 hwIIaubhXTcEHtxw6kAR81BKuqvEjg/I//TekbrCZGaLwYEIJRhFx4FeHYnmFwzrgzcy
 eeCQ==
X-Gm-Message-State: AOAM530AUURCfoI5i2oBD82K2ZiJCDUXYeDfcANNEc0kFlYhwyxenTDq
 3jaJfppUbB1jEspzjgvUSOByiJ8gGQnJzOt5UyA=
X-Google-Smtp-Source: ABdhPJzdnmNZM58lYV9qIqWEOtbYuwfoZLGUAXoQImbx7pakXkbzqGAN57IIyGJ4TXoicdjI0ci72Uq/yPlU117sldc=
X-Received: by 2002:a05:6808:64a:: with SMTP id
 z10mr2601380oih.54.1594114397872; 
 Tue, 07 Jul 2020 02:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
 <54a84c75-fa17-9976-d9a6-a69ef67c418b@cogentembedded.com>
In-Reply-To: <54a84c75-fa17-9976-d9a6-a69ef67c418b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2020 11:33:07 +0200
Message-ID: <CAMuHMdVnjE=BHe5MBr_NsL6LeXq30vKym8OVLp28=7sZeUBAWw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_053318_905021_911252DD 
X-CRM114-Status: GOOD (  16.71  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Mason Yang <masonccyang@mxic.com.tw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei,

On Tue, Jun 16, 2020 at 10:01 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
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

Thanks for your patch!

> --- /dev/null
> +++ linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/renesas,rpc-if.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Reduced Pin Count Interface (RPC-IF)
> +
> +maintainers:
> +  - Sergei Shtylyov <sergei.shtylyov@gmail.com>
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

> +patternProperties:
> +  "flash@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - cfi-flash
> +          - jedec,spi-nor

The above does not allow specifying e.g.

    compatible = "spansion,s25fs512s", "jedec,spi-nor";

arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: spi@ee200000:
flash@0:compatible: Additional items are not allowed ('jedec,spi-nor'
was unexpected)
arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: spi@ee200000:
flash@0:compatible:0: 'spansion,s25fs512s' is not one of ['cfi-flash',
'jedec,spi-nor']

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a77995-sysc.h>
> +
> +    spi@ee200000 {
> +      compatible = "renesas,r8a77995-rpc-if", "renesas,rcar-gen3-rpc-if";
> +      reg = <0xee200000 0x200>,
> +            <0x08000000 0x4000000>,
> +            <0xee208000 0x100>;
> +      reg-names = "regs", "dirmap", "wbuf";
> +      clocks = <&cpg CPG_MOD 917>;
> +      power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +      resets = <&cpg 917>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      flash@0 {
> +        compatible = "jedec,spi-nor";

... which you nicely circumvented in the example ;-)

> +        reg = <0>;
> +        spi-max-frequency = <40000000>;
> +        spi-tx-bus-width = <1>;
> +        spi-rx-bus-width = <1>;
> +      };
> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
