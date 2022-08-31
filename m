Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87632ECAAD4
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4zjpcXWAHovPfcex4tpdrGOvOtQ3Te4obfkZ2ATS30=; b=I7HGL2+vjJVMgJtXkRLq6+BJLa
	MFOoNn+6DO/XDCEc1WoiWwPajMdm3xqzvVWrwFBWhOZrNDh25slOWNvX+hdYeIgvbfP5tDHzHSwXT
	Qpd3bLa926CPbhh//z2nHTemnEljp4gs7IBbTcSvjrco+ldbOLZB8KvGnb9bjq3tstCwvGtoF3qnQ
	N4WY4keufpgCQOuaXFozA6KHDOv5nsGdZHuOw8/3UpFODrgZ0+L16QPzBjYb4LnYz98Ye/mG6l1UG
	EDmSSSssO+R+ee9qg65bAJ6M54T4RuQHikKnmX7rycVkA9qsEBkRNeF85cz4IHvFgfAOz+a9avot8
	ycVLdSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTKNh-005PW3-Ex; Wed, 31 Aug 2022 09:51:33 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTKNT-005PMj-1C; Wed, 31 Aug 2022 09:51:20 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 95E94380;
	Wed, 31 Aug 2022 11:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661939473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLs6Onq3yh9Op5LQpak2LFOaNZmEuURyI/Mr9UssDGM=;
	b=pzSJm8uj7k/uDv24llR5/V99GkQF/kfK5TdL8JcOrWl/AhMpxLuc76fCbi45d1NgJJu97Q
	Xrf49LxwmSS+VNXizVhFJeZBc5zzihSfK67AIXTJc3qzjeKLs9z19rRDgwUkkFTjE2HWV8
	qsb/xVGgAfBbvUNFV8hXJfpzzNOXKUePz5DedALi9WVd0nheojAEhcaCfqHLmrti9Vk4ia
	ocLIfVA6aM7+lRfJV/Mk6IoJSbelvbrsGIgannZQgPpaEv4dExdFjnJTrGl2VW6D3Qhfxy
	H0L2oXQavQCwT+xAqzCrZcIA7DNyY22IAO4twrvDUqGZbcIJPfO64hMMC3glLA==
MIME-Version: 1.0
Date: Wed, 31 Aug 2022 11:51:13 +0200
From: Michael Walle <michael@walle.cc>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 09/14] dt-bindings: nvmem: add YAML schema for the sl28
 vpd layout
In-Reply-To: <4bf16e18-1591-8bc9-7c46-649391de3761@linaro.org>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-10-michael@walle.cc>
 <b85276ee-3e19-3adb-8077-c1e564e02eb3@linaro.org>
 <ddaf3328bc7d88c47517285a3773470f@walle.cc>
 <4bf16e18-1591-8bc9-7c46-649391de3761@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1b06716690b0070c0c2b0985577763e3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_025119_267374_B4FFFAAE 
X-CRM114-Status: GOOD (  22.34  )
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

Am 2022-08-31 11:24, schrieb Krzysztof Kozlowski:
> On 31/08/2022 11:17, Michael Walle wrote:

>> First thing, this binding isn't like the usual ones, so it might be
>> totally wrong.
>> 
>> What I'd like to achieve here is the following:
>> 
>> We have the nvmem-consumer dt binding where you can reference a
>> nvmem cell in a consumer node. Example:
>>    nvmem-cells = <&base_mac_address 5>;
>>    nvmem-cell-names = "mac-address";
>> 
>> On the other end of the link we have the nvmem-provider. The dt
>> bindings works well if that one has individual cell nodes, like
>> it is described in the nvmem.yaml binding. I.e. you can give the
>> cell a label and make a reference to it in the consumer just like
>> in the example above.
> 
> You can also achieve it with phandle argument to the nvmwm controller,
> right? Just like most of providers are doing (clocks, resets). Having
> fake (empty) nodes just for that seems like overkill.

You mean like
  nvmem-cells = <&nvmem_device SERIAL_NUMBER>;

I'm not sure about the implications for now, because one is
referencing the device and not individal cells. Putting that
aside for now, there seems to be a problem with the index for
the base mac address: You will have different number of arguments
for the phandle. That doesn't work, right?

nvmem-cells = <&nvmem_device SERIAL_NUMBER>;
nvmem-cells = <&nvmem_device BASE_MAC_ADDRESS 1>;

>> Now comes the catch: what if there is no actual description of the
>> cell in the device tree, but is is generated during runtime. How
>> can I get a label to it.
> 
> Same as clocks, resets, power-domains and everyone else.

See
https://git.kernel.org/torvalds/c/084973e944bec21804f8afb0515b25434438699a

And I guess this discussion is relevant here:
https://lore.kernel.org/linux-devicetree/20220124160300.25131-1-zajec5@gmail.com/

>> Therefore, in this case, there is just
>> an empty node and the driver will associate it with the cell
>> created during runtime (see patch 10). It is not expected, that
>> is has any properties.
> 
> It cannot be even referenced as it does not have #cells property...

You mean "#nvmem-cell-cells"? See patch #2. None of the nvmem
cells had such a property for now.

>>>> +
>>>> +  base-mac-address:
>>> 
>>> Fields should be rather described here, not in top-level description.
>>> 
>>>> +    type: object
>>> 
>>> On this level:
>>>     additionalProperties: false
>>> 
>>>> +
>>>> +    properties:
>>>> +      "#nvmem-cell-cells":
>>>> +        const: 1
>>>> +
>>> 
>>> I also wonder why you do not have unit addresses. What if you want to
>>> have two base MAC addresses?
>> 
>> That would describe an offset within the nvmem device. But the offset
>> might not be constant, depending on the content. My understanding
>> so far was that in that case, you use the "-N" suffix.
>> 
>> base-mac-address-1
>> base-mac-address-2
>> 
>> (or maybe completely different names).
> 
> You do not allow "base-mac-address-1". Your binding explicitly accepts
> only "base-mac-address".

Because the binding matches the driver, which matches the driver
which matches the VPD data and there is only one base mac address.
Thus, no need for different ones.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
