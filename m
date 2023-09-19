Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C02CD54AB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1+gAs6Wyp3d+jQhR0dfUNGgLtqJoqLBlF9z/TYsx/w=; b=bPx58j+xyrsYyT
	SVZmSD8bkkcII7LwFztkuMeB6GSU8d1cclN1rHW83SEzosEl7kp+7aiVCZ3qS15FEVdZHT6Rt4gm2
	X8F038DrNtMQYpm/lenYKuIb4AlFsbub2dokJ5+LD1KNA//iWv7Y3ahvchZdbVYtYAai//bjXrBVF
	hL/ipf8EaehciWUaXXrGLxkYlkjpmiNZeXG+q9NqrkhVxH11fa8UNHiHAqcjpguwUvromnGLd5yP6
	y46FGSBGGSahnwYt0Qp6L4wBXD9u2aeKeKdVoTQpG9oAYC68Furs567VU7apuTXoyoaq+JzWKz4k0
	9buGtg0lm+32XJ5hoAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXCl-00HW3A-0e;
	Tue, 19 Sep 2023 09:39:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXCh-00HW2g-2X
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 09:39:37 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-532aaba8747so1138904a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695116372; x=1695721172; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhbUlueLwG/r1Ec1jRuM74oRQ8GVWOc98/czczQGIIE=;
        b=Q7VqoT1Cbi43+Rklht39lLGppeV1z27nyoYXdWTL0SxutkEpbEr2iqC/w1zGv7Ayep
         kNhPsFUgbAHaQhtPeUbituBIufxbm2NmfCRaZxw8hMP0UePUeRI7EwlHg37fPr0tO4/N
         dFIRfFkZrFay7WwgK1yEgbTo/gymrNtfX/ua7gwYFQ0RwimAVMPiHtMNeYR9oe2TXpMR
         /Kf5RFh8u1qyONJxz0whuBrb1gGq+g/nrbwvoAL2HVil6koXgCtAUICxgFFDCqLqBXmt
         YpfhjV01phRRXB9Qy+rmTgMS332Nv00bsNP0iZd1H4opizstKNKcM7WnXIx0xOX3yWW0
         ZEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116372; x=1695721172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhbUlueLwG/r1Ec1jRuM74oRQ8GVWOc98/czczQGIIE=;
        b=iv7E7av8XjQhdCF5HG7AMAx8uhuLnpV7yJt6+GImumxS06juoGdl0R1/6mdjLrT+6E
         jEOt0UtrlSX4xjVUJfCPqFY+qIhXXdSUp3Rle0rCDCoSZnHkZqIhzjToJQCm7CDHfJT9
         8Z2MN5D39edhOVnnExSWdhcaN9x5wQd1vF2xMSJgDIcQRFF0dDTz+v7RTvV8CrZhIhml
         xEEbFT480Q7Lndic4DO2mHp1OvMv9k6XGreh0ITYdhFdDdpk0hzZOWYIcqNG89sZivUP
         /KlTmsnuaO7IkuyOD3mfRlKsRW5b3KOnK3biZQ+99/MIeszRnWb7lPA/MdgEkAUMiet0
         Jorw==
X-Gm-Message-State: AOJu0YyJKLIBM/dFYyUC0WPV59ASl5OoScDTtiDv3J/MoMmWPiH8yyUn
	vJwwRzJNTf6aICejdqFnoHpfUQ==
X-Google-Smtp-Source: AGHT+IEloqdlvufW6mI6LmUIXNtWYxF9AGR9eR0sjhvD9WKKkHWY8/+nTQOaU4W8KPXLI/2FvFrX6g==
X-Received: by 2002:a17:907:6087:b0:9a5:cf6f:3efc with SMTP id ht7-20020a170907608700b009a5cf6f3efcmr8477878ejc.77.1695116371999;
        Tue, 19 Sep 2023 02:39:31 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id rp26-20020a170906d97a00b009ad829ed144sm7490622ejb.130.2023.09.19.02.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:39:31 -0700 (PDT)
Message-ID: <11380d64-09dd-352a-a6bf-3b8be332ec1c@linaro.org>
Date: Tue, 19 Sep 2023 12:39:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 00/41] mtd: spi-nor: clean the flash_info database up
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_023935_851876_BA0BEE85 
X-CRM114-Status: UNSURE (   8.46  )
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



On 08.09.2023 13:16, Michael Walle wrote:
>  - w25q32dw/layerscape spi
>  - w25q32dw (with empty size and empty no_sfdp_flags)/layerscape spi
>  - w25q16dw/mediatek spi

all looks good, Michael, thanks for specifying the tests done.
I'll queue the patches with or without the small comments addressed,
just waiting for a couple of hours to get a response from you.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
