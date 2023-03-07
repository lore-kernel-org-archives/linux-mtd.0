Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE30C678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0ZtcH9vKG7JR7UURQXQY7H78DvVFxaVrzBcT6ARlZE=; b=fDBVn6vFvfOOFz
	NLnN0gDdDgM6Wdak7yObLq7kHPxMy1iQ8ywA6L6H/uBXYTPhfyzhi+t35wEx84cHKyQEPBsL7etOf
	HizCf0rn8yJt11lrWq484QEM5KaiT8B0RGLbZP9wtK91pKWQdJ5JHw2nNefHcK7kHr/kc7YwTwnaS
	FVBClqw8sIWSkj3Tq2MmtrhIAn0jzN25yqSdjAlhGouImyDwsLydN0tqbCxmkTxTXFg/IxYUwe3BI
	lGI0xrMtDttG9AvHCglXSre05zTCkgePuPLjo5yGQIqZYEidqOg5qFmt2lKHb9laZfK/PKFJ4PQ6L
	l0oIJjqw7CoI3F8qz1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVn5-00HXB2-DS; Tue, 07 Mar 2023 11:47:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVn1-00HXA0-2z
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 11:47:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id da10so51136217edb.3
        for <linux-mtd@lists.infradead.org>; Tue, 07 Mar 2023 03:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678189649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXmsPUQYwGJMekA8Fy8rD+9tRxaJGDIKc6SP+399FoE=;
        b=vQMimmeoShJhHytbnlC85/RZg8J73ZyWQScnYNdFmQL0c2eO6eHU6pYSBPEaQ8hy+L
         FoHj4aY9HT4N6R4T+XNBbq7mOJ6EA4bjPC+DCF106P4ZrYK0YF/k/9X2daPocewHYyYw
         EgdivDNQKJwLRLH9Mb5R6Jv5izZZduEwCicEHFNS88MwnJ8D1ZVwz8wyXc/5im2jeaDJ
         cjYIWBz0OBw+3eU5Y/wzdPksJvoi7irwos+2CeAyGF2uC66mJrSfT0huLuazGO3iyXA/
         xqHWPk8sQbFhrWixuity/g/uJPY6CqU8Ts+OxHOq0VtBDnTvvg4PXcW4aQSXgl+vCV6W
         ezUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXmsPUQYwGJMekA8Fy8rD+9tRxaJGDIKc6SP+399FoE=;
        b=4jf/OcmVdHX4jjAk+jb7fdNnh7U2kmpkgZy+sNDo/n9Tao7YJU3b2mRYZL5DLf/ImN
         FlOaf7cC2s3a5Rv1L6THdsMf9dgBGD/ZqPnJmbX0xFBIJSe8e8n2bz2PhzdwEdZ5QKZ1
         QJcfpZWUwTIZQyhe6NA4vrb4NM3gl7uEDb/A3DLnkm37sa7SavbKeGwb/5SVZ8BPKK3W
         AaODxKoPM54/18ngVpb/7YNxObEFJ7NcTsXpIA1v/smNCC3HlBIDq0vLDjkyWTCgbd2U
         9kfvuKrU1Z+oCpmJdjFMHCgmONuxxkKMFkNBi+LpDXplQeLkOYz8qM3u6XjZbeoEdJk1
         mPHQ==
X-Gm-Message-State: AO0yUKVxVUXkYcKLvcuoKK001ypMv2qV1c6jElOLchSX1jvDzMNykoyN
	XZLwE4pIRSO0oTTGdxLzl+MPrw==
X-Google-Smtp-Source: AK7set/1gpL/LLC2huoOCatJikHhDjXi04XynN+FMDrg5BYAUanVJbwTkH0/o6MQETKaewMXnljpog==
X-Received: by 2002:a05:6402:1a4d:b0:4a2:223d:4514 with SMTP id bf13-20020a0564021a4d00b004a2223d4514mr13782735edb.8.1678189649366;
        Tue, 07 Mar 2023 03:47:29 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id w22-20020a17090633d600b008b907006d5dsm6072533eja.173.2023.03.07.03.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:47:29 -0800 (PST)
Message-ID: <f88b7164-881b-5ada-0d52-05fe418f7b85@linaro.org>
Date: Tue, 7 Mar 2023 11:47:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
Content-Language: en-US
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jic23@kernel.org" <jic23@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
 <1bbda9e6-37fb-195b-fd62-0e437847c636@linaro.org>
 <BN7PR12MB2802992D71DDA252B008AFDADCB79@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <BN7PR12MB2802992D71DDA252B008AFDADCB79@BN7PR12MB2802.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_034731_165882_A359C6A1 
X-CRM114-Status: GOOD (  13.09  )
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



On 3/7/23 11:37, Mahapatra, Amit Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Tuesday, March 7, 2023 9:51 AM
>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
>> broonie@kernel.org; miquel.raynal@bootlin.com; richard@nod.at;
>> vigneshr@ti.com; jic23@kernel.org; pratyush@kernel.org
>> Cc: linux-spi@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories
>> support in SPI core
>>
>> There were too many recipients in To and Cc and I couldn't reply to the
>> email. I whipped off the Cc filed and most of the people from To and added
>> the lists in Cc.
>>
>> On 3/6/23 17:21, Amit Kumar Mahapatra wrote:	
>>> Multi CS support using GPIO is not tested due to unavailability of
>>> necessary hardware setup.
>>
>> Please don't add code that is not used or tested.
> 
> During our discussion on the RFC, Mark had suggested to add multi-cs support
> via GPIO as well. We had agreed to add multi-cs support via GPIO, but had also
> mentioned that we don't have a hardware setup to test the CS GPIO use case.
> https://lore.kernel.org/linux-arm-kernel/BN7PR12MB2802E2A9079E505932832270DC979@BN7PR12MB2802.namprd12.prod.outlook.com/
> 

Ok, his call then.
Cheers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
