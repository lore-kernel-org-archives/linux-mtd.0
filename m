Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFA6C4829E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 20:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5r/PWPVTFBCE27zumc34hwOMufVmRiSdpWmddqZ7MwQ=; b=OtsscMi7x6EW4S
	Z4oK5rRRApsa/xuoaUW+vdHEXEUAwAXGX4k7rwLdru+P14LvR6F0o7UjFBhZ3+rRlQg2mw33rYLJZ
	Rpjq6Br4x1Jlq8utc+gX/99+Nhby6qu+pp77KoLoT2TuHLN3W6DlMZRZuuBcWlotDxxWRsidSkEJ5
	88C5eFcCqSIrzZ2OQoIN0jEXuigagF/UJXAxr83qbJyhzwmCG9E4MirXZGjHX4ItlHZQtIfIXyDU3
	J0GuU1TEPMkFM10i7szDvXEylC9F3A1DA8MxTJ4Fsc39yZu4Poq1Vr1nOwvKiDRr8HK466zWxJzQ2
	7oqtNXKVZ66kHCLiVdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZcZl-00000006pIG-3WrD;
	Mon, 12 Feb 2024 20:06:49 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZcZh-00000006pHO-0JSv;
	Mon, 12 Feb 2024 20:06:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0F5720003;
	Mon, 12 Feb 2024 20:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707768400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DmUCDESvsxbZN+wVj59NCC6P8oLMuz68MnJi+35+qlM=;
	b=NZIJN/dRwj4uo/4RHtNgV2rs3wfihfQB/dIO+krOPVIxVT9gJ41UqNlUlD5izVO2SujknE
	sUGS+/+xjldiHGdTBRRZ11lCzCL760fv/1VREKkQMqmTbHxqd/1fv3E/gFF/3LbhydrKBl
	++VF2PYRVPGt3praoi5Bs2UfnTXB2ox8vhR8jDvLHtLBp23j5pFJ8G8g79mzHAh2Gq6miq
	SNuyLMvakfrEvywhl/58+LjyIT+Xjy6LidrArONkg/O6vxUKBr23RLsQyf2oMYwI1Y76TB
	AK1+cOu07Ews3PIik4hewHaGvCBqt5rLBWeowV20F9iov1u1XJ+Ac1/PXJXBcQ==
Date: Mon, 12 Feb 2024 21:06:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-iio@vger.kernel.org, Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 2/7] dt-bindings: rtc: abx80x: convert to yaml
Message-ID: <2024021220055301ade3d4@mail.local>
References: <20240212-add-am64-som-v6-0-b59edb2bc8c3@solid-run.com>
 <20240212-add-am64-som-v6-2-b59edb2bc8c3@solid-run.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212-add-am64-som-v6-2-b59edb2bc8c3@solid-run.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_120645_565441_8E5FA061 
X-CRM114-Status: GOOD (  22.30  )
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

On 12/02/2024 18:38:09+0100, Josua Mayer wrote:
> Convert the abracon abx80x rtc text bindings to dt-schema format.
> 
> In addition to the text description reference generic interrupts
> properties and add an example.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Did something change since v6? If not, why didn't you collect the
reviewed-by tag?

> ---
>  .../devicetree/bindings/rtc/abracon,abx80x.txt     | 31 ---------
>  .../devicetree/bindings/rtc/abracon,abx80x.yaml    | 79 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> deleted file mode 100644
> index 2405e35a1bc0..000000000000
> --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Abracon ABX80X I2C ultra low power RTC/Alarm chip
> -
> -The Abracon ABX80X family consist of the ab0801, ab0803, ab0804, ab0805, ab1801,
> -ab1803, ab1804 and ab1805. The ab0805 is the superset of ab080x and the ab1805
> -is the superset of ab180x.
> -
> -Required properties:
> -
> - - "compatible": should one of:
> -        "abracon,abx80x"
> -        "abracon,ab0801"
> -        "abracon,ab0803"
> -        "abracon,ab0804"
> -        "abracon,ab0805"
> -        "abracon,ab1801"
> -        "abracon,ab1803"
> -        "abracon,ab1804"
> -        "abracon,ab1805"
> -        "microcrystal,rv1805"
> -	Using "abracon,abx80x" will enable chip autodetection.
> - - "reg": I2C bus address of the device
> -
> -Optional properties:
> -
> -The abx804 and abx805 have a trickle charger that is able to charge the
> -connected battery or supercap. Both the following properties have to be defined
> -and valid to enable charging:
> -
> - - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
> - - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
> -                          resistor, the other values are in kOhm.
> diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> new file mode 100644
> index 000000000000..58dbbca27deb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/abracon,abx80x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Abracon ABX80X I2C ultra low power RTC/Alarm chip
> +
> +maintainers:
> +  - linux-rtc@vger.kernel.org
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    description:
> +      The wildcard 'abracon,abx80x' may be used to support a mix
> +      of different abracon rtc`s. In this case the driver
> +      must perform auto-detection from ID register.
> +    enum:
> +      - abracon,abx80x
> +      - abracon,ab0801
> +      - abracon,ab0803
> +      - abracon,ab0804
> +      - abracon,ab0805
> +      - abracon,ab1801
> +      - abracon,ab1803
> +      - abracon,ab1804
> +      - abracon,ab1805
> +      - microcrystal,rv1805
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  abracon,tc-diode:
> +    description:
> +      Trickle-charge diode type.
> +      Required to enable charging backup battery.
> +
> +      Supported are 'standard' diodes with a 0.6V drop
> +      and 'schottky' diodes with a 0.3V drop.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - standard
> +      - schottky
> +
> +  abracon,tc-resistor:
> +    description:
> +      Trickle-charge resistor value in kOhm.
> +      Required to enable charging backup battery.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 3, 6, 11]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@69 {
> +            compatible = "abracon,abx80x";
> +            reg = <0x69>;
> +            abracon,tc-diode = "schottky";
> +            abracon,tc-resistor = <3>;
> +            interrupts = <44 IRQ_TYPE_EDGE_FALLING>;
> +        };
> +    };
> 
> -- 
> 2.35.3
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
