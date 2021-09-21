Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C230C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 13:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DC3760F6D
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 13:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DC3760F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+xiXgGURvNXXau4ycujlri2qmxBenbpr3thLLRGUS8=; b=MrYrzlypmc+rCw9O45Isj+IwXG
	1hyvToRPl2njB015+9tyvBIe6G1X5Qd04Kj54WYq12rm/QK9sUGOaugMvayOhcGbpcKe8yOhup9KI
	zi3Lr/RfPacrwvmEQZ7L3WyrXjOt33DZruorzlsXBCLr66woHZrIQi5YclIOP2GDZnKQmtB/rLF2k
	rz7VdGExPqekuZioc+WsogYEl8gnqYcyLSCL0NP68wo0xvsEQOEq3Sx1uvwzk/cHMVqlx1pIwV88l
	N0pfyQjx4JGWF8vGkxkoq4pXYsShmJbhPA7EgVBVWEXd47yNrg5LJTJwxHxn7YKQIh2yv4DtPeR+7
	sIG2y6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSg8P-004e5Q-IM; Tue, 21 Sep 2021 13:48:34 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSg34-004asR-9m
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 13:43:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18LDguEQ095798;
 Tue, 21 Sep 2021 08:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632231776;
 bh=G/BF1N3A8cI9FQ2zfQzLN29/5B1kN7rRFX6aT2C3/8k=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pgTSyqeUT290H/sNnbnEcnWQAd+iZHWq0Z1NmOSx5CCWDwKWlLyvC42LULqcqTmZI
 47P2250EaEGDSGIq45/kbLHXMOmtX3i+NkTiFaJ/sjy356k3rhWhuwxIDccBT+fhRO
 oigPhQYxerRs2MA0hB+MRPkS/I9vvRnNZDJOVYxQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18LDgula087161
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Sep 2021 08:42:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 08:42:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Sep 2021 08:42:55 -0500
Received: from [10.250.233.5] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18LDgooc056968;
 Tue, 21 Sep 2021 08:42:51 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
To: Rob Herring <robh@kernel.org>, Serge Semin <fancer.lancer@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <michael@walle.cc>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
 <20210920150651.vvdhennblwhdi3jw@mobilestation>
 <YUj6RUNYDoWA30Ln@robh.at.kernel.org>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <3c03fcdd-b015-8fda-eadc-e1b6d24ba88d@ti.com>
Date: Tue, 21 Sep 2021 19:12:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUj6RUNYDoWA30Ln@robh.at.kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_064302_569704_21AFAC4B 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Rob,

On 21/09/21 2:46 am, Rob Herring wrote:
> On Mon, Sep 20, 2021 at 06:06:51PM +0300, Serge Semin wrote:
>> Hello Apurva
>>
>> On Mon, Sep 20, 2021 at 07:57:12PM +0530, Apurva Nandan wrote:
>>> Convert spi-nand.txt binding to YAML format with an added example.
>>>
>>> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
>>> ---
>>>   .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>>>   .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
>>>   2 files changed, 62 insertions(+), 5 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>>>   create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
>> Thanks for the bindings conversion patch. There are several comments
>> below. But before addressing them it would be better to also get a
>> response from Rob.
>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
>>> deleted file mode 100644
>>> index 8b51f3b6d55c..000000000000
>>> --- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
>>> +++ /dev/null
>>> @@ -1,5 +0,0 @@
>>> -SPI NAND flash
>>> -
>>> -Required properties:
>>> -- compatible: should be "spi-nand"
>>> -- reg: should encode the chip-select line used to access the NAND chip
>>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
>>> new file mode 100644
>>> index 000000000000..601beba8d971
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
>>> @@ -0,0 +1,62 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: SPI NAND flash
>>> +
>>> +maintainers:
>>> +  - Apurva Nandan <a-nandan@ti.com>
>>> +
>>> +allOf:
>>> +  - $ref: "mtd.yaml#"
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: spi-nand
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  spi-max-frequency: true
>>> +  spi-rx-bus-width: true
>>> +  spi-tx-bus-width: true
>>> +  rx-sample-delay-ns: true
>> Since it's an SPI-client device there are more than these properties
>> could be set for it. See the SPI-controller bindings schema:
>> Documentation/devicetree/bindings/spi/spi-controller.yaml
>> So there is two possible ways to make it more generic:
>> 1) Detach the spi-client part from the spi-controller.yaml bindings
>> into a dedicated DT-schema file and refer to that new scheme from
>> here.
> Yes, as mentioned there's patches doing this. But the above is fine.
> There's some value in defining here which properties are valid.
Yeah right
>> 2) Forget about these controller-specific properties and let the
>> parental SPI-controller bindings parsing them. Of course there must be
>> at least one of the next properties declared for it to work:
>> {unevaluatedProperties, additionalProperties}.
>>
>> It's up to Rob to decided which approach is better though...
>>
>>> +
>>> +  '#address-cells': true
>>> +  '#size-cells': true
>> Aren't they always equal to 1?
> No SPI nand devices >4GB?
Yeah, we have SPI NANDs >4GB, and "'#address-cells': true" allows those 
sizes.
>
>>> +
>>> +additionalProperties:
>>> +  type: object
>> I'd suggest to elaborate the way the partition sub-nodes looks
>> like, for instance, the node names, supported compatible names,
>> labels, etc.
> That should probably all be in mtd.yaml. The question here is whether
> partitions are always under a 'partitions' node. Maybe this is new
> enough that only the new way has to be supported. Though if mtd.yaml
> supported both forms, allowing both all the time is okay IMO.
>
> Rob

I had added the "partition" node properties in the v1 patch, but as per 
the reviews I removed it.
I think we can prefer having them in mtd.yaml if needed, in a separate 
patch series.
Do you prefer the mtd.yaml changes as a part of this series or as a 
separate patch?

Other than that, I don't find any need for a v3 patch re-roll, do you agree?

Thanks,
Apurva Nandan


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
