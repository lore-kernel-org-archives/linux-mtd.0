Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FF8C83F27
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tx5Rtwt2lQikTNZwLFHaux9qy3NjLxfydbMxZmSHsYY=; b=CWZiPec/B3hknm
	an2wiFTSXg6LRghZDdRIvVT9lPj7QkWikqVlz8J8LweKDEnhiazau+WIS+p1ftECBGyOCEl2WqQkv
	02b/4QXUBTpUV9R6sq8uWIkRH7zuf5ruOtSsOuNki3K9oTYsZmosAIVCWFr8TKfP4xpZfuTAXe2Y1
	IxRY4cBtH0UvSoSHggOiL0w0CnC0RIvTNj2Q//jt/sPlyo7ryntPojyWqZ7yByi92OBF9EQMJ89yV
	pAFmEqLf2xgoFiXm8s0WCg6R/ipnEzVgfXn6YQ6WvKvXnH9pErngVGbzUreDYWjyWdLsQ71rRqeqB
	naQqZGWrdbVF7SQfF7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8SS-00000001qQJ-3tcA;
	Tue, 22 Jul 2025 08:34:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8JD-00000001pFX-0qBG
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 08:25:12 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so943819166b.1
        for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2025 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753172709; x=1753777509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFwXl4R4U+v4tdLgyEw7EAG9uIf+XrmB60PG3fDfino=;
        b=TCerK3Xh0tll16mZ5Fm4ktkUqDgeuPmjUjadLH64Ztwp1FQyYVWMjgJgxNONn460uE
         0+3MWfBcv0z/+UhvdmwClXaRG4nY8Zu94V1IFdIcnkF3oB1E5+fKuDn6zldIB5y1BlkQ
         Cqu+bPGExw2LTsSgy6Q+Ah9M3zfmmn+xjfbtTYNBn6OduzFGbbiKCWGzg/ctYwLyKSzi
         gpdYIRwJm0LWBi1xqfYxituiGQTxAseppI3aWLfCLnL41mxEfeCQp9DyoDFCuDSscP12
         I0wZsKgBzRTZUxnUbCmVr0v61GXGqYzO9b05PEB8Dc6A4EVuZO4a2P6MRVrlmImgoVEL
         FxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172709; x=1753777509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFwXl4R4U+v4tdLgyEw7EAG9uIf+XrmB60PG3fDfino=;
        b=qqr92+S0w3P6gi9Vo5c0UplcjoaTubGw7hZzn0XtcHoavcUob9h2cCijV48isnRUGQ
         1GubhgEEmgeq0OAU3cs75G8kp4lPYFXMgMBAXNazpm9JhBJkOYyXt4tzI3X6QpdSDHtr
         MU7Qs1w6w1SMNOnQOqtdD1+zvTKWy2VzN2H5T8bmjHrEPH+xUfvDtaSimkW5TQaDHZrn
         5wwsoheYaNZc72k1dzKvLG7VTtpX9beSxihAeHI5Ps+VPHQn5c5tQzRiLhD6mDrupgsF
         CBYO3a1dSptCkftsLE5KSCBbmxJPUAvdCdOyijhpkyLFuQe8ULttei8UkOmpY7+9uAPc
         aBiw==
X-Forwarded-Encrypted: i=1; AJvYcCUu+9NaI8VkQQ5CW7UGiqXslQLyJDdqFrYdP1qpvTWj56tIJ1bl5KQiI+wFirdAkNDU+YrQLkAILF0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/pa61A4legD4E6lyJJM0GyVdB8NyoaP9qWSoZ7HN30T2bKzD+
	QqRWxNNJ9e9k12RK8AKMziR5SK3CXzVo0kMHHx7WJKWeep3QBIjRekKP45dhSxZYzGo=
X-Gm-Gg: ASbGncuAGFHvI0TKjij7JXE6rHnhjlH5XKnZ37AQ8RpcKoeVD83NNL+Z5aBiOz2J9k9
	Qe875eI2aYBmC+Y+yX2WdEIv/K3w84WUXIIi9eB2mfM0xFq1K6djbHPqb9QZ6g5jjdlqauVGDE+
	3+kajoxEx/aYYpDcnL3eDxAshdOQiaM81hk0srU0FrGciHU8uOhABQjo6MsZOVs+Wxk4WhYEl4R
	RAGsqqmTsmECvHZWr6/SBWpcvjflkBRZ9qUU4xpFff3HUOVXrjZkq2KxJBlFS9pzlkFAEF/Q4kC
	ZGPylQJdyHEa16UflIUq6Pi/PhWdiioNowPyZnIi5qO+CT2JfetPyEslCzGWHOfPGn4FVVeqtTv
	TeUIIHODPugKEZM723DU3+rWk68oJTCQ=
X-Google-Smtp-Source: AGHT+IHUgNamYSRn7L3IbwI7Bkin+XzznJuVtBjJoxsI+pciH450o4XSVYaP75Gf+gs7xT7SLYI4fw==
X-Received: by 2002:a17:907:bd90:b0:ad8:a04e:dbd9 with SMTP id a640c23a62f3a-ae9c9b14a3bmr2479352866b.31.1753172709516;
        Tue, 22 Jul 2025 01:25:09 -0700 (PDT)
Received: from [172.20.10.10] ([46.97.171.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79cce7sm826035766b.24.2025.07.22.01.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 01:25:09 -0700 (PDT)
Message-ID: <2de4ebd5-fade-49de-9c16-69ca0273bf7e@linaro.org>
Date: Tue, 22 Jul 2025 09:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-mtd@lists.infradead.org
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_012511_250376_07497B29 
X-CRM114-Status: UNSURE (   7.70  )
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



On 7/21/25 9:22 PM, Marek Vasut wrote:
> Add IDs for Winbond W77Q51NW, 512M-bit Secure Serial Flash Memory
> with Post-Quantum Cryptography, Dual/Quad SPI, QPI and DTR . The
> flash part is similar to W25Q512NWM .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
