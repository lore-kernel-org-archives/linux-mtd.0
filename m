Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9526ECCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgGhSX6+w04qlOFAXPIpKcA8L+P5dDVNizB9DlK7k7Q=; b=QG0dmYtjL4H4EX
	DKlPA41dOorHrMDjI9wQP3kO+x9Iym/0u+WiB90G5xWYbN2p9mPdjv6Q+KdFhQvzbUMmM2b0Qb5pN
	pz2QVAMIN4S6bagOpMDu1HM7SocRq2X3sm5YW3JKURsk6nPvky4mc/DLXUbxAmwomlHh8L/LDDTVN
	iUBYQHnTGIHQGKqErT1CT1vRhANYdDT0+gIRuCzP1YofCBYVnwBVdCA9nPlLRjzBEcwsCDxqe/KMk
	SK04z0bhI8P1EoCNNMzU72JkVpMvTAao/Y1gnD2FBqqJewoDPy47qbBcniD9YOtsmrj7u18Dqp+aH
	H7gOf0oYIAiCcDXMzaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg0c-0000000E1QL-1ZSp;
	Wed, 05 Nov 2025 16:05:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg0a-0000000E1PZ-2J6C
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:05:17 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso11521635a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762358714; x=1762963514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=mBXGELq2Hg8qlgnaAGJ9NWA1y4zo0RjZcnmutyeCM07lxw2FMDQRWjdLRuoi3lmNJv
         UluiTmLMHm6V05z6l/L3xsYmTtsTeVUDRooBmak/eUBcZHwUhxDpFwsmOfmEHN369q5L
         hgBacJmApvac5dVHN9xiAXJd9zZfEmm0LQa5of4Md6zbppdzYtVUV9mPQspd/oWPCM0C
         mSsgTwM+ZwEkuXBrdOYPcJIX4vm21DjG+0RmulrvvCMOEG8jiWo+rNPLTu0nwdB6IXdQ
         IQ2/sTcGCaPGV28dqL1n8Md93UYHokO9begWADeQ7biDHcy9Ds58o+pUmAQt5C5zBGxC
         PcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358714; x=1762963514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=aCUPJYlC7nfqM3t5GH2iLjRaRAeIfuFO1GGgIVPrfUAzWcxgUTjjusSiRvlxKY5zUt
         vt9uz8AA2SRjkkVxaj5RyLE5vgGreloi2dJNMOfjKXheSlng6KIAss43IfBYJlvLlof6
         kyu3lVdKZfBsYZloMWdLs/A13hW0baxWjfKnb0xkkrfMabjvOjcrno9zsQO8ZkHVdmwe
         XKFiS73sbPTviWTOXxVBepwHDq0jwwsM6MBQSFSTpppqbty/d5tmOM9qxUBgOsYa3DkU
         cqZR6OTM2PzWHxIXRfDwo+KnCm5cipzwdZ6OMQeU186d8iGFNUiyAFOuVKV8SV6Mw33T
         oJQw==
X-Forwarded-Encrypted: i=1; AJvYcCWV6ncZBiG3NVyww119VLJ3IbVWULg6TNeMphQRqyo+P2sIhvxQO0pZ1PZurdHbPLbPf/Z738bs5WA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeIBypVPPNJb7wNpcxC9QoWxy5u8rPA3zCMoDRz4I8pSB9ptm8
	GAWFoclUajt35bJDh3eayBNP7jvHfvqdbZFFDSkA2Pi4PkSLZWXvVSfHRPymLTz9x90=
X-Gm-Gg: ASbGncsgQZFnv0W580SFzXB5Av93X4klRUdGS7p2yYXUGud0TxUlI/SIyo+6H0wpIfj
	nrOWilOJTxT/QXxUP98Kn3kcVYKeJNRFHV1/w5a6Hf9ZX3Z/e0xwzU3urGxdm+so2YU3pZjFQii
	AeDtMV4enpps9EinoJwpmsyoKaHrLeaq/AZ2Uy7tBoNJqmU3JBsYdQK8w2x4jimGYseqta63vQD
	t2cUdq1TOZAy54x8ETBEdjgal/gMrLBHYGLHdBH3VNkz88FDKt4KnTDPV9WOQ5f/SFP+oL7xx+Q
	ND0U/6BOYMKvMSXAserOP5eq0XVUuIOhDqXEzO0swZXMBxOVL8KCXqEVpj660L++8zSN3V0Iw6n
	lipk1+a56XF1yFNvyNZSFfy1P/Xd+x0u5JEKJzMDTmOgXzYgj5OwCyk7o2pK+1yRw9yeB4ZfFAF
	WUt0LqzLhTLZpDank/PE98dzM=
X-Google-Smtp-Source: AGHT+IEZ4jSMqgU1j3ShuBTWV7Zpy421hTwNR5u92fURxhF1PiKkkzbDZyzXF4ZYvCapBIQeuCyJsA==
X-Received: by 2002:a05:6402:3247:10b0:63c:4da1:9a10 with SMTP id 4fb4d7f45d1cf-64105b9d03cmr2682548a12.31.1762358714583;
        Wed, 05 Nov 2025 08:05:14 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e680578esm4903569a12.10.2025.11.05.08.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:05:14 -0800 (PST)
Message-ID: <fbe28f12-b462-4620-80ef-b6ba5ff3e0a3@linaro.org>
Date: Wed, 5 Nov 2025 17:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/28] mtd: spinand: Remove stale definitions
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-6-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-6-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080516_591304_474E1F81 
X-CRM114-Status: UNSURE (   4.79  )
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
