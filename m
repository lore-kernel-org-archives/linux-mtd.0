Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878E9C47082
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 03:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D035613E9
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 03:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D035613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mE0DWGXjqe7ABIOjqyKPawkKrXzLQQ73ON2NFLCp4u0=; b=T37KBuGvvCyQwY
	TuFxo4/tl8R61IXHGB69daRd8UoXxzFaKaMRZRJNFVmPdrCUKZeMVQLbqM84cCc1BB3s/AUTG6GQ4
	xmEnSwf0JaWSEqC71VR/mH/KfpZQfjvUT/9bMMApqCru3wz5Vsd4ZBceqOAA0ZK6AldgIzPbkdlOM
	G3Xwkm0Rl+ztGDqW5wLR67uWrhORAMViuYli7OL2mgKY2RKrJ9hlODpYUmHqIIULrLq5fsPRyctKE
	zZAhZsHxklozBKLuo8D0+a+a0uEfTo6bzWlaGvTzB6bnfHOoxukLJWZms4cxqoJ32SZLqKtdwwojh
	OYXlpOGFpOvjFxAA8stA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loeOJ-006zAp-CQ; Thu, 03 Jun 2021 03:51:31 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loeOF-006z9O-QT
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 03:51:29 +0000
Received: from [192.168.1.107] (89-186-114-252.pool.digikabel.hu
 [89.186.114.252])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4738E82EF0;
 Thu,  3 Jun 2021 05:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622692281;
 bh=4S9DeOsSgwurt2vIIEPZv87f5Sw8LTYLBFnrrwtmmDM=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oZ/VbwbAk/VL4P9sL/k3wxmJhSAm8lQ4OOtqc30hujze/iYXWP9h8Iwz1CDIq8VPl
 MLCTEJMpg3qxVGdP3tuqww6SawMrpFil1LiDn8af1zs+ibdrND7fKwD7Rxl4MoRAc0
 prOkUcfqQVIsRnLdCbFIEDjlB6HyRClPjFxFjQLdY/LVITQW2ECHwukQOV3xhXW9+H
 6yRXQ0z9fhJtQJW8QGggGCH26uyqxlGzSXS3numNwHv2w0YeoVgFe4fzjDVIHme9S+
 h1FcERx6W/xO0e4u2Dvblt4CpuJaOGfqsc8I8kFTPqa2sGUKmrCqg9e6WvJW82Upq6
 X59SDVn62P2kg==
Subject: Re: [PATCH v3 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
To: Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210601043546.1345704-1-hs@denx.de>
 <20210601043546.1345704-2-hs@denx.de>
 <20210602192950.GA3827845@robh.at.kernel.org>
From: Heiko Schocher <hs@denx.de>
Message-ID: <452d7f47-9272-9b93-7eb1-394242ca6ad7@denx.de>
Date: Thu, 3 Jun 2021 05:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602192950.GA3827845@robh.at.kernel.org>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_205128_198121_C76BDE11 
X-CRM114-Status: GOOD (  20.14  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Rob,

On 02.06.21 21:29, Rob Herring wrote:
> On Tue, Jun 01, 2021 at 06:35:45AM +0200, Heiko Schocher wrote:
>> The Microchip 48l640 is a 8KByte EERAM connected via SPI.
>> Add devicetree bindings documentation.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
>> ---
>>
>> Changes in v3:
>> Add Fabio to cc
>>
>> Changes in v2:
>> as Rob helped, fix warnings from running command
>> 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>
>>  .../bindings/mtd/microchip,mchp48l640.yaml    | 45 +++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
>> new file mode 100644
>> index 0000000000000..08089f2db0761
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: MTD SPI driver for Microchip 48l640 (and similar) serial EERAM
> 
> This is not the driver.

Ok, I would change to:

title: Microchip 48l640 (and similar) serial EERAM bindings

ok?

>> +
>> +maintainers:
>> +  - Heiko Schocher <hs@denx.de>
>> +
>> +description: |
>> +  The Microchip 48l640 is a 8KByte EERAM connected via SPI.
>> +
>> +  datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/20006055B.pdf
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: microchip,48l640
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  spi-max-frequency: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    spi {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      spi-eeram@0 {
> 
> eeram@0

changed.

> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your time!

I would wait with a v4 if I get comments for the driver
(or wait some time...)

>> +        compatible = "microchip,48l640";
>> +        reg = <0>;
>> +        spi-max-frequency = <20000000>;
>> +      };
>> +    };
>> +...
>> -- 
>> 2.31.1

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
