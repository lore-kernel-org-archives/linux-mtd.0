Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88382C48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50EE960FE5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50EE960FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AdGRpE//y/JpH3YVtMayRJ2lVGUQQzgILAT0xtzjbFk=; b=rRDEaIQtek+09flJBc8/bEp4f8
	4lnP796aoEvLa+vkiBWO1KwDB3aeKbUYd2VpxwNRFwI2Yt0/eFUna564Cmy0lJZz/Ly+9i8LHf617
	b7VrT9MLC6WOiiltYKvYnBeXmrs0ZlV/SP5Y1IvcxTLY1VuVGWY5YlxDAM1w1fkANMIApxIhrfUYw
	8X/LqKEn6Zre29qbGQ4u2cRkOG5XP22HPjqb3O0BcGx1ebNyaZoFciOnwaaXCZt1HsZ238XxsbjdH
	n+mmO+vs+IKEYs/iKgPJVlXi6cf3LpcrXhdbvedBgbWHlHqJn+4TbD620Ojour2hwYAhh+jykd+a2
	PSbZDIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqzEo-00EKD6-Hl; Wed, 09 Jun 2021 14:31:23 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyhg-00E9Vv-RH
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 13:57:10 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqyhf-0001jY-2J
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 13:57:07 +0000
Received: by mail-wr1-f71.google.com with SMTP id
 e9-20020a5d6d090000b0290119e91be97dso2581504wrq.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 06:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=94MTmrJjy+QuCQp+H85bF1V9qIA+ZZgrzOcpkBB5S9M=;
 b=BQmep2wCksK+LRAEOl5O7voSsC2iNsageLPF+58O8iEQ8vb8KvfLUNCtZBn9rD1wq4
 a5GMWM+ZZFLtsqWVPeuUBf2VWms8KdUcBbYKKcgzxQ8cKmzGLWMfA8SibIcTfULIGr3d
 NXkrSX8/wiqHzBPz4mDkATScrwUm91kn3hSPup4Qe4ZYm02HZCQXbQ1h5A0Z2b32LMzo
 8tqsWufDWsmtzmSTqfY/0uLcFnu6yZUnDkfH1+g6gZuB4+gPJrDhU3Ew9Ff0Sz/2BJkv
 e1hW7XQtKRfLtkZcFDgFtmcI3SXUNGasls9ATZkqjZ2fmrGVDzncJzuWU6hSf4e1ZiIi
 F3bA==
X-Gm-Message-State: AOAM5336YMrglzZ38wHC2deJstlIephnxY4ZyZ3gBQv1SGaR659cp8IH
 +1hkcH9BUIjKlA7m8IDv7HdNouKOt5UUmPVXD4tEAZXEy/7aOAq8eBgJPrJvV49qOhr7cgNPFh9
 ybvrDjgE9JgnuXPKs24mT5fSoUOMVZTsKivkKdeDyOqQ=
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr28210710wmg.144.1623247026699; 
 Wed, 09 Jun 2021 06:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnMkKQ1aeaiRBj9+JK4EwMsgwWT/6OvveUSFlZdu8TfcqICkeqyGjLL1rEQa6Dgw064GW83g==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr28210682wmg.144.1623247026518; 
 Wed, 09 Jun 2021 06:57:06 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id q11sm23273791wrx.80.2021.06.09.06.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:57:06 -0700 (PDT)
Subject: Re: [PATCH v22 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-18-miquel.raynal@bootlin.com>
 <57ef16cd-33e7-6c16-3a24-9634f47831b3@canonical.com>
 <20210609153621.1303bc4d@xps13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6fb9c0e4-43cb-d224-0ebe-568f62ac35b1@canonical.com>
Date: Wed, 9 Jun 2021 15:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609153621.1303bc4d@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_065708_968824_D3894324 
X-CRM114-Status: GOOD (  19.35  )
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

On 09/06/2021 15:36, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> Jun 2021 14:01:10 +0200:
> 
>> On 09/06/2021 10:01, Miquel Raynal wrote:
>>> Add a yaml description of this NAND controller which is described as a
>>> subnode of the SMC bus.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 57 +++++++++++++++++++
>>>  1 file changed, 57 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
>>> new file mode 100644
>>> index 000000000000..e72fa14b4385
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
>>> @@ -0,0 +1,57 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mtd/arm,pl353-nand-r2p1.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: PL353 NAND Controller device tree bindings
>>> +
>>> +allOf:
>>> +  - $ref: "nand-controller.yaml"
>>> +
>>> +maintainers:
>>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>>> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:  
>>
>> That's not an enum, but simple const without items.
> 
> Ok.
> 
>>
>>> +          - arm,pl353-nand-r2p1
>>> +
>>> +  reg:
>>> +    items:
>>> +      - items:
>>> +          - description: CS with regard to the parent ranges property
>>> +          - description: Offset of the memory region requested by the device
>>> +          - description: Length of the memory region requested by the device  
>>
>> Doesn't it depend on parent's address/size cells?
> 
> Yes, but as the child nodes are not defined in the parent's binding
> (ie. the SMC) I think it's interesting to have them defined here, no?

The trouble is if parent decides to have different address/size cells.
The schema will stop matching. I am actually not that sure if such case
is real since the pl353 NAND part will usually be connected to pl353
SMC. However the schema now hard-codes specific dependency against
parent schema/node.

Rob,
Maybe you have here some thoughts?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
