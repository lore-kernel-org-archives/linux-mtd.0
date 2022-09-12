Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39E8C6FA82
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Sep 2022 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGLLAFhHfhFOCIuCZhxuG4d/eS5NB7vjHz5FgU8lM3Y=; b=DH4Q/GA3lwMPrO
	jXkJGTQu/CIe1b90q9y1WbwnOQFf+RlpHp5DrtxNIrqp6JMNXwYAo9hd7h95V/ndrYc+r/KRaiQUL
	Zl89UDSLCkBidfr/hhXyfPfXJXUVc1JjccgTrdcVHxQNUuyfiXn3i01sc6FBI4/T9V11GIwtFhO8s
	BWZbDeu50gbRtfX2aBWWkcShPa1hasF84aMBkcZfcejLSYF2bIyr5c58WtEAMbiYlVN9V3lLtz739
	zq1qdL9PhYztXLVltxkUEdrrStwMKVOKgqKd7hik1MeERfSIrjF6v9f22zCGV2It+6dE1ysuBO4lc
	BU9Vj+8w4pJ4qBxHUNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXoz8-00CuDR-9E; Mon, 12 Sep 2022 19:20:46 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXoz3-00CuAH-Lx; Mon, 12 Sep 2022 19:20:43 +0000
Received: by mail-ot1-f45.google.com with SMTP id l7-20020a056830154700b0065563d564dfso6516574otp.0;
        Mon, 12 Sep 2022 12:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3AP/8H6lNUJxt0e4xcmzSjTGN2LrpryaMTGu/8MaPTE=;
        b=OJhP4AXjDLNoegKjM8x+zjAIBEOlu4DiHcyvShwJeD+jZO9ujrUmw7ojQ1DFUEEggh
         cruri92399ow8K+J9hZXVzTElCJ9yRCkD4u59InTfU/HxsyAqJXlj+MFYgzgfkggGx3l
         muUTyqnhRzodrAp0AMGxZyNqPKHgMJ5DOBAi62zjgS5fY+jgOATIkQKLnOol8N1Mj5mk
         c5Ee8HcpBz0n7Kb0SbXkX5I+aaPa6Xt6dSRVJkz1ZDxATAyhPjS9GZdPk1kWHleXb0ne
         NkKnJCd6uhyZ8BPjpWnL1AQtuvY06iGfeJARLLOPGy5KUNqVu3sg8V52+Ubx//Btku/2
         AzEw==
X-Gm-Message-State: ACgBeo29ELO3oBwxFxHPZ/ha+MpkeKXQSQtyndKtZuAcDB5w/Dkl7dQw
	suyrWhc9aCYKa3lIeP39EQ==
X-Google-Smtp-Source: AA6agR7xawQGM5WeoMEXiFMiRQalX4BDsabwBsBRE57tKwigga13hjnnPHVUevtOi6lJDbcfUCqFBA==
X-Received: by 2002:a05:6830:1d89:b0:655:d851:365f with SMTP id y9-20020a0568301d8900b00655d851365fmr3412786oti.293.1663010440379;
        Mon, 12 Sep 2022 12:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s22-20020a4ac816000000b0044b47bb023fsm4449106ooq.37.2022.09.12.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 12:20:39 -0700 (PDT)
Received: (nullmailer pid 1680895 invoked by uid 1000);
	Mon, 12 Sep 2022 19:20:38 -0000
Date: Mon, 12 Sep 2022 14:20:38 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 15/20] dt-bindings: nvmem: add YAML schema for the
 sl28 vpd layout
Message-ID: <20220912192038.GA1661550-robh@kernel.org>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-16-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901221857.2600340-16-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_122041_748132_97B0A75D 
X-CRM114-Status: GOOD (  23.39  )
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

On Fri, Sep 02, 2022 at 12:18:52AM +0200, Michael Walle wrote:
> Add a schema for the NVMEM layout on Kontron's sl28 boards.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v1:
>  - add custom select
>  - add description
>  - add "additionalProperties: false", I wasn't sure if all the
>    subnodes needs it. I'd say yes, but the brcm,nvram binding
>    doesn't have them neither.
> 
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> new file mode 100644
> index 000000000000..0c180f29e880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/layouts/kontron,sl28-vpd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVMEM layout of the Kontron SMARC-sAL28 vital product data
> +
> +maintainers:
> +  - Michael Walle <michael@walle.cc>
> +
> +description:
> +  The vital product data (VPD) of the sl28 boards contains a serial
> +  number and a base MAC address. The actual MAC addresses for the
> +  on-board ethernet devices are derived from this base MAC address by
> +  adding an offset.
> +
> +# We need a select here so we don't match all nodes with 'user-otp'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: kontron,sl28-vpd
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: kontron,sl28-vpd
> +      - const: user-otp
> +
> +  serial-number:
> +    type: object
> +    description: The board's serial number
> +
> +  base-mac-address:
> +    type: object
> +    description:
> +      Base MAC address for all on-module network interfaces. The first
> +      argument of the phandle will be treated as an offset.
> +
> +    properties:
> +      "#nvmem-cell-cells":

You can't just add a new #.*-cells buried in a device binding. I'm fine 
with the concept though having more than 1 user would be nice.

Any case that doesn't match foos->#foo-cells or has a default # of 
cells if missing (as this does) has to be added to dtschema to decode it 
properly. It won't really matter until there's a user with 2 or more 
entries. I'm happy to do update the dtschema part, but I'd prefer to see 
the schema in dtschema rather than the kernel.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
