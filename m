Return-Path: <SRS0=t0FF=7M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2816C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 May 2020 11:04:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D662073B
	for <linux-mtd@archiver.kernel.org>; Sat, 30 May 2020 11:04:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyDGLIXV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="hKqIgArY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D662073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ixGiF6c43XKdZ8EJL1YyC+q/hAVjpvxrP13TbH7/qvM=; b=PyDGLIXVp9tOevmpGj9d9uL6L
	u4H/eSmZA+cRXIPmMvhnBnXT/lAo1PMS9gigOV/UOq6qwwwhp7pibhlIITTzmU5x2EuH6YpMOrsXj
	QwQ/sEumcVellgSUT03BGa7Y0sXH6+h83LKyO3skw/4DPWnWQenKjI31IIP6j7ZJl/djEv26KlgB4
	CgDOs29YFu/aTlfafc2SRLtcXAqK+kRe8emNMMqSEXbK1vCFwgwxGio/WGZnLJpDem0FQ1u0bXJ1i
	BAubQaOln0Nh7FDAZZzki+aWxDRrdMuXDoXAa5G1IpgmfUg34yYm6hJZfHKoDz/Iy7UAeHTFKPkJ0
	zjcFEOdIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jezII-0002Y1-Ja; Sat, 30 May 2020 11:04:50 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jezIF-0002XU-Bc
 for linux-mtd@lists.infradead.org; Sat, 30 May 2020 11:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590836681; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjKCJ0RKBPq+ZLWgI0sSnhwddRzJYbPqfTycyNegHHA=;
 b=hKqIgArY3Qz31Jz7Z5FSPBZQA7Wq0yYnCcAXAI4DLvRVWkwwDxxMDDgFzdI1uxoKaeYoZQ
 9byBGT5tZ4s2tzTOtRJgCmGqEc5pFQupBQ7mCW4JLvjnV1v+BojxV34S5vYYGzoAGL/+hG
 Ep6KuqIxiR4vN9ZPLCE2RDvW2B+OvVk=
Date: Sat, 30 May 2020 13:04:30 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Convert ingenic, pinctrl.txt
 to YAML
To: Rob Herring <robh@kernel.org>
Message-Id: <IF55BQ.VGY5UC52BWPU1@crapouillou.net>
In-Reply-To: <20200528214243.GA711753@bogus>
References: <20200520002234.418025-1-paul@crapouillou.net>
 <20200528214243.GA711753@bogus>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_040447_797715_906263B7 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

Le jeu. 28 mai 2020 =E0 15:42, Rob Herring <robh@kernel.org> a =E9crit :
> On Wed, May 20, 2020 at 02:22:32AM +0200, Paul Cercueil wrote:
>>  Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
>> =

>>  In the process, some compatible strings now require a fallback, as =

>> the
>>  corresponding SoCs are pin-compatible with their fallback variant.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>> =

>>  Notes:
>>      v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
>>          - remove 'additionalProperties: false' since we will have =

>> pin conf nodes
> =

> You need to describe those nodes and not just allow anything.

These nodes don't have any constraint on their name, so I would need a =

wildcard property for children nodes. That's not something I can =

express in YAML right now, is it?

-Paul

>> =

>>   .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 -----------
>>   .../bindings/pinctrl/ingenic,pinctrl.yaml     | 136 =

>> ++++++++++++++++++
>>   2 files changed, 136 insertions(+), 81 deletions(-)
>>   delete mode 100644 =

>> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>>   create mode 100644 =

>> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> =

> =

>>  diff --git =

>> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml =

>> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>>  new file mode 100644
>>  index 000000000000..5be2b1e95b36
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>>  @@ -0,0 +1,136 @@
>>  +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Ingenic SoCs pin controller devicetree bindings
>>  +
>>  +description: >
>>  +  Please refer to pinctrl-bindings.txt in this directory for =

>> details of the
>>  +  common pinctrl bindings used by client devices, including the =

>> meaning of the
>>  +  phrase "pin configuration node".
>>  +
>>  +  For the Ingenic SoCs, pin control is tightly bound with GPIO =

>> ports. All pins
>>  +  may be used as GPIOs, multiplexed device functions are =

>> configured within the
>>  +  GPIO port configuration registers and it is typical to refer to =

>> pins using the
>>  +  naming scheme "PxN" where x is a character identifying the GPIO =

>> port with
>>  +  which the pin is associated and N is an integer from 0 to 31 =

>> identifying the
>>  +  pin within that GPIO port. For example PA0 is the first pin in =

>> GPIO port A,
>>  +  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 =

>> and the X1830
>>  +  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The =

>> JZ4760, the
>>  +  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a =

>> total of 192
>>  +  pins.
>>  +
>>  +maintainers:
>>  +  - Paul Cercueil <paul@crapouillou.net>
>>  +
>>  +properties:
>>  +  nodename:
> =

> It's $nodename as that's not a real property. And that will expose the
> error in the example for you.
> =

>>  +    pattern: "^pinctrl@[0-9a-f]+$"
>>  +
>>  +  compatible:
>>  +    oneOf:
>>  +      - enum:
>>  +        - ingenic,jz4740-pinctrl
>>  +        - ingenic,jz4725b-pinctrl
>>  +        - ingenic,jz4760-pinctrl
>>  +        - ingenic,jz4770-pinctrl
>>  +        - ingenic,jz4780-pinctrl
>>  +        - ingenic,x1000-pinctrl
>>  +        - ingenic,x1500-pinctrl
>>  +        - ingenic,x1830-pinctrl
>>  +      - items:
>>  +        - const: ingenic,jz4760b-pinctrl
>>  +        - const: ingenic,jz4760-pinctrl
>>  +      - items:
>>  +        - const: ingenic,x1000e-pinctrl
>>  +        - const: ingenic,x1000-pinctrl
>>  +
>>  +  reg:
>>  +    maxItems: 1
>>  +
>>  +  "#address-cells":
>>  +    const: 1
>>  +
>>  +  "#size-cells":
>>  +    const: 0
>>  +
>>  +patternProperties:
>>  +  "^gpio@[0-9]$":
>>  +    type: object
>>  +    properties:
>>  +      compatible:
>>  +        enum:
>>  +          - ingenic,jz4740-gpio
>>  +          - ingenic,jz4725b-gpio
>>  +          - ingenic,jz4760-gpio
>>  +          - ingenic,jz4770-gpio
>>  +          - ingenic,jz4780-gpio
>>  +          - ingenic,x1000-gpio
>>  +          - ingenic,x1500-gpio
>>  +          - ingenic,x1830-gpio
>>  +
>>  +      reg:
>>  +        items:
>>  +          - description: The GPIO bank number
>>  +
>>  +      gpio-controller: true
>>  +
>>  +      "#gpio-cells":
>>  +        const: 2
>>  +
>>  +      gpio-ranges:
>>  +        maxItems: 1
>>  +
>>  +      interrupt-controller: true
>>  +
>>  +      "#interrupt-cells":
>>  +        const: 2
>>  +        description:
>>  +          Refer to ../interrupt-controller/interrupts.txt for more =

>> details.
>>  +
>>  +      interrupts:
>>  +        maxItems: 1
>>  +
>>  +    required:
>>  +      - compatible
>>  +      - reg
>>  +      - gpio-controller
>>  +      - "#gpio-cells"
>>  +      - interrupts
>>  +      - interrupt-controller
>>  +      - "#interrupt-cells"
>>  +
>>  +    additionalProperties: false
>>  +
>>  +required:
>>  +  - compatible
>>  +  - reg
>>  +  - "#address-cells"
>>  +  - "#size-cells"
>>  +
>>  +examples:
>>  +  - |
>>  +    pin-controller@10010000 {
>>  +      compatible =3D "ingenic,jz4770-pinctrl";
>>  +      reg =3D <0x10010000 0x600>;
>>  +
>>  +      #address-cells =3D <1>;
>>  +      #size-cells =3D <0>;
>>  +
>>  +      gpio@0 {
>>  +        compatible =3D "ingenic,jz4770-gpio";
>>  +        reg =3D <0>;
>>  +
>>  +        gpio-controller;
>>  +        gpio-ranges =3D <&pinctrl 0 0 32>;
>>  +        #gpio-cells =3D <2>;
>>  +
>>  +        interrupt-controller;
>>  +        #interrupt-cells =3D <2>;
>>  +
>>  +        interrupt-parent =3D <&intc>;
>>  +        interrupts =3D <17>;
>>  +      };
>>  +    };
>>  --
>>  2.26.2
>> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
