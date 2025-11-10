Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31687CCF9E3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3ZHnYWK59ifOf28orChzpzLFaDWGacaqNtyTXB+4VU=; b=j3wnxlT0dEkSy3
	LR4FbyZFAwL7VCH55QhqsWgAiQ90ZthI17AWl5uD6Lk6ZOK+cXiZttpXR5Vx8R8r9dzNQXio1ETOW
	ROiB0xdAtPkZwIZRALiR3D9n3NDtSpefxs+2to/aLNJhXfD7r+iQkCKzRcvj3HBAv9x8isXEdibDC
	z29VivET78qHMCUevx0NyM5FpJiap3a2qVqvoVpYR66Ei8xpQCK/meimBvdN4Bat0KIpZYUtH8mPn
	Fqm1aKpLAWtB/wjB8H82UYV/kYM4Xijz6peZ299MK6fOoniQPyI9GxrrzpfFsyEQ7TNLlJE4rkZcd
	845XUWx5Fub5KGaUWDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILnL-00000004rMJ-1SwL;
	Mon, 10 Nov 2025 06:54:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILnJ-00000004rLx-10TX
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 06:54:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b32a5494dso465032f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 22:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762757667; x=1763362467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U27FR47vvI/+sK8vvk3aBB/np16WyOGQoW5cBKa4vNk=;
        b=g1XEKhhKACU/zgiuHGlVp8V16Ac591Cozab+8n5mF2+hcmupMs/Em60qfVajiY4Rgx
         ZoJFC3pPDiw+th/BqoHDHK+0lV3NYQuCmCkwcHzpUzeppkiAoCXlv1R3Exk1Q9XKq1Bq
         y3nSqIO77e5+jMwbC0329NYBy6AnxmeYIrsw85/oO6zx2GDdq0KKy0a3vwW4PTBf6MKt
         FTQSIOxGPkyit6EhcyGFFIgVFMdRZV73Kij0y9/LePk2lIF5Fvtqx3bioXIDWGcrC2Eh
         0yrbXl3ZOxl1vdRcQZWpU5fRXa9Kxaycw15Em+p7UirA6Y18wygfy6OJ2XgtAX/hRNSd
         vIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757667; x=1763362467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U27FR47vvI/+sK8vvk3aBB/np16WyOGQoW5cBKa4vNk=;
        b=Mvo8UFPtKFS8ZLpLBVpvMFOiPz4T4Mpz52US9jvotGXOaBQY1VihAkWkeGKFZjbABs
         q68UyCV34YC9KDMp1Vn+hBayElb2ny4JGWTx9eemp0nW53h0oSXZI1yArJqXUU8Ui9mV
         i+kzLtzoS5HBXoYvdggehidVNfrPYZyxG37Fr0FRbElLsuGXDInQOgA/ZUPFK64NiLw5
         TdrHdg5Boz78Ii4fuHzdBaS4iwr4CoXdmB1cFzI9sG2gksET3ZeLzpRG6tvInapfZ2Np
         EXKq6e1iDBAnSYnEIoELe37F0oEuZtJCw1JZIcvP/vpuLSalIgJBR5nWYo1v2I3glYry
         Zz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAVr5LJDo34VWhxyKX4rb0PEcft43Wlh9CR7TNT6n94UssCdDbxEZzV1mh31BvH9sgqq1sRwRaTjs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCThJyQmSwUps7qJ4CKg1r4mri/aOx59Jc3VwW1huxG9VrpvUh
	bSS8ULVWFtRAmnqeGVMPBWeaSOPMCrjFZgvzw/Db3UHV4be55c5/TxEBasrrOHi3UkE=
X-Gm-Gg: ASbGncsjfiyMUOqp848ol6AQgmtkiaXO8rA5omIaOMnYSbS3PqdrWkP5fA+QsejrlxE
	78aOuTIyNpTV/JI9WxuSScz2Wxm8BKA2tD6vns6SJ65LjLyPtuPCBGmdfQca7PuedwvMIOC5ZKz
	qyjThjeLWPwrYDAO3ZEX6NL0li4eG8fe9yyiuhYhGBPgYjuojFziG4GfPYLa6dXUvkU2/CW46K4
	uBveSgCmBvh/ulb5z44lmrBMy8nfLu2ExQ/lwl99uYeWTO9c9inQMQ5OtQFC9woqpLrMCoqMo3o
	Ttk0uJrVd8EZvJ+zY949EiiZQpwra+VLaf4cKQNvbWH0fp2DkAnyHYSKegpTOqm9nz9UZ8BnKzE
	2qQ2FjKs5XZrI1MzRiSrgPUwagBU1vv4OKeOFPO+bfayaKf8U1UlaIt0aaq+amQ6C4A0hazqO1I
	5kEinfTNAh1wL55PGN
X-Google-Smtp-Source: AGHT+IG87FW8xkI+HPhFc3NsIT1cI0tR3t1R9dpEVJouEeUSbLV2nxEXO/MYUxjy/6jIyUp7TqvHtw==
X-Received: by 2002:a05:6000:2a0c:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42b3ee96373mr151631f8f.52.1762757667400;
        Sun, 09 Nov 2025 22:54:27 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm19848370f8f.35.2025.11.09.22.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:54:26 -0800 (PST)
Message-ID: <c67466c0-c133-4fac-82d5-b412693f9d30@linaro.org>
Date: Mon, 10 Nov 2025 08:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Hello,
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sean Anderson <sean.anderson@linux.dev>
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_225429_334124_CAB33B1A 
X-CRM114-Status: UNSURE (   8.07  )
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

Hi, Miquel,

On 11/5/25 7:26 PM, Miquel Raynal wrote:
> Here is a series adding support for 6 Winbond SPI NOR chips. Describing
> these chips is needed otherwise the block protection feature is not
> available. Everything else looks fine otherwise.

I'm glad to see this, you're an locking expert now :). Do you care to
extend the SPI NOR testing requirements [1] with steps on how to test the
locking? There's some testing proposed at [2], would you please check and
review it?

Thanks!
ta

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements
[2] https://lore.kernel.org/linux-mtd/92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
