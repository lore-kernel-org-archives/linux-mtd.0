Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3ADC28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8JeyLcDRaGOVX2JuONiZrcSmIz6fpxIac5M1AXIesA=; b=E+oOwvqkRq0BAs
	fyl+5hOnP6BJWrMJqYP/4sz6iiruyUJzU1eJuN14ZgC+Lp40Fwz2hd1YDjLcY71VJshENv3nq1N/q
	HJWCseOA3gCMe0PNUeBWFH3J3bBJF96Ia56tswMHqxXwe0CTftFY3W3n4E3mBYkbsW2bS2A1abh6e
	9q33BUDy9McJ4OenR0fBbPlEhnCTkGXJGqdxF5l0kbumD2r3O+FczJQNkht37dNt4Z8oDbx3D3Ehm
	3BF+WWJiwxulZe01AXeT3oGiiBDlIuCu5N1lDleLHrs0c50tG/qpZ7CCPY6FxSpQpLdYQbNrsbAZs
	k+aDucez6Qto6e/VtysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u002h-00000006WLr-0EQT;
	Wed, 02 Apr 2025 15:30:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzvR-00000006VKy-1bzU
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:22:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so74711465e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607364; x=1744212164; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBqRC267cLlF1qxs/ldypQv5XB794Feq9Jx7xZZeR6M=;
        b=DEe3cFfGZ97oZNX4tSd396htqwcd1LbOuJPbP9XWwQonTjlen82izX4/AVRc/konui
         ea7ubWtn/BBttmBJzPVpDq4/n5uj5x0W5l3ZF3xknW2NbVBxUBMNbnTTl6h7Xo6GCDCu
         v/r8k3c/BnPwGERukmBu9CiwGEwq71KPTjOoFfMVi6L6u/sWSJuCGwrXGUHxrHSgp/HH
         PIGhAtlhMm7G4fhYGuTqiUtg45Uru2PjPyrd8FBkbUGvNZKCiTZ7lQbCOMApqv7lUVmf
         u+7e3DDThckTKUXqDVo5VfnZujr5tTsYFqebEgfzIwkFMXzJwPYd4JpB00tIbioChMit
         gyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607364; x=1744212164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBqRC267cLlF1qxs/ldypQv5XB794Feq9Jx7xZZeR6M=;
        b=Y2cbTSNgxaHHi7wmkK/EPC+gqZVMEuy+qVrq0TXudTID1ZzwL9iCKZc4bVSWOMfhbb
         oivGYePtYCrBRc74g9K2QRDm3OTpEt2ee6RZe2Axwf8eGfziCM4q/NE49z6De3IhXW2T
         mVgaRw9oqwJWXwGWrfN/rI85biabrlWJlbPa35mqNmiHXVe6SncgwvLutgkszkTSkDi6
         NRvOELnxf5rLqLAiVUfmSEnrX+A+AfUFT+droKUqsKHFuCY7le14OB4oC/wJS2SWaFd+
         ZURFWNl9cyPqCxdUw5H6bATLuWsg24UsJJXiSh2Ct113/k+Qmyo8OYmcdvLqUHNA1vdk
         aLcg==
X-Forwarded-Encrypted: i=1; AJvYcCWaILDwHmjAmuqZuuYClsK5bsIEjAKQRXVIiVBN+eOwEpfXzxFw31qTr8TMlTQZC46B4IzZ2ad52FY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3sPACuDADVB5pR9UYxePpXaYSEDtzvwK0g4q6iyoFgjyCtIlq
	/6wJp6jF211UbbFIg4JLx0nvMyNn6gmAmqXxaz4bQ7tn05OUot4qmXt1nwpR6hQ=
X-Gm-Gg: ASbGnctPNMMNho+BYCXSV5tfBz4V9hdIxC1pmSayDwsML5WjUntaTNxYowhW8RZOUm/
	SN2sS91PvUNfDyTdm/68aFLFMEHBeBUCXaQHOcgrun6gUruiriczC9aG32fDnSTjKFLsw0Ft1/Q
	enQNpOV46v760BUn4igGL0ayWW9Q+VYzBrbeA6kg0wZ57csgAJmX1ZqXIgPF0BzeBZs/EWUfSkL
	vfcDqje+zW5BM89Mb3s8b0tXNfTltaob/2nQ4TK19tXea4qS6pnr++UQWk9CKSYGoCNizQQVgfo
	otiIKW2CEJHyMh7RsmKUpkVAhiQMCgcFohCrN4VeZy2fBUvA04VE6g==
X-Google-Smtp-Source: AGHT+IHgmckXCfIJjyAgdgh7HICnvf/RXlS+ITSeKLvapKO6U8Xg3MjxSo581r6gfWjbctoGhQbwhQ==
X-Received: by 2002:a05:600c:314b:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43db6249672mr172386895e9.15.1743607363638;
        Wed, 02 Apr 2025 08:22:43 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60eb012sm24047505e9.27.2025.04.02.08.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:22:43 -0700 (PDT)
Message-ID: <94ed8cf8-1e0d-412d-9f8f-959fe4b5b505@linaro.org>
Date: Wed, 2 Apr 2025 16:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] mtd: spinand: winbond: Add support for W35N01JW in
 single mode
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-16-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-16-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_082245_433241_6D29626C 
X-CRM114-Status: GOOD (  14.32  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> Add support for the W35N series by describing the smaller (single die)
> chip. It has 1b/512B ECC support and its own OOB layout.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/winbond.c | 54 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 99b9f333eb3142999d8f73d43537f1ed9789c975..9b0369a077efadac8bd6be632f15b822d42a7227 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -23,6 +23,16 @@
>   * "X4" in the core is equivalent to "quad output" in the datasheets.
>   */
>  
> +static SPINAND_OP_VARIANTS(read_cache_octal_variants,
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));

strange to see octal variants name, but just single SPI ops defined. I
see you define octal in the next two patches. How about squashing all 3?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
