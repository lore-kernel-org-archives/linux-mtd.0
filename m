Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE60ECAAD1
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wvo8P5QQgfEflh5DcE2AmKfzM3w9pkkXI4f2onCbbVE=; b=E+4bUQ3ax8+ouw
	3jM7Ha85JFJts1WpCYzX117vX6Kv+YjoJxfMK0Oh0h570bLOx2nkMHpqcqhGbRMd0MEAlEIITGCao
	RS+NHQy66R0Rnf8i5/AwZJX7nzMhMnrT1y/7N339l+wiec+whmBlF6Ar5Qrg1ZgQhaTZgqggA6T1U
	zTbwSbBVWH40AVXAV33sTu6tcIUh/w1xPLH/VOIkHzdDX2nyNYS/N+WMi5QLbDQ4dZf44gb+ui3nJ
	c749vTNHD7+jNEcdhtvd9meRkw9nvrRf1GQKXLN2ktK9NyEevQBnfDSGcQJzsWzXbz4xqX5RCDp4q
	5dojtR5sQyUgDZHx/3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNRL-006Fal-U5; Wed, 31 Aug 2022 13:07:32 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNRH-006FWp-B8
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 13:07:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id z29so11296785lfb.13
        for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2022 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7VyLyCy0cnv60X071RxqWAQwfMlcLy5pCMa/AfqXhkg=;
        b=a/rdoFx21sc0a21CEmujAwRASRoyLTGEPAamYtZO6o02CdxDbzXJnfGD1lAVXjLRmi
         CB1IaNpolIxNdpnZ7MDdkKQ6Vu9J4TguhAfL0TaL/iZtTwJzMIwDhBYZEPK4zK20VJtn
         iy+bc7itxKMzhpX2GypJoE/LPt78ONRXS7rJvojWh5lVwczZxkkE7dSkpUutJcZ3D+aY
         mQ64PBFz9mP9KuKBgGwzAcxRe3JGfrgXeIYilvYKoXZDDaXDN0psmYJaIuFLOlpdA4P7
         i8j45hAWo9YIgEuqnJvI1l1cfRXyoKkfV20u3dX15TLHmEDS6h+KJxn7oBptZG5AuSWV
         xX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7VyLyCy0cnv60X071RxqWAQwfMlcLy5pCMa/AfqXhkg=;
        b=HEk7jS14iv6CZAW8R2wI76O3M62utlS+TQzrJh0aLFmW7GDSdfecZpA+/X5pklUNPc
         YQBZfxvhqE37QyJkAJuBM0D7J2zM/H2Wy6Yn1uoUrfXKd/nmPzKz2YbaFszTpJ9k5Vhs
         mH1JnC6TR7UVSiUlzqNPuoy0FZKvIyMqdIhPlZ5MyvgkzSt/WUHXdoaLPGB9ZKmodyqg
         7OrdXYcOxr1oAYa+bCDO3WOnrozX1qO89P9SDRnZPX+wKeLn7ulKSpJkF6iqwvJ7frav
         nd43NXMALxtW0B8QBKAqoZpfwupahxkF81kvaKmOz4G9NDq0wGMU5Hw+kh0Yub4SJTJV
         vPIA==
X-Gm-Message-State: ACgBeo3WhOyqjVr6O9HlgAa24Bgztv5ByG4lKD5hc3CX7cZR6JDZMsT8
	UZ0erJu8H+c1XsHX4yTkks9DRA==
X-Google-Smtp-Source: AA6agR47dGuaM07NwVhaLYtpM85boK7MaJ8WRmcwUOPUyjS2OsuSm56CCSlFElSfgpAjtdp6cbm+3Q==
X-Received: by 2002:ac2:4bc1:0:b0:48b:2b20:ed24 with SMTP id o1-20020ac24bc1000000b0048b2b20ed24mr8675439lfq.67.1661951243523;
        Wed, 31 Aug 2022 06:07:23 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id t17-20020ac25491000000b004946d1f3cc4sm1033990lfk.164.2022.08.31.06.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 06:07:23 -0700 (PDT)
Message-ID: <66076594-6745-e2d9-afff-03b9266f31bd@linaro.org>
Date: Wed, 31 Aug 2022 16:07:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 09/14] dt-bindings: nvmem: add YAML schema for the sl28
 vpd layout
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-10-michael@walle.cc>
 <b85276ee-3e19-3adb-8077-c1e564e02eb3@linaro.org>
 <ddaf3328bc7d88c47517285a3773470f@walle.cc>
 <4bf16e18-1591-8bc9-7c46-649391de3761@linaro.org>
 <1b06716690b0070c0c2b0985577763e3@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1b06716690b0070c0c2b0985577763e3@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_060727_421565_B9A84D4B 
X-CRM114-Status: GOOD (  32.57  )
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

On 31/08/2022 12:51, Michael Walle wrote:
> Am 2022-08-31 11:24, schrieb Krzysztof Kozlowski:
>> On 31/08/2022 11:17, Michael Walle wrote:
> 
>>> First thing, this binding isn't like the usual ones, so it might be
>>> totally wrong.
>>>
>>> What I'd like to achieve here is the following:
>>>
>>> We have the nvmem-consumer dt binding where you can reference a
>>> nvmem cell in a consumer node. Example:
>>>    nvmem-cells = <&base_mac_address 5>;
>>>    nvmem-cell-names = "mac-address";
>>>
>>> On the other end of the link we have the nvmem-provider. The dt
>>> bindings works well if that one has individual cell nodes, like
>>> it is described in the nvmem.yaml binding. I.e. you can give the
>>> cell a label and make a reference to it in the consumer just like
>>> in the example above.
>>
>> You can also achieve it with phandle argument to the nvmwm controller,
>> right? Just like most of providers are doing (clocks, resets). Having
>> fake (empty) nodes just for that seems like overkill.
> 
> You mean like
>   nvmem-cells = <&nvmem_device SERIAL_NUMBER>;

Yes.

> 
> I'm not sure about the implications for now, because one is
> referencing the device and not individal cells. Putting that
> aside for now, there seems to be a problem with the index for
> the base mac address: You will have different number of arguments
> for the phandle. That doesn't work, right?
> 
> nvmem-cells = <&nvmem_device SERIAL_NUMBER>;
> nvmem-cells = <&nvmem_device BASE_MAC_ADDRESS 1>;

It could work, but looks poor, however it could be still nicely extended
with new defines and renames later:

Once:
nvmem-cells = <&nvmem_device BASE_MAC_ADDRESS>;

Later renamed to (with some ABI impact, but in theory names are not part
of ABI, but numbers are):
nvmem-cells = <&nvmem_device BASE_MAC_ADDRESS_1>;
nvmem-cells = <&nvmem_device BASE_MAC_ADDRESS_2>;

(or even skip renaming and just add suffix _2)

You cannot rename device nodes, without deprecating them.

> 
>>> Now comes the catch: what if there is no actual description of the
>>> cell in the device tree, but is is generated during runtime. How
>>> can I get a label to it.
>>
>> Same as clocks, resets, power-domains and everyone else.
> 
> See
> https://git.kernel.org/torvalds/c/084973e944bec21804f8afb0515b25434438699a
> 
> And I guess this discussion is relevant here:
> https://lore.kernel.org/linux-devicetree/20220124160300.25131-1-zajec5@gmail.com/

Eh, ok, I jumped in the middle of something and seems Rob was fine with
these empty nodes. Looks weird and overkill too me (imagine defining 500
clocks in clock-controller like that), but I am here still learning. :)

I guess it makes sense for the cases when OTP/nvmem cells are not
controller specific, not fixed for given OTP controller but rather board
specific and having defined them in header would not make sense.

But then if they are strictly/statically defined as children of a
device, means they are fixed for given OTP and effort is the same as
having them in header...

> 
>>> Therefore, in this case, there is just
>>> an empty node and the driver will associate it with the cell
>>> created during runtime (see patch 10). It is not expected, that
>>> is has any properties.
>>
>> It cannot be even referenced as it does not have #cells property...
> 
> You mean "#nvmem-cell-cells"? See patch #2. None of the nvmem
> cells had such a property for now.

Oh, so so how do you reference them? Users of this seems to be missing,
so I am guessing that directly via phandle to label and nvmem maps them
 with nvmem_find_cell_of_node()?

> 
>>>>> +
>>>>> +  base-mac-address:
>>>>
>>>> Fields should be rather described here, not in top-level description.
>>>>
>>>>> +    type: object
>>>>
>>>> On this level:
>>>>     additionalProperties: false
>>>>
>>>>> +
>>>>> +    properties:
>>>>> +      "#nvmem-cell-cells":
>>>>> +        const: 1
>>>>> +
>>>>
>>>> I also wonder why you do not have unit addresses. What if you want to
>>>> have two base MAC addresses?
>>>
>>> That would describe an offset within the nvmem device. But the offset
>>> might not be constant, depending on the content. My understanding
>>> so far was that in that case, you use the "-N" suffix.
>>>
>>> base-mac-address-1
>>> base-mac-address-2
>>>
>>> (or maybe completely different names).
>>
>> You do not allow "base-mac-address-1". Your binding explicitly accepts
>> only "base-mac-address".
> 
> Because the binding matches the driver, which matches the driver
> which matches the VPD data and there is only one base mac address.
> Thus, no need for different ones.

True, but it is also not extensible, so you have to be sure you covered
100% of this device. And then if you have a new, slightly different
device, you need entirely new schema, because this one is not reusable
at all.

It's ok, it just has some drawbacks/limitations.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
