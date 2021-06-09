Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB3EC48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 17:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3AB61287
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 17:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3AB61287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WJLohdEF1nbX5OTAunfzB1F8q1dN+WD/UXjAes1Wwg=; b=TdEnQH+/4MWTsa
	mJqN/qgNYgCb9NTflreqpigzyhlby6DiWuTcgvODkw7pYfM5Cr4u8Bb5f3ZMrOZ45I+yuVH+bghJK
	z6ia1LY18tzn/aczcIkI/r6sOGxTDYwrUpMUYF7zoWB7TlylHAG6ybnNcLrAb0w8LqLG2ePdl4Gk8
	yI2w1QJadnrp3b4FECXx0o0XFbOoVnXNMMFWNqhY8DVF0WGX4tV/VFFpxm8gKvcWd+S0OR0BOmk3D
	xG6UTnhV2ie//1ciukw+/ksdm80rx0sIvhNpkdBmRS10eLG6Qh8OPgqD0Zr7VM3fJLAt96iINles9
	ffvkDloioFb2zf7CXJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr1h5-00FCT6-7c; Wed, 09 Jun 2021 17:08:43 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr0ss-00EqsZ-JP; Wed, 09 Jun 2021 16:16:52 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so24487515otg.2; 
 Wed, 09 Jun 2021 09:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=NYXHJI4Kx3eiwThUs5yqYYIde++NFf0oIszmROtqUoY=;
 b=Lvm476x7vtUTDggVGynphtwEa1cmhqUtH3Z2289yauVtW/HN9CuJhudISPsjds+iWa
 jwIX4yOuKPdkuOmBF+llzIp8h6g148QfuM7z2L2pGNiOFjqBkcxmFZZoEJpMO8XiaBI6
 RDqSm5k3b+OHOFshg4vGUE8CXPVtbNnbUXYSvJdl4l1LKDSA6bibKig8aEOwo9FHwXbJ
 oI3/jU0WAiHJIHRT1Z2TJc8NQXgcgQNyzKeQriXI6JgfnbbvZ6yFuHg9ObWNmNm86QOb
 JLPYE4gkezu/JCrv6xWoROlNoN/CDs1QQLdf4txA/Pn1L4c0t5eeKc0QeQR8uqalBi9a
 Uofg==
X-Gm-Message-State: AOAM531Q8oH8TDLYUtZOIHJItmfRl3X+DGHDxWpYLlETYFIi4k/HeWbi
 YljLnnbgsC7cWUtY2hBhBQ==
X-Google-Smtp-Source: ABdhPJyyFLCSgdauyi4+TKqtKVi+eaXOEEd+HR/EHYo0r6k5qWvlaRPdV1iCq+OxSaL1ccGDwnDQbQ==
X-Received: by 2002:a9d:1b05:: with SMTP id l5mr141741otl.335.1623255406773;
 Wed, 09 Jun 2021 09:16:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x31sm75149ota.24.2021.06.09.09.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:16:46 -0700 (PDT)
Received: (nullmailer pid 3763298 invoked by uid 1000);
 Wed, 09 Jun 2021 16:16:43 -0000
From: Rob Herring <robh@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com, hjc@rock-chips.com,
 mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Chris Morgan <macromorgan@hotmail.com>, macroalpha82@gmail.com, p.yadav@ti.com,
 linux-spi@vger.kernel.org, jbx6244@gmail.com, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 sboyd@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210609140412.16058-2-jon.lin@rock-chips.com>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609140412.16058-2-jon.lin@rock-chips.com>
Subject: Re: [PATCH v7 1/9] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
Date: Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.626186.3763297.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_091650_688732_B8A08D48 
X-CRM114-Status: GOOD (  38.45  )
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

On Wed, 09 Jun 2021 22:04:04 +0800, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add bindings for the Rockchip serial flash controller. New device
> specific parameter of rockchip,sfc-no-dma included in documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v7:
> - Fix up the sclk_sfc parent error in rk3036
> - Unify to "rockchip,sfc" compatible id because all the feature update
>   will have a new IP version, so the driver is used for the SFC IP in
>   all SoCs
> - Change to use node "sfc" to name the SFC pinctrl group
> - Add subnode reg property check
> - Add rockchip_sfc_adjust_op_size to workaround in CMD + DUMMY case
> - Limit max_iosize to 32KB
> 
> Changes in v6:
> - Add support in device trees for rv1126(Declared in series 5 but not
>   submitted)
> - Change to use "clk_sfc" "hclk_sfc" as clock lable, since it does not
>   affect interpretation and has been widely used
> - Support sfc tx_dual, tx_quad(Declared in series 5 but not submitted)
> - Simplify the code, such as remove "rockchip_sfc_register_all"(Declared
>   in series 5 but not submitted)
> - Support SFC ver4 ver5(Declared in series 5 but not submitted)
> - Add author Chris Morgan and Jon Lin to spi-rockchip-sfc.c
> - Change to use devm_spi_alloc_master and spi_unregister_master
> 
> Changes in v5:
> - Add support in device trees for rv1126
> - Support sfc tx_dual, tx_quad
> - Simplify the code, such as remove "rockchip_sfc_register_all"
> - Support SFC ver4 ver5
> 
> Changes in v4:
> - Changing patch back to an "RFC". An engineer from Rockchip
>   reached out to me to let me know they are working on this patch for
>   upstream, I am submitting this v4 for the community to see however
>   I expect Jon Lin (jon.lin@rock-chips.com) will submit new patches
>   soon and these are the ones we should pursue for mainlining. Jon's
>   patch series should include support for more hardware than this
>   series.
> - Clean up documentation more and ensure it is correct per
>   make dt_binding_check.
> - Add support in device trees for rk3036, rk3308, and rv1108.
> - Add ahb clock (hclk_sfc) support for rk3036.
> - Change rockchip_sfc_wait_fifo_ready() to use a switch statement.
> - Change IRQ code to only mark IRQ as handled if it handles the
>   specific IRQ (DMA transfer finish) it is supposed to handle.
> 
> Changes in v3:
> - Changed the name of the clocks to sfc/ahb (from clk-sfc/clk-hsfc).
> - Changed the compatible string from rockchip,sfc to
>   rockchip,rk3036-sfc. A quick glance at the datasheets suggests this
>   driver should work for the PX30, RK180x, RK3036, RK312x, RK3308 and
>   RV1108 SoCs, and possibly more. However, I am currently only able
>   to test this on a PX30 (an RK3326). The technical reference manuals
>   appear to list the same registers for each device.
> - Corrected devicetree documentation for formatting and to note these
>   changes.
> - Replaced the maintainer with Heiko Stuebner and myself, as we will
>   take ownership of this going forward.
> - Noted that the device (per the reference manual) supports 4 CS, but
>   I am only able to test a single CS (CS 0).
> - Reordered patches to comply with upstream rules.
> 
> Changes in v2:
> - Reimplemented driver using spi-mem subsystem.
> - Removed power management code as I couldn't get it working properly.
> - Added device tree bindings for Odroid Go Advance.
> 
> Changes in v1:
> hanges made in this new series versus the v8 of the old series:
> - Added function to read spi-rx-bus-width from device tree, in the
>   event that the SPI chip supports 4x mode but only has 2 pins
>   wired (such as the Odroid Go Advance).
> - Changed device tree documentation from txt to yaml format.
> - Made "reset" message a dev_dbg from a dev_info.
> - Changed read and write fifo functions to remove redundant checks.
> - Changed the write and read from relaxed to non-relaxed when
>   starting the DMA transfer or reading the DMA IRQ.
> - Changed from dma_coerce_mask_and_coherent to just
>   dma_set_mask_and_coherent.
> - Changed name of get_if_type to rockchip_sfc_get_if_type.
> 
>  .../devicetree/bindings/spi/rockchip-sfc.yaml | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/rockchip-sfc.yaml:45:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489897

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
