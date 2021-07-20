Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9991EC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 14:16:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A9860D07
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 14:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A9860D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DBGSQt8trx/qGEKvzCCFQi7JetYMEkVWjavtNHqBhvc=; b=GPgawsZwLAcwpyLXM5cxYNBZfQ
	WSEY3pUW5vTl0GDuXZDkgm8aWaUlZY2+ByZ9z1wlAxopuILhIPvIkF2Jp4tpcuGIvbjJtRpt6vIwR
	rqixIv+3VunJWbxbJOVJ8WLiJDFFVypLNgE2BLm1TY0gOtm/KsZ3dwx8EOjr05ECZ7jcp0PBoLdwo
	WR7/SjtNa4w83bDdxV26StdxVmBn3s/Cw/QCDjAw9KCi3nKq4dJ7HPZP1Mw+bgWuBvBO+4PRrp1Yv
	pmIDEwKF8J0AJypmfwQ8G1fiqfV/e4hfcVf2nuiecIMMM4bin6uEl7oQz4+qporQ7B8TDiTktQwwx
	p/InS9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5qXb-00D8N6-S2; Tue, 20 Jul 2021 14:16:11 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5qXY-00D8M3-TI
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 14:16:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16KEG4Sl017139;
 Tue, 20 Jul 2021 09:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626790564;
 bh=1izAijwknd3Czt/bcb4ykqs+qHn6qPns0G130qgqFXA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PBLrDRvzn6uPsvvc+Z4pNLKr/glTXYbMRhClUC4If7NjKHKR+axy4VK4ImpwcIRKe
 iBaL79vTCZOQ5v2rvOQl4myYQjKT9YIf4GV9nF/5G4T1KtPSKIVOSLNdj/9cc2oc7D
 ixScLfosdIEv9xtU6CBGSM5JaUztpi8+cw5ZiiFA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16KEG4r3123199
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Jul 2021 09:16:04 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 20
 Jul 2021 09:16:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 20 Jul 2021 09:16:03 -0500
Received: from [10.250.234.142] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16KEFxev072402;
 Tue, 20 Jul 2021 09:16:00 -0500
Subject: Re: [PATCH] dt-bindings: mtd: spi-nand: Convert to DT schema format
To: Rob Herring <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
References: <20210718004125.733-1-a-nandan@ti.com>
 <20210719152413.GA1953551@robh.at.kernel.org>
From: "Nandan, Apurva" <a-nandan@ti.com>
Message-ID: <8f51f347-54d9-d509-303c-d858b3d1896e@ti.com>
Date: Tue, 20 Jul 2021 19:45:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719152413.GA1953551@robh.at.kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_071609_094022_8A0C2E83 
X-CRM114-Status: GOOD (  18.43  )
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



On 19-Jul-21 8:54 PM, Rob Herring wrote:
> On Sun, Jul 18, 2021 at 12:41:25AM +0000, Apurva Nandan wrote:
>> Convert spi-nand.txt binding to YAML format with an added example.
>>
>> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
>> ---
>>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>>  .../devicetree/bindings/mtd/spi-nand.yaml     | 74 +++++++++++++++++++
>>  2 files changed, 74 insertions(+), 5 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
>> deleted file mode 100644
>> index 8b51f3b6d55c..000000000000
>> --- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -SPI NAND flash
>> -
>> -Required properties:
>> -- compatible: should be "spi-nand"
>> -- reg: should encode the chip-select line used to access the NAND chip
>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
>> new file mode 100644
>> index 000000000000..366b86e1b19c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SPI NAND flash
>> +
>> +maintainers:
>> +  - Apurva Nandan <a-nandan@ti.com>
>> +
>> +allOf:
>> +  - $ref: "mtd.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: spi-nand
> 
> Drop 'oneOf' as there is only one.
> 
>> +
>> +  reg:
>> +    items:
>> +      description:
>> +        should encode the chip-select line used to access the NAND chip
> 
> Just:
> 
> reg:
>   maxItems: 1
> 
>> +
>> +  spi-max-frequency: true
>> +  spi-rx-bus-width: true
>> +  spi-tx-bus-width: true
>> +
>> +  partitions:
>> +    type: object
>> +
>> +  '#address-cells': true
>> +  '#size-cells': true
>> +
>> +patternProperties:
>> +  # Note: use 'partitions' node for new users
>> +  '^partition@':
>> +    type: object
>> +
>> +  "^otp(-[0-9]+)?$":
>> +    type: object
>> +
>> +additionalProperties: false
> 
> Just do:
> 
> additionalProperties:
>   type: object
> 
> and then drop partitions, partition@, and ^otp(-[0-9]+)?$.
> 
>> +
>> +examples:
>> +  - |
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        flash@6 {
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            compatible = "spi-nand";
>> +            reg = <0x6>;
>> +            spi-max-frequency = <42000000>;
>> +
>> +            partitions {
>> +                compatible = "fixed-partitions";
>> +                #address-cells = <1>;
>> +                #size-cells = <1>;
>> +
>> +                partition@0 {
>> +                    label = "boot";
>> +                    reg = <0 0x200000>;
>> +                };
>> +
>> +                partition@200000 {
>> +                    label = "rootfs";
>> +                    reg = <0x200000 0xce0000>;
>> +                };
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.17.1
>>
>>

Agree with all the suggestions made, will correct and send v2.

Thanks,
Apurva Nandan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
