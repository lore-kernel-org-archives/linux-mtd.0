Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA6EC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxpHaTh3xU0hDCVwshDfSHeC7ansaxRzgAHTfkX2OvE=; b=UDw3eGGSDqE4sj
	cMQbkKltblsDGtfAq6WgQUGiLIcbGn6okfBqI8wXbQTzF8AH1NnNSUCgYJvuOwhwCAB7w8nsNDQ1D
	76xgRlaYYvIwn7SmUiD+sBtjnqah1LgHv4b90RzfSRDY/1XdGqX/DCdkHnkIum6TuewcdQo2MtR9L
	gUS3x2aJQ7e6lCEp5hzBwNZpf2H4b2oYUyPYS3C+yBzx62eLnvWMAXdE5qeLZKFH5FhTLuNCF7lS6
	5pY+CyvJa2Wx69kzPFeMrdTHh47nPY4gPASy/84Sr8uJ0JYDV449tlQ2iwuE3yCsBYk/mt3FrY8V5
	E/zsgeOJm8A8q0f1lGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncZKp-00E56P-Tz; Thu, 07 Apr 2022 21:06:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncZKm-00E55C-Ko
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 21:06:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h4so9669633wrc.13
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VYDGD/lRh/S3APeRLxg/uVBh3CXm8UmCkYzmr6Xm0TY=;
 b=N6uhWtFP3F3lmqbvC4tdoeq5G5+gzPYi+82xknSqaEiYQjD5S39+Z+S3+npgLuTd8p
 sBy09OhRV9U58FqxU+iRDHKxUJjA/1YCpHWdBBa+iZf5PtXaVn2ddP/k7cLBeUdi8a4n
 ZKMpK/VOaaeiCPcW5Y5hdNGIiL6OR3ayzJsY6bTXlUuM/ZMOomUHcKkwzKg7hLPNw9sJ
 CUP2mOuyh3Ktc6sZVnY1fIFqSOCO+7bYpX+Eyg/zt4YkLfgKXDkZ+4wz8SUh2e1O5hN0
 QmpO0X/QdYr0J1sZzo8gOas2C1h1fBqD4fXRq3iBGANBtGxnB1MgN1VtdCNg4UFPCjDs
 I3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VYDGD/lRh/S3APeRLxg/uVBh3CXm8UmCkYzmr6Xm0TY=;
 b=mF8BwnQYSR85vFEJ0SAlt916R+xicXEPB3t/0dSRjWsSjuJ//r7bC925wcmjON+4DV
 cEmUEabA07PHhubLMPGDbQeUpDWFw+BtBU8yXowh7KfpvtLjsceeZgw72+YU8mNU7prI
 M0K/gpjdtWT40suvZtRPqdeYpc+ZopwzS/lm1FL7xm0S1ZvpznnLbZp0uC6HIWUozN0W
 yLrnvbrShRtsHccTSKz+2GKg5pHTiDpPz7XiAU8mICa3Tgp9dPNTYZfs0imvMe3RdsoO
 eFYrjukR/0Tno4a1dII0W6gK+8YnZQ/xZ4BPIFpoKNLMEFN51KH0YPvvrHXQNzruGfaR
 2Gfg==
X-Gm-Message-State: AOAM533fq9bPMkVrHJazCJPsc8rpfF7gd4Mee+HjS4p/9Bju+Nmd0/u8
 46Qa5rRjm9M+/V3VEzdbRSdUpA==
X-Google-Smtp-Source: ABdhPJyQiv2+i2IpnqHJGw+2b8dO4TXqtW/XLBZB8wqTI1qe3ixmX60ZJmaCzuoWpm23qRrv0x8KeA==
X-Received: by 2002:a5d:64e6:0:b0:204:975:acde with SMTP id
 g6-20020a5d64e6000000b002040975acdemr11872191wri.466.1649365586356; 
 Thu, 07 Apr 2022 14:06:26 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c144a00b0038ccc75a6adsm8363430wmi.37.2022.04.07.14.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 14:06:25 -0700 (PDT)
Message-ID: <200a2002-8573-efaa-774a-51dcec9cc807@linaro.org>
Date: Thu, 7 Apr 2022 23:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: remove unneeded
 properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220407142004.292782-1-krzysztof.kozlowski@linaro.org>
 <Yk8rpUXmfmULMVjr@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yk8rpUXmfmULMVjr@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_140628_740228_5EDD500B 
X-CRM114-Status: GOOD (  14.08  )
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

On 07/04/2022 20:21, Rob Herring wrote:
> On Thu, Apr 07, 2022 at 04:20:04PM +0200, Krzysztof Kozlowski wrote:
>> After conversion the jedec,spi-nor DT schema to reference other schemas
>> (SPI and MTD) and use unevaluatedProperties, several properties are
>> redundant.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml        | 11 -----------
>>  1 file changed, 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> index 4abfb4cfc157..708e7f88fd92 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -50,10 +50,6 @@ properties:
>>      minItems: 1
>>      maxItems: 2
>>  
>> -  spi-max-frequency: true
>> -  spi-rx-bus-width: true
>> -  spi-tx-bus-width: true
>> -
>>    m25p,fast-read:
>>      type: boolean
>>      description:
>> @@ -74,14 +70,9 @@ properties:
>>        be used on such systems, to denote the absence of a reliable reset
>>        mechanism.
>>  
>> -  label: true
>> -
>>    partitions:
>>      type: object
>>  
>> -  '#address-cells': true
>> -  '#size-cells': true
> 
> These are needed for 'partition' nodes.
> 

I am sure I saw them in one of referenced schemas, that's why I removed
them. But now I cannot find it so probably I looked at wrong schema.

Thanks for pointing this out, I'll fix the patch.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
