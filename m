Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0C1FD8746
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Lwy6fPVkxpewu2B/gK40WiWulfWSyGcePdWglTZoME=; b=iYcphtNWdAayCF
	xvaMgtBXj2/VIHiaiwg6GeMBZ9K7/y5LO+NDshgQ6S4kcRGCbwi+0+5UtWDBXj+dPzng0W9f+TXqv
	nm8aY4Pzb1gTlTIpPo0VdonZNV0tPlv34S86P+cywdGy9VLCiE8mryatZaAu6PITBWXD3PUcPAmlV
	I7OJ2fCtrZNTezrldDqX87T0oAyDCV0lFHeJE8EwG/ST92BUvk0/LKh+g05ekigxqmVAA+zhRQtMG
	R2Q0jbK63l9Wcnbo3gH+CHEnDAHd/l7krsgQdr+2ERGHzw1M5TKu2QMI5qJ49+UI21kxcsWDSkFRP
	0pWJ/XUkHSd9PVw7FTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sly-00000006ADZ-0Y90;
	Tue, 17 Mar 2026 11:39:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Slw-00000006AD6-0HXC
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 11:39:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486b96760easo4434705e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773747578; x=1774352378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GNNxITjMsXCkHDsR/ocqLH+MMPnrY9ZnPMzpBK58iE=;
        b=FmzDy/I4kkktkumGxd5HS2NuRFltSMgoIOduhEkpRYdqklun4WkYuAIa4mxZQzTgPQ
         uzPbp4vkQTDCnf5zsnnVx6P1Bkehx/v8kAz5rhVxhz7npVrfQjFHa0lqP/37SO24KWjB
         /JdZGezJNqCDoCAMX0AfPBKJWwC/JM2PRbZFZD1MggfwiOPJSnibcG9co+AEFmV/Im2M
         oVKMzKM1ukuPg07IW7Q8SWfOU3IokIAm8MLGWP31z8rFEJb6IgVqYdGPhSAXysVXqYtK
         G1GGOtxj9akbhKAcA65B8/5hYn/F3sZbUyjHHC71Nwtxi1Gnx/oVAtaigjm7UMNwV45p
         6z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773747578; x=1774352378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GNNxITjMsXCkHDsR/ocqLH+MMPnrY9ZnPMzpBK58iE=;
        b=HeJAFkRqaoYC0QQXTRVDqMpVom9XMNN7as1SXUnyuxBUdySKSWhgXwSCxhJKAnZz5z
         gz/J0sCYc27zoV7GuXGtzbhL72oFw6sEe9A19WzVANV/qJOiXW7vrytpr493f/hSDUyg
         dFzUldG+YPuBShTT9IjIvwZUKJbsqFfIGaJGnBZNbqAARcoU8MkUO44jgzHjU/J7YZLc
         U/Sldckfpxe2L6oxetBHrkzZlnmYnI6tq2BqLdcEkEONCe42QIQ7mje3kIPhjYD63OPO
         h5qrEQ4vF5qnpjUocO2LyJjz6v4f0ooQAIv5nyGwINCG49P0WRN4mvUImPRFmwk+3GNd
         e8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Wh+h/JzsaF05eejdKZEyFPJXFb6ADCi42xr8iaPHgc6ZGpmgrayPu77CcgIBphO0UunR4yeLndw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6FeVahL/AqL91iogL2H7rev+ZpSKiG+vMmJ6wC/rDGJOlnM/S
	Wq+02/VV4F5xn/MJwTqsuh5BEXavsJ5konkDy++87KmFqak2z1OHSl/7ki5aRFKMZIg=
X-Gm-Gg: ATEYQzyChfoHiougJixBsFlCeMeFIblLtnSAfL3NeuKi1JaruFizXkBsqt06OcPMw80
	VoebYT9YqHDb1k3otS8djm3rfXc5rP+y9oqaxn8kOGL+PiWUmAi0+kVb6BPTCd87n6jT6/mixRB
	L3FcwaUxo09Us0zYrKaKSCVOp8p0nQdMzubIak/pxmkwIgzA6IOQzv0ucnBqWWDR5NIpbNVHJWi
	AR7aMDsn7LIs1CIHdgZT+2I1LoZvUiVQH6iJM5Fxkb3pnqoUG+xpbzr5iETQSgIvky8AZDUqKNf
	3ER/PifiNUPwIH31+gmNEbYsdyWbDepCaQ2R82AVolzLfKO/TNkzuz0PIt7K/TRqhDSzvfbQAwz
	TV2eNC6KCFVVPr3Jhrpt8U+qX4uPpJjS72Jc2ZJpdd+iwIMk7ikPLPuPCQ3L7mqDr6Qij07S4WI
	XJje3+9nQv1BpO1OSj/sE2dks1wUZI9A4JAcbG5+5pqg==
X-Received: by 2002:a05:600c:1f8b:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-485566d2fa1mr299969715e9.2.1773747577798;
        Tue, 17 Mar 2026 04:39:37 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563953dbsm218073445e9.0.2026.03.17.04.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 04:39:37 -0700 (PDT)
Message-ID: <e70612d3-61fb-4c30-a52b-b4ef21c34768@linaro.org>
Date: Tue, 17 Mar 2026 13:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Jakub Czapiga <czapiga@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
 <20260108121430.1096844-2-miquel.raynal@bootlin.com>
 <230c1e00-25c2-44f7-afa5-a8ccbcf145db@linaro.org>
 <87ms06er60.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87ms06er60.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_043940_131440_9979A506 
X-CRM114-Status: GOOD (  11.62  )
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



On 3/17/26 11:33 AM, Miquel Raynal wrote:
> 
>>> -static int spi_nor_spimem_check_op(struct spi_nor *nor,
>>> -				   struct spi_mem_op *op)
>>> +static int spi_nor_spimem_check_page_op(struct spi_nor *nor,
>>> +					struct spi_mem_op *op)
>>
>> page is a bit misleading as it can indicate it's used just for page
>> programs. We need to focus on operations that need address bytes,
>> reads, pp, page scrub, erase, write/read any register, etc.
> 
> This helper is only used for reads and page programs. The point is
> to not use it when reading/writing registers.
> 

you're right, it comes from hwcaps, where we verify the reads and pp.

> What about spi_nor_spimem_check_io_op() ? or _iorw_op() ?

spi_nor_spimem_check_hwcaps_op?

IO is involved with read/write any reg.
rw may work, but it can be applied to registers too.

or maybe spi_nor_spimem_check_read_pp_op?

I'm sure you'll choose the best, go ahead with what works for you.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
