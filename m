Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E780EC74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLGmlZAPyc3EhKlxOtUoZxl+573XM/zCR6U15TyX1dg=; b=La8xkdy1r4KMo6
	eLG0UqTVldKim8xugwLRXFpJXavwayPT3d90x4+aGzW+1EW997J7cmGCsG7FeFMwhy835K14XF9li
	NZW+FXrLwHJGTubvXldgxZw00VhPlAae00FLhllg+qdfHG0HR0chAeCkghJG7S/4+q9YcrnaZHdVF
	rrkZzXNjZxIT0PeQoAgpqY35GUxI8DRNsr+KYGFbBFIbpKXneHj4eRyWSQsCeWa9ZdM1uo5fu5Zw8
	DALOdLZyvu0PUN8VJwFm5qx00gCe1f3lqoccFZVjC+QGDoRMy7EIInAzvIKldHqgy36qvhAuHVpc+
	092UB/IlJuWObZ3wda3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phZbA-001J0I-2q;
	Wed, 29 Mar 2023 17:28:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phZb8-001Iza-1z
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 17:28:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id e18so16548370wra.9
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680110910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZCNxr+oj4cFsqW1MLQR23HStFyvDDXQrrpexBrJfQA=;
        b=vlogCfIt59EF3vLeHX5VIm0sLO1Z11g5kuWxjI6vgJBQJPXhBrFnTXxxLzCqj3CPsI
         mjdMYojOh6lJZGN+tsAPuif6kzwUCSJNvjJjYcDNSEsfPsYBVUHtjZGYJfyPqXxqoJty
         UvI1vbLP1KZqiCPD9mEmtx9NFGzuEukDdVZtbMC1rfyenzGdyhdtJdxi44+0LujyFHvb
         0BnL0rf/6KVBUY6MgDXx5qQgBBV9TsNVI4k0NKmgpuMvAZAuCVWkpC97sVIhIhPWa9J5
         ykGC3t84AikAZRGT22dhJE1p/83FbREZVV02EQXxXmz8S1FXjOG6PK18jOqyqdL9q5oI
         64GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680110910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZCNxr+oj4cFsqW1MLQR23HStFyvDDXQrrpexBrJfQA=;
        b=lHA6egXJD3nTZrSSNtqASqwV+JIevlWrIQ66Mz57g9u0ekegWCau6LQTFgXL9fJ0rU
         iJDkl68X+ahszTKnWEBtXtUv3ZfFlNa2BTYpW1zovAyIS7pYa1JCxzhOZun5t0KIgUHD
         vctz3ZiiC44IeWPHqmc3JWG6j5g916zeGopQw6H/UhGisa6vB4tMPu2ic0OQ/tx1q8Xl
         /ERzkzamnXPWyiFwb0MKDbpH3GiTt2hYKEBXF0gFLidJAmlXjd4mbgtC+hJXJuiKXyw0
         njPkNbWT32q3wFSEWUoDllLsL3CHBxCYD0oFQUyE8hbqG021Vu3RnbnFVLAUmk5eon8K
         ILBA==
X-Gm-Message-State: AAQBX9cCBLalhP7crVjkhaNsN8jttEUYtcsORfZkKDzSNBOCSu2ggoi2
	7bZXl26guYwSJtoViYp/xQZKkw==
X-Google-Smtp-Source: AKy350ZGeUJMVibVvn0q1wY24TPjN8cv1M4NvOz7Wgb304/gu1m4+JBV7UoNb0UbLTMsjpegdAlJ2g==
X-Received: by 2002:adf:f3c9:0:b0:2ce:9da7:6d42 with SMTP id g9-20020adff3c9000000b002ce9da76d42mr15295791wrp.38.1680110910682;
        Wed, 29 Mar 2023 10:28:30 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6d50000000b002cff0e213ddsm30645860wri.14.2023.03.29.10.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 10:28:30 -0700 (PDT)
Message-ID: <03f2edb2-e747-6952-ac01-d642dfae4fcf@linaro.org>
Date: Wed, 29 Mar 2023 18:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 11/11] mtd: spi-nor: spansion: Determine current
 address mode
Content-Language: en-US
To: michael@walle.cc, pratyush@kernel.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, Takahiro.Kuwano@infineon.com,
 bacem.daassi@infineon.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
 <20230322064033.2370483-12-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230322064033.2370483-12-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_102834_680291_510AEAAF 
X-CRM114-Status: UNSURE (   7.85  )
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



On 3/22/23 06:40, Tudor Ambarus wrote:
> +static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
> +{
> +	u8 addr_mode;
> +	struct spi_mem_op op;
> +	int ret;
> +

reverse xmas tree in next patch set

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
