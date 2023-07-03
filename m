Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC4DEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDSsD0vdQqI/pIaTyOBlnTIKoBhMa25w7z9I8B57tec=; b=GdD8mD/+dHnJiU
	/YV8WTJeb45QS/qSbVpNrHmBRcijc5LMdxq3QPrcbcqYr4VzoTLolB0Koyq3zc7vChRTd4gYVLI5g
	olzhdfJhyJG5dHyc+1opoDd4lpx8yhO8lc7QwaK1J9xMwbZFU8mocFlrFpp0HzryLfOAZzS1KEvxR
	sfmNaMSlH2wVk089cNB1E3jkCX3YHaOe9dYrSylPMexc2JYXuQJpll9cPZCqcY9lj0g5VZj7/eFJR
	REQTiML4IMbVXCicUtp99kqRoJLg4C7/ZJFbLPjZFK5Jge1hkgZDV/WZ2uCUrJr6Ak1baWWGMkz0+
	5tya6leLnYPQk3WtYEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGM2z-00Avyf-38;
	Mon, 03 Jul 2023 16:05:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGM2u-00Avtj-39
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 16:05:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b7ef3e74edso23026235ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jul 2023 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688400296; x=1690992296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBEn+DORUJ5ij2DLOyIr1+keFOgWZdq/wK0YAWYuj18=;
        b=wF1J8mqRpZ/0eHecvY4A6d0+f61b+gLvgtgwZ8kNufHjfAFZDZBgnY8CBXJ8cpjeN4
         n/iS1HnDgYMUwDvOXpGzd9N7cFJx2kstYDzXBhUgXLTa0hrWXCPclNWgUaMenCy1TDVg
         nbxXRjQy8ML0HprfQFB/HnzTOWNTUf6f/UT80KdAhoFukugUsPKCwzFTWb8XVioL2rNj
         sNI4jANkgEX3k7nRXfw6uy13PENUpRiQU3DjJrkCQoewutdEvrFvtj3d2tDhhy2lOds6
         wxg1hCpW6ApALyDUyENW0BaznLAVqftyb6WSI/ypuMfGe9eCOGhhLfku/QPpQnq42KZp
         2jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688400296; x=1690992296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBEn+DORUJ5ij2DLOyIr1+keFOgWZdq/wK0YAWYuj18=;
        b=Zl/m2sDybK0SlA8flCqqzPfidB+9eF0oRReJeLM6tZbWgE3HoUcDULdgbKnf+RBYGl
         JM4wI6OlB7wyMUG4JyA41HIQM/y8IsYjYXvn/PCmQLC4dWnhfjHOk/bXOhTBXxD28Jbp
         36KsxWVlSI2eTXC3dfOEx2CK9/RMnOg0BpsYUIYtTPrZRkuaP+Mrq+0uTutums8MM/bg
         ARtsBfaWgZJDOtGOKZJEtspm9KyyiFcSHRNLEDEJDeAMbMYm2h2Fbi2xvUM97FHVlBFw
         xNqXTOv5wd6G9DFw4NETUM+MnbfW6GoMcdNYQ/bcdMhg+UzFomXWsZ7l+NsoHctW/cMG
         /vug==
X-Gm-Message-State: ABy/qLZzkdTc2pJktfjp2nMBX7rrc9M34qrKiahSe4J5X4Y2qco3Kpwq
	IGfIbL3pFrdJA2OiBOLnrt8cEQ==
X-Google-Smtp-Source: APBJJlGjEgZXbJ/Z6L8I7MLh6q1bS6/iEJLDe5vdJOhJhJXD38MLY3FNvd2g70KJTdpLSSdLro04Kg==
X-Received: by 2002:a17:903:496:b0:1b8:63c6:84ab with SMTP id jj22-20020a170903049600b001b863c684abmr6673059plb.61.1688400296152;
        Mon, 03 Jul 2023 09:04:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6f20:cb07:ed03:2be8])
        by smtp.gmail.com with ESMTPSA id x3-20020a1709027c0300b001ab1b7bae5asm15454989pll.184.2023.07.03.09.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 09:04:55 -0700 (PDT)
Date: Mon, 3 Jul 2023 10:04:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Message-ID: <ZKLxpAKTQ3P3KNYb@p14s>
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_090501_031913_43B1D6B2 
X-CRM114-Status: GOOD (  15.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jul 02, 2023 at 08:23:08PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=' sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob,
> 
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>  .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>  15 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 0c5b875cb654..d6c84b6e7fe6 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -287,7 +287,7 @@ examples:
>              arm,trig-in-sigs = <0 1>;
>              arm,trig-in-types = <PE_DBGTRIGGER
>                                   PE_PMUIRQ>;
> -            arm,trig-out-sigs=<0 1 2 >;
> +            arm,trig-out-sigs = <0 1 2 >;
>              arm,trig-out-types = <PE_EDBGREQ
>                                    PE_DBGRESTART
>                                    PE_CTIIRQ>;
> @@ -309,24 +309,24 @@ examples:
>  
>        trig-conns@0 {
>          reg = <0>;
> -        arm,trig-in-sigs=<0>;
> -        arm,trig-in-types=<GEN_INTREQ>;
> -        arm,trig-out-sigs=<0>;
> -        arm,trig-out-types=<GEN_HALTREQ>;
> +        arm,trig-in-sigs = <0>;
> +        arm,trig-in-types = <GEN_INTREQ>;
> +        arm,trig-out-sigs = <0>;
> +        arm,trig-out-types = <GEN_HALTREQ>;
>          arm,trig-conn-name = "sys_profiler";
>        };
>  
>        trig-conns@1 {
>          reg = <1>;
> -        arm,trig-out-sigs=<2 3>;
> -        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +        arm,trig-out-sigs = <2 3>;
> +        arm,trig-out-types = <GEN_HALTREQ GEN_RESTARTREQ>;
>          arm,trig-conn-name = "watchdog";
>        };
>  
>        trig-conns@2 {
>          reg = <2>;
> -        arm,trig-in-sigs=<1 6>;
> -        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +        arm,trig-in-sigs = <1 6>;
> +        arm,trig-in-types = <GEN_HALTREQ GEN_RESTARTREQ>;
>          arm,trig-conn-name = "g_counter";
>        };
>      };
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 91b96065f7df..86b59de7707e 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -96,8 +96,8 @@ examples:
>        compatible = "ti,k2g-sci";
>        ti,system-reboot-controller;
>        mbox-names = "rx", "tx";
> -      mboxes= <&msgmgr 5 2>,
> -              <&msgmgr 0 0>;
> +      mboxes = <&msgmgr 5 2>,
> +               <&msgmgr 0 0>;
>        reg-names = "debug_messages";
>        reg = <0x02921800 0x800>;
>      };
> @@ -107,8 +107,8 @@ examples:
>        compatible = "ti,k2g-sci";
>        ti,host-id = <12>;
>        mbox-names = "rx", "tx";
> -      mboxes= <&secure_proxy_main 11>,
> -              <&secure_proxy_main 13>;
> +      mboxes = <&secure_proxy_main 11>,
> +               <&secure_proxy_main 13>;
>        reg-names = "debug_messages";
>        reg = <0x44083000 0x1000>;
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index 029d72822d8b..65b02c7a1211 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -225,7 +225,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      gmu: gmu@506a000 {
> -        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
> +        compatible = "qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
>  
>          reg = <0x506a000 0x30000>,
>                <0xb280000 0x10000>,
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> index 1cdc91b3439f..200fbf1c74a0 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> @@ -74,7 +74,7 @@ examples:
>              vdd3-supply = <&vcclcd_reg>;
>              vci-supply = <&vlcd_reg>;
>              reset-gpios = <&gpy4 5 0>;
> -            power-on-delay= <50>;
> +            power-on-delay = <50>;
>              reset-delay = <100>;
>              init-delay = <100>;
>              panel-width-mm = <58>;
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> index 6f43d885c9b3..df61cb5f5c54 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> @@ -121,11 +121,11 @@ examples:
>          #size-cells = <0>;
>          vopb_out_edp: endpoint@0 {
>            reg = <0>;
> -          remote-endpoint=<&edp_in_vopb>;
> +          remote-endpoint = <&edp_in_vopb>;
>          };
>          vopb_out_hdmi: endpoint@1 {
>            reg = <1>;
> -          remote-endpoint=<&hdmi_in_vopb>;
> +          remote-endpoint = <&hdmi_in_vopb>;
>          };
>        };
>      };
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
> index 9b072b057f16..a60b1e100ee4 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
> @@ -35,7 +35,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      spi {
> -        #address-cells= <1>;
> +        #address-cells = <1>;
>          #size-cells = <0>;
>  
>          adc@0 {
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index 7dde7967c886..1e72b8808d24 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> @@ -137,7 +137,7 @@ examples:
>  
>                  cru_parallel_in: endpoint@0 {
>                      reg = <0>;
> -                    remote-endpoint= <&ov5642>;
> +                    remote-endpoint = <&ov5642>;
>                      hsync-active = <1>;
>                      vsync-active = <1>;
>                  };
> @@ -150,7 +150,7 @@ examples:
>  
>                  cru_csi_in: endpoint@0 {
>                      reg = <0>;
> -                    remote-endpoint= <&csi_cru_in>;
> +                    remote-endpoint = <&csi_cru_in>;
>                  };
>              };
>          };
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 91e8f368fb52..324703bfb1bd 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -303,11 +303,11 @@ examples:
>  
>                              vin0csi20: endpoint@0 {
>                                      reg = <0>;
> -                                    remote-endpoint= <&csi20vin0>;
> +                                    remote-endpoint = <&csi20vin0>;
>                              };
>                              vin0csi40: endpoint@2 {
>                                      reg = <2>;
> -                                    remote-endpoint= <&csi40vin0>;
> +                                    remote-endpoint = <&csi40vin0>;
>                              };
>                      };
>              };
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> index f8c976898a95..18f6733408b4 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> @@ -164,7 +164,7 @@ examples:
>              reg = <0 0xf80000>;
>          };
>          firmware@f80000 {
> -            label ="firmware";
> +            label = "firmware";
>              reg = <0xf80000 0x80000>;
>              read-only;
>          };
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 0fa2132fa4f4..400aedb58205 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -156,7 +156,7 @@ examples:
>          reg = <0x1101c000 0x1300>;
>          interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
>          interrupt-names = "macirq";
> -        phy-mode ="rgmii-rxid";
> +        phy-mode = "rgmii-rxid";
>          mac-address = [00 55 7b b5 7d f7];
>          clock-names = "axi",
>                        "apb",
> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
> index 50f46a6898b1..4adab0149108 100644
> --- a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
> @@ -42,8 +42,8 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      pmu {
> -        #address-cells=<2>;
> -        #size-cells=<2>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
>  
>          pmu@ff638000 {
>              compatible = "amlogic,g12a-ddr-pmu";
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index 26f2b887cfc1..b8d77165c4a1 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -83,7 +83,7 @@ examples:
>          clocks = <&clk26m>;
>          clock-output-names = "mipi_tx0_pll";
>          drive-strength-microamp = <4000>;
> -        nvmem-cells= <&mipi_tx_calibration>;
> +        nvmem-cells = <&mipi_tx_calibration>;
>          nvmem-cell-names = "calibration-data";
>          #clock-cells = <0>;
>          #phy-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> index 3100cb870170..76e8ca44906a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -75,7 +75,7 @@ additionalProperties: false
>  examples:
>    - |
>      remoteproc@1c {
> -      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +      compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>        reg = <0x1c 0x8>, <0x38 0x8>;
>        reg-names = "remap", "cpu";
>        resets = <&media_cpu_reset>;
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index 478214ab045e..a59d91243ac8 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -304,7 +304,7 @@ examples:
>    # Dual role switch with type-c
>    - |
>      usb@11201000 {
> -        compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
> +        compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
>          reg = <0x11201000 0x2e00>, <0x11203e00 0x0100>;
>          reg-names = "mac", "ippc";
>          interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
> diff --git a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
> index d25fc708e32c..fec5651f5602 100644
> --- a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
> @@ -92,7 +92,7 @@ examples:
>  
>          usb@31100000 {
>            compatible = "snps,dwc3";
> -          reg =<0x00 0x31100000 0x00 0x50000>;
> +          reg = <0x00 0x31100000 0x00 0x50000>;
>            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
>                         <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
>            interrupt-names = "host", "peripheral";
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
