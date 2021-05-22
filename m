Return-Path: <SRS0=olNe=KR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41650C2B9FB
	for <linux-mtd@archiver.kernel.org>; Sat, 22 May 2021 14:06:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE636115C
	for <linux-mtd@archiver.kernel.org>; Sat, 22 May 2021 14:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE636115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxpumpQvmDR89KsRozdEHV6tmyRx7FYXMBybbblMRLc=; b=i5qWSwUO6xKUE6XiFdlS+4pC4P
	crMJSXKiwPlRqnega/bK1VhCfJRah5fusMXFhkC2/JIMj8Sx/Y9QfWe/imbu22SM5472CHKKHEdJl
	svZeq45BDYrAtkKkSXboEbWqCzwfG0dedaRuDbiJKKEh6tUzaeJ8Me/fxPMjqucANhLIM1HcEdT4w
	abCPkjmzNRdaGxSDsYncEAPtfSIXq8z0rAI7TGlioZZvX2V7tk0LFExpEoSavRk60VMWB0rbBA5G9
	mfiMe+p+rKRMjhCX8mO8cq0TDl0h4/XFNjkO44RZwD4NqJUGF/nhR7kUSpCVSo4+WQHPOVyh1tPbc
	ew91L95A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkSFC-002aUa-ST; Sat, 22 May 2021 14:04:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkSEw-002aSn-4P; Sat, 22 May 2021 14:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7HRgIFQPUP56MKuO8AUNS9V7iufeOnWcpnwjXW4YiDg=; b=tADzkqwdPsBsSBQjLx7k0f6xO1
 QASiCbfkb/PSTwnHrfv4S9Olwr+6Ncg2pmAQu+bai+qR8/Jl07i/FbrKSr+3HCvSEN4yYJFi+QM/f
 8rTW8co8zpcyFqZ4sHAAxg34vE9GaMeTayHK0A2m2jwFebBEYWYevhsDbUm8iFnYrFR8j/lYBsqaH
 LgMhN3Cnqu8q2d4/YRtyYYNrxToHAxH2lUgrPsKuKyzlk0CDuK+kRas8bYzYJN8On3JxSDc1NvFK/
 5ASAdLGlRIWR0NzHB7V2cK7d/oF1HJ9eyOHBTfEK8Lg4rB012dipoLNc6ESWcDXJj/zZQCBqmS/yD
 Xa/lMnnQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkSEq-0007pi-TI; Sat, 22 May 2021 14:04:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46EE161164;
 Sat, 22 May 2021 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621692262;
 bh=RzG7rXSfCiMQoKs6IyW9Xa43Cw7RMz3iXDYHbLHmoGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZvhOMVEZ4ellYIdvEM8bpzjYn5Hf1Pm5+Ar8RYBMjkBW/qYZgh8TZFFZs+LETGuV
 ttH4p/mO6dBpNaWkxLuh6sox011Pb1siv6Nt6VfKRXG9KJljiQMBFcxrJbWj5eldeS
 7uazWlSZT5dCZ6MoCNth07O+72sH1z5kOJ/qM21QrMVKMYM+rD7e13UNTc39Jf/RfK
 BbIIOP75z/Vn4LYrad3mo/PW+YSO7KHmVW16X5cEMeEBvM6oUB6+Jz5hUJkZgyWYbH
 ApOPXBCMhyNhsUUz8nFEA8Ni9yPXolLmoEezy6ck/G24RImneC+VRUWSsEW+Hkedgm
 nTmR6vyGf6MKw==
Date: Sat, 22 May 2021 22:04:14 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCHv2 5/5] ARM: dts: imx6: Add GE B1x5v2
Message-ID: <20210522140412.GC8194@dragon>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-6-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-6-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_070425_085443_B2B6B482 
X-CRM114-Status: GOOD (  20.01  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 12:29:53AM +0200, Sebastian Reichel wrote:
> This adds device tree files for the General Electric Healthcare
> (GEHC) B1x5v2 series. All models make use of Congatec's QMX6 module,
> which is described in its own device tree include, so that it can
> also be used by other boards.
> =

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm/boot/dts/Makefile            |   5 +
>  arch/arm/boot/dts/imx6dl-b105pv2.dts  |  35 ++
>  arch/arm/boot/dts/imx6dl-b105v2.dts   |  35 ++
>  arch/arm/boot/dts/imx6dl-b125pv2.dts  |  33 ++
>  arch/arm/boot/dts/imx6dl-b125v2.dts   |  33 ++
>  arch/arm/boot/dts/imx6dl-b155v2.dts   |  36 ++
>  arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi | 434 ++++++++++++++++++
>  arch/arm/boot/dts/imx6dl-b1x5v2.dtsi  |  61 +++
>  arch/arm/boot/dts/imx6dl-qmx6.dtsi    | 624 ++++++++++++++++++++++++++
>  9 files changed, 1296 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-b105pv2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-b105v2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-b125pv2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-b125v2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-b155v2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6dl-qmx6.dtsi
> =

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f8f09c5066e7..811f22ed1e37 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -515,6 +515,11 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6q-dms-ba16.dtb \
>  	imx6q-emcon-avari.dtb \
>  	imx6q-evi.dtb \
> +	imx6dl-b105v2.dtb \
> +	imx6dl-b105pv2.dtb \

'p' goes before 'v'.

> +	imx6dl-b125v2.dtb \
> +	imx6dl-b125pv2.dtb \
> +	imx6dl-b155v2.dtb \
>  	imx6q-gk802.dtb \
>  	imx6q-gw51xx.dtb \
>  	imx6q-gw52xx.dtb \
> diff --git a/arch/arm/boot/dts/imx6dl-b105pv2.dts b/arch/arm/boot/dts/imx=
6dl-b105pv2.dts
> new file mode 100644
> index 000000000000..0d5be2f9471f
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b105pv2.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B105Pv2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +/dts-v1/;
> +#include "imx6dl-b1x5pv2.dtsi"
> +
> +/ {
> +	model =3D "General Electric B105Pv2";
> +	compatible =3D "ge,imx6dl-b105pv2", "congatec,qmx6", "fsl,imx6dl";
> +
> +	panel {
> +		compatible =3D "auo,g101evn010";
> +		status =3D "okay";

Unneeded okay status.

> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen@41 {
> +		reg =3D <0x41>;

We generally start property list with 'compatible'.

> +		compatible =3D "ilitek,ili251x";
> +

In general, we do not use newline in middle of property list.

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D<&pinctrl_q7_gpio0>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_LOW>;
> +
> +		touchscreen-size-x =3D <1280>;
> +		touchscreen-size-y =3D <800>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-b105v2.dts b/arch/arm/boot/dts/imx6=
dl-b105v2.dts
> new file mode 100644
> index 000000000000..72a085348304
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b105v2.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B105v2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +/dts-v1/;
> +#include "imx6dl-b1x5v2.dtsi"
> +
> +/ {
> +	model =3D "General Electric B105v2";
> +	compatible =3D "ge,imx6dl-b105v2", "congatec,qmx6", "fsl,imx6dl";
> +
> +	panel {
> +		compatible =3D "auo,g101evn010";
> +		status =3D "okay";
> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen@41 {
> +		reg =3D <0x41>;
> +		compatible =3D "ilitek,ili251x";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D<&pinctrl_q7_gpio0>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_LOW>;
> +
> +		touchscreen-size-x =3D <1280>;
> +		touchscreen-size-y =3D <800>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-b125pv2.dts b/arch/arm/boot/dts/imx=
6dl-b125pv2.dts
> new file mode 100644
> index 000000000000..8fd6c8ed6750
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b125pv2.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B125Pv2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +/dts-v1/;
> +#include "imx6dl-b1x5pv2.dtsi"
> +
> +/ {
> +	model =3D "General Electric B125Pv2";
> +	compatible =3D "ge,imx6dl-b125pv2", "congatec,qmx6", "fsl,imx6dl";
> +
> +	panel {
> +		compatible =3D "auo,g121ean01";
> +		status =3D "okay";
> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen@2a {
> +		reg =3D <0x2a>;
> +		compatible =3D "eeti,exc80h60";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D<&pinctrl_q7_gpio0>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-b125v2.dts b/arch/arm/boot/dts/imx6=
dl-b125v2.dts
> new file mode 100644
> index 000000000000..eb26ffde9f72
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b125v2.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B125v2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +/dts-v1/;
> +#include "imx6dl-b1x5v2.dtsi"
> +
> +/ {
> +	model =3D "General Electric B125v2";
> +	compatible =3D "ge,imx6dl-b125v2", "congatec,qmx6", "fsl,imx6dl";
> +
> +	panel {
> +		compatible =3D "auo,g121ean01";
> +		status =3D "okay";
> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen@2a {
> +		reg =3D <0x2a>;
> +		compatible =3D "eeti,exc80h60";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D<&pinctrl_q7_gpio0>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-b155v2.dts b/arch/arm/boot/dts/imx6=
dl-b155v2.dts
> new file mode 100644
> index 000000000000..620cd6f9da82
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b155v2.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B155v2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +/dts-v1/;
> +#include "imx6dl-b1x5v2.dtsi"
> +
> +/ {
> +	model =3D "General Electric B155v2";
> +	compatible =3D "ge,imx6dl-b155v2", "congatec,qmx6", "fsl,imx6dl";
> +
> +	panel {
> +		compatible =3D "auo,g156xtn01";
> +		status =3D "okay";
> +	};
> +};
> +
> +&i2c3 {
> +	touchscreen@2a {
> +		reg =3D <0x2a>;
> +		compatible =3D "eeti,exc80h84";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D<&pinctrl_q7_gpio0>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +
> +		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi b/arch/arm/boot/dts/im=
x6dl-b1x5pv2.dtsi
> new file mode 100644
> index 000000000000..1f9e66e1afc0
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B1x5v2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +#include <dt-bindings/input/input.h>
> +#include "imx6dl-qmx6.dtsi"
> +
> +/ {
> +	chosen {
> +		stdout-path =3D &uart3;
> +	};
> +
> +	/* Do not allow frequencies above 800MHz */
> +	cpus {
> +		cpu@0 {
> +			operating-points =3D <
> +				/* kHz    uV */
> +				792000  1175000
> +				396000  1150000
> +			>;
> +			fsl,soc-operating-points =3D <
> +				/* ARM kHz	SOC-PU uV */
> +				792000	1175000
> +				396000	1175000
> +			>;
> +		};
> +
> +		cpu@1 {
> +			operating-points =3D <
> +				/* kHz    uV */
> +				792000  1175000
> +				396000  1150000
> +			>;
> +			fsl,soc-operating-points =3D <
> +				/* ARM kHz	SOC-PU uV */
> +				792000	1175000
> +				396000	1175000
> +			>;
> +		};
> +	};
> +
> +	reg_syspwr: regulator-12v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "SYS_PWR";
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		regulator-always-on;

always-on is meaningless for a regulator that doesn't have on/off
control.

> +	};
> +
> +	reg_5v_pmc: regulator-5v-pmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5V PMC";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_syspwr>;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5V";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_syspwr>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_syspwr>;
> +	};
> +
> +	reg_5v0_audio: regulator-5v0-audio {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5V0_AUDIO";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&reg_5v>;
> +

Unneeded newline.

> +		gpio =3D <&tca6424a 16 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +

Ditto

> +		/*
> +		 * This must be always-on for da7212, which has some not
> +		 * properly documented dependencies for it's speaker supply
> +		 * pin. The issue manifests as speaker volume being very low.
> +		 */
> +		regulator-always-on;
> +	};
> +
> +
> +	reg_3v3_audio: regulator-3v3-audio {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3V3_AUDIO";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&reg_3v3>;
> +
> +		pinctrl-0 =3D <&pinctrl_q7_hda_rst>;
> +		pinctrl-names =3D "default";
> +		gpio =3D <&gpio6 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_2v5_audio: regulator-2v5-audio {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "2V5_AUDIO";
> +		regulator-min-microvolt =3D <2500000>;
> +		regulator-max-microvolt =3D <2500000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_3v3_audio>;
> +
> +	};
> +
> +	reg_wlan: regulator-wlan {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "WLAN";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&reg_3v3>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_sdio_pwr>;
> +		gpio =3D <&gpio4 30 GPIO_ACTIVE_HIGH>;
> +
> +		startup-delay-us =3D <70000>;
> +		enable-active-high;

Put it right after GPIO_ACTIVE_HIGH line.

> +	};
> +
> +	reg_bl: regulator-backlight {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "LED_VCC";
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		vin-supply =3D <&reg_syspwr>;
> +
> +		pinctrl-0 =3D <&pinctrl_q7_lcd_power>;
> +		pinctrl-names =3D "default";
> +		gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_lcd: regulator-lcd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "LCD_5V";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&reg_5v>;
> +	};
> +
> +	usb_power: regulator-usb-power {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "USB POWER";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&reg_5v>;
> +	};
> +
> +	charger: battery-charger {
> +		compatible =3D "gpio-charger"; /* ti,bq24172 */
> +
> +		charger-type =3D "mains";
> +		gpios =3D <&tca6424a 3 GPIO_ACTIVE_LOW>;
> +		charge-current-limit-gpios =3D <&tca6424a 11 GPIO_ACTIVE_HIGH>,
> +					     <&tca6424a 12 GPIO_ACTIVE_HIGH>;
> +		charge-current-limit-mapping =3D <1300000 0x0>,
> +					       <700000 0x1>,
> +					       <0 0x2>;
> +
> +		charge-status-gpios =3D <&tca6424a 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	poweroff {
> +		compatible =3D "gpio-poweroff";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_spi_cs1>;
> +		gpios =3D <&gpio4 25 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	power-button-key {
> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_slp_btn>;
> +
> +		power-button {
> +			label =3D "power button";
> +			gpios =3D <&gpio4 7 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_POWER>;
> +		};
> +	};
> +
> +	rotary-encoder-key {
> +		compatible =3D "gpio-keys";
> +
> +		rotary-encoder-press {
> +			label =3D "rotary-encoder press";
> +			gpios =3D <&tca6424a 0 GPIO_ACTIVE_HIGH>;
> +			linux,code =3D <KEY_ENTER>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	rotary-encoder {
> +		compatible =3D "rotary-encoder";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_gpio2 &pinctrl_q7_gpio4>;
> +		gpios =3D <&gpio4 26 GPIO_ACTIVE_LOW>, <&gpio1 0 GPIO_ACTIVE_LOW>;
> +		rotary-encoder,relative-axis;
> +		rotary-encoder,steps-per-period =3D <2>;
> +		wakeup-source;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_gpio1 &pinctrl_q7_gpio3 &pinctrl_q7_gpio5>;
> +
> +		alarm1 {
> +			label =3D "alarm:red";
> +			gpios =3D <&gpio1 8 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		alarm2 {
> +			label =3D "alarm:yellow";
> +			gpios =3D <&gpio4 27 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		alarm3 {
> +			label =3D "alarm:blue";
> +			gpios =3D <&gpio4 15 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_backlight_enable>;
> +		power-supply =3D <&reg_bl>;
> +		pwms =3D <&pwm4 0 5000000 0>;
> +		brightness-levels =3D <0 255>;
> +		num-interpolated-steps =3D <255>;
> +		default-brightness-level =3D <179>;
> +		enable-gpios =3D <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +		status =3D "okay";

Unneeded okay status.

> +	};
> +
> +	panel {
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_lcd>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&lvds0_out>;
> +			};
> +		};
> +	};
> +
> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&dailink_master>;
> +		simple-audio-card,frame-master =3D <&dailink_master>;
> +
> +		simple-audio-card,widgets =3D "Speaker", "Ext Spk";
> +		simple-audio-card,audio-routing =3D "Ext Spk", "LINE";
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&ssi1>;
> +		};
> +
> +		dailink_master: simple-audio-card,codec {
> +			sound-dai =3D <&codec>;
> +		};
> +	};
> +
> +	clk_ext_audio_codec: clock-codec {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <12288000>;
> +	};
> +};
> +
> +&i2c1 {
> +	battery: battery@b {
> +		compatible =3D "ti,bq20z65", "sbs,sbs-battery";
> +		reg =3D <0x0b>;
> +
> +		sbs,battery-detect-gpios =3D <&tca6424a 5 GPIO_ACTIVE_LOW>;
> +		sbs,i2c-retry-count =3D <5>;
> +
> +		power-supplies =3D <&charger>;
> +	};
> +
> +	codec: audio-codec@1a {
> +		compatible =3D "dlg,da7212";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		VDDA-supply =3D <&reg_2v5_audio>;
> +		VDDSP-supply =3D <&reg_5v0_audio>;
> +		VDDMIC-supply =3D <&reg_3v3_audio>;
> +		VDDIO-supply =3D <&reg_3v3_audio>;
> +		clocks =3D <&clk_ext_audio_codec>;
> +		clock-names =3D "mclk";
> +	};
> +};
> +
> +&i2c5 {
> +	tmp75: temperature-sensor@48 {
> +		compatible =3D "ti,tmp75";
> +		reg =3D <0x48>;
> +		vs-supply =3D <&reg_3v3>;
> +		interrupt-parent =3D <&tca6424a>;
> +		interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	tca6424a: gpio-controller@22 {
> +		compatible =3D "ti,tca6424";
> +		reg =3D <0x22>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&reg_3v3>;
> +
> +		interrupt-parent =3D <&gpio7>;
> +		interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_gpio6>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +
> +		gpio-line-names =3D "GPIO_ROTOR#", "ACM_IO_INT", "TMP_SENSOR_IRQ", "AC=
_IN",
> +				  "TF_S", "BATT_T", "LED_INC_CHAR", "ACM1_OCF",
> +				  "ACM2_OCF", "ACM_IO_RST", "USB1_POWER_EN", "EGPIO_CC_CTL0",
> +				  "EGPIO_CC_CTL1", "12V_OEMNBP_EN", "CP2105_RST", "",
> +				  "SPEAKER_PA_EN", "ARM7_UPI_RESET", "ARM7_PWR_RST", "NURSE_CALL",
> +				  "MARKER_EN", "EGPIO_TOUCH_RST", "PRESSURE_INT1", "PRESSURE_INT2";
> +
> +	};
> +};
> +
> +&fec {
> +	status =3D "okay";
> +};
> +
> +&hdmi {
> +	status =3D "okay";
> +};
> +
> +&audmux {

Sort them alphabetically.

> +	status =3D "okay";
> +};
> +
> +&ssi1 {
> +	fsl,mode =3D "i2s-slave";
> +	status =3D "okay";
> +};
> +
> +&usbotg {
> +	vbus-supply =3D <&usb_power>;
> +	disable-over-current;
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +
> +	/*
> +	 * TPS2051BDGN fault-gpio is connected to Q7[86] USB_0_1_OC_N.
> +	 * On QMX6 this is not connceted to the i.MX6, but to the USB Hub
> +	 * from &usbh1. This means, that we cannot easily detect and handle
> +	 * over-current events. Fortunately the regulator limits the current
> +	 * automatically, so the hardware is still protected.
> +	 */
> +};
> +
> +&pwm4 {
> +	status =3D "okay";
> +};
> +
> +&ldb {
> +	status =3D "okay";
> +
> +	lvds0: lvds-channel@0 {
> +		status =3D "okay";

We generally end property list with 'status'.

> +		fsl,data-mapping =3D "spwg";
> +		fsl,data-width =3D <24>;
> +
> +		port@4 {
> +			reg =3D <4>;

Have a newline between property list and child node.

> +			lvds0_out: endpoint {
> +				remote-endpoint =3D <&panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&usdhc4 {
> +	/* WiFi module */
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc4>;
> +
> +	bus-width =3D <4>;
> +	no-1-8-v;
> +	non-removable;
> +	wakeup-source;
> +	keep-power-in-suspend;
> +	cap-power-off-card;
> +	max-frequency =3D <25000000>;
> +	vmmc-supply =3D <&reg_wlan>;
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	wlcore: wlcore@2 {
> +		compatible =3D "ti,wl1837";
> +		reg =3D <2>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_q7_gpio7>;
> +
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		tcxo-clock-frequency =3D <26000000>;
> +	};
> +

Unneeded newline.

> +};
> diff --git a/arch/arm/boot/dts/imx6dl-b1x5v2.dtsi b/arch/arm/boot/dts/imx=
6dl-b1x5v2.dtsi
> new file mode 100644
> index 000000000000..b4c6fbd802fb
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-b1x5v2.dtsi
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for General Electric B1x5v2
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +
> +#include <dt-bindings/input/input.h>
> +#include "imx6dl-b1x5pv2.dtsi"
> +
> +/ {
> +	reg_3v3_acm: regulator-3v3-acm {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3V3 ACM";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_3v3>;
> +	};
> +};
> +
> +&i2c1 {
> +	tca6416: gpio-controller@21 {
> +		compatible =3D "ti,tca6416";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&reg_3v3_acm>;
> +
> +		/*
> +		 * TCA6424 cannot handle low type interrupts at the moment and
> +		 * it cannot be added without quite a few hacks. Since this
> +		 * controller does not have any input type GPIOs, pretend that
> +		 * the interrupt pin is unconnected.
> +		 */
> +		//interrupt-parent =3D <&tca6424a>;
> +		//interrupts =3D <1 IRQ_TYPE_LEVEL_LOW>;
> +		//interrupt-controller;
> +		//#interrupt-cells =3D <2>;

Maintain commented code out-of-tree please.

> +
> +		reset-gpios =3D <&tca6424a 9 GPIO_ACTIVE_LOW>;
> +
> +		gpio-line-names =3D "ACM1_EN", "ACM1_CL0", "ACM1_CL1", "ACM1_CL2",
> +				  "", "ACM2_EN", "ACM2_CL0", "ACM2_CL1",
> +				  "ACM2_CL2", "", "", "",
> +				  "", "", "", "";
> +	};
> +};
> +
> +&i2c5 {
> +	mpl3115a2: pressure-sensor@60 {
> +		compatible =3D "fsl,mpl3115";
> +		reg =3D <0x60>;
> +
> +		vcc-supply =3D <&reg_3v3_acm>;
> +
> +		/* The MPL3115 binding does not yet support interrupts */
> +		//interrupt-parent =3D <&tca6424a>;
> +		//interrupts =3D <22 IRQ_TYPE_EDGE_RISING 23 IRQ_TYPE_EDGE_RISING>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/imx6d=
l-qmx6.dtsi
> new file mode 100644
> index 000000000000..575dad47bf72
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-qmx6.dtsi
> @@ -0,0 +1,624 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +//
> +// Device Tree Source for i.MX6DL based congatec QMX6
> +//
> +// Copyright 2018-2021 General Electric Company
> +// Copyright 2018-2021 Collabora
> +// Copyright 2016 congatec AG
> +
> +#include "imx6dl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/fsl-imx-audmux.h>
> +
> +/ {
> +	memory@10000000 {
> +		reg =3D <0x10000000 0x40000000>;
> +	};
> +
> +	reg_3p3v: 3p3v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3P3V";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	i2cmux {
> +		compatible =3D "i2c-mux-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		mux-gpios =3D <&gpio6 9 GPIO_ACTIVE_HIGH>;
> +		i2c-parent =3D <&i2c2>;
> +
> +		i2c5: i2c@0 {
> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c6: i2c@1 {
> +			reg =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +	};
> +};
> +
> +&ecspi1 {
> +	fsl,spi-num-chipselects =3D <1>;

Is it supported?

> +	cs-gpios =3D <&gpio3 19 0>;

Use define for polarity.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_ecspi1>;
> +	status =3D "okay";
> +
> +	flash@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "sst,sst25vf032b", "jedec,spi-nor";
> +		spi-max-frequency =3D <20000000>;
> +		reg =3D <0>;
> +
> +		partition@0 {
> +			label =3D "bootloader";
> +			reg =3D <0x0000000 0x100000>;
> +		};
> +
> +		partition@100000 {
> +			label =3D "user";
> +			reg =3D <0x0100000 0x2fc000>;
> +		};
> +
> +		partition@3fc000 {
> +			label =3D "reserved";
> +			reg =3D <0x03fc000 0x4000>;
> +			read-only;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enet &pinctrl_phy_reset>;
> +	phy-mode =3D "rgmii-id";
> +	phy-reset-gpios =3D <&gpio3 23 GPIO_ACTIVE_LOW>;
> +	fsl,magic-packet;
> +	phy-handle =3D <&phy0>;
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: ethernet-phy@6 {
> +			reg =3D <6>;
> +			qca,clk-out-frequency =3D <125000000>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	pmic@8 {
> +		compatible =3D "fsl,pfuze100";
> +		reg =3D <0x08>;
> +
> +		regulators {
> +			sw1a_reg: sw1ab {
> +				regulator-min-microvolt =3D <300000>;
> +				regulator-max-microvolt =3D <1875000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay =3D <6250>;
> +			};
> +
> +			sw1c_reg: sw1c {
> +				regulator-min-microvolt =3D <300000>;
> +				regulator-max-microvolt =3D <1875000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay =3D <6250>;
> +			};
> +
> +			sw2_reg: sw2 {
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			sw3a_reg: sw3a {
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1975000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			sw3b_reg: sw3b {
> +				regulator-min-microvolt =3D <400000>;
> +				regulator-max-microvolt =3D <1975000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			sw4_reg: sw4 {
> +				regulator-min-microvolt =3D <675000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			swbst_reg: swbst {
> +				regulator-min-microvolt =3D <5000000>;
> +				regulator-max-microvolt =3D <5150000>;
> +			};
> +
> +			snvs_reg: vsnvs {
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <3000000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vref_reg: vrefddr {
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/*
> +			 * keep VGEN3, VGEN4 and VGEN5 enabled in order to
> +			 * maintain backward compatibility with hw-rev. A.0
> +			 */
> +			vgen3_reg: vgen3 {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			vgen4_reg: vgen4 {
> +				regulator-min-microvolt =3D <2500000>;
> +				regulator-max-microvolt =3D <2500000>;
> +				regulator-always-on;
> +			};
> +
> +			vgen5_reg: vgen5 {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			/* supply voltage for eMMC */
> +			vgen6_reg: vgen6 {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&pcie {
> +	reset-gpio =3D <&gpio1 20 0>;
> +};
> +
> +&audmux {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_audmux>;
> +
> +	audmux_ssi1 {
> +		fsl,audmux-port =3D <MX51_AUDMUX_PORT1_SSI0>;
> +		fsl,port-config =3D <
> +			(IMX_AUDMUX_V2_PTCR_TFSDIR |
> +			IMX_AUDMUX_V2_PTCR_TFSEL(MX51_AUDMUX_PORT6) |
> +			IMX_AUDMUX_V2_PTCR_TCLKDIR |
> +			IMX_AUDMUX_V2_PTCR_TCSEL(MX51_AUDMUX_PORT6) |
> +			IMX_AUDMUX_V2_PTCR_SYN)
> +			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT6)
> +		>;
> +	};
> +
> +	audmux_aud6 {
> +		fsl,audmux-port =3D <MX51_AUDMUX_PORT6>;
> +		fsl,port-config =3D <
> +			IMX_AUDMUX_V2_PTCR_SYN
> +			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT1_SSI0)
> +		>;
> +	};
> +};
> +
> +&clks {
> +	assigned-clocks =3D <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> +			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> +	assigned-clock-parents =3D <&clks IMX6QDL_CLK_PLL2_PFD0_352M>,
> +				 <&clks IMX6QDL_CLK_PLL2_PFD0_352M>;
> +};
> +
> +&i2c1 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +	pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> +	scl-gpios =3D <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio3 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
> +	scl-gpios =3D <&gpio4 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio4 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> +	scl-gpios =3D <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +	status =3D "okay";
> +
> +	rtc: m41t62@68 {
> +		compatible =3D "st,m41t62";
> +		reg =3D <0x68>;
> +
> +		rtc_sqw: clock {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <32768>;
> +		};
> +	};
> +};
> +
> +&clks {
> +	clocks =3D <&rtc_sqw>;
> +	clock-names =3D "ckil";
> +};
> +
> +&pwm4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm4>;
> +};
> +
> +&reg_arm {
> +	vin-supply =3D <&sw1a_reg>;
> +};
> +
> +&reg_pu {
> +	vin-supply =3D <&sw1c_reg>;
> +};
> +
> +&reg_soc {
> +	vin-supply =3D <&sw1c_reg>;
> +};
> +
> +&snvs_poweroff {
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart2>;
> +	status =3D "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart3>;
> +	status =3D "okay";
> +};
> +
> +&usdhc2 {
> +	/* MicroSD card slot */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>;
> +	cd-gpios =3D <&gpio1 4 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	vmmc-supply =3D <&reg_3p3v>;
> +	status =3D "okay";
> +};
> +
> +&usdhc3 {
> +	/* eMMC module */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> +	non-removable;
> +	bus-width =3D <8>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	vmmc-supply =3D <&reg_3p3v>;
> +	status =3D "okay";
> +};
> +
> +&usbh1 {
> +	/* Connected to USB-Hub SMSC USB2514, provides P0, P2, P3, P4 on Qseven=
 connector */
> +	vbus-supply =3D <&reg_5v>;
> +	status =3D "okay";
> +};
> +
> +&usbotg {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usbotg>;
> +};
> +
> +&wdog1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +};
> +
> +&iomuxc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_hog>;
> +
> +	qmx6mux: imx6qdl-qmx6 {
> +	};

What is this for?

> +};
> +
> +&qmx6mux {
> +	pinctrl_hog: hoggrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000 /* PCIE_WAKE_B */
> +			MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09	0x80000000 /* I2C multiplexer */
> +			MX6QDL_PAD_NANDF_D6__GPIO2_IO06		0x80000000 /* SD4_CD# */
> +			MX6QDL_PAD_NANDF_D7__GPIO2_IO07		0x80000000 /* SD4_WP */
> +			MX6QDL_PAD_CSI0_MCLK__CCM_CLKO1		0x80000000 /* Camera MCLK */
> +		>;
> +	};
> +
> +	/* Watchdog output signal */
> +	pinctrl_wdog: wdoggrp {

Sort pinctrl nodes alphabetically.

Shawn

> +		fsl,pins =3D <
> +			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_q7_hda_rst: hdarstgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x1b0b0 /* Q7[61] HDA_RST_N */
> +		>;
> +	};
> +
> +	pinctrl_q7_backlight_enable: blengrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x1b0b0 /* Q7[112] LVDS_BLEN */
> +		>;
> +	};
> +
> +	pinctrl_audmux: audmuxgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x110b0 /* Q7[67] HDA_SDO */
> +			MX6QDL_PAD_DI0_PIN3__AUD6_TXFS		0x130b0 /* Q7[59] HDA_SYNC */
> +			MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x130b0 /* Q7[65] HDA_SDI */
> +			MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x130b0 /* Q7[63] HDA_BITCLK */
> +		>;
> +	};
> +
> +	/* SPI bus does not leave System on Module */
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
> +			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
> +			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
> +			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0
> +		>;
> +	};
> +
> +	/* PHY is on System on Module, Q7[3-15] have Ethernet lines */
> +	pinctrl_enet: enetgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
> +			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
> +			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
> +			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
> +			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
> +			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
> +			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
> +			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
> +			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
> +			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
> +			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
> +			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
> +			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
> +			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
> +			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
> +			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
> +		>;
> +	};
> +
> +	/* RGMII Phy Reset */
> +	pinctrl_phy_reset: phyrstgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1 /* Q7[66] I2C_CLK */
> +			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1 /* Q7[68] I2C_DAT */
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D21__GPIO3_IO21		0x1b0b0 /* Q7[66] I2C_CLK */
> +			MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x1b0b0 /* Q7[68] I2C_DAT */
> +		>;
> +	};
> +
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1 /* Q7[152] SDVO_CTRL_CLK */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1 /* Q7[150] SDVO_CTRL_DAT */
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2gpiogrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x1b0b0 /* Q7[152] SDVO_CTRL_CLK */
> +			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x1b0b0 /* Q7[150] SDVO_CTRL_DAT */
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1 /* Q7[60] SMB_CLK */
> +			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1 /* Q7[62] SMB_DAT */
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3gpiogrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_3__GPIO1_IO03		0x1b0b0 /* Q7[60] SMB_CLK */
> +			MX6QDL_PAD_GPIO_6__GPIO1_IO06		0x1b0b0 /* Q7[62] SMB_DAT */
> +		>;
> +	};
> +
> +	pinctrl_pwm4: pwm4grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1 /* Q7[123] LVDS_BLT_CTRL */
> +		>;
> +	};
> +
> +	/* Debug connector on Q7 module */
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
> +			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1 /* Q7[177] UART0_RX */
> +			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1 /* Q7[171] UART0_TX */
> +		>;
> +	};
> +
> +	/* =B5SD card slot on Q7 module */
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
> +			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
> +			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
> +			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
> +			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
> +			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
> +			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0 /* SD2_CD */
> +		>;
> +	};
> +
> +	/* eMMC module on Q7 module */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
> +			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
> +			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
> +			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
> +			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
> +			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
> +			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
> +			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
> +			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
> +			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
> +		>;
> +	};
> +
> +
> +	pinctrl_usdhc4: usdhc4grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059 /* Q7[45] SDIO_CMD */
> +			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x17059 /* Q7[42] SDIO_CLK */
> +			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059 /* Q7[48] SDIO_DAT1 */
> +			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059 /* Q7[49] SDIO_DAT0 */
> +			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059 /* Q7[50] SDIO_DAT3 */
> +			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059 /* Q7[51] SDIO_DAT2 */
> +		>;
> +	};
> +
> +	pinctrl_q7_slp_btn: q7slpbtngrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0 /* Q7[21] SLP_BTN# */
> +		>;
> +	};
> +
> +	pinctrl_q7_sdio_pwr: q7sdiopwrgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30	0x1b0b0 /* Q7[47] SDIO_PWR# */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio0: q7gpio0grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b0 /* Q7[185] GPIO0 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio1: q7gpio1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x1b0b0 /* Q7[186] GPIO1 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio2: q7gpio2grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DISP0_DAT5__GPIO4_IO26	0x1b0b0 /* Q7[187] GPIO2 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio3: q7gpio3grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DISP0_DAT6__GPIO4_IO27	0x1b0b0 /* Q7[188] GPIO3 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio4: q7gpio4grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0 /* Q7[189] GPIO4 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio5: q7gpio5grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0 /* Q7[190] GPIO5 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio6: q7gpio6grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_16__GPIO7_IO11		0x1b0b0 /* Q7[191] GPIO6 */
> +		>;
> +	};
> +
> +	pinctrl_q7_gpio7: q7gpio7grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0 /* Q7[192] GPIO7 */
> +		>;
> +	};
> +
> +	pinctrl_usbotg: usbotggrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059 /* Q7[92] USB_ID */
> +		>;
> +	};
> +
> +	pinctrl_q7_lcd_power: lcdpwrgrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_GPIO_7__GPIO1_IO07		0x1b0b0 /* Q7[111] LVDS_PPEN */
> +		>;
> +	};
> +
> +	pinctrl_q7_spi_cs1: spics1grp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_DISP0_DAT4__GPIO4_IO25	0x1b0b0 /* Q7[202] SPI_CS1# */
> +		>;
> +	};
> +};
> -- =

> 2.30.2
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
