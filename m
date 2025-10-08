Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18695CAC5BB
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 05:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu5VDF62er3xdSqhCwxnvRwukT7Q6y94zu3tsnrUbUY=; b=IUI3EmrI6lMWDc
	FLtBlnPMIrpR+sm+ZhjK4UENyBJeWi9s2q2idIAYi1Pykx6pnIABHEAYb2Nu2kFeYF4jUSALtCYvj
	VN/Z0Z0ghgor95YE963ZZMy+h8wmVfYIHTtpzHW5lFSXNT15Sh62cc47y1lQtNm7POd+NtN5JrKtN
	etvBZv6nItqFOCiEu+zDazsB52mdPtYIcf7jkw/zPnoQ+odstllGFzP3eWQmI9FixQjV7B5yhVWkc
	S0SI3S3kQiH1CAEu9KZj/mBMz3nrkMmHc8L7FGg9QgXwM0Ax4OhcJGnVC9Iv863SknnwKDOzRM1a8
	wyuWMk07WN/n7DSLwNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6MMx-00000003CgJ-1uBB;
	Wed, 08 Oct 2025 05:05:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6MMu-00000003Cfe-432V
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 05:05:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e2e363118so63286735e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 07 Oct 2025 22:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759899939; x=1760504739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inzv5sFPx4qkhUDEjR3qqyNwUkiJV3PDHglkug7/Xs4=;
        b=E+g6AyiXywXThIAeqk6jWpk1z1sgpwg7nTmEQQO4JXmgGxo2QZgSm+SdUaDKpPH6RT
         LwuQ14HMvNTVjw/qssdGyAL1duztWW1+Bq2+YrGRFyZTQLKtTqMp2R8FkFrRm+69cPbY
         cqxwzAe71OSNH4/B2t48tt63r8wwEtxidp0d86CkVlfQmbA2uTcaKnQmPpx8D8Qas2iL
         jXmr16tnoz5Ee1GZF6OiCx3+JhZ2QZ6rlOXc+DyCP/FRkECf3Uj5OxC++yBGZSxsRXbT
         s7b/j/veIAoa1FFBIcmY0Y8J8Gt3Hs9sI1hr5oswbmEtIuJ/1eSXqqBL2GfwDq/IH/AN
         0Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759899939; x=1760504739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inzv5sFPx4qkhUDEjR3qqyNwUkiJV3PDHglkug7/Xs4=;
        b=WKF3HVrnx90jGxdRtAnhgTfQ+l2yK/22D2JFNGPf6wZkNKLNzqGVXcTMQIgfJuQs7I
         pjOx5RZTObhaukRuT5sDooJW/0eVcnXZLxSRTUxmkrXKpGuXUR2K9+r3x79kMKXhDPg6
         fh4kPPHroOC11fwCs2UzNYXN0Mvs1ClQs7ynkPSvg/FTI4urcOcCeOH7k6mMVu1VqMx1
         ABkIlIxeufVyfL5zdrtjIUZcpHV3dtlFCJm+jIxwphbzNLbqbjtqXtVFN4y5AJzEaEhL
         YrLdUxNHI9MiscT/6Z8vwF/IHs9uD9iAaATiMbQ/B1shUTZplMyq70Y1oBL8Rm+wSQfZ
         92ww==
X-Forwarded-Encrypted: i=1; AJvYcCXp5nAyTS6Y6d28SAiSIg3Bh03MoMR3YvS2VPNUIhaSOyOhwSSeqoPumMGFKxpopYQvH6fC8JqUQBA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcJA58F2XwqOL7oym7HCDNK/tYz7QGcGedCy2kFuNbVc5I06TG
	Psj2igRuwh6f5ypaXVQvGZAONfSbTuh9HxNNuopCZNtgi/0zeTnM/lZNhNqT664FCFfdEDJi+FU
	jY7PF
X-Gm-Gg: ASbGncvFRfIMtGCJSkBv12Ojdoc1BJuvkEgjNmXqQADK0o/WqB1iOnkFSWo5rQe6apb
	bavcS32IF1Vx151N3YXwSghvbLcYRmdH2THLHflYvpMUUhSsMgM5DXV2w1WtlTqK5z5YbUJzSuZ
	IbcbreuYokvDKdOUN2wInXRlCucvN9N+cm5ILOfxTeMsX+mSKmZ/jD1ii33BNt1VdGlp6yvSZj5
	8qjQZJIYXfP15qcJeXgQl/zcaLk3T+DnKpXPnc/fe0ue7XR6PK+mw2d5fD8xHgsOLYshDRqvJ6g
	C+pi09A5Ak99gWwy8TY+3/UV/uxkn+i0OA1WGsN2qTra6Ti8R4ibghSjdM4Tu25yqXbonyNNvlf
	vVEcRynBx45/wyXpRPSaYzoBMe68MLCjoGLbgow6ikyYZD4BDLc0YYXVFeov3YutLR9OnCw==
X-Google-Smtp-Source: AGHT+IHiSpn4VVEghpm065DzIFzSuj/unRTmAyxIjTxV2LhIsGjiK7RpMl+LWZaxdsVgGVaIv1RgzA==
X-Received: by 2002:a05:600c:1552:b0:46e:1c16:7f42 with SMTP id 5b1f17b1804b1-46fa9a9659emr12934235e9.11.1759899938601;
        Tue, 07 Oct 2025 22:05:38 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm6013475e9.1.2025.10.07.22.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 22:05:38 -0700 (PDT)
Message-ID: <27d13306-79a7-40ae-af88-069d1f71f016@linaro.org>
Date: Wed, 8 Oct 2025 06:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Sean Anderson <sean.anderson@linux.dev>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <21760ebf-99f8-4ea3-8841-e023e00ae574@linux.dev>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <21760ebf-99f8-4ea3-8841-e023e00ae574@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_220541_055190_EA854F0C 
X-CRM114-Status: GOOD (  19.53  )
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

Hi, Sean,

On 10/6/25 11:38 PM, Sean Anderson wrote:
> On 10/6/25 18:34, Sean Anderson wrote:
>> The datasheet for n25q00a shows that the status register has the same
>> layout as for n25q00, so use the same flags to enable locking support.
>> These flags should have been added back in commit 150ccc181588 ("mtd:

Were the flags removed upstream and then not added back?

>> spi-nor: Enable locking for n25q128a11"), but they were removed by the
> 
> Sorry, this should be commit f80ff13135cb ("mtd: spi-nor: micron-st: Enable locking for n25q00")
> 
> https://lore.kernel.org/all/20200421063313.32655-1-js07.lee@samsung.com/

The rule is still true today: I don't queue patches that are not 
functionally tested, even if they are based on datasheet info.

> 
>> maintainer...

Don't point fingers please. If you feel the context is worth
mentioning, specify it in an impersonal way and add a link to the
discussion in the commit message.

>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> Tested with a mt25qu01gbbb, which shares the same flash ID.

Would you please let us know how you tested the support?

If you feel generous and want to give back to the community, you can also
describe your testing steps in the documentation from:
https://docs.kernel.org/driver-api/mtd/spi-nor.html

Also, if there's going to be a v2, please dump the SPI NOR sysfs and
debugfs data, see how in the link from above. We're keeping a database
and it will help us differentiate flashes that have the same flash ID
but different functionalities.

Cheers,
ta

>>
>>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index 187239ccd549..17c7d6322508 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -486,6 +486,8 @@ static const struct flash_info st_nor_parts[] = {
>>  		.id = SNOR_ID(0x20, 0xbb, 0x21),
>>  		.name = "n25q00a",
>>  		.size = SZ_128M,
>> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
>> +			 SPI_NOR_BP3_SR_BIT6,
>>  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
>>  		.mfr_flags = USE_FSR,
>>  		.fixups = &n25q00_fixups,
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
