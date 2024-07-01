Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177BDC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XY25rFeDvy9QLLz7ePMA6tSQ+FtvNYvF8F4Div8ca8=; b=s0FRMNaXfnM4w2
	Hc5C6HyqZeaMqudWD7L00YtBUiqTHw82FKbQ5g7HkBQtZpw6PnH0ccj0VxiSpseu9NAdY3iWhKhyq
	hcDPk6+VmIrFbnky0IWYzFFcsffajbTwlHtHxoYMYxv88H+y/LpNohS195pUR7N7WgOm0nVXvuxv4
	5f9HDWQHA0Rcq3eI+9FHXTJlHnlJJcc3uOg6O9BiywOiemkW0zzmKCoWrPJl741dLnkxNm5+MvKam
	jH4QQ3sfgISQqPxtxaOSPz0/NIyUHgbdztXMNyCc0qJvAb/oBajcZ+kC7qFGomz48fOsTPgdnK1Q1
	PFhhDVJ9m79kTx5ps9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOE4j-00000002bNJ-1X9Y;
	Mon, 01 Jul 2024 10:15:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOE4g-00000002bKs-0QnD
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 10:15:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so17874525e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719828952; x=1720433752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7ERjJOyUzEMj0FpXGqXf5xmcTSrmBtKih96OlIC8Hg=;
        b=Qwz7DoaN05wGoco9kEpRgPJzkUTeyh9tHmU7V7ICGCvCU7cYpGHRY0hlFwhZT6z9M9
         VoZiCDXOaiJT4BIfZBp73KBxovp1VpCPaNU2BY+KYhXzfviOslOtGIk8p2C0vcj2lrVA
         7R4m5JjkcWEDTMXu4EiBWnliDSNU9DEDp2OeKSi5jgppwmqqkOaiTdSiKGvrSYLmtrjH
         UmK8hkxaa2V2P7chesvKfxnan2yvhURges/qZz5NYKZQApk6KLBy39dB1fWtABk7Wx7L
         LO9okQRCADFCd8WeqCbaYYJ8akgmP96rA93VTGX5JwJvsmADCZWAlY/SXVz09F/8lndl
         XbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719828952; x=1720433752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7ERjJOyUzEMj0FpXGqXf5xmcTSrmBtKih96OlIC8Hg=;
        b=hoUnehuSZbrvH/Ap0VEj/0Dx0T85nbC5ii8tQwgWtZWQRP1Awf5Ml1+Vyh5Z0sWv7E
         FwYkLVFdw2CF9PB7yygkmQcGYot8Qj02QAgUtVjLwSHRAZtrJbl6BFU5HILpbUPUqwVB
         5KyXR9XE3COmiH3gxI8u0oBY47QkA2mEDBsPDiZt+0xoDYqvv8vVv72JkGQl1O9iSbgB
         8EPye5ro53cJyFUUs0NkVsLFkk8mf/znZzX8HLbPAnbnLKzT3GDRhKAuqL4PQRGdqBfd
         tSfNEZKP+BA4w+RFoEQ/sqB3pA0bBSHJ1/YGJcKUMBX3vKBbl70YUjMYVhAlxQ003q+7
         +9qA==
X-Forwarded-Encrypted: i=1; AJvYcCX0CZCCWhg0SBgTB/huRcBDOhG0uxFc/SZ+ElTQMeLHxCWLCd76PymLHYBS3sE51LchwZHleOrJGZ7pCWqM8nL1OOwcHMb1EDFbQxBE+g==
X-Gm-Message-State: AOJu0YyR1Ao4JKXvCQcxGSaugSsnYf9DXSJcrgC1b1LKpBsugC50slti
	v0TtEyLQDJGN8T9Ke+/gTdu6p+1Q7+KYvr90o2OcCchhvBaHcNxsVJTiPkL+6lw=
X-Google-Smtp-Source: AGHT+IFs0W4UETdvUKHjNDT0jsOLwENUOC2FNNISouAi43UfaMazl23H6AZNzwRfQJHVRLXNsxZQzw==
X-Received: by 2002:a05:600c:6c8f:b0:424:9c01:a0d3 with SMTP id 5b1f17b1804b1-4257a02f7fbmr36087385e9.12.1719828952192;
        Mon, 01 Jul 2024 03:15:52 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5b626sm144627895e9.15.2024.07.01.03.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 03:15:51 -0700 (PDT)
Message-ID: <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
Date: Mon, 1 Jul 2024 11:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Erez <erezgeva2@gmail.com>, Esben Haabendal <esben@geanix.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240629103914.161530-1-erezgeva@nwtime.org>
 <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org>
 <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_031554_208069_9729D4DC 
X-CRM114-Status: GOOD (  13.20  )
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



On 7/1/24 10:46 AM, Erez wrote:
> When using mx25l12805d, we do not read SFDP.
> As it uses the no-SFDP flags.
> When using mx25l12833f hardware with mx25l12805d driver, it did not
> try to read the SFDP.
> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> driver fetch the SFDP.
> 
> Secondly SFDP does not contain OTP information.
> 
> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> While mx25l12833f has two OTP regions of 512 KiB.
> 
> How do we handle it?

You would first try to parse SFDP and initialize the flash based on
SFDP. If there's no SFDP then you fallback to the flags declared at
flash declaration. Esben had a try recently, see [1]. I don't know if
there's any progress in that direction.

Also, you haven't mentioned anything about the testing. Do you have the
flash?

[1]
https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
