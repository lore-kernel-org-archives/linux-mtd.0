Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D3BC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFZo+OqBoGKddUSKieVlUhMLJBz5ohmND5ckTme3esE=; b=WcjhHvtwWF0K7x
	CAkqW5qy42mv69qEDrP8UhxmfHBCE9Xe5uz1PmSxo4zwujVRatxIIGbrXRVbOATXBuE7pxyGVBgfQ
	IVWPm4kyz0bqTmw3IpEJGZ55CYAR8EorGT0llS84+eG1Ywlimy/xjKRYbt9IunL8CkSWzXYNNTcaQ
	E4QItx5j51l9efW/0SvaCqAuyV/jw4vLZ6M+0WwQrJju/eEsZ6tL43luGuM4P1fQP91ALbRzGrCpa
	thrzmgFsQzT0GPYKoQKStZczXLSbS/6QkFaQWLm6WNf1dD0poQIHPsF8PXWxjCht7ckx0CGXH0KzZ
	bu8WLwhV9bhv2E6nwseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5VG-002n39-2w;
	Fri, 15 Dec 2023 10:33:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5VD-002n1D-1W
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 10:33:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so5351425e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702636384; x=1703241184; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES/8p7dj8eOpjaZIO5AxTsTeaONrf5FeKxZa57MxFr4=;
        b=k8Ek94XTrl3s3IrDXuulXO0QLvAintI6GYcALaea+piS9oiAlZOlCyZjkAfxvv0UuR
         Y1USc6ADXWaQb/0lpAm1YGqSK08et6gd6+oXg8a35hBWObTTZir/J84BDHdHXNcTHh4I
         Qg12g5S2cj19nIBF//8tNcF8SetcohtDu4PfMU7MKBmwIRMmNlg1n1IU4Dpts5+EcY8G
         BEdkRqAwO04XlBAZfUp32oJkphLQgFGMXt4FbAfjzqbm8zaYgGrxO2x/8colWzMeKS5z
         m3WGPp1PvFT6pHDqCPVUmL4WG3fP70JFavYsgHfgM0GkERGnID/YGn/L2RtwcnpYHINo
         i+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702636384; x=1703241184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ES/8p7dj8eOpjaZIO5AxTsTeaONrf5FeKxZa57MxFr4=;
        b=eqAXRb5i7MDQrPjvzEOvQOavDEbpCiO6KeqgQvruK6SBjvaZztK5OXyoIakdVJC/U7
         NpqlypQX9P3mDitLdJIJTWcSXopr2t/4kS8AsyQ24EcLPc+qlS4/+X+yA9u0zEV0vKTL
         UCG7qQLeKHbdmQViprAM3iWKXubj6dmDU6zO7hMui+Ytr+31PQPeYtkC7yR7Lcw+ofcw
         sqYM6sAiFHRP7/QsJM1zAVbSunV1YFoyEzxF0I4DIAwBLZYZqlT4QqoBagdwknA8JRGR
         4rnHeOnacEw9NokJ4JkwoMEYaFQtGX3o/dRMlgnYQ9DY1nSYe8lrplNRTzi1dOBtm66a
         kufw==
X-Gm-Message-State: AOJu0YxeGU8Erf3PFR+kfMwcseHtY//t19vfV8M+TKOvrkuAnHHhJbkA
	0oo6gFiHlLjYRrf1OOEIWDdpUQ==
X-Google-Smtp-Source: AGHT+IHvCqTZH8cLyqj3W3/o6f8ZEmQnes53EWvbWxmoY2pWUTbH0iPJoL/UA8Y2YFnwr+nIL2HHIA==
X-Received: by 2002:a05:600c:221a:b0:40c:3306:c300 with SMTP id z26-20020a05600c221a00b0040c3306c300mr5703334wml.62.1702636383695;
        Fri, 15 Dec 2023 02:33:03 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c34cd00b0040c496c64cfsm18468670wmq.12.2023.12.15.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 02:33:03 -0800 (PST)
Message-ID: <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
Date: Fri, 15 Dec 2023 10:33:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_023307_515201_2F31307A 
X-CRM114-Status: GOOD (  11.09  )
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



On 12/15/23 10:02, Mahapatra, Amit Kumar wrote:
> Hello Tudor,

Hi,

> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Friday, December 15, 2023 1:40 PM
>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
>> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
>> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
>> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
>> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
>> michael@walle.cc; linux-mtd@lists.infradead.org;
>> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
>> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-
>> arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
>> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
>> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
>> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
>> in spi-nor
>>
>>
>>
>> On 15.12.2023 09:55, Mahapatra, Amit Kumar wrote:
>>>> Thanks! Can you share with us what flashes you used for testing in
>>>> the stacked and parallel configurations?
>>> I used SPI-NOR QSPI flashes for testing stacked and parallel.
>>
>> I got that, I wanted the flash name or device ID.
> 
> N25Q00A, MX66U2G45G, IS25LP01G & W25H02JV are some of the QSPI flashes on 
> which we tested. Additionally, we conducted tests on over 30 different 
> QSPI flashes from four distinct vendors (Miron, Winbond, Macronix, and ISSI).
> 

Great.

>> What I'm interested is if each flash is in its own package. Are they?
> 
> I'm sorry, but I don't quite understand what you mean by "if each flash in 
> its own package."
> 

There are flashes that are stacked at the physical level. It's a single
flash with multiple dies, that are all under a single physical package.

As I understand, your stacked flash model is at logical level. You have
2 flashes each in its own package. 2 different entities. Is my
understanding correct?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
