Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB6CCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfWVRtEQmH7aKHp26eki+wBznuH7DcOxVotc1K7Rad4=; b=RBaLqPpr5S/+6v
	+Am8m9erne8yDVmCq850IZTMvlFOQJsdLsmzsgO8SCjQo4tb9pZu9zX6hhBiQ8EMNrixuVcQBRcpy
	OJ4pviAGmB4wFUE5CvurZCEQklnXaDfwXK5zjcs4ToXsR+sur4f35sucurvoz5AYmXgO6FGdY8s/U
	cuYMIscyg7vadNXhKxznjR3b1aak6RIPDL0LZH+RNNprFJTrUPRFJtFVkpI/7HK6LfoiARhgfrZc2
	3O7hNjV439KjPlLdbFzfLSHcnsVF5EJ6Vjto8gEr0FZ9k1bspMXsMFrwF4WTFw6hNVBbf/RdttGdJ
	KjINvYwMNqHBt69KutBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgOw-0000000E4br-1wlx;
	Wed, 05 Nov 2025 16:30:26 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgOt-0000000E4b1-31Pv
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:30:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1229071966b.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762360222; x=1762965022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0ElpEfU23zmMJp6XAE1iet2IvdsDeFlwy28hHUB1VQ=;
        b=y20YiohZMDuML2Dh8m8w5nr3LFW6n27ge+F0iOsHs296ueG7TUWRSBTL5ttfWMC2x8
         hcootvg15LEvJbGXj/0kPfGMTrmVBHcLciTsJ/7q/O7qEjs8vc+vmxZiwRnIAtIQhV54
         KsUf5BpEgmBJnqOiSQ0oDHUhGqzM5gQIDCntrVm9FELwMN2+F5YP/YmfFUsMZGTt1gam
         0A7dbg1dZxhSezsNTEFQhNkSIqj6BlojFtxCi0zdv6XggJUUb8og2IgIVmvwG3QSL1Tk
         bSu0Rp5hwdoengEKdsr38blG7pbr8Jj8OWLLG45zRSd1eMmS5bVjGDJwAhVjIuB7sJIR
         3YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360222; x=1762965022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0ElpEfU23zmMJp6XAE1iet2IvdsDeFlwy28hHUB1VQ=;
        b=V5MFXpFKV5wjjJrpc2wUFVzXRIkckipNGQDjPSo1xBGDh0cJAiQqETRNbK3gvQU132
         WwFqRwTohq3jiU1OOLjZhGkLxWt56rLrKPj462xsfEMOd1+Fvmr1iyChuYNUexfrmfrp
         vgE5wM0m0kQye1P6KzogXRPGAuiDj2/98wtG1qhV2S6xVCzi2Q1IIeEVXycbf2nB2WDF
         DeAqQFwUDBmJ8d/tZDf7kDI4u9sGkfrfCUnxHtSNezi95Lde1oNz9UwL9NZzsiW1uU0H
         fpgpWnRY+cQ/gA8G+pp/HqfhNZok4Wd3CVSflANN8/R2rcUzl5G6S/AnFd0rlyWYv3sa
         5yQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5MEDsPIG4i99hKQXXxKg9dJG+tXDwovqVu0yfnbgJOQyC+RUxmdlhujalDjY9IU357mOnRb/mRpc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuIPd16i3hTqgmY30kzCdvQH7ZQYxJAZ1E1AUL0/3gsaEg6hVk
	vlNKcTTt19fu5KL1h2VM3N8xs33AjX0uk9FnpuJOQ5q/GBg11/ieD1prjqkxqS6z+dQ=
X-Gm-Gg: ASbGnctIlKna+g3yFAzP6NybKW+2xASN4i6hrXEJHBQ5Qc+0ayPuMoZuKgsr27MDfuu
	Be7L1TYeX7PW/0dfDVTCC5mctKpA+J08PgRtnuJA1wTgKTYml0NajRezyHEQzbpjXczGG0EuhzB
	FPWAI5EaPeRJiN1sdHTA7TOyS0AG73eUP2WGTYbQTJ2mBv1mrS4C1+/xwOEJ+Viesn8TeJU708q
	4yTE75fhkTWPttIaIo5gvFHeA8Ohglctq1neG04q7TIy32LlfEcFddEz+rJFI48pBbGbjixBLTK
	rngSB/NuWsBjTo6Fg1OjgG4aWRx8ZZKlleartBEkwfoGwIm+znSVlLsULokn74KidI1BHce8Io4
	e9RLbdjvRMCVf1UQmATKDGl9KpBi7E8jahqs3C5HEboMnX3XXxy0W1yqoFJfIKykgn8WjWlzcke
	uWEhMYQzpyc3bURL46lykzsQzUg81a2UgZkQ==
X-Google-Smtp-Source: AGHT+IEsYpuKCxcTkA8jk0GtWL4UNm/KQc74RM599U6pQuabiThT7lxCazj2PKzyq5T1ntntU8gerQ==
X-Received: by 2002:a17:907:3f24:b0:b42:9840:eac1 with SMTP id a640c23a62f3a-b726553b597mr370430566b.49.1762360221599;
        Wed, 05 Nov 2025 08:30:21 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289335c6bsm313966b.7.2025.11.05.08.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:30:20 -0800 (PST)
Message-ID: <d77310d9-f865-45cf-90ae-ff542cd1140f@linaro.org>
Date: Wed, 5 Nov 2025 17:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/28] mtd: spinand: Convert vendor drivers to
 SPINAND_OP()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-11-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-11-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_083023_779538_003E1F15 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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



On 10/31/25 6:26 PM, Miquel Raynal wrote:
> This macro allows to silently switch bus interfaces, use it outside of
> the core in all places that can be trivially converted.
> 
> At this stage there is no functional change expected, until octal DTR
> support gets added.
> 

Shouldn't this be squashed to the previous patch?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
