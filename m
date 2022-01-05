Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3DBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI1IVHEnxtsjZJxODOzn782csYZ9K/ac9F7XUzTG65U=; b=w1da1ZVph9kPabjumfNuQtL1eZ
	DtbOO9BPGrGFMRYKahBoLTSPxWQz0XeKA05YlVkDZY64F+hCI/3Q+bnwtNJgEQvm04NEe+MpVxkLB
	MqVdMhY/pSakozf1tElISx0K+qtBI7AN5RnqfhVXwVqFbVwXZHy5q/m7l25EfJu+DtwdLzsdkJO2b
	oWizuq1nkk1awFWzgLfqCT3ZFHaf6zL5DkERAupwXPTunwso0cIG8WYo08TzA0Dv9Vh0C8GG1sU9S
	zyKLggzFZhQulR3fbgtw1p0XRugAQNc6AcHqJM9fHZSEFyXUdkc5+tVZp5AjcxbYwQDC8RmYDNScX
	/nKCfCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n51cJ-00EDLI-VD; Wed, 05 Jan 2022 08:25:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n51c5-00EDFk-Oh; Wed, 05 Jan 2022 08:25:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 757D0223EA;
 Wed,  5 Jan 2022 09:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1641371133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fedfQgsr6x9sO3yER1l6Ln3QpkNkKoaDU8cBMzFGN+Q=;
 b=sY7Ujav2tztK21oJXfBxaCMq+iQ5cXCzRUQAp0RpDAoO7/iKxJbuM12oT/IIq0js0jcnSM
 YchXyLgsb8/IjCbvNI7vboWmRX0aF1VVMVk6aGYTftIYnObjbnxWI7754yVlDccBYZ70kW
 wgck4SYQ2XLf90IPCA+qGcF5BVvLUfs=
MIME-Version: 1.0
Date: Wed, 05 Jan 2022 09:25:29 +0100
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Frank Rowand
 <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [PATCH 2/8] dt-bindings: nvmem: add transformation bindings
In-Reply-To: <YdRh2lp5Ca08gHtR@robh.at.kernel.org>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-3-michael@walle.cc>
 <YdRh2lp5Ca08gHtR@robh.at.kernel.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <084b306b7c49ce8085dd867663945d29@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_002542_062039_63F11F63 
X-CRM114-Status: GOOD (  19.94  )
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

Am 2022-01-04 16:03, schrieb Rob Herring:
> On Tue, Dec 28, 2021 at 03:25:43PM +0100, Michael Walle wrote:
>> Just add a simple list of the supported devices which need a nvmem
>> transformations.
>> 
>> Also, since the compatible string is prepended to the actual nvmem
>> compatible string, we need to match using "contains" instead of an 
>> exact
>> match.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  .../devicetree/bindings/mtd/mtd.yaml          |  7 +--
>>  .../bindings/nvmem/nvmem-transformations.yaml | 46 
>> +++++++++++++++++++
>>  2 files changed, 50 insertions(+), 3 deletions(-)
>>  create mode 100644 
>> Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml 
>> b/Documentation/devicetree/bindings/mtd/mtd.yaml
>> index 376b679cfc70..0291e439b6a6 100644
>> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
>> @@ -33,9 +33,10 @@ patternProperties:
>> 
>>      properties:
>>        compatible:
>> -        enum:
>> -          - user-otp
>> -          - factory-otp
>> +        contains:
>> +          enum:
>> +            - user-otp
>> +            - factory-otp
> 
> If the addition is only compatible strings, then I would just add them
> here. Otherwise this needs to be structured a bit differently. More on
> that below.

I wanted to avoid having these compatible strings "cluttered" all around
the various files. Esp. having a specific compatible string in a generic
mtd.yaml. But if everyone is fine with that, I'll just move it here.

>> 
>>      required:
>>        - compatible
>> diff --git 
>> a/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml 
>> b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
>> new file mode 100644
>> index 000000000000..8c8d85fd6d27
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/nvmem-transformations.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVMEM transformations Device Tree Bindings
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  This is a list NVMEM devices which need transformations.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +        - enum:
>> +          - kontron,sl28-vpd
>> +        - const: user-otp
>> +      - const: user-otp
> 
> This will be applied to any node containing 'user-otp'. You need a
> custom 'select' to avoid that.

Out of curiosity, you mean something like:

select:
   compatible:
     contains:
       enum:
         - kontron,sl28-vpd


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
