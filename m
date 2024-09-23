Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E18CCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPyAjI14HXSjDcp3cQZiu4AeLY6ccVsEtSQZbApYcDI=; b=uo7B0EyhTH7ovq
	HoxTx4s3cr5GuNejBJlVFUCLttOZuo3288aQ0hOWU5OUw6MPbY+lmF6QmdtRkFraomujDI/E3eHaq
	Ivvsd/QFzQYDTKSV2PRieknXCVSQhh00wf9ktWQ8WIQZtEAWS7H+yrlWqF7bgBWFax8En2/JMn99V
	XFVSBZx1XOQWK3TxPQExfdeRcmDc2Yek2+ZibUe4CgqpwsdV0TNgSc/+4/8+6jZVMgynrSBio5CkB
	Jzi+ui0xlayBzT2gWQglHL+YN0XybWo64gchwFVgFMLjXecsoSh4cPu3B8gC82Dnqj02sJHeSwQyV
	n0RpoxVxmO8imuWDT1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnQF-00000000D8g-0Rsk;
	Mon, 23 Sep 2024 18:04:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnQD-00000000D8L-0HVK
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 18:04:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so39950935e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727114667; x=1727719467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO+W9KvBIp2SrrQN0yFY2AGl1nSxbm0owTQrCSAJb1Q=;
        b=Rw6SMMepFueuv2XLptqMK4djS0b6a2xKZ0camVhB5EUp56PjusmL8oYFfZI2oNEjfv
         j+pGg4oMDz4DPcfH00P7NY8o0ACtDLhq1BmUhNHAo0yBo869xYWvt1jAnxbLbYjOT8fK
         3tVmcjHT6yqh1QmPQJRtlyYqoAFqdkLViB5lEg4YVMoNikrFmUl0D48nXhVuXI2oYeW3
         y5amXqN+68DgXs4uEOlqB1R9Lhbj+7lhhqFLxL/dqkdNFpszbfVBmzS6bLJX/C7dNP0W
         014svR7p0/D/qG9gNiH5hzJ9hTwUhzH/HSEbKjll3GPjIFsVtCLrWJC9vsIy9LB30KoS
         APfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727114667; x=1727719467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO+W9KvBIp2SrrQN0yFY2AGl1nSxbm0owTQrCSAJb1Q=;
        b=R9yq7PQ9smpxQkPtdVTRMzB2EWQ7e/eyFqLETYP/VsKyOjHdc/UChxnywXZKs+G2ot
         DJYnjkOM8tHSlbxuNg/ui7Ooz/7b8Wo1tmq176J0YUEJMxN9Zxo6Z0mH4xf9dO/uVW3U
         ZbFTAR255KDTC2r4p76d0HKLpN9NBxUaWWEXGsF06R8p4KpBNNlq9V9Acf5HAQ1+tTnK
         1n4nw+3ZuHkzRmDMd0onBZPoo3IplU94AfEsJJbR3PMcy/fpa86XNT1YKUYEPJvLzYv5
         B2kFuGVO8O2og++uc5DS8/6kGtfYrAN5lEOV5XV2uOyH+0ApsHBh9tRoT1uAwgp7ifos
         O1Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWMkIYmBkGW9/PKu10LmyHnIFAPA+Ow27ZMXIILrTEfYDrelmWBRSJHqRYwxvlm/XBYzflfy8VUYK0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq0QRYoFE7TCwtxfchHqf4VN4r2tNoBtJInfqPEnTffgicBoe6
	Dtd6Ejyo6/4pE5st4grkRlwmk1tQ0JDlsvTaNchKvyLT+zUKjjI0hOgOxqQovfs=
X-Google-Smtp-Source: AGHT+IH4mIcSMeCsit/sQntDVwQ0Uc+MyXpCNWyrH63qvRncMa4pqbi8DXt4OST3RUWma7bFYxiwCA==
X-Received: by 2002:a05:600c:3591:b0:42c:b63e:fe8f with SMTP id 5b1f17b1804b1-42e7abfc4d8mr96428835e9.13.1727114667138;
        Mon, 23 Sep 2024 11:04:27 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afd598dsm107400605e9.25.2024.09.23.11.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 11:04:25 -0700 (PDT)
Message-ID: <906df2b1-2827-444f-9de2-9b59f4d49b5c@linaro.org>
Date: Mon, 23 Sep 2024 19:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Erez <erezgeva2@gmail.com>, Michael Walle <mwalle@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
 <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
 <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
 <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_110429_145811_BD668EEA 
X-CRM114-Status: GOOD (  27.30  )
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



On 9/23/24 5:31 PM, Erez wrote:
> On Mon, 23 Sept 2024 at 18:19, Michael Walle <mwalle@kernel.org> wrote:
>>
>> Hi,
>>
>>>>> I would gladly remove the obsolete mx25l12805d.
>>>> Why? I don't see any need for that.
>>> Maybe because we do not want compatibility table?
>>
>> I don't get this? Anyway, we do not remove support for older
>> flashes for no reason.
> 
> I did not insist, you asked.
> Macronix stopped selling these chips 15 year ago.
> How long do you want to support old chips?
> 

as long as there's at least a user in the kernel.
>>
>>> No, reading the SFDP is great.
>>> Except for OTP parameters/configuration.
>>> As there is not way to find OTP parameters using JEDEC ID/SFDP
>>> So as I understand there are only 2 ways to set the OTP parameters:
>>> * Use a compatibility.
>>> * Use dynamic OTP configuration, through DT, sysfs,
>>
>> * Use the in-kernel database to look up the parameters as it is done
>>   with any other flash device. If the id is reused, look for
> 
> All IDs in table are reused.
> The change I suggest is to read SFDP to all Macronix chips.
> As today, we skip the RDSFDP. "to avoid no-op".
> 
>>   differences in the SFDP to figure out the correct flash device,
> 
> You can not do that unless you actually read the SFDP.
> 
>>   then add some .fixups to manually add the OTP flags and
>>   parameters.
> 
> I am in favour.
> As we can not use JEDEC ID or SFDP for OTP parameters.
> How do you suggest manually OTP parameters?

Michael literally just said how to do it. Here it is again:
```
* Use the in-kernel database to look up the parameters as it is done
  with any other flash device. If the id is reused, look for
  differences in the SFDP to figure out the correct flash device,
  then add some .fixups to manually add the OTP flags and
  parameters.
```
> Tudor Ambarus rejected my proposal.
> I am open to implementing your suggestion.
> 
> I will split the two patches to avoid confusion.
> So I will submit 2 patches:
> * Always read Macronix chips SFDP, as Macronix replaced all old chips
> in the Manufacture table.

I'll NACK it unless you prove that the old flavors of flashes are not
used anymore in the kernel.
> * Support Macronix OTP.

Hopefully this time you describe your problem in the commit message and
convince us it is worth fixing and that it makes sense for us to read
past the first paragraph.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
