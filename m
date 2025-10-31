Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54BBCCF9EE
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNuUgp0tXutwHOYDPhkpOfwBgH6XSrpFIk+ZtgHlIek=; b=HWZkJMvl1xxAb5
	J5/gdIVnqA5az2NqEm1wRn+c1ggjbQ8OkgObAo654NoVZ5IcQGPDnIJG01mgg+SfXSOwUw1dbcnoG
	hG1OkbsN9CdnXU51ghExBML92uIsuFJDXL0aKFpH6oMiA33wRJYeI+Ef+CZ3wEI4ouW2llXZjpSk0
	i26V3axrTgTKTUqiqDQ2aRlTxUUKUC+ErStlPSt0n50HCJW6KrvZ4BaPu57iXh5ux1CKTsdcsv3XF
	PK41EMF4TbBG5zghmPhgZgjwPWOdblt9RMGtxqaI1a/yuOeUgsKlhSZehUTkLX1VG40tI9tClOeqO
	e+IioMKaOVNI1932xydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEiwL-00000005Ue2-0MH4;
	Fri, 31 Oct 2025 06:48:49 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEiwD-00000005UcN-04iD;
	Fri, 31 Oct 2025 06:48:46 +0000
X-QQ-mid: esmtpgz13t1761893210tf21d82f4
X-QQ-Originating-IP: R90kadoSj/Lu9jhXDo3EOBK+P2zoChp7ZYtBXxB6TvQ=
Received: from [192.168.125.98] ( [113.104.140.154])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 31 Oct 2025 14:46:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1332421492275545379
Message-ID: <99841AD0EE6A35D4+4a6afacb-4d1c-4727-9a75-134190350aca@linux.starfivetech.com>
Date: Fri, 31 Oct 2025 14:46:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251023143957.2899600-1-robh@kernel.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MJegDAk7akMnPutOgGD+MrWmu2kVE+CLUb4qgIBITTJ5oEvA/NaqWaOd
	tREBpW7IbiBIz4cOQPW9Qi99rxq01qdH1RtU5sUl4eGCGSq7wsUYcoHAzPQAVeklxQNa7Ub
	qNXLqPgffxbbY+cnj69e/jtMc9ub2bDJqaFeZi4mRRaC1HMTxgPG7ZY4xZsZdGxWpFSxHjm
	4GqJdZZvN2moZccZqrvhvc8yRElWuujVMMU7TRuEta+Ty53cnk+KPmrAyBs++pQ80WG7Dcr
	XFfLOJ4O5J0U4xzYfXtYpnAQsGTD/9N9ZekxB7UJYqWFgnk+nrjRGOmMCDRvshmtDsyRWms
	/1VEdnKVw+OUxHuGNYb9wn/oQaYi7H9z94THvo43+iJ9VI5PO2CI/AdpCnV1HCKsOjjPbcI
	K0TVzg302gEgboT8oP2Ly36etyb1dKq4tqw/Vx0GIi/fZFT0zVu3vBsVQQweibq8mqhKZqs
	6+866akdtqNl+2E/bw7G+tynGPSFXLjTcPq8YCIA+xtNPUk0fkro9RdYJrU367aAcFEBXnb
	6mmD1PMxIZwBpRquGM1vhm+TTxrqNgVcHAp+aulk8QXsLN+sfrsmwu9nJxHsuhJ8WqA6Zcd
	eZ+sXNnjMPk5k7JhQOXCAIxiuVRHHC5WrGzhQXNWYycMqQhdhDeyD3WdYX+c4fsajAH14dS
	I6gHlYUfalrr83pTSvTWlGMJ8nfUhM+MHPJn+27BUNTeSwQ1ezdb7HaBgQWrCR4M7n76/zU
	jCM11qOra8fmm+IEAT16kxztBfAuosOktPEujhextJMCEcXuFUTQtGCdePyS3E2nTpQbIGD
	PdWwPUL7qr3OHERAj76K6AIicHYiQjIHnTE28yu1vPE3SiChbkAGojGkRwJURr24hEraBXm
	ntV/YfxKvt4KckabE3Bqv5BYbBdawPZbQS3zDyzLjNOBOVqwuAyhJERS6lmPH9xco5aQFVM
	2gOoR82ISQAcC+ZOkV+2hjf9wblsYmC71TN4=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_234841_794467_9838091E 
X-CRM114-Status: GOOD (  15.77  )
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

On 10/23/2025 10:37 PM, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/.yamllint                  | 2 +-
>  Documentation/devicetree/bindings/arm/psci.yaml              | 1 -
>  .../bindings/clock/allwinner,sun4i-a10-gates-clk.yaml        | 1 -
>  .../devicetree/bindings/clock/renesas,cpg-mssr.yaml          | 1 -
>  .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml      | 1 -
>  .../display/allwinner,sun4i-a10-display-frontend.yaml        | 1 -
>  .../devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml | 1 -
>  .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml       | 1 -
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 1 -
>  .../devicetree/bindings/display/bridge/adi,adv7511.yaml      | 1 -
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 -
>  .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml | 1 -
>  .../devicetree/bindings/display/ilitek,ili9486.yaml          | 1 -
>  Documentation/devicetree/bindings/display/msm/gpu.yaml       | 1 -
>  .../devicetree/bindings/display/panel/panel-timing.yaml      | 1 -
>  .../devicetree/bindings/display/panel/tpo,tpg110.yaml        | 1 -
>  .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml | 1 -
>  .../devicetree/bindings/display/simple-framebuffer.yaml      | 1 -
>  .../devicetree/bindings/dma/snps,dma-spear1340.yaml          | 1 -
>  Documentation/devicetree/bindings/dma/stericsson,dma40.yaml  | 1 -
>  .../devicetree/bindings/dma/stm32/st,stm32-dma.yaml          | 1 -
>  Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml   | 1 -
>  .../devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml       | 1 -
>  Documentation/devicetree/bindings/fpga/fpga-region.yaml      | 5 -----
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml        | 1 -
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 1 -
>  Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml     | 1 -
>  Documentation/devicetree/bindings/hwmon/adi,max31827.yaml    | 1 -
>  Documentation/devicetree/bindings/hwmon/national,lm90.yaml   | 1 -
>  Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml       | 1 -
>  Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml     | 1 -
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml     | 1 -
>  .../devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml         | 1 -
>  Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 2 --
>  Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml   | 1 -
>  .../devicetree/bindings/iio/adc/cosmic,10001-adc.yaml        | 1 -
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 1 -
>  .../devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml     | 1 -
>  .../devicetree/bindings/iio/afe/voltage-divider.yaml         | 1 -
>  .../devicetree/bindings/iio/frequency/adi,admv4420.yaml      | 1 -
>  .../devicetree/bindings/iio/pressure/murata,zpa2326.yaml     | 1 -
>  .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml    | 1 -
>  .../devicetree/bindings/iio/temperature/adi,ltc2983.yaml     | 1 -
>  Documentation/devicetree/bindings/input/ti,drv266x.yaml      | 1 -
>  .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml | 1 -
>  .../bindings/interrupt-controller/aspeed,ast2700-intc.yaml   | 1 -
>  .../bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml     | 1 -
>  .../bindings/interrupt-controller/loongson,liointc.yaml      | 1 -
>  .../bindings/interrupt-controller/mediatek,mtk-cirq.yaml     | 1 -
>  .../bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml | 1 -
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml        | 4 ----
>  Documentation/devicetree/bindings/mailbox/arm,mhu.yaml       | 1 -
>  Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml     | 1 -
>  Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml | 1 -
>  Documentation/devicetree/bindings/media/amphion,vpu.yaml     | 1 -
>  Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml | 2 --
>  .../devicetree/bindings/media/i2c/techwell,tw9900.yaml       | 1 -
>  Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 1 -
>  .../devicetree/bindings/media/qcom,sc8280xp-camss.yaml       | 1 -
>  .../bindings/media/samsung,exynos4212-fimc-is.yaml           | 1 -
>  .../devicetree/bindings/media/samsung,s5pv210-jpeg.yaml      | 1 -
>  Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml  | 1 -
>  .../devicetree/bindings/media/video-interface-devices.yaml   | 4 ----
>  .../memory-controllers/qcom,ebi2-peripheral-props.yaml       | 1 -
>  Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml | 1 -
>  .../devicetree/bindings/mtd/amlogic,meson-nand.yaml          | 1 -
>  .../devicetree/bindings/mtd/marvell,nand-controller.yaml     | 1 -
>  Documentation/devicetree/bindings/mux/mux-controller.yaml    | 1 -
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml   | 2 --
>  Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml     | 1 -
>  .../devicetree/bindings/net/brcm,mdio-mux-iproc.yaml         | 1 -
>  .../devicetree/bindings/net/cortina,gemini-ethernet.yaml     | 1 -
>  Documentation/devicetree/bindings/net/fsl,gianfar.yaml       | 2 --
>  .../devicetree/bindings/net/mdio-mux-multiplexer.yaml        | 1 -
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
>  Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml    | 1 -
>  .../devicetree/bindings/net/wireless/ti,wlcore.yaml          | 1 -
>  .../devicetree/bindings/pci/altr,pcie-root-port.yaml         | 1 -
>  Documentation/devicetree/bindings/pci/loongson.yaml          | 1 -
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml  | 1 -
>  .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml        | 1 -
>  Documentation/devicetree/bindings/pci/versatile.yaml         | 1 -
>  .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 1 -
>  .../devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml   | 1 -
>  .../devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml        | 1 -
>  .../devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml     | 1 -
>  .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml      | 1 -
>  .../devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml        | 1 -
>  .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml      | 3 ---
>  .../devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml | 1 -
>  .../devicetree/bindings/power/supply/mt6360_charger.yaml     | 1 -
>  .../bindings/power/supply/stericsson,ab8500-charger.yaml     | 1 -
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml     | 1 -
>  .../bindings/regulator/richtek,rt6245-regulator.yaml         | 1 -
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml      | 2 --
>  Documentation/devicetree/bindings/reset/ti,sci-reset.yaml    | 1 -
>  .../bindings/rng/inside-secure,safexcel-eip76.yaml           | 2 --
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml     | 1 -
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml     | 1 -
>  .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml         | 1 -
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml      | 1 -
>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml       | 3 ---
>  Documentation/devicetree/bindings/sound/adi,adau1372.yaml    | 1 -
>  Documentation/devicetree/bindings/sound/adi,adau7118.yaml    | 1 -
>  .../devicetree/bindings/sound/rockchip,i2s-tdm.yaml          | 1 -
>  .../devicetree/bindings/sound/rockchip,rk3328-codec.yaml     | 2 +-
>  Documentation/devicetree/bindings/sound/samsung,tm2.yaml     | 1 -
>  .../devicetree/bindings/sound/ti,tlv320dac3100.yaml          | 1 -
>  Documentation/devicetree/bindings/sound/wlf,wm8903.yaml      | 1 -
>  .../devicetree/bindings/timer/nvidia,tegra-timer.yaml        | 1 -
>  .../devicetree/bindings/timer/nvidia,tegra186-timer.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml   | 1 -
>  116 files changed, 2 insertions(+), 136 deletions(-)
> 

...

> diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> index 5f432452c815..33c80626e8ec 100644
> --- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> @@ -16,7 +16,6 @@ properties:
>    compatible:
>      const: starfive,jh7110-pcie
>  
> -
>    reg:
>      maxItems: 2
>  

...

> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> index f3258f2fd3a4..3f14eab01c54 100644
> --- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> @@ -32,7 +32,6 @@ description: |
>      | | |     |   |   |          -------
>      UART0     UART1 --
>  
> -
>    The big MUX in the diagram only has 7 different ways of mapping peripherals
>    on the left to pins on the right. StarFive calls the 7 configurations "signal
>    groups".

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
