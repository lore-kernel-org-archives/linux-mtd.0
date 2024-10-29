Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E45D2AB0A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hArkmAm29mlYZndQN63p51OmYCcmcNawnzMMXfaNpwk=; b=pT1JV247VvNHRp
	TlI9HMlbE4FTWmgg2HP9Iw8+PZcIXl6H1CoOaGFDWXa7PmEb0oARYMzz5tYKx5jg92wYUVCCaz80I
	cSgUKmbj4kIw9yskQBzDL7CKr/MZWFcflmc5+bjKJ/AsJjXFFRupUQ2KrNa/4kW1BWdD5C8isKUUE
	8ZzVvJMgYi+jsBBJyZUtgGJV71MHcTWhS3KbxTfdalAWLzsg5yB0TgJLFjHMqb1fmL3QoRpk/yMmg
	yrJa4S1FWSyAHK+/94bwkXlGychCG93uX88rGEseGmqkZRHRc2/+CDiqecrZZLyStchJoUe5i6VM5
	u/S2nzXp/h533wq1OIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5isU-0000000DvS7-30Ew;
	Tue, 29 Oct 2024 09:51:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5irb-0000000DvGd-3Wjm
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 09:50:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so3393532f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730195410; x=1730800210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoTvBOrAuRYQReshFO2dNXUuJfaDJJsaTs/Pc/IWOP8=;
        b=UFEEZ/p4X8hw5rlCY5ngTdi6r3jusapzGDE0Gm2AiEL6PD1ejXDpsZhMQiHZTlIzJi
         bLm6P+uPX2uo7hwEs9mPexKt045RmuMnV4xHudHEfjbUrWdUyVPmqKeKCgwtk5k7MLlb
         R+zqSQ5CWuyXDQFS1q5sE8qhKGzdIBwU8lDNM8P4qLHadX3eJk+efKM8QVbX+QEKvAwH
         UA4UZt0nLeU8zEkBkYQcb8WF9dP5E2HJ5L9GH4mBnulPi5pkI/Q/8cbBHoyhXt9I1fTx
         QholRkIWZFwaTgptsCEOnLSOEyvbFVH/WdJjO8IEIbDH4qHrxe3r9hq9/b/7+Ph9Jln1
         CEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195410; x=1730800210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoTvBOrAuRYQReshFO2dNXUuJfaDJJsaTs/Pc/IWOP8=;
        b=a3W13CgQuhy2XKAaivYl8B0wqixxtE/fgp190/tdvTIQnET5V8PDXQ238/iNS5DphX
         5LUvR2r/w8x/vKmfbSReOU100wmiGSlyV0xntcDI1px+opA+tTDShXXBDC5iAKCT14/J
         c/uE4mi40OLcuWRlG/fUrB11IaSwGgg8qj1T5OngruTkwQ4h96IWAwjhXYT0nN7cQC6s
         ePX3GSZ0GmhqVQVUsq1ckX0h+X0kNhwSVOSe9BULGH10QkgQY9c33XU+1YZlaTz0VAJB
         Pjfvr68jdHpxwodg9NY9yhjC4s5Pcm4IOxdr/GNivKgeNfWEWJdNqxZVRORjNXzfJwod
         HnAA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Hg+mK3mU90LmjfxFGdf8UWmL6nje/SPH0bMf3mlYbRbC3IPG7ZvvZ44lgAE5zTTNnVKcTom0giY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPAWbSFjxOaVnNfkK4aTruf7ozy3xq5ntSUN+iDRQt6ohVXQ5
	ELgF/F2LkKmi5w0TAwCWRXtn3m6eJtzZkPE0XynWB4KKIsC6VKtKgZmibbNHVVY=
X-Google-Smtp-Source: AGHT+IG8XiDibHrJEMH96PoQ8A9rLpt+HJm76xNOeHtTIaWfK/6v5TMKsOr0lvl5ZC2cOMzvQ499EQ==
X-Received: by 2002:a5d:66c8:0:b0:374:b6f3:728d with SMTP id ffacd0b85a97d-380611f48c7mr8065520f8f.46.1730195410305;
        Tue, 29 Oct 2024 02:50:10 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47952sm11897956f8f.48.2024.10.29.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 02:50:09 -0700 (PDT)
Message-ID: <58142044-b232-48d6-8c98-7a0ac0fab099@linaro.org>
Date: Tue, 29 Oct 2024 09:50:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
To: Michael Walle <mwalle@kernel.org>, Marc Kleine-Budde
 <mkl@pengutronix.de>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pratyush Yadav <pratyush@kernel.org>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
 <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
 <20240930-amaranth-stallion-of-fantasy-67701d-mkl@pengutronix.de>
 <D4PERKZ4GL6B.1WKA1I3MYSQVL@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D4PERKZ4GL6B.1WKA1I3MYSQVL@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_025011_929431_03EB934E 
X-CRM114-Status: GOOD (  16.85  )
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



On 10/7/24 8:50 AM, Michael Walle wrote:
> Hi,
> 
>>>> +	ret = devm_regulator_get_enable(dev, "vcc");
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>
>>> What happens if the SPI-NOR doesn't have a "vcc" regulator?
>>
>> ...the SPI-NOR will use the dummy regulator.
> 
> Which then prints a warning "using dummy regulator". Is that the
> usual way to go?
> I mean the regulator is actually mandatory because it is the main
> voltage rail for the flash. To get rid of the warning one can add a
> fixed-regulator (which is correct anyway). But OTOH, the device tree

I think it's fine to have the warning. It will help people write a
better device tree.

> lists it as optional (marking it as required isn't an option either
> because virtually all device trees won't have that property).
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
