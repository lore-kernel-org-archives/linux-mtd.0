Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E660C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 06:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C7EE61108
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 06:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C7EE61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MSNTFd5fT9aVw3sILQEKiI62oFNf9eW5JpOfrQE7vvs=; b=16NQkxjUJfwhwghRWLLRns7lrS
	GkXGXCyn+/ldUMQEeaa8ztRwhRbdwzma6Dt2r2aK+ZgI7yltE+kmaDy4hVfET+KJcBacCW/9y+AsN
	pTkL8faP7muYousVKE/qlPhCjpo4x/9tFAt5x07mPJDs60crWJzAoMba3pof4DCnjnXEbAvL2Farv
	F3uwkbhqZpQXGB0YBnhiL7mG+Axc/XiGA9cuPjQxMAxMp7fN+8G0V0MsvmnLcN3hlLME1/50VswDQ
	SKq+4kuhZzjJN3amPZev9ON5WFZ++CMJ/Ef5WCVuSRHjYMB1noq6nB4Rm5NCCcdF3QUpjPzsspcqg
	t/Y4vqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrUm-005gix-Ow; Wed, 08 Sep 2021 06:55:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrUi-005ghU-Qo
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 06:55:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44D6361108;
 Wed,  8 Sep 2021 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631084140;
 bh=FrGPJdJBZEV5HyoegsQjNhTyFYyz8tCFNEFbAKy1Jfw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YGmWnvzdr5tyGnxxSxNfsmNNoiU0KPZR+G0pMPFtuw18kg87eAU7fKcW4IYfm2G6k
 sZ+vQuPgkKwArV56ZeCbs2k/Eh4rBl+wn4JVFonhlmEA8vqlJt7hkSX/s9V13jMjbS
 N9M1UY7SJCx7ZjYx8KrKKUsI9pyrryKyLPs4JlIhXToJYyAjvFd9WMdmZ3HG1c83EY
 OoxhCqiau1fgfISAeWmry51N0+NxM/WzFRpl+3lWCXXq4tLBuQTpIlHUT98VdKeKTP
 cyEhWVJ1MFRmzNcYoio52+d0e7ok3eMCiAt3/+GeBT4rE5BQN8V4GD40YDq3ygpn4o
 vLw/uGDEghbCg==
Subject: Re: [PATCH v3 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
To: Rob Herring <robh+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, tony@atomide.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-6-rogerq@kernel.org> <20210907160317.2ec5304a@xps13>
 <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com> <20210907183545.3e281b7d@xps13>
 <2c6491c2-dae8-c8b3-9f8c-14a7583720f1@kernel.org>
 <CAL_JsqJPnUawYafrk4XmeVBETf-Lr+MZn+j_0nGfJTpvfzbkRA@mail.gmail.com>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <1afc71e6-5104-2ce1-f176-97f4583507ef@kernel.org>
Date: Wed, 8 Sep 2021 09:55:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJPnUawYafrk4XmeVBETf-Lr+MZn+j_0nGfJTpvfzbkRA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_235540_962224_B4E69183 
X-CRM114-Status: GOOD (  26.02  )
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



On 08/09/2021 01:24, Rob Herring wrote:
> On Tue, Sep 7, 2021 at 11:57 AM Roger Quadros <rogerq@kernel.org> wrote:
>>
>> Hi Miquel,
>>
>> On 07/09/2021 19:35, Miquel Raynal wrote:
>>> Hi Grygorii,
>>>
>>>>>
>>>>>> +
>>>>>> +  nand-bus-width:
>>>>>> +    description:
>>>>>> +      Bus width to the NAND chip
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    enum: [8, 16]
>>>>>> +    default: 8
>>>>>
>>>>> This is part of nand-controller.yaml binding and should not be there.
>>>>>
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: "../memory-controllers/ti,gpmc-child.yaml"
>>>>>
>>>>> Maybe you need to reference the nand controller bindings as well
>>>>>
>>>>
>>>> This will not work out of the box :( as nand-controller.yaml defines both
>>>>   nand controller and nand memory. It potentially might work if it will be possible to split
>>>> nand memory definition (or nand memory properties) out of and-controller.yaml, similarly to
>>>> ti,gpmc-child.yaml from this series.
>>>
>>> What you think would be the issue?
>>
>> The issue is that dt_binding checks will fail if I reference nand-controller.yaml
>> as we currently represent the controller as follows
>>
>> memory-controller { /* GPMC controller */
>>         memory-controller-props;
>>         nand-chip {
>>                 /* @chip select 0 */
>>                 nand-controller-props;
>>                 memory-controller-timing-props;
>>                 chip-props;
>>         }
>>         nand-chip {
>>                 /* @chip select 1 */
>>                 nand-controller-props;
>>                 memory-controller-timing-props;
>>                 chip-props;
>>         }
>>         nor-chip {
>>                 /* @chip select 2 */
>>                 memory-controller-timing-props;
>>                 chip-props;
>>         }
>> }
>>
>> The NAND controller IO registers are at different addresses for different
>> chip select regions. Also, this is one way we can specify GPMC settings/timings
>> for different chip selects.
>>
>>>
>>> I am not opposed to split nand-controller.yaml into
>>> nand-controller.yaml and nand-chip.yaml if it simplifies the
>>> description of controllers but I don't get why it would be needed. In
>>> particular since we expect all drivers to support the
>>>
>>> nand-controller {
>>>       controller-props;
>>>       nand-chip {
>>>               chip-props;
>>>       }
>>> }
>>
>> Changing to this format will cause a lot of churn in DT files, which I'm not sure
>> if it gives enough benefit.
>> TI platforms will never have 2 NAND chips in the same chip select region.
> 
> Probably best to just leave this alone. Unless this is getting used in
> new chips? If so, I'd say it's a separate change.
> 
>>> organization which has been enforced since at least 2018. Having a
>>> controller vs. chip representation is fundamentally right. But here I
>>> see how "legacy" are these bindings with so much unneeded specific "ti,"
>>> properties... On one side it would be good to verify that the driver
>>> supports this representation (which I believe is true) and on the other
>>> side maybe it's time to advertise "better" bindings as well.
>>
>> Yes, I'm OK to mark ti specific properties deprecated and use standard NAND chip
>> bindings.
> 
> I don't think it's really worth it to go half way using common
> properties but not the common structure.

I agree.
We will be having new chips that will use this driver but we will migrate to new
common structure when adding support for those chips.

So I will leave this patch as it is for now.

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
