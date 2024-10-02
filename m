Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95563CF3199
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BHXnTY9ldqy8MHF916fOgTtfmkBe2iEPoHT9j30N38=; b=Q96JFsJC1fVy+N
	HBhxhA81JnIa0BQ2Sx1AzpRV+9jDt2FCvxufSHF/HZWoUjcqhrRiLZGm2J+gYs5kEVyYX24/yS05T
	2uCUHQRj2sJHv14a0yed8+E5I7lnjuB39hzzdUZEjXgrRR0u8HmMgJ7yCPlcYH+026MNZw+VX3ugC
	jXZdiyBaWF7JrsXKXojo2PKcAL/b7ttE4E0PXo+9YWr4rG9dgUGrI4JXIgX82Ye+g+2DEZoyYFxB/
	vT/3AUA4VX3/KLaYLVbU8lCaAY6SI6TNfdirafJV1me4942iLWy6PqhG9ZbV6V0rTEp1w+jvItvs/
	PG0dA8Lx4bomPk3OfjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svtmf-000000051pC-21aG;
	Wed, 02 Oct 2024 07:28:29 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svtmc-000000051ns-2UAD
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 07:28:28 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso6139782a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727854105; x=1728458905; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hl8FCKc64Ssu2GNc1972+PuKRGXuRwQabL9GP2xv2w=;
        b=x2E0Ba1cT7/Lg3PPP3dOzWkpRN9j86NNEpVBYGrDRYSa/6wkH7Mt9lDZuU6P9oprY1
         +nAJEBoWGg5P5M9NqVAxyTndX7I3GxWJ8ccpLqbSe7kW80qvZSfvLD/u+n+c8WygfEG1
         JKUrKU6PPYWocLbb4cJJDi627OoiPNxz1mJ/YytVOyVfHSKaNwnMVCXpzBUSAuKVC8xC
         B+SV3mVTyI0PSYR82Nd8Liyl1VXXA804Sb/hvAfzrUX7c7kh5OLp6T8DK5wY6bQx+hUJ
         BB+o5mCjrH0Kr5LzNJZD62m4vEgdu2+OsaF6sSpxEIBpTFeYZ8IwuBKmooSlhdXXx4yZ
         TkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727854105; x=1728458905;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hl8FCKc64Ssu2GNc1972+PuKRGXuRwQabL9GP2xv2w=;
        b=P+vGcDjk34a9ha5EPpk2Mlkyq3GJ9RYYawQxHZjITBvpiLIL3FBpHJY3u8H5V5U2Vb
         g4eo51tazQ+52fMC9OsXaASn0KJNHyNnTF+p2TkBwN9Fsj724J3n0EE+E1ylq0QoPDjE
         LKGjlSC7SmeeDSHQXo8rr81SsrOv1wQnhvYopRm2+ftlO2+6z/aerKTagimId7paa0ZC
         kdz4i8uRWvj/3DA0gLKn7e/eIBnGBemNJAc//53TXKH9cg3SXPmhPKVO3Jt5HGCzZt21
         NmITuu5RGe7I/J1rI0PwwNECwZn/O0h27wvys83o5Wa6ycXR+4GHDHOthqQm5UwifBeG
         k3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/eXCEvCz8QYmiQTYsQLZQNYxDDJ/zu2cWZ2AW7cZ6en6aqpD+MefzGjnOemRCMCPTFJZYGMQX3U=@lists.infradead.org
X-Gm-Message-State: AOJu0YywlE/GdNDEc+h+5BjUqLel8SGELIuw2tzJPTVVFlHImooT8had
	HgRUcT1PqcAw/rzg294lMe5u2F3IR0S2rlgavUu8py7CzJPzsZbG08cfROFm6RY=
X-Google-Smtp-Source: AGHT+IHcfQc9l8CIqhgpaESQ2s1HdIuuIEefyoKHY8MCEZ4FaqpllkEYkfaFFBTq9cnf7X9RZ20zIA==
X-Received: by 2002:a05:6402:2114:b0:5c5:cdf0:177b with SMTP id 4fb4d7f45d1cf-5c8b1a3c3e8mr1401881a12.21.1727854104762;
        Wed, 02 Oct 2024 00:28:24 -0700 (PDT)
Received: from [10.11.12.174] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88240a325sm7234101a12.33.2024.10.02.00.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 00:28:24 -0700 (PDT)
Message-ID: <5ef0b8bc-9728-45d1-9566-3f780fb70ee2@linaro.org>
Date: Wed, 2 Oct 2024 10:28:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order
 from BFPT
To: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org
Cc: chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-5-alvinzhou.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20240926141956.2386374-5-alvinzhou.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_002826_674348_E6C6FE8E 
X-CRM114-Status: UNSURE (   5.52  )
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



On 26.09.2024 17:19, AlvinZhou wrote:
> +#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31)	/* Byte sawp of 16-bit in 8D-8D-8D mode */
typo: sawp. I'll replace the comment with
/* Byte order swapped in 8D-8D-8D mode */

No need to resend.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
