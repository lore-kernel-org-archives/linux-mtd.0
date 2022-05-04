Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED470C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 20:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cTiHlDxXlDURqNtjgAm4Fp5UUem865TfIKpp0f+7tk=; b=tymejhAz64vVPMEwLyj0kzaduC
	s6Fzdj+93fdz7qP7DSbw+9QlhrNZ18wSlxGWDtPr76D7jR6gKUYQTU6aDDMNOgzxDoDsN/KmZ38ZV
	Kug3Y3Wa9VUefRBFkLTIih4mf7aA2/8xYebJHHRCIwbCp3Hwj8qaLq4EPkvXYC2X9iebMhOj7BWbX
	eC8d782ggFjR3lGyvRTunu8agkf35HM2Ykh3tRX5FXlEk4YM6LM3iZmvnbnxk0eei4GIkMzv4rsuv
	wOk2oqGJdeWgQ9FGhz5mSLP9Q/DJuLZOceFjv/SV9gNo8BZq8lnPljwROlxZytx1Wn9TPY1vePzbZ
	ytu+3Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLmN-00CcOV-4U; Wed, 04 May 2022 20:39:23 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLmJ-00CcKh-Fl
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 20:39:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id g6so5120072ejw.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=Z2dVs5miBxmXIySFSNiW8pDoiQoVKCwO3mjzMYv3Zec=;
 b=Z3rTg8R+bJUJWRg/IqgFAIFPaCR7ziAiygfcpmxywJGxkFelZ6ryfoerwCQFWwBGuh
 BuoMD1Ye30enuoDCP5jTZ8WN8YiA0Ycp8uR+6PTS9wmOfcw3aTg0BgHGe5qL+KKtwWeL
 ONuIUbWjegJbQT2F1WLK8wmWWn2DG5HrkbArMLk8OE8AwVOV3tuRbATvzcfVfVO+dqt3
 6yiXjYYMhew0GLY/3t9n62r8VbRlMZIEPROXPtkZqubcZ86T6ih6pnpdRwON2VwKDLw7
 xobGgdk4Q7SjknBYnViPJ8XgdX+EJB+iagSiDtrtYl826TDbKWpC0od7jAOgfxE5ETcR
 4LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=Z2dVs5miBxmXIySFSNiW8pDoiQoVKCwO3mjzMYv3Zec=;
 b=MhsL/VZFb5cjbL0uOMmWcid+v9y/D2FMYwdsefabK19JulLHi2HZ6pWkFbBUqJpX3I
 auQHJjwqJK9L7d0gt5UyMSJllK8Wn2UAsN8wf4EBXO5OIzMkpw3fVEArhVGlAliROCAy
 3z9WBiiDtTaSZ7agdGgsCHel2C1e8RVaNmuBnulEKsvz33sfHYASs5GbYAuvgeNVWI8s
 xjHnGlxneZGezQZBmSlkWvw74jhCPj/F0rk14f/A798NhTxzv8DlrRHSDZcqn7Oubo5b
 26dpSi0jgU/4iFz8OikHXtGu8/sTwp1mvA8XBFTPd/1W79ZOlwEMUBRSLgvRLBrhHWn8
 PkmA==
X-Gm-Message-State: AOAM530Kwt55phNP0d47XQ5jUk9u/nTkJyGKAEodT+PO+GII5A0JSNfO
 jkgRModxs81njK5r2HLmNxw=
X-Google-Smtp-Source: ABdhPJz/STYDRpY8rzebL057RwSwOIeG+CcAiMnBZMkP5z3+WXgOu4hNxD/b2WeJThieF8B9LgOK8A==
X-Received: by 2002:a17:906:9c82:b0:6df:c5f0:d456 with SMTP id
 fj2-20020a1709069c8200b006dfc5f0d456mr22153238ejc.287.1651696755643; 
 Wed, 04 May 2022 13:39:15 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 bf16-20020a0564021a5000b0042617ba63aesm9675481edb.56.2022.05.04.13.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 13:39:15 -0700 (PDT)
Message-ID: <b2d90156-f29d-88a0-58b8-7fb32c08c837@gmail.com>
Date: Wed, 4 May 2022 22:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [RESEND PATCH v3 1/2] dt-bindings: mtd: partitions: Document new
 partition-dynamic nodes
To: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220429124825.21477-1-ansuelsmth@gmail.com>
 <20220429124825.21477-2-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220429124825.21477-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133919_581675_802DEC30 
X-CRM114-Status: GOOD (  33.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29.04.2022 14:48, Ansuel Smith wrote:
> Document new partition-dynamic nodes used to provide an OF node for
> partition registred at runtime by parsers. This is required for nvmem
> system to declare and detect nvmem-cells.
> 
> With these special partitions, the reg / offset is not required.
> The node name must be in the form of "partition name"-dynamic.
> If the partition can't be displayed using the node name, it's possible
> to use the label binding that will be used instead of the node name.
> The node name or the label binding is used to match the partition
> allocated by the parser at runtime and the parser will provide reg
> and offset of the mtd.
> 
> NVMEM will use the data from the parser and provide the NVMEM cells
> declared in the DTS, "connecting" the dynamic partition with a
> static declaration of cells in them.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   .../mtd/partitions/partition-dynamic.yaml     | 56 +++++++++++++++++++
>   .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
>   2 files changed, 60 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> new file mode 100644
> index 000000000000..e0efa58e4fac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/partition-dynamic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dynamic Partition

I'm not native but that "Dynamic Partition" sounds pretty natural and
I'm wondering if you shouldn't make that binding dynamic-partition.yaml

Any natives to comment on this? :)


> +description: |
> +  This binding describes a single flash partition that is dynamically allocated
> +  by a dedicated parser that is not a fixed-partition parser.
> +
> +  A dynamic partition require the node ending with the "-dynamic" tag and if the
> +  dynamic partition name can't be displayed using the node name, the label
> +  properties can be used. The node name or the label have to match the dynamic
> +  partition allocated by the parser.
> +
> +  These special partition definition can be used to give a dynamic partition
> +  an OF node to declare NVMEM cells. An example is declaring the partition
> +  label and all the NVMEM cells in it. The parser will detect the correct reg
> +  and offset and the NVMEM will register the cells in it based on the data
> +  extracted by the parser.
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +properties:
> +  label:
> +    description: The label / name for the partition assigned by the parser at
> +      runtime. This is needed for sybsystem like NVMEM to define cells and
> +      register with this OF node.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    flash {
> +      partitions {
> +        compatible = "qcom,smem-part";
> +
> +        art-dynamic {
> +          compatible = "nvmem-cells";
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          label = "0:art";
> +
> +          macaddr_art_0: macaddr@0 {
> +            reg = <0x0 0x6>;
> +          };
> +
> +          macaddr_art_6: macaddr@6 {
> +            reg = <0x6 0x6>;
> +          };
> +        };
> +      };
> +    };

I see that we need a property (like "label") for storing partition name
as it may contain characters not allowed in $nodename.

Is there a reason to play with all that foo-dynamic $nodename then? With
fallback from "label" to extracting foo from *-dynamic pattern?

Could we just be lazy, keep things simple and require "label" property?

Then we could e.g. require $nodename to be pattern ^partition-[0-9a-f]+$
It's what leds-gpio.yaml does for reference.

Example:

partitions {
	compatible = "foo";

	partition-1 {
		label = "bootloader";
	};

	partition-2 {
		label = "0:art";
	};
};

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
