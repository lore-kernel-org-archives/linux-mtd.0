Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B40CCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+hnkZl3zLlAPsYdFozzpzNpPOihZHT02u+HXVRxS9Y=; b=riNFN9TDUOt/hM
	+25UDxfZh9eCyIhs0tKZ6wL2Y50rTUzytAtdNk3vCo7bc6GRiI4JRrPJTyXHaF9i5kAe/3n/k7/h/
	JRskfzn6bihwUmCd6240m6HcUT0ePuzPlNZ38PU/h582AizrHGnhREpuZ/sOmQ/vXzgLrMin7MDzP
	SEqMMGb0ZBZf0JkANvvSOot/1WzXQPduqqdY5DwDpgHwbSSEAF+b5FEo4rxrOZ52W1Y3B0giaGqVz
	uRl4XofKSYbFYLM9AF053QEaNLvrSuR+wXUM/ZiS+oduIUtY9RNFR/32CBzVRgtts+Tam9CJJUf8W
	4oSsiNANz6kfNsSU+tIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfzh-0000000E1CQ-1zTt;
	Wed, 05 Nov 2025 16:04:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfzf-0000000E1BS-05IV
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:04:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b727f452fffso79068866b.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762358657; x=1762963457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=d5WAXDxehOhq1fPdt11RS+tB/5DIsG5qg5KbG24VsmI1V/PsEk/vy6cdOwgv1sYn25
         cKu6+xlPa9sdV7Bpi4wRV8V/pEs6zUieVyR3pfwphynmd635TwA5LdVu2WFBdCaUbD/F
         NyB23MDutKT8DTb1rwsr5WlPR3tL6pvMmuYuUMDfWUYKF0Q3jsaOkAPs+Axc3KFuX/Nv
         xC8grtyz37cwjmDWHjgDFCtWcgpVFsNzsuow7OAM3jdzA1PIcE1hgYmYay/THJcC2Jc6
         XDpVncsIXwkcy3onF78jes3GGAEsojlSGlM3tV+M2HBUw6LE7aV/hrJcPvJGYpLy5MLA
         pTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358657; x=1762963457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=i2BQ30GzoKjazkB/DpPz1HKr53WB14QOasl3rC6WmuFLIijF3ODVKhDRPToEq6kE3M
         big2hL/cmpjyGxKDv6pMcuclSJfDk16PXXhBd3RY4dOAQ5HQSCznrfnOjDiRu5G+MlBX
         KjIA3na2W69S+5g9hUqumZH9stkeLLGMQ3XvGGA7uQGMG+oBbIX0848EWDfbryQGVZNL
         YNy+t0qhDntwqc9epEZ41ubMoZjncX9azgAWi/EKZctIRutQEBoxGn2abduiDNS6jlnS
         EyTIP7WJhXdIK6jvvFZfB/wcPBNkF9F7GbVei73lerhw5hvBLDogx/SzjFwa5HXuzEQ8
         l8SA==
X-Forwarded-Encrypted: i=1; AJvYcCUidUQm0Qzltnq9rwXas9lNprE2VYQrEd0bulQORJLumtI2hKKIacVrN86MSSQQIafmgH5GqNZggjU=@lists.infradead.org
X-Gm-Message-State: AOJu0YybxIVJcXCUl4mZZmvWDVgKTOZMX+NiEKsikfn26BS1F4Ko2SKM
	ZeDn45rmMyFyjdbI4+Mw4HW6ICp2fcfrZ5YsV4jsJVQHHdf0ooZpscCmB0YRClVfolQ=
X-Gm-Gg: ASbGnctdMjozVfS/qInc5TtZa0EnN8ns8dPFA1EGSyskap8ozfQBg4pWxg02FamdEl9
	0VTH1EX6Fr06iaUrneAvRJbuGz/zKffS1ECiDL0FdBIUVZLF9E9p+b+qTJoRD7KL+gXEvqMQEXh
	koeiAczjkAReEj470BIYakXR/OoYgN8k5PjEDvIz/G0ZsmOkjEru5Cjkf/8DhcGx7e/M3G4UxYa
	+90+/aizP8yQrTjhJ7NXQ0pmqc3028Fv2VVz3KDqtSYzSr6A5A+Fjv4Sj2oSJMSJM0C12ZMX/JF
	nj5gUmYZx1pGWdiK5nn7FPiX/hFAgt8XMa+/8GB+g4iwt50HKWB8b/gx8YS16sVkh64n9P/Mn0X
	c6QsldpopvHsMchs/+Kjb5xJma6jqtUpg7n/mjkBwFDFByg7Sey8m8BNb+AEjapYzxTxMTm+YUl
	H2V2Oepo88axtnQnI4SvhuBZw=
X-Google-Smtp-Source: AGHT+IH+8UBl88iOFcuJ5mLvs7y03FE0ImwwlDmWIzieFw+K4sIaLEleiL54hEot6DxqVBsb24f+9A==
X-Received: by 2002:a17:906:d54f:b0:b46:57fd:8443 with SMTP id a640c23a62f3a-b726323d55cmr451555866b.24.1762358657186;
        Wed, 05 Nov 2025 08:04:17 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa0828dsm518078166b.50.2025.11.05.08.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:04:16 -0800 (PST)
Message-ID: <89fc4526-db36-4974-8a38-554315fe76ed@linaro.org>
Date: Wed, 5 Nov 2025 17:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/28] mtd: spinand: Add missing check
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-5-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-5-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080419_092463_F406BF91 
X-CRM114-Status: UNSURE (   4.80  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
