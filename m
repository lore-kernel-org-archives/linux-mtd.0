Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E60C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8O8c4Wa2q/Tpwd9X+7VGa7cJgm7HC4opal2cRZfWuk=; b=AkZMZJGh7YBjVN
	LKArzHo/ycUXmMlfKKxSxhp0yKoyq86FhxuKLc6ORYnAaNdWtpN/7BRPzlX4hd1nYycM+DHZM4e5h
	hUmGvGtvhQa/JrQ/bPHv/lIjDnFv3b2LFo0q5dhGoXySZ9b+Ed09KjexLma14oCHN9O79DhFmymEX
	KKm/YxkPN497fvaEoOf61v+S2BGRvL3XKu4kSws+uptMJyadf1z3rqTj1PvjnJ0LDtBww8erljo3K
	g+72oswUahAV09u/rfJYjttBx4dbYd7Lc+mtNnGbRMQ/iTnp9ejMxc+E6v/N7E84g2s781wehP4qm
	rceMVQy3ppmTvT0bEOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMD1H-008isf-36;
	Wed, 19 Jul 2023 19:39:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMD1F-008irN-0F
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 19:39:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so12354219e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689795567; x=1690400367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4J5hSUWV8g1G/mLF/LKS95JQ6t1uO7RiOvw0BN1K0AU=;
        b=XTHdtCRbnkk8De8R8ayLzLgRYSP98h4DBJ2ksZ2o8/UOca/20Gu5Q+VeifhivEJA/v
         WYrT62Pe/8AqxDd146rWc16nREGvwkJ2TzxyQjzD7JLb7XbvMoli8icCpNKbdZjmamsh
         n3m+Q2Z+9EJEdffFx/qwGxxT+T739hQhMMjOZqTs7YPGIvZhLdMNPywH6Nr8MDmogpWP
         ibpaLaM6Z+GpVYj/x27Cnjt8/4x6QdSnE8sapDAMBSIOZmBWaZRCB7xWhA6aDNkiNbST
         8sBf9eyPWvamtVoBYVsfH6QBhaiNt+Lg/f2CeWK8MSH6WA4FiWki/FxWBbzkxwNq7/gX
         UngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795567; x=1690400367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4J5hSUWV8g1G/mLF/LKS95JQ6t1uO7RiOvw0BN1K0AU=;
        b=h+JH8GmgwEfWcfUTnXHl+1NtFz0jvQjp5gC5kHzdyXvC2u3DY7fA4ejXuDnpvy8dT+
         OPaikSxj7xEgxQIwS2px0LUObJTlN45SS+6TmVO1tpe7IrZDDlzw/uCZY8LgZvp1MjIJ
         CDZ6ThMRQ3NVkG+qtodRWlY/1dw39RlmLE+kLPOXsuSvc4Z76GpF2eyG827etS33bOQD
         9jJGnjpxFTOKs4kedjrprH6IeyJXGRaPWQzNM5Cg01BMz7VM3cHNcBhO4jPD0RwbTXhM
         ciRADvbs8IOLazF041cVISkRIgtJD+f0ENb9Byakx7hVAB3VC1pq8W8dw+aS3Xfgtwgl
         R1ug==
X-Gm-Message-State: ABy/qLZ8s/r24jKvbw4GB6rgaFLevpgek43FkO3oKMe0vEuC1HrHDODO
	fihX8WR4uImn1wZTe0o1ycg=
X-Google-Smtp-Source: APBJJlEK2lZLBr0hVdf0l8BoBxBgARN38VQyzV2MGXJw7PWWBLISTw4nLpLv5qNUxhOgwEI0Htw8DQ==
X-Received: by 2002:a05:6512:34d3:b0:4fd:c882:bb42 with SMTP id w19-20020a05651234d300b004fdc882bb42mr587897lfr.15.1689795566637;
        Wed, 19 Jul 2023 12:39:26 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id v5-20020aa7cd45000000b0051e069ebee3sm3076174edw.14.2023.07.19.12.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 12:39:25 -0700 (PDT)
Message-ID: <c919ba00-f741-33ff-cc6f-18988c52f14d@gmail.com>
Date: Wed, 19 Jul 2023 21:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: nand-controller: add
 nand-skip-bbtscan and nand-no-bbm-quirk DT options
To: Conor Dooley <conor@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
 <20230718-curfew-jumble-aeafe95c5cc7@spud>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20230718-curfew-jumble-aeafe95c5cc7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123929_137989_58B13CDA 
X-CRM114-Status: GOOD (  23.77  )
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



On 7/18/23 17:46, Conor Dooley wrote:
> On Sat, Jul 15, 2023 at 12:48:16PM +0200, Johan Jonker wrote:
>> A NAND chip can contain a different data format then the MTD framework
>> expects in the erase blocks for the Bad Block Table(BBT).
>> Result is a failed probe, while nothing wrong with the hardware.
>> Some MTD flags need to be set to gain access again.
>>
>> Skip the automatic BBT scan with the NAND_SKIP_BBTSCAN option
>> so that the original content is unchanged during the driver probe.
>> The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
>> the nand_erase_nand() function and the flash_erase command.
>>
>> Add nand-skip-bbtscan and nand-no-bbm-quirk Device Tree options,
>> so the user has the "freedom of choice" by neutral
>> access mode to read and write in whatever format is needed.
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>
>> Previous discussion:
>> [PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add skipbbt option
>> https://lore.kernel.org/linux-mtd/1618382560.2326931.1689261435022.JavaMail.zimbra@nod.at/
>> ---
>>  .../devicetree/bindings/mtd/nand-controller.yaml    | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> index f70a32d2d9d4..ca04d06a0377 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> @@ -103,6 +103,19 @@ patternProperties:
>>            the boot ROM or similar restrictions.
>>          $ref: /schemas/types.yaml#/definitions/flag
>>
>> +      nand-no-bbm-quirk:
>> +        description:
>> +          Some controllers with pipelined ECC engines override the BBM marker with
>> +          data or ECC bytes, thus making bad block detection through bad block marker
>> +          impossible. Let's flag those chips so the core knows it shouldn't check the
>> +          BBM and consider all blocks good.
>> +        $ref: /schemas/types.yaml#/definitions/flag
> 
> While this seems okay, as it seems to describe facet of the hardware...
> 
>> +      nand-skip-bbtscan:
>> +        description:
>> +          This option skips the BBT scan during initialization.
>> +        $ref: /schemas/types.yaml#/definitions/flag
> 
> ...this seems to be used to control the behaviour of software, and does
> not describe the underlying hardware.
> 
> Maybe I'm off, but the description of the property does not hint at the
> aspect of the hardware that this addresses.

Hi Conor,


Thank you!
Your point is correct.
However I need both flags to change MTD software driver probe behavior in case of formatting.

Patch was made after comment by  Miquel:
'I would rather prefer a DT property which says "do not use the
standard pattern".'

DT should describe hardware and not software probe configuration.
Currently not aware what other options we have for module parameters.
Prefer my solution in the link. Could the MTD maintainer have a look again? Thanks!
Please advise.

Johan Jonker

> 
> Thanks,
> Conor.
> 
>> +
>>        nand-rb:
>>          description:
>>            Contains the native Ready/Busy IDs.
>> --
>> 2.30.2
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
