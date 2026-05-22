Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0485BCD5BB1
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZlHM6AiPCfmtYMDm6yWk04C9+YSqhETtP0BxHribDs=; b=O2eDHCqrwkG3p0
	gLJJcDgeielGnsTSBbbunr3UNIZSHY54K2BF7/MRCsMTnlTz6vgwmx8CovWUHW1xfyhM9nE/ZlGKc
	Iy7QLh0Xt1uoJQ/jqMKJB7nOI+93Lo5CUZQ7mkHJSpXT+CLqMNyXyqRFV1tuCMS1WeFii7QdJEyuF
	15TyovvgOpXGi9R/d94EQ0abJRmETofQhwMny7RVJDgBZF81gu2GMed5sdOtUCVeRbizpIKxfzLDX
	39TlnpKDc0jdTwW2FgpVzHHzaydco82hWRO+qsglWSuT7UpnXaQfQIaz6aRLEAUGVUvIvjld6Cynh
	xg0BPVJ3bjqC3fiWytHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMcp-0000000AOFb-0JVU;
	Fri, 22 May 2026 09:57:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMcm-0000000AOET-10vz
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:57:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490426d72f7so5775855e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779443818; x=1780048618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3SzrBOlCrckP+aA4rKT29EYfixN0BXUD7FV7+QYzVI=;
        b=BvW95nK5/ZtQq5AB/gVQ18vvKocU5eIGCzNxcL0UteZJAKGNZaNMtLBGgQX6vxlXE8
         xOZJWOm893Tx5cPg70Xeh7tC4u3eUPxHrB7zuE3DP9ksVSGsgn9oFZBrldejJ67Oz0Bv
         plzo6lR4v081MKdcSUIZQOwRmvbpRznrrt+I4NrClvHWea03oN9qMDCzW+fIr3Lnugqi
         hKs3XoXN04MDSykCdWSmqqrWBogQFpOubthi2QwZ+wNras1Hez0erhI0cc+dNe8s46T2
         LVq1378kTpnaiutt1Ljx8JO7JPclEb1Zb16jp1uNrWIighWPnmzON8Ha0b71MMF0bXIs
         D55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443818; x=1780048618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3SzrBOlCrckP+aA4rKT29EYfixN0BXUD7FV7+QYzVI=;
        b=gEgNgbt0c5b5+Kd1QKsihEsXlUw4NatYdhMt4e2QSIFJdD234JEoDPUnxAESrdwH1p
         IK3JSyX+f1BZ+RR9NQd9zdI+TGCeNlmS8pH/Q9J5j8iFUixDA3VxjUQgpdnB9JHLCvTV
         g53USa5XLQPa7t3yaWBLPGb7RZDL2s0zZuO4ubrT9LGkn45XghjN16xmtYrKeHvECs1B
         i8LtimH0yYuwCbuNvqCoS8EWiEzS89E9uzyJmCGbaNfNyEO9JcVgHNEYEFC5mXpkoG2E
         m6RZQfaKrDkNcsTxsX25yUWqPFK70HjGN0fN79Jsj8P+78cyDfzv55fHHc9laiadRIZL
         MOug==
X-Forwarded-Encrypted: i=1; AFNElJ/lz4q/Tbkkmcs1Z+unbErUG5N75C6PL6kCIXC3bSbSfP1oeny91kiuYdnZZvd5b6giKEsrOYsVrHo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0RVw0f/8Zh7kQMv0r99IulQiZzTUJd8t/hCyFbcOyqOId/b81
	jxx7YRVBvYKlgCt0fqv8+ot+V6NRjEzZFp/Ko0bqX0ImQpQCK1B4291l1JH9z8S3bmecpNVB7dL
	cGJ3d
X-Gm-Gg: Acq92OFV4BdHG3gCEmCg68e3zjBUygujVFOLKJda4nprgcUteE5OE2ZfJQ4K7nx00Xo
	qCmftdQtVtjyJbNXVR7G7mVtpAFGTDp4+rkqy5+ibK4VAZOYIamslPlDemj3R0boS/GWX10xdfk
	zGUnBAfY/cpdwAoOVxh010IXzjs/W17NhspbxFlSM9NGTVSB5dkVPisXNf1Z4MUSXxRPeY+gUW9
	VPm+2D4/vyvVS2OOSkH4ZWayxGW0+jkGfL7u67qG7osZLeOr2d+tLH1rTrKh3dGj1GTydBl63Mb
	VoaxfZ9mW1bLE1h9W9217oJdaqoDSXM/4AT8ARxDO+oG4AEBw13iVVHBlhTYrQZZsgSuCMeatXA
	uc2Vg5EEdL21bcyXA1kqNgPgKxsv9TZiNdqTtF4AGC1rjvCQ221tGsDooQLqBZzG7PKzfNPx31g
	GJrM9FRsN4PEDVOHAGgu7mZwhpwLZfxMh/ct3gRQ7ukw==
X-Received: by 2002:a05:600d:8444:20b0:490:3b8b:6ba2 with SMTP id 5b1f17b1804b1-4904249af9amr27400615e9.8.1779443818210;
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm29624265e9.4.2026.05.22.02.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:56:57 -0700 (PDT)
Message-ID: <0640ef90-52f4-443b-90c9-ac4acb48d59f@linaro.org>
Date: Fri, 22 May 2026 12:56:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/28] mtd: spi-nor: swp: Create helpers for building
 the SR register
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-14-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-14-93453e1a9597@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025700_313086_799F8412 
X-CRM114-Status: GOOD (  16.77  )
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



On 5/7/26 7:46 PM, Miquel Raynal wrote:
> The status register contains 3 or 4 BP (Block Protect) bits, 0 or 1
> TB (Top/Bottom) bit, soon 0 or 1 CMP (Complement) bit. The last BP bit
> and the TB bit locations change between vendors. The whole logic of
> buildling the content of the status register based on some input
> conditions is used two times and soon will be used 4 times.
> 
> Create dedicated helpers for these steps.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 83 +++++++++++++++++++++++++++++------------------
>  1 file changed, 51 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 540cd221c455..8aa0fe297188 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -125,6 +125,43 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
>  	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
>  }
>  
> +static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
> +{
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 val = pow << SR_BP_SHIFT;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> +		val = (val & ~SR_BP3) | SR_BP3_BIT6;
> +
> +	if (val & ~mask)
> +		return -EINVAL;
> +
> +	sr[0] = val;

As sashiko already noticed, I think too this should have been sr[0] |= val

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
